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
    <h3>Calculo de Peligrosidad de Rutas</h3>

    <form action="/PECGISweb/CalcularIntersecciones" method="POST">
        <!--Cargamos los nombres de las rutas del usuario y de forma oculta los ids 
        para poder cargarlos cuando pulsemos el boton -->
        Elige una de tus rutas:
        <select name="rutasDisponibles">
            <c:forEach items="${rutasUsuario2}" var="ruta">
                <option value="${ruta.id}"><c:out value="${ruta.nombre}" /></option>
            </c:forEach>
        </select>
        <p></p>
        <button id="button" >Calcular Peligrosidad de la Ruta</button>
    </form>
    
    <h1></h1>
    
        <% if (session.getAttribute("peligrosidadTotal")!=null) {%>
        <h3>Peligrosidad total: <%= session.getAttribute("peligrosidadTotal") %></h3>
        
        <% } %>
        
        <% if (session.getAttribute("listaIntersecciones")!=null) {%>
        <h3>Información de zonas por donde se ha realizado la ruta:</h3>
        <% int aux = 1; %>
            <c:forEach items="${listaIntersecciones}" var="interseccion">
                <h4>Zona número <%= aux %>:</h4>
                <h4>Nivel de peligrosidad de la ruta: ${interseccion.peligrosidad} </h4>
                <h4>Kilómetros de recorrido de la zona: ${interseccion.distancia} km</h4>
                <% aux++; %>
            </c:forEach>
        <% } %>
        
        
        
    </body>
</html>
