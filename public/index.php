<?php
// Inclusion du fichier de configuration de la base de données
require_once '../config/database.php';
// Inclusion du contrôleur de la facturation
require_once '../controllers/FacturationController.php';

// Création d'une instance du contrôleur de la facturation
$facturationController = new FacturationController();
// Appel de la méthode 'afficherFactures' du contrôleur pour afficher les factures
$facturationController->afficherFactures();
?>