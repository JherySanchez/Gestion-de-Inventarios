<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/lista-productos.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/creacion-producto.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="container">

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar.jsp" />

    <main class="main-content">
        <header class="main-header">
            <h1>Lista de Productos</h1>
            <div class="header-actions">
                <button class="add-button" id="addListedProductBtn">
                    <span class="material-icons">add_circle_outline</span>Agregar Producto
                </button>
                <div class="user-info">
                    <span>Hola, Usuario</span>
                    <span class="material-icons">account_circle</span>
                </div>
            </div>
        </header>
        
        
        <section class="list-section">
            <div class="list-actions">
                <div class="search-box">
                    <form action="/buscar-productos" method="get">
                        <input type="text" name="query" id="searchInput" placeholder="Buscar por nombre o código...">
                        <button id="searchButton" type="submit"><span class="material-icons">search</span></button>
                    </form>
                </div>
            </div>

            <table class="product-table">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Estado</th>
                    <th>Tipo Producto</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody id="productTableBody">
                <c:forEach var="p" items="${miListaProducto}">
                    <tr>
                        <td>${p.idProducto}</td>
                        <td>${p.nombre}</td>
                        <td>${p.precio}</td>
                        <td>${p.stock}</td>
                        <td>${p.estado}</td>
                        <td>${p.tipoProducto != null ? p.tipoProducto.nombre : 'Sin Tipo'}</td>
                        <td class="actions-cell">
                            <button class="edit-btn action-button"
                                    data-codigo="${p.idProducto}"
                                    data-nombre="${p.nombre}"
                                    data-precio="${p.precio}"
                                    data-stock="${p.stock}"
                                    data-estado="${p.estado}"
                                    data-tipo="${p.tipoProducto != null ? p.tipoProducto.idTipo : ''}">
                                <span class="material-icons">edit</span>
                            </button>
                            <button class="delete-btn action-button" data-codigo="${p.idProducto}">
                                <span class="material-icons">delete</span>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/footer.jsp" />

</div>

<!-- Modal para agregar producto -->
<div id="product-modal" class="modal-backdrop hidden">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modal-title">Añadir Producto</h2>
            <button class="close-btn">&times;</button>
        </div>
        <div class="modal-body">
            <form id="product-form" action="/productos/agregar" method="POST">
                <input type="hidden" id="form-mode" value="add">

                <div class="form-group" id="product-code-group">
                    <label for="product-code">Código</label>
                    <input type="text" id="product-code" name="idProducto">
                </div>

                <div class="form-group">
                    <label for="product-name">Nombre</label>
                    <input type="text" id="product-name" name="nombre" required>
                </div>

                <div class="form-group">
                    <label for="product-price">Precio</label>
                    <input type="number" id="product-price" name="precio" step="0.01" required>
                </div>

                <div class="form-group">
                    <label for="product-quantity">Stock</label>
                    <input type="number" id="product-quantity" name="stock" required>
                </div>

                <div class="form-group">
                    <label for="product-stock">Estado</label>
                    <select id="product-stock" name="estado">
                        <option value="Disponible">Disponible</option>
                        <option value="Bajo">Bajo</option>
                        <option value="Agotado">Agotado</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="product-type">Tipo Producto</label>
                        <select id="product-type" name="tipoId" required>
                            <option value="">-- Seleccione Tipo --</option>
                            <c:forEach var="t" items="${listaTipos}">
                                <option value="${t.idTipo}">${t.nombre}</option>
                            </c:forEach>
                        </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="save-btn">Guardar</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script src="<c:url value='/js/lista-productos.js'/>"></script>
</body>
</html>
