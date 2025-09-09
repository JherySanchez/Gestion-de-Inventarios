<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/gestion-usuarios.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/catalogo.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/lista-productos.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                    <li><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
                    <li class="active"><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
                    <li><a href="<c:url value='/configuracion'/>"><span class="material-icons">settings</span>Configuración</a></li>
                </ul>
            </nav>
        </aside>

        <main class="main-content">
            <header class="main-header">
                <h1>Gestión de Usuarios</h1>
                <div class="header-actions">
                    <button class="add-button" id="addUserButton"><span class="material-icons">person_add</span>Agregar Usuario</button>
                    <div class="user-info">
                        <span>Hola, Usuario</span>
                        <span class="material-icons">account_circle</span>
                    </div>
                </div>
            </header>
            
            <section class="user-management-section">
                <div class="list-actions">
                    <div class="search-box">
                        <input type="text" id="searchInput" placeholder="Buscar por nombre o email...">
                        <button id="searchButton"><span class="material-icons">search</span></button>
                    </div>
                </div>

                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Rol</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="userTableBody">
                        </tbody>
                </table>
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
    
    <script src="<c:url value='/js/gestion-usuarios.js'/>"></script>
</body>
</html>