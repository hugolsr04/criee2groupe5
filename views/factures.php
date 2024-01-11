<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Afficher les factures en cours</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="container table-container">
        <h1 class="mt-4 mb-4">Liste des factures en cours</h1>
        <table>
            <thead>
                <tr>
                    <th>Numéro de Facture</th>
                    <th>Montant Total</th>
                    <th>Date d'échéance</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($factures as $facture): ?>
                    <tr>
                        <td><?= $facture['numero_facture']; ?></td>
                        <td><?= $facture['montant_total']; ?></td>
                        <td><?= $facture['date_echeance']; ?></td>
                        <td><?= $facture['statut']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>
