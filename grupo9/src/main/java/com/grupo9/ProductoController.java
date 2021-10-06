package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ProductoDAO;
import com.grupo9.DTO.ProductoDTO;


@RestController
public class ProductoController {
	
	@RequestMapping("/registrarProducto")
	public void registrarProducto(ProductoDTO producto) {
		ProductoDAO Dao = new ProductoDAO();
		Dao.registrarProducto(producto);
	}
	
	@RequestMapping("/consultarProducto")
	public ArrayList<ProductoDTO> consultarProducto(int codProducto){
		ProductoDAO Dao = new ProductoDAO();
		return Dao.consultarProducto(codProducto);
	}
	
	@RequestMapping("/listarProducto")
	public ArrayList<ProductoDTO> listaDeProducto(){
		ProductoDAO Dao = new ProductoDAO();
		return Dao.listaDeProducto();
	}
	
	@RequestMapping("/eliminarProducto")
	public void eliminarProducto(int codProducto) {
		ProductoDAO Dao = new ProductoDAO();
		Dao.eliminarProducto(codProducto);
	}
	
	@RequestMapping("/editarProducto")
	public void editarProducto(ProductoDTO producto){
		ProductoDAO Dao = new ProductoDAO();
		Dao.editarProducto(producto);
	}


}
