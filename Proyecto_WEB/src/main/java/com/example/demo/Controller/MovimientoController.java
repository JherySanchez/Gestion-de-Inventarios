package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Ingreso;
import com.example.demo.Model.Producto;
import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.example.demo.Repository.IngresoRepository;
import com.example.demo.Repository.ProductoRepository;
import com.example.demo.Repository.UsuarioRepository;
import com.example.demo.Repository.VentaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.Optional;
import java.math.BigDecimal;
import java.util.List;

@Controller

public class MovimientoController {


    @Autowired
    private VentaRepository ventaRepository;
    @Autowired
    private IngresoRepository ingresoRepository;
    @Autowired
    private ProductoRepository productoRepository;
    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping("/movimientos")
    public String listarMovimientos(Model model) {
        List<Ingreso> listaIngresos = ingresoRepository.findAll();
        List<Venta> listaVentas = ventaRepository.findAll();
        
        List<Producto> listaProductos = productoRepository.findAll(); 
        List<Usuario> listaUsuarios = usuarioRepository.findAll();

        model.addAttribute("ingresos", listaIngresos);
        model.addAttribute("ventas", listaVentas);
        model.addAttribute("productos", listaProductos);
        model.addAttribute("usuarios", listaUsuarios);

        return "movimientos";
    }


    @GetMapping("/ventas/{id}")
    @ResponseBody // Devuelve el JSON
    public Venta getVentaDetalle(@PathVariable("id") Integer id) {
        return ventaRepository.findById(id).orElse(null);
    }

    @GetMapping("/ingresos/{id}")
    @ResponseBody // Devuelve JSON
    public Ingreso getIngresoDetalle(@PathVariable("id") Integer id) {
        return ingresoRepository.findById(id).orElse(null);
    }

    // Metodo para procesar el formulario del modal de INGRESOS
    @PostMapping("/ingresos/agregar")
    public String agregarIngreso(@RequestParam("id_producto") Integer idProducto,
                           @RequestParam("cantidad") int cantidad,
                           @RequestParam("descripcion") String descripcion) {
    
    //Buscar el producto que se está actualizando
    Optional<Producto> productoOpt = productoRepository.findById(idProducto);
    if (productoOpt.isEmpty()) {
        return "redirect:/movimientos?error=producto_no_encontrado";
    }
    Producto producto = productoOpt.get();
    
    //Crear el nuevo registro de ingreso
    Ingreso nuevoIngreso = new Ingreso();
    nuevoIngreso.setProducto(producto);
    nuevoIngreso.setCantidad(cantidad);
    nuevoIngreso.setDescripcion(descripcion);
    ingresoRepository.save(nuevoIngreso);

    producto.setStock(producto.getStock() + cantidad);
    productoRepository.save(producto); // save() actualiza si el ID ya existe

    return "redirect:/movimientos";
}

    // Metodo para procesar el formulario del modal de VENTAS/SALIDAS
    @PostMapping("/ventas/agregar")
    public String agregarVenta(@RequestParam("id_usuario") Integer idUsuario,
                         @RequestParam("id_producto") Integer idProducto,
                         @RequestParam("cantidad") int cantidad,
                         @RequestParam("total") Double total,
                         RedirectAttributes redirectAttributes) {

    Optional<Producto> productoOpt = productoRepository.findById(idProducto);
    Optional<Usuario> usuarioOpt = usuarioRepository.findById(idUsuario);

    if (productoOpt.isEmpty() || usuarioOpt.isEmpty()) {
        redirectAttributes.addFlashAttribute("errorMessage", "Error: Producto o usuario no válido.");
        return "redirect:/movimientos";
    }
    Producto producto = productoOpt.get();
    Usuario usuario = usuarioOpt.get();

    //Verifica si hay stock suficiente
    if (producto.getStock() < cantidad) {
        redirectAttributes.addFlashAttribute("errorMessage", "Error: No hay stock suficiente para " + producto.getNombre());
        return "redirect:/movimientos";
    }

    //Crear la nueva venta
    Venta nuevaVenta = new Venta();
    nuevaVenta.setUsuario(usuario);
    nuevaVenta.setTotal(new BigDecimal(total));

    DetalleVenta detalle = new DetalleVenta();
    detalle.setProducto(producto);
    detalle.setCantidad(cantidad);
    detalle.setPrecio_unitario(new BigDecimal(total / cantidad));
    detalle.setVenta(nuevaVenta); 

    nuevaVenta.setDetalles(List.of(detalle));
    
    ventaRepository.save(nuevaVenta);

    producto.setStock(producto.getStock() - cantidad);
    productoRepository.save(producto); // save() actualiza el stock
    
    redirectAttributes.addFlashAttribute("successMessage", "Venta registrada con éxito.");
    return "redirect:/movimientos";
}
    
}
