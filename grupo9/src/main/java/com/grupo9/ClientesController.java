package com.grupo9;


public class ClientesController {

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ClientesDAO;
import com.grupo9.DTO.ClientesDTO;


@RestController
public class ClientesController {
		
		@RequestMapping("/registrarClientes")
		public void resgistarClientes (ClientesDTO clientes) {
			ClientesDAO Dao=new ClientesDAO();
			Dao.registrarCliente(clientes);
		}
		@RequestMapping("/consultarClientes")
		public ArrayList <ClientesDTO> consultarClientes (int documento){
			ClientesDAO Dao=new ClientesDAO();
			return Dao.consultarClientes(documento);
		}
		@RequestMapping("/listarClientes")
		public ArrayList <ClientesDTO> listaDeClientes(){
			ClientesDAO Dao=new ClientesDAO();
			return Dao.listaDeClientes();
		}
		@RequestMapping("/eliminarCliente")
		public void eliminarCliente(int documento) {
			ClientesDAO Dao=new ClientesDAO();
			Dao.eliminarCliente(documento);
		}


}

