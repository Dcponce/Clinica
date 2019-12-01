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
import models.Citas_model;

/**
 *
 * @author David Cordova
 */
public class Citas extends HttpServlet {

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
        String[] servicio;

        String action = request.getParameter("action");
        Citas_model ci = new Citas_model();

        switch (action) {
            case "Crear":
                servicio = request.getParameterValues("txtServicio");

                ci.setIdPaciente(Integer.parseInt(request.getParameter("txtPaciente")));
                ci.setIdDoctor(Integer.parseInt(request.getParameter("txtDentista")));
                ci.setFecha(request.getParameter("txtFecha"));
                ci.setHora(request.getParameter("txthora"));
                ci.setIdsServicios(servicio);

                if (ci.agregar()) {
                    response.sendRedirect("views/cita.jsp");
                } else {
                    response.sendRedirect("views/cita.jsp?error");
                }
                break;

            case "Enviar":
                servicio = request.getParameterValues("txtServicio");

                ci.setIdPaciente(Integer.parseInt(request.getParameter("id_paciente")));
                ci.setIdDoctor(Integer.parseInt(request.getParameter("txtDentista")));
                ci.setFecha(request.getParameter("txtFecha"));
                ci.setHora(request.getParameter("txthora"));
                ci.setIdsServicios(servicio);

                if (ci.agregar()) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("index.jsp?error");
                }
                break;

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                ci.setId(id);
                if (ci.eliminar()) {

                } else {
                    response.sendRedirect("views/cita.jsp?error");
                }
                break;

            case "Guardar cambios":
                id = Integer.parseInt(request.getParameter("txtId"));

                servicio = request.getParameterValues("txtServicio");

                ci.setIdPaciente(Integer.parseInt(request.getParameter("txtpa")));
                ci.setIdDoctor(Integer.parseInt(request.getParameter("txtden")));
                ci.setFecha(request.getParameter("txtFec"));
                ci.setHora(request.getParameter("txthora"));
                ci.setIdsServicios(servicio);
                ci.setId(id);

                if (ci.modificar()) {
                    response.sendRedirect("views/cita.jsp");
                } else {
                    response.sendRedirect("views/cita.jsp?error");
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
