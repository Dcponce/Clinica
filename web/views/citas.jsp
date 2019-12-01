<%-- 
    Document   : citas
    Created on : Jul 13, 2019, 6:41:21 PM
    Author     : David Cordova
--%>

<%@page import="controller.Citas"%>
<%@page import="models.Citas_model"%>
<%@page import="models.Empleado_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Servicio_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id_user = 0; //Integer.parseInt( request.getSession().getAttribute("id_user").toString() );
    String user = ""; //request.getSession().getAttribute("usuario").toString();    
%>
<%
    Servicio_model ser = new Servicio_model();
    ArrayList<Servicio_model> list = ser.liSer();

    Empleado_model emp = new Empleado_model();
    ArrayList<Empleado_model> li = emp.doc();

    Citas_model ci = new Citas_model();
    ArrayList<Citas_model> lis = ci.hrs();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro de citas</title>
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


        <!-- Include Twitter Bootstrap and jQuery: -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

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
                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
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
                            <li><a href="registro.jsp">Registrese</a></li>
                        </ul>
                    </nav><!-- #nav-menu-container -->
                </div>
            </header></div><!-- #header -->
            <%                if (request.getSession().getAttribute("acceso").equals(3)) {


            %>
        <div class="container">
            <div class="form">
                <div class="intro-content">
                    <div class="section-header">
                        <h2>Solicita tú cita</h2>
                    </div>
                </div>
                <div id="errormessage"></div>
                <form action="../citas.do" method="post"  class="contactForm">
                    <input type="hidden" name="id_paciente" value="${sessionScope.id}" >



                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Paciente</label>
                            <input class="form-control" name="txtPa" value="${sessionScope.nombre} ${sessionScope.apellido}" disabled>
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <select class="form-control" name="txtDentista" >
                                <option disabled selected>Seleccione su dentista</option>
                                <% for (int i = 0; i < li.size(); i++) {
                                        int id = li.get(i).getId();
                                        String nombre = li.get(i).getNombre();
                                        String apellido = li.get(i).getApellido();
                                %>
                                <option value="<%=id%>"><%=nombre + " " + apellido%></option>
                                <% } %>
                            </select>
                            <div class="validation"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Fecha para su cita</label>
                            <input class="form-control" name="txtFecha" type="date">
                            <div class="validation"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label></label>
                            <select class="form-control" name="txthora" >
                                <option disabled selected>Seleccione una hora</option>
                                <%for (int i = 9; i <= 17; i++) {
                                        int hr = i;
                                %>
                                <option value="<%=hr%>:00"><%=hr%>:00</option>
                                <%}%>
                            </select>
                            <div class="validation"></div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Servicios</label>

                            <select class="form-control selectpicker" name="txtServicio" multiple data-live-search="true" id="select">
                                <% for (int i = 0; i < list.size(); i++) {%>
                                <option value="<%= list.get(i).getId()%>"><%= list.get(i).getNombre()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>          


                    <div class="text-center"><input type="submit" class="btn btn-success" value="Enviar" name="action"></div>
                </form>
            </div>

        </div>
        <%
        } else {
        %>
        <div class="container">
            <div class="form">
                <div class="intro-content">
                    <div class="section-header red">
                        <h2>Para solicitar una cita inicie sesión</h2>
                    </div>
                </div>
        </div>
        <%
            }

        %>
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

    <!-- 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script> -->



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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

    <script>
        $('#select').selectpicker();
    </script>
</body>
</html>
