package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Model.Producto;
import com.example.demo.Model.TipoProducto;
import com.example.demo.Model.DTO.ActivitiesDTO;
import com.example.demo.Service.ProductService;
import com.example.demo.Service.TipoProductoService;

import com.example.demo.Model.Usuario;
import com.example.demo.Service.UsuarioService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.dao.DataIntegrityViolationException;

@Controller
public class MiControlador {

    @Autowired
    private ProductService productService;

    @Autowired
    private TipoProductoService tipoProductoService;

    @Autowired
    private UsuarioService usuarioService;

    // --- Login ---
    @GetMapping("/login")
    public String mostrarLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String procesarLogin(@RequestParam("username") String username, 
                                @RequestParam("password") String password,
                                RedirectAttributes redirectAttributes) {

        Usuario usuarioValidado = usuarioService.validarLogin(username, password);

        if (usuarioValidado != null) {
            System.out.println("Login exitoso para: " + usuarioValidado.getNombre());
            return "redirect:/dashboard";
        } else {
            System.out.println("Login fallido para el email: " + username);
            redirectAttributes.addFlashAttribute("errorMessage", "Credenciales incorrectas o usuario inactivo.");
            return "redirect:/login";
        }
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
        List<Producto> listaProducto = productService.listProduct();
        model.addAttribute("miListaProducto", listaProducto);

        // Enviamos tipos para el select
        model.addAttribute("listaTipos", tipoProductoService.listar());

        return "lista-productos";
    }

    @PostMapping("/productos/agregar")
    public String agregarOEditarProducto(
            @ModelAttribute Producto producto,
            @RequestParam("tipoId") Integer idTipo,
            RedirectAttributes redirectAttributes) {

        // Buscar el tipo seleccionado
        TipoProducto tipo = tipoProductoService.buscarPorId(idTipo);
        producto.setTipoProducto(tipo);

        // Crear o editar
        if (producto.getIdProducto() != null) {
            productService.updateProduct(producto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto actualizado con éxito.");
        } else {
            productService.addProduct(producto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto agregado con éxito.");
        }
        return "redirect:/lista-productos";
    }

    // --- Buscar productos ---
    @GetMapping("/buscar-productos")
    public String buscarProductos(@RequestParam("query") String query, Model model) {
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

    // --- Eliminar producto ---
    @GetMapping("/productos/eliminar/{idProducto}")
    public String eliminarProducto(@PathVariable("idProducto") Integer idProducto, RedirectAttributes redirectAttributes) {
        try {
            productService.deleteProduct(idProducto);
            redirectAttributes.addFlashAttribute("successMessage", "Producto eliminado con éxito.");
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error: No se puede eliminar el producto porque está en uso en un movimiento (venta o ingreso).");
        }
        return "redirect:/lista-productos";
    }

    // --- Publicidad ---
    @GetMapping("/publicidad")
    public String mostrarPublicidad() {
        return "publicidad";
    }



    // --- Contacto ---
    @GetMapping("/contacto")
    public String mostrarContacto() {
        return "contacto";
    }

    @PostMapping("/contacto")
    public String procesarContacto(@RequestParam("name") String name,
                                   @RequestParam("email") String email,
                                   @RequestParam("subject") String subject,
                                   @RequestParam("message") String message,
                                   Model model) {
        System.out.println("Nuevo mensaje de contacto:");
        System.out.println("Nombre: " + name);
        System.out.println("Email: " + email);
        System.out.println("Asunto: " + subject);
        System.out.println("Mensaje: " + message);

        model.addAttribute("successMessage", "¡Mensaje enviado correctamente!");
        return "contacto";
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
        System.out.println("Configuración actualizada:");
        System.out.println("Nombre Empresa: " + nombreEmpresa);
        System.out.println("Email: " + emailEmpresa);
        System.out.println("Teléfono: " + telefono);
        System.out.println("Dirección: " + direccion);

        model.addAttribute("successMessage", "¡Configuración actualizada con éxito!");
        return "configuracion";
    }
    //-- redes sociales ---
    @GetMapping("/redes-sociales")
    public String mostrarRedesSociales() {
        return "redes-sociales";
    }
    //--direccion---
    @GetMapping("/direccion")
    public String mostrarDireccion() {
        return "direccion";
    }
}
