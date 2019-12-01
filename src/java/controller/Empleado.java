/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Empleado_model;

/**
 *
 * @author David Cordova
 */
public class Empleado extends HttpServlet {

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
        Empleado_model per = new Empleado_model();

        switch (action) {
            case "Crear":
                idc = Integer.parseInt(request.getParameter("txtCargo"));

                per.setNombre(request.getParameter("txtNombre"));
                per.setApellido(request.getParameter("txtApellido"));
                per.setTelefono(request.getParameter("txtTelefono"));
                per.setCorreo(request.getParameter("txtCorreo"));
                per.setDireccion(request.getParameter("txtDireccion"));
                per.setDui(request.getParameter("txtDui"));
                per.setSexo(request.getParameter("txtSex"));
                per.setContacto(request.getParameter("txtTelm"));
                per.setIdCargo(idc);

                if (per.agregar()) {
                    response.sendRedirect("views/empleados.jsp");
                } else {
                    response.sendRedirect("views/empleados.jsp?error");
                }
                break;

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                per.setId(id);
                per.eliminar();
                response.sendRedirect("views/empleados.jsp");
                break;

            case "Guardar cambios":

                id = Integer.parseInt(request.getParameter("txtId"));
                idc = Integer.parseInt(request.getParameter("txtCargo"));

                per.setId(id);
                per.setIdCargo(idc);
                per.setNombre(request.getParameter("txtNombre"));
                per.setApellido(request.getParameter("txtApellido"));
                per.setTelefono(request.getParameter("txtTelefono"));
                per.setCorreo(request.getParameter("txtCorreo"));
                per.setDireccion(request.getParameter("txtDireccion"));
                per.setDui(request.getParameter("txtDui"));
                per.setSexo(request.getParameter("txtSex"));
                per.setContacto(request.getParameter("txtTelm"));

                if (per.modificar()) {
                    response.sendRedirect("views/empleados.jsp");
                } else {
                    response.sendRedirect("views/empleados.jsp?error");
                }
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
