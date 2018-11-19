/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bancacomercial.servlets;

import com.bancacomercial.clase.Database.Modelo;
import hibernate.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class ProductController extends HttpServlet {

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
        
        PrintWriter out = response.getWriter();
        
        if (request.getParameter("insert") != null) {
            
            String nombrecompleto = request.getParameter("nombrecompleto");
            String usuario = request.getParameter("usuario");
            String constrasena1 = request.getParameter("constrasena1");
            int nivel = Integer.parseInt(request.getParameter("nivel"));
            
            Users clientenuevo = new Users();
            clientenuevo.setNombreCompleto(nombrecompleto);
            clientenuevo.setUsuario(usuario);
            clientenuevo.setContrasena(constrasena1);
            clientenuevo.setNivel(nivel);
            
            //verificar esta linea
            boolean status = new Modelo().create(clientenuevo);
             if(status){
               request.getSession().setAttribute("sm", "Product saved successfully");
           }else{
               request.getSession().setAttribute("em", "Product not sved");
           }
           
           request.getRequestDispatcher("/insert.jsp").forward(request, response);
            
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
