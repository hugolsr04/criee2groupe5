<?php
// Inclure le fichier contenant la définition de la classe FacturationModel
require_once '../models/FacturationModel.php';

// Déclaration de la classe FacturationController
class FacturationController
{
    // Méthode publique pour afficher les factures
    public function afficherFactures()
    {
        // Instanciation d'un objet Database pour établir la connexion à la base de données
        $database = new Database();
        // Récupération de la connexion PDO à la base de données
        $conn = $database->getConnection();

        // Instanciation d'un objet FacturationModel en lui passant la connexion PDO en paramètre
        $facturationModel = new FacturationModel($conn);

        // Récupération de la valeur de recherche depuis l'URL, si elle est définie
        $search = isset($_GET['search']) ? $_GET['search'] : '';

        // Appel de la méthode rechercherFactures() de l'objet FacturationModel pour récupérer les factures en fonction de la recherche
        $factures = $facturationModel->rechercherFactures($search);

        // Si aucune facture n'est trouvée, initialisation d'un tableau vide
        if (empty($factures)) {
            $factures = array();
        }

        // Inclusion la vues factures.php pour afficher la page
        include '../views/factures.php';
    }

    public function supprimerFacture() {
        $id = $_GET['id'] ?? null;
        if ($id) {
            $database = new Database();
            $conn = $database->getConnection();
            $facturationModel = new FacturationModel($conn);
            if ($facturationModel->supprimerFacture($id)) {
                $msg = "Facture supprimée avec succès.";
            } else {
                $msg = "Erreur lors de la suppression de la facture.";
            }
        } else {
            $msg = "Aucun ID de facture spécifié.";
        }
        header("Location: index.php?msg=" . urlencode($msg));
    }
}
?>
