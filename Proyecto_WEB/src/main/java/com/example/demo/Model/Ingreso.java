package com.example.demo.Model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.time.ZoneId;

@Entity
@Table(name = "ingresos")
public class Ingreso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_ingreso;

    @ManyToOne
    @JoinColumn(name = "id_producto", nullable = false)
    private Producto producto;

    private int cantidad;
    private LocalDateTime fecha_ingreso = LocalDateTime.now();
    private String descripcion;

    public int getId_ingreso() {
        return id_ingreso;
    }

    public void setId_ingreso(int id_ingreso) {
        this.id_ingreso = id_ingreso;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public LocalDateTime getFecha_ingreso() {
        return fecha_ingreso;
    }

    public Date getFechaIngresoAsDate() {
        if (this.fecha_ingreso == null) {
            return null;
        }
        return Date.from(this.fecha_ingreso.atZone(ZoneId.systemDefault()).toInstant());
    }

    public void setFecha_ingreso(LocalDateTime fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}