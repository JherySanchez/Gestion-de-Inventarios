package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.example.demo.Service.MetricasService;

import java.util.Map;

@Controller
@RequestMapping("/metricas")
public class MetricasController {

    @Autowired
    private MetricasService metricasService;

    @GetMapping
    public String verMetricas(Model model) {
        return "metricas"; // JSP principal
    }

    // --- JSON ENDPOINTS PARA LOS GRÁFICOS ---
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

    @GetMapping("/ingresos-mensuales")
    @ResponseBody
    public Map<String, Integer> getIngresosMensuales() {
        return metricasService.obtenerIngresosMensuales();
    }
    @GetMapping("/unidades-vendidas-mensuales")
    @ResponseBody
    public Map<String, Integer> getUnidadesVendidasMensuales() {
        return metricasService.obtenerUnidadesVendidasMensuales();
    }

}