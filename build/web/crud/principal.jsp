<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css " rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net:3306/heroku_45299d59f23971d?zeroDateTimeBehavior=convertToNull";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "b736df627cfd48";
            String clave = "8db75918";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            //estamos consultando la base de datos de users
            rs = smt.executeQuery("select * from users");
            //Creamo la Tabla:     
        %>
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal"> Agregar Nuevo Cliente</button>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" value="Buscar"/>                            
            </div>
        </div>  

        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <table class="table table-bordered"  id="tablaDatos">
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th>Nombre Competo</th>
                        <th class="text-center">Usuario</th>
                        <th class="text-center">Contraseña</th>
                        <th class="text-center">nivel</th>
                        <th class="text-center">SaldoDisponible</th>
                    </tr>
                </thead>
                <tbody id="tbodys">
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getInt("idusuario")%></td>
                        <td><%= rs.getString("nombreCompleto")%></td>
                        <td class="text-center"><%= rs.getString("usuario")%></td>
                        <td class="text-center"><%= rs.getString("contrasena")%></td>
                        <td class="text-center"><%= rs.getInt("nivel")%></td>
                        <td class="text-center"><%= rs.getInt("saldodisponible")%></td>
                        <td class="text-center">

                            <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                            <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                            <a href="Editar.jsp?id=<%= rs.getInt("idusuario")%>" class="btn btn-primary">Editar</a>
                            <a href="Delete.jsp?id=<%= rs.getInt("idusuario")%>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%}%>
            </table>
        </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Nombres:</label> 
                                <input type="text" name="txtNom" class="form-control"/>
                                <br>

                                <label>Usuario:</label> 
                                <input type="text" name="txtUsuario" class="form-control"/> 
                                <br>
                                <label>Contraseña </label> 
                                <input type="text" name="txtContrasena" class="form-control"/>

                                <br>
                                <label>Nivel:</label> 
                                <input type="number" name="txtNivel" class="form-control"/> 
                                <br>
                                <label>Saldo Disponible</label> 
                                <input type="number" name="txtSaldo" class="form-control"/> 





                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                String nombreCompleto, usuario, contrasena;
                int nivel, saldoDisponible;
                nombreCompleto = request.getParameter("txtNom");
                usuario = request.getParameter("txtUsuario");

                contrasena = request.getParameter("txtContrasena");

                nivel = Integer.parseInt(request.getParameter("txtNivel"));
                
                saldoDisponible = Integer.parseInt(request.getParameter("txtSaldo"));
                
          // queda pendiente por errores 

             
            %>
        </div>        
        <script src="../js/jquery.js" type="text/javascript"></script>             
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>
