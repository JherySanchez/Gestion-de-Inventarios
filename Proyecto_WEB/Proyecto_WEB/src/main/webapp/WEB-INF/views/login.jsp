<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
    <div class="contenedor">
        <h2>Iniciar Sesión</h2>
        <form id="loginForm" action="login" method="post">
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Ingresar</button>
        </form>
        <div id="menError" class="error"></div>
    </div>
    
    <script src="<c:url value='/js/login.js'/>"></script>
</body>
</html>