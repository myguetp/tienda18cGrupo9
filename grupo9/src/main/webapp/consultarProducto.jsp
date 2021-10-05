<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Producto</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action="/consultarProducto" method = "post">
		<h1>Consultar Producto</h1><br>
		<h1>Agregar Producto</h1><br>
		<br>
		<div>
			<label>Codigo:</label>
			<input type = "text" name = "codigoProducto" required>
		</div>
		<div>
			<label>IVA:</label>
			<input type = "text" name = "ivaCompra" >
		</div>
		<div>
			<label>NIT:</label>
			<input type = "text" name = "nitProveedor" >
		</div>
		<div>
			<label>Nombre:</label>
			<input type = "text" name = "nombreProducto" >
		</div>
		<div>
			<label>Precio Compra:</label>
			<input type = "text" name = "precioCompra" >
		</div>
		<div>
			<label>Precio Venta:</label>
			<input type = "text" name = "precioVenta" >
		</div>
		<div>
			<input class="btningresar" type = "submit">
		</div>
	</form>
</body>
</html>