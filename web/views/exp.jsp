<%-- 
    Document   : exp
    Created on : Jul 25, 2019, 12:07:33 AM
    Author     : David Cordova
--%>


<%@page import="models.DetalleEx"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    if (request.getSession().getAttribute("acceso") != null) {

        if (request.getSession().getAttribute("acceso").equals(1) || request.getSession().getAttribute("acceso").equals(2)) {

            int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Expediente</title>
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/logo2.png">

    </head>
    <body>
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica_dental", "root", "");

            File jasperFile = new File(application.getRealPath("reportes/reporte.jasper"));

            Map parametro = new HashMap();
            parametro.put("valor", id);

            byte[] bytes = JasperRunManager.runReportToPdf(jasperFile.getPath(), parametro, con);
            response.setContentType("pdf");
            response.setContentLength(bytes.length);

            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
        %>
    </body>
</html>
<%        }
    } else {
        request.getRequestDispatcher("error404.jsp").forward(request, response);
    }
%>