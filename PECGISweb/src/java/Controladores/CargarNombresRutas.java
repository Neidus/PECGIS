/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelo.Ruta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class CargarNombresRutas extends HttpServlet {

    private Modelo.Ruta r;
    

    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
       r = new Modelo.Ruta();
       r.abrirConexion();
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        
        
        List<Ruta> rutas = r.getListaRutas((String)sesion.getAttribute("usuario")); //Cargamos la lista de rutas.
        request.setAttribute("rutasUsuario", rutas); //Establecemos el atributo rutas para mandarlo a la pagina
        request.getRequestDispatcher("/WEB-INF/mapageojson.jsp").forward(request, response);
        
    }



}
