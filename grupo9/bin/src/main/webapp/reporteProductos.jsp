<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reporte Productos</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var productos = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listaDeProducto",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.codigoProducto;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.ivaCompra;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.nitProveedor;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.nombreProducto;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.precioCompra;
				var columna6 = document.createElement("td");
				columna6.innerHTML = item.precioVenta;
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
				tr.appendChild(columna6);
			});
		}
	})
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include><br>
	<h1>Listado de Productos</h1><br>
	
	<table border ="1" class="centrar">
		<thead>
			<tr>
				<th>Codigo</th>
				<th>IVA</th>
				<th>NIT</th>
				<th>Nombre</th>
				<th>Precio de Compra</th>
				<th>Precio de Venta</th>
			</tr>
		</thead>
		<tbody id="myTable">
		
		</tbody>
	</table>
	<br>
	<a class="btnagregar" href = "reportes.jsp">Volver</a>
	
</body>
</html>