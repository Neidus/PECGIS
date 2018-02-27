/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.*;

/**
 *
 * @author Varela
 */
public class Ruta {
    
    private Connection conexion;
    private Statement sentencia;
    private ResultSet resultado;
    
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
    
    public String getRuta() {
        String objetosGeoJSON=""; 
        System.out.println("Estoy en service");
         //Hacemos la consulta para obtener los datos de la BBDD en formato objeto GeoJSON
        try
        {
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery("SELECT ST_AsGeoJSON(geom) FROM rutas;");
             System.out.println("Estoy en service2");
             
             
             if (resultado.next()) {   //Guardamos el conjunto de elementos geométricos en el String
                                // que será devuelto al jsp mediante el controlador que llama a esta funcion
                 objetosGeoJSON +="[" + resultado.getString(1) + "\n";
                 while (resultado.next())
                 {
                     objetosGeoJSON += "," + resultado.getString(1) + "\n";   
                 }
                 objetosGeoJSON+="]";
                 System.out.println("String final obtenido: " + objetosGeoJSON);
             } else {
                 System.out.println("No hay puntos!!!!"); //La consulta esta vacía de elementos
                 
             }
            //cerramos las conexiones
            resultado.close();
            sentencia.close();
        }catch(Exception e){
            System.out.println("No lee de la tabla: "+ e);
        }
        
        return objetosGeoJSON;
    }
    
    /*
        Recibiendo un string en formato json con los elementos "lat" y "lng" lo pasa a geoJson
    */
    public String JsonToGeoJson(String json) {
        String[] partido = json.substring(1, json.length()-2).split("},");
        
        String geoJson = "{\"type\": \"LineString\",\n\"coordinates\": [";
        for (int i=0; i<partido.length; i++) {
            
            String[] coordenadas = partido[i].substring(1).split(",");
            geoJson += "[" + coordenadas[0].substring(6) + ", ";
            geoJson += coordenadas[1].substring(6) + "]\n,";
        }
        geoJson = geoJson.substring(0, geoJson.length()-1) + "]}";
        
        System.out.println(geoJson);
        return geoJson;
    }
    
    /*
        Dado un nombre de ruta, la ruta y el usuario se inserta una ruta en la BBDD
    */
    public void insertruta (String ruta){
    try { 
        sentencia.execute("INSERT INTO rutas(nombre, usuario, geom) VALUES ('nombre', 'pepe', ST_SetSRID(ST_GeomFromGeoJSON('" + ruta + "'),4326));");
        } catch (Exception er) { 
             JOptionPane.showMessageDialog(null, "Lo sentimos su operación solicitada no se pudo realizar debido a un error de " + er); 
        }       
    }
    
    
   
    
    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (Exception e){}
    }
}
