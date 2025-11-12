package com.example.demo.Controller;

import com.example.demo.Model.Usuario;
import com.example.demo.Service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.dao.DataIntegrityViolationException;
import java.util.List;

@Controller
@RequestMapping("/gestion-usuarios") 
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public String listarUsuarios(Model model) {
        List<Usuario> usuarios = usuarioService.obtenerTodosLosUsuarios(); 
        model.addAttribute("usuarios", usuarios); 
        return "gestion-usuarios"; 
    }

    @PostMapping("/agregar")
    public String agregarUsuario(@ModelAttribute Usuario usuario, Model model) {
        try {
            usuarioService.crearNuevoUsuario(usuario.getNombre(), usuario.getEmail(), usuario.getRol(), usuario.getEstado());
            return "redirect:/gestion-usuarios"; 
            
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return listarUsuarios(model);
        }
    }


    @GetMapping("/eliminar/{id}") 
    public String eliminarUsuario(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
        try {
            usuarioService.eliminarUsuario(id);
            redirectAttributes.addFlashAttribute("successMessage", "Usuario eliminado con éxito.");
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error: No se puede eliminar el usuario porque está asociado a una o más ventas.");
        }
        return "redirect:/gestion-usuarios"; 
    }

    @PostMapping("/editar/{id}") 
    public String editarUsuario(@PathVariable("id") Integer id, @ModelAttribute Usuario usuario) {
        
        usuario.setIdUsuario(id);
        usuarioService.actualizarUsuario(usuario);  
        System.out.println("Guardando cambios para el usuario con ID: " + id);
        return "redirect:/gestion-usuarios";
    }
}