<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Cliente</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function agregarCliente() {
	var cedula=document.getElementById("cedula").value;
	var direccion=document.getElementById("direccion").value;
	var correo=document.getElementById("correo").value;
	var nombre=document.getElementById("nombre").value;	
	var telefono=document.getElementById("telefono").value;
	
	var agregar = $.ajax({
				type : "GET",
				url : "http://localhost:8080/registrarCliente?cedulaCliente="+cedula+"&direccionCliente="+direccion+"&emailCliente="+correo+"&nombreCliente="+nombre+"&telefonoCliente="+telefono,
				success : function(data) {
				
				}
	
	      })    
}

</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action ="" method = "get" onsubmit="agregarCliente()">
		<h1>Agregar Cliente</h1><br>
	<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaCliente" id="cedula">	
	</div>
	<div>
		<label>Direccion</label>
		<input type = "text" name="direccionCliente" id="direccion">	
	</div>
	<div>
		<label>Correo</label>
		<input type = "text" name="emailCliente" id="correo">	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreCliente" id="nombre">	
	</div>
	
	<div>
		<label>Telefono</label>
		<input type = "text" name="telefonoCliente" id="telefono">	
	</div>
		<div>
			<input class="btningresar" type = "submit" Value="Agregar Nuevo Cliente" >
		</div>
	</form>
	<a href="clientes.jsp">Volver</a><br>	
</body>
</html>
