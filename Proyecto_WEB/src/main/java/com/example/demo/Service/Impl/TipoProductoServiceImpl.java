package com.example.demo.Service.Impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.Model.TipoProducto;
import com.example.demo.Repository.TipoProductoRepository;
import com.example.demo.Service.TipoProductoService;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

    private final TipoProductoRepository repo;

    public TipoProductoServiceImpl(TipoProductoRepository repo) {
        this.repo = repo;
    }

    @Override
    public List<TipoProducto> listar() {
        return repo.findAll();
    }

    @Override
    public TipoProducto guardar(TipoProducto tipo) {
        return repo.save(tipo);
    }

    @Override
    public TipoProducto buscarPorId(Integer id) {
        return repo.findById(id).orElse(null);
    }

    @Override
    public void eliminar(Integer id) {
        repo.deleteById(id);
    }
}
