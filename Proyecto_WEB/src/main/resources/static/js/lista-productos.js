document.addEventListener('DOMContentLoaded', function () {
    let productos = [
        { codigo: 'PROD-001', nombre: 'Laptop Dell XPS 15', precio: 1200, cantidad: 50, stock: 'Disponible' },
        { codigo: 'PROD-002', nombre: 'Mouse Logitech MX Master', precio: 25, cantidad: 150, stock: 'Disponible' },
        { codigo: 'PROD-003', nombre: 'Monitor LG Ultrawide', precio: 300, cantidad: 30, stock: 'Disponible' },
        { codigo: 'PROD-004', nombre: 'Teclado HyperX Alloy Rise', precio: 80, cantidad: 20, stock: 'Bajo' },
        { codigo: 'PROD-005', nombre: 'Audífonos Razer Blackshark V3', precio: 150, cantidad: 10, stock: 'Bajo' },
        { codigo: 'PROD-006', nombre: 'Logitech MX Brio Webcam 4K', precio: 90, cantidad: 5, stock: 'Agotado' },
    ];

    const productTableBody = document.getElementById('productTableBody');
    const modal = document.getElementById('product-modal');
    const form = document.getElementById('product-form');
    const modalTitle = document.getElementById('modal-title');

    const inputCodigo = document.getElementById('product-code');
    const inputNombre = document.getElementById('product-name');
    const inputPrecio = document.getElementById('product-price');
    const inputCantidad = document.getElementById('product-quantity');
    const inputStock = document.getElementById('product-stock');

    function renderTable(data) {
        productTableBody.innerHTML = '';
        data.forEach(producto => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${producto.codigo}</td>
                <td>${producto.nombre}</td>
                <td>$${producto.precio.toFixed(2)}</td>
                <td>${producto.cantidad}</td>
                <td>${producto.stock}</td>
                <td class="actions-cell">
                    <button class="action-button edit-btn" data-codigo="${producto.codigo}" title="Editar">
                        <span class="material-icons">edit</span>
                    </button>
                    <button class="action-button delete-btn" data-codigo="${producto.codigo}" title="Eliminar">
                        <span class="material-icons">delete</span>
                    </button>
                </td>
            `;
            productTableBody.appendChild(row);
        });
    }

    renderTable(productos);

    productTableBody.addEventListener('click', (e) => {
        const button = e.target.closest('button');
        if (!button) return;

        const codigo = button.dataset.codigo;
        if (button.classList.contains('edit-btn')) {
            const producto = productos.find(p => p.codigo === codigo);
            if (producto) openModal(producto);
        } else if (button.classList.contains('delete-btn')) {
            if (confirm(`¿Eliminar producto ${codigo}?`)) {
                productos = productos.filter(p => p.codigo !== codigo);
                renderTable(productos);
            }
        }
    });

    document.getElementById('addListedProductBtn').addEventListener('click', () => {
        openModal();
    });

    function openModal(producto = null) {
        form.reset();
        if (producto) {
            modalTitle.textContent = 'Editar Producto';
            inputCodigo.value = producto.codigo;
            inputNombre.value = producto.nombre;
            inputPrecio.value = producto.precio;
            inputCantidad.value = producto.cantidad;
            inputStock.value = producto.stock;
        } else {
            modalTitle.textContent = 'Añadir Producto';
            inputCodigo.value = '';
        }
        modal.classList.remove('hidden');
    }

    modal.querySelector('.close-btn').addEventListener('click', () => modal.classList.add('hidden'));
    window.addEventListener('click', (e) => {
        if (e.target === modal) modal.classList.add('hidden');
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const newProduct = {
            codigo: inputCodigo.value || `PROD-${(productos.length + 1).toString().padStart(3, '0')}`,
            nombre: inputNombre.value,
            precio: parseFloat(inputPrecio.value),
            cantidad: parseInt(inputCantidad.value),
            stock: inputStock.value
        };

        const index = productos.findIndex(p => p.codigo === newProduct.codigo);
        if (index !== -1) {
            productos[index] = newProduct;
        } else {
            productos.push(newProduct);
        }

        renderTable(productos);
        modal.classList.add('hidden');

        fetch('/productos/agregar', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(newProduct)
        })
        .then(res => {
            if (res.ok) {
                console.log('Producto guardado en el backend');
            } else {
                console.warn('Error al guardar en el backend');
            }
        })
        .catch(err => {
            console.error('Error de conexión:', err);
        });
    });

    document.getElementById('searchButton').addEventListener('click', () => {
        const term = document.getElementById('searchInput').value.toLowerCase();
        const filtered = productos.filter(p =>
            p.nombre.toLowerCase().includes(term) || p.codigo.toLowerCase().includes(term)
        );
        renderTable(filtered);
    });
});
