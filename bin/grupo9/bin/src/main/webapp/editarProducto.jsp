<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
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
	
	function editarProducto(){
		var codigoProducto = document.getElementById("codigoProducto").value;
		var ivaCompra =  document.getElementById("ivaCompra").value;
		var nitProveedor = document.getElementById("nitProveedor").value;
		var nombreProducto = document.getElementById("nombreProducto").value;
		var precioCompra = document.getElementById("precioCompra").value;
		var precioVenta = document.getElementById("precioVenta").value;
		
		var editar=$.ajax({
			type: "GET",
			url: "http://localhost:8080/editarProducto?codigoProducto="+codigo+"&ivaCompra="+ivaCompra+"&nitProveedor="+nitProveedor+"&nombreProducto="+nombreProducto+"&precioCompra="+precioCompra+"&precioVenta="+precioVenta,
			success:function(data){
				
			}
		});
	}
</script>
</head>
<body>
	
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action="" method="get" onsubmit = "editarProducto()">
	<h1>Editar Producto</h1><br>
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
			<input class="btningresar" type="submit" Value="Actualizar Producto">
		</div>
	</form>
	<a href="productos.jsp">Volver</a><br>

</body>
</html>
