<%-- 
    Document   : crearusuario
    Created on : 12/11/2018, 12:28:40 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ProductController" method="POST">
            <table>
                <thead>
                    <tr>
                        <th colspan="3">Crear Cliente Nuevo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre Completo
                        <td>:</td>
                        <td><input type="text" name="nombrecompleto"/></td>
                    </tr>
                    <tr>
                        <td>Usuario</td>
                        <td>:</td>
                        <td><input type="text" name="usuario"/></td>
                    </tr>
                    <tr>
                        <td>Contraseña</td>
                        <td>:</td>
                        <td><input type="password" name="constrasena1"/></td>
                    </tr>
                    <tr>
                        <td>Nivel</td>
                        <td>:</td>
                        <td><input type="number" name="nivel"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><input type="submit" name="insert" value="Insert"/></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                            <font color="green">
                            <c:if test="${sessionScope.sm != null}">
                                <c:out value="${sessionScope.sm}"/>
                                <c:remove scope="session" var="sm"/>
                            </c:if> 
                            </font>
                            <font color="red">
                            <c:if test="${sessionScope.em != null}">
                                <c:out value="${sessionScope.em}"/>
                                <c:remove scope="session" var="em"/>
                            </c:if> 
                            </font>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </body>
</html>
