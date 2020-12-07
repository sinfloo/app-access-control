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
        <title>Registro</title>
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
                                <a class="dropdown-item" href="Controlador?menu=Configuracion&accion=Listar"><i class="fas fa-users-cog"></i> Configuracion de Usuarios</a>
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
                <li><a href="https://www.facebook.com/santa.ines.5682"target="_blank"><img class="img" src="img/facebook.png" alt="">Facebook</a></li>
                <li><a href="https://google.com/"target="_blank"><img class="img" src="img/google.png" alt="">Google</a></li>
                <li><a href="https://twitter.com/"target="_blank"><img class="img" src="img/twitter.png" alt="">Twitter</a></li>
            </ul> 
            <div class="container">
                <div class="col col-sm-6">
                    <div class="card">
                        <div class="card-header" style="font-weight:bold"><i class="fa fa-user"></i> ${Title}</div>
                        <div class="card-body">
                            <form action="Controlador?menu=Apoderado" method="POST">
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">USUARIO.</label>
                                    <div class="col-sm-9">
                                        <select  id="mySelector" class="form-control form-control-sm" name="txtIdUser">
                                            <c:forEach var="u" items="${Users}">
                                                <c:if test="${u.idUser==Apoderado.usuarios.get(0).idUser}">
                                                    <option selected="" value="${u.idUser}">${u.nombres} ${u.apellidos}</option>
                                                </c:if>
                                                <c:if test="${u.idUser!=Apoderado.usuarios.get(0).idUser}">
                                                    <option value="${u.idUser}">${u.nombres} ${u.apellidos}</option> 
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <small id="emailHelp" class="form-text text-muted">*Seleccionar el Alumno a quien corresponde el apoderado</small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">TIPO DOC.</label>
                                    <div class="col-sm-9">
                                        <select class="form-control form-control-sm" name="txtTipo">
                                            <c:forEach var="t" items="${TiposDoc}">  
                                                <c:if test="${Apoderado.tipodoc.id==t.id}">
                                                    <option selected="" value="${t.id}">${t.tipo}</option>
                                                </c:if>
                                                <c:if test="${Apoderado.tipodoc.id!=t.id}">
                                                    <option value="${t.id}">${t.tipo}</option>
                                                </c:if>                                            
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">NRO DOC.</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${Apoderado.nrodoc}" name="txtNroDoc" maxlength="8" class="form-control form-control-sm" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">NOMBRES</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${Apoderado.nombres}" name="txtNombres" class="form-control form-control-sm" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">APELLIDOS</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${Apoderado.apellidos}" name="txtApellidos" class="form-control form-control-sm" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">TELEFONO</label>
                                    <div class="col-sm-9">
                                        <input type="text" maxlength="9" value="${Apoderado.telefono}" name="txtTelefono" class="form-control form-control-sm" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">CORREO</label>
                                    <div class="col-sm-9">
                                        <input type="email" value="${Apoderado.correo}" name="txtCorreo" class="form-control form-control-sm" required="">
                                    </div>
                                </div>                            
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">PARENTESCO</label>
                                    <div class="col-sm-9">
                                        <select class="form-control form-control-sm" name="txtParentesco" required="">
                                            <c:forEach var="p" items="${Parentescos}">
                                                <c:if test="${Apoderado.parentesco.id==p.id}">
                                                    <option selected="" value="${p.id}">${p.parentesco}</option>
                                                </c:if>
                                                <c:if test="${Apoderado.parentesco.id!=p.id}">
                                                    <option value="${p.id}">${p.parentesco}</option>
                                                </c:if> 
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" name="txtIdApo" value="${Apoderado.idApo}">
                                <input type="hidden" name="txtIdPer" value="${Apoderado.id}">
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm"></label>
                                    <div class="col-sm-9">
                                        <button class="btn btn-success" type="submit" name="accion" value="Guardar"><i class="fas fa-save"></i> Guardar Registro</button>
                                        <a class="btn btn-link" href="Controlador?menu=Apoderado&accion=Listar">Volver</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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
        <script>
            jQuery(document).ready(function ($) {
                $(document).ready(function () {
                    $('#mySelector').select2();
                });
            });
        </script>
    </body>
</html>
