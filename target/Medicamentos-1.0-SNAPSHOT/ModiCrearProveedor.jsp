<%-- 
    Document   : ModiCrearProveedor
    Created on : Oct 22, 2018, 8:05:34 PM
    Author     : Daniel
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Proveedor</title>
    </head>
    <body>
         <%
            if(session.getAttribute("nombre")== null){
            response.sendRedirect("Login.jsp");
            }
            if(session.getAttribute("rol")!= null){
                        if(session.getAttribute("rol").equals(0)){
                            response.sendRedirect("CatalogoMedicamento.jsp");
                        }
            }
        %>
        <div class="container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <%
                    if(request.getAttribute("ID") == null){
                    %>
                    <div class="heading"><h2>Nuevo</h2></div>
                    <div class="panel-body">
                        <form action="NewProveedor" method="POST">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                            <label for="direccion">Direccion: </label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                    <%
                    }else{
                    %>
                    <div class="heading"><h2>Modificar</h2></div>
                    <div class="panel-body">
                        <form action="ModifyProveedor" method="POST">
                            <input type="hidden" class="form-control" id="id" value="${ID}" name="id">
                            <c:forEach items="${proveedores}" var="proveedor">
                        <c:if test="${proveedor.getId() == ID}"> 
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre"<%if(request.getAttribute("ID") != null){ %>value="${proveedor.getNombre()}" <% }%> name="nombre" required>
                            <label for="direccion">Direccion: </label>
                            <input type="text" class="form-control" id="direccion"<%if(request.getAttribute("ID") != null){ %>value="${proveedor.getDireccion()}" <% }%> name="direccion" required>
                            
                        </c:if>
                    </c:forEach>
                    <%
                    }
                    %>
                    
                            <%
                            if(request.getAttribute("ID") == null){
                            %>
                            <input type="submit" class="btn btn-info" value="Crear">
                            <%
                            }else{
                            %>
                            <input type="submit" class="btn btn-info" value="Modificar">
                            <%
                            }
                            %>
                        </form>
                    </div>
                </div>
           </div>
         </div>
    </body>
</html>
