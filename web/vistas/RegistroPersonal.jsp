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
        <link href="css/registro.css" rel="stylesheet" type="text/css"/>
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
            <div class="col col-sm-6">
                <div class="card">
                    <div class="card-header" style="font-weight:bold"><i class="fa fa-user"></i> ${Title}</div>
                    <div class="card-body">
                        <form action="Controlador?menu=Personal" method="POST">
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">TIPO DOC.</label>
                                <div class="col-sm-9">
                                    <select class="form-control form-control-sm" name="txtTipo">
                                        <option value="0">SELECCIONAR</option>
                                        <c:forEach var="t" items="${TiposDoc}">  
                                            <c:if test="${Personal.tipodoc.id==t.id}">
                                                <option selected="" value="${t.id}">${t.tipo}</option>
                                            </c:if>
                                            <c:if test="${Personal.tipodoc.id!=t.id}">
                                                <option value="${t.id}">${t.tipo}</option>
                                            </c:if>                                            
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">NRO DOC.</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${Personal.nrodoc}" name="txtNroDoc" maxlength="8" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">NOMBRES</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${Personal.nombres}" name="txtNombres" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">APELLIDOS</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${Personal.apellidos}" name="txtApellidos" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">TELFONO</label>
                                <div class="col-sm-9">
                                    <input type="text" value="${Personal.telefono}" name="txtTelefono" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">CORREO</label>
                                <div class="col-sm-9">
                                    <input type="email" value="${Personal.correo}" name="txtCorreo" class="form-control form-control-sm">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">AREA/TRABAJO</label>
                                <div class="col-sm-9">
                                    <select class="form-control form-control-sm" name="txtArea">
                                        <option value="0">SELECCIONAR</option>
                                        <c:forEach var="r" items="${Areas}">
                                            <c:if test="${Personal.area.id==r.id}">
                                                <option selected="" value="${r.id}">${r.descripcion}</option>
                                            </c:if>
                                            <c:if test="${Personal.area.id!=r.id}">
                                                <option value="${r.id}">${r.descripcion}</option>
                                            </c:if> 
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <input type="hidden" name="txtIdp" value="${Personal.idp}">
                            <input type="hidden" name="txtIdPer" value="${Personal.id}">
                            <div class="form-group row">
                                <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-success btn-lg" type="submit" name="accion" value="Guardar">Guardar Registro</button>
                                    <a class="btn btn-link" href="Controlador?menu=Personal&accion=Listar">Volver</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
        <script>
            $('.carousel').carousel();
        </script>
    </body>
</html>
