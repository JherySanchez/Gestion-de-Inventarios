<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dirección</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/direccion.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="container">

    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <span class="material-icons">inventory_2</span>
            <h2>Sistema de Almacén</h2>
        </div>
        <nav class="nav-menu">
            <ul>
                <li><a href="<c:url value='/dashboard'/>"><span class="material-icons">dashboard</span>Dashboard</a></li>
                <li><a href="<c:url value='/catalogo'/>"><span class="material-icons">grid_view</span>Catálogo Productos</a></li>
                <li><a href="<c:url value='/lista-productos'/>"><span class="material-icons">list</span>Lista de Productos</a></li>
                <li class="active"><a href="<c:url value='/direccion'/>"><span class="material-icons">location_on</span>Dirección</a></li>
                <li><a href="#"><span class="material-icons">remove_circle</span>Salidas</a></li>
                <li><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
                <li><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
                <li><a href="#"><span class="material-icons">settings</span>Configuración</a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main content -->
    <main class="main-content">


        <!-- Información de la empresa -->
        <section class="info-section">
            <p><strong>Nombre de la empresa:</strong> Sistema de Almacén S.A.</p>
            <p><strong>Dirección:</strong> Av. Principal 123, Ciudad, País</p>
            <p><strong>Teléfono:</strong> +51 999 999 999</p>
            <p><strong>Email:</strong> contacto@sistemaalmacen.com</p>
            <p><strong>Redes Sociales:</strong> Facebook / Instagram / Twitter</p>
        </section>
    </main>

</div>

<!-- Footer fuera de main -->
<footer class="main-footer">
    <div class="footer-item">
        <a href="<c:url value='/contacto'/>">Contacto</a>
    </div>
    <div class="footer-item">
        <a href="#">Redes Sociales</a>
    </div>
    <div class="footer-item">
        <a href="<c:url value='/direccion'/>">Dirección</a>
    </div>
</footer>

</body>
</html>
