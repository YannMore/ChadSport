<?php
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 


//Partie commentaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once(__DIR__ . '/include/verif_connexion.php'); 
    $content = filter_var($_POST['content'], FILTER_SANITIZE_STRING);
    $Id_Post = filter_var($_POST['Id_Post'], FILTER_SANITIZE_STRING);
    if (empty($content)) {
        //$error = 'Le texte de ton Commentaire est vide';
    } elseif (strlen($content) > 200) {
        //$error = 'Le texte est trop long, soit plus concis';
    } else {
        $query = $mysqlClient->prepare("INSERT INTO commentaire (contenu_commentaire, Id_Post, Id_Membre, date_commentaire) VALUES (?, ?, ?, NOW())");
        $query->execute([$content, $Id_Post, $_SESSION['id_membre']]);
       
        header('Location: index.php');//va poser des problemes de scroll mais obligatoire pour pas envoyer com a chaque f5
        exit;
        }
    }

//FIN COMMENTAIRE


// On tout
$sqlQuery = "SELECT * FROM post
            WHERE date_post IS NOT NULL
            ORDER BY date_post DESC
            LIMIT 10";

$query = $mysqlClient->prepare($sqlQuery);
$query->execute();
$posts = $query->fetchALL(PDO::FETCH_ASSOC); //fin

?>

<?php foreach ($posts as $post) { ?>

    <button class="share" type="button">Partager</button>

    <fieldset>
        <legend><?php echo getPseudoById($post['Id_Membre'], $mysqlClient) ?></legend>
        <img class="post-picture" src="<?php echo 'images/posts/'.$post['Id_Post'].'.'.$post['image_post'];?>" alt="image du post"/>

    </fieldset>

    <p class="post-text">
    <?php echo $post['contenu']; ?>

    <?php
    // Récupère les commentaires
    $sqlQuery = "SELECT *  FROM commentaire WHERE Id_Post = :id_post
                    ORDER BY date_commentaire DESC";
    $commentQuery = $mysqlClient->prepare($sqlQuery);
    $commentQuery->bindParam(':id_post', $post['Id_Post']);
    $commentQuery->execute();
    $comments = $commentQuery->fetchAll(PDO::FETCH_ASSOC);

    foreach ($comments as $comment) { ?>
        <fieldset>
            <legend>
                  <?php
                      $profilePic = 'images/profiles/'.$post['Id_Membre'].'.png';
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
    <button class="show-more" type="button">Voir plus</button> 

<?php } ?>

