<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Afficher les factures en cours</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container">
        <h1 class="mt-4 mb-4">Liste des factures en cours</h1>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Numéro de la facture</th>
                    <th>Montant hors taxes</th>
                    <th>Date de facturation</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($factures)): ?>
                    <?php foreach ($factures as $facture): ?>
                        <tr>
                            <td><?= $facture['id']; ?></td>
                            <td><?= $facture['montantHT']; ?></td>
                            <td><?= $facture['dateFacture']; ?></td>
                            <td><?= $facture['statut']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="4">Aucune facture en cours.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>

</html>
