<%-- 
    Document   : CatalogoMedicamento
    Created on : Oct 22, 2018, 8:04:04 PM
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
            if(session.getAttribute("nombre")== null)
            response.sendRedirect("Login.jsp");
        %>
        
        <nav class="navbar navbar-default stroke">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Medicamentos UGRNL</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="ToCatalogoMedicamento">Medicamentos</a></li>
                    <%
                    if(session.getAttribute("rol")!= null)
                        if(session.getAttribute("rol").equals(1))
                            {
                    %>
                    <li><a href="ToCatalogoProveedor">Proveedores</a></li>
                    <li><a href="ToCatalogoUsuario">Usuarios</a></li>
                    <%
                    }
                    %>
                    <li><a href="Logout">Logout</a></li>
                </ul>
            </div>
        </nav>
        <%
        if(session.getAttribute("rol")!= null)
            if(session.getAttribute("rol").equals(1))
                {
        %>
        <a href="ModiCrearMedicamento.jsp" class="btn btn-success">Crear nuevo medicamento</a>
        <%
            }
        %>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Proveedor</th>
                <th scope="col">Costo</th>
                <th scope="col">Venta</th>
                <th scope="col">Inventario</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            
                <c:forEach items="${medicamentos}" var="medicamento"> 
                    <tr>
                        <th scope="row"><c:out value="${medicamento.getNombre() }"/></th>
                        <c:forEach items="${proveedores}" var="proveedor">
                            <c:if test="${proveedor.getId() == medicamento.getProveedorId()}">
                                <td><c:out value="${proveedor.getNombre() }"/></td>
                            </c:if>
                        </c:forEach>
                        <td>$<c:out value="${medicamento.getCosto() }"/></td>
                        <td>$<c:out value="${medicamento.getVenta() }"/></td>
                        <td><c:out value="${medicamento.getInventario() }"/></td>
                        <%
                        if(session.getAttribute("rol")!= null)
                            if(session.getAttribute("rol").equals(1))
                                {
                        %>
                        <td><form action="ModifyMedicamento" method="GET">
                                <input value="${medicamento.getId() }" id="ID" name="ID" hidden>
                                <input type="submit" class="btn btn-default" value="Editar"></form>
                            <form action="EliminateMedicamento" method="GET">
                                <input value="${medicamento.getId() }" id="ID" name="ID" hidden>
                                <input type="submit" class="btn btn-default" value="Eliminar" onclick="return confirm('Estas seguro que quieres eliminar medicamento?')" ></form>
                        </td>
                        
                        
                        
                        <%
                                }
                        %>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </body>
</html>
