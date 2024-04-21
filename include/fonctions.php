<?php function getPseudoById($userId, $mysqlClient) {
    $sqlQuery = "SELECT pseudo FROM Membre WHERE Id_Membre = :userId";
    $query = $mysqlClient->prepare($sqlQuery);
    $query->bindParam(':userId', $userId);
    $query->execute();
    $result = $query->fetch(PDO::FETCH_ASSOC);
    return $result['pseudo'];
}?>


