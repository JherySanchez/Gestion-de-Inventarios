package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.Model.TipoProducto;
import com.example.demo.Service.TipoProductoService;

@Controller
@RequestMapping("/tipos")
public class TipoProductoController {

    private final TipoProductoService tipoService;

    // Constructor para inyección de dependencias
    public TipoProductoController(TipoProductoService tipoService) {
        this.tipoService = tipoService;
    }

    // Listar todos los tipos de productos
    @GetMapping
    public String listar(Model model) {
        model.addAttribute("tipos", tipoService.listar());
        model.addAttribute("tipoProducto", new TipoProducto());
        return "tipo-producto";
    }

    // Guardar un tipo de producto (crear o actualizar)
    @PostMapping("/guardar")
    public String guardar(@ModelAttribute TipoProducto tipo) {
        tipoService.guardar(tipo);
        return "redirect:/tipos";
    }

    // Eliminar un tipo de producto por su ID
    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable Integer id) {
        tipoService.eliminar(id);
        return "redirect:/tipos";
    }
}
