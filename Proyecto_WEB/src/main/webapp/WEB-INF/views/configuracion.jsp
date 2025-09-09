<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuración</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/configuracion.css'/>">
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
                <li><a href="<c:url value='/publicidad'/>"><span class="material-icons">campaign</span>Publicidad</a></li>
                <li><a href="#"><span class="material-icons">remove_circle</span>Salidas</a></li>
                <li><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
                <li><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
                <li class="active"><a href="<c:url value='/configuracion'/>"><span class="material-icons">settings</span>Configuración</a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <header class="main-header">
            <h1>Configuración del Sistema</h1>
        </header>

        <!-- Mensajes ocultos para JS -->
        <c:if test="${not empty successMessage}">
            <div id="successMessage" data-message="${fn:escapeXml(successMessage)}" style="display:none;"></div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div id="errorMessage" data-message="${fn:escapeXml(errorMessage)}" style="display:none;"></div>
        </c:if>

        <!-- Sección de Configuración -->
        <section class="config-section">
            <!-- Ajustes Generales -->
            <div class="config-card">
                <h2><span class="material-icons">build</span> Ajustes Generales</h2>
                <form class="config-form">
                    <div class="form-group">
                        <label for="nombreEmpresa">Configuracion del almacen:</label>
                        <input type="text" id="nombreEmpresa" name="nombreEmpresa" placeholder="Sistema de Almacén S.A.">
                    </div>
                    <div class="form-group">
                        <label for="moneda">Moneda Predeterminada:</label>
                        <select id="moneda" name="moneda">
                            <option value="PEN">Soles (PEN)</option>
                            <option value="USD">Dólares (USD)</option>
                            <option value="EUR">Euros (EUR)</option>
                        </select>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="save-btn">Guardar Cambios</button>
                    </div>
                </form>
            </div>

            <!-- Seguridad -->
            <div class="config-card">
                <h2><span class="material-icons">security</span> Seguridad</h2>
                <form class="config-form">
                    <div class="form-group">
                        <label for="contraseña">Cambiar Contraseña:</label>
                        <input type="password" id="contraseña" name="contraseña" placeholder="Nueva Contraseña">
                    </div>
                    <div class="form-group">
                        <label for="confirmar">Confirmar Contraseña:</label>
                        <input type="password" id="confirmar" name="confirmar" placeholder="Confirmar Contraseña">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="save-btn">Actualizar Contraseña</button>
                    </div>
                </form>
            </div>

            <!-- Notificaciones -->
            <div class="config-card">
                <h2><span class="material-icons">notifications</span> Notificaciones</h2>
                <form class="config-form">
                    <div class="form-group checkbox">
                        <label>
                            <input type="checkbox" checked> Notificarme por Email
                        </label>
                    </div>
                    <div class="form-group checkbox">
                        <label>
                            <input type="checkbox"> Notificarme por SMS
                        </label>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="save-btn">Guardar Preferencias</button>
                    </div>
                </form>
            </div>

            <!-- Cerrar Sesión -->
            <div class="config-card logout-card">
                <h2><span class="material-icons">logout</span> Cerrar Sesión</h2>
                <p>¿Deseas salir del sistema?</p>
                <div class="form-actions">
                    <a href="<c:url value='/login'/>" class="logout-btn">Cerrar Sesión</a>
                </div>
            </div>
        </section>
    </main>

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
</div>

<script src="<c:url value='/js/configuracion.js'/>"></script>
</body>
</html>
