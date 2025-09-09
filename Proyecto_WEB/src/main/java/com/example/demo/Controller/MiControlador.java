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

    @GetMapping("/gestion-usuarios")
    public String mostrarGestionUsuarios() {
        return "gestion-usuarios";
    }
    
    @GetMapping("/metricas")
    public String mostrarMetricas() {
        return "metricas";
    }

    @GetMapping("/contacto")
    public String mostrarContacto() {
        return "contacto";
    }

    @GetMapping("/direccion")
    public String mostrarDireccion() {
        return "direccion";
    }

    @GetMapping("/configuracion")
    public String mostrarConfiguracion() {
        return "configuracion";
    }


    //Ejemplo de envio
    @PostMapping("/contacto")
    public String procesarContacto(@RequestParam("name") String name,
                                   @RequestParam("email") String email,
                                   @RequestParam("subject") String subject,
                                   @RequestParam("message") String message,
                                   Model model) {
        // Aquí se guardan los datos BD o enviarlos por email
        System.out.println("Nuevo mensaje de contacto:");
        System.out.println("Nombre: " + name);
        System.out.println("Email: " + email);
        System.out.println("Asunto: " + subject);
        System.out.println("Mensaje: " + message);

        model.addAttribute("successMessage", "Mensaje enviado correctamente!");
        return "contacto"; // recarga la página de contacto
    }

    @PostMapping("/configuracion")
    public String procesarConfiguracion(@RequestParam("nombreEmpresa") String nombreEmpresa,
                                        @RequestParam("emailEmpresa") String emailEmpresa,
                                        @RequestParam("telefono") String telefono,
                                        @RequestParam("direccion") String direccion,
                                        Model model) {
        // Aquí podrías guardar la configuración en la DB
        System.out.println("Configuración actualizada:");
        System.out.println("Nombre Empresa: " + nombreEmpresa);
        System.out.println("Email: " + emailEmpresa);
        System.out.println("Teléfono: " + telefono);
        System.out.println("Dirección: " + direccion);

        model.addAttribute("successMessage", "¡Configuración actualizada con éxito!");
        return "configuracion";
    }
    
}
