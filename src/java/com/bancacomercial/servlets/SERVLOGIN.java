
package com.bancacomercial.servlets;

import com.bancacomercial.clase.Database.Acceso;


//pendiente***********************
import hibernate.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class SERVLOGIN extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // tengo la vista // controlador // modelo
            //vamos a obtener los valores del formulario por medio de su name en los inputs
            
            String nombre;
            String contra;
            int nivel = 0;

            
            //un objeto de tipo aceeso
            Acceso acc = new Acceso();
            // usario de hibernate
            Users usuario = new Users();
            
            //despachador de solicitar, encaminar las respuestas del servlets
            RequestDispatcher rd =null;
            
            if(request.getParameter("btnIniciar") != null){
                
                nombre = request.getParameter("txtusuario");
                contra = request.getParameter("txtcontr");
                
                //validacion el nivel del usuario que ingresa
                // si es 0 el usuario no existe
                // si es 1 es administrador
                //si es 2 es un usuario
                nivel = acc.validar(nombre, contra);
       
       
                
                
                //mandar parametros a la vista
                request.setAttribute("nivel", nivel);
                request.setAttribute("nombre", nombre);
     
                //la comunicacion va hacer con login
                rd = request.getRequestDispatcher("login.jsp");
                
            
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
