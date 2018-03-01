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
 * @author Varela
 */
public class Zona {
    private Connection conexion;
    private Statement sentencia;
    private ResultSet resultado;
    
    private String id;
    private String peligrosidad;
    private String zona;
    
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
        String[] partido = json.substring(1, json.length()-2).split("},\\{");
        
        String geoJson = "{\"type\": \"Polygon\",\n\"coordinates\": [[";
        for (int i=0; i<partido.length; i++) {
            
            String[] coordenadas = partido[i].substring(1).split(",");
            geoJson += "[" + coordenadas[1].substring(6) + ", ";
            geoJson += coordenadas[0].substring(5) + "]\n, ";
        }
        geoJson = geoJson.substring(0, geoJson.length()-1) + "]]}";
        System.out.println("geoJson adaptado para la bbdd:" + geoJson);
        return geoJson;
    }
    
    /*
        Dado un nombre de ruta, la ruta y el usuario se inserta una ruta en la BBDD
    */
    public void insertZona (String zona, String peligrosidad){
    try { 
        
        sentencia.execute("INSERT INTO zonas(peligrosidad,geom) VALUES (" +peligrosidad +", ST_SetSRID(ST_GeomFromGeoJSON('" + zona + "'),4326));");
        } catch (Exception er) { 
             JOptionPane.showMessageDialog(null, "Lo sentimos su operación solicitada no se pudo realizar debido a un error de " + er); 
        }       
    }
    
    public List<Zona> getListaZonas() {
      
        List<Zona> lista = new ArrayList<Zona>();
        try {
            
            lista.clear();
            sentencia = conexion.createStatement();
            resultado = sentencia.executeQuery("SELECT gid_serial,peligrosidad,ST_AsGeoJSON(geom) FROM zonas;");
            
            
            
            while (resultado.next()) { //Guardamos los ids valores de peligrosidad y geojson de las zonas en una lista
                Zona aux = new Zona();
                aux.setId(resultado.getString(1));
                aux.setPeligrosidad(resultado.getString(2));
                aux.setZona("[" + resultado.getString(3) + "]");
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPeligrosidad() {
        return peligrosidad;
    }

    public void setPeligrosidad(String peligrosidad) {
        this.peligrosidad = peligrosidad;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }
    
    
}
