package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.TipoProducto;

public interface TipoProductoService {
    List<TipoProducto> listar();
    TipoProducto guardar(TipoProducto tipo);
    TipoProducto buscarPorId(Integer id);
    void eliminar(Integer id);
}
