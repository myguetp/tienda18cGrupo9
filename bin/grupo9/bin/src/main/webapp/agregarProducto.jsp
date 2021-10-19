<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function agregarProducto(){
		var codigoProducto = document.getElementById("codigoProducto").value;
		var ivaCompra =  document.getElementById("ivaCompra").value;
		var nitProveedor = document.getElementById("nitProveedor").value;
		var nombreProducto = document.getElementById("nombreProducto").value;
		var precioCompra = document.getElementById("precioCompra").value;
		var precioVenta = document.getElementById("precioVenta").value;
		
		var agregar=$.ajax({
			type:"GET",
			url:"http://localhost:8080/registrarProducto?codigoProducto="+codigoProducto+"&ivaCompra="+ivaCompra+"&nitProveedor="+nitProveedor+"&nombreProducto="+nombreProducto+"&precioCompra="+precioCompra+"&precioVenta="+precioVenta,
			success:function(data){
				
			}
		});
			
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action ="" method = "get" onsubmit="agregarProducto()">
		<h1>Agregar Producto</h1><br>
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
			<input class="btningresar" type = "submit" value="Agregar Nuevo Produto">
		</div>
	</form>
	<a href="productos.jsp">Volver</a><br>
</body>
</html>
