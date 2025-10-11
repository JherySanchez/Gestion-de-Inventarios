<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Movimientos</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/lista-productos.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/creacion-producto.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/movimientos.css'/>">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.3/jspdf.umd.min.js"></script>


    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <div class="container">
        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <main class="main-content">
            <header class="main-header">
                <h1>Gestión de Movimientos</h1>
                <div class="header-actions">
                    <button class="add-button" id="btnRegistrarIngreso">
                        <span class="material-icons">add_circle</span> Registrar Ingreso
                    </button>
                    <button id="btnRegistrarSalida" class="add-button" style="background-color: #e74c3c;">
                        <span class="material-icons">remove_circle</span> Registrar Venta/Salida
                    </button>
                </div>
            </header>

            <c:if test="${not empty successMessage}">
                <div class="alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert-danger">${errorMessage}</div>
            </c:if>
            
            <section class="list-section">
                <h2><span class="material-icons" style="color: #27ae60;">arrow_downward</span> Ingresos de Mercadería</h2>
                <table class="product-table">
                    <thead>
                        <tr><th>Fecha</th><th>Producto</th><th>Cantidad</th><th>Descripción</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ingresos}" var="ingreso">
                            <tr class="movimiento-row" data-id="${ingreso.id_ingreso}" data-tipo="Ingreso" style="cursor: pointer;">
                                <td><fmt:formatDate value="${ingreso.getFechaIngresoAsDate()}" pattern="dd/MM/yyyy HH:mm"/></td>
                                <td>${ingreso.producto.nombre}</td>
                                <td>${ingreso.cantidad}</td>
                                <td>${ingreso.descripcion}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>

            <section class="list-section">
                <h2><span class="material-icons" style="color: #c0392b;">arrow_upward</span> Salidas / Ventas</h2>
                <table class="product-table">
                    <thead>
                        <tr><th>Fecha</th><th>Cliente</th><th>Total Venta</th><th>Productos Vendidos</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ventas}" var="venta">
                            <tr class="movimiento-row" data-id="${venta.id_venta}" data-tipo="Venta" style="cursor: pointer;">
                                <td><fmt:formatDate value="${venta.getFechaVentaAsDate()}" pattern="dd/MM/yyyy HH:mm"/></td>
                                <td>${venta.usuario.nombre}</td>
                                <td>S/ <fmt:formatNumber value="${venta.total}" type="number" minFractionDigits="2"/></td>
                                <td>
                                    <ul>
                                        <c:forEach items="${venta.detalles}" var="detalle">
                                            <li>${detalle.cantidad} x ${detalle.producto.nombre}</li>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>

        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>

    <div id="detalle-modal" class="modal-backdrop hidden">
        <div class="modal-content"><div class="modal-header"><h2 id="modal-title">Detalles</h2><button class="close-btn">&times;</button></div><div class="modal-body" id="modal-body-content"></div></div>
    </div>

    <div id="ingreso-modal" class="modal-backdrop hidden">
        <div class="modal-content">
            <div class="modal-header"><h2>Registrar Ingreso</h2><button class="close-btn">&times;</button></div>
            <div class="modal-body">
                <form action="/ingresos/agregar" method="POST">
                    <div class="form-group"><label>Producto:</label><select name="id_producto" required><c:forEach items="${productos}" var="p"><option value="${p.idProducto}">${p.nombre}</option></c:forEach></select></div>
                    <div class="form-group"><label>Cantidad:</label><input type="number" name="cantidad" required></div>
                    <div class="form-group"><label>Descripción:</label><input type="text" name="descripcion"></div>
                    <div class="form-actions"><button type="submit" class="save-btn">Guardar Ingreso</button></div>
                </form>
            </div>
        </div>
    </div>

    <div id="salida-modal" class="modal-backdrop hidden">
         <div class="modal-content">
            <div class="modal-header"><h2>Registrar Venta/Salida</h2><button class="close-btn">&times;</button></div>
            <div class="modal-body">
                <form action="/ventas/agregar" method="POST">
                    <div class="form-group"><label>Cliente:</label><select name="id_usuario" required><c:forEach items="${usuarios}" var="u"><option value="${u.idUsuario}">${u.nombre}</option></c:forEach></select></div>
                    <div class="form-group"><label>Producto:</label><select name="id_producto" required><c:forEach items="${productos}" var="p"><option value="${p.idProducto}">${p.nombre}</option></c:forEach></select></div>
                    <div class="form-group"><label>Cantidad:</label><input type="number" name="cantidad" required></div>
                    <div class="form-group"><label>Total (S/):</label><input type="number" step="0.01" name="total" required></div>
                    <div class="form-actions"><button type="submit" class="save-btn">Guardar Salida</button></div>
                </form>
            </div>
        </div>
    </div>

    <script src="<c:url value='/js/movimientos.js'/>"></script>
</body>
</html>