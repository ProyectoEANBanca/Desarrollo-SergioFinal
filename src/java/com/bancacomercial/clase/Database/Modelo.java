/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bancacomercial.clase.Database;

//import AbstractModel;

//pendiente*****************************
import hibernate.AbstractModel;
import hibernate.Users;

/**
 *
 * @author LENOVO
// */
public class Modelo extends AbstractModel<Users>{
//////
//////    
//////    // traemos todos los datos de la super clase users que fue mapeada de la
   //base de datos
   public Modelo() {
       super(Users.class);
    }
 
}
