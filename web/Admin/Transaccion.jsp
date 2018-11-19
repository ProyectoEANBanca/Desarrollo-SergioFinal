<%-- 
    Document   : Transaccion
    Created on : 17/11/2018, 10:39:41 PM
    Author     : Sergio Trabajo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

    HttpSession sesion = request.getSession();
    
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page <></title>
    </head>
    <body>
        
        <form action="GrabarTransaccion.jsp" method="post">
        <h1>Datos de la Transacción</h1>
        
                
        <td><label for="Vcliente">Valor a transferir  </label></td>
        <input type="text" name="VValor" id="Valor a consignar"><br>
        
        <td><label for="Vcliente">Identificación de la cuenta a transferir  </label></td>
        <input type="text" name="VclienteD" id="Identificacion del cliente Destinatario "><br>
        
        <td><label for="Vcliente">Usuario  </label></td>
        <input type="text" name="VValor" id="Nombre de usuario"><br>
        
        <td><label for="Vcliente">Ciudad/País  </label></td>
        <input type="text" name="VValor" id="Ciudad o país"><br>
        
        <td><label for="Vcliente">Valor a transferir  </label></td>
        <input type="text" name="VValor" id="Valor a consignar"><br>
         
        <tr>
        <td colspan="2" align="center"><input type="submit" name="button" id="button" value="Transferir"></td>
        </tr>
                             
        </form>
    </body>
</html>

