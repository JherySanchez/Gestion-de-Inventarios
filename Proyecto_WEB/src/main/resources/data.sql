
-- Tipos de productos
INSERT INTO tipo_producto(nombre) VALUES ('Electronica'), ('Accesorios'), ('Eventos');
INSERT INTO productos (nombre, precio, stock, estado, id_tipo) VALUES 
('Laptop Dell XPS 15', 1200.00, 50, 'Disponible', 1),      -- Electrónica
('Mouse Logitech MX Master', 25.00, 150, 'Disponible', 2), -- Accesorios
('Monitor LG Ultrawide', 300.00, 30, 'Disponible', 1),     -- Electrónica
('Teclado HyperX Alloy Rise', 80.00, 20, 'Bajo', 2),       -- Accesorios
('Audífonos Razer Blackshark V3', 150.00, 10, 'Bajo', 2);  -- Accesorios

/*En un futuro se pueden hashear los password*/
INSERT INTO usuarios (nombre, email, password, rol, estado) VALUES
('Juan Pérez', 'juan.perez@gmail.com', 'password1', 'Administrador', 'ACTIVO'),
('Ana García', 'ana.garcia@gmail.com', 'password2', 'Empleado', 'ACTIVO'),
('Carlos Ruiz', 'carlos.ruiz@gmail.com', 'password3', 'Empleado', 'INACTIVO'),
('Maria López', 'maria.lopez@gmail.com', 'password4', 'Invitado', 'ACTIVO'),
('David Sánz', 'david.sanz@gmail.com', 'password5', 'Administrador', 'ACTIVO');

-- Ingreso #1 (ID auto: 1)
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 20, 'Ingreso inicial de stock de Laptop Dell XPS 15', '2025-10-01 09:00:00');

-- Ingreso #2 (ID auto: 2)
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 25, 'Reposición de stock para monitores LG', '2025-10-02 10:30:00');

-- Ingreso #3 (ID auto: 3)
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(4, 50, 'Nuevo lote de teclados HyperX', '2025-10-04 11:00:00');

-- Ingreso #4 (ID auto: 4)
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 30, 'Stock de audífonos Razer para la campaña', '2025-10-07 15:20:00');


-- -----------------------------------------------------------------
-- VENTAS Y SUS DETALLES (Movimientos de Salida)
-- Simulamos varias ventas hechas por diferentes usuarios.
-- -----------------------------------------------------------------
-- Venta #1 (ID auto: 1) - Hecha por Juan
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 325.00, '2025-10-03 14:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(1, 3, 1, 300.00), -- 1 Monitor LG
(1, 2, 1, 25.00);  -- 1 Mouse Logitech

-- Venta #2 (ID auto: 2) - Hecha por Ana
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-10-05 17:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(2, 2, 2, 25.00); -- 2 Mouses Logitech

-- Venta #3 (ID auto: 3) - Hecha por Carlos
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 105.00, '2025-10-08 11:15:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(3, 4, 1, 80.00), -- 1 Teclado HyperX
(3, 2, 1, 25.00);  -- 1 Mouse Logitech

-- Venta #4 (ID auto: 4) - Hecha por Juan
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1350.00, '2025-10-09 18:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(4, 1, 1, 1200.00), -- 1 Laptop Dell
(4, 5, 1, 150.00);  -- 1 Audífonos Razer

-- =============================
--      MES: 2025-01
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(4, 5, 'Ingreso mensual producto 4', '2025-01-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 310.00, '2025-01-19 16:25:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(5, 4, 2, 80.00), (5, 5, 1, 150.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-01-07 13:08:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(6, 5, 2, 150.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2700.00, '2025-01-25 18:57:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(7, 1, 2, 1200.00), (7, 2, 4, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 150.00, '2025-01-14 11:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(8, 5, 1, 150.00);

-- =============================
--      MES: 2025-02
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 25, 'Ingreso mensual producto 1', '2025-02-02 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 450.00, '2025-02-26 15:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(9, 5, 3, 150.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 25.00, '2025-02-10 20:20:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(10, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 2400.00, '2025-02-07 17:28:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(11, 1, 2, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2550.00, '2025-02-18 10:19:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(12, 1, 2, 1200.00), (12, 2, 3, 25.00);

-- =============================
--      MES: 2025-03
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(2, 20, 'Ingreso mensual producto 2', '2025-03-08 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 600.00, '2025-03-15 12:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(13, 3, 2, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-03-03 13:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(14, 5, 1, 150.00), (14, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1200.00, '2025-03-27 18:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(15, 1, 1, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 350.00, '2025-03-20 11:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(16, 3, 1, 300.00), (16, 2, 2, 25.00), (16, 4, 1, 80.00);

-- =============================
--      MES: 2025-04
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 15, 'Ingreso mensual producto 3', '2025-04-06 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 230.00, '2025-04-09 16:50:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(17, 3, 0, 300.00); -- nota: entrada accidental, corrije si lo quieres (0 indica 0 cantidad)

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-04-12 14:20:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(18, 5, 2, 150.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1525.00, '2025-04-21 19:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(19, 1, 1, 1200.00), (19, 4, 4, 80.00), (19, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 160.00, '2025-04-04 10:35:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(20, 4, 2, 80.00);

-- =============================
--      MES: 2025-05
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 20, 'Ingreso mensual producto 5', '2025-05-05 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 300.00, '2025-05-11 12:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(21, 3, 1, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-05-02 15:14:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(22, 2, 2, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2400.00, '2025-05-20 17:44:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(23, 1, 2, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 175.00, '2025-05-28 09:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(24, 5, 1, 150.00), (24, 2, 1, 25.00);

-- =============================
--      MES: 2025-06
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 15, 'Ingreso mensual producto 1', '2025-06-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 130.00, '2025-06-06 14:33:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(25, 4, 1, 80.00), (25, 2, 2, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 300.00, '2025-06-14 16:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(26, 3, 1, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2400.00, '2025-06-23 18:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(27, 1, 2, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 255.00, '2025-06-29 11:03:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(28, 5, 1, 150.00), (28, 2, 4, 25.00);

-- =============================
--      MES: 2025-07
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(2, 15, 'Ingreso mensual producto 2', '2025-07-04 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 605.00, '2025-07-12 15:17:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(29, 3, 1, 300.00), (29, 5, 2, 150.00), (29, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1200.00, '2025-07-03 10:22:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(30, 1, 1, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 160.00, '2025-07-21 19:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(31, 4, 2, 80.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 325.00, '2025-07-28 13:50:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(32, 3, 1, 300.00), (32, 2, 1, 25.00);

-- =============================
--      MES: 2025-08
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 15, 'Ingreso mensual producto 5', '2025-08-02 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-08-11 12:09:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(33, 3, 1, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 50.00, '2025-08-04 16:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(34, 2, 2, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 2550.00, '2025-08-20 18:55:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(35, 1, 2, 1200.00), (35, 2, 3, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 230.00, '2025-08-27 09:38:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(36, 3, 0, 300.00); -- nota: 0 cantidad (corrige si quieres)

-- =============================
--      MES: 2025-09
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 20, 'Ingreso mensual producto 3', '2025-09-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-09-09 14:44:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(37, 5, 1, 150.00), (37, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 1200.00, '2025-09-12 17:03:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(38, 1, 1, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 405.00, '2025-09-18 11:11:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(39, 3, 1, 300.00), (39, 5, 1, 150.00), (39, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 80.00, '2025-09-25 19:22:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(40, 4, 1, 80.00);

-- =============================
--      MES: 2025-10
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 20, 'Ingreso mensual producto 1', '2025-10-02 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 300.00, '2025-10-05 14:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(41, 3, 1, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-10-11 16:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(42, 2, 2, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1350.00, '2025-10-15 20:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(43, 1, 1, 1200.00), (43, 5, 1, 150.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 105.00, '2025-10-21 10:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(44, 4, 1, 80.00), (44, 2, 1, 25.00);

-- =============================
--      MES: 2025-11
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 30, 'Ingreso mensual producto 3', '2025-11-04 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 300.00, '2025-11-02 13:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(45, 3, 1, 300.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-11-07 15:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(46, 5, 1, 150.00), (46, 2, 1, 25.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 1200.00, '2025-11-13 18:55:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(47, 1, 1, 1200.00);

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 205.00, '2025-11-20 09:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(48, 3, 1, 300.00), (48, 4, 1, 80.00), (48, 2, 1, 25.00);
