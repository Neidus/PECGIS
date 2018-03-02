<%-- 
    Document   : header
    Created on : 01-mar-2018, 13:31:59
    Author     : fernando.garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="diseño/assets/css/main.css" />
        
        
        <!-- Nav -->
			<nav id="nav">
                            <form action="/PECGISweb/Logout" method="POST">
				<ul class="container">
                                        <li><a href="Unificacion.jsp">Inicio</a></li>
                                        <li><a href="insertar_datos.jsp">Registrar Recorrido</a></li>
					<li><a href="mapageojson.jsp">Cargar Recorrido</a></li>
                                        <li><a href="calculopeligrosidad.jsp">Zonas Peligrosas</a></li>
                                         <li><button id="botonLogout" >Desconectarse</button></li>
					<!--<li><a href="#contact"></a></li>-->
				</ul>
                            </form>	
			</nav>
    
    // Script para controlar las sesiones
    <script> 
                    <% if (session.getAttribute("usuario")==null) {%>
                        function redireccionar() 
                    {
                        location.href="/PECGISweb/index.jsp"; //Redireccionamos al inicio si no estamos conectados a ningun usuario
                    } 
                    setTimeout ("redireccionar()", 0);
                    <% }%>
   </script>
   <div class="wrapper first">

    </head>
    <body>
    </body>
</html>
