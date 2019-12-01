<%--
    Document   : descuento
    Created on : Jul 17, 2019, 10:05 AM
    Author     : Alejandra Díaz
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Descuento_model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Descuento_model per = new Descuento_model();
    ArrayList<Descuento_model> list = per.list();
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
            function cargar(id, tipoDesc, porcentaje) {
                document.Update.txtId.value = id;
                document.Update.txtTipoDesc.value = tipoDesc;
                document.Update.txtPorcentaje.value = porcentaje;

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
                            <h1 class="h3 mb-0 text-gray-800">Nuevo Descuento</h1>                            
                            <a href="#nuevo" class="btn btn-success btn-sm" data-toggle="modal">Crear Descuento</a>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lista De Descuentos</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>
                                                <th>Códio</th>
                                                <th>tipoDesc</th>
                                                <th>porcentaje</th>
                                                <th></th>

                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Códio</th>
                                                <th>tipoDesc</th>
                                                <th>porcentaje</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                for (int i = 0; i < list.size(); i++) {
                                                    int id = list.get(i).getId();
                                                    String tipoDesc = list.get(i).getTipoDesc();
                                                    double porcentaje = list.get(i).getPorcentaje();

                                            %>
                                            <tr>
                                                <td><%= list.get(i).getId()%></td>

                                                <td><%= tipoDesc%></td>
                                                <td><%= porcentaje%></td>
                                                <td>
                                                    <a href="#editar" onclick="cargar(<%=list.get(i).getId()%>, '<%=tipoDesc%>', '<%=porcentaje%>')" data-toggle="modal">
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
                <form action="../decuento.do" method="POST">
                    <div class="modal-header">						
                        <h4 class="modal-title">Nuevo descuento</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tipo descuento </label>
                            <input type="text" name="txtTipoDesc" class="form-control" required pattern="[A-Za-z]{}" title="Campo requiere solo letras">
                        </div>
                        <div class="form-group">
                            <label>Porcentaje</label>
                            <Select name="txtPorcentaje"  class="form-control" required>
                                <option disabled selected>Selecione un porcentaje</option>
                                <option value="0.05">5%</option>
                                <option value="0.1">10%</option>
                                <option value="0.15">15%</option>
                                <option value="0.2">20%</option>
                                <option value="0.25">25%</option>
                                <option value="0.3">30%</option>
                                <option value="0.35">35%</option>
                                <option value="0.4">40%</option>
                                <option value="0.45">45%</option>
                                <option value="0.5">50%</option>
                                <option value="0.55">55%</option>
                                <option value="0.6">60%</option>
                                <option value="0.65">65%</option>
                                <option value="0.7">70%</option>
                                <option value="0.75">75%</option>
                                <option value="0.8">80%</option>
                                <option value="0.85">85%</option>
                                <option value="0.9">90%</option>
                                <option value="0.95">95%</option>
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
                <form action="../decuento.do?action=delete" method="Post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Eliminar Descuento</h4>
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
                <form action="../decuento.do" method="Post" name="Update">
                    <div class="modal-header">						
                        <h4 class="modal-title">Editar descuento</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" name="txtId" id="editarId">
                            <label>Tipo descuento </label>
                            <input type="text" name="txtTipoDesc" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Porcentaje</label>
                            <Select name="txtPorcentaje"  class="form-control" required>
                                <option disabled selected>Selecione un porcentaje</option>
                                <option value="0.05">5%</option>
                                <option value="0.1">10%</option>
                                <option value="0.15">15%</option>
                                <option value="0.2">20%</option>
                                <option value="0.25">25%</option>
                                <option value="0.3">30%</option>
                                <option value="0.35">35%</option>
                                <option value="0.4">40%</option>
                                <option value="0.45">45%</option>
                                <option value="0.5">50%</option>
                                <option value="0.55">55%</option>
                                <option value="0.6">60%</option>
                                <option value="0.65">65%</option>
                                <option value="0.7">70%</option>
                                <option value="0.75">75%</option>
                                <option value="0.8">80%</option>
                                <option value="0.85">85%</option>
                                <option value="0.9">90%</option>
                                <option value="0.95">95%</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-light" data-dismiss="modal" value="Cancelar">
                        <input type="submit" class="btn btn-info" value="Guardar cambios" name="action">
                    </div>
            </div
            </form>
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
