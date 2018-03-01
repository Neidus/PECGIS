<%-- 
    Document   : mapageojson
    Created on : 13-feb-2018, 10:33:50
    Author     : Varela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Cargar Recorrido</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
   integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
   crossorigin=""/>
    <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
   integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
   crossorigin=""></script>
    <%@include file="./header.jsp" %> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  </head>
  <body>
     
   
    <div id="mapid" style="width: 600px; height: 400px;"></div>
   
    
        
  
    <form action="/PECGISweb/CargarGeoJSON" method="POST">
        
        Elige una de tus rutas:
        <select name="rutasDisponibles">
            <c:forEach items="${rutasUsuario2}" var="ruta">
                <option value="${ruta.id}"><c:out value="${ruta.nombre}" /></option>
            </c:forEach>
        </select>
        
        <button id="button" >Cargar Ruta Seleccionada</button>
    </form>
    
    
    
    <script> //Aqui va la funcionalidad del mapa
	    var mymap = L.map('mapid').setView([51.505, -0.09], 13);
	    
	    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
			'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery © <a href="http://mapbox.com">Mapbox</a>',
		id: 'mapbox.streets'
	}).addTo(mymap);
    </script>
    
    <% if ((session.getAttribute("usuario")!=null)&&(session.getAttribute("usuario").equals("admin"))) {%> 
     <br><br>
     Eres admin por lo que aqui meteremos botones de accion solo para ti en este fragmento
     <% } %>
     
    <% if (session.getAttribute("rutas")!=null) {%>
    
    <script>
        var rutaUsuario = <%= session.getAttribute("rutas") %>
        L.geoJSON(rutaUsuario).addTo(mymap);
    </script>
    <p>coordenadas <%= session.getAttribute("rutas") %></p>
    <% } %>
  </body>
</html>
