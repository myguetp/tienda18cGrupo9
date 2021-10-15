<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar cliente</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var cedula="<%=request.getParameter("cedula")%>"
var usuario=$.ajax({
	type : "GET",
	url : "http://localhost:8080/consultarCliente?cedulaCliente="+cedula,
	success : function(data) {
		$.each(data, function(i, item) {
			document.getElementById("cedula").value= item.cedulaCliente;
			document.getElementById("direccion").value= item.direccionCliente;
			document.getElementById("correo").value= item.emailCliente;
			document.getElementById("nombre").value= item.nombreCliente;
			document.getElementById("telefono").value= item.telefonoCliente;
		})
	}	
});

</script>

<script type="text/javascript">

function editarCliente() {
	var cedula=document.getElementById("cedula").value;
	var direccion=document.getElementById("direccion").value;
	var correo=document.getElementById("correo").value;
	var nombre=document.getElementById("nombre").value;
	var telefono=document.getElementById("telefono").value;
	alert("Se va a ACTUALIZAR el cliente");
	var agregar = $.ajax({
				type : "GET",
				url : "http://localhost:8080/editarCliente?cedulaCliente="+cedula+"&direccionCliente="+direccion+"&emailCliente="+correo+"&nombreCliente="+nombre+"&telefonoCliente="+telefono,
				success : function(data) {
					
				}
	      })
}
</script>
</head>

<body>

	<jsp:include page="menu.jsp"></jsp:include>
	<form class="Buscar" id="formulario" action="" method="get" onsubmit="editarCliente()">
	<h1>Editar Usuario</h1><br>
		<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaCliente" id="cedula" disabled="disabled">	
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
			<input class="btningresar" type="submit" Value="Actualizar Cliente">
		</div>
	</form>
<a href="Clientes.jsp">Volver</a><br>
</body>
</html>