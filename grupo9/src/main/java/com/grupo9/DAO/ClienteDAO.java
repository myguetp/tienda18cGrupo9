package com.grupo9.DAO;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.grupo9.DTO.ClienteDTO;



public class ClienteDAO {
	PreparedStatement preparedStatement;
	
		public ArrayList <ClienteDTO> listaDeClientes(){
		ArrayList <ClienteDTO> miCliente=new ArrayList<ClienteDTO>();
		Conexion conex=new Conexion();
		
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM clientes");
			ResultSet res =consulta.executeQuery();
			while(res.next()) {
				ClienteDTO clientes=new ClienteDTO();
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
	public void registrarCliente(ClienteDTO cliente) {
		Conexion conex=new Conexion();
		try {
			Statement st=conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO clientes VALUES('"+cliente.getCedulaCliente()+"','"+cliente.getDireccionCliente()+"','"+cliente.getEmailCliente()+"','"+cliente.getNombreCliente()+"','"+cliente.getTelefonoCliente()+"')");
			//JOptionPane.showMessageDialog(null, "Se ha registrado exitosamente el cliente", "Información", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			//JOptionPane.showMessageDialog(null, "No se pudo registrar el cliente");
		}
	}
	public ArrayList <ClienteDTO> consultarCliente(int documento){
		ArrayList <ClienteDTO> miCliente=new ArrayList <ClienteDTO>();
		Conexion conex=new Conexion();
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM clientes WHERE cedula_cliente=?");
			consulta.setInt(1, documento);
			ResultSet res = consulta.executeQuery();
			if(res.next()) {
				ClienteDTO clientes=new ClienteDTO();
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
			//JOptionPane.showMessageDialog(null, "No se pudo consultar el cliente" + e);
			System.out.println(e.getMessage());
		}
		return miCliente;
	}
	public void eliminarCliente(int cedula) {
		Conexion conex=new Conexion();
		try {
			String query="DELETE FROM clientes WHERE cedula_cliente=?";
			preparedStatement=conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, cedula);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	

     public void actualizarcliente(int cedula) {
		Conexion conex = new Conexion();
		try {
			String query = "update CLIENTES set  direccion_cliente=?, email_cliente=?, nombre_cliente=?, telefono_cliente=? where cedula_cliente=?";
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
    }

}
