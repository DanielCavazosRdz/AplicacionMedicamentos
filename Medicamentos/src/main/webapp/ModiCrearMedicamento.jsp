<%-- 
    Document   : ModiCrearMedicamento
    Created on : Oct 22, 2018, 8:05:20 PM
    Author     : Daniel
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Medicamento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
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
                        <form action="NewMedicamento" method="POST">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                            <br>
                            <label for="proveedorId" >Proveedor: </label>
                            <select name="proveedorId">
                                <c:forEach items="${proveedores}" var="proveedor">
                                    <option class="dropdown" id="proveedorId" value="${proveedor.getId()}" name="proveedorId">${proveedor.getNombre()}</option>
                                </c:forEach>
                            </select><br>
                            <label for="costo">Costo: </label>
                            <input type="number" class="form-control" id="costo" name="costo" required>
                            <label for="porcentajeGanancia">Porcentaje Ganancia:  </label>
                            <input type="number" class="form-control" id="porcentajeGanancia" name="porcentajeGanancia" required>
                            <label for="Inventario">Inventario: </label>
                            <input type="number" class="form-control" id="inventario" name="inventario" required>
                            <br>
                    <%
                    }else{
                    %>
                    <div class="heading"><h2>Modificar</h2></div>
                    <div class="panel-body">
                        <form action="ModifyMedicamento" method="POST">
                            <input type="hidden" class="form-control" id="id" value="${ID}" name="id">
                    <%
                    }
                    %>
                    <c:forEach items="${medicamentos}" var="medicamento">
                        <c:if test="${medicamento.getId() == ID}">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre"<%if(request.getAttribute("ID") != null){ %>value="${medicamento.getNombre()}" <% }%> name="nombre" required>
                            <br>
                            <label for="proveedorId" >Proveedor: </label>
                            <select name="proveedorId">
                                <c:forEach items="${proveedores}" var="proveedor">
                                    <option class="dropdown" id="proveedorId" value="${proveedor.getId()}" name="proveedorId"
                                            <c:if test="${medicamento.getProveedorId() == proveedor.getId()}">selected="selected" </c:if>>${proveedor.getNombre()}
                                    </option>
                                </c:forEach>
                            </select><br>
                            <label for="costo">Costo: </label>
                            <input type="number" class="form-control" id="costo"<%if(request.getAttribute("ID") != null){ %>value="${medicamento.getCosto()}" <% }%> name="costo" required>
                            <label for="porcentajeGanancia">Porcentaje Ganancia:  </label>
                            <input type="number" class="form-control" id="porcentajeGanancia"<%if(request.getAttribute("ID") != null){ %>value="${medicamento.getPorcentajeGanancia()}" <% }%> name="porcentajeGanancia" required>
                            <label for="Inventario">Inventario: </label>
                            <input type="number" class="form-control" id="inventario"<%if(request.getAttribute("ID") != null){ %>value="${medicamento.getInventario()}" <% }%> name="inventario" required>
                            <br>
                        </c:if> 
                    </c:forEach>
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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>