package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Descuento_model;

/**
 * Document : descuento Created on : Jul 17, 2019, 10:05 AM Author : Alejandra
 * Díaz
 */
public class Decuento extends HttpServlet {

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

        String action = request.getParameter("action");
        Descuento_model per = new Descuento_model();

        switch (action) {
            case "Crear":

                per.setTipoDesc(request.getParameter("txtTipoDesc"));
                per.setPorcentaje(Double.parseDouble(request.getParameter("txtPorcentaje")));

                if (per.agregar()) {
                    response.sendRedirect("views/descuentos.jsp");
                } else {
                    response.sendRedirect("views/descuentos.jsp?error");
                }
                break;

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                per.setId(id);
                per.eliminar();
                response.sendRedirect("views/descuentos.jsp");
                break;

            case "Guardar cambios":
                id = Integer.parseInt(request.getParameter("txtId"));
                
                per.setId(id);
                per.setTipoDesc(request.getParameter("txtTipoDesc"));
                per.setPorcentaje(Double.parseDouble(request.getParameter("txtPorcentaje")));

                if (per.modificar()) {
                    response.sendRedirect("views/descuentos.jsp");
                } else {
                    response.sendRedirect("views/descuentos.jsp?error");
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
