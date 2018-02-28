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
public class Login2 extends HttpServlet {

    Modelo.Conexion c;
    
    public void init(ServletConfig cfg) throws ServletException
    {
       c = new Modelo.Conexion();
       c.conectar();
    }


    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
        String nombre = req.getParameter("user"); 
        String pass = req.getParameter("pass"); 
        
        HttpSession sesion = req.getSession();
        
        if (sesion.getAttribute("usuario")!=null){
             System.out.println("User ya existe anteriormente");
             res.sendRedirect("/PECGISweb/mapageojson.jsp");
             return;
        }
        
        
        if (!c.esValido(nombre, pass)) {
            System.out.println("User no valido");
            res.sendRedirect(res.encodeRedirectURL("/PECGISweb/index.jsp")); 
            sesion.setAttribute("error", "El usuario y/o contraseña no son correctos");
            
        } else {
            System.out.println("User valido");
            sesion.setAttribute("usuario", nombre);
            Modelo.Ruta r = new Ruta();
            r.abrirConexion();
            List<Ruta> rutas = r.getListaRutas((String)sesion.getAttribute("usuario")); //Cargamos la lista de rutas.
            sesion.setAttribute("rutasUsuario2", rutas);
            res.sendRedirect(res.encodeRedirectURL("/PECGISweb/mapageojson.jsp"));
            
        }
        
    }


    public void destroy()
    {
        c.cerrarConexion();
        super.destroy();
    }
}
