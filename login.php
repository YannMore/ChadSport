<?php
session_set_cookie_params([
    'secure' => true,
    'httponly' => true,
    'samesite' => 'Strict',
]);?>

<?php 
    session_start();
?>

<?php 
// Genere le cookie csrf
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$postData = $_POST;?>

<?php require_once(__DIR__ . '/include/fonctions.php'); ?>
<?php require_once(__DIR__ . '/include/db_config.php'); ?>


<?php
if (isset($postData['email']) &&  isset($postData['password'])) {
    if (!filter_var($postData['email'], FILTER_VALIDATE_EMAIL)) {
        $errorMessage = '<h1>Il faut un email valide pour soumettre le formulaire.</h1>';
    } else {

        $sqlQuery = "SELECT * FROM membre WHERE email = :email";
        $query = $mysqlClient->prepare($sqlQuery);
        $query->bindParam(':email', $postData['email']);
        $query->execute();
        $user = $query->fetch(PDO::FETCH_ASSOC);

        //true si user existe et true si mdp valide
        //if ($user && password_verify($postData['password'], $user['mot_de_passe'])) {   Ne fonctionne pas car passwords pas hash
            if ($user && $postData['password'] === $user['mot_de_passe']) {
                // variables de session
                $_SESSION['id_membre'] = $user['Id_Membre'];//attention MAJUSCULES m'ont fait perdre 40mn
                $_SESSION['pseudo'] = $user['pseudo'];
                $_SESSION['administrateur'] = $user['administrateur'];

                
                if (isset($_GET['redirection'])) {
                    header("Location: " . urldecode($_GET['redirection']));
                } else {
                    // sinon page par defaut
                    header("Location: index.php");
                }
                exit();
                
        } else {
            //Si mdp ou email invalide
            $error_message = 'Les informations envoyées ne permettent pas de vous identifier.';
        }   
    }
}
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="sport">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Register</title>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>

<!--Action Redirige vers la page précédente ou plutot celle passée en param-->
<h2 class="login_titre">Veuillez renseigner les informations suivantes pour vous connecter à votre compte.</h2>
<form class="form-login" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?><?php echo isset($_GET['redirection']) ? '?redirection=' . $_GET['redirection'] : ''; ?>">
    <!--Rajoute le token csrf-->
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
    <?php if(isset($error_message)) { ?>
        <p><?php echo $error_message; ?></p>
    <?php } ?>

    <div class="login-input">
    <div class="input-container">
        <label for="email" class="animated-label">Email</label>   
        <input type="email" class="form-control" id="email" name="email" required>
        
    </div>

    <div class="input-container">
        <label for="password" class="animated-label">Mot de passe</label>
        <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <div class="login-submit">
    <button type="submit" class="bouton">Connexion</button>
    </div>
    </div>

</form>
<div class="login">
<a href ='register.php'>Vous n'avez pas de compte ? Inscrivez-vous</a>
    </div>
        </main>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <?php require_once(__DIR__ . '/include/footer.php'); ?>

    </div>
</body>

<!-- verif du csrf -->
<?php
if (isset($_POST['csrf_token']) && $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die('CSRF INVALIDE');
}
?>

<script>
document.querySelectorAll('input').forEach(function(input) {
  input.addEventListener("focus", function() {
    this.parentNode.classList.add("focus");
  });

  input.addEventListener("blur", function() {
    if (!this.value.trim()) {
      this.parentNode.classList.remove("focus");
    }
  });
});
</script>
</html>