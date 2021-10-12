<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<form>
		<div>
			<label for="CEDULA">Cedula</label>
			<input type="text" id="CEDULA">
			<input type="submit" Value="Consultar" class="btnconsultar">
			
			<label for="CLIENTE">Cliente</label>
			<input type="text" id="CLIENTE">
			
			<label for="CONSECUTIVO">Consecutivo</label>
			<input type="text" id="CONSECUTIVO">
		</div>
		<br>
		<div>
			<label for="COD_PRODUCTO">Cod. Producto</label>
			<label for="NP">Nombre Producto</label>
			<label for="CANTIDAD">Cant.</label>
			<label for="VT">Vlr Total</label>
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO">
			<input type="submit" Value="Consultar" class="btnconsultar">
			<input type="text" id="NP">
			<input type="text" id="CANTIDAD" size=5>
			<input type="text" id="VT">
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO">
			<input type="submit" Value="Consultar" class="btnconsultar">
			<input type="text" id="NP">
			<input type="text" id="CANTIDAD" size=5>
			<input type="text" id="VT">
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO">
			<input type="submit" Value="Consultar" class="btnconsultar">
			<input type="text" id="NP">
			<input type="text" id="CANTIDAD" size=5>
			<input type="text" id="VT">
		</div>
		<br>
		<div>
			<label for="TVenta">Total Venta</label>
			<input type="text" id="TVenta">
		</div>
		<br>
		<div>
			<label for="TI">Total Iva</label>
			<input type="text" id="TI">
		</div>
		<br>
		<div>
			<label for="TIva">Total con Iva</label>
			<input type="text" id="TIva">
		</div>
		<br>
		<div>
			<input type="submit" Value="Confirmar" class="btnconfirmar">
		</div>
	</form>
</body>
</html>