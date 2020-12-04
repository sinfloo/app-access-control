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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Usuario</title>
    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #151837">
                <a class="navbar-brand" href="#"><i class="fas fa-tv"></i> I.E.P. SANTA INÉS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active bold" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-edit"></i> Registros
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Controlador?menu=Usuario&accion=Listar"><i class="fas fa-user-check"></i> Modulo de Alumnos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Apoderado&accion=Listar"><i class="fas fa-users-cog"></i> Registro de Apoderados</a>
                                <!--<div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Personal&accion=Listar">Registro de Personal</a>-->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Matricula&accion=Listar"><i class="fas fa-address-card"></i> Registro de Matricula</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active bold" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cog"></i> Configuración
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#"><i class="fas fa-users-cog"></i> Configuracion de Usuarios</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a>
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
                                <i class="fas fa-user-lock"></i> ${Usuario.nombres} ${Usuario.apellidos}
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
        <main>
            <ul class="menu-social">
                <li><a href="http://www.youtube.com/"target="_blank"><img class="img" src="img/youtube.png" alt="">Youtube</a></li>
                <li><a href="http://www.facebook.com"target="_blank"><img class="img" src="img/facebook.png" alt="">Facebook</a></li>
                <li><a href="https://google.com/"target="_blank"><img class="img" src="img/google.png" alt="">Google</a></li>
                <li><a href="https://twitter.com/"target="_blank"><img class="img" src="img/twitter.png" alt="">Twitter</a></li>
            </ul>                   
            <div class="mt-4 contenido">
                <div class="form-group d-flex">                    
                    <h4 class="ml-2 mt-1"><i class="fas fa-address-card"></i> USUARIOS DEL SISTEMA</h4>
                    <form class="ml-4" action="Controlador?menu=Configuracion" method="POST">
                        <button class="btn btn-primary" type="submit" name="accion" value="Nuevo"><i class="fas fa-user-plus"></i> Nuevo Usuario</button>
                    </form> 
                </div>            
                <div class="form-group">
                    <table id="myTable" class="display responsive-table" style="width:100%">
                        <thead>
                            <tr class="text-center">
                                <th>ID</th>
                                <th>DOCUMENTO</th>
                                <th>NOMBRES</th>
                                <th>APELLIDOS</th>
                                <th>TELEFONO</th>
                                <th>CORREO</th>
                                <th>USUARIO</th>
                                <th>PASSWORD</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="us" items="${Usuarios}">
                                <tr class="text-center">
                                    <td class="text-center">${us.idUser}</td>
                                    <td class="text-center">${us.nrodoc}</td>
                                    <td>${us.nombres}</td>
                                    <td>${us.apellidos}</td>
                                    <td>${us.telefono}</td>
                                    <td>${us.correo}</td>
                                    <td>${us.usuario}</td>
                                    <td>${us.password}</td>
                                    <td class="d-flex">                                  
                                        <button class="btn btn-danger btn-sm" onclick="eliminar(${us.idUser}, 'Configuracion', 'Listar',${us.id})"><i class="fas fa-trash-alt"></i></button>
                                        <form class="ml-1" action="Controlador?menu=Configuracion" method="POST">
                                            <input type="hidden" name="txtIdUser" value="${us.idUser}">
                                            <input type="hidden" name="txtIdPer" value="${us.id}">
                                            <button class="btn btn-warning btn-sm" type="submit" name="accion" value="Editar"><i class="fas fa-edit"></i></button>
                                        </form>                               
                                    </td>
                                </tr>
                            </c:forEach>                        
                        </tbody>
                    </table>

                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="js/datatable.js" type="text/javascript"></script>
        <script src="js/script.js" type="text/javascript"></script>
    </body>
</html>
