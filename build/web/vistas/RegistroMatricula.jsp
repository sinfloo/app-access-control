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
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <title>Matricula</title>
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
            <form action="Controlador?menu=Matricula" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" class="bold"><i class="fas fa-edit"></i> FICHA MATRÍCULA</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-2">
                                <div class="form-group">
                                    <label for="documento"><i class="far fa-credit-card"></i> DOCUMENTO</label>
                                    <input type="hidden" value="${User.idUser}" name="txtIdUser"/>
                                    <input type="text" value="${User.nrodoc}" name="txtNroDoc" class="form-control form-control-sm" readonly=""/>
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>  
                            </div>
                            <div class="col col-lg-4">
                                <div class="form-group">
                                    <label for="tipooperacion" class="bold">Usuario</label>                                    
                                    <input type="text" value="${User.nombres} ${User.apellidos}" class="form-control form-control-sm" readonly=""/>
                                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                </div>
                            </div>
                            <div class="col col-sm-2">
                                <div class="form-group">
                                    <label for="tipooperacion" class="bold">PERIODO</label>
                                    <select class="form-control form-control-sm" name="txtPeriodo">
                                        <option>2020</option>
                                        <option>2021</option>
                                        <option>2022</option>
                                        <option>2023</option>
                                        <option>2024</option>
                                        <option>2025</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col col-sm-2">
                                <div class="form-group">
                                    <label for="tipooperacion" class="bold">GRADO</label>
                                    <select class="form-control form-control-sm" name="txtGrado">
                                        <option value="0">SELECCIONAR</option>
                                        <c:forEach var="r" items="${Grados}">
                                            <option value="${r.id}">${r.descripcion}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col col-sm-2">
                                <div class="form-group">
                                    <label for="importe" class="bold">PRECIO MATRICULA</label>
                                    <input type="text" class="form-control form-control-sm" name="txtImporte" requerid="" placeholder="S/. 200.00">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="padding-left: 30px;padding-right: 30px">
                            <button type="button" class="btn btn-danger bold" data-dismiss="modal">Close</button>
                            <button type="submit" name="accion" value="Guardar" class="btn btn-primary bold">REGISTRAR MATRICULA</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--MODAL INICIO DE MATRICULA-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="Controlador?menu=Pago" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" class="bold"><i class="far fa-credit-card"></i> INGRESE SU UID</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding-left: 30px;padding-right: 30px">
                        <div class="form-group">
                            <input type="text" name="txtTipo" class="form-control" required="" placeholder="461785689"/>
                            <small id="emailHelp" class="form-text text-muted">*debe ingresar su DNI o su Carnet de Extranjería</small>
                        </div>                        
                    </div>
                    <div class="modal-footer" style="padding-left: 30px;padding-right: 30px">
                        <button type="button" class="btn btn-danger bold" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
                        <button type="submit" name="accion" value="IniciarMatricula" class="btn btn-primary bold"><i class="fas fa-play"></i> Iniciar Matrícula</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/funciones.js" type="text/javascript"></script>
    <script>

    </script>
    <script>
        $(document).ready(function () {
            $('#myTables').DataTable();
        });
    </script>
</body>
</html>
