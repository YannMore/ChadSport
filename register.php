<?php
session_set_cookie_params([
    'secure' => true,
    'httponly' => true,
    'samesite' => 'Strict',
]);
?>

<?php 
session_start();
?>

<?php 
// Generate the CSRF token
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$postData = $_POST;
?>

<?php require_once(__DIR__ . '/include/fonctions.php'); ?>
<?php require_once(__DIR__ . '/include/db_config.php'); ?>

<?php
if (isset($postData['email']) && isset($postData['password']) && isset($postData['pseudo'])) {
    $email = trim($postData['email']);
    $password = trim($postData['password']);
    $pseudo = trim($postData['pseudo']);

    if (empty($email) || empty($password) || empty($pseudo)) {
        $errorMessage = '<h1>Tous les champs sont obligatoires.</h1>';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errorMessage = '<h1>Il faut un email valide pour soumettre le formulaire.</h1>';
    } else {
        //Verification que utilisateur enregistré
        $sqlQuery = "SELECT * FROM membre WHERE email = :email";
        $query = $mysqlClient->prepare($sqlQuery);
        $query->bindParam(':email', $email);
        $query->execute();
        $user = $query->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $errorMessage = 'L\'email est déjà enregistré.';
        } else {
            //Insertion nv utilisateur si tout ok
            $sqlQuery = "INSERT INTO membre (email, mot_de_passe, pseudo, administrateur) VALUES (:email, :password, :pseudo, NULL)";
            $query = $mysqlClient->prepare($sqlQuery);
            $query->bindParam(':email', $email);
            $query->bindParam(':password', $password);
            $query->bindParam(':pseudo', $pseudo);
            $query->execute();

    //Récupére l'id du dernier membre inséré, normalement c'est le bon car c'est celui de cette connexion spécifique de ce script
    $lastInsertId = $mysqlClient->lastInsertId();

    //Rajout d'une entrée dans la table statistique pour le membre
    $sqlQuery = "INSERT INTO statistique (Id_Membre) VALUES (:id_membre)";
    $query = $mysqlClient->prepare($sqlQuery);
    $query->bindParam(':id_membre', $lastInsertId);
    $query->execute();
            // Redirection
            header("Location: login.php");
            exit();
        }
    }
}
?>

<!-- token CSRF -->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
    <?php if(isset($errorMessage)) { ?>
        <p><?php echo $errorMessage; ?></p>
    <?php } ?>

    <!--Formulaire-->
    <div class="mb-3">
        <label for="email" class="form-labl">Email</label>   
        <input type="email" class="form-control" id="email" name="email" required>
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <div class="mb-3">
        <label for="pseudo" class="form-label">Pseudo</label>
        <input type="text" class="form-control" id="pseudo" name="pseudo" required>
    </div>


    <button type="submit" class="bouton">Inscription</button>
</form>

</main>

<?php require_once(__DIR__ . '/include/footer.php'); ?>

</div>
</body>

<!-- Verify the CSRF token -->
<?php
if (isset($_POST['csrf_token']) && $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die('CSRF INVALIDE');
}
?>

</html>