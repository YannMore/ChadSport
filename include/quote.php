<?php
require_once(__DIR__ . '/db_config.php'); 
$sqlQuery = "SELECT * FROM annonce ORDER BY RAND() LIMIT 1";//random
$query = $mysqlClient->prepare($sqlQuery);
$query->execute();
$quote = $query->fetch(PDO::FETCH_ASSOC);
?>

<div style="width: 100%; height: 100px; overflow: auto;">
    <?php
    if (isset($_SESSION['id_membre'])) {
        echo $quote['contenu'];
    } else {
        echo "Bienvenue, connectez vous pour pouvoir commenter et poster !";
    }
    ?>
</div>