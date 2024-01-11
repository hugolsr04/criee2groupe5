<?php

require_once '../config/database.php';

class FacturationModel
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getFacturesEnCours()
    {
        try {
            $query = "SELECT * FROM facture WHERE statut = 'en_cours'";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();

            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            echo "Erreur de requête : " . $exception->getMessage();
            return array();
        }
    }
}
?>
