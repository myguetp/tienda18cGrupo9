package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ProveedorDAO;
import com.grupo9.DTO.ProveedorDTO;


@RestController
public class ProveedorController {
	
	@RequestMapping("/registrarProveedor")
	public void registrarProveedor(ProveedorDTO proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.registrarProveedor(proveedor);
	}
	
	@RequestMapping("/consultarProveedor")
	public ArrayList<ProveedorDTO> consultarProveedor(int nit){
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.consultarProveedor(nit);
	}
	
	@RequestMapping("/listaDeProveedores")
	public ArrayList<ProveedorDTO> listaDeProveedores(){
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.listaDeProveedores();
	}
	
	@RequestMapping("/eliminarProveedor")
	public void eliminarProveedor(int nit) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.eliminarProveedor(nit);
	}
	
	@RequestMapping("/editarProveedor")
	public void editarProveedor(ProveedorDTO proveedor){
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.editarProveedor(proveedor);
			
	}

}
