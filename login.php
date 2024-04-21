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


<!--Action Redirige vers la page précédente ou plutot celle passée en param-->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?><?php echo isset($_GET['redirection']) ? '?redirection=' . $_GET['redirection'] : ''; ?>">
    <!--Rajoute le token csrf-->
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
    <?php if(isset($error_message)) { ?>
        <p><?php echo $error_message; ?></p>
    <?php } ?>

    <div class="mb-3">
        <label for="email" class="form-labl">Email</label>   
        <input type="email" class="form-control" id="email" name="email">
        
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" class="form-control" id="password" name="password">
    </div>

    <button type="submit" class="bouton">Connexion</button>

</form>
<div class="register">
<a href ='register.php'>Vous n'avez pas de compte ? Inscrivez-vous</a>
    </div>
        </main>

        <?php require_once(__DIR__ . '/include/footer.php'); ?>

    </div>
</body>

<!-- verif du csrf -->
<?php
if (isset($_POST['csrf_token']) && $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die('CSRF INVALIDE');
}
?>


</html>