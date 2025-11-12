package com.example.demo.Service.Impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.Model.TipoProducto;
import com.example.demo.Model.Producto;
import com.example.demo.Repository.ProductoRepository;
import com.example.demo.Repository.TipoProductoRepository;
import com.example.demo.Service.TipoProductoService;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

    private final TipoProductoRepository repo;
    private final ProductoRepository productoRepository;


    public TipoProductoServiceImpl(TipoProductoRepository repo, ProductoRepository productoRepository) {
        this.repo = repo;
        this.productoRepository = productoRepository;
    }

    @Override
    public List<TipoProducto> listar() {
        return repo.findByEstado("ACTIVO");
    }

    //Prueba para restarurar
    @Override
    public List<TipoProducto> listarInactivos() {
        return repo.findByEstado("INACTIVO");
    }

    @Override
    public TipoProducto guardar(TipoProducto tipo) {
        if (tipo.getEstado() == null) {
            tipo.setEstado("ACTIVO");
        }
        return repo.save(tipo);
    }

    @Override
    public TipoProducto buscarPorId(Integer id) {
        return repo.findById(id).orElse(null);
    }

    @Override
    public void eliminar(Integer id) {
        TipoProducto tipo = this.buscarPorId(id);
        if (tipo != null) {
            tipo.setEstado("INACTIVO");
            repo.save(tipo);

            List<Producto> productosRelacionados = productoRepository.findByTipoProducto(tipo);
            //Pruebas
            for (Producto prod : productosRelacionados) {
                //Todo el if se borra
                if(!prod.getEstado().equals("INACTIVO")){
                    prod.setEstado("INACTIVO");
                    productoRepository.save(prod);   
                }
                /*prod.setEstado("INACTIVO");
                productoRepository.save(prod);*/
            }
        }
    }


    //prueba de restaurar
    @Override
    public void restaurar(Integer id) {
        TipoProducto tipo = this.buscarPorId(id);
        if (tipo != null) {
            // 1. Restaurar la categoría
            tipo.setEstado("ACTIVO");
            repo.save(tipo);

            List<Producto> productosRelacionados = productoRepository.findByTipoProducto(tipo);
            for (Producto prod : productosRelacionados) {
                // Importante: Solo se restaura productos que se marcaron como INACTIVO
                // La lógica de borrado pone a todos "INACTIVO",
                // los volvemos a un estado por defecto "Disponible"
                if (prod.getEstado().equals("INACTIVO")) {
                    prod.setEstado("Disponible"); // Estado por defecto al restaurar
                    productoRepository.save(prod);
                }
            }
        }
    }
}
