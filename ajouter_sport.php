<?php 
require_once(__DIR__ . '/include/verif_connexion.php'); 
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id_sport'])){
        $query = $mysqlClient->prepare("INSERT IGNORE INTO pratique (Id_Membre, id_sport) VALUES (?, ?)");
        $query->execute([$_SESSION['id_membre'], $_POST['id_sport']]);
        header('Location: profil.php');
        exit;
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
    <title>Profil : </title>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>

<?php


$stmt = $mysqlClient->prepare("SELECT * FROM sport");
$stmt->execute();
$sports = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Documentation" content="">
    <meta name="Keywords" content="sport">
    <link href="style.css" rel="stylesheet">
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <title>Profil : </title>
</head>

<body>
    <?php require_once(__DIR__ . '/include/header.php'); ?>
    <center>
        <br><br>
        <h2>Trouve ton sport dans la barre de recherche et clique dessus pour l'ajouter à ton profil.</h2>
        <br><br>
        <!--Barre de recherche-->
        <div class="input-container">
            <label class="animated-label">Je pratique...</label>
            <input type="text" id="search">
        </div>

        <div id="sports">
            <?php foreach ($sports as $sport): ?>
                <div class="ajout_de_sport">
                <form method="post" action="ajouter_sport.php" class="sport-form">
                    <input type="hidden" name="id_sport" value="<?php echo $sport['id_sport']; ?>">
                    <input type="hidden" name="id_membre" value="<?php echo $_SESSION['id_membre']; ?>"> 
                    <button type="submit" class="sport" data-id="<?php echo $sport['id_sport']; ?>">
                        <?php echo $sport['nom']; ?>
                    </button>
                </form>
                </div>
            <?php endforeach; ?>
        </div>
    </center>
<script>
    //recuperation des élements
    var input = document.getElementById('search');
    var sports = document.querySelectorAll('.sport-form');

    //event listener javascript
    input.addEventListener('keyup', function() {
        var filter = input.value.toUpperCase();

        //fonction recherche
        sports.forEach(function(sport) {
            var sportName = sport.textContent || sport.innerText;
            if (sportName.toUpperCase().indexOf(filter) > -1) {
                sport.style.display = "";
            } else {
                sport.style.display = "none";
            }
        });
    });
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


</body>
