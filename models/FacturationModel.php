<?php
// Inclure le fichier contenant la définition de la classe Database
require_once '../config/database.php';

// Déclaration de la classe FacturationModel
class FacturationModel
{
    // Propriété privée pour stocker la connexion à la base de données
    private $conn;

    // Constructeur de la classe qui prend en paramètre la connexion PDO à la base de données
    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    // Méthode publique pour rechercher les factures en fonction d'un critère de recherche
    public function rechercherFactures($search)
    {
        try {
            // Requête SQL pour rechercher les factures en fonction de l'ID, du montant, de la date ou du statut
            $query = "SELECT * FROM facture WHERE id LIKE :search OR montantHT LIKE :search OR dateFacture LIKE :search OR statut LIKE :search";
            // Préparation de la requête SQL
            $stmt = $this->conn->prepare($query);

            // Lier la valeur de recherche avec le paramètre de la requête
            $searchParam = "%$search%";
            $stmt->bindParam(':search', $searchParam);

            // Exécution de la requête SQL
            $stmt->execute();

            // Récupération des résultats de la requête sous forme de tableau associatif
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            // En cas d'erreur PDO, afficher un message d'erreur et retourner un tableau vide
            echo "Erreur de requête : " . $exception->getMessage();
            return array();
        }
    }
}
?>
