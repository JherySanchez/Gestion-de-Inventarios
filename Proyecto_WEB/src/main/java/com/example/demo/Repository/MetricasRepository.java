package com.example.demo.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;
@Repository
public class MetricasRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Map<String, Integer> obtenerProductosMasVendidos() {
        String sql = """
            SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
            FROM detalle_venta dv
            JOIN productos p ON dv.id_producto = p.id_producto
            GROUP BY p.nombre
            ORDER BY total_vendido DESC
            LIMIT 5
        """;

        Map<String, Integer> data = new LinkedHashMap<>();
        jdbcTemplate.query(sql, rs -> {
            data.put(rs.getString("nombre"), rs.getInt("total_vendido"));
        });
        return data;
    }

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
   public Map<String, Map<String, Integer>> obtenerVentasMensualesPorProducto() {
        String sql = """
            SELECT 
                p.nombre AS producto,
                DATE_FORMAT(v.fecha_venta, '%Y-%m') AS mes,
                SUM(dv.cantidad) AS total_vendido
            FROM detalle_venta dv
            JOIN ventas v ON dv.id_venta = v.id_venta
            JOIN productos p ON dv.id_producto = p.id_producto
            GROUP BY p.nombre, DATE_FORMAT(v.fecha_venta, '%Y-%m')
            ORDER BY mes ASC;
        """;

        List<Map<String, Object>> resultados = jdbcTemplate.queryForList(sql);

        Map<String, Map<String, Integer>> datos = new LinkedHashMap<>();

        for (Map<String, Object> fila : resultados) {
            String producto = (String) fila.get("producto");
            String mes = (String) fila.get("mes");
            Integer total = ((Number) fila.get("total_vendido")).intValue();

            datos.computeIfAbsent(producto, k -> new LinkedHashMap<>()).put(mes, total);
        }

        return datos;
   }

}
