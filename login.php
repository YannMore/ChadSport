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
// Genere le cookie
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
                // Variables de session
                $_SESSION['id_membre'] = $user['Id_Membre'];//attention MAJUSCULES m'ont fait perdre 40mn
                $_SESSION['pseudo'] = $user['pseudo'];
                $_SESSION['administrateur'] = $user['administrateur'];

            //Redirection page accueil
            header("Location: index.php");
            exit();
        } else {
            //Si mdp ou email invalide
            $error_message = 'Les informations envoyées ne permettent pas de vous identifier.';
        }
    }
}
?>


<!--Rajoute le token csrf-->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
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