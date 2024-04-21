<?php
if(session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}
//Passe la page en paramètre pour revenir dessus si l'utilisateur passe par login.
if (!isset($_SESSION['id_membre'])) {
    header("Location: ./login.php?redirection=" . urlencode($_SERVER['REQUEST_URI'])); 
    exit;
}   

?>