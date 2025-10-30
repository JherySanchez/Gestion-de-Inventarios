<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redes Sociales</title>

    <!-- Estilos -->
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/redes-sociales.css'/>">
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
            <h1><span class="material-icons">share</span> Redes Sociales</h1>
            <div class="header-actions">
                <div class="user-info">
                    <span>Hola, Usuario</span>
                    <span class="material-icons">account_circle</span>
                </div>
            </div>
        </header>

        <section class="social-section">
            <div class="social-card">
                <div class="social-header">
                    <span class="material-icons">public</span>
                    <div>
                        <h2>Conéctate con nosotros</h2>
                        <p class="subtitle">Síguenos para conocer nuestras últimas novedades y productos</p>
                    </div>
                </div>

                <div class="social-grid">
                    <!-- Facebook -->
                    <div class="social-item facebook">
                        <span class="material-icons">facebook</span>
                        <h3>Facebook</h3>
                        <p>Encuéntranos en nuestra página oficial.</p>
                        <a href="https://www.facebook.com" target="_blank" class="social-btn">Visitar</a>
                    </div>

                    <!-- Instagram -->
                    <div class="social-item instagram">
                        <span class="material-icons">photo_camera</span>
                        <h3>Instagram</h3>
                        <p>Descubre nuestro día a día y novedades visuales.</p>
                        <a href="https://www.instagram.com" target="_blank" class="social-btn">Visitar</a>
                    </div>

                    <!-- Twitter -->
                    <div class="social-item twitter">
                        <span class="material-icons">chat</span>
                        <h3>Twitter</h3>
                        <p>Sigue nuestras actualizaciones y anuncios.</p>
                        <a href="https://www.twitter.com" target="_blank" class="social-btn">Visitar</a>
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
