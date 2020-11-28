<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>   
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container d-flex justify-content-center mt-4">
            <div class="col-sm-5">
                <div class="card-body alert alert-danger">
                    <h5 class="card-title">Ops!</h5>
                    <p class="card-text">Usuario o Contraseña son Incorrectas</p>
                    <a href="ControladorLogin?accion=Salir" class="btn btn-success">Volver a Ingresar</a>
                </div>
            </div>            
        </div>
    </body>
</html>
