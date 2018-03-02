<%-- 
    Document   : calculopeligrosidad
    Created on : 02-mar-2018, 7:23:34
    Author     : fernando.garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculo Peligrosidad</title>
        <%@include file="./header.jsp" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
    
        <h3> </h3>  
    <h3>Calculo Intersecciones</h3>

    <form action="/PECGISweb/CalcularIntersecciones" method="POST">
        <!--Cargamos los nombres de las rutas del usuario y de forma oculta los ids 
        para poder cargarlos cuando pulsemos el boton -->
        Elige una de tus rutas:
        <select name="rutasDisponibles">
            <c:forEach items="${rutasUsuario2}" var="ruta">
                <option value="${ruta.id}"><c:out value="${ruta.nombre}" /></option>
            </c:forEach>
        </select>
        
        <button id="button" >Cargar Intersecciones</button>
    </form>
    
    
  
        
        <h3> </h3>    
        <h3>Calculo Peligrosidad</h3>    
        <button id="button" >Calcular peligrosidad</button>
        
        <h3> </h3>  
        <h3>Restablecer Intersecciones</h3>
        <form action="/PECGISweb/BorrarIntersecciones" method="POST">     
        <button id="button" >Restablecer Intersecciones</button>
    </form>
        
        
        
    </body>
</html>
