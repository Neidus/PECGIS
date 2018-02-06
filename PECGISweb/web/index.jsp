<%-- 
    Document   : newjsp
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
        <link rel="stylesheet" href="Main.css">
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
             <div class="Main\form-group ">
                <input type="text" class="form-control" placeholder="Username " id="UserName">
                <i class="fa fa-user"></i>
            </div>
            <div class="form-group log-status">
                <input type="password" class="form-control" placeholder="Password" id="Passwod">
                <i class="fa fa-lock"></i>
            </div>
            <span class="alert">Invalid Credentials</span>
            <a class="link" href="#">Lost your password?</a>
            <button type="button" class="log-btn" >Log in</button> 
          </div>
        <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    </body>
</html>
