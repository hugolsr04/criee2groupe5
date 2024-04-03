<?php
require_once '../config/database.php';

class FacturationModel
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function rechercherFactures($search)
    {
        try {
            $query = "SELECT * FROM facture WHERE id LIKE :search OR montantHT LIKE :search OR dateFacture LIKE :search OR statut LIKE :search";
            $stmt = $this->conn->prepare($query);

            // Lier la valeur de recherche avec le paramètre de la requête
            $searchParam = "%$search%";
            $stmt->bindParam(':search', $searchParam);

            $stmt->execute();

            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            echo "Erreur de requête : " . $exception->getMessage();
            return array();
        }
    }
}
?>
