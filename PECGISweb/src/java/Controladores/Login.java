/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*;
import Modelo.Conexion;

public class Login extends HttpServlet {

/** 
* Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods. 
* @param request servlet request 
* @param response servlet response 
*/ 
protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException { 
    response.setContentType("text/html;charset=UTF-8"); 
    PrintWriter out = response.getWriter(); 
    try { 
        String nombre = request.getParameter("user"); 
        String pass = request.getParameter("pass"); 
        String consulta = "Select * from usuario where usuario='"+ nombre +"' and pass='"+ pass +"'";
        Modelo.Conexion obj=new Modelo.Conexion();
        obj.setNombre(nombre);
        obj.setPassword(pass);
        if ((nombre.equals("admin")) && (pass.equals("admin"))){
            response.sendRedirect("mapageojson.jsp");
        }
        else{
            
            if (obj.validar(consulta)== false){
                response.sendRedirect("index.jsp");
            }
             else {
                response.sendRedirect("new 2.jsp");
            }
        }
    } finally { 
        out.close(); 
        } 
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code."> 
/** 
* Handles the HTTP <code>GET</code> method. 
* @param request servlet request 
* @param response servlet response 
*/ 
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException { 
processRequest(request, response); 
}

/** 
* Handles the HTTP <code>POST</code> method. 
* @param request servlet request 
* @param response servlet response 
*/ 
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException { 
processRequest(request, response); 
}

/** 
* Returns a short description of the servlet. 
*/ 
public String getServletInfo() { 
return "Short description"; 
}// </editor-fold>

}
