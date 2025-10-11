document.addEventListener('DOMContentLoaded', function () {
    const productTableBody = document.getElementById('productTableBody');
    if (!productTableBody) return;
    
    const modal = document.getElementById('product-modal');
    const form = document.getElementById('product-form');
    const modalTitle = document.getElementById('modal-title');

    const codeGroup = document.getElementById('product-code-group');
    const inputCodigo = document.getElementById('product-code');
    const inputNombre = document.getElementById('product-name');
    const inputPrecio = document.getElementById('product-price');
    const inputCantidad = document.getElementById('product-quantity');
    const inputStock = document.getElementById('product-stock');

    productTableBody.addEventListener('click', (e) => {
        const button = e.target.closest('button');
        if (!button) return;

        const codigo = button.dataset.codigo;
        if (button.classList.contains('edit-btn')) {
            // Recoger datos de la fila para abrir el modal
            const row = button.closest('tr');
            const producto = {
                codigo: codigo,
                nombre: row.cells[1].textContent,
                precio: parseFloat(row.cells[2].textContent.replace('S/.', '').trim()),
                stock: parseInt(row.cells[3].textContent), 
                estado: row.cells[4].textContent
            };
            openModal(producto);
        } else if (button.classList.contains('delete-btn')) {
            if (confirm(`¿Eliminar producto ${codigo}?`)) {
                window.location.href = `/productos/eliminar/${codigo}`;
            }
        }
    });

    const addProductBtn = document.getElementById('addListedProductBtn');
    if (addProductBtn) {
        addProductBtn.addEventListener('click', () => {
            openModal();
        });
    }

    function openModal(producto = null) {
        form.reset();
        form.action = '/productos/agregar';

        if (producto) {
            codeGroup.style.display = 'block';
            modalTitle.textContent = 'Editar Producto';
            inputCodigo.value = producto.codigo;
            inputNombre.value = producto.nombre;
            inputPrecio.value = producto.precio;
            inputCantidad.value = producto.stock;
            inputStock.value = producto.estado.trim(); 
            inputCodigo.readOnly = true;
        } else {
            codeGroup.style.display = 'none';
            modalTitle.textContent = 'Añadir Producto';
            inputCodigo.value = '';
            inputCodigo.readOnly = false;
        }
        modal.classList.remove('hidden');
    }

    modal.querySelector('.close-btn').addEventListener('click', () => modal.classList.add('hidden'));
    window.addEventListener('click', (e) => {
        if (e.target === modal) modal.classList.add('hidden');
    });

    // Mensajes de feedback (éxito o error)
    const successMessage = document.querySelector('.alert-success');
    if (successMessage) {
        setTimeout(() => successMessage.style.display = 'none', 4000);
    }
    const errorMessage = document.querySelector('.alert-danger');
    if (errorMessage) {
        setTimeout(() => errorMessage.style.display = 'none', 4000);
    }
    
    const searchButton = document.getElementById('searchButton');
    if (searchButton) {
        searchButton.addEventListener('click', () => {
            const term = document.getElementById('searchInput').value;
            window.location.href = `/buscar-productos?query=${encodeURIComponent(term)}`;
        });
    }
});
