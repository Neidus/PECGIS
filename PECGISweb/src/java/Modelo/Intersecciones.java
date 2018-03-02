/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author fernando.garcia
 */
public class Intersecciones {
    private Connection conexion;
    private Statement sentencia;
    private ResultSet resultado;
    
    private String nombreruta;    
    private String nombrezona;
    private String distancia;
    private String peligrosidad;
    
     public void abrirConexion() {
        try
        {
            Class.forName("org.postgresql.Driver"); 
            conexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","1234"); 
            sentencia = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
            System.out.println("Se ha conectado");
        }catch(Exception e){
            System.out.println("No se ha conectado:" + e);
        }
    }  
     
    /*Insertar intersecciones --  Todavia no esta implementado*/ 

    public void insertInterseccion (String ruta,String zona,String geom, String distancia, String Peligrosidad, String usuario){
    try { 
        sentencia.execute("INSERT INTO intersecciones(nombre, usuario, geom) VALUES ('"+ ruta +"', '"+ usuario +"', ST_SetSRID(ST_GeomFromGeoJSON('" + ruta + "'),4326));");
        } catch (Exception er) { 
             JOptionPane.showMessageDialog(null, "Lo sentimos su operación solicitada no se pudo realizar debido a un error de " + er); 
        }       
    }
    
    /*
        Obtenemos una lista de intersecciones de una ruta de un usuario concreto
    */
    public List<Intersecciones> getListaIntersecciones( String nombreUsuario, String ruta) {
        List<Intersecciones> lista = new ArrayList<Intersecciones>();
        try {
            
            lista.clear();
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery("SELECT ruta, zona, distancia, peligrosidad FROM intersecciones WHERE usuario='" + nombreUsuario +"' AND ruta='"+ruta+"';");
            
            
            
            while (resultado.next()) { //Guardamos los nombres e ids en una lista
                Intersecciones aux = new Intersecciones();
                aux.setNombreruta(resultado.getString(1));
                aux.setNombrezona(resultado.getString(2));
                aux.setDistancia(resultado.getString(2));
                aux.setPeligrosidad(resultado.getString(2));
                lista.add(aux);
            }
            
           
        } catch (SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }     
     
     
     
   public void cerrarConexion() {
        try {
            conexion.close();
        } catch (Exception e){}
    }

    public void setNombreruta(String nombreruta) {
        this.nombreruta = nombreruta;
    }

    public void setNombrezona(String nombrezona) {
        this.nombrezona = nombrezona;
    }

    public void setDistancia(String distancia) {
        this.distancia = distancia;
    }

    public void setPeligrosidad(String peligrosidad) {
        this.peligrosidad = peligrosidad;
    }

    public String getNombreruta() {
        return nombreruta;
    }

    public String getNombrezona() {
        return nombrezona;
    }

    public String getDistancia() {
        return distancia;
    }

    public String getPeligrosidad() {
        return peligrosidad;
    }

}
