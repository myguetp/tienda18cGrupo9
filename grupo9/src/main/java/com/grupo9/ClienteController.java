package com.grupo9;


import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ClienteDAO;
import com.grupo9.DTO.ClienteDTO;


@RestController
public class ClienteController {
		
		@RequestMapping("/registrarCliente")
		public void registrarCliente (ClienteDTO cliente) {
			ClienteDAO Dao=new ClienteDAO();
			Dao.registrarCliente(cliente);
		}
		@RequestMapping("/consultarCliente")
		public ArrayList <ClienteDTO> consultarCliente (int cedulaCliente){
			ClienteDAO Dao=new ClienteDAO();
			return Dao.consultarCliente(cedulaCliente);
		}
		@RequestMapping("/listaDeClientes")
		public ArrayList <ClienteDTO> listaDeClientes(){
			ClienteDAO Dao=new ClienteDAO();
			return Dao.listaDeClientes();
		}					
		
		@RequestMapping("/editarCliente")
		public void editarCliente (ClienteDTO cliente) {
			ClienteDAO Dao=new ClienteDAO();
			Dao.editarCliente(cliente);
		}	
		@RequestMapping("/eliminarCliente")
		public void eliminarCliente(int cedula) {
			ClienteDAO Dao = new ClienteDAO();
			Dao.eliminarCliente(cedula);
		}

}

