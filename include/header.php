<?php require_once(__DIR__ . '/db_config.php'); ?>
<header>
  <nav>
    <ul>
    <li><a class="lien_nav" href ="index.php">Accueil</a></li>
      
      <?php if (isset($_SESSION['id_membre'])): ?>
        <li><a class="lien_nav" href ="profil.php">Profil</a></li>
      <?php else: ?>
        <li><a class="lien_nav" href ="login.php">Se connecter</a></li>
      <?php endif; ?>
      <li><a class="lien_nav" href ="poster.php">Poster un chadpost</a></li>
    </ul>
    <?php  require_once(__DIR__ . '/afficher_image_profil.php');?>
  </nav>
  <div class="header-img" style='
    width: 100px;
    height: 100px; /* AJUSTER SI BESOIN*/
    background-image: url("<?php echo $profilePic;?>");
    background-size: cover;
    background-position: center;
    border-radius: 50%;'> 
</div>








  <div class="header-img"><?php require_once(__DIR__ . '/afficher_image_profil.php');?> </div>
  </header>