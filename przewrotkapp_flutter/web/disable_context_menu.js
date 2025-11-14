// web/disable_context_menu.js

// Blokuj menu kontekstowe w całej aplikacji
document.addEventListener("contextmenu", function(e) {
  e.preventDefault();
});
