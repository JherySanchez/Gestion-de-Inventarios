package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.TipoProducto;

public interface TipoProductoService {
    List<TipoProducto> listar();
    //Prueba para restaurar
    List<TipoProducto> listarInactivos();
    TipoProducto guardar(TipoProducto tipo);
    TipoProducto buscarPorId(Integer id);
    void eliminar(Integer id);
    //Prueba para restaurar
    void restaurar(Integer id);
}
