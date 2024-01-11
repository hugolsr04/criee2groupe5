<?php
require_once '../config/database.php';
require_once '../controllers/FacturationController.php';

$facturationController = new FacturationController();
$facturationController->afficherFactures();
?>
