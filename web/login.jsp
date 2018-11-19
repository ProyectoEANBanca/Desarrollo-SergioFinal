<%-- 
    Document   : login
    Created on : 20/10/2018, 03:16:48 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="stylesheet" href="js/login.js"/>
        <link rel="stylesheet" href="css/materialize.css"/>
        <link rel="stylesheet" href="js/materialize.js"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>JLogin</title>
    </head>
    <body>



        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Banca<span>Com</span></div>
        </div>
        <br>
        <div class="login" >
            <form action="SERVLOGIN" method="POST">
                <label class="entrada">Usuario</label><br>

                <input  type="text" placeholder="Usuario" name="txtusuario" ><br>

                <label class="entrada">Contraseña</label><br>
                <input  type="password" placeholder="password" name="txtcontr"><br>
                <input class="btn-floating btn-large pulse" type="submit" name="btnIniciar" value="Login">



            </form>

        </div>


        <%
            // los datos que recibe la vista del servlets
            HttpSession sesion = request.getSession();
            int nivel = 0;

            // validar el nivel del servlet
            if (request.getAttribute("nivel") != null) {
                // este valor nos llega como objeto y hat que pasarla a Integer
                nivel = (Integer) request.getAttribute("nivel");
                if (nivel == 1) {

                    // aqui vamos a crear la variale la session
                    sesion.setAttribute("nombre", request.getAttribute("nombre"));
                    sesion.setAttribute("nivel", nivel);
                    //si es adminstrador lo redirecionamos a la pagina del administrador
                    response.sendRedirect("Admin/admin.jsp");

                }

                if (nivel == 2) {

                    // aqui vamos a crear la variale la session
                    sesion.setAttribute("nombre", request.getAttribute("nombre"));
                    sesion.setAttribute("nivel", nivel);
                    //si es adminstrador lo redirecionamos a la pagina del administrador
                    response.sendRedirect("Admin/usuario.jsp");

                }
            }

            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                //sesion.invalidate();
            }


        %>



    </body>
</html>
