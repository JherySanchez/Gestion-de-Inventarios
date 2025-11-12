package com.example.demo.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.security.SecureRandom;
import com.example.demo.Model.Usuario;
import com.example.demo.Repository.UsuarioRepository;
import java.util.List;
import java.util.Optional;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository; // Repositorio para guardar en H2

    // Caracteres que se usarán para generar la contraseña
    private static final String CARACTERES = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int LONGITUD_PASSWORD = 8;
    private static final SecureRandom random = new SecureRandom();

    private String generarContrasenaAleatoria() {
        StringBuilder sb = new StringBuilder(LONGITUD_PASSWORD);
        for (int i = 0; i < LONGITUD_PASSWORD; i++) {
            // Selecciona un carácter aleatorio de la cadena 'CARACTERES'
            int indice = random.nextInt(CARACTERES.length());
            sb.append(CARACTERES.charAt(indice));
        }
        return sb.toString();
    }
    
    public Usuario crearNuevoUsuario(String nombre, String email, String rol, String estado) {

        // Validar la Regla de Negocio del Email
        if (!email.toLowerCase().endsWith("@gmail.com")) {
            throw new IllegalArgumentException("El email debe ser una cuenta @gmail.com.");
        }

        // Generar Contraseña de 8 dígitos
        String contrasenaPlana = generarContrasenaAleatoria(); 

        // Crear el Objeto Usuario
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setEmail(email);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstado(estado);
        nuevoUsuario.setPassword(contrasenaPlana);

        // Guardar el Usuario en H2
        Usuario usuarioGuardado = usuarioRepository.save(nuevoUsuario);

        // Notificar al administrador o mostrar la contraseña
        System.out.println(" ATENCIÓN: Contraseña generada para el usuario: " + contrasenaPlana);

        return usuarioGuardado;
    }

    public List<Usuario> obtenerTodosLosUsuarios() {
    // Llama al metodo findAll() proporcionado por JpaRepository
    return usuarioRepository.findAll();
    }

    public void actualizarUsuario(Usuario usuarioNuevo) {

        Usuario usuarioExistente = usuarioRepository.findById(usuarioNuevo.getIdUsuario())
            .orElseThrow(() -> new RuntimeException("Error: Usuario con ID " + usuarioNuevo.getIdUsuario() + " no encontrado para actualización."));
        usuarioExistente.setNombre(usuarioNuevo.getNombre());
        usuarioExistente.setEmail(usuarioNuevo.getEmail());
        usuarioExistente.setRol(usuarioNuevo.getRol());
        usuarioExistente.setEstado(usuarioNuevo.getEstado());
        usuarioRepository.save(usuarioExistente);
    }

    public void eliminarUsuario(Integer id) {
        usuarioRepository.deleteById(id);
    }

    public Usuario validarLogin(String email, String password) {
        
        Optional<Usuario> usuarioOpt = usuarioRepository.findByEmail(email);

        if (usuarioOpt.isEmpty()) {
            return null;
        }

        Usuario usuario = usuarioOpt.get();

        if (!usuario.getPassword().equals(password)) {
            return null;
        }
        
        if (!usuario.getEstado().equalsIgnoreCase("ACTIVO")) {
            return null; // El usuario existe pero está inactivo
        }
        return usuario;
    }


}
