document.addEventListener('DOMContentLoaded', function() {
    var searchInput = document.querySelector('input[name="search"]');
    var placeholders = ['Numéro de facture', 'Montant', 'Date de facture', 'Statut'];
    var currentIndex = 0;

    setInterval(function() {
        searchInput.setAttribute('placeholder', 'Rechercher par ' + placeholders[currentIndex] + '...');
        currentIndex = (currentIndex + 1) % placeholders.length;
    }, 3000); // Change le placeholder toutes les 3 secondes
});