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
    
    //constructor de conexion a la base de datos
    public LoginUsuario (){
        try {
            try {
                Class.forName("org.postgresql.Driver"); //controlador   de la base de datos
                System.out.println("Conectado a la base de datos");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al conectar ");
            }
            // cadena de conexión, que le dice a postgres los datos para conectarse a la base de datos
            con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","#");
        } catch (SQLException ex) {
            System.out.println("No se pudo conectar");
        }
    }
    public void insertar (String sql){
        try {
            st=con.createStatement(); // se conecta a postgres
            java.sql.ResultSet rs=st.executeQuery(sql);
        } catch (SQLException ex) {
            System.out.println("Error al insertar" + ex.toString());
        }
    }
    public boolean validar(String sql){
        java.sql.ResultSet hoja_resultado = null;
        try {
            st=con.createStatement(); // conexion con postgres
            // mirar en la carpeta modelo DAOLogin
            hoja_resultado = st.executeQuery(sql); // ejecuta la instrucción SQL y almacena el resultado en una variable.
            if  (hoja_resultado.next()){ // Si los datos son correctos
                return true;
            }
            else{ // no esta registrado en la base de datos
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar");
            return false;
        }
    }
    
}
