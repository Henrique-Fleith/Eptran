function abrefecha() {

    const navbar = document.getElementbyID("navbar")

    if(navbar.classList.contains("invisible")){
        
        conteudo.classList.remove("invisible");
     
    }else {
        
        conteudo.classList.add("invisible");
    
    }



}