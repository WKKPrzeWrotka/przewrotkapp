// web/disable_context_menu.js

// Blokuj menu kontekstowe w całej aplikacji
// Wcześniej, przy przytrzymywaniu przycisków, w niektórych przeglądarkach, włączały sie opcje przeglądarkowe
// tj. "skopiuj link/pobierz obrazek" itp -_-
document.addEventListener("contextmenu", function(e) {
  e.preventDefault();
});
