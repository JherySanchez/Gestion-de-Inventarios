<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <link rel="stylesheet" href="<c:url value='/css/creacion-producto.css'/>">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

    <div class="container">
        
        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <main class="main-content">
            <header class="main-header">
                <h1>Gestión de Usuarios</h1>
                <div class="header-actions">
                    <button class="add-button" id="addUserButton"><span class="material-icons">person_add</span>Agregar Usuario</button>
                    <div class="user-info">
                        <span>Hola, Administrador</span>
                        <span class="material-icons">account_circle</span>
                    </div>
                </div>
            </header>
            
            <c:if test="${not empty error}">
                <div class="alert alert-error" style="background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
                    ${error}
                </div>
            </c:if>
            
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
                        <c:choose>
                            <c:when test="${not empty usuarios}">
                                <c:forEach var="user" items="${usuarios}">
                                    <tr>
                                        <td>${user.idUsuario}</td>
                                        <td>${user.nombre}</td>
                                        <td>${user.email}</td>
                                        <td>${user.rol}</td>
                                        <td><span class="status ${user.estado.toLowerCase()}">${user.estado}</span></td>
                                        <td class="actions-cell">
                                            <button class="action-button edit-btn" data-id="${user.idUsuario}" title="Editar">
                                                <span class="material-icons">edit</span>
                                            </button>
                                            <button class="action-button delete-btn" data-id="${user.idUsuario}" title="Eliminar">
                                                <span class="material-icons">delete</span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" style="text-align: center; color: #777;">No hay usuarios registrados en la base de datos.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </section>
        </main>
        
        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>

    <div id="user-modal" class="modal-backdrop hidden">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modal-title">Añadir Nuevo Usuario</h2>
                <button class="close-btn">&times;</button>
            </div>
            <div class="modal-body">
                <form id="user-form" action="<c:url value='/gestion-usuarios/agregar'/>" method="post">
                    <input type="hidden" id="user-id" name="idUsuario"> 
                    
                    <div class="form-group">
                        <label for="user-name">Nombre del Usuario</label>
                        <input type="text" id="user-name" name="nombre" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="user-email">Email</label>
                        <input type="email" id="user-email" name="email" required placeholder="Debe terminar en @gmail.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="user-rol">Rol</label>
                        <select id="user-rol" name="rol" required>
                            <option value="Administrador">Administrador</option>
                            <option value="Empleado">Empleado</option>
                            <option value="Invitado">Invitado</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="user-estado">Estado</label>
                        <select id="user-estado" name="estado" required>
                            <option value="ACTIVO">Activo</option>
                            <option value="INACTIVO">Inactivo</option>
                        </select>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="save-btn">Guardar Usuario</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="<c:url value='/js/gestion-usuarios.js'/>"></script>
    
    </body>
</html>