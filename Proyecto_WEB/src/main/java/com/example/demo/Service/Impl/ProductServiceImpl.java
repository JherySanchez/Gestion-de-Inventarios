package com.example.demo.Service.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.Model.Producto;
import com.example.demo.Repository.ProductoRepository;
import com.example.demo.Service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductoRepository productoRepository;

    @Override
    public List<Producto> listProduct() {
        return productoRepository.findAll();
    }

    @Override
    public Producto buscarProducto(Integer idProducto) {
        return productoRepository.findById(idProducto).orElse(null);
    }

    @Override
    public void addProduct(Producto producto) {
        // El método save sirve tanto para crear como para actualizar
        productoRepository.save(producto);
    }

    @Override
    public void updateProduct(Producto producto) {
        productoRepository.save(producto);
    }

    @Override
    public void deleteProduct(Integer idProducto) {
        productoRepository.deleteById(idProducto);
    }
}