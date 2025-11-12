package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.example.demo.Service.MetricasService;
import org.springframework.http.ResponseEntity;
import java.util.Map;

@Controller
@RequestMapping("/metricas")
public class MetricasController {

    @Autowired
    private MetricasService metricasService;

    @GetMapping
    public String verMetricas(Model model) {
        return "metricas"; // JSP
    }

    // --- Endpoints para los gráficos (JSON) ---
    @GetMapping("/productos-vendidos")
    @ResponseBody
    public Map<String, Integer> getProductosMasVendidos() {
        return metricasService.obtenerProductosMasVendidos();
    }

    @GetMapping("/ventas-mensuales")
    @ResponseBody
    public Map<String, Double> getVentasMensuales() {
        return metricasService.obtenerVentasMensuales();
    }

    @GetMapping("/stock")
    @ResponseBody
    public Map<String, Integer> getEstadoStock() {
        return metricasService.obtenerEstadoStock();
    }
    @GetMapping("/ventas-mensuales-por-producto")
    public ResponseEntity<Map<String, Map<String, Integer>>> obtenerVentasMensualesPorProducto() {
        return ResponseEntity.ok(metricasService.obtenerVentasMensualesPorProducto());
    }
}
