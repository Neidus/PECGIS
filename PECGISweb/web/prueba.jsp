<%-- 
    Document   : prueba
    Created on : 23-feb-2018, 0:36:25
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
        <h1>Hello World!</h1>
        <%
            session.setAttribute("variable", new Integer(22));
         %>
<script type="text/javascript">
document.write('Hola')
</script>
        <p>Me ha llegado <%= session.getAttribute("variable") %></p>
       
<p></p>      
    </body>
</html>
