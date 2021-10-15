<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reporte Ventas</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var productos = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listaDeVenta",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.codigo_venta;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.cedula_cliente;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.cedula_usuario;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.iva_venta;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.total_venta;
				var columna6 = document.createElement("td");
				columna6.innerHTML = item.valor_venta;
				
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
	<h1>Listado de Ventas</h1><br>
	
	<table border ="1" class="centrar">
		<thead>
			<tr>
				<th>Codigo Venta</th>
				<th>CC Cliente</th>
				<th>CC Usuario</th>
				<th>IVA Venta</th>
				<th>Total Venta</th>
				<th>Valor Venta</th>
			</tr>
		</thead>
		<tbody id="myTable">
		
		</tbody>
	</table>
	<br>
	<a class="btnagregar" href = "reportes.jsp">Volver</a>
	
</body>
</html>