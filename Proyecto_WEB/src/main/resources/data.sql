-- ==========================================
-- DATOS BASE (DEPENDENCIAS)
-- ==========================================

-- Tipos de productos
INSERT INTO tipo_producto(nombre) VALUES ('Electronica'), ('Accesorios'), ('Camaras');

-- Productos
INSERT INTO productos (nombre, precio, stock, estado, id_tipo) VALUES 
('Laptop Dell XPS 15', 1200.00, 50, 'Disponible', 1),      -- Electrónica
('Mouse Logitech MX Master', 25.00, 150, 'Disponible', 2), -- Accesorios
('Monitor LG Ultrawide', 300.00, 30, 'Disponible', 1),     -- Electrónica
('Teclado HyperX Alloy Rise', 80.00, 20, 'Bajo', 2),       -- Accesorios
('Audífonos Razer Blackshark V3', 150.00, 10, 'Bajo', 2),  -- Accesorios
('Logitech MX Brio Webcam 4K',930.00, 50,'Disponible',3);  -- Camaras

-- Usuarios
/*En un futuro se pueden hashear los password*/
INSERT INTO usuarios (nombre, email, password, rol, estado) VALUES
('Juan Pérez', 'juan.perez@gmail.com', 'password1', 'Administrador', 'ACTIVO'),
('Ana García', 'ana.garcia@gmail.com', 'password2', 'Empleado', 'ACTIVO'),
('Carlos Ruiz', 'carlos.ruiz@gmail.com', 'password3', 'Empleado', 'INACTIVO'),
('Maria López', 'maria.lopez@gmail.com', 'password4', 'Invitado', 'ACTIVO'),
('David Sánz', 'david.sanz@gmail.com', 'password5', 'Administrador', 'ACTIVO');


-- ==========================================
-- MOVIMIENTOS CRONOLÓGICOS
-- ==========================================

-- =============================
--      MES: 2025-01
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(4, 5, 'Ingreso mensual producto 4', '2025-01-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-01-07 13:08:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(1, 5, 2, 150.00); -- Venta ID 1 (Auto-incrementado)

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 150.00, '2025-01-14 11:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(2, 5, 1, 150.00); -- Venta ID 2

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 310.00, '2025-01-19 16:25:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(3, 4, 2, 80.00), (3, 5, 1, 150.00); -- Venta ID 3

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2700.00, '2025-01-25 18:57:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(4, 1, 2, 1200.00), (4, 2, 4, 25.00); -- Venta ID 4

-- =============================
--      MES: 2025-02
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 25, 'Ingreso mensual producto 1', '2025-02-02 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 2400.00, '2025-02-07 17:28:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(5, 1, 2, 1200.00); -- Venta ID 5

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 25.00, '2025-02-10 20:20:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(6, 2, 1, 25.00); -- Venta ID 6

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2550.00, '2025-02-18 10:19:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(7, 1, 2, 1200.00), (7, 2, 3, 25.00); -- Venta ID 7

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 450.00, '2025-02-26 15:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(8, 5, 3, 150.00); -- Venta ID 8

-- =============================
--      MES: 2025-03
-- =============================
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-03-03 13:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(9, 5, 1, 150.00), (9, 2, 1, 25.00); -- Venta ID 9

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(2, 20, 'Ingreso mensual producto 2', '2025-03-08 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 600.00, '2025-03-15 12:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(10, 3, 2, 300.00); -- Venta ID 10

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 350.00, '2025-03-20 11:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(11, 3, 1, 300.00), (11, 2, 2, 25.00), (11, 4, 1, 80.00); -- Venta ID 11

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1200.00, '2025-03-27 18:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(12, 1, 1, 1200.00); -- Venta ID 12

-- =============================
--      MES: 2025-04
-- =============================
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 160.00, '2025-04-04 10:35:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(13, 4, 2, 80.00); -- Venta ID 13

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 15, 'Ingreso mensual producto 3', '2025-04-06 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 230.00, '2025-04-09 16:50:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(14, 3, 0, 300.00); -- Venta ID 14 (NOTA: Cantidad 0 en tu original)

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-04-12 14:20:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(15, 5, 2, 150.00); -- Venta ID 15

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1525.00, '2025-04-21 19:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(16, 1, 1, 1200.00), (16, 4, 4, 80.00), (16, 2, 1, 25.00); -- Venta ID 16

-- =============================
--      MES: 2025-05
-- =============================
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-05-02 15:14:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(17, 2, 2, 25.00); -- Venta ID 17

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 20, 'Ingreso mensual producto 5', '2025-05-05 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 300.00, '2025-05-11 12:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(18, 3, 1, 300.00); -- Venta ID 18

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2400.00, '2025-05-20 17:44:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(19, 1, 2, 1200.00); -- Venta ID 19

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 175.00, '2025-05-28 09:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(20, 5, 1, 150.00), (20, 2, 1, 25.00); -- Venta ID 20

-- =============================
--      MES: 2025-06
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 15, 'Ingreso mensual producto 1', '2025-06-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 130.00, '2025-06-06 14:33:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(21, 4, 1, 80.00), (21, 2, 2, 25.00); -- Venta ID 21

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 300.00, '2025-06-14 16:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(22, 3, 1, 300.00); -- Venta ID 22

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 2400.00, '2025-06-23 18:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(23, 1, 2, 1200.00); -- Venta ID 23

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 255.00, '2025-06-29 11:03:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(24, 5, 1, 150.00), (24, 2, 4, 25.00); -- Venta ID 24

-- =============================
--      MES: 2025-07
-- =============================
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1200.00, '2025-07-03 10:22:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(25, 1, 1, 1200.00); -- Venta ID 25

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(2, 15, 'Ingreso mensual producto 2', '2025-07-04 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 605.00, '2025-07-12 15:17:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(26, 3, 1, 300.00), (26, 5, 2, 150.00), (26, 2, 1, 25.00); -- Venta ID 26

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 160.00, '2025-07-21 19:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(27, 4, 2, 80.00); -- Venta ID 27

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 325.00, '2025-07-28 13:50:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(28, 3, 1, 300.00), (28, 2, 1, 25.00); -- Venta ID 28

-- =============================
--      MES: 2025-08
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 15, 'Ingreso mensual producto 5', '2025-08-02 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 50.00, '2025-08-04 16:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(29, 2, 2, 25.00); -- Venta ID 29

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 300.00, '2025-08-11 12:09:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(30, 3, 1, 300.00); -- Venta ID 30

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 2550.00, '2025-08-20 18:55:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(31, 1, 2, 1200.00), (31, 2, 3, 25.00); -- Venta ID 31

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 230.00, '2025-08-27 09:38:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(32, 3, 0, 300.00); -- Venta ID 32 (NOTA: Cantidad 0 en tu original)

-- =============================
--      MES: 2025-09
-- =============================
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 20, 'Ingreso mensual producto 3', '2025-09-03 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-09-09 14:44:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(33, 5, 1, 150.00), (33, 2, 1, 25.00); -- Venta ID 33

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 1200.00, '2025-09-12 17:03:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(34, 1, 1, 1200.00); -- Venta ID 34

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 405.00, '2025-09-18 11:11:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(35, 3, 1, 300.00), (35, 5, 1, 150.00), (35, 2, 1, 25.00); -- Venta ID 35

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 80.00, '2025-09-25 19:22:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(36, 4, 1, 80.00); -- Venta ID 36

-- =============================
--      MES: 2025-10
-- =============================
-- (Datos que estaban al inicio de tu archivo)
INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 20, 'Ingreso inicial de stock de Laptop Dell XPS 15', '2025-10-01 09:00:00');

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(1, 20, 'Ingreso mensual producto 1', '2025-10-02 09:00:00');

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 25, 'Reposición de stock para monitores LG', '2025-10-02 10:30:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 325.00, '2025-10-03 14:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(37, 3, 1, 300.00), -- 1 Monitor LG -- Venta ID 37
(37, 2, 1, 25.00);  -- 1 Mouse Logitech

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(4, 50, 'Nuevo lote de teclados HyperX', '2025-10-04 11:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 300.00, '2025-10-05 14:45:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(38, 3, 1, 300.00); -- Venta ID 38

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-10-05 17:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(39, 2, 2, 25.00); -- 2 Mouses Logitech -- Venta ID 39

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(5, 30, 'Stock de audífonos Razer para la campaña', '2025-10-07 15:20:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 105.00, '2025-10-08 11:15:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(40, 4, 1, 80.00), -- 1 Teclado HyperX -- Venta ID 40
(40, 2, 1, 25.00);  -- 1 Mouse Logitech

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1350.00, '2025-10-09 18:00:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(41, 1, 1, 1200.00), -- 1 Laptop Dell -- Venta ID 41
(41, 5, 1, 150.00);  -- 1 Audífonos Razer

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 50.00, '2025-10-11 16:10:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(42, 2, 2, 25.00); -- Venta ID 42

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 1350.00, '2025-10-15 20:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(43, 1, 1, 1200.00), (43, 5, 1, 150.00); -- Venta ID 43

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(5, 105.00, '2025-10-21 10:30:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(44, 4, 1, 80.00), (44, 2, 1, 25.00); -- Venta ID 44

-- =============================
--      MES: 2025-11
-- =============================
INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(1, 300.00, '2025-11-02 13:12:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(45, 3, 1, 300.00); -- Venta ID 45

INSERT INTO ingresos (id_producto, cantidad, descripcion, fecha_ingreso) VALUES 
(3, 30, 'Ingreso mensual producto 3', '2025-11-04 09:00:00');

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(2, 175.00, '2025-11-07 15:40:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(46, 5, 1, 150.00), (46, 2, 1, 25.00); -- Venta ID 46

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(3, 1200.00, '2025-11-13 18:55:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(47, 1, 1, 1200.00); -- Venta ID 47

INSERT INTO ventas (id_usuario, total, fecha_venta) VALUES 
(4, 205.00, '2025-11-15 09:05:00');
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(48, 3, 1, 300.00), (48, 4, 1, 80.00), (48, 2, 1, 25.00); -- Venta ID 48