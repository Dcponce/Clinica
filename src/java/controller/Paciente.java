package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Paciente_model;

/**
 *
 * @author joel.segoviafgkss
 */
public class Paciente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = 0;
        int idc = 0;
        String action = request.getParameter("action");
        Paciente_model per = new Paciente_model();

        switch (action) {
            case "Enviar":
                idc = Integer.parseInt(request.getParameter("txtCar"));
                
                per.setUs(request.getParameter("txtUs"));
                per.setPass(request.getParameter("txtPass"));
                per.setNombre(request.getParameter("txtNombre"));
                per.setTelefono(request.getParameter("txtTel"));
                per.setDireccion(request.getParameter("txtDir"));
                per.setCorreo(request.getParameter("txtEmail"));
                per.setDui(request.getParameter("txtDui"));
                per.setSexo(request.getParameter("txtSex"));
                per.setContacto(request.getParameter("txtCon"));
                per.setApellido(request.getParameter("txtApellido"));
                per.setEnfermedad(Integer.parseInt(request.getParameter("txtEnf")));
                per.setIdCargo(idc);

                if (per.agregar()) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("views/registro.jsp?error");
                }
                break;
                
            case "Crear":
                idc = Integer.parseInt(request.getParameter("txtCar"));
                
                per.setNombre(request.getParameter("txtNombre"));
                per.setApellido(request.getParameter("txtApellido"));
                per.setTelefono(request.getParameter("txtTelefono"));
                per.setDireccion(request.getParameter("txtDireccion"));
                per.setCorreo(request.getParameter("txtCorreo"));
                per.setDui(request.getParameter("txtDUI"));
                per.setSexo(request.getParameter("txtSexo"));
                per.setContacto(request.getParameter("txtContacto"));
                per.setIdCargo(idc);
                
                if(per.insertar()){
                    response.sendRedirect("views/pacientes.jsp");
                }else{
                    response.sendRedirect("views/pacientes.jsp?error");
                }
                break;
                
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                per.setId(id);
                per.eliminar();
                response.sendRedirect("views/pacientes.jsp");
                break;

            case "Guardar cambios":

                id = Integer.parseInt(request.getParameter("txtId"));

                per.setId(id);
                per.setNombre(request.getParameter("txtNombre"));
                per.setApellido(request.getParameter("txtApellido"));
                per.setTelefono(request.getParameter("txtTelefono"));
                per.setDireccion(request.getParameter("txtDireccion"));
                per.setCorreo(request.getParameter("txtCorreo"));
                per.setDui(request.getParameter("txtDUI"));
                per.setSexo(request.getParameter("txtSexo"));
                per.setContacto(request.getParameter("txtContacto"));

                if (per.modificar()) {
                    response.sendRedirect("views/pacientes.jsp");
                } else {
                    response.sendRedirect("views/pacientes.jsp?error");
                }
                break;
                default: 
                     response.sendRedirect("views/pacientes.jsp?error");
               break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
