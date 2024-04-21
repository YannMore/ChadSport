<script>
    //recupere la position du stockage
    
    let storedScrollTop = sessionStorage.getItem("anchor-scroll");

    //si oui on set
    if (storedScrollTop !== null) {
        window.scrollTo(0, parseInt(storedScrollTop, 10));
    }

    //event listener : si page unload : sauvegarder position
    window.addEventListener("beforeunload", () => {
        //stocke
        sessionStorage.setItem("anchor-scroll", window.pageYOffset);
    });
</script>