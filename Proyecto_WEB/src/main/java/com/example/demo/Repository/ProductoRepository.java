package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.demo.Model.Producto;
import com.example.demo.Model.DTO.ActivitiesDTO;


@Repository
public interface ProductoRepository extends JpaRepository<Producto, Integer> {
    // Spring JPA los usa
    // save(), findById(), findAll(), deleteById(), etc.

@Query(
      value = "SELECT p.nombre AS nombre, i.cantidad AS cantidad, 'ENTRADA' AS tipo, i.fecha_ingreso AS fecha " +
              "FROM PRODUCTOS p " +
              "INNER JOIN INGRESOS i ON p.id_producto = i.id_producto " +
              "UNION " +
              "SELECT p.nombre AS nombre, dv.cantidad AS cantidad, 'SALIDA' AS tipo, v.fecha_venta AS fecha " +
              "FROM DETALLE_VENTA dv " +
              "INNER JOIN VENTAS v ON v.id_venta = dv.id_venta " +
              "INNER JOIN PRODUCTOS p ON dv.id_producto = p.id_producto " +
              "ORDER BY fecha DESC",
      nativeQuery = true
    )
    public List<ActivitiesDTO> getAllActivities();

}
