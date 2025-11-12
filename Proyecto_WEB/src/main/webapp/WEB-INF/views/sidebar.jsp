<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <li><a href="<c:url value='/tipos'/>"><span class="material-icons">category</span>Categorías</a></li>
            <li><a href="<c:url value='/publicidad'/>"><span class="material-icons">campaign</span>Publicidad</a></li>
            <li><a href="<c:url value='/movimientos'/>"><span class="material-icons">remove_circle</span>Movimientos</a></li>
            <li><a href="<c:url value='/metricas'/>"><span class="material-icons">analytics</span>Métricas</a></li>
            <li><a href="<c:url value='/gestion-usuarios'/>"><span class="material-icons">group</span>Gestión Usuarios</a></li>
            <li class="active"><a href="<c:url value='/configuracion'/>"><span class="material-icons">settings</span>Configuración</a></li>
        </ul>
    </nav>
</aside>
