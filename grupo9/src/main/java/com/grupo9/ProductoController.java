package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ProductoDAO;
import com.grupo9.DTO.ProductoDTO;

@RestController
public class ProductoController {

	@RequestMapping("/registrarProducto")
	public void registrarProducto (ProductoDTO producto) {
		ProductoDAO Dao=new ProductoDAO();
		Dao.registrarProducto(producto);
	}
	@RequestMapping("/consultarProducto")
	public ArrayList <ProductoDTO> consultarProducto (int codigo){
		ProductoDAO Dao=new ProductoDAO();
		return Dao.consultarProducto(codigo);
	}
	@RequestMapping("/listaDeProductos")
	public ArrayList <ProductoDTO> listaDeProducto(){
		ProductoDAO Dao=new ProductoDAO();
		return Dao.listaDeProductos();
	}
	@RequestMapping("/eliminarProducto")
	public void eliminarProducto(int codigo) {
		ProductoDAO Dao=new ProductoDAO();
		Dao.eliminarProducto(codigo);
	}
	
	@RequestMapping("/editarProducto")
	public void editarProducto(ProductoDTO producto){
		ProductoDAO Dao = new ProductoDAO();
		Dao.editarProducto(producto);
	}
}