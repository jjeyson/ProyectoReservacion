function personasNiños(valor) {
    
    var total = 0;
    var personas = 0;
    valor = parseInt(valor); // Convertir el valor a un entero (número).
    adultos = document.getElementById('adultosReservacion').value;
    precio = document.getElementById('precioPaquete').value;
    console.log(valor)
    console.log(niños)
    console.log(precio)
    // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
    adultos = (adultos == null || adultos == undefined || adultos == "") ? 0 : adultos;
	valor = (valor == null || valor == undefined || valor == "") ? 0 : valor;
    /* Esta es la suma. */
    personas = (parseInt(valor) + parseInt(adultos));
    total = (parseInt(precio) * parseInt(personas));
    // Colocar el resultado de la suma en el control "span".
    document.getElementById('cuposReservacion').value = personas;
    document.getElementById('precioReservacion').value = total;
}
function personasAdultos(valor) {
    
    var total = 0;
    var personas = 0;
    valor = parseInt(valor); // Convertir el valor a un entero (número).
    niños = document.getElementById('niñosReservacion').value;
    precio = document.getElementById('precioPaquete').value;
    console.log(valor)
    console.log(niños)
    console.log(precio)
    // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
    niños = (niños == null || niños == undefined || niños == "") ? 0 : niños;
	valor = (valor == null || valor == undefined || valor == "") ? 0 : valor;
    /* Esta es la suma. */
    personas = (parseInt(valor) + parseInt(niños));
    total = (parseInt(precio) * parseInt(personas));
    // Colocar el resultado de la suma en el control "span".
    document.getElementById('cuposReservacion').value = personas;
    document.getElementById('precioReservacion').value = total;
}

function calificar(){
    $("#btnCalificar").submit(function (e) {
        console.log('paso');
        e.preventDefault();
    })
};

// function validaForm(){
//     // Campos de texto
//     if($("#adultosReservacion").val() == "0"){
//         alert("El campo Adultos no puede estar vacío.");
//         $("#adultosReservacion").focus();       // Esta función coloca el foco de escritura del usuario en el campo Nombre directamente.
//         return false;
//     }
//     if($("#niñosReservacion").val() == "0"){
//         alert("El campo Niños no puede estar vacío.");
//         $("#niñosReservacion").focus();       // Esta función coloca el foco de escritura del usuario en el campo Nombre directamente.
//         return false;
//     }

//     return true; // Si todo está correcto
// }

// $(document).ready( function() { // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
//     $(document).ready( function() {   // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
//         $("#botonenviar").click( function() {     // Con esto establecemos la acción por defecto de nuestro botón de enviar.
//             if(validaForm()){                               // Primero validará el formulario.
//                 $.post("/index",$("#contact-form").serialize(),function(res){
//                     $("#formulario").fadeOut("slow");   // Hacemos desaparecer el div "formulario" con un efecto fadeOut lento.
//                     if(res == 1){
//                         console.log('Bien');
//                         $("#exito").delay(500).fadeIn("slow");      // Si hemos tenido éxito, hacemos aparecer el div "exito" con un efecto fadeIn lento tras un delay de 0,5 segundos.
//                     } else {
//                         $("#fracaso").delay(500).fadeIn("slow");    // Si no, lo mismo, pero haremos aparecer el div "fracaso"
//                         console.log('Mal');
//                     }
//                 });
//             }
//         });    
//     });
// });

$(document).ready( function () {
    $("#btnCalificar").submit(function (e) {
        e.preventDefault();
    })
})
