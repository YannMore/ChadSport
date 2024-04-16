<?php
if(session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

if (!isset($_SESSION['id_membre'])) {
    header("Location: ./login.php"); // REDIRECTION PAGE LOGIN.PHP SI PAS CONNECTE
    exit;
}

// Reste
?>