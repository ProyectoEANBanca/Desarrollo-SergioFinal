<%-- 
    Document   : admin
    Created on : 21/10/2018, 10:16:07 PM
    Author     : SERGIO Y CAMILO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%

    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect("../login.jsp");

    } else {
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("2")) {
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
                        <i class="fas fa-child">Usuari@</i>
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

                    <!--implementando nuestra tarjeta de credito-->

                    <div class="card">
                        <div class="card__front card__part">
                            <img class="card__front-square card__square" src="https://image.ibb.co/cZeFjx/little_square.png">
                            <img class="card__front-logo card__logo" src="https://www.fireeye.com/partners/strategic-technology-partners/visa-fireeye-cyber-watch-program/_jcr_content/content-par/grid_20_80_full/grid-20-left/image.img.png/1505254557388.png">
                            <p class="card_numer">1245 1548 1254 6258</p>
                            <div class="card__space-75">
                                <span class="card__label">Card holder</span>
                                <p class="card__info"><%= sesion.getAttribute("nombre")%></p>
                            </div>
                            <div class="card__space-25">
                                <span class="card__label">Expires</span>
                                <p class="card__info">10/25</p>
                            </div>
                        </div>

                        <div class="card__back card__part">
                            <div class="card__black-line"></div>
                            <div class="card__back-content">
                                <div class="card__secret">
                                    <p class="card__secret--last">420</p>
                                </div>
                                <img class="card__back-square card__square" src="https://image.ibb.co/cZeFjx/little_square.png">
                                <img class="card__back-logo card__logo" src="https://www.fireeye.com/partners/strategic-technology-partners/visa-fireeye-cyber-watch-program/_jcr_content/content-par/grid_20_80_full/grid-20-left/image.img.png/1505254557388.png">

                            </div>
                        </div>

                    </div>


                </main>


                <section>
                    <div class="login" style="background-color: #fff !important ">


                        <!--                        //implementar transaciones -->
                        <form action="Transaccion.jsp">
                            <p>
                                <label>
                                    <input type="submit" value="TRANSACCIONES EN LINEA"/>
                                    <span></span>
                                </label>
                            </p>
                        </form>
                            <form action="Retiro.jsp">
                            <p>
                                <label>
                                    <input type="submit" value="CONSULTAS"/>
                                    <span></span>
                                </label>
                            </p>
                        </form>
                        <form action="Pagos.jsp">
                            <p>
                                <label>
                                    <input type="submit" value="PAGO DE CUENTA"/>
                                    <span></span>
                                </label>
                            </p>
                        </form>
                        <form action="Reporte.jsp">
                            <p>
                                <label>
                                    <input type="submit" value="DESCARGAR REPORTES"/>
                                    <span></span>
                                </label>
                            </p>
                        </form>



                    </div>
                    


                    <%
                        // los datos que recibe la vista del servlets
                        //HttpSession sesion = request.getSession();
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
                                response.sendRedirect("Admin/usuario.jsp");

                            } else if (nivel == 2) {
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




                </section>
                <aside>Aside</aside>
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
