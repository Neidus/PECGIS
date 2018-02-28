/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergio
 */
public class InsertarGeoJSON extends HttpServlet {
    
    Modelo.Ruta r;
    

    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
       r = new Modelo.Ruta();
       r.abrirConexion();
    }

    /*
        Se ejecuta tras el init cada vez que lo llamamos.
    */
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
         HttpSession sesion = req.getSession();
        
        if (sesion.getAttribute("usuario")!=null){
            Object prueba = sesion.getAttribute("usuario");
            String json = req.getParameter("rutas"); 
            r.insertruta(r.JsonToGeoJson(json),prueba);
            res.sendRedirect("/PECGISweb/mapageojson.jsp");
            return;
        }       
        res.sendRedirect(res.encodeRedirectURL("/PECGISweb/route_sin_osrm.jsp"));
        
    }

    /*
    Se utiliza para parar la conexion con la BBDD.
    */
    public void destroy()
    {
        System.out.println("Estoy en destroy");
    }

}
