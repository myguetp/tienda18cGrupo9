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
		url: "http://localhost:8080/listaDeVentaxcliente",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.cedula_cliente;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.valor_venta;
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
			
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
				<th>CC Cliente</th>
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