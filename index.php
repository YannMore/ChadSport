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
    <title>ChadSport</title>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>
    
    <?php require_once(__DIR__ . '/include/est_banni.php');?>

    <main>
        <div class="center">
        
</div>
<?php require_once(__DIR__ . '/afficher_post.php'); ?>
    </main>

    <?php require_once(__DIR__ . '/include/footer.php'); ?>
    <?php require_once(__DIR__ . '/include/garder_defillement.php');?>

</html>