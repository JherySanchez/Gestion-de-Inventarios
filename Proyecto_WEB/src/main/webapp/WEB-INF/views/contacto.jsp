<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/contacto.css'/>">
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
                <li class="active"><a href="<c:url value='/contacto'/>"><span class="material-icons">campaign</span>Contacto</a></li>
                <li><a href="#"><span class="material-icons">remove_circle</span>Salidas</a></li>
                <li><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
                <li><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
                <li><a href="#"><span class="material-icons">settings</span>Configuración</a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main content -->
    <main class="main-content">
        <header class="main-header">
            <h1>Contacto</h1>
        </header>

        <!-- Formulario de contacto -->
        <section class="contact-section">
            <c:if test="${not empty successMessage}">
                <div class="alert success">${successMessage}</div>
            </c:if>

            <form action="<c:url value='/contacto'/>" method="post" class="contact-form">
                <div class="form-group">
                    <label for="name">Nombre:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="subject">Asunto:</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="message">Mensaje:</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit" class="save-btn">Enviar Mensaje</button>
                </div>
            </form>
        </section>

        <!-- Footer -->
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

    </main>

</div>

</body>
</html>
