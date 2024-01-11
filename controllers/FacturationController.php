<?php
require_once '../models/FacturationModel.php';

class FacturationController
{
    public function afficherFactures()
    {
        $database = new Database();
        $conn = $database->getConnection();

        $facturationModel = new FacturationModel($conn);
        $factures = $facturationModel->getFacturesEnCours();

        if (empty($factures)) {
            $factures = array();
        }

        include '../views/header.php';
        include '../views/factures.php';
        include '../views/footer.php';
    }
}
?>
