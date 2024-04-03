<?php
require_once '../models/FacturationModel.php';

class FacturationController
{
    public function afficherFactures()
    {
        $database = new Database();
        $conn = $database->getConnection();

        $facturationModel = new FacturationModel($conn);

        // Récupérer la valeur de recherche depuis l'URL
        $search = isset($_GET['search']) ? $_GET['search'] : '';

        // Appeler la méthode pour récupérer les factures en fonction de la recherche
        $factures = $facturationModel->rechercherFactures($search);

        if (empty($factures)) {
            $factures = array();
        }

        include '../views/header.php';
        include '../views/factures.php';
        include '../views/footer.php';
    }
}
?>
