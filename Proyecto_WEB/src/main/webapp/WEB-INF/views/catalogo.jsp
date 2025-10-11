<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo de Productos</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/catalogo.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/creacion-producto.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>

    <div class="container">
        
        <!-- Sidebar -->
            <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Main Content -->
        <main class="main-content">
            <header class="main-header">
                <h1>Catálogo de Productos</h1>
                <div class="header-actions">
                    <button class="add-button" id="openModalBtn"><span class="material-icons">add_circle_outline</span>Añadir Producto</button>
                    <div class="user-info">
                        <span>Hola, Usuario</span>
                        <span class="material-icons">account_circle</span>
                    </div>
                </div>
            </header>
            
            <section class="product-grid" id="product-grid">
                </section>
        </main>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/views/footer.jsp" />

    </div>

    <!-- aqui comeinza el modal-->
    <div id="product-modal" class="modal-backdrop hidden">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modal-title">Añadir Nuevo Producto</h2>
                <button class="close-btn">&times;</button>
            </div>
            <div class="modal-body">
                <form id="product-form">
                    <input type="hidden" id="product-id">
                    <div class="form-group">
                        <label for="product-name">Nombre del Producto</label>
                        <input type="text" id="product-name" required>
                    </div>
                    <div class="form-group">
                        <label for="product-price">Precio</label>
                        <input type="number" id="product-price" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="product-stock">Cantidad en Stock</label>
                        <input type="number" id="product-stock" required>
                    </div>
                    <div class="form-group">
                        <label for="product-image">URL de la Imagen</label>
                        <input type="url" id="product-image">
                    </div>
                    <div class="form-group">
                        <label for="product-description">Descripcion</label>
                        <textarea id="product-description" rows="3"></textarea>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="save-btn">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="<c:url value='/js/creacion-producto.js'/>"></script>
    <script src="<c:url value='/js/catalogo.js'/>"></script>
</body>
</html>