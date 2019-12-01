<%-- 
    Document   : empleados
    Created on : 07-15-2019, 08:33:25 AM
    Author     : joel.segoviafgkss
--%>

<%@page import="models.Cargo_model"%>
<%@page import="models.Empleado_model"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Empleado_model per = new Empleado_model();
    ArrayList<Empleado_model> list = per.listar_emp();

    Cargo_model ca = new Cargo_model();
    ArrayList<Cargo_model> li = ca.listar();
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

        <script>
            function eliminar(id) {
                $('#id').val(id);

            }
            function cargar(id, nombre, apellido, telefono, correo, direccion, dui, sexo, em, cargo) {
                document.Update.txtId.value = id;
                document.Update.txtNombre.value = nombre;
                document.Update.txtApellido.value = apellido;
                document.Update.txtTelefono.value = telefono;
                document.Update.txtCorreo.value = correo;
                document.Update.txtDireccion.value = direccion;
                document.Update.txtDui.value = dui;
                document.Update.txtSex.value = sexo;
                document.Update.txtTelm.value = em;
                document.Update.txtCargo.value = cargo;
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
                            <h1 class="h3 mb-0 text-gray-800">Nuevo Empleado</h1>                            
                            <a href="#nuevo" class="btn btn-success btn-sm" data-toggle="modal">Crear Empleado</a>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista De Empleados</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable"  style="font-size: 10px;">

                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Teléfono</th>
                                                <th>Correo</th>
                                                <th>Dirección</th>
                                                <th>Dui</th>
                                                <th>Sexo</th>
                                                <th>Tel Emergencia</th>
                                                <th>Cargo</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>Teléfono</th>
                                                <th>Correo</th>
                                                <th>Dirección</th>
                                                <th>Dui</th>
                                                <th>Sexo</th>
                                                <th>Tel Emergencia</th>
                                                <th>Cargo</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                for (int i = 0; i < list.size(); i++) {
                                                    String nombre = list.get(i).getNombre();
                                                    String apellido = list.get(i).getApellido();
                                                    String telefono = list.get(i).getTelefono();
                                                    String direccion = list.get(i).getDireccion();
                                                    String correo = list.get(i).getCorreo();
                                                    String dui = list.get(i).getDui();
                                                    int cargo = list.get(i).getIdCargo();
                                                    String sex= list.get(i).getSexo();
                                                    String tle= list.get(i).getContacto();
                                            %>
                                            <tr>
                                                <td><%= list.get(i).getId()%></td>
                                                <td><%= nombre%></td>
                                                <td><%= apellido%></td>
                                                <td><%= telefono%></td>
                                                <td><%= correo%></td>
                                                <td><%= direccion%></td>
                                                <td><%= dui%></td>
                                                <td><%= sex%></td>
                                                <td><%= tle%></td>
                                                <td><%= cargo%></td>

                                                <td>
                                                    <a href="#editar" onclick="cargar(<%=list.get(i).getId()%>, '<%=nombre%>', '<%= apellido%>', '<%= telefono%>', '<%= correo%>', '<%= direccion%>', '<%= dui%>', '<%= sex%>','<%= tle%>','<%= cargo%>')" data-toggle="modal">
                                                        <i class="material-icons" data-toggle="tooltip" title="Editar" style="color:  #f1c40f;">&#xE254;</i>
                                                    </a>
                                                    <a href="#borrar" onclick="eliminar(<%=list.get(i).getId()%>)" data-toggle="modal">
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
                <form action="../empleado.do" method="POST">

                    <div class="modal-header">						
                        <h4 class="modal-title">Nuevo Empleado</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="txtNombre"  class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere solo letras">
                        </div>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" name="txtApellido" class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere solo letras">
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" name="txtTelefono"  class="form-control" required pattern="[0-9]{4}-[0-9]{4}" title="Campo requiere solo números" >
                        </div>
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="text" name="txtCorreo"  class="form-control" required>
                        </div>
                        <div class="form-group"> 
                            <label>Direccion</label>
                            <input type="text" name="txtDireccion"  class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>DUI</label>
                            <input type="text" name="txtDui"  class="form-control" required  required pattern="[0-9]{8}-[0-9]{1}" title="Campo requiere solo números">
                        </div>
                        <div class="form-group">
                            <label>Sexo</label>
                            <Select name="txtSex" class="form-control" required>
                                <option disabled selected></option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Teléfono de emergecia</label>
                            <input type="text" name="txtTelefono"  class="form-control" required pattern="[0-9]{4}-[0-9]{4}" title="Campo requiere solo números" >
                        </div>
                        <div class="form-group">
                            <label>Cargo</label>
                            <select class="form-control" name="txtCargo" required>
                                <option disabled selected></option>
                                <% for (int i = 0; i < li.size(); i++) {%>
                                <option value="<%= li.get(i).getId()%>"> <%= li.get(i).getNombre()%> </option>
                                <% }%>  
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
                <form action="../empleado.do?action=delete" method="Post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Eliminar empleado</h4>
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
                <form action="../empleado.do" method="Post" name="Update">
                    <div class="modal-header">						
                        <h4 class="modal-title">Editar empleado</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <input type="hidden" name="txtId" id="editarId">

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="txtNombre"  class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere solo letras">
                        </div>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" name="txtApellido" class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere solo letras">
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" name="txtTelefono"  class="form-control" required pattern="[0-9]{4}-[0-9]{4}" title="Campo requiere solo números" >
                        </div>
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="text" name="txtCorreo"  class="form-control" required>
                        </div>
                        <div class="form-group"> 
                            <label>Direccion</label>
                            <input type="text" name="txtDireccion"  class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>DUI</label>
                            <input type="text" name="txtDui"  class="form-control" required  required pattern="[0-9]{8}-[0-9]{1}" title="Campo requiere solo números">
                        </div>
                        <div class="form-group">
                            <label>Sexo</label>
                            <Select name="txtSex" class="form-control" required>
                                <option disabled selected></option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Teléfono de emergecia</label>
                            <input type="text" name="txtTelm"  class="form-control" required pattern="[0-9]{4}-[0-9]{4}" title="Campo requiere solo números" >
                        </div>
                        <div class="form-group">
                            <label>Cargo</label>
                            <select class="form-control" name="txtCargo" required>
                                <option disabled selected></option>
                                <% for (int i = 0; i < li.size(); i++) {%>
                                <option value="<%= li.get(i).getId()%>"> <%= li.get(i).getNombre()%> </option>
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
