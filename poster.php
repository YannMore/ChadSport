<?php
require_once(__DIR__ . '/include/verif_connexion.php'); 
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 

$error = '';//stoque message erreur

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $content = filter_var($_POST['content'], FILTER_SANITIZE_STRING);

    if (empty($content)) {
        $error = 'Le texte de ton Post est vide';
    } elseif (strlen($content) > 400) {
        $error = 'Le texte est trop long, soit plus concis';
    } 
    if (!isset($_FILES['image']) || $_FILES['image']['error'] != 0) {
        $error = 'Il faut ajouter une image pour chaque post';
    } elseif (!getimagesize($_FILES['image']['tmp_name'])) {
        $error = "Le fichier envoyé n'est pas une image, vérifie l'extension";
    }
    else {
        $query = $mysqlClient->prepare("INSERT INTO Post (contenu, Id_Membre, date_post) VALUES (?, ?, NOW())");
        $query->execute([$content, $_SESSION['id_membre']]);

        $postId = $mysqlClient->lastInsertId();

        
            $extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
            $image = $postId . '.' . $extension;

            move_uploaded_file($_FILES['image']['tmp_name'], 'images/posts/' . $image);

            $query = $mysqlClient->prepare("UPDATE Post SET image_post = ? WHERE Id_Post = ?");
            $query->execute([$extension, $postId]);
            //redirection après post avec succès
            header('Location: index.php?post=success');
            exit;
        }
    }

?>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="sport">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Poster</title>
</head>


<body>
<?php require_once(__DIR__ . '/include/header.php'); ?>
<?php if ($error): //On montre enfin les erreurs?>
    <p><?php echo $error; ?></p>
<?php endif; ?>

<form method="POST" enctype="multipart/form-data">
  <label for="content">Content:</label><br>
  <textarea id="content" name="content" maxlength="400"></textarea><br>
  <label for="image">Image:</label><br>
  <input type="file" id="image" name="image"><br><br>
  <input type="submit" value="Submit">
</form>

</body>
</html>
