<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Métricas</title>

    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/metricas.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="container">
    
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
                <li><a href="<c:url value='/publicidad'/>"><span class="material-icons">campaign</span>Publicidad</a></li>
                <li><a href="#"><span class="material-icons">remove_circle</span>Salidas</a></li>
                <li class="active"><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
                <li><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
                <li><a href="<c:url value='/configuracion'/>"><span class="material-icons">settings</span>Configuración</a></li>
            </ul>
        </nav>
    </aside>

    <main class="main-content">
        <header class="main-header">
            <h1>Métricas</h1>
        </header>

        <section class="metrics-section">
            <div class="chart-card">
                <h3>Productos más vendidos</h3>
                <canvas id="barChart"></canvas>
            </div>

            <div class="chart-card">
                <h3>Ventas mensuales</h3>
                <canvas id="lineChart"></canvas>
            </div>

            <div class="chart-card">
                <h3>Estado de stock</h3>
                <canvas id="pieChart"></canvas>
            </div>
        </section>
    </main>

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

</div>

<script src="<c:url value='/js/metricas.js'/>"></script>
</body>
</html>
