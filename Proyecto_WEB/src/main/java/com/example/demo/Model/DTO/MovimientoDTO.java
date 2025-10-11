package com.example.demo.Model.DTO;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.math.BigDecimal;
import java.util.Date;
/*Sirve para hacer el dashboard, como la tarjeta de ultimos movimientos, un reporte general... */

public class MovimientoDTO {
    private Integer idTransaccion;
    private Date fecha;
    private String tipo; // ingreso o venta
    private String descripcion;
    private BigDecimal monto;
    
    public MovimientoDTO(Integer idTransaccion, LocalDateTime fechaLocalDateTime, String tipo, String descripcion, BigDecimal monto) {
        this.idTransaccion = idTransaccion;
        //Convierte LocalDateTime a Date en el constructor
        this.fecha = Date.from(fechaLocalDateTime.atZone(ZoneId.systemDefault()).toInstant());
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.monto = monto;
    }

    public Integer getIdTransaccion() {
        return idTransaccion;
    }

    public void setIdTransaccion(Integer idTransaccion) {
        this.idTransaccion = idTransaccion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BigDecimal getMonto() {
        return monto;
    }

    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }
}
