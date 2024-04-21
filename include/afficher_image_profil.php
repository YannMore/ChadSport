<?php
    $sqlQuery = "SELECT image_profil FROM membre WHERE Id_Membre = :id_post";
    $extensionQuery = $mysqlClient->prepare($sqlQuery);
    $extensionQuery->bindParam(':id_post', $_SESSION['id_membre']);
    $extensionQuery->execute();
    $result = $extensionQuery->fetchAll(PDO::FETCH_ASSOC);
    $defaultPic = 'images/profiles/defaut.png'; // Image par defaut si pas profil
    $profilePic = $defaultPic;
    if (isset($_SESSION['id_membre']) && isset($result[0]['image_profil'])) {
        $extension = $result[0]['image_profil'];
        $profilePic = "images/profiles/{$_SESSION['id_membre']}.{$extension}";
        if (!file_exists($profilePic)) {
            $profilePic = $defaultPic;
        }
    }

/*<a href='profil.php'> <img class="comment-profile" src="<?php echo $profilePic; ?>" alt="photo de profil d'un membre"/></a>*/
?>