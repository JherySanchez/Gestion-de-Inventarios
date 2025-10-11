<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard de Almacen</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

    <div class="container">
        
        <!-- Sidebar -->
        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <main class="main-content">
            <header class="main-header">
                <h1>Dashboard Principal</h1>
                <div class="user-info">
                    <span>Hola, Usuario</span>
                    <span class="material-icons">account_circle</span>
                </div>
            </header>
            
            <section class="dashboard-cards">
                <div class="card">
                    <span class="material-icons card-icon">storage</span>
                    <h3>Total de Productos</h3>
                    <p id="total-productos">Cargando...</p>
                </div>
                
                <div class="card warning">
                    <span class="material-icons card-icon">warning</span>
                    <h3>Productos con Bajo Stock</h3>
                    <p id="bajo-stock">Cargando...</p>
                </div>

                <div class="card">
                    <span class="material-icons card-icon">input</span>
                    <h3>Últimas Entradas</h3>
                    <ul id="ultimas-entradas-lista"></ul>
                </div>
            </section>

            <section class="recent-activity">
                <h2>Actividad Reciente</h2>
                <table class="activity-table">
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody id="activity-body">
                        </tbody>
                </table>
            </section>
        </main>
        <!-- Footer -->
        <jsp:include page="/WEB-INF/views/footer.jsp" />

    </div>

    <script src="<c:url value='/js/dashboard.js'/>"></script>
</body>
</html>
