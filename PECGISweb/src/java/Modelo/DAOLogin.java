/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

/**
 *
 * @author Sergio
 */
public class DAOLogin extends Usuario {
   Controladores.LoginUsuario objConecta; // atributo objeto conectar a la base de datos
   // constructor
   public DAOLogin(){
       objConecta=new Controladores.LoginUsuario(); 
   }
   public boolean insertar (String Nombre, String pass){
      if (valide(Nombre,pass)){
          return false;
      }
      else{
          String SQL="insert into usuario (usuario,pass) values('"+ Nombre +"','"+ pass + "')";
          objConecta.insertar(SQL); // ejecutamos la sentencia en postgresql
          return true;
      }
   }
   public boolean valide(String Nombre, String pass){
       String SQL= "Select * from usuario where usuario='"+ Nombre +"' and pass='"+ pass +"'";
       if (objConecta.validar(SQL)== false){
           return false;
       }
       else{
           return true; 
       }
   }
    
}
