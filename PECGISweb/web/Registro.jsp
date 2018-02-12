<%-- 
    Document   : Registro
    Created on : 10-feb-2018, 17:54:31
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Aplicación</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="diseño\Main.css">
    </head>
    <body>
        
        <div class="login-form">
             <h1>Registro</h1>
             <section>
                  <form action="Proceso_Registro.jsp" method="POST">
                        <div class="form-group ">   
                           <input name= "user" type="text" class="form-control" placeholder="Introduzca su nombre " id="UserName" required>
                           <i class="fa fa-user"></i>
                       </div>
                       <div class="form-group log-status">
                           <input name="pass" type="text" class="form-control" placeholder="Introduzca una contraseña" id="Passwod" required>
                           <i class="fa fa-lock"></i>
                       </div>
                      <button type="submit" class='log-btn' >Registrar</button>
                      <input type="button" class="boton" value="<--" onclick="history.go(-1)" />
                      
                  </form>
             </section>
      
          </div>
        <!-- Llamada a la libreria jquery -->
        <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    </body>
</html>
