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
import models.Servicio_model;

/**
 *
 * @author David Cordova
 */
public class Servicio extends HttpServlet {

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

        String action = request.getParameter("action");
        Servicio_model ser = new Servicio_model();

        switch (action) {
            case "Crear":
                
                ser.setNombre(request.getParameter("txtSer"));
                ser.setPrecio(Double.parseDouble(request.getParameter("txtPre")));
                
                if(ser.agregar()){
                    response.sendRedirect("views/servicio.jsp");
                }else{
                    response.sendRedirect("views/servicio.jsp?error");
                }
                break;
            case "delete":
                
                ser.setId(Integer.parseInt(request.getParameter("id")));
                
                if(ser.eliminar()){
                    response.sendRedirect("views/servicio.jsp");
                }else{
                    response.sendRedirect("views/servicio.jsp?error");
                }
                break;
            case "Guardar cambios":
                
                ser.setId(Integer.parseInt(request.getParameter("txtId")));
                ser.setNombre(request.getParameter("txtSer"));
                ser.setPrecio(Double.parseDouble(request.getParameter("txtPre")));
                
                if(ser.modificar()){
                    response.sendRedirect("views/servicio.jsp");
                }else{
                    response.sendRedirect("views/servicio.jsp?error");
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
