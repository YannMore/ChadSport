<?php
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 

//Recupere l'id du post demandé à etre affiché dans ce cas = commentaire_id_post (celui qui est commenté)
$Id_Post = filter_var($_GET['post'], FILTER_SANITIZE_STRING);


//Partie commentaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once(__DIR__ . '/include/verif_connexion.php'); 
    $Id_Post = htmlspecialchars($_POST['Id_Post'], ENT_QUOTES, 'UTF-8');
    $content = htmlspecialchars($_POST['content'], ENT_QUOTES, 'UTF-8');
    $comment = htmlspecialchars($_POST['comment'], ENT_QUOTES, 'UTF-8');
    if ($comment) {
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
    }
    if (!empty($_POST['suivre'])) {
        $suivre = htmlspecialchars($_POST['suivre'], ENT_QUOTES, 'UTF-8');
        $query = $mysqlClient->prepare("INSERT IGNORE INTO est_abonne (Id_Membre, Id_Membre_1, date_ajout) VALUES (?, ?, NOW())");
        $query->execute([$_SESSION['id_membre'], $suivre]);
        header('Location: index.php');
        exit;
        }
}
//FIN COMMENTAIRE


// On tout
$sqlQuery = "SELECT * FROM post
            WHERE Id_Post = :id_post";

$query = $mysqlClient->prepare($sqlQuery);
$query->bindParam(':id_post', $Id_Post);
$query->execute();
$post = $query->fetch(PDO::FETCH_ASSOC); //fetch donne qu'un result

$pseudomembre = getPseudoById($post['Id_Membre'], $mysqlClient); ?>


<?php if(session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

    ?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="sport">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Post de <?php echo $pseudomembre;?></title>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>
    <?php require_once(__DIR__ . '/include/est_banni.php');?>




</html>
<!--pas de foreach car un seul post-->
    <fieldset>
        <legend><?php echo $pseudomembre;?></legend>
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
                      <?php echo getPseudoById($comment['Id_Membre'], $mysqlClient);?>

            <?php echo $comment['contenu_commentaire']; ?>
        </div>
    <?php } ?>
    
    <form method="POST" enctype="multipart/form-data">
    <label for="content">Ajouter un commentaire:</label><br>
    <textarea id="content" name="content" maxlength="200"></textarea><br>
    <input type="hidden" name="comment" value="True"> 
    <input type="hidden" name="Id_Post" value="<?php echo $post['Id_Post']; ?>">
    <input type="submit" value="Envoyer">
    </form>
 


    <?php require_once(__DIR__ . '/include/footer.php'); ?>