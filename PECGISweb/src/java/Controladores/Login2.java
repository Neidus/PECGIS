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
        
        HttpSession sesion = req.getSession(true);
        
        if (sesion.getAttribute("usuario")!=null){
             res.sendRedirect("/PECGISweb/index.jsp");
             return;
        }
        
        
        if (!c.esValido(nombre, pass)) {
            res.sendRedirect(res.encodeRedirectURL("/PECGISweb/index.jsp")); 
            sesion.setAttribute("error", "El usuario y/o contraseña no son correctos");
        } else {
            sesion.setAttribute("usuario", nombre);
            res.sendRedirect(res.encodeRedirectURL("/PECGISweb/mapageojson.jsp"));
        }
        
    }


    public void destroy()
    {
        c.cerrarConexion();
        super.destroy();
    }
}
