<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>        
        <title>login</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col s12 m6">
                    <div class="card">  
                        <form action="ControladorLogin" method="POST">
                            <div class="card-content center">
                                <span class="card-title">INICIAR SESSION</span>
                                <div class="row">
                                    <div class="input-field col s12 m12">
                                        <i class="material-icons prefix">account_circle</i>
                                        <input id="icon_user" type="text" name="Usuario" value="admin" class="validate">
                                        <label for="icon_user">Usuario</label>
                                    </div>
                                    <div class="input-field col s12 m12">
                                        <i class="material-icons prefix">lock</i>
                                        <input id="icon_pass" type="password" name="Password" value="admin" class="validate">
                                        <label for="icon_pass">Password</label>
                                    </div>
                                </div>                                
                            </div>
                            <div class="card-action center">
                                <div class="row">
                                    <div class="col s12 m6">
                                        <button class="btn btn-large" type="submit" name="accion" value="Login">Ingresar <i class="material-icons right">directions_run</i></button>
                                    </div>
                                    <div class="col s12 m6" style="margin-top: 10px">
                                        <a class="card-title activator grey-text text-darken-4">REGISTRATE</a>
                                    </div> 
                                </div>                                                                    
                            </div>
                        </form>
                        <div class="card-action center">
                            <p>Bienvenidos al sitema de control de accesos. Sé parte de las buenas practicas 
                                con el uso de la tecnología no compartas tus datos personales.</p>                                                                  
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Por el momento no esta disponible<i class="material-icons right">close</i></span>
                            
                        </div>
                    </div>   
                </div>                
            </div>                    
        </div>
        <script src="materialize/js/materialize.min.js" type="text/javascript"></script>
    </body>
</html>
