<?php
require_once(__DIR__ . '/include/verif_connexion.php'); 
require_once(__DIR__ . '/include/fonctions.php'); 
require_once(__DIR__ . '/include/db_config.php'); 

$error = '';//stoque message erreur

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pseudo = filter_var($_POST['Pseudo'], FILTER_SANITIZE_STRING);
    $pas = filter_var($_POST['nombre_pas'], FILTER_SANITIZE_NUMBER_INT);
    $poid = filter_var($_POST['poid'], FILTER_SANITIZE_NUMBER_INT);
    $taille = filter_var($_POST['taille'], FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
    
    if (empty($pseudo)) {
        $error = 'Il te faut un pseudo !';
    } elseif (strlen($pseudo) > 30) {
        $error = 'Ton pseudo, il est trop long';
    } else {
        $query = $mysqlClient->prepare("UPDATE membre SET pseudo = ? WHERE Id_Membre = ?");
        $query->execute([$pseudo, $_SESSION['id_membre']]);

        if (!empty($pas) && !empty($poid) && !empty($taille)) {
            if (strlen($poid) > 4 || strlen($taille) > 4 || strlen($pas) > 6) {
                $error = 'Tes données sportives entrées sont excessives';
            } else {
                $query = $mysqlClient->prepare("UPDATE statistique SET nombre_pas = ?, poid = ?, taille = ? WHERE Id_Membre = ?");
                $query->execute([$pas, $poid, $taille, $_SESSION['id_membre']]);
            }
        }
        //ENSUITE POUR IMAGES FACULTATIVES

            if (isset($_FILES['image_pic']) && $_FILES['image_pic']['error'] == 0) {

            if ((!getimagesize($_FILES['image_pic']['tmp_name']))) {
                $error = "La photo de profil envoyée n'est pas une image, vérifie l'extension";
            }
            else {
            $extension = pathinfo($_FILES['image_pic']['name'], PATHINFO_EXTENSION);
            $image = $_SESSION['id_membre'] . '.' . $extension;

            move_uploaded_file($_FILES['image_pic']['tmp_name'], 'images/profiles/' . $image);

            $query = $mysqlClient->prepare("UPDATE membre SET image_profil = ? WHERE Id_membre = ?");
            $query->execute([$extension, $_SESSION['id_membre']]);
            }
        }
        if (isset($_FILES['image_banner']) && $_FILES['image_banner']['error'] == 0) {

            if ((!getimagesize($_FILES['image_banner']['tmp_name']))) {
                $error = "La bannière envoyée n'est pas une image, vérifie l'extension";
            }
            else {
            $extension = pathinfo($_FILES['image_banner']['name'], PATHINFO_EXTENSION);
            $image = $_SESSION['id_membre'] . '_b.' . $extension;

            move_uploaded_file($_FILES['image_banner']['tmp_name'], 'images/profiles/' . $image);

            $query = $mysqlClient->prepare("UPDATE membre SET banniere_profil = ? WHERE Id_membre = ?");
            $query->execute(['b_.'.$extension, $_SESSION['id_membre']]);
            }
        }
        //redirection après succès
        header('Location: profil.php?edit=success');
        exit;        
    }
    if (isset($_POST['Id_Membre_1'])) {
        $Id_Membre_1 = filter_var($_POST['Id_Membre_1'], FILTER_SANITIZE_STRING);
        $query = $mysqlClient->prepare("DELETE FROM est_abonne WHERE Id_Membre = ? AND Id_Membre_1 = ?");
        $query->execute([$_SESSION['id_membre'], $Id_Membre_1]);
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
$sqlQuery = "SELECT m.*, s.* FROM membre m LEFT JOIN statistique s ON m.Id_Membre = s.Id_Membre WHERE m.Id_Membre = :id_membre";
$query = $mysqlClient->prepare($sqlQuery);
$query->bindParam(':id_membre', $_SESSION['id_membre']);
$query->execute();
$informations = $query->fetch(PDO::FETCH_ASSOC);
?>


    <center>
        <form method="POST" enctype="multipart/form-data">
            <fieldset><legend>Mes informations</legend>
            <div class="">
                <label>Pseudo</label>
                <input type="text" class="form-profil" name="Pseudo" size="30" maxlength="30" value="<?php echo $informations['pseudo'] ?>" required="true">
            </div>
            <div class="">
            <label for="image">Photo de profil:</label><br>
            <input type="file" id="image_pic" name="image_pic"><br>
            </div>
            <div class="">
            <label for="image">Bannière du profil:</label><br>
            <input type="file"  name="image_banner"><br>
            </div></fieldset><fieldset><legend>Informations sportives</legend>
            <div class="">
                <label>Mon nombre de pas du jour</label>
                <input type="number" class="form-profil" name="nombre_pas" size="10"  max="10000000" value="<?php echo $informations['nombre_pas'] ?>" required="true">
            </div>
            <div class="">
                <label>Poid</label>
                <input type="number" class="form-profil" name="poid" size="10" min="1" max="500" value="<?php echo $informations['poid'] ?>" required="true">
            </div>
            <div class="">
                <label>Taille (cm)</label>
                <input type="number" class="form-profil" name="taille" size="10" max="500" value="<?php echo $informations['taille'] ?>"required="true">
            </div></fieldset>
            <button type="submit" class="form-submit">Mettre à jour</button>
        </form>
        <br>
        <br>
        <br>


    <div class="amis">
        <h2 class="vos_abonnements"> Vos abonnements</h2>
        <?php 

        $sqlQuery = "SELECT membre.Id_Membre, membre.pseudo, membre.image_profil, est_abonne.Id_Membre_1
                 FROM est_abonne 
                 JOIN membre ON est_abonne.Id_Membre_1 = membre.Id_Membre 
                 WHERE est_abonne.Id_Membre = :id_membre";

        $query = $mysqlClient->prepare($sqlQuery);
        $query->bindParam(':id_membre', $_SESSION['id_membre']);
        $query->execute();
        $abonnements = $query->fetchAll(PDO::FETCH_ASSOC);

        if (empty($abonnements)) {
            echo "<div class='pas_dabo'>Oups! Il semble que vous ne suivez personne. 
                C'est un peu solitaire ici, non ? Allez, trouvez des gens sympas à suivre ! 
                <a href='index.php?trouve_des_gens'>Trouver des comptes</a>
                <img src='images/site/no_subscribed.png' />
                </div>";
        }
        else {
            foreach ($abonnements as $abonnement) {
                echo $abonnement['pseudo'];
                echo '<br>';
                $profilePic = 'images/profiles/'.$abonnement['Id_Membre_1'].'.'.$abonnement["image_profil"];
                $defaultPic = 'images/profiles/defaut.png'; // Image par defaut si pas profil

                  if (!file_exists($profilePic)) {
                 $profilePic = $defaultPic;
                          }?>
                <img class="comment-profile" src="<?php echo $profilePic; ?>" alt="photo de profil d'un commentaire"/>
                <form method="POST">
                    <input type="hidden" name="Id_Membre_1" value="<?php echo $abonnement['Id_Membre_1']; ?>">
                    <input type="submit" value="Ne plus suivre">
                </form>
                <br>
            <?php  }}?>
        




    </div>    
    </center>

    <?php require_once(__DIR__ . '/include/footer.php'); ?>


</html>