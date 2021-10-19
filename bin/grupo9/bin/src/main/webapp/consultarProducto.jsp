<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.grupo9.DAO.Conexion"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var codigo="<%=request.getParameter("codigo")%>"
var producto=$.ajax({
	type:"GET",
	url:"http://localhost:8080/consultarProducto?codigo="+codigo,
	success: function(data){
		$.each(data, function(i, item){
			document.getElementById("codigoProducto").value = item.codigoProducto;
			document.getElementById("ivaCompra").value = item.ivaCompra;
			document.getElementById("nitProveedor").value = item.nitProveedor;
			document.getElementById("nombreProducto").value = item.nombreProducto;
			document.getElementById("precioCompra").value = item.precioCompra;
			document.getElementById("precioVenta").value = item.precioVenta;
			})
		}
	});
	
</script>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include><br>
	<form class="Buscar" id="formulario" action="" method="get">
	<h1>Datos de producto consultado</h1>
	<br>
		<div>
			<label>Codigo:</label>
			<input type = "text" name = "codigoProducto" id = "codigoProducto">
		</div>
		<div>
			<label>IVA:</label>
			<input type = "text" name = "ivaCompra" id = "ivaCompra" >
		</div>
		<div>
			<label>NIT:</label>
			<input type = "text" name = "nitProveedor" id = "nitProveedor">
		</div>
		<div>
			<label>Nombre:</label>
			<input type = "text" name = "nombreProducto" id = "nombreProducto" >
		</div>
		<div>
			<label>Precio Compra:</label>
			<input type = "text" name = "precioCompra" id = "precioCompra">
		</div>
		<div>
			<label>Precio Venta:</label>
			<input type = "text" name = "precioVenta" id = "precioVenta" >
		</div>
		<div>
			<button class="btningresar" onclick="location.href='productos.jsp'" type="button" class="">VOLVER</button>
		</div>
	</form>

</body>
</html>
