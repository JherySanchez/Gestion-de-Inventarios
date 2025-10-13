package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Model.Producto;
import com.example.demo.Model.DTO.ActivitiesDTO;
import com.example.demo.Service.ProductService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.dao.DataIntegrityViolationException;

@Controller
public class MiControlador {

    @Autowired
    private ProductService productService;
    
    // --- Login ---
    @GetMapping("/login")
    public String mostrarLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String procesarLogin(@RequestParam("username") String username, 
                                @RequestParam("password") String password, 
                                Model model) {
        System.out.println("Usuario: " + username);
        System.out.println("Contraseña: " + password);
        return "redirect:/dashboard";
    }
    
    // --- Dashboard ---
    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String mostrarDashboard(Model model) {
        List<ActivitiesDTO> listaRegistro = productService.getAllActivitiesService();
        model.addAttribute("listaRegistros", listaRegistro);
        return "dashboard";
    }

    // --- Catálogo ---
    @GetMapping("/catalogo")
    public String mostrarCatalogo() {
        return "catalogo";
    }

    // --- Lista de Productos ---
    @GetMapping("/lista-productos")
    public String mostrarListaProductos(Model model) {
        List<Producto> listaProducto= productService.listProduct();
        model.addAttribute("miListaProducto", listaProducto);
        return "lista-productos";

    }
    // --- Lista de Productos ---
    // CAMBIO: Lógica de búsqueda mejorada
    @GetMapping("/buscar-productos")
    public String buscarProductos(@RequestParam("query") String query,Model model) {
        List<Producto> productosEncontrados = new java.util.ArrayList<>();
        try {
            Integer idProducto = Integer.parseInt(query);
            Producto productoEncontrado = productService.buscarProducto(idProducto);
            if (productoEncontrado != null) {
                productosEncontrados.add(productoEncontrado);
            }
        } catch (NumberFormatException e) {
            System.out.println("El término de búsqueda no es un ID válido: " + query);
        }
        model.addAttribute("miListaProducto", productosEncontrados);
        return "lista-productos";
    }

    @PostMapping("/productos/agregar")
    public String agregarOEditarProducto(@ModelAttribute Producto producto, RedirectAttributes redirectAttributes) {
        
        // Si el producto tiene un ID, es una actualizacion. Si no, se crea
        if (producto.getIdProducto() != null) {
            productService.updateProduct(producto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto actualizado con éxito.");
        } else {
            productService.addProduct(producto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto agregado con éxito.");
        }
        return "redirect:/lista-productos";
    }

    @GetMapping("/productos/eliminar/{idProducto}")
    public String eliminarProducto(@PathVariable("idProducto") Integer idProducto, RedirectAttributes redirectAttributes) {
        try {
            productService.deleteProduct(idProducto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto eliminado con éxito.");
        } catch (DataIntegrityViolationException e) {
            // Esto ocurre si el producto está en uso (ej. en una venta o ingreso)
            redirectAttributes.addFlashAttribute("errorMessage", "Error: No se puede eliminar el producto porque está en uso en un movimiento (venta o ingreso).");
        }
        return "redirect:/lista-productos";
    }

    // --- Publicidad ---
    @GetMapping("/publicidad")
    public String mostrarPublicidad() {
        return "publicidad";
    }

    // --- Métricas ---
    @GetMapping("/metricas")
    public String mostrarMetricas() {
        return "metricas";
    }

    // --- Contacto ---
    @GetMapping("/contacto")
    public String mostrarContacto() {
        return "contacto";
    }

    @GetMapping("/direccion")
    public String mostrarDireccion() {
        return "direccion";
    }

    @PostMapping("/contacto")
    public String procesarContacto(@RequestParam("name") String name,
                                   @RequestParam("email") String email,
                                   @RequestParam("subject") String subject,
                                   @RequestParam("message") String message,
                                   Model model) {
        // Aquí podrías guardar los datos en DB o enviarlos por email
        System.out.println("Nuevo mensaje de contacto:");
        System.out.println("Nombre: " + name);
        System.out.println("Email: " + email);
        System.out.println("Asunto: " + subject);
        System.out.println("Mensaje: " + message);

        // Mandamos un atributo para mostrar mensaje de éxito en la vista
        model.addAttribute("successMessage", "¡Mensaje enviado correctamente!");
        return "contacto"; // recarga la página de contacto
    }

    // --- Configuración ---
    @GetMapping("/configuracion")
    public String mostrarConfiguracion() {
        return "configuracion";
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
