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
    $Id_Post = htmlspecialchars($_POST['Id_Post'], ENT_QUOTES, 'UTF-8');
    $content = htmlspecialchars($_POST['content'], ENT_QUOTES, 'UTF-8');
    $comment = htmlspecialchars($_POST['comment'], ENT_QUOTES, 'UTF-8');
    if (empty($content)) {
        $error = '<div class="erreur">Le texte de ton Commentaire est vide</div>';
        echo $error;
    } else if (strlen($content) > 200) {
        $error = '<div class="erreur">Le texte est trop long, soit plus concis</div>';
        echo $error;
    }
    else {
        $query = $mysqlClient->prepare("INSERT INTO commentaire (contenu_commentaire, Id_Post, Id_Membre, date_commentaire) VALUES (?, ?, ?, NOW())");
        $query->execute([$content, $Id_Post, $_SESSION['id_membre']]);
        header('Location: index.php');
        exit;
    }
    if (!empty($_POST['suivre'])) {
        $suivre = htmlspecialchars($_POST['suivre'], ENT_QUOTES, 'UTF-8');
        $query = $mysqlClient->prepare("INSERT IGNORE INTO est_abonne (Id_Membre, Id_Membre_1, date_ajout) VALUES (?, ?, NOW())");
        $query->execute([$_SESSION['id_membre'], $suivre]);
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
    <fieldset class="post">
        <legend>
        <?php   
                $pseudonyme = getPseudoById($post['Id_Membre'], $mysqlClient);
                $base_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
                $path = pathinfo($_SERVER['REQUEST_URI'], PATHINFO_DIRNAME);
                $url = $base_url . $path . "/post.php?post=" . $post['Id_Post']; //url fonctionne ok
                ?>
    
                <!--Partie bouton partager-->
                <div class="postes">
                    <div class="pseudo">
                        <p class="pseudonyme"><?php echo $pseudonyme; ?></p>
                    </div>

                
                    <div class="tooltip">
                        <button class="share" onclick="partager('<?php echo $url; ?>', '<?php echo $post['Id_Post']; ?>')">
                            <span class="tooltiptext" id="myTooltip<?php echo $post['Id_Post']; ?>">Cliquez pour copier</span>
                            Partager
                        </button>
                    </div>
                
                <!--Formulaire suivre -->
                    <div class="abonne">
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
                                <button class="abonne_check">Abonné</button>
                            <?php } 
                } // si c'est user lui meme alors affiche rien?>
                </div>
                </div>
                </legend>
                
    
        <div class="img_text">
            <img class="post-picture" src="<?php echo 'images/posts/'.$post['Id_Post'].'.'.$post['image_post'];?>" alt="image du post"/>
            <h2 class="description_poste">Description : </h2><br>
            <p class="post-text"><?php echo $post['contenu']; ?></p>
        </div>
    
    </fieldset>
    <div class ="espace_comment">
    <?php
    // Récupère les commentaires
    $sqlQuery = "SELECT *  FROM commentaire WHERE Id_Post = :id_post
                    ORDER BY date_commentaire DESC LIMIT 3";
    $commentQuery = $mysqlClient->prepare($sqlQuery);
    $commentQuery->bindParam(':id_post', $post['Id_Post']);
    $commentQuery->execute();
    $comments = $commentQuery->fetchAll(PDO::FETCH_ASSOC);
    ?>
    <div class="all_comment">
        <?php

        if (count($comments) === 0) {
            ?> <h2>*Aucun commentaire pour ce poste*</h2><br> <?php
        }
        
        else{
            ?> <h2>Commentaires</h2> <?php
        }

        foreach ($comments as $comment) { ?>
            <div class="comment">
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
                        <p class="pseudo_comment"><?php echo getPseudoById($comment['Id_Membre'], $mysqlClient);?></p>
                
                <p class="commentaire"><?php echo $comment['contenu_commentaire']; ?></p>
            </div>
        <?php } 
        if (count($comments) !== 0) {
        ?>
        <button class="show-more" type="button" onclick="window.location.href='<?php echo $url; ?>'">Voir plus de commentaires</button>
        <br><br>
        <?php } ?>
        <form method="POST" enctype="multipart/form-data">
        <br>
        <div class="add_comment"><label for="content"><h3>Ajouter un commentaire</h3></label></div><br>
        <div class="textarea_comment"><textarea id="content" name="content" minlength="1" maxlength="200" cols = "40" rows="6"></textarea></div>
        <input type="hidden" name="comment" value="True"> 
        <input type="hidden" name="Id_Post" value="<?php echo $post['Id_Post']; ?>">
        <div class="submit_comment"><input type="submit" value="Envoyer"></div>
        </form>
        </div>
        <br>
        <br>
        <hr>
        <br>
        <br></div>
    
<?php } ?>

<script>
function partager(url, postId) {
    navigator.clipboard.writeText(url);
    var tooltip = document.getElementById("myTooltip" + postId);
    tooltip.innerHTML = "Copié";
}

function clique_partager(postId) {
    var tooltip = document.getElementById("myTooltip" + postId);
    tooltip.innerHTML = "Lien copié";
}
</script>