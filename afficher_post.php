<?php
require_once(__DIR__ . '/include/fonctions.php');
require_once(__DIR__ . '/include/db_config.php');


$abonnements = []; //initialisation
if (isset($_SESSION['id_membre'])) {
    $sqlQuery = "SELECT Id_Membre_1 FROM est_abonne WHERE Id_Membre = :userId";
        $query = $mysqlClient->prepare($sqlQuery);
        $query->bindParam(':userId', $_SESSION['id_membre']);
        $query->execute();
        $abonnements = $query->fetchall(PDO::FETCH_COLUMN);//au lieu de fetch_assoc car on veut chercher avec des no de colonne pas les noms
     //permet de récupérer la liste d'abo sur toutes les pages
}


//Partie commentaire, l'ordre est assez important

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once(__DIR__ . '/include/verif_connexion.php'); 
    $Id_Post = filter_var($_POST['Id_Post'], FILTER_SANITIZE_STRING);
    $content = filter_var($_POST['content'], FILTER_SANITIZE_STRING);

    if (empty($content)) {
        $error = '<div class="erreur">Le texte de ton Commentaire est vide</div>';
        echo $error;
    } else if (strlen($content) > 200) {
        $error = '<div class="erreur">Le texte est trop long, soit plus concis</div>';
        echo $error;
    } else if (!empty($_POST['suivre'])) {
        $suivre = filter_var($_POST['suivre'], FILTER_SANITIZE_STRING);
        $query = $mysqlClient->prepare("INSERT IGNORE INTO est_abonne (Id_Membre, Id_Membre_1, date_ajout) VALUES (?, ?, NOW())");
        $query->execute([$_SESSION['id_membre'], $suivre]);
        header('Location: index.php');
        exit;
    } else {
        $query = $mysqlClient->prepare("INSERT INTO commentaire (contenu_commentaire, Id_Post, Id_Membre, date_commentaire) VALUES (?, ?, ?, NOW())");
        $query->execute([$content, $Id_Post, $_SESSION['id_membre']]);
        header('Location: index.php');
        exit;
    }
}

// Afficher les posts
$sqlQuery = "SELECT * FROM post
            WHERE date_post IS NOT NULL
            ORDER BY date_post DESC
            LIMIT 10";

$query = $mysqlClient->prepare($sqlQuery);
$query->execute();
$posts = $query->fetchALL(PDO::FETCH_ASSOC);

?>

<?php foreach ($posts as $post) { ?>
    <fieldset>
        <legend>
        <?php   echo getPseudoById($post['Id_Membre'], $mysqlClient);
                $base_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
                $path = pathinfo($_SERVER['REQUEST_URI'], PATHINFO_DIRNAME);
                $url = $base_url . $path . "/post.php?post=" . $post['Id_Post'];
                ?>

                <!--Partie bouton partager-->
                <div class="tooltip">
                    <button onclick="myFunction()" onmouseout="outFunc()">
                    <span class="tooltiptext" id="myTooltip">Cliquez pour copier</span>
                    Partager
                    </button>
                </div>
                <script>
                function myFunction() {
                    var copyText = "<?php echo $url; ?>";
                    navigator.clipboard.writeText(copyText);
                    var tooltip = document.getElementById("myTooltip");
                    tooltip.innerHTML = "Copié"
                }

                function outFunc() {
                    var tooltip = document.getElementById("myTooltip");
                    tooltip.innerHTML = "Lien copié";
                }
                </script>

                <!--Formulaire suivre -->
                <?php 
                // var_dump($abonnements); 
                if ($post['Id_Membre'] != $_SESSION['id_membre']) {
                        if (!in_array($post['Id_Membre'], $abonnements)) {?>
                            <form method="POST">
                                <input type="hidden" name="suivre" value="<?php echo $post['Id_Membre']; ?>">
                                <input type="hidden" name="Id_Post" value="<?php echo $post['Id_Post']; ?>">
                                <input type="submit" value="S'abonner">
                            </form>
                        <?php }
                    else {?>
                        <button>Abonné</button>
                    <?php } //pas } mais endif
                } // si c'est user lui meme alors affiche rien?>
                </legend>


        <img class="post-picture" src="<?php echo 'images/posts/'.$post['Id_Post'].'.'.$post['image_post'];?>" alt="image du post"/>

    </fieldset>

    <p class="post-text">
    <?php echo $post['contenu']; ?>

    <?php
    // Récupère les commentaires
    $sqlQuery = "SELECT *  FROM commentaire WHERE Id_Post = :id_post
                    ORDER BY date_commentaire DESC LIMIT 3";
    $commentQuery = $mysqlClient->prepare($sqlQuery);
    $commentQuery->bindParam(':id_post', $post['Id_Post']);
    $commentQuery->execute();
    $comments = $commentQuery->fetchAll(PDO::FETCH_ASSOC);

    foreach ($comments as $comment) { ?>
        <fieldset>
            <legend>
                  <?php
                  $sqlQuery = "SELECT image_profil FROM membre WHERE Id_Membre = :id_comment"; //serait pas mal de faire de la mise en cache image ou qlq chose mais dans notre echelle pas prblm performance
                  $extensionQuery = $mysqlClient->prepare($sqlQuery);
                  $extensionQuery->bindParam(':id_comment',$comment['Id_Membre']);
                  $extensionQuery->execute();
                  $result = $extensionQuery->fetch(PDO::FETCH_ASSOC);

                     $profilePic = 'images/profiles/'.$comment['Id_Membre'].'.'.$result["image_profil"];
                     $defaultPic = 'images/profiles/defaut.png'; // Image par defaut si pas profil

                       if (!file_exists($profilePic)) {
                      $profilePic = $defaultPic;
                               }?>
                     <img class="comment-profile" src="<?php echo $profilePic; ?>" alt="photo de profil d'un commentaire"/>
                      <?php echo getPseudoById($comment['Id_Membre'], $mysqlClient);?>
            </legend>
            <?php echo $comment['contenu_commentaire']; ?>
        </fieldset>
    <?php } ?>
    
    <form method="POST" enctype="multipart/form-data">
    <label for="content">Ajouter un commentaire:</label><br>
    <textarea id="content" name="content" maxlength="200"></textarea><br>
    <input type="hidden" name="Id_Post" value="<?php echo $post['Id_Post']; ?>">
    <input type="submit" value="Envoyer">
    </form>
    <br>
    <button class="show-more" type="button" onclick="window.location.href='<?php echo $url; ?>'">Voir plus de commentaires</button>
    <br>
    <br>
<?php } ?>

