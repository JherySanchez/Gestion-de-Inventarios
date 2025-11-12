<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Categorías</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/lista-productos.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/gestion-usuarios.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- prueba de boton de resstaurar -->
    <style>
        .restore-btn {
            background-color: #2ecc71 !important;
        }
        .restore-btn:hover {
            background-color: #27ae60 !important;
        }
    </style>
</head>
<body>
<div class="container">
    <jsp:include page="/WEB-INF/views/sidebar.jsp" />

    <main class="main-content">
        <header class="main-header">
            <h1>Gestión de Categorías</h1>
        </header>
        <!-- Estoy probando, el css esta dentro del jsp -->
        <section class_name="config-section" style="display: grid; grid-template-columns: 1fr 2fr; gap: 20px;">
            
            <div class_name="config-card" style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <h2>Nueva Categoría</h2>
                <form action="<c:url value='/tipos/guardar'/>" method="post">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" required style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                    </div>
                    <div class="form-actions" style="text-align: right; margin-top: 15px;">
                        <button type="submit" class="save-btn" style="background: #2ecc71; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">Guardar</button>
                    </div>
                </form>
            </div>

            <div class_name="user-management-section" style="background-color: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <h2>Categorías Actuales</h2>
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tipo" items="${tipos}">
                            <tr>
                                <td>${tipo.idTipo}</td>
                                <td>${tipo.nombre}</td>
                                <td class="actions-cell">
                                    <a href="<c:url value='/tipos/eliminar/${tipo.idTipo}'/>" 
                                       class="action-button delete-btn" 
                                       onclick="return confirm('¿Seguro? Esto marcará la categoría y sus productos como inactivos.')"
                                       title="Eliminar">
                                        <span class="material-icons">delete</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--Prueba de boton de restaurar -->
            <div class="user-management-section" style="background-color: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                    <h2>Categorías Inactivas (Papelera)</h2>
                    <table class="user-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tipoInactivo" items="${tiposInactivos}">
                                <tr>
                                    <td>${tipoInactivo.idTipo}</td>
                                    <td>${tipoInactivo.nombre}</td>
                                    <td class="actions-cell">
                                        <a href="<c:url value='/tipos/restaurar/${tipoInactivo.idTipo}'/>" 
                                           class="action-button restore-btn" 
                                           onclick="return confirm('¿Restaurar esta categoría y sus productos?')"
                                           title="Restaurar">
                                            <span class="material-icons">restore_from_trash</span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--Prueba de boton de restaurar -->
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/footer.jsp" />
</div>
</body>
</html>