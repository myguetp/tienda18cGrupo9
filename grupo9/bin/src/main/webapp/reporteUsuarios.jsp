<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var usuarios = $.ajax(
			{
				type : "GET",
				url : "http://localhost:8080/listaDeUsuarios",
				success : function(data) {
					$.each(data, function(i, item) {
						lista = document.getElementById("myTable");
						var tr = document.createElement("tr");
						var columna1 = document.createElement("td");
						columna1.innerHTML = item.cedulaUsuario;
						var columna2 = document.createElement("td");
						columna2.innerHTML = item.emailUsuario;
						var columna3 = document.createElement("td");
						columna3.innerHTML = item.nombreUsuario;
						var columna4 = document.createElement("td");
						columna4.innerHTML = item.password;
						var columna5 = document.createElement("td");
						columna5.innerHTML = item.usuario;
						

						lista.appendChild(tr);
						tr.appendChild(columna1);
						tr.appendChild(columna2);
						tr.appendChild(columna3);
						tr.appendChild(columna4);
						tr.appendChild(columna5);
					}
					);
				}
			})
</script>
</head>

<body>
	<jsp:include page="menu.jsp"></jsp:include><br>
	<h1>Listado de Usuarios</h1><br>
	
	
	<table border ="1" class="centrar">
		<thead>
			<tr>
				<th>Cedula</th>
				<th>Correo</th>
				<th>Nombre</th>
				<th>Contraseña</th>
				<th>Usuario</th>
			</tr>
		</thead>
		<tbody id="myTable">
		
		</tbody>
	</table>
	<br>
	<a class="btnagregar" href = "reportes.jsp">Volver</a>
	
</body>
</html>
