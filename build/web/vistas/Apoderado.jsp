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
        <script src="js/funciones.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                                <a class="dropdown-item" href="Controlador?menu=Matricula&accion=Listar">Registro de Matricula</a>
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
            <div class="form-group d-flex">
                <form action="Controlador?menu=Apoderado" method="POST">
                    <button class="btn btn-primary" type="submit" name="accion" value="Nuevo"><i class="fas fa-user-plus"></i> Nuevo Registro</button>
                </form>
                <h4 class="ml-2 mt-1">Lista de Apoderados</h4>
            </div>           
            <div class="form-group">
                <table id="myTable" class="table table-hover table-responsive">
                    <thead>
                        <tr class="text-center">
                            <th>ID</th>                            
                            <th>DOCUMENTO</th>
                            <th>NOMBRES</th>
                            <th>APELLIDOS</th>
                            <th>TELEFONO</th>
                            <th>CORREO</th>
                            <th>PARENTESCO</th>
                            <th>USUARIOS</th>
                            <th>ACCION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="us" items="${Apoderados}">
                            <tr class="text-center">
                                <td class="text-center">${us.idApo}</td>
                                <!--<td class="text-center">${us.tipodoc.tipo}</td>-->
                                <td class="text-center">${us.nrodoc}</td>
                                <td>${us.nombres}</td>
                                <td>${us.apellidos}</td>
                                <td>${us.telefono}</td>
                                <td>${us.correo}</td>
                                <td>${us.parentesco.parentesco}</td>
                                <td>
                                    <table border="1">                                        
                                        <tbody>
                                            <c:forEach var="h" items="${us.usuarios}">
                                                <tr style="font-size: 10px">
                                                    <td>${h.id}</td>
                                                    <td>${h.nombres} ${h.apellidos}</td>
                                                </tr>
                                            </c:forEach>                                            
                                        </tbody>
                                    </table>
                                </td>
                                <td class="text-center d-flex">                                  
                                    <button class="btn btn-danger btn-sm" onclick="eliminar(${us.idApo}, 'Apoderado', 'Listar',${us.id})"><i class="fas fa-trash-alt"></i></button>
                                    <form class="ml-1" action="Controlador?menu=Apoderado" method="POST">
                                        <input type="hidden" name="txtIdApo" value="${us.idApo}">
                                        <input type="hidden" name="txtIdPer" value="${us.id}">
                                        <button class="btn btn-primary btn-sm" type="submit" name="accion" value="Listar"><i class="fas fa-eye"></i></button>
                                    </form>                                
                                </td>
                            </tr>
                        </c:forEach>                        
                    </tbody>
                </table>

            </div>
        </div>
        <div class="footer-copyright">

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>

        </script>
        <script>
            $(document).ready(function () {
                $('#myTable').DataTable();
            });
        </script>
    </body>
</html>
