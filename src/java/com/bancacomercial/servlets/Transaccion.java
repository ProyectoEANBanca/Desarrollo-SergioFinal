package com.bancacomercial.servlets;

import com.bancacomercial.clase.Database.Acceso;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Transaccion", urlPatterns = {"/Transaccion"})
public class Transaccion extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int idcliente;
            int producto;
            int tipo;
            int facturas;
            int valor;
            int nivel = 0;
            int transaciones = 0;

            //un objeto de tipo aceeso
            Acceso acc = new Acceso();
            // usario de hibernate
            //Users usuario = new Users();

            //despachador de solicitar, encaminar las respuestas del servlets
            RequestDispatcher rd = null;

            if (request.getParameter("btnIniciar") != null) {

                idcliente = Integer.getInteger(request.getParameter("idcliente"));
                producto = Integer.getInteger(request.getParameter("producto"));
                tipo = Integer.getInteger(request.getParameter("tipo"));
                valor = Integer.getInteger(request.getParameter("valor"));
                facturas = Integer.getInteger(request.getParameter("nfacturas"));

                try {
                    //validacion el nivel del usuario que ingresa
                    // si es 0 el usuario no existe
                    // si es 1 es administrador
                    //si es 2 es un usuario
                    acc.ingresoDatos(idcliente, producto, tipo, valor, facturas);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Transaccion.class.getName()).log(Level.SEVERE, null, ex);
                }
                //la comunicacion va hacer con login
                rd = request.getRequestDispatcher("Admin/usuario.jsp");
            }

            rd.forward(request, response);


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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Transaccion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Transaccion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
