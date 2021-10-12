package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.grupo9.DTO.VentaDTO;

public class VentaDAO {
	
	
	
PreparedStatement preparedStatement;
	
	public ArrayList<VentaDTO> listaDeVenta(){
		ArrayList<VentaDTO> miVenta = new ArrayList<VentaDTO>();
		Conexion conex = new Conexion();
		
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM ventas");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				VentaDTO venta = new VentaDTO();
				venta.setCodigo_venta(res.getInt("codigo_venta"));
				venta.setCedula_cliente(res.getInt("cedula_cliente"));
				venta.setCedula_usuario(res.getInt("cedula_usuario"));
				venta.setIva_venta(res.getDouble("iva_venta"));
				venta.setTotal_venta(res.getDouble("total_venta"));
				venta.setValor_venta(res.getDouble("valor_venta"));
				
				miVenta.add(venta);
					}
					res.close();
					consulta.close();
					conex.desconectar();
		
			}
		catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
		return miVenta;
		}
		
	
	
	public void registrarVenta(VentaDTO venta) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO ventas VALUES ('"+venta.getCodigo_venta()+"', '"+venta.getCedula_cliente()+"', '"+venta.getCedula_usuario()+"', '"+venta.getIva_venta()+"', '"+venta.getTotal_venta()+"', '"+venta.getValor_venta()+"')");
			
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
	}
	
	public void editarVenta(VentaDTO venta) {
		Conexion conex= new Conexion();
		try {
			Statement st= conex.getConnection().createStatement();
			st.executeUpdate("UPDATE ventas set codigo_venta='"+venta.getCodigo_venta()+"', cedula_cliente='"+venta.getCedula_cliente()+"', cedula_usuario='"+venta.getCedula_usuario()+"', iva_venta='"+venta.getIva_venta()+"', total_venta='"+venta.getTotal_venta()+"', valor_venta='"+venta.getValor_venta()+"' WHERE codigo_venta ="+venta.getCodigo_venta());
			
			System.out.println("Se actualizo correctamente la venta");
			
			st.close();
			conex.desconectar();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			System.out.println("No se actualizo la venta");
		}
	}
	
	public ArrayList<VentaDTO> consultarVenta(int codigoVenta){
		ArrayList<VentaDTO> miVenta = new ArrayList<VentaDTO>();
		Conexion conex = new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM ventas WHERE codigo_venta = ?");
			consulta.setInt(1, codigoVenta);
			ResultSet res = consulta.executeQuery();
			
			if(res.next()){
				VentaDTO venta = new VentaDTO();
				venta.setCodigo_venta(res.getInt("codigo_venta"));
				venta.setCedula_cliente(res.getInt("cedula_cliente"));
				venta.setCedula_usuario(res.getInt("cedula_usuario"));
				venta.setIva_venta(res.getDouble("iva_venta"));
				venta.setTotal_venta(res.getDouble("total_venta"));
				venta.setValor_venta(res.getDouble("valor_venta"));
				miVenta.add(venta); 
			}
			res.close(); 
			consulta.close();
			conex.desconectar(); 
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		} 
		return miVenta; 	
	}
		
	public void eliminarVenta(int venta) { 
		Conexion conex = new Conexion();
		try { 
			String query = "DELETE FROM ventas WHERE codigo_venta = ?"; 
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, venta);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage()); 
		} 
	}
	
	
	

}
