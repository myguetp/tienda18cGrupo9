<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reporte Detalle Ventas</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var productos = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listaDeDetalleVenta",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.codigo_detalle_venta;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.cantidad_producto;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.codigo_producto;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.codigo_venta;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.valor_total;
				var columna6 = document.createElement("td");
				columna6.innerHTML = item.valor_venta;
				var columna7 = document.createElement("td");
				columna7.innerHTML = item.valor_iva;
				
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
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include><br>
	<h1>Listado de Detalle Ventas</h1><br>
	
	<table border ="1" class="centrar">
		<thead>
			<tr>
				<th>Codigo Detalle Venta</th>
				<th>Cantidad Producto</th>
				<th>Codigo Producto</th>
				<th>Codigo Venta</th>
				<th>Valor Total</th>
				<th>Valor Venta</th>
				<th>Valor Iva</th>
			</tr>
		</thead>
		<tbody id="myTable">
		
		</tbody>
	</table>
	<br>
	<a class="btnagregar" href = "reportes.jsp">Volver</a>
	
</body>
</html>