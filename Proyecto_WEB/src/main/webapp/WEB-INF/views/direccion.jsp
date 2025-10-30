<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dirección</title>

    <!-- Estilos -->
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/gestion-usuarios.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/lista-productos.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/modal.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="container">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar.jsp" />

    <!-- Contenido principal -->
    <main class="main-content">
        <header class="main-header">
            <h1><span class="material-icons">location_on</span> Dirección</h1>
            <div class="header-actions">
                <div class="user-info">
                    <span>Hola, Usuario</span>
                    <span class="material-icons">account_circle</span>
                </div>
            </div>
        </header>

        <section class="direccion-section">
            <div class="direccion-card">
                <div class="direccion-header">
                    <span class="material-icons">business</span>
                    <div>
                        <h2>Sistema de Almacén S.A.</h2>
                        <p class="subtitle">Gestión eficiente de inventarios y logística</p>
                    </div>
                </div>

                <div class="direccion-info">
                    <div class="info-item">
                        <span class="material-icons">place</span>
                        <p><strong>Dirección:</strong> Av. Principal 123, Ciudad, País</p>
                    </div>
                    <div class="info-item">
                        <span class="material-icons">call</span>
                        <p><strong>Teléfono:</strong> +51 999 999 999</p>
                    </div>
                    <div class="info-item">
                        <span class="material-icons">email</span>
                        <p><strong>Email:</strong> contacto@sistemaalmacen.com</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</div>

</body>
</html>
