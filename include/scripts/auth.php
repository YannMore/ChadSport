<?php
if(session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

if (!isset($_SESSION['loginUsername'])) {
    header("Location: ./login.php"); // Retour a la page login
    exit;
}

// Reste