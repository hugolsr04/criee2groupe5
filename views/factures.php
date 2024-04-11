<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Afficher les factures en cours</title>
    <!-- Inclusion de la feuille de style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container">
        <h1 class="mt-4 mb-4">Liste des factures en cours</h1>
        <form action="" method="GET">
            <div class="search-container">
                <!-- Champ de recherche pour filtrer les factures -->
                <input type="text" name="search" class="search-input"
                    placeholder="Rechercher une facture...">
                <button type="submit" class="search-button">Rechercher</button>
            </div>
        </form>
        <!-- Tableau pour afficher les factures -->
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <!-- En-têtes des colonnes -->
                    <th>Numéro de la facture</th>
                    <th>Montant HT</th>
                    <th>Date Facture</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($factures)): ?>
                    <?php foreach ($factures as $facture): ?>
                        <tr>
                            <!-- Affichage des détails de chaque facture -->
                            <td>
                                <?= $facture['id']; ?>
                            </td>
                            <td>
                                <?= $facture['montantHT']; ?>
                            </td>
                            <td>
                                <?= $facture['dateFacture']; ?>
                            </td>
                            <td>
                                <?= $facture['statut']; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <!-- Affichage d'un message si aucune facture correspondante n'est trouvée -->
                    <tr>
                        <td colspan="4">Aucune facture correspondant à la recherche.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>

</html>
