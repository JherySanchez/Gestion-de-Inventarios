document.addEventListener('DOMContentLoaded', function() {
    // Datos de ejemplo
    const productos = [
        {
            id: 1,
            nombre: 'Laptop Dell XPS 15',
            descripcion: 'Potente laptop para diseño gráfico y desarrollo de software.',
            imagen: '/img/Laptop.avif',
            stock: 25
        },
        {
            id: 2,
            nombre: 'Monitor LG Ultrawide',
            descripcion: 'Pantalla ultra ancha para mayor productividad y experiencia inmersiva.',
            imagen: '/img/Monitor.avif',
            stock: 12
        },
        {
            id: 3,
            nombre: 'Mouse Logitech MX Master',
            descripcion: 'Mouse ergonómico de alta precisión para profesionales.',
            imagen: '/img/Mouse.avif',
            stock: 50
        },
        {
            id: 4,
            nombre: 'Teclado HyperX Alloy Rise',
            descripcion: 'Teclado retro-iluminado con switches para una escritura fluida.',
            imagen: '/img/Teclado.avif',
            stock: 30
        },
        {
            id: 5,
            nombre: 'Audífonos Razer Blackshark V3',
            descripcion: 'Auriculares con sonido envolvente para gaming.',
            imagen: '/img/Audifonos.avif',
            stock: 18
        },
        {
            id: 6,
            nombre: 'Logitech MX Brio Webcam 4K',
            descripcion: 'Cámara web de alta definición para videollamadas y streaming.',
            imagen: '/img/Webcam.avif',
            stock: 10
        }
    ];

    const productGrid = document.getElementById('product-grid');

    // Para crear una tarjeta de producto
    function createProductCard(producto) {
        const card = document.createElement('div');
        card.className = 'product-card';
        card.setAttribute('data-id', producto.id);
        
        card.innerHTML = `
            <img src="${producto.imagen}" alt="${producto.nombre}" class="product-image">
            <div class="product-info">
                <h3>${producto.nombre}</h3>
                <p>${producto.descripcion}</p>
                <p><strong>Stock:</strong> ${producto.stock}</p>
            </div>
            <div class="product-actions">
                <button class="action-button edit" title="Modificar Producto">
                    <span class="material-icons">edit</span>
                </button>
                <button class="action-button delete" title="Eliminar Producto">
                    <span class="material-icons">delete</span>
                </button>
            </div>
        `;
        
        // Agregar eventos a los botones
        card.querySelector('.edit').addEventListener('click', () => {
            // Llama a la función global del otro script para abrir el modal en modo edición
            if (window.openEditModal) {
                window.openEditModal(producto);
            }
        });
        
        card.querySelector('.delete').addEventListener('click', () => {
            if (confirm(`¿Estás seguro de que quieres eliminar el producto: ${producto.nombre}?`)) {
                //Aqui va la logica para eliminar en una BD
                card.remove();
            }
        });
        
        return card;
    }

    // Renderizar tarjetas de producto
    productos.forEach(producto => {
        const card = createProductCard(producto);
        productGrid.appendChild(card);
    });
    //declaramos productcart para que funcione en el otro script
    window.createProductCard = createProductCard;
    window.productos = productos;

});