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
public class Usuario {
    private String nombre; 
    private String password;

    public Usuario() {
    }
    public Usuario(String nombre, String pass){
        this.nombre=nombre;
        this.password=pass;  
    }
        
     public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
     public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
