<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>   
        <title>Principal</title>
    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">CONTROL ACCESOS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <!--<li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>-->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registros
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Controlador?menu=Usuario&accion=Listar">Registro de Usuarios</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Apoderado&accion=Listar">Registro de Apoderados</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Personal&accion=Listar">Registro de Personal</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Matricula&accion=Nuevo">Registro de Matricula</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Configuración
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <!--<a class="dropdown-item" href="#">Configuración de Perfiles</a>
                                <a class="dropdown-item" href="#">Configuracion de Accesos</a>-->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Ayuda.jsp">Ayuda</a>
                            </div>
                        </li>
                    </ul>
                    <!--<form class="form-inline my-2 my-lg-0">
                         <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                     </form>-->
                    <ul class="navbar-nav justify-content-end">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${Usuario.nombres} ${Usuario.apellidos}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right text-center" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#"><img src="img/user.png" height="50" width="50"></a>
                                <a class="dropdown-item" href="#">${Usuario.usuario}</a>
                                <a class="dropdown-item" href="#">${Usuario.correo}</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="ControladorLogin?accion=Salir">Salir</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="img/slider/acceso3.jpg" alt="First slide" height="500">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="img/slider/acceso2.jpg" alt="Second slide" height="500">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="img/slider/acceso1.jpg" alt="Third slide" height="500">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="footer-copyright">

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script>
            $('.carousel').carousel();
        </script>
    </body>
</html>
