document.addEventListener('DOMContentLoaded', function() {
    
    // Datos de ejemplo para la tabla de usuarios
    let usuarios = [
        { id: 1, nombre: 'Juan Pérez', email: 'juan.perez@almacen.com', rol: 'Administrador', estado: 'Activo' },
        { id: 2, nombre: 'María López', email: 'maria.lopez@almacen.com', rol: 'Empleado', estado: 'Activo' },
        { id: 3, nombre: 'Carlos Ruiz', email: 'carlos.ruiz@almacen.com', rol: 'Empleado', estado: 'Inactivo' },
        { id: 4, nombre: 'Ana García', email: 'ana.garcia@almacen.com', rol: 'Administrador', estado: 'Activo' },
    ];

    const userTableBody = document.getElementById('userTableBody');

    // Función para renderizar la tabla con los datos
    function renderTable(data) {
        userTableBody.innerHTML = '';
        data.forEach(user => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${user.id}</td>
                <td>${user.nombre}</td>
                <td>${user.email}</td>
                <td>${user.rol}</td>
                <td><span class="status ${user.estado.toLowerCase()}">${user.estado}</span></td>
                <td class="actions-cell">
                    <button class="action-button edit-btn" data-id="${user.id}" title="Editar">
                        <span class="material-icons">edit</span>
                    </button>
                    <button class="action-button delete-btn" data-id="${user.id}" title="Eliminar">
                        <span class="material-icons">delete</span>
                    </button>
                </td>
            `;
            userTableBody.appendChild(row);
        });
    }

    // Inicializar la tabla
    renderTable(usuarios);

    // Lógica para los botones de la tabla (Editar y Eliminar)
    userTableBody.addEventListener('click', (e) => {
        if (e.target.closest('.edit-btn')) {
            const userId = parseInt(e.target.closest('.edit-btn').getAttribute('data-id'));
            const userToEdit = usuarios.find(user => user.id === userId);
            alert(`Editar usuario: ${userToEdit.nombre}`);
            // Aquí puedes redirigir a un formulario de edición o abrir un modal
        } else if (e.target.closest('.delete-btn')) {
            const userId = parseInt(e.target.closest('.delete-btn').getAttribute('data-id'));
            const userToDelete = usuarios.find(user => user.id === userId);
            if (confirm(`¿Estás seguro de que quieres eliminar a ${userToDelete.nombre}?`)) {
                usuarios = usuarios.filter(user => user.id !== userId);
                alert(`Usuario ${userToDelete.nombre} eliminado.`);
                renderTable(usuarios);
            }
        }
    });

    // Lógica para el botón "Agregar Usuario"
    document.getElementById('addUserButton').addEventListener('click', () => {
        alert('Redirigiendo a la página para agregar un nuevo usuario.');
        // Aquí puedes redirigir a un formulario de creación de usuario
    });

    // Lógica para el buscador
    document.getElementById('searchButton').addEventListener('click', () => {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const filteredUsers = usuarios.filter(user => 
            user.nombre.toLowerCase().includes(searchTerm) || 
            user.email.toLowerCase().includes(searchTerm)
        );
        renderTable(filteredUsers);
    });
});