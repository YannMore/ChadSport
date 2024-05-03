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
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="sport">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Poster</title>
    <script>
        function validateForm() {
            var imageInput = document.getElementById("image");
            var contenuInput = document.getElementById("content");
            if (imageInput.files.length === 0 or contenuInput.files.length === 0) {
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>
    <?php if ($error): ?>
        <p><?php echo $error; ?></p>
    <?php endif; ?>

    <h2 class="poster_titre">Partagez vos expériences, vos exercices sportifs, vos objectifs et votre évolution avec des milliers d'autres personnes.</h2><br>
    <div class="div-post">
    <form method="POST" enctype="multipart/form-data" onsubmit="return validateForm();">
        <label for="content" class="label-post">Contenu de votre chadpost</label><br>
        <textarea id="content" name="content" maxlength="400" required rows="10" cols="30" ></textarea><br>
        <label for="image" class="label-post">Image</label><br>
        <div class="image_post">
        <input type="file" id="image" name="image" required><br><br><br><br>
        </div>
        <div class="submit-post">
        <input  type="submit" value="Poster">
        </div>
    </form>
    </div>

</body>

</html>
<br><br><br><br><br><br><br>
<?php require_once(__DIR__ . '/include/footer.php'); ?>
