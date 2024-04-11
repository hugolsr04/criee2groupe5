document.addEventListener('DOMContentLoaded', function() {
    // Sélection de l'élément input avec le nom 'search'
    var searchInput = document.querySelector('input[name="search"]');
    // Tableau de placeholders pour l'input de recherche
    var placeholders = ['Numéro de facture', 'Montant', 'Date de facture', 'Statut'];
    // Index courant pour choisir le placeholder
    var currentIndex = 0;

    // Changement du placeholder toutes les 3 secondes
    setInterval(function() {
        // Attribution du placeholder avec le texte correspondant à l'index courant
        searchInput.setAttribute('placeholder', 'Rechercher par ' + placeholders[currentIndex] + '...');
        // Passage à l'index suivant (modulo pour boucler sur le tableau)
        currentIndex = (currentIndex + 1) % placeholders.length;
    }, 3000); // Intervalle de 3000 millisecondes (3 secondes)
});
