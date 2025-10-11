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
    
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar.jsp" />

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

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/footer.jsp" />

</div>

<script src="<c:url value='/js/metricas.js'/>"></script>
</body>
</html>
