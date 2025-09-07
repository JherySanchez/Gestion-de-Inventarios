package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MiControlador {

    @GetMapping("/login")
    public String mostrarLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String procesarLogin(@RequestParam("username") String username, 
                                @RequestParam("password") String password, 
                                Model model) {
        // Aquí iría tu lógica de autenticación.
        // Por ahora, solo imprimimos los datos y redirigimos a una página de éxito.
        System.out.println("Usuario: " + username);
        System.out.println("Contraseña: " + password);
        return "redirect:/dashboard"; // Redirige al dashboard si el login es exitoso
    }
    
    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/login";
    }
    
    @GetMapping("/dashboard")
    public String mostrarDashboard() {
        return "dashboard";
    }
    
    @GetMapping("/catalogo")
    public String mostrarCatalogo() {
        return "catalogo";
    }
    
    @GetMapping("/lista-productos")
    public String mostrarListaProductos() {
        return "lista-productos";
    }
    
    @GetMapping("/publicidad")
    public String mostrarPublicidad() {
        return "publicidad";
    }
    
}
