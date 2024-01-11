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
        $query = "SELECT * FROM factures WHERE statut = 'en_cours'";
        $stmt = $this->conn->query($query);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
