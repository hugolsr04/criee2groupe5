<?php
class Database
{
    // Déclaration des propriétés privées de la classe Database
    private $host = 'localhost'; // L'hôte de la base de données
    private $db_name = 'bdd_criee2'; // Le nom de la base de données
    private $username = 'root'; // Le nom d'utilisateur de la base de données
    private $password = ''; // Le mot de passe de la base de données
    private $conn; // La connexion PDO à la base de données

    // Méthode publique pour établir une connexion à la base de données
    public function getConnection()
    {
        try {
            // Création d'une nouvelle connexion PDO avec les informations fournies
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->db_name}", $this->username, $this->password);
            // Définition du mode d'erreur de la connexion PDO pour générer des exceptions en cas d'erreur
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $exception) {
            // En cas d'erreur lors de la connexion, affichage d'un message d'erreur
            echo "Erreur de connexion : " . $exception->getMessage();
        }

        // Retourne l'objet de connexion PDO
        return $this->conn;
    }
}
?>
