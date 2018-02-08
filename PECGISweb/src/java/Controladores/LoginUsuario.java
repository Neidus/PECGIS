/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author wolfm
 */
public class LoginUsuario {
    //JDBC 
    java.sql.Connection con; // acceso al motor JDBC 
    java.sql.Statement st; // conectar a la base de datos
    java.sql.ResultSet res; // Procesar las consultas 
    
    //constructor de conesion a la base de datos
    public LoginUsuario (){
        try {
            try {
                Class.forName("org.postgresql.Driver"); //controlador   de la base de datos
                System.out.println("Conectado a la base de datos");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al conectar ");
            }
            con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","19941216");
        } catch (SQLException ex) {
            System.out.println("No se pudo conectar");
        }
    }
}
