<%-- 
    Document   : registro
    Created on : Jul 13, 2019, 8:07:06 PM
    Author     : David Cordova
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Enfermedad_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Enfermedad_model ef = new Enfermedad_model();
   ArrayList<Enfermedad_model> li = ef.EnfeList();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Nuevo paciente</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/logo2.png">
        <link href="../assets/mg/favicon.png" rel="icon">
        <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="../assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="../assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="../assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../assets/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
        <link href="../assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="../assets/css/style.css" rel="stylesheet">

    </head>
    <body id="body"><button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>

        <!--==========================
          Top Bar
        ============================-->
        <section id="topbar" class="d-none d-lg-block">
            <div class="container clearfix">
                <div class="contact-info float-left">
                    <i class="fa fa-envelope-o"></i> <a href="mailto:contact@example.com">contact@example.com</a>
                    <i class="fa fa-phone"></i> +1 5589 55488 55
                </div>
                <div class="social-links float-right">
                    <a href="https://twitter.com/" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="https://www.facebook.com/" class="facebook"><i class="fa fa-facebook"></i></a>
                    <a href="https://www.instagram.com/" class="instagram"><i class="fa fa-instagram"></i></a>
                    <a href="https://www.linkedin.com" class="linkedin"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>
        </section>

        <!--==========================
          Header
        ============================-->
        <div id="header-sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 84px;"><header id="header" style="width: 993px; position: fixed; top: 0px; z-index: 50;">
                <div class="container">

                    <div id="logo" class="pull-left">
                        <h1><a href="../index.jsp" class="scrollto">Mayo<span>Clinica</span></a></h1>
                        <!-- Uncomment below if you prefer to use an image logo -->
                        <!-- <a href="#body"><img src="img/logo.png" alt="" title="" /></a>-->
                    </div>

                    <nav id="nav-menu-container">
                        <ul class="nav-menu sf-js-enabled sf-arrows" style="touch-action: pan-y;">
                            <li class=""><a href="../index.jsp">Inicio</a></li>
                            <li><a href="../index.jsp">Quienes somos</a></li>
                            <li class="menu-active"><a href="../index.jsp">Servicios</a></li>
                            <li><a href="#contact">Contactenos</a></li>
                            <li><a href="#body">Registrese</a></li>
                             <li><a href="login.jsp">Inicio de sesión</a></li>
                        </ul>
                    </nav><!-- #nav-menu-container -->
                </div>
            </header></div><!-- #header -->

        <div class="container">
            <div class="form">
                <div class="intro-content">
                    <div class="section-header">
                        <h2>Crear usuario</h2>
                        <p>Para registrar una cita, primero debe de registrarse</p>
                    </div>
                </div>
                <form action="../paciente.do" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="hidden" name="txtCar" value="3">
                            <input type="text" name="txtUs" class="form-control" placeholder="Nombre de usuario" pattern="[A-Za-z]{}" title="Campo requiere letras">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="password" name="txtPass" class="form-control" placeholder="Contraseña">
                            <div class="validation"></div>
                        </div>
                    </div>
                        <div class="intro-content">
                        <div class="section-header">
                            <h2>Datos personales del paciente</h2>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" name="txtNombre" class="form-control"  placeholder="Nombre" pattern="[A-Za-z]{}" title="Campo requiere letras">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" name="txtApellido" class="form-control" placeholder="Apellido" pattern="[A-Za-z]{}" title="Campo requiere letras">
                            <div class="validation"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" class="form-control" name="txtTel"  placeholder="Teléfono" pattern="[0-9]{4}-[0-9]{4}" title="Campo requerido números (-)">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="email" class="form-control" name="txtEmail" placeholder="Correo electronico">
                            <div class="validation"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" class="form-control" name="txtDui" placeholder="DUI" pattern="[0-9]{8}-[0-9]{1}" title="Campo requerido números (-)">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <select class="form-control" name="txtSex">
                                <option disabled selected>Sexo</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <div class="validation"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" class="form-control" name="txtCon"  placeholder="Contacto de emergencia" pattern="[0-9]{4}-[0-9]{4}" title="Campo requerido números (-)">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <input type="text" class="form-control" name="txtDir"  placeholder="Dirección">
                            <div class="validation"></div>
                        </div>
                    </div>
                     <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Posee alguna de estas enfermedades</label>
                            <select class="form-control" name="txtEnf">
                                <option disabled selected></option>
                                <% for (int i=0; i<li.size();i++) {
                                    int id= li.get(i).getId();
                                    String nom = li.get(i).getNombre();
                                %>
                                <option value="<%=id%>"><%=nom%></option>
                                <%
                                    }
                                %>
                            </select>
                            <div class="validation"></div>
                        </div>
                    </div>
                    <div class="text-center"><input type="submit" class="btn btn-success" value="Enviar" name="action"></div>
                </form>
            </div>

        </div>
        <!--==========================
          Contact Section
        ============================-->
        <section id="contact" class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
            <div class="container">
                <div class="section-header">
                    <h2>Contactanos</h2>
                    <p>Si quieres contactar con nosotros</p>
                </div>

                <div class="row contact-info">

                    <div class="col-md-4">
                        <div class="contact-address">
                            <i class="ion-ios-location-outline"></i>
                            <h3>Dirección</h3>
                            <address>San Salvador, San Salvador</address>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-phone">
                            <i class="ion-ios-telephone-outline"></i>
                            <h3>Teléfono</h3>
                            <p><a href="#">+503 2222 2525 </a></p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-email">
                            <i class="ion-ios-email-outline"></i>
                            <h3>Email</h3>
                            <p><a href="mailto:info@example.com">info@example.com</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </section><!-- #contact -->

    </main>

    <!--==========================
      Footer
    ============================-->
    <footer id="footer">
        <div class="container">
            <div class="copyright">
                © Copyright <strong>2019 Clínica Dental Mayo</strong>. Todos los derechos reservados
            </div>
        </div>
    </footer><!-- #footer -->

    <a href="#" class="back-to-top" style="display: inline;"><i class="fa fa-chevron-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="../assets/lib/jquery/jquery.min.js"></script>
    <script src="../assets/lib/jquery/jquery-migrate.min.js"></script>
    <script src="../assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/lib/easing/easing.min.js"></script>
    <script src="../assets/lib/superfish/hoverIntent.js"></script>
    <script src="../assets/lib/superfish/superfish.min.js"></script>
    <script src="../assets/lib/wow/wow.min.js"></script>
    <script src="../assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../assets/lib/magnific-popup/magnific-popup.min.js"></script>
    <script src="../assets/lib/sticky/sticky.js"></script>

    <!-- Contact Form JavaScript File -->
    <script src="../assets/contactform/contactform.js"></script>

    <!-- Template Main Javascript File -->
    <script src="../assets/js/main.js"></script>

    <nav id="mobile-nav">
        <ul class="" style="touch-action: pan-y;" id="">
            <li class="menu-active"><a href="#body">Inicio</a></li>
            <li><a href="#about">Quienes somos</a></li>
            <li class="menu-active"><a href="#services">Servicios</a></li>
            <li><a href="#contact">Contactenos</a></li>
        </ul>
    </nav><div id="mobile-body-overly"></div>

</body>
</html>
