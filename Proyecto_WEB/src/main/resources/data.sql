
INSERT INTO productos (nombre, precio, stock, estado) VALUES 
('Laptop Dell XPS 15', 1200.00, 50, 'Disponible'), 
('Mouse Logitech MX Master', 25.00, 150, 'Disponible'), 
('Monitor LG Ultrawide', 300.00, 30, 'Disponible'), 
('Teclado HyperX Alloy Rise', 80.00, 20, 'Bajo'), 
('Audífonos Razer Blackshark V3', 150.00, 10, 'Bajo');

/*En un futuro se pueden hashear los password*/
INSERT INTO usuarios (nombre, email, password, rol, estado) VALUES
('Juan Pérez', 'juan.perez@tienda.com', 'password1', 'Administrador', 'ACTIVO'),
('Ana García', 'ana.garcia@tienda.com', 'password2', 'Empleado', 'ACTIVO'),
('Carlos Ruiz', 'carlos.ruiz@tienda.com', 'password3', 'Empleado', 'INACTIVO'),
('Maria López', 'maria.lopez@tienda.com', 'password4', 'Invitado', 'ACTIVO'),
('David Sánz', 'david.sanz@tienda.com', 'password5', 'Administrador', 'ACTIVO');

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

