/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Modelo.DAOLogin;


/**
 *
 * @author Sergio
 */
public class LoginServlet extends HttpServlet {
    
    java.sql.Connection con; // acceso al motor JDBC 
    java.sql.Statement st; // conectar a la base de datos
    java.sql.ResultSet res; // Procesar las consultas 

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public void init(ServletConfig cfg) throws ServletException
    {
      try {
            try {
                Class.forName("org.postgresql.Driver"); //controlador   de la base de datos
                System.out.println("Conectado a la base de datos");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al conectar ");
            }
            // cadena de conexión, que le dice a postgres los datos para conectarse a la base de datos
            con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/mbbdda","postgres","19941216");
        } catch (SQLException ex) {
            System.out.println("No se pudo conectar");
        }  
    }
    
    
   
    public boolean validar(String sql){
        java.sql.ResultSet hoja_resultado = null;
        try {
            st=con.createStatement(); // conexion con postgres
            // mirar en la carpeta modelo DAOLogin
            hoja_resultado = st.executeQuery(sql); // ejecuta la instrucción SQL y almacena el resultado en una variable.
            if  (hoja_resultado.next()){ // Si los datos son correctos
                return true;
            }
            else{ // no esta registrado en la base de datos
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar");
            return false;
        }
    }
    
    
    
    public void service(HttpServletRequest req,
    HttpServletResponse res) throws ServletException, IOException
    {
    
      DAOLogin obj=new Modelo.DAOLogin();
      RequestDispatcher rd = null;
      
      String nombre=req.getParameter("user");
      String password=(String)req.getParameter("pass");
      obj.setNombre(nombre);
      obj.setPassword(password);
      
      if(obj.valide(nombre,password) == false){
                 res.sendRedirect(res.encodeRedirectURL("/PECGISweb/mapageojson.jsp"));
           } else{
                 res.sendRedirect(res.encodeRedirectURL("/PECGISweb/new 2.jsp"));
               
           }
       
        
    }
    
    
    public void destroy()
    {
        System.out.println("Estoy en destroy");
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /**
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>*/

}
