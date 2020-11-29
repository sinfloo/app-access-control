function eliminar(id, menu, accion,idpersona) {
    console.log("Datos:"+id,menu,accion);
    swal({
        title: "Esta Seguro de Eliminar?",
        text: "Una una vez eliminado, No podrá recuperarlo!",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((toDelete) => {
        if (toDelete) {
            execute(id, menu,idpersona);
            swal(" ¡Oh! ¡Registro Borrado! ", {
                icon: "success",
            }).then((toDelete) => {
                if (toDelete) {
                    parent.location.href = "Controlador?menu=" + menu + "&accion=" + accion;
                }
            });
        }
    });
}
function execute(id, menu,idpersona) {
    var url = "Controlador?menu=" + menu + "&accion=Eliminar&id=" + id+"&idper="+idpersona;
    console.log("Datos1:"+id,menu);
    $.ajax({
        type: 'POST',
        url: url,
        async: true,
        success: function (r) {
        }
    });
}

