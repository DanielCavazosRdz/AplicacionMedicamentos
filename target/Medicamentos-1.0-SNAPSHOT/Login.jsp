<%-- 
    Document   : Login
    Created on : Nov 9, 2018, 6:29:22 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" crossorigin="anonymous">
        
    </head>
    <body>
        <%
            if(session.getAttribute("nombre")!= null)
            response.sendRedirect("CatalogoMedicamento.jsp");
        %>
        <div class="container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="heading"><h2>UGRNL</h2></div> 
                    <div class="panel-body">
                        <form action="Login" method="POST">
                            <label for="user">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                            <label for="pass">Contraseña:</label>
                            <input type="password" class="form-control" id="pass" name="pass" required>
                            <br><br>
                            <input type="submit" class="btn btn-info" value="Login">
                        </form>
                    </div>
                </div>
           </div>
         </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
