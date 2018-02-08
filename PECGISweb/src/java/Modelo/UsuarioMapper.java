/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.*;

/**
 *
 * @author Sergio
 */
public class UsuarioMapper {
    public static void main (String[] args){
        final String URL="jdbc:postgresql://localhost:5432/mbbdda";
        final String DRIVER="org.postgresql.Driver";
        final String USUARIO="postgres";
        final String CLAVE="19941216";
        Connection con;
        try{
            Class.forName(DRIVER); 
            try{
                con=DriverManager.getConnection(URL, USUARIO, CLAVE);
                String sql="SELECT * FROM Usuario";
                
            } catch (Exception e){
                
            }
        } catch (ClassNotFoundException e){
            System.out.println(e.getMessage());
        }
    }
    
}
