package com.example.demo.Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class MetricasRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

     // ==========================================
    // VENTAS MENSUALES (TOTAL S/.)
    // ==========================================
    public Map<String, Double> obtenerVentasMensuales() {
        String sql = """
            SELECT FORMATDATETIME(v.fecha_venta, 'MMMM') AS mes, SUM(v.total) AS total
            FROM ventas v
            GROUP BY FORMATDATETIME(v.fecha_venta, 'MMMM')
            ORDER BY MIN(v.fecha_venta)
        """;

        Map<String, Double> data = new LinkedHashMap<>();
        jdbcTemplate.query(sql, rs -> {
            data.put(rs.getString("mes"), rs.getDouble("total"));
        });
        return data;
    }

    // ==========================================
    // ESTADO DEL STOCK
    // ==========================================
    public Map<String, Integer> obtenerEstadoStock() {
        String sql = """
            SELECT 
                SUM(CASE WHEN stock > 50 THEN 1 ELSE 0 END) AS disponible,
                SUM(CASE WHEN stock BETWEEN 1 AND 50 THEN 1 ELSE 0 END) AS bajo,
                SUM(CASE WHEN stock = 0 THEN 1 ELSE 0 END) AS agotado
            FROM productos
        """;

        Map<String, Integer> data = new LinkedHashMap<>();
        jdbcTemplate.query(sql, rs -> {
            data.put("Disponible", rs.getInt("disponible"));
            data.put("Bajo", rs.getInt("bajo"));
            data.put("Agotado", rs.getInt("agotado"));
        });
        return data;
    }

    // ==========================================
    // INGRESOS MENSUALES
    // ==========================================
    public Map<String, Integer> obtenerIngresosMensuales() {
        String sql = """
            SELECT 
                FORMATDATETIME(fecha_ingreso, 'yyyy-MM') AS mes,
                SUM(cantidad) AS total
            FROM ingresos
            GROUP BY mes
            ORDER BY mes ASC
        """;

        Map<String, Integer> data = new LinkedHashMap<>();

        jdbcTemplate.query(sql, rs -> {
            data.put(rs.getString("mes"), rs.getInt("total"));
        });

        return data;
    }

    // ==========================================
    // UNIDADES VENDIDAS MENSUALES
    // ==========================================
    public Map<String, Integer> obtenerUnidadesVendidasMensuales() {
        String sql = """
            SELECT 
                MONTH(v.fecha_venta) AS mes,
                SUM(dv.cantidad) AS unidades
            FROM detalle_venta dv
            INNER JOIN ventas v ON dv.id_venta = v.id_venta
            GROUP BY MONTH(v.fecha_venta)
            ORDER BY mes
        """;

        Map<String, Integer> data = new LinkedHashMap<>();

        jdbcTemplate.query(sql, rs -> {
            int mesNum = rs.getInt("mes");
            String mesNombre = convertirMes(mesNum);
            data.put(mesNombre, rs.getInt("unidades"));
        });

        return data;
    }

    // ==========================================
    // CONVERTIR NÚMERO DE MES A NOMBRE DE MES
    // ==========================================
    private String convertirMes(int mes) {
        return switch (mes) {
            case 1 -> "Enero";
            case 2 -> "Febrero";
            case 3 -> "Marzo";
            case 4 -> "Abril";
            case 5 -> "Mayo";
            case 6 -> "Junio";
            case 7 -> "Julio";
            case 8 -> "Agosto";
            case 9 -> "Septiembre";
            case 10 -> "Octubre";
            case 11 -> "Noviembre";
            case 12 -> "Diciembre";
            default -> "Desconocido";
        };
    }

}
