<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Proveedor</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var nit = "<%=request.getParameter("nit")%>"
	var proveedor = $.ajax({
		type : "GET",
		url : "http://localhost:8080/consultarProveedor?nit="+nit,
		success : function(data){
			$.each(data, function(i, item){
				document.getElementById("nit").value = item.nitProveedor;
				document.getElementById("ciudadProveedor").value = item.ciudadProveedor;
				document.getElementById("direccionProveedor").value = item.direccionProveedor;
				document.getElementById("nombreProveedor").value = item.nombreProveedor;
				document.getElementById("telefonoProveedor").value = item.telefonoProveedor;
			})
		}
	});
	
	function editarProveedor(){
		var nit = document.getElementById("nit").value;
		var ciudadProveedor = document.getElementById("ciudadProveedor").value;
		var direccionProveedor = document.getElementById("direccionProveedor").value;
		var nombreProveedor = document.getElementById("nombreProveedor").value;
		var telefonoProveedor = document.getElementById("telefonoProveedor").value;
		
		var editar = $.ajax({
			type : "GET",
			url: "http://localhost:8080/editarProveedor?nitProveedor="+nit+"&ciudadProveedor="+ciudadProveedor+"&direccionProveedor="+direccionProveedor+"&nombreProveedor="+nombreProveedor+"&telefonoProveedor="+telefonoProveedor,
			success:function(data){
				window.location.assing("http://localhost:8080/proveedores.jsp");
			}
		})
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action ="" method = "get" onsubmit="editarProveedor()">
		<h1>Editar Proveedor</h1><br>
		<div>
			<label>NIT:</label>
			<input type = "text" name = "nitProveedor" id="nit" disabled>
		</div>
		<div>
			<label>Ciudad:</label>
			<input type = "text" name = "ciudadProveedor" id="ciudadProveedor">
		</div>
		<div>
			<label>Direccion:</label>
			<input type = "text" name = "direccionProveedor" id="direccionProveedor">
		</div>
		<div>
			<label>Nombre:</label>
			<input type = "text" name = "nombreProveedor" id="nombreProveedor">
		</div>
		<div>
			<label>Telefono:</label>
			<input type = "text" name = "telefonoProveedor" id="telefonoProveedor">
		</div>
		<div>
			<input class="btningresar" type = "submit" value="Actualizar Proveedor">
		</div>
	</form>	
	<a href="proveedores.jsp">Volver</a><br>
</body>
</html>
