<%-- 
    Document   : Proceso
    Created on : 09-feb-2018, 2:35:11
    Author     : wolfm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           Modelo.DAOLogin obj=new Modelo.DAOLogin(); 
           String nombre=(String)request.getParameter("user");
           String password=(String)request.getParameter("pass");
           obj.setNombre(nombre);
           obj.setPassword(password);
           if(obj.valide(nombre,password) == false){
               out.println("NO FUNCIONA"+nombre+","+password);
           } else{
               out.println("FUNCIONA");
               
           }
            
       %>
    </body>
</html>