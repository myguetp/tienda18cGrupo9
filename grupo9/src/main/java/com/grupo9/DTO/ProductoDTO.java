package com.grupo9.DTO;

import java.util.Objects;

public class ProductoDTO {
	private int codigoProducto;
	private double ivaCompra;
	private int nitProveedor;
	private String nombreProducto;
	private double precioCompra;
	private double precioVenta;
	public ProductoDTO(int codigoProducto, double ivaCompra, int nitProveedor, String nombreProducto,
			double precioCompra, double precioVenta) {

		this.codigoProducto = codigoProducto;
		this.ivaCompra = ivaCompra;
		this.nitProveedor = nitProveedor;
		this.nombreProducto = nombreProducto;
		this.precioCompra = precioCompra;
		this.precioVenta = precioVenta;
	}
	
	public ProductoDTO() {
	}
	
	
	
	
	public int getCodigoProducto() {
		return codigoProducto;
	}
	public void setCodigoProducto(int codigoProducto) {
		this.codigoProducto = codigoProducto;
	}
	public double getIvaCompra() {
		return ivaCompra;
	}
	public void setIvaCompra(double ivaCompra) {
		this.ivaCompra = ivaCompra;
	}
	public int getNitProveedor() {
		return nitProveedor;
	}
	public void setNitProveedor(int nitProveedor) {
		this.nitProveedor = nitProveedor;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public double getPrecioCompra() {
		return precioCompra;
	}
	public void setPrecioCompra(double precioCompra) {
		this.precioCompra = precioCompra;
	}
	public double getPrecioVenta() {
		return precioVenta;
	}
	public void setPrecioVenta(double precioVenta) {
		this.precioVenta = precioVenta;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigoProducto, ivaCompra, nitProveedor, nombreProducto, precioCompra, precioVenta);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductoDTO other = (ProductoDTO) obj;
		return codigoProducto == other.codigoProducto
				&& Double.doubleToLongBits(ivaCompra) == Double.doubleToLongBits(other.ivaCompra)
				&& nitProveedor == other.nitProveedor && Objects.equals(nombreProducto, other.nombreProducto)
				&& Double.doubleToLongBits(precioCompra) == Double.doubleToLongBits(other.precioCompra)
				&& Double.doubleToLongBits(precioVenta) == Double.doubleToLongBits(other.precioVenta);
	}

	@Override
	public String toString() {
		return "ProductoDTO [codigoProducto=" + codigoProducto + ", ivaCompra=" + ivaCompra + ", nitProveedor="
				+ nitProveedor + ", nombreProducto=" + nombreProducto + ", precioCompra=" + precioCompra
				+ ", precioVenta=" + precioVenta + "]";
	}

}
