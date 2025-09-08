document.addEventListener('DOMContentLoaded', function() {
    
    const openModalBtn = document.getElementById('openModalBtn');
    const productModal = document.getElementById('product-modal');
    const closeModalBtn = productModal.querySelector('.close-btn');
    const productForm = document.getElementById('product-form');
    
    //Muestra el modal
    function openAddModal() {
        productForm.reset();
        document.getElementById('product-id').value = ''; // Asegurarse que no hay ID
        document.getElementById('modal-title').textContent = 'Añadir Nuevo Producto';
        productModal.classList.remove('hidden');
    }

    // Muestra el modal en vista editar
    function openEditModal(producto) {
        productForm.reset();
        document.getElementById('product-id').value = producto.id;
        document.getElementById('product-name').value = producto.nombre;
        document.getElementById('product-price').value = producto.precio || '';//Por ahora no toma precios
        document.getElementById('product-stock').value = producto.stock;
        document.getElementById('product-image').value = producto.imagen;
        document.getElementById('product-description').value = producto.descripcion;
        
        document.getElementById('modal-title').textContent = 'Modificar Producto';
        productModal.classList.remove('hidden');
    }

    function closeModal() {
        productModal.classList.add('hidden');
        productForm.reset();
    }

    window.openEditModal = openEditModal; // Hacemos la función accesible globalmente

    // Eventos de los botones
    openModalBtn.addEventListener('click', openAddModal);
    closeModalBtn.addEventListener('click', closeModal);

    // Cierra el modal al hacer click afuera
    window.addEventListener('click', (e) => {
        if (e.target === productModal) {
            closeModal();
        }
    });

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
            // Logica para MODIFICAR
            console.log("Producto a modificar:", productData);
            alert(`Producto "${productData.nombre}" modificado con éxito.`);
        } else {
            // Logica para CREAR
            console.log("Nuevo producto a crear:", productData);
            alert(`Producto "${productData.nombre}" creado con éxito.`);
            productData.id = Date.now();
            //creamos tarjeta para el producto 
            if (typeof createProductCard === 'function'){
                const  card = createProductCard(productData);
                const productGrid = document.getElementById('product-grid');
                productGrid.appendChild(card);
            }else{
                console.error("crateProductCard no esta disponible")
            }
            alert(`Producto "${productData.nombre}" añadido correctamente.`);
        }
        
        // Cierra el modal despues de operación exitosa
        closeModal();
    });
});