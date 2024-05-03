<?php
require_once(__DIR__ . '/db_config.php'); 
$sqlQuery = "SELECT * FROM annonce ORDER BY RAND() LIMIT 1";//random
$query = $mysqlClient->prepare($sqlQuery);
$query->execute();
$quote = $query->fetch(PDO::FETCH_ASSOC);
?>

<div style="width: 100%; height: 70px; overflow: auto; text-align:center;">
    <?php
    if (isset($_SESSION['id_membre'])) {
        ?><h2 style="font-size: xx-large;
        font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        font-weight: bolder;
        color: #2F3C7E;">Citation du jour</h2><hr><p style="margin:10px 0px 0px 0px;"><?php echo $quote['contenu']; ?></p><?php
    } else {
        echo "Bienvenue, connectez vous pour pouvoir commenter, poster et échanger avec nos millers de membres !";
    }
    ?>
</div>