package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.grupo9.DTO.DetalleVentaDTO;

public class DetalleVentaDAO {
	
	
	
PreparedStatement preparedStatement;
	
	public ArrayList<DetalleVentaDTO> listaDetalleVenta(){
		ArrayList<DetalleVentaDTO> miDetalleVenta = new ArrayList<DetalleVentaDTO>();
		Conexion conex = new Conexion();
		
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM detalle_ventas");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				DetalleVentaDTO detalleVenta = new DetalleVentaDTO();
				detalleVenta.setCodigo_detalle_venta(res.getInt("codigo_detalle_venta"));
				detalleVenta.setCantidad_producto(res.getInt("cantidad_producto"));
				detalleVenta.setCodigo_producto(res.getInt("codigo_producto"));
				detalleVenta.setCodigo_venta(res.getInt("codigo_venta"));
				detalleVenta.setValor_total(res.getDouble("valor_total"));
				detalleVenta.setValor_venta(res.getDouble("valor_venta"));
				detalleVenta.setValor_iva(res.getDouble("valor_iva"));
				
				miDetalleVenta.add(detalleVenta);
					}
					res.close();
					consulta.close();
					conex.desconectar();
		
			}
		catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
		return miDetalleVenta;
		}
		
	
	
	public void registrarDetalleVenta(DetalleVentaDTO detalleVenta) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO detalle_ventas VALUES ('"+detalleVenta.getCodigo_detalle_venta()+"', '"+detalleVenta.getCantidad_producto()+"', '"+detalleVenta.getCodigo_producto()+"', '"+detalleVenta.getCodigo_venta()+"', '"+detalleVenta.getValor_total()+"', '"+detalleVenta.getValor_venta()+"', '"+detalleVenta.getValor_iva()+"')");
			
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
	}
	
	public void editarDetalleVenta(DetalleVentaDTO detalleVenta) {
		Conexion conex= new Conexion();
		try {
			Statement st= conex.getConnection().createStatement();
			st.executeUpdate("UPDATE detalle_ventas set codigo_detalle_venta='"+detalleVenta.getCodigo_detalle_venta()+"', cantidad_producto='"+detalleVenta.getCantidad_producto()+"', codigo_producto='"+detalleVenta.getCodigo_producto()+"', codigo_venta='"+detalleVenta.getCodigo_venta()+"', valor_total='"+detalleVenta.getValor_total()+"', valor_venta='"+detalleVenta.getValor_venta()+"', valor_iva='"+detalleVenta.getValor_iva()+"' WHERE codigo_detalle_venta ="+detalleVenta.getCodigo_detalle_venta());
			
			System.out.println("Se actualizo correctamente el detalle de la venta");
			
			st.close();
			conex.desconectar();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			System.out.println("No se actualizo el detalle de la venta");
		}
	}
	
	public ArrayList<DetalleVentaDTO> consultarDetalleVenta(int codigoDetalleVenta){
		ArrayList<DetalleVentaDTO> miDetalleVenta = new ArrayList<DetalleVentaDTO>();
		Conexion conex = new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM detalle_ventas WHERE codigo_detalle_venta = ?");
			consulta.setInt(1, codigoDetalleVenta);
			ResultSet res = consulta.executeQuery();
			
			if(res.next()){
				DetalleVentaDTO detalleVenta = new DetalleVentaDTO();
				detalleVenta.setCodigo_detalle_venta(res.getInt("codigo_detalle_venta"));
				detalleVenta.setCantidad_producto(res.getInt("cantidad_producto"));
				detalleVenta.setCodigo_producto(res.getInt("codigo_producto"));
				detalleVenta.setCodigo_venta(res.getInt("codigo_venta"));
				detalleVenta.setValor_total(res.getDouble("valor_total"));
				detalleVenta.setValor_venta(res.getDouble("valor_venta"));
				detalleVenta.setValor_iva(res.getDouble("valor_iva"));
				miDetalleVenta.add(detalleVenta); 
			}
			res.close(); 
			consulta.close();
			conex.desconectar(); 
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		} 
		return miDetalleVenta; 	
	}
		
	public void eliminarDetalleVenta(int detalleVenta) { 
		Conexion conex = new Conexion();
		try { 
			String query = "DELETE FROM detalle_ventas WHERE codigo_detalle_venta = ?"; 
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, detalleVenta);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage()); 
		} 
	}

	
	

}