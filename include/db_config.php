<?php
try {
    $mysqlClient = new PDO(
        'mysql:host=localhost;dbname=chadsport;charset=utf8',
        'root',
        ''
    );
    $mysqlClient->exec("SET NAMES utf8mb4");
} catch (Exception $e)//pour éviter leak passwd
    {
        die('Erreur : ' . $e->getMessage());
}

?>