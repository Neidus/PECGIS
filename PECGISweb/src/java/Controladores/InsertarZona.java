/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Varela
 */
public class InsertarZona extends HttpServlet {

       Modelo.Zona z;
    

    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
       z = new Modelo.Zona();
       z.abrirConexion();
    }

    /*
        Se ejecuta tras el init cada vez que lo llamamos.
    */
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
         HttpSession sesion = req.getSession();
        
        String json = req.getParameter("zonas"); 
        String peligrosidades = req.getParameter("peligrosidades");
        
        //System.out.println("json quitando extremos: " + json.substring(2, json.length()-3));
        String[] listaZonas = json.substring(2, json.length()-2).split("]],\\[\\["); //Dividimos la cadena en los conjuntos de coordenadas de cada zona en formato json
        String[] listaPeligrosidad = peligrosidades.split(","); //obtenemos cada peligrosidad por separado.
        
        for (int i=0; i< listaZonas.length; i++) {
            //Llamamos al convertidor de json a geojson una vez por cada zona que tenemos en listaZonas
            //y las almacenamos en geoJsonZonas
            //geoJsonZonas[i] = z.JsonToGeoJson(listaZonas[i]);
            
        }
        
        for (int i=0; i<listaZonas.length; i++) {
            System.out.println("Zona numero " + i+1 + ": " + z.JsonToGeoJson(listaZonas[i]));
            System.out.println("Peligro asociado a zona numero " + i+1 + ": " + listaPeligrosidad[i]);
            z.insertZona(z.JsonToGeoJson(listaZonas[i]), listaPeligrosidad[i]);
        }
        
        res.sendRedirect(res.encodeRedirectURL("/PECGISweb/Areas_peligrosidad.jsp"));
        
    }

    /*
    Se utiliza para parar la conexion con la BBDD.
    */
    public void destroy()
    {
        System.out.println("Estoy en destroy");
    }

}
