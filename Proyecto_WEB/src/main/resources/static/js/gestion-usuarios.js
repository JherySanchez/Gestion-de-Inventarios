document.addEventListener('DOMContentLoaded', function() {
    const userModal = document.getElementById('user-modal'); 
    if (!userModal) {
        console.error("El elemento con ID 'user-modal' no fue encontrado. El modal no funcionará.");
        return;
    }
    
    // Botones y formulario
    const addUserButton = document.getElementById('addUserButton');
    const userForm = document.getElementById('user-form');
    const userTableBody = document.getElementById('userTableBody');
    const closeModalBtn = userModal.querySelector('.close-btn');
    
    // Elementos del formulario
    const modalTitle = document.getElementById('modal-title');
    const inputId = document.getElementById('user-id');
    const inputNombre = document.getElementById('user-name');
    const inputEmail = document.getElementById('user-email');
    const inputRol = document.getElementById('user-rol');
    const inputEstado = document.getElementById('user-estado');
    
    /** Funcion para ocultar el modal */
    function closeUserModal() {
        userModal.classList.add('hidden');
        userForm.reset();
        userForm.action = '/gestion-usuarios/agregar'; 
    }
    
    /** * Función principal para mostrar el modal y configurar el formulario.
     * @param {string} title - Título del modal.
     * @param {string} actionUrl - La URL de acción del formulario (agregar o editar).
     * @param {boolean} isEdit - Si es modo edición.
     * @param {object} userData - Datos del usuario si es modo edición.
     */
    function showUserModal(title, actionUrl, isEdit = false, userData = {}) {
        modalTitle.textContent = title;
        userForm.action = actionUrl;
        
        if (isEdit) {
            // Modo Editar: Llenar el formulario con datos
            inputId.value = userData.id || '';
            inputNombre.value = userData.nombre || '';
            inputEmail.value = userData.email || '';
            inputRol.value = userData.rol || '';
            inputEstado.value = userData.estado || 'ACTIVO';
            
        } else {
            // Modo Añadir: Limpiar formulario
            userForm.reset(); 
            inputId.value = '';
            inputEstado.value = 'ACTIVO'; //Al añadir por defecto esta activo 
        }

        userModal.classList.remove('hidden'); // Muestra el modal
    }

    // Abrir Modal para Crear Usuario (Boton principal "Agregar Usuario")
    if (addUserButton) {
        addUserButton.addEventListener('click', () => {
            const createUrl = '/gestion-usuarios/agregar'; // Ruta de creación
            showUserModal('Añadir Nuevo Usuario', createUrl, false);
        });
    }

    // Cerrar modal con el botón 'X'
    if (closeModalBtn) {
        closeModalBtn.addEventListener('click', closeUserModal);
    }

    // Cerrar el modal al hacer clic fuera de él
    window.addEventListener('click', (e) => {
        if (e.target === userModal) {
            closeUserModal();
        }
    });

    
    // Lgica de Botones de la Tabla (Editar y Eliminar)
    
    userTableBody.addEventListener('click', (e) => {
        
        // Manejar el botón EDITAR
        if (e.target.closest('.edit-btn')) {
            const row = e.target.closest('tr');
            const userId = row.querySelector('.edit-btn').getAttribute('data-id');
            
            const userData = {
                id: userId,
                nombre: row.cells[1].textContent, // Columna Nombre
                email: row.cells[2].textContent,  // Columna Email
                rol: row.cells[3].textContent,    // Columna Rol
                estado: row.cells[4].textContent.trim()   // Columna Estado
            };
            
            const editUrl = `/gestion-usuarios/editar/${userId}`; 
            
            showUserModal('Editar Usuario', editUrl, true, userData);

        // Manejar el boton ELIMINAR
        } else if (e.target.closest('.delete-btn')) {
            const userId = e.target.closest('.delete-btn').getAttribute('data-id');
            const userName = e.target.closest('tr').cells[1].textContent;
            
            if (confirm(`¿Estás seguro de que quieres eliminar a ${userName}?`)) {
                window.location.href = `/gestion-usuarios/eliminar/${userId}`; 
            }
        }
    });

    const searchButton = document.getElementById('searchButton');
    const searchInput = document.getElementById('searchInput');

    if (searchButton) {
        searchButton.addEventListener('click', () => {
            const searchTerm = searchInput.value;
            window.location.href = `/gestion-usuarios?search=${encodeURIComponent(searchTerm)}`;
        });
        
        if (searchInput) {
            searchInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    searchButton.click();
                }
            });
        }
    }
});