
<script>//POUR GERER DARKMODE
  const toggle = document.getElementById("darkmode-toggle");
  if (document.documentElement.classList.contains('dark-theme')) {
    toggle.checked = true;
  } else {
    toggle.checked = false;
  }
    window.onload = function() {
        // Get the root element
        const root = document.documentElement;
        // Get the toggle button
        const toggle = document.getElementById("darkmode-toggle");
        const darkMode = localStorage.getItem("dark-mode");
        // Check if the user has already chosen a theme
        if (darkMode) {
            // If yes, apply it to the root element and check the toggle
            root.classList.add("dark-theme");
            toggle.checked = true;
    }
        // Add an event listener to the toggle button
        toggle.addEventListener("click", () => {
            // Toggle the dark-theme class on the root element
            root.classList.toggle("dark-theme");

            // Store or remove the user's preference in localStorage
            if (root.classList.contains("dark-theme")) {
            localStorage.setItem("dark-mode", true);
            } else {
            localStorage.removeItem("dark-mode");
            }
        });
    };
</script>