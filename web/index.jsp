<%-- 
    Document   : index
    Created on : Jul 13, 2019, 6:14:00 PM
    Author     : David Cordova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String cerrar = request.getParameter("cerrar");

    if (cerrar != null) {
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Mayo clinica</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/img/logo2.png">
        <link href="assets/mg/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
        <link href="assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="assets/css/style.css" rel="stylesheet">

    </head>

    <body id="body"><button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>

        <!--==========================
          Top Bar
        ============================-->
        <section id="topbar" class="d-none d-lg-block">
            <div class="container clearfix">
                <div class="contact-info float-left">
                    <i class="fa fa-envelope-o"></i> <a href="mailto:contact@example.com">mayo_clinic@example.com</a>
                    <i class="fa fa-phone"></i> +503 2222 2525
                </div>
                <div class="social-links float-right">
                    <a href="https://twitter.com/mayo_clinica?lang=es" class="twitter" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a href="https://www.facebook.com/clinicadentalmayo/?ref=page_internal" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a href="https://www.instagram.com/clinicadentalmayo/" class="instagram" target="_blank"><i class="fa fa-instagram"></i></a>
                    <a href="https://es.linkedin.com/in/clinica-dental-mayo-a1571b121" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i></a>
                </div>
            </div>
        </section>

        <!--==========================
          Header
        ============================-->
        <div id="header-sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 84px;"><header id="header" style="width: 993px; position: fixed; top: 0px; z-index: 50;">
                <div class="container">

                    <div id="logo" class="pull-left">
                        <h1><a href="#body" class="scrollto">Mayo<span>Clinica</span></a></h1>
                        <!-- Uncomment below if you prefer to use an image logo -->
                        <!-- <a href="#body"><img src="img/logo.png" alt="" title="" /></a>-->
                    </div>

                    <nav id="nav-menu-container">
                        <ul class="nav-menu sf-js-enabled sf-arrows" style="touch-action: pan-y;">
                            <li class=""><a href="#body">Inicio</a></li>
                            <li><a href="#about">Quienes somos</a></li>
                            <li><a href="#services">Servicios</a></li>
                            <li><a href="#contact">Contactenos</a></li>
                            <li><a href="views/registro.jsp">Registrese</a></li>
                            <li><a href="views/login.jsp">Inicio de sesión</a></li>
                        </ul>
                    </nav><!-- #nav-menu-container -->
                </div>
            </header></div><!-- #header -->

        <!--==========================
          Intro Section
        ============================-->
        <section id="intro">

            <div class="intro-content">
                <h2>Mayo<span>Clinica</span><br>Dental</h2>
            </div>

            <div id="intro-carousel" class="owl-carousel owl-loaded owl-drag">

                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-2979px, 0px, 0px); transition: all 0s ease 0s; width: 10923px;">
                        <div class="owl-item cloned" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image1.jpeg');"></div>
                        </div>
                        <div class="owl-item active" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image4.jpeg');"></div></div>
                        <div class="owl-item" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image6.jpeg');"></div></div><div class="owl-item" style="width: 993px;">
                            <div class="item" style="background-image: url('assets/img/intro-carousel/image3.jpeg');"></div></div>
                        <div class="owl-item cloned" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image1.jpeg');"></div></div>
                        <div class="owl-item cloned" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image4.jpeg');"></div></div>
                        <div class="owl-item cloned" style="width: 993px;"><div class="item" style="background-image: url('assets/img/intro-carousel/image6.jpeg');"></div></div></div></div>
                <div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div>
                <div class="owl-dots disabled"></div></div>

        </section><!-- #intro -->

        <main id="main">

            <!--==========================
              About Section
            ============================-->
            <section id="about" class="wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 about-img">
                            <img src="assets/img/logo.png" alt="">
                        </div>

                        <div class="col-lg-6 content">
                            <h2>Nuestro equipo de profesionales está especializado en ofrecer la solución idónea a tus problemas bucodentales.</h2>
                            <h3>Clínica dental Mayo es un centro dental con más de 20 años en el sector, donde siempre lo más importante es la salud bucodental de nuestros pacientes.</h3>

                            <ul>
                                <li><i class="ion-android-checkmark-circle"></i> Nuestro equipo de profesionales está formado por especialistas altamente cualificados.</li>
                                <li><i class="ion-android-checkmark-circle"></i> Nuestra filosofía es estar en vanguardia de todos los tratamientos dentales.</li>
                                <li><i class="ion-android-checkmark-circle"></i> Para los más pequeños disponemos de un espacio infantil.</li>
                            </ul>

                        </div>
                    </div>

                </div>
            </section><!-- #about -->

            <!--==========================
              Services Section
            ============================-->
            <section id="services">
                <div class="container">
                    <div class="section-header">
                        <h2>Servicios</h2>
                        <p>En Clínica Dental Mayo encontrarás todos los tratamientos odontológicos y la atención de los profesionales más cualificados para ofrecer la solución adecuada a tus problemas bucodentales.</p>
                    </div>

                    <div class="row">

                        <div class="col-lg-6">
                            <div class="box wow fadeInLeft" style="visibility: visible; animation-name: fadeInLeft;">
                                <div class="icon"><i class="fa fa-address-book-o"></i></div>
                                <h4 class="title"><a href="views/citas.jsp">Reserva de citas</a></h4>
                                <p class="description">La mejor sonrisa es la tuya. Has la reserva de tus citas facilmete desde aquí.</p>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="box wow fadeInRight" style="visibility: visible; animation-name: fadeInRight;">
                                <div class="icon"><i class="fa fa-hospital-o "></i></div>
                                <h4 class="title"><a href="">Endodoncia</a></h4>
                                <p class="description">Extirpación de la pulpa dental y el posterior relleno y sellado de la cavidad pulpar con un material inerte</p>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="box wow fadeInLeft" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                                <div class="icon"><i class="fa fa-remove"></i></div>
                                <h4 class="title"><a href="">Periodoncia</a></h4>
                                <p class="description"> Permite eliminar la placa bacteriana y el sarro. Diagnóstico y tratamiento de las enfermedades periodontales (gingivitis y periodontitis).</p>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="box wow fadeInRight" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInRight;">
                                <div class="icon"><i class="fa fa-magnet"></i></div>
                                <h4 class="title"><a href="">Protesis Dental</a></h4>
                                <p class="description">Las dentaduras postizas son dispositivos protésicos construidos para reemplazar los dientes perdidos, y están soportadas por los tejidos blandos y duros de la cavidad bucal.</p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="box wow fadeInLeft" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                                <div class="icon"><i class="fa fa-heartbeat"></i></div>
                                <h4 class="title"><a href="">Implantología</a></h4>
                                <p class="description"> Colocación y mantenimiento de los implantes dentales, aparatos, prótesis o sustancias que se colocan en el cuerpo para mejorar alguna de sus funciones o con fines estéticos.</p>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="box wow fadeInRight" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInRight;">
                                <div class="icon"><i class="fa fa-circle"></i></div>
                                <h4 class="title"><a href="">Salud e higie Bucal</a></h4>
                                <p class="description">Te brindamos servicios de limpieza dental profunda, rellenos de resina y plata, etc.</p>
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="box wow fadeInRight" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInRight;">
                                <div class="icon"><i class="fa fa-child"></i></div>
                                <h4 class="title"><a href="">Mayo kids</a></h4>
                                <p class="description">Cirugía bucal para niños, sellantes,fracturas dentales, emergencias dentales.</p>
                            </div>
                        </div>
                    </div>
            </section>
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
                                <p><a href="mailto:info@example.com">mayo_clinic@example.com</a></p>
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
        <script src="assets/lib/jquery/jquery.min.js"></script>
        <script src="assets/lib/jquery/jquery-migrate.min.js"></script>
        <script src="assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/lib/easing/easing.min.js"></script>
        <script src="assets/lib/superfish/hoverIntent.js"></script>
        <script src="assets/lib/superfish/superfish.min.js"></script>
        <script src="assets/lib/wow/wow.min.js"></script>
        <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="assets/lib/magnific-popup/magnific-popup.min.js"></script>
        <script src="assets/lib/sticky/sticky.js"></script>

        <!-- Contact Form JavaScript File -->
        <script src="assets/contactform/contactform.js"></script>

        <!-- Template Main Javascript File -->
        <script src="assets/js/main.js"></script>



        <nav id="mobile-nav">
            <ul class="" style="touch-action: pan-y;" id="">
                <li class="menu-active"><a href="#body">Inicio</a></li>
                <li><a href="#about">Quienes somos</a></li>
                <li class="menu-active"><a href="#services">Servicios</a></li>
                <li><a href="#contact">Contactenos</a></li>
            </ul>
        </nav><div id="mobile-body-overly"></div></body>
</html>