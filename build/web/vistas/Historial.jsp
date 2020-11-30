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
                                <a class="dropdown-item" href="Controlador?menu=Matricula&accion=Listar">Registro de Matricula</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controlador?menu=Personal&accion=Listar">Registro de Personal</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Reportes
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Reporte de Concepto</a>
                                <a class="dropdown-item" href="#">Reporte de Pago</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Reporte de Deuda</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Configuración
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Configuración de Roles</a>
                                <a class="dropdown-item" href="#">Configuracion de Accesos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Ayuda</a>
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
                                <a class="dropdown-item" href="#">Usuario</a>
                                <a class="dropdown-item" href="#">usuario@gmail.com</a>
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
                <!--<form action="Controlador?menu=Personal" method="POST">
                    <button class="btn btn-primary" type="submit" name="accion" value="Nuevo"><i class="fas fa-user-plus"></i> Nuevo Registro</button>
                </form> -->
                <h4 class="ml-2 mt-1"><i class="fas fa-hand-holding-usd"></i> HISTORIAL DE PAGOS</h4>
            </div>
            <div class="form-group">
                <div class="card" style="padding:20px">
                    <table id="myTable" class="table table-responsive-lg table-hover" >
                        <thead>
                            <tr class="text-center">
                                <th>ID</th>
                                <th>TIPO</th>
                                <th>NRO.TICKET</th>
                                <th>FECHA</th>
                                <th>DESCRIPCION</th>                            
                                <th>IMPORTE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="per" items="${Historial}">
                                <tr class="text-center">
                                    <td class="text-center">${per.id}</td>
                                    <td class="text-center">${per.operacion.tipooperacion==1?'DEUDA':'PAGO'}</td>
                                    <td class="text-center">${per.operacion.nroticket}</td>
                                    <td class="text-center">${per.operacion.fecha}</td>
                                    <td>${per.operacion.descripcion}</td>
                                    <c:if test="${per.operacion.tipooperacion==2}">
                                        <td style="color: red;font-weight: bold">- ${per.operacion.importe}</td>
                                    </c:if>
                                    <c:if test="${per.operacion.tipooperacion==1}">
                                        <td style="color: blue;font-weight: bold">+ ${per.operacion.importe}</td>
                                    </c:if>                                
                                </tr>
                            </c:forEach>                         
                        </tbody>
                    </table>
                    <hr>
                    <nav class="navbar-expand-lg">
                        <div class="navbar-collapse" id="navbarTogglerDemo03">
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                            </ul>
                            <form class="form-inline">
                                <div class="form-group">
                                    <button class="btn btn-warning bold ml-2" data-toggle="modal" data-target="#myModal"><i class="far fa-credit-card"></i> Registrar Deuda</button>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-success bold ml-2" data-toggle="modal" data-target="#myModal2"><i class="fab fa-amazon-pay"></i> Registrar Pagos</button>
                                </div>
                                <label class="bold ml-2">Total de Deuda:</label>
                                <input type="text" class="btn btn-outline-danger ml-2" readonly="" value="S/.${total}" style="text-align: center;font-weight: bold">                    
                            </form>
                        </div>
                    </nav>
                </div>                                 
            </div>
        </div>
    </div>
    <!--REGISTRO DE DEUDAS-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="Controlador?menu=Pago" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" class="bold"><i class="fas fa-edit"></i> REGISTRO DE DEUDA</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding-left: 30px;padding-right: 30px">
                        <div class="form-group">
                            <label for="tipooperacion">Tipo Operacion</label>
                            <input type="text" value="DEUDA" name="txtTipo" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        <div class="form-group">
                            <label for="tipooperacion" class="bold">Usuario</label>
                            <input type="hidden"  name="txtIdUser" value="${User.idUser}" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <input type="text" value="${User.nombres} ${User.apellidos}" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        <div class="form-group">
                            <label for="numero">Número de Ticket</label>
                            <input type="text" maxlength="10" class="form-control form-control-sm"  name="txtNumero" placeholder="T000000001">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <input type="text" class="form-control form-control-sm"  name="txtDescripcion" requerid="">
                        </div>
                        <div class="form-group">
                            <label for="importe">Importe</label>
                            <input type="text" class="form-control form-control-sm" name="txtImporte" requerid="" placeholder="S/. 200.00">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-left: 30px;padding-right: 30px">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" name="accion" value="Guardar" class="btn btn-primary">GUARDAR CAMBIOS</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--REGISTRO DE PAGOS-->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="Controlador?menu=Pago" method="POST">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" class="bold"><i class="fas fa-edit"></i> REGISTRO DE DEUDA</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding-left: 30px;padding-right: 30px">
                        <div class="form-group">
                            <label for="tipooperacion">Tipo Operacion</label>
                            <input type="text" value="PAGO" name="txtTipo" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        <div class="form-group">
                            <label for="tipooperacion" class="bold">Usuario</label>
                            <input type="hidden"  name="txtIdUser" value="${User.idUser}" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <input type="text" value="${User.nombres} ${User.apellidos}" class="form-control form-control-sm" id="tipooperacion"  aria-describedby="emailHelp" readonly=""/>
                            <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                        </div>
                        <div class="form-group">
                            <label for="numero">Número de Ticket</label>
                            <input type="text" maxlength="10" class="form-control form-control-sm"  name="txtNumero" placeholder="T000000001">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <input type="text" class="form-control form-control-sm"  name="txtDescripcion" requerid="">
                        </div>
                        <div class="form-group">
                            <label for="importe">Importe</label>
                            <input type="text" class="form-control form-control-sm" name="txtImporte" requerid="" placeholder="S/. 200.00">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-left: 30px;padding-right: 30px">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" name="accion" value="Guardar" class="btn btn-primary">GUARDAR CAMBIOS</button>
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
