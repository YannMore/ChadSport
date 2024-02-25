

<?php
session_set_cookie_params([
    'secure' => true,
    'httponly' => true,
    'samesite' => 'Strict',
]);

session_start();

// Genere le cookie
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$postData = $_POST;

$users = [
    [
        "email" => "root@mail.com",
        "password" => password_hash("password", PASSWORD_DEFAULT) // A Changer avec db
    ]
];?>

<?php require_once(__DIR__.'/inclus/script_darkmode1.php')?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Connexion</title>
</head>

<body>
        <?php //require_once(__DIR__ . '/inclus/header.php'); ?>

        <?php //require_once(__DIR__.'/inclus/script_darkmode2.php')?>



        <div class="page-content-wave">
        <main>

    


</html>

<?php
if (isset($postData['email']) &&  isset($postData['password'])) {
    if (!filter_var($postData['email'], FILTER_VALIDATE_EMAIL)) {
        $errorMessage = '<h1>Il faut un email valide pour soumettre le formulaire.</h1>';
    } else {
        foreach ($users as $user) {
            if (
                $user['email'] === $postData['email'] &&
                password_verify($postData['password'], $user['password']) // Verify the password
            ) {
                $_SESSION['loginUsername'] = $user['email'];
                header("Location: ./inclus/showData.php"); // Redirect to logged.php
                exit;
            }
        }

        if (!isset($_SESSION['loginUsername'])) {
            $errorMessage = sprintf(
                'Les informations envoyées ne permettent pas de vous identifier : (%s/%s)',
                $postData['email'],
                strip_tags($postData['password'])
            );
        }
    }
}
?>

<!-- Add CSRF token to your form -->
<form action="login.php" method="POST">
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
    <?php if (isset($errorMessage)) : ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $errorMessage; ?>
            </div>
        <?php endif; ?>

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

        <?php require_once(__DIR__ . '/inclus/footer.php'); ?>

    </div>
</body>

<!-- Check CSRF token when form is submitted -->
<?php
if (isset($_POST['csrf_token']) && $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die('Invalid CSRF token');
}
?>