package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.grupo9.DTO.ProveedorDTO;

public class ProveedorDAO {
	PreparedStatement preparedStatement;
	
	public ArrayList<ProveedorDTO> listaDeProveedores(){
		ArrayList<ProveedorDTO> miProveedor = new ArrayList<>();
		Conexion conex = new Conexion();
		
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ProveedorDTO proveedor = new ProveedorDTO();
				proveedor.setNitProveedor(res.getInt("nit_proveedor"));
				proveedor.setCiudadProveedor(res.getString("ciudad_proveedor"));
				proveedor.setDireccionProveedor(res.getString("direccion_proveedor"));
				proveedor.setNombreProveedor(res.getString("nombre_proveedor"));
				proveedor.setTelefonoProveedor(res.getString("telefono_proveedor"));
				
				miProveedor.add(proveedor);
					}
					res.close();
					consulta.close();
					conex.desconectar();
		
			}
		catch(Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo realizar consulta"+e);
		}
		return miProveedor;
		}
		
	public void registrarProveedor(ProveedorDTO proveedor) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO proveedores VALUES ('"+proveedor.getNitProveedor()+"', '"+proveedor.getCiudadProveedor()+"', '"+proveedor.getDireccionProveedor()+"', '"+proveedor.getNombreProveedor()+"', '"+proveedor.getTelefonoProveedor()+"')");
			//JOptionPane.showMessageDialog(null, "Se ha registrado exitosamente", "Información", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			//JOptionPane.showMessageDialog(null, "No se pudo registrar proveedor");
		}
	}
	public ArrayList<ProveedorDTO> consultarProveedor(int nit){
		ArrayList<ProveedorDTO> miProveedor = new ArrayList<>();
		Conexion conex = new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores WHERE nit_proveedor = ?");
			consulta.setInt(1, nit);
			ResultSet res = consulta.executeQuery();
			
			if(res.next()){
				ProveedorDTO proveedor = new ProveedorDTO();
				proveedor.setNitProveedor(res.getInt("nit_proveedor"));
				proveedor.setCiudadProveedor(res.getString("ciudad_proveedor"));
				proveedor.setDireccionProveedor(res.getString("direccion_proveedor"));
				proveedor.setNombreProveedor(res.getString("nombre_proveedor"));
				proveedor.setTelefonoProveedor(res.getString("telefono_proveedor"));
				miProveedor.add(proveedor); 
			}
			res.close(); 
			consulta.close();
			conex.desconectar(); 
		}catch(Exception e) {
			//JOptionPane.showMessageDialog(null, "No se pudeo consultar al proveedor" +e); 
			System.out.println(e.getMessage());
		} 
		return miProveedor; 	
	}
		
	public void eliminarProveedor(int nit) { 
		Conexion conex = new Conexion();
		try { 
			String query = "DELETE FROM proveedores WHERE nit_proveedor = ?"; 
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, nit);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage()); 
		} 
	}

}
