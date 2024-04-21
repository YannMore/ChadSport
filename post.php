<?php
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 

//Recupere l'id du post demandé à etre affiché dans ce cas = commentaire_id_post (celui qui est commenté)
$Id_Post = filter_var($_GET['post'], FILTER_SANITIZE_STRING);


//Partie commentaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once(__DIR__ . '/include/verif_connexion.php'); 
    $content = filter_var($_POST['content'], FILTER_SANITIZE_STRING);
    $Commentaire_Id_Post = filter_var($_POST['Commentaire_Id_Post'], FILTER_SANITIZE_STRING);
    if (empty($content)) {
        //$error = 'Le texte de ton Commentaire est vide';
    } elseif (strlen($content) > 200) {
        //$error = 'Le texte est trop long, soit plus concis';
    } else {
        $query = $mysqlClient->prepare("INSERT INTO commentaire (contenu_commentaire, Id_Post, Id_Membre, date_commentaire) VALUES (?, ?, ?, NOW())");
        $query->execute([$content, $Commentaire_Id_Post, $_SESSION['id_membre']]);
       
        header('Location: index.php');//va poser des problemes de scroll mais obligatoire pour pas envoyer com a chaque f5
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
    <input type="hidden" name="Commentaire_Id_Post" value="<?php echo $post['Id_Post']; ?>">
    <input type="submit" value="Envoyer">
    </form>
    <br>
 


    <?php require_once(__DIR__ . '/include/footer.php'); ?>