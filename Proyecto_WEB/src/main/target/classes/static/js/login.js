document.getElementById('loginForm').addEventListener('submit', function(event) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const error = document.getElementById('menError');
    
    if (!username || !password) {
        event.preventDefault();
        error.textContent = 'Por favor, ingrese sus credenciales';
        return;
    }
    
    error.textContent = ''; // Pa limpiar
});

