<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action ="http://localhost:8080/registrarProducto" method = "get">
		<h1>Agregar Producto</h1><br>
		<br>
		<div>
			<label>Codigo:</label>
			<input type = "text" name = "codigoProducto" required>
		</div>
		<div>
			<label>IVA:</label>
			<input type = "text" name = "ivaCompra" required>
		</div>
		<div>
			<label>NIT:</label>
			<input type = "text" name = "nitProveedor" required>
		</div>
		<div>
			<label>Nombre:</label>
			<input type = "text" name = "nombreProducto" required>
		</div>
		<div>
			<label>Precio Compra:</label>
			<input type = "text" name = "precioCompra" required>
		</div>
		<div>
			<label>Precio Venta:</label>
			<input type = "text" name = "precioVenta" required>
		</div>
		<div>
			<input class="btningresar" type = "submit">
		</div>
	</form>
	<a href="productos.jsp">Volver</a><br>
</body>
</html>
