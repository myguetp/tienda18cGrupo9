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
			<input type="button" Value="Consultar" class="btnconsultar" id="CC">
			
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
			<label for="IC">Iva Compra</label>
			<label for="IVA_PRODUCTO">Producto con Iva</label>
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO1">
			<input type="button" Value="Consultar" class="btnconsultar" id="CP1">
			<input type="text" id="NP1">
			<input type="text" id="CANTIDAD1" size=5>
			<input type="text" id="VT1">
			<input type="text" id="IC1" size=5>
			<input type="text" id="IVA_PRODUCTO1">
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO2">
			<input type="button" Value="Consultar" class="btnconsultar" id="CP2">
			<input type="text" id="NP2">
			<input type="text" id="CANTIDAD2" size=5>
			<input type="text" id="VT2">
			<input type="text" id="IC2" size=5>
			<input type="text" id="IVA_PRODUCTO2">
		</div>
		<br>
		<div>
			<input type="text" id="COD_PRODUCTO3">
			<input type="button" Value="Consultar" class="btnconsultar" id="CP3">
			<input type="text" id="NP3">
			<input type="text" id="CANTIDAD3" size=5>
			<input type="text" id="VT3">
			<input type="text" id="IC3" size=5>
			<input type="text" id="IVA_PRODUCTO3">
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
			<input type="button" Value="Confirmar" class="btnconfirmar" id="confVenta">
		</div>
	</form>
	<script type="text/javascript">
	$(document).ready(function(){
		
		let infProd = [];

		
		$("#CC").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarCliente?cedulaCliente="+$("#CEDULA").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#CLIENTE").val(respuesta[0].nombreCliente);
	    	});
		
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP1").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO1").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP1").val(respuesta[0].nombreProducto);
	    		$("#VT1").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD1").val()));
	    		$("#IC1").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO1").val(Math.round(parseInt($("#VT1").val())*(parseInt($("#IC1").val())/100)));
	    		infProd.push(respuesta);
	    	
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP2").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO2").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP2").val(respuesta[0].nombreProducto);
	    		$("#VT2").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD2").val()));
	    		$("#IC2").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO2").val(Math.round(parseInt($("#VT2").val())*(parseInt($("#IC2").val())/100)));
	    		infProd.push(respuesta);
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP3").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO3").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP3").val(respuesta[0].nombreProducto);
	    		$("#VT3").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD3").val()));
	    		$("#IC3").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO3").val(Math.round(parseInt($("#VT3").val())*(parseInt($("#IC3").val())/100)));
	    		$("#TVenta").val(parseInt($("#VT1").val())+parseInt($("#VT2").val())+parseInt($("#VT3").val()));
	    		$("#TI").val(parseInt($("#IVA_PRODUCTO1").val())+parseInt($("#IVA_PRODUCTO2").val())+parseInt($("#IVA_PRODUCTO3").val()));
	    		$("#TIva").val(parseInt($("#TVenta").val())+parseInt($("#TI").val()));
	    		infProd.push(respuesta);
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	});
	</script>
</body>
</html>