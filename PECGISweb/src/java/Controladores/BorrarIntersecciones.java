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
 * @author fernando.garcia
 */
public class BorrarIntersecciones extends HttpServlet {
 
    Modelo.Intersecciones i;
    /*
        Se ejecuta solo la primera vez que llamamos al servlet. 
        Establece la conexion con la BBDD
    */
    public void init(ServletConfig cfg) throws ServletException
    {
       i = new Modelo.Intersecciones();
       i.abrirConexion();
    }

    /*
        Se ejecuta tras el init cada vez que lo llamamos.
    */
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
         HttpSession sesion = req.getSession();
        
        if (sesion.getAttribute("usuario")!=null){

            String usuario = (String)sesion.getAttribute("usuario");

            i.borrarIntersecciones(usuario);

            res.sendRedirect("/PECGISweb/calculopeligrosidad.jsp");
       
            return;
        }       
        res.sendRedirect(res.encodeRedirectURL("/PECGISweb/calculopeligrosidad.jsp"));
        
    }

    /*
    Se utiliza para parar la conexion con la BBDD.
    */
    public void destroy()
    {
        System.out.println("Estoy en destroy");
    }

    
    
    
}
