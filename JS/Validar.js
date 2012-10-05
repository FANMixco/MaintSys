function keyvalid(e, type) {
    // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3



    //* patron = /[ajt69]/; acepta determinados caracteres elegidos porti


    //*patron =/[javierb]/; // 4 evita cararteres elegidos por ti requiere lo de abajo
    //*te = String.fromCharCode(tecla); // 5
    //*return !patron.test(te); // 6



    //* patron = /d/; // Solo acepta números
    //* patron = /w/; // Acepta números y letras

    patron = /D/; //evita numeros
    switch (type) {
        case 0:
            patron = /[A-Za-zñÑs ]/; //solo admite letras y ñ
            break;
        case 1:
            patron = /[0-9]/; // solo admite numeros
            break;
        case 2:
            patron = /[A-Za-z@._-]/; //email
            break;
        case 3:
            patron = /[A-Za-zñÑs0-9 #",.]/; // direcciones
            break;
        case 4:
            patron = /[0-9-+ ]/; // numeros telefonicos
            break;
        case 5:
            patron = /[0-9.]/; // precios
            break;
    }
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}