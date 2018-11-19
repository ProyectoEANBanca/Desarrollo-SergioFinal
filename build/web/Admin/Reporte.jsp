<%-- 
    Document   : Reporte
    Created on : 18/11/2018, 04:11:32 PM
    Author     : Sergio Trabajo
--%>

<%-- 
    Document   : Retiro
    Created on : 17/11/2018, 10:39:18 PM
    Author     : Sergio Trabajo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<!DOCTYPE html>
<%-- 
    Document   : Retiro
    Created on : 17/11/2018, 10:39:18 PM
    Author     : Sergio Trabajo
--%>


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
        
        <form action="GrabarRetiro.jsp" method="post">
        <h1>DESCARGAR REPORTES</h1>
        
        <td><label for="Vcliente">Tipo de Reporte  </label></td>
        <input type="text" name="Vcliente" id="Tipo Reporte"><br>
        
        <td><label for="VValor">Cuenta Crédito  </label></td>
        <input type="text" name="VValor" id="Cuenta Credito"><br>
        
        <td><label for="VValor">Cuenta Debito  </label></td>
        <input type="text" name="VValor" id="Cuenta Debito"><br>
        
        <td><label for="VValor">Pagos mensuales  </label></td>
        <input type="text" name="VValor" id="pagos mensuales"><br>
        
        
         
        <tr>
        <td colspan="2" align="center"><input type="submit" name="button" id="button" value="Retirar"></td>
        </tr>
                             
        </form>
    </body>
</html>



