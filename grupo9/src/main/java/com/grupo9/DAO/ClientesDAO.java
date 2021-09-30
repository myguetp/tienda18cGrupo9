package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.grupo9.DTO.ClientesDTO;

public class ClientesDAO {
	
	PreparedStatement preparedStatement;
	
	public ArrayList <ClientesDTO> listaDeClientes(){
		ArrayList <ClientesDTO> miCliente=new ArrayList<ClientesDTO>();
		Conexion conex=new Conexion();
		
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM clientes");
			ResultSet res =consulta.executeQuery();
			while(res.next()) {
				ClientesDTO clientes=new ClientesDTO();
				clientes.setCedulaCliente(Integer.parseInt(res.getString("cedula_cliente")));
				clientes.setDireccionCliente(res.getString("direccion_cliente"));
				clientes.setEmailCliente(res.getString("email_cliente"));
				clientes.setNombreCliente(res.getString("nombre_cliente"));
				clientes.setTelefonoCliente(res.getString("telefono_cliente"));
				
				miCliente.add(clientes);
				}
				res.close();
				consulta.close();
				conex.desconectar();
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "No se puede realizar la consulta" + e);
		}
		return miCliente;
		}
	public void registrarCliente(ClientesDTO clientes) {
		Conexion conex=new Conexion();
		try {
			Statement st=conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO clientes VALUES('"+clientes.getCedulaCliente()+"', '"+clientes.getDireccionCliente()+"', '"+clientes.getEmailCliente()+"', '"+clientes.getNombreCliente()+"', '"+clientes.getTelefonoCliente()+"')");
			JOptionPane.showMessageDialog(null, "Se ha registrado exitosamente el cliente", "INFORMACION", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null, "No se pudo registrar el cliente");
		}
	}
	public ArrayList <ClientesDTO> consultarClientes(int documento){
		ArrayList <ClientesDTO> miCliente=new ArrayList <ClientesDTO>();
		Conexion conex=new Conexion();
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM clientes WHERE cedula_cliente=?");
			consulta.setInt(1, documento);
			ResultSet res = consulta.executeQuery();
			if(res.next()) {
				ClientesDTO clientes=new ClientesDTO();
				clientes.setCedulaCliente(Integer.parseInt(res.getString("cedula_cliente")));
				clientes.setDireccionCliente(res.getString("direccion_cliente"));
				clientes.setEmailCliente(res.getString("email_cliente"));
				clientes.setNombreCliente(res.getString("nombre_cliente"));
				clientes.setTelefonoCliente(res.getString("telefono_cliente"));
				
				miCliente.add(clientes);
			}
			res.close();
			consulta.close();
			conex.desconectar();
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "No se pudo consultar el cliente" + e);
		}
		return miCliente;
	}
	public void eliminarCliente(int documento) {
		Conexion conex=new Conexion();
		try {
			String query="DELETE FROM clientes WHERE cedula_cliente=?";
			preparedStatement=conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, documento);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
