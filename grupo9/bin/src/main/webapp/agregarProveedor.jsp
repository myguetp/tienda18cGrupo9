<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Proveedor</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function agregarProveedor(){
		var nitProveedor = document.getElementById("nitProveedor").value;
		var ciudadProveedor = document.getElementById("ciudadProveedor").value;
		var direccionProveedor = document.getElementById("direccionProveedor").value;
		var nombreProveedor = document.getElementById("nombreProveedor").value;
		var telefonoProveedor = document.getElementById("telefonoProveedor").value;
		
		var agregar = $.ajax({
			type : "GET",
			url : "http://localhost:8080/registrarProveedor?nitProveedor="+nitProveedor+"&ciudadProveedor="+ciudadProveedor+"&direccionProveedor="+direccionProveedor+"&nombreProveedor="+nombreProveedor+"&telefonoProveedor="+telefonoProveedor,
			success : function(data){
				
			}
		});
		
	}
</script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<form id="formulario2" action="" method="get" onsubmit = "agregarProveedor()">
<h1>Registrar Proveedor</h1><br>
	<div>
		<label>NIT</label>
		<input type = "text" name="nitProveedor" id="nitProveedor" required>	
	</div>
	<div>
		<label>Ciudad</label>
		<input type = "text" name="ciudadProveedor" id="ciudadProveedor" required>	
	</div>
	<div>
		<label>Direccion</label>
		<input type = "text" name="direccionProveedor" id="direccionProveedor" required>	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreProveedor" id="nombreProveedor" required>	
	</div>
	<div>
		<label>Telefono</label>
		<input type = "text" name="telefonoProveedor" id="telefonoProveedor" required>	
	</div>
	<div>
		<input class="btningresar" type = "submit" Value="Agregar Nuevo Proveedor">	
	</div>
</form>
	<a href="proveedores.jsp">Volver</a><br>
</body>
</html>
