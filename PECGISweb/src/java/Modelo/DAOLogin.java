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
   public boolean valide(){
       String SQL= "Select * from Usuario where usuario='"+super.getNombre()+"' and pass='"+super.getPassword()+"'";
       if (objConecta.validar(SQL)== false){
           return false;
       }
       else{
           return true; 
       }
   }
    
}
