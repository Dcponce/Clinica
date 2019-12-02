<%--
    Document   : usuarios
    Created on : Jul 9, 2019, 12:49:35 PM
    Author     : David Cordova
--%>
<%@page import="models.Paciente_model"%>
<%@page import="models.Empleado_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.UsuarioN_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    UsuarioN_model per = new UsuarioN_model();
    ArrayList<UsuarioN_model> list = per.list();

    if (request.getSession().getAttribute("acceso") != null) {

        if (request.getSession().getAttribute("acceso").equals(1) || request.getSession().getAttribute("acceso").equals(2)) {

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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">

        <script>
            function eliminar(id) {
                $('#id').val(id);

            }
            function cargar(id, usuario, nivel, empleado) {
                document.Update.txtId.value = id;
                document.Update.txtUs.value = usuario;
                document.Update.txtnivel.value = nivel;
                document.Update.txtEmp.value = empleado;
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
                            <h1 class="h3 mb-0 text-gray-800">Nuevo Usuario</h1>                            
                            <a href="#nuevo" class="btn btn-success btn-sm" data-toggle="modal">Crear Usuario</a>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista De Usuarios</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Usuario</th>
                                                <th>Acceso</th>
                                                <th>Empleado</th>
                                                <th></th>

                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Id</th>
                                                <th>Usuario</th>
                                                <th>Acceso</th>
                                                <th>Empleado</th>
                                                <th></th>

                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%                                                for (int i = 0; i < list.size(); i++) {
                                                    String usuario = list.get(i).getUsuario();
                                                    String nom = list.get(i).getNom();
                                                    String ap = list.get(i).getApe();
                                                    int nivel = list.get(i).getAcceso();
                                                    String acceso = list.get(i).getNac();
                                                    int empleado = list.get(i).getEmpleado();
                                                    int id = list.get(i).getId();
                                            %>
                                            <tr>
                                                <td><%= list.get(i).getId()%></td>
                                                <td><%= usuario%></td>
                                                <td><%= acceso%></td>
                                                <td><%= nom + " " + ap%></td>
                                                <td>
                                                    <a href="#editar" onclick="cargar(<%=list.get(i).getId()%>, '<%=usuario%>',<%=nivel%>,<%=empleado%>)" data-toggle="modal">
                                                        <i class="material-icons" data-toggle="tooltip" title="Editar" style="color:  #f1c40f;">&#xE254;</i>
                                                    </a>
                                                    <a href="#borrar" onclick="eliminar(<%= id%>)" data-toggle="modal">
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
                <form action="../nuevo_usuario.do" method="Post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Nuevo usuario</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" name="txtUs" id="usuario" class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere letras">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" name="txtPass" id="contra" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Acceso</label>
                            <select class="form-control" id="edit_acc" name="txtnivel" required>
                                <option disabled selected></option>
                                <option value="1">Administrador</option>
                                <option value="2">Empleado</option>
                                <option value="3">Cliente</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Empleado</label>
                            <select class="form-control" id="edit_acc" name="txtEmp" required>
                                <option disabled selected></option>
                                <% for (int i = 0; i < list.size(); i++) {%>
                                <option value="<%= list.get(i).getEmpleado()%>"><%= list.get(i).getNom()%> <%= list.get(i).getApe()%></option>
                                <% } %>
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
                <form action="../nuevo_usuario.do?action=delete" method="Post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Eliminar usuario</h4>
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
                <form action="../nuevo_usuario.do" method="Post" name="Update">
                    <div class="modal-header">						
                        <h4 class="modal-title">Editar usuario</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label></label>
                            <input type="hidden" name="txtId" id="editarId">
                        </div>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" name="txtUs" id="usuario" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Acceso</label>
                            <select class="form-control" id="edit_acc" name="txtnivel" required>
                                <option disabled selected></option>
                                <option value="1">Administrador</option>
                                <option value="2">Empleado</option>
                                <option value="3">Cliente</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Empleado</label>
                            <select class="form-control" id="edit_acc" name="txtEmp" required>
                                <option disabled selected>Nombre de empleados</option>
                                <% for (int i = 0; i < list.size(); i++) {%>
                                <option value="<%= list.get(i).getEmpleado()%>"><%= list.get(i).getNom()%> <%= list.get(i).getApe()%></option>
                                <% }%>                            
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


</body>
</html>
<%        }
    } else {
        request.getRequestDispatcher("error404.jsp").forward(request, response);
    }
%>