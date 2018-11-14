<%-- 
    Document   : CatalogoUsuario
    Created on : Oct 22, 2018, 8:04:32 PM
    Author     : Daniel
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href='styles/navbar.css' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Medicamentos UGRNL</title>
    </head>
    <body>
        <%
        if(session.getAttribute("rol")!= null){
            if(!session.getAttribute("rol").equals(1)){
                response.sendRedirect("Login.jsp");
            }
        } else{
            response.sendRedirect("Login.jsp");
        }
        %>
        <nav class="navbar navbar-default stroke">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Medicamentos UGRNL</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="ToCatalogoMedicamento">Medicamentos</a></li>
                    <li><a href="ToCatalogoProveedor">Proveedores</a></li>
                    <li class="active"><a href="ToCatalogoUsuario">Usuarios</a></li>
                    <li><a href="Logout">Logout</a></li>
                </ul>
            </div>
        </nav>
        <a href="ModiCrearUsuario.jsp" class="btn btn-success">Crear nuevo Usuario</a>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Dirección</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            
                <c:forEach items="${usuarios}" var="usuario"> 
                    <tr>
                        <th scope="row"><c:out value="${usuario.getNombre() }"/></th>
                        <td><c:if test="${usuario.getRol() == 1}"><c:out value="Admin"/></c:if><c:if test="${usuario.getRol() != 1}"><c:out value="Empleado"/></c:if></td>
                        <td><form action="ModifyUsuario" method="GET">
                                <input value="${usuario.getId() }" id="ID" name="ID" hidden>
                                <input type="submit" class="btn btn-default" value="Editar"></form>
                            <form action="EliminateUsuario" method="GET">
                                <input value="${usuario.getId() }" id="ID" name="ID" hidden>
                                <input type="submit" class="btn btn-default" value="Eliminar" onclick="return confirm('Estas seguro que quieres eliminar usuario?')"></form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
