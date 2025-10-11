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
    <jsp:include page="/WEB-INF/views/sidebar.jsp" />

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
    </main>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</div>

</body>
</html>
