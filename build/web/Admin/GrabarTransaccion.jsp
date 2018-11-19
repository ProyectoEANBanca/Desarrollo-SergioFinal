<%-- 
    Document   : GrabarTransaccion
    Created on : 18/11/2018, 08:39:43 AM
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
        
        String idclientedest=request.getParameter("VclienteD");
        out.println("datos escogidos "+idcliente + " VLR " + Valor );
        int vidcliente = Integer.parseInt(idcliente);
        int vvalor = Integer.parseInt(Valor);
        
        int vidclientedest = Integer.parseInt(idclientedest);
        
       Database db = new Database();
    // nuestro script para la db
        String sql,sql1 = "";
    // una variable de conexion
        Connection con;
        PreparedStatement pst;
    //donde voy a dejar los resultados de la consulta
        ResultSet rs;
         Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            // Cliente origen
            sql = "Update users set saldodisponible = saldodisponible - " + vvalor + " where idusuario = " +  vidcliente + ";";
            
            // Cliente destino
            sql1 = "Update users set saldodisponible = saldodisponible + " + vvalor + " where idusuario = " +  vidclientedest + ";";
            
            //sql = "Update clientes set producto =  '" + Valor + "' where id_cliente = 55555 ;";
            //preparar la consulta
            pst = con.prepareStatement(sql);
            // rs seria el nivel del usuario
    
            pst.executeUpdate();
            
            //Cliente destino
            pst = con.prepareStatement(sql1);
            // rs seria el nivel del usuario
    
            pst.executeUpdate();
            
            out.println("Consignación registrada con éxito");
       // } catch exception
                        // sql = "Update Transacciones set vlr = "+variablevlr + " WHERE id_cliente ="+variable_idcliente+" AND  ;
                    //else 
                        //error_al_insert;
                        
            //rs = pst.ex
            }
        %>                                           
      
    </body>
</html>

