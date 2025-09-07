document.addEventListener('DOMContentLoaded', function() {
    
    // Elementos del DOM
    const openModalBtn = document.getElementById('openModalBtn');
    const productModal = document.getElementById('product-modal');
    const closeModalBtn = productModal.querySelector('.close-btn');
    const productForm = document.getElementById('product-form');
    
    // Función para mostrar el modal en modo "Añadir"
    function openAddModal() {
        productForm.reset(); // Limpiar formulario
        document.getElementById('product-id').value = ''; // Asegurarse que no hay ID
        document.getElementById('modal-title').textContent = 'Añadir Nuevo Producto';
        productModal.classList.remove('hidden');
    }

    // Función para mostrar el modal en modo "Editar"
    function openEditModal(producto) {
        productForm.reset();
        // Llenar el formulario con los datos del producto
        document.getElementById('product-id').value = producto.id;
        document.getElementById('product-name').value = producto.nombre;
        document.getElementById('product-price').value = producto.precio || ''; // Asumiendo que puede no tener precio en el catálogo
        document.getElementById('product-stock').value = producto.stock;
        document.getElementById('product-image').value = producto.imagen;
        document.getElementById('product-description').value = producto.descripcion;
        
        document.getElementById('modal-title').textContent = 'Modificar Producto';
        productModal.classList.remove('hidden');
    }

    // Función para ocultar el modal
    function closeModal() {
        productModal.classList.add('hidden');
        productForm.reset(); // Limpiar el formulario al cerrar
    }

    window.openEditModal = openEditModal; // Hacemos la función accesible globalmente

    // Eventos de los botones
    openModalBtn.addEventListener('click', openAddModal);
    closeModalBtn.addEventListener('click', closeModal);

    // Cerrar el modal al hacer clic fuera de él
    window.addEventListener('click', (e) => {
        if (e.target === productModal) {
            closeModal();
        }
    });

    // Manejar el envío del formulario
    productForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const productId = document.getElementById('product-id').value;

        // Recoger los datos del formulario
        const productData = {
            id: productId,
            nombre: document.getElementById('product-name').value,
            precio: document.getElementById('product-price').value,
            stock: document.getElementById('product-stock').value,
            imagen: document.getElementById('product-image').value,
            description: document.getElementById('product-description').value,
        };

        if (productId) {
            // Lógica para MODIFICAR
            console.log("Producto a modificar:", productData);
            alert(`Producto "${productData.nombre}" modificado con éxito.`);
            // Aquí deberías actualizar la tarjeta en el DOM o recargar la lista
        } else {
            // Lógica para CREAR
            console.log("Nuevo producto a crear:", productData);
            alert(`Producto "${productData.nombre}" creado con éxito.`);
            // Aquí deberías crear una nueva tarjeta y añadirla al grid
        }
        
        // Cerrar el modal después de la operación exitosa
        closeModal();
    });
});