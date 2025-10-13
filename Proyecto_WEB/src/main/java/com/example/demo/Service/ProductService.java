package com.example.demo.Service;

import java.util.List;

import com.example.demo.Model.Producto;
import com.example.demo.Model.DTO.ActivitiesDTO;


public interface ProductService {

    public List<Producto> listProduct();
    public Producto buscarProducto(Integer idProducto);
    public void addProduct(Producto producto);
    public void updateProduct(Producto producto);
    public void deleteProduct(Integer idProducto);
    public List<ActivitiesDTO> getAllActivitiesService();
    
}
