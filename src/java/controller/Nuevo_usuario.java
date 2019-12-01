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
import models.UsuarioN_model;

/**
 *
 * @author David Cordova
 */
public class Nuevo_usuario extends HttpServlet {

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
        int empleado = 0;
        int id = 0;
        int acceso = 0;
        String action = request.getParameter("action");
        UsuarioN_model per = new UsuarioN_model();

        switch (action) {
            case "Crear":

                empleado = Integer.parseInt(request.getParameter("txtEmp"));
                acceso = Integer.parseInt(request.getParameter("txtnivel"));

                per.setUsuario(request.getParameter("txtUs"));
                per.setPass(request.getParameter("txtPass"));
                per.setAcceso(acceso);
                per.setEmpleado(empleado);

                if (per.agregar()) {
                    response.sendRedirect("views/usuarios.jsp");
                } else {
                    response.sendRedirect("views/usuarios.jsp?error");
                }
                break;

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                per.setId(id);
                per.eliminar();
                response.sendRedirect("views/usuarios.jsp");
                break;

            case "Guardar cambios":
                id = Integer.parseInt(request.getParameter("txtId"));

                empleado = Integer.parseInt(request.getParameter("txtEmp"));
                acceso = Integer.parseInt(request.getParameter("txtnivel"));

                per.setUsuario(request.getParameter("txtUs"));
                per.setAcceso(acceso);
                per.setEmpleado(empleado);
                per.setId(id);
                if (per.modificar()) {
                    response.sendRedirect("views/usuarios.jsp");
                } else {
                    response.sendRedirect("views/usuarios.jsp?error");
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
