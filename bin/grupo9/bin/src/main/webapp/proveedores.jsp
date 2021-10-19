<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Proveedores</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var usuarios = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listaDeProveedores",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.nitProveedor;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.ciudadProveedor;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.direccionProveedor;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.nombreProveedor;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.telefonoProveedor;
				var columna6 = document.createElement("td");
				columna6.innerHTML = "<a href ='editarProveedor.jsp?nit="+item.nitProveedor+"'>Editar</a>";
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<a href = '' onclick = 'eliminarProveedor("+item.nitProveedor+")'>Eliminar</a>";
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
				tr.appendChild(columna6);
				tr.appendChild(columna7);
			});
		}
	})
	
	function eliminarProveedor(nit){
		var eliminar = $.ajax({
			type : "GET",
			url: "http://localhost:8080/eliminarProveedor?nit="+nit,
			success: function(data){
				
			}
		})
		alert("El Proveedor sera ELIMINADO");
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include><br>
	<h1>Proveedores</h1><br>
	<form class="Buscar" action="http://localhost:8080/consultarProveedor.jsp" method="get">
		<div>
			<label>Consultar Proveedor</label> <input type="text" name="nit">
		</div>
		<div>
			<input type="submit" Value="Buscar" class="btnconsultar">
		
		</div>
	</form>
	<br>
	<table border ="1" class="centrar">
		<thead>
			<tr>
				<th>NIT</th>
				<th>Ciudad</th>
				<th>Direccion</th>
				<th>Nombre</th>
				<th>Telefono</th>
				<th>Editar</th>
				<th>Eliminar</th>
			</tr>
		</thead>
		<tbody id="myTable">
		
		</tbody>
	</table>
	<br>
	<a class="btnagregar" href = "agregarProveedor.jsp">Agregar Proveedor</a>
</body>
</html>
