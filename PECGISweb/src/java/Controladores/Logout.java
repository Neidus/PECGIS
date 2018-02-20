/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Varela
 */
public class Logout extends HttpServlet {

    
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
        HttpSession sesion = req.getSession();
        sesion.invalidate(); //Eliminamos la sesion actual existente
        res.sendRedirect("/PECGISweb/index.jsp");
    }

}
