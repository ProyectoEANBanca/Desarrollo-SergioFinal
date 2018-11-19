
package com.bancacomercial.clase.Database;

/**
 *
 * @author LENOVO
 * Primera clase para conexion a la base de datos
 */
public class Database {
    //credenciales de conexion
    //private final String conexionDirecta;
    
    private final String url;
    private final String user;
    private final String contra;
    private final String driver;

    public Database() {
        this.url = "jdbc:mysql://us-cdbr-iron-east-01.cleardb.net:3306/heroku_45299d59f23971d?zeroDateTimeBehavior=convertToNull";
        this.user = "b736df627cfd48";
        this.contra = "8db75918";
        this.driver = "com.mysql.jdbc.Driver";
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getContra() {
        return contra;
    }

    public String getDriver() {
        return driver;
    }

    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
    

    
}
