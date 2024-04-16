<?php if(session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

if (isset($_SESSION['id_membre'])) {
    $query = $mysqlClient->prepare("SELECT banni FROM membre WHERE Id_Membre = ?");
    $query->execute([$_SESSION['id_membre']]);
    $user = $query->fetch(PDO::FETCH_ASSOC);

    if (empty($user)) {
        // Si id_membre pas présent dans base
        $_SESSION = array();
        session_destroy();
        header("Location: index.php");
        exit();
    }

    if ($user['banni'] == 1) {
        // Deconnexion utilisateur et suppression session
        $_SESSION = array();
        session_destroy();

        // Redirection avec message
        header("Location: index.php?message=Vous avez été banni de Chadsport");
        exit();
    }
}
?>