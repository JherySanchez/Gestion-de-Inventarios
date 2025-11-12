<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    
    <div class="contenedor">
        
        <div class="login-header">
            <span class="material-icons">inventory_2</span>
            <h2>Sistema de Almacén</h2>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="error show">
                ${errorMessage}
            </div>
        </c:if>

        <form id="loginForm" action="login" method="post">
            
            <div class="input-group">
                <label for="username">Usuario (Email):</label>
                <span class="material-icons icon">person_outline</span>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="input-group">
                <label for="password">Contraseña:</label>
                <span class="material-icons icon">lock_outline</span>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit">Ingresar</button>
        </form>
        
        <div id="menError" class="error"></div>
    </div>
    
    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const error = document.getElementById('menError');
            
            if (!username || !password) {
                event.preventDefault();
                error.textContent = 'Por favor, ingrese sus credenciales.';
                error.classList.add('show');
                return;
            }
            
            error.textContent = ''; 
            error.classList.remove('show');
        });
    </script>
</body>
</html>