<?php require_once(__DIR__ . '/db_config.php'); ?>
<header>
  <nav>
    <ul>
      <li><a href ="poster.php">Poster un chadpost</a></li>
      <li>Paramètres</li>
      <?php if (isset($_SESSION['id_membre'])): ?>
        <li><a href ="profil.php">Profil</a></li>
      <?php else: ?>
        <li><a href ="login.php">Se connecter</a></li>
      <?php endif; ?>
      <li><a href ="index.php">Accueil</a></li>
    </ul>
  </nav>
  <div class="header-img"><?php require_once(__DIR__ . '/afficher_image_profil.php');?> </div>
</header>