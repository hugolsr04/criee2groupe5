<?php
// Inclusion du fichier de configuration de la base de données
require_once '../config/database.php';
// Inclusion du contrôleur de la facturation
require_once '../controllers/FacturationController.php';

// Création d'une instance du contrôleur de la facturation
$facturationController = new FacturationController();

if (isset($_GET['action']) && $_GET['action'] == 'supprimerFacture') {
    $facturationController->supprimerFacture();
} else {
    $facturationController->afficherFactures();
}

if (isset($_GET['msg'])) {
    echo "<p>" . htmlspecialchars($_GET['msg']) . "</p>";
}
?>