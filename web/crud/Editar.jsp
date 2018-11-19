<%-- 
    Document   : Editar
    Created on : 02/02/2018, 03:33:51 PM
    Author     : Joel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
        String url="jdbc:mysql://us-cdbr-iron-east-01.cleardb.net:3306/heroku_45299d59f23971d?zeroDateTimeBehavior=convertToNull";
       String Driver="com.mysql.jdbc.Driver";
       String user="b736df627cfd48";
       String clave="8db75918";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from persona where Id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("Id")%>"/>
                 Nombres:
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("Nombres")%>"/><br>
              
                DNI:
                <input type="text" name="txtDNI" class="form-control" value="<%= rs.getString("DNI")%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="principal.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String dni, nom;
       dni=request.getParameter("txtDNI");
       nom=request.getParameter("txtNom");
       if(nom!=null && dni!=null){
           ps=con.prepareStatement("update persona set Nombres='"+nom+"', DNI='"+dni+"'where Id="+id);
           ps.executeUpdate();
           response.sendRedirect("principal.jsp");
       }
       
       
%>
