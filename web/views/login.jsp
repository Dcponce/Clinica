<%-- 
    Document   : login
    Created on : 07-05-2019, 10:30:13 AM
    Author     : david.poncefgkss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/logo2.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="../assets/css/global.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="../sweetalert/sweetalert2.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
</head>
<body>
    <div class="container-fluid bg">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <form class="form-container needs-validation" novalidate method="post" action="../usuario2.do">
                    <h1>Inicio de <span>sesión</span></h1>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Ingrese su usuario" name="txtUsuario" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña" name="txtPassword" required>
                    </div>
                    <input type="submit" class="btn btn-info btn-block" value="Ingresar" name="btnAcceder">
                </form>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
        </div>
    </div>

    <script src="assets/js/global.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <%
       String error= request.getParameter("error");

        if(error != null) {
    %>
    <script>
Swal.fire({
  icon: 'error',
  title: 'Oops...',
  text: 'Usuario y contraseña son incorrectos!'
});
    </script>
    <%
        }
    %>
</body>
</html>
