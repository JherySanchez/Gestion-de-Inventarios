package com.example.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.Repository.MetricasRepository;

import java.util.Map;

@Service
public class MetricasService {

    @Autowired
    private MetricasRepository metricasRepository;
    // Ventas mensuales (suma total de dinero vendido por mes)
    public Map<String, Double> obtenerVentasMensuales() {
        return metricasRepository.obtenerVentasMensuales();
    }

    // Estado del stock
    public Map<String, Integer> obtenerEstadoStock() {
        return metricasRepository.obtenerEstadoStock();
    }

    // Ingresos mensuales (entradas al almacén)
    public Map<String, Integer> obtenerIngresosMensuales() {
        return metricasRepository.obtenerIngresosMensuales();
    }
    public Map<String, Integer> obtenerUnidadesVendidasMensuales() {
    return metricasRepository.obtenerUnidadesVendidasMensuales();
}

}
