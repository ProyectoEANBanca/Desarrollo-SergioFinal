/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bancacomercial.clase.Database;

import java.sql.*;
import java.util.Calendar;

/**
 *
 * @author LENOVO Esta clase nos permite tener todos los metodos para validar
 * los usarios
 */
public class Acceso {

    Database db = new Database();
    // nuestro script para la db
    String sql = "";
    // una variable de conexion
    Connection con;
    PreparedStatement pst;
    //donde voy a dejar los resultados de la consulta
    ResultSet rs;

    //constructor 
    public Acceso() {

    }

    // metodo para validar el nivel del usuario que se 
    public int validar(String usuario, String contra) {
        int nivel = 0;

        //levantamos la conexion con nuesta db
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            sql = "select nivel from users where usuario='" + usuario + "' and contrasena='" + contra + "'";
            //preparar la consulta
            pst = con.prepareStatement(sql);
            // rs seria el nivel del usuario
            rs = pst.executeQuery();
            // reconrremos todos los resultados que nos trajo la consulta
            while (rs.next()) {
                //obtenemos el indice de la tabla de datos con el nivel del usuario
                nivel = rs.getInt(1);
                nivel = rs.getInt(2);

            }

            //nos desconectamos
            con.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException e) {
            return nivel;
            //e.printStackTrace();

        }
        //devolvemos el nivel de ese usuario con esa contraseña 
        return nivel;

    }

    public int ingresoDatos(int idcliente, int nProducto, int tipo, int valor, int nfactura) throws SQLException, ClassNotFoundException {

        int nivel = 2;
        

        try {

            // create a sql date object so we can use it in our INSERT statement
            Calendar calendar = Calendar.getInstance();
            java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());

            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());

            String query = " insert into transaciones (id_cliente , numero_producto, tipo_transaccion, fecha, valor, id_usuario,nro_fact)"
                    + " values (?, ?, ?, ?, ?,?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, idcliente);
            preparedStmt.setInt(2, nProducto);
            preparedStmt.setInt(3, tipo);
            preparedStmt.setDate(3, startDate);
            preparedStmt.setInt(5, valor);
            preparedStmt.setInt(5, 41);
            preparedStmt.setInt(7, nfactura);

            // execute the preparedstatement
            preparedStmt.execute();
            //nos desconectamos
            con.close();
            rs.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
            System.out.println("Se inserto la actualizacion a la base de datos");

        }
        return 2;
    }
  

}
