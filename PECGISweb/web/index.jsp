<%-- 
    Document   : indexjsp
    Created on : 06-feb-2018, 17:51:26
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
        <!--
    <script type="text/javascript">
         $(document).ready(function(){
            $('.log-btn').click(function(){
                 $('.log-status').addClass('wrong-entry');
                 $('.alert').fadeIn(500);
                 setTimeout( "$('.alert').fadeOut(1500);",3000 );
            });
            $('.form-control').keypress(function(){
            $('.log-status').removeClass('wrong-entry');
        });
        });
    </script>-->
    
        <div class="login-form">
             <h1>Inicio sesion</h1>
             <section>
                  <form action="LoginUsuarioServlet" method="POST">
                        <div class="form-group ">
                           <input name= "user" type="text" class="form-control" placeholder="Username " id="UserName">
                           <i class="fa fa-user"></i>
                       </div>
                       <div class="form-group log-status">
                           <input name="pass" type="password" class="form-control" placeholder="Password" id="Passwod">
                           <i class="fa fa-lock"></i>
                       </div>
                  </form>
             </section>
            <!--<span class="alert">Invalid Credentials</span>-->
            <a class="link" href="#">Lost your password?</a>
            <a class="link" href="#"> Registrese </a>
            <%
                out.println("<button type='button' class='log-btn' >Log in</button>"); 
            %>        
          </div>
        <!-- Llamada a la libreria jquery -->
        <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    </body>
</html>
