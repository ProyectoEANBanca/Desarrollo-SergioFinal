<%-- 
    Document   : GrabarRetiro
    Created on : 18/11/2018, 09:55:06 AM
    Author     : Sergio Trabajo
--%>





<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bancacomercial.clase.Database.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <%
            {
        //try {
        String idcliente=request.getParameter("Vcliente");
        String Valor=request.getParameter("VValor");
        
        
        out.println(" Se ha retirado un valor de " + Valor + " de pesos a su cuenta con el número id "+idcliente );
        int vidcliente = Integer.parseInt(idcliente);
        int vvalor = Integer.parseInt(Valor);
        
        
        
       Database db = new Database();
    // nuestro script para la db
        String sql = "";
    // una variable de conexion
        Connection con;
        PreparedStatement pst;
    //donde voy a dejar los resultados de la consulta
        ResultSet rs;
         Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            // Cliente origen
            
            sql = "Update users set saldodisponible = saldodisponible - " + vvalor + " where idusuario = " +  vidcliente + ";";
            
           
      
          
            
            //sql = "Update clientes set producto =  '" + Valor + "' where id_cliente = 55555 ;";
            //preparar la consulta
            pst = con.prepareStatement(sql);
            // rs seria el nivel del usuario
    
            pst.executeUpdate();
            
            
            // rs seria el nivel del usuario
    
            
            
            out.println("¡Retiro registrado con éxito!");
       // } catch exception
                        // sql = "Update Transacciones set vlr = "+variablevlr + " WHERE id_cliente ="+variable_idcliente+" AND  ;
                    //else 
                        //error_al_insert;
                        
            //rs = pst.ex
            }
        %>                                           
      
    </body>
</html>



