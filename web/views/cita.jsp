<%-- 
    Document   : cita
    Created on : Jul 25, 2019, 8:55:24 AM
    Author     : David Cordova
--%>

<%@page import="models.Empleado_model"%>
<%@page import="models.Servicio_model"%>
<%@page import="models.Paciente_model"%>
<%@page import="models.Citas_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DetalleCita_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Citas_model dc = new Citas_model();
    ArrayList<Citas_model> lis = dc.Citas();

    Paciente_model per = new Paciente_model();
    ArrayList<Paciente_model> list = per.list();

    Servicio_model ser = new Servicio_model();
    ArrayList<Servicio_model> li = ser.liSer();

    Empleado_model emp = new Empleado_model();
    ArrayList<Empleado_model> eli = emp.doc();
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Mayo Clinica Dental</title>

        <!-- Custom fonts for this template-->
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/logo2.png">
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="../assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Include Twitter Bootstrap and jQuery: -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
        <script>
            function eliminar(id) {
                $('#id').val(id);

            }
            function cargar(id, pa, doc, fe, hr, ser) {
                document.Update.txtId.value = id;
                document.Update.txtpa.value = pa;
                document.Update.txtden.value = doc;
                document.Update.txtFec.value = fe;
                document.Update.txthora.value = hr;
                document.Update.txtServicio.value = ser;
            }
        </script>   

    </head>


    <body id="page-top">
        <div id="wrapper">

            <%@include file="menu.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="barra.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Nueva Cita</h1>              
                            <a href="#nuevo" class="btn btn-success btn-sm" data-toggle="modal">Crear cita</a>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista De Citas</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>
                                                <th>Código</th>
                                                <th>Paciente</th>
                                                <th>Dentista</th>
                                                <th>Fecha de cita</th>
                                                <th>Hora</th>
                                                <th>Fecha registrada</th>                                                
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Código</th>
                                                <th>Paciente</th>
                                                <th>Dentista</th>
                                                <th>Fecha de cita</th>
                                                <th>Hora</th>
                                                <th>Fecha registrada</th>                                                
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                for (int i = 0; i < lis.size(); i++) {
                                                    int id = lis.get(i).getId();
                                                    String fe = lis.get(i).getFecha();
                                                    String hr = lis.get(i).getHora();
                                                    String fr = lis.get(i).getCreacion();
                                                    String nom = lis.get(i).getNombre();
                                                    String ap = lis.get(i).getApellido();
                                                    String dnom = lis.get(i).getDnom();
                                                    String dap = lis.get(i).getDape();
                                                    int idp = lis.get(i).getIdPaciente();
                                                    int idoc = lis.get(i).getIdDoctor();
                                            %>
                                            <tr>
                                                <td><%= id%></td>
                                                <td><%= nom + " " + ap%></td>
                                                <td><%= dnom + " " + dap%></td>
                                                <td><%= fe%></td>
                                                <td><%= hr%></td>
                                                <td><%= fr%></td>
                                                <td>
                                                    <a href="#editar" onclick="cargar(<%=id%>, <%=idp%>, <%= idoc%>, '<%= fe%>', '<%= hr%>', '<%= fr%>')" data-toggle="modal">
                                                        <i class="material-icons" data-toggle="tooltip" title="Editar" style="color:  #f1c40f;">&#xE254;</i>
                                                    </a>
                                                    <a href="#borrar" onclick="eliminar(<%=id%>)" data-toggle="modal">
                                                        <i class="material-icons" data-toggle="tooltip" title="Eliminar" style="color:  #c0392b;" >&#xE872;</i>
                                                    </a>
                                                </td>

                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <%@include file="footer.jsp" %>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Add Modal-->
    <div class="modal fade" id="nuevo">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="../citas.do" method="POST">
                    <div class="modal-header">						
                        <h4 class="modal-title">Nueva Cita</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Paciente</label>
                            <select class="form-control" name="txtPaciente" required>
                                <option disabled selected></option>
                                <%for (int i = 0; i < list.size(); i++) {
                                        int id = list.get(i).getId();
                                        String nom = list.get(i).getNombre();
                                        String ape = list.get(i).getApellido();
                                %>
                                <option value="<%=id%>"><%=nom + " " + ape%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Dentista</label>
                            <select class="form-control" name="txtDentista" required>
                                <option disabled selected></option>
                                <%
                                    System.out.println("Dentistas " + eli.size());
                                    for (int i = 0; i < eli.size(); i++) {
                                        int id = eli.get(i).getId();
                                        String nom = eli.get(i).getNombre();
                                        String ape = eli.get(i).getApellido();

                                %>
                                <option value="<%=id%>"><%=nom + " " + ape%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Fecha de cita</label>
                            <input type="date" name="txtFecha" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Hora</label>
                            <select class="form-control" name="txthora" required>
                                <option disabled selected>Seleccione una hora</option>
                                <%for (int i = 9; i <= 17; i++) {
                                        int hr = i;
                                %>
                                <option value="<%=hr%>:00"><%=hr%>:00</option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Servicios</label>

                            <select class="form-control selectpicker" name="txtServicio" multiple data-live-search="true" id="select">
                                <% for (int i = 0; i < li.size(); i++) {%>
                                <option value="<%= li.get(i).getId()%>"><%= li.get(i).getNombre()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-light" data-dismiss="modal" value="Cancelar">
                        <input type="submit" class="btn btn-info" value="Crear" name="action">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Modal-->
    <div class="modal fade" id="borrar">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="../citas.do?action=delete" method="Post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Eliminar cita</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <p>¿Seguro que quieres eliminar este registro?</p>
                        <p class="text-warning"><small>Esta acción no se puede deshacer.</small></p>
                        <input type="hidden" id="id" name="id" >
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-light" data-dismiss="modal" value="Cancelar">
                        <input type="submit" class="btn btn-danger" value="Eliminar">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Update Modal-->
    <div class="modal fade" id="editar">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="../citas.do" method="POST" name="Update">
                    <div class="modal-header">						
                        <h4 class="modal-title">Editar Cita</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" name="txtId">
                            <label>Paciente</label>
                            <select class="form-control" name="txtpa" required>
                                <option disabled selected></option>
                                <%for (int i = 0; i < list.size(); i++) {
                                        int id = list.get(i).getId();
                                        String nom = list.get(i).getNombre();
                                        String ape = list.get(i).getApellido();
                                %>
                                <option value="<%=id%>"><%=nom + " " + ape%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Dentista</label>
                            <select class="form-control" name="txtden" required>
                                <option disabled selected></option>
                                <% for (int i = 0; i < eli.size(); i++) {
                                        int id = eli.get(i).getId();
                                        String nombre = eli.get(i).getNombre();
                                        String apellido = eli.get(i).getApellido();
                                %>
                                <option value="<%=id%>"><%=nombre + " " + apellido%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Fecha de cita</label>
                            <input type="date" name="txtFec" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Hora</label>
                            <select class="form-control" name="txthora" required>
                                <option disabled selected>Seleccione una hora</option>
                                <%for (int i = 9; i <= 17; i++) {
                                        int hr = i;
                                %>
                                <option value="<%=hr%>:00"><%=hr%>:00</option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Servicios</label>
                            <select class="form-control selectpicker" name="txtServicio" multiple data-live-search="true" id="select">
                                <% for (int i = 0; i < li.size(); i++) {%>
                                <option value="<%= li.get(i).getId()%>"><%= li.get(i).getNombre()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-light" data-dismiss="modal" value="Cancelar">
                        <input type="submit" class="btn btn-info" value="Guardar cambios" name="action">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../assets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../assets/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../assets/js/demo/chart-area-demo.js"></script>
    <script src="../assets/js/demo/chart-pie-demo.js"></script>

    <!-- Page level plugins -->
    <script src="../assets/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../assets/js/demo/datatables-demo.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

    <script>
                                                        $('#select').selectpicker();
    </script>
</body>
</html>
