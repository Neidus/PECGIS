<%-- 
    Document   : Proceso_Registro
    Created on : 11-feb-2018, 11:47:41
    Author     : sergio
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
           //RequestDispatcher rd = null;
           String nombre=(String)request.getParameter("user");
           String password=(String)request.getParameter("pass");
           obj.setNombre(nombre);
           obj.setPassword(password);
           if(obj.valide(nombre,password) == false){
               obj.insertar(nombre, password);
           } else{
               out.println("Nombre ya registrado");
               
           }
        %>    
    </body>
</html>

