<!DOCTYPE html>
<html lang="fr">
<script>
  // POUR NE PAS AVOIR DE FLASH BLANC, doit etre avant tout
  //RAJOUTE AUSSI UN HTML
  const darkMode = localStorage.getItem("dark-mode");
  if (darkMode) {
    document.documentElement.className = '';
  } else {
    document.documentElement.className = 'light-theme';
  }
</script>