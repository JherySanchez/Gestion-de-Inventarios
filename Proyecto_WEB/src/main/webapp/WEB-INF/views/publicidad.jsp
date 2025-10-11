<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Publicidad</title>
    <link rel="stylesheet" href="<c:url value='/css/dashboard.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/publicidad.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

    <div class="container">
        
        <!-- Sidebar -->
            <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <main class="main-content">
            <header class="main-header">
                <h1>Gestión de Publicidad</h1>
                <div class="header-actions">
                    <button class="add-button" id="addAdButton"><span class="material-icons">add_circle_outline</span>Añadir Anuncio</button>
                    <div class="user-info">
                        <span>Hola, Usuario</span>
                        <span class="material-icons">account_circle</span>
                    </div>
                </div>
            </header>
            
            <section class="ad-grid" id="ad-grid"></section>
        </main>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/views/footer.jsp" />

    </div>

    <script src="<c:url value='/js/publicidad.js'/>"></script>
</body>
</html>