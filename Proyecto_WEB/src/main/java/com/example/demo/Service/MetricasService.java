package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.Repository.MetricasRepository;
import java.util.Map;

@Service
public class MetricasService {

    @Autowired
    private MetricasRepository metricasRepository;

    public Map<String, Integer> obtenerProductosMasVendidos() {
        return metricasRepository.obtenerProductosMasVendidos();
    }

    public Map<String, Double> obtenerVentasMensuales() {
        return metricasRepository.obtenerVentasMensuales();
    }

    public Map<String, Integer> obtenerEstadoStock() {
        return metricasRepository.obtenerEstadoStock();
    }

    public Map<String, Map<String, Integer>> obtenerVentasMensualesPorProducto() {
        return metricasRepository.obtenerVentasMensualesPorProducto();
    }
}
