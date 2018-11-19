<%-- 
    Document   : admin
    Created on : 21/10/2018, 10:16:07 PM
    Author     : SERGIO Y CAMILO
--%>

<%@page import="com.bancacomercial.clase.Database.Modelo"%>
<!--https://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/c/tld-summary.html-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="hibernate.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%

    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect("../login.jsp");

    } else {
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("1")) {
            response.sendRedirect("../login.jsp");
        }

    }


%>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- font awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous"/>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link rel="stylesheet" href="../css/usuario.css"/>
        <link rel="stylesheet" href="../js/admin.js"/>

        <title>DashBoard Cliente</title>

        <style>
            header{
                background: url(img/inicio.jpg);
                background-color: yellow;
                background-size: cover;
                background-position: center;
                min-height: 1000px;
            }
            @media screen and (max-width: 670px){
                header{
                    min-height: 500px;
                }
            }
            .section{
                padding-top: 4vw;
                padding-bottom: 4vw;
            }
            .tabs .indicator{
                background-color: #1a237e;
            }
            .tabs .tab a:focus, .tabs .tab a:focus.active{
                background: transparent;
            }
            .color{
                color: #1a237e;
            }
            .brand-logo{
                color: #1a237e !important;
            }
            .usuario{
                color:tomato;
            }

        </style>
    </head>
    <body >

        <!-- navbar -->
        <header>
            <img src="">
            <nav class="nav-wrapper transparent">
                <div class="container">

                    <div class="chip">
                        <i class="fas fa-child">Administrador@</i>
                        <%= sesion.getAttribute("nombre")%>
                    </div>

<!--                    <a href="#" class="brand-logo color ">Bienvenido <%= sesion.getAttribute("nombre")%></a>-->
                    <a href="#" class="sidenav-trigger" data-target="mobile-menu">
                        <i class="material-icons">menu</i>
                    </a>
                    <ul class="right hide-on-med-and-down">
                        <li><a class="color"  href="#photos">Servicios</a></li>
                        <li><a class="color" href="#services">Plataforma</a></li>
                        <li><a class="color" href="#contact">Nostros</a></li>


                        <li><a href="../index.html" class="tooltipped btn-floating btn-small indigo darken-4" data-position="bottom" data-tooltip="Inicio">
                                <i class="fas fa-users"></i>
                            </a></li>
                        <li><a href="../login.jsp?cerrar=true" class="tooltipped btn-floating btn-small indigo darken-4" data-position="bottom" data-tooltip="Cerra Sesion">
                                <i class="fas fa-sitemap"></i>
                            </a></li>

                    </ul>
                    <ul class="sidenav grey lighten-2" id="mobile-menu">
                        <li><a href="#">Photo's</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>


                    <div class="progress">
                        <div class="indeterminate"></div>
                    </div>
                </div>
            </nav>





            <!--Aqui vamos agregar las grid para los modulos--> 
            <div id="content">
                <main>

                </main>
                <section>
                    <table cellpadding="2" cellspacing="2" border="1">
                        <!--
                                                private Integer idusuario;
                                                private String nombreCompleto;
                                                private String usuario;
                                                private String contrasena;
                                                private int nivel;
                                                private Date fecha;-->
                        <% Modelo model = new Modelo();%>

                        <tr>
                            <th>
                                idusuario   
                            </th>
                            <th>
                                NombreCompleto   
                            </th>
                            <th>
                                Usuario   
                            </th>
                            <th>
                                Contraseña   
                            </th>
                            <th>
                                Nivel   
                            </th>
                            <th>
                                Fecha de Registro   
                            </th>
                            <th>
                                Saldo Disponible  
                            </th>

                        </tr>

                        <c:forEach var="p" items="<%= model.findAll()%>">

                            <tr>
                                <td>${p.idusuario}</td>
                                <td>${p.nombreCompleto}</td>
                                <td>${p.usuario}</td>
                                <td>${p.contrasena}</td>
                                <td>${p.nivel}</td>
                                <td>${p.fecha}</td>
                                <td>${p.saldodisponible}</td>
                            </tr>

                        </c:forEach> 

                    </table>
                </section>
                        <aside>
                     
                            <a href="../crud/principal.jsp" class="waves-effect waves-light btn-large"><i class="material-icons left">cloud</i>button</a>
   
                            
                        </aside>
                <nav>Nav</nav>
                <footer>Footer</footer>

            </div>






        </header>
        <!-- Compiled and minified JavaScript -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.materialboxed').materialbox();
                $('.parallax').parallax();
                $('.tabs').tabs();
                $('.datepicker').datepicker({
                    disableWeekends: true,
                    yearRange: 1
                });
                $('.tooltipped').tooltip();
                $('.scrollspy').scrollSpy();
            });
        </script>


    </body>
</html>
