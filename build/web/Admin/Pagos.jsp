<%-- 
    Document   : Retiro
    Created on : 17/11/2018, 10:39:18 PM
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
        
        <form action="GrabarPagos.jsp" method="post">
        <h1>PAGOS</h1>
        
        <td><label for="Vcliente">Identificación de tu cuenta  </label></td>
        <input type="text" name="Vcliente" id="Identificacion del cliente"><br>
        
        <td><label for="VValor">Valor a retirar  </label></td>
        <input type="text" name="VValor" id="Valor a retirar"><br>
        
        
         
        <tr>
        <td colspan="2" align="center"><input type="submit" name="button" id="button" value="Retirar"></td>
        </tr>
                             
        </form>
    </body>
</html>

