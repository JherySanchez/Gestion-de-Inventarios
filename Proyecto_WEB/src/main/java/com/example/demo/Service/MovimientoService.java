package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.Model.DTO.MovimientoDTO;
import com.example.demo.Model.Ingreso;
import com.example.demo.Model.Venta;
import com.example.demo.Repository.IngresoRepository;
import com.example.demo.Repository.VentaRepository;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.stream.Collectors;

@Service
public class MovimientoService {

    @Autowired
    private IngresoRepository ingresoRepository;

    @Autowired
    private VentaRepository ventaRepository;

    public List<MovimientoDTO> getTodosLosMovimientos() {
        List<MovimientoDTO> movimientos = new ArrayList<>();

        // Mapear Ingresos a DTO
        List<Ingreso> ingresos = ingresoRepository.findAll();
        for (Ingreso ingreso : ingresos) {
            String descripcion = "Ingreso de " + ingreso.getCantidad() + " unidades de " + ingreso.getProducto().getNombre();
            movimientos.add(new MovimientoDTO(ingreso.getId_ingreso(), ingreso.getFecha_ingreso(), "Ingreso", descripcion, null));
        }

        // Mapear Ventas a DTO
        List<Venta> ventas = ventaRepository.findAll();
        for (Venta venta : ventas) {
            String descripcion = "Venta a " + venta.getUsuario().getNombre() + " (" + venta.getDetalles().size() + " productos)";
            movimientos.add(new MovimientoDTO(venta.getId_venta(), venta.getFecha_venta(), "Venta", descripcion, venta.getTotal()));
        }

        // Ordenar la lista combinada por fecha descendente
        return movimientos.stream()
                .sorted(Comparator.comparing(MovimientoDTO::getFecha).reversed())
                .collect(Collectors.toList());
    }
}
