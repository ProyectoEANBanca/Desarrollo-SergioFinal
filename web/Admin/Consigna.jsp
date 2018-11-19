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
        <form action="GrabarConsigna.jsp" method="post">
        <h1>Datos de la Consigna</h1>
        
        <td><label for="Vcliente">Identificación de tu cuenta  </label></td>
        <input type="text" name="Vcliente" id="Identificacion del cliente"><br>
        
        <td><label for="Vcliente">Valor a consignar  </label></td>
        <input type="text" name="VValor" id="Valor a consignar"><br>
        
        <td><label for="Vcliente">Valor a consignar  </label></td>
        <input type="text" name="VValor" id="Valor a consignar"><br>
                 
        <tr>
        <td colspan="2" align="center"><input type="submit" name="button" id="button" value="Transferir"></td>
        </tr>
                             
        </form>
    </body>
</html>

