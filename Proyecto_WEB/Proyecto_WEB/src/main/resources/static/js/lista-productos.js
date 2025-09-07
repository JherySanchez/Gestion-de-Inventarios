document.addEventListener('DOMContentLoaded', function() {

    // Datos de ejemplo
    const productos = [
        { codigo: 'PROD-001', nombre: 'Laptop Dell XPS 15', precio: 1200, cantidad: 50, stock: 'Disponible' },
        { codigo: 'PROD-002', nombre: 'Mouse Logitech MX Master', precio: 25, cantidad: 150, stock: 'Disponible' },
        { codigo: 'PROD-003', nombre: 'Monitor LG Ultrawide', precio: 300, cantidad: 30, stock: 'Disponible' },
        { codigo: 'PROD-004', nombre: 'Teclado HyperX Alloy Rise', precio: 80, cantidad: 20, stock: 'Bajo' },
        { codigo: 'PROD-005', nombre: 'Audífonos Razer Blackshark V3', precio: 150, cantidad: 10, stock: 'Bajo' },
        { codigo: 'PROD-006', nombre: 'Logitech MX Brio Webcam 4K', precio: 90, cantidad: 5, stock: 'Agotado' },
    ];

    const productTableBody = document.getElementById('productTableBody');

    // Función para renderizar la tabla con los datos
    function renderTable(data) {
        productTableBody.innerHTML = ''; // Limpiar la tabla
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

    // Inicializar la tabla
    renderTable(productos);

    // Lógica para los botones de la tabla
    productTableBody.addEventListener('click', (e) => {
        if (e.target.closest('.edit-btn')) {
            const codigo = e.target.closest('.edit-btn').getAttribute('data-codigo');
            alert(`Editar producto con código: ${codigo}`);
            // Aqui se pude redirigir a un formulario de edicion o abrir un modal
        } else if (e.target.closest('.delete-btn')) {
            const codigo = e.target.closest('.delete-btn').getAttribute('data-codigo');
            if (confirm(`¿Estás seguro de que quieres eliminar el producto ${codigo}?`)) {
                alert(`Producto ${codigo} eliminado.`);
                // Logica de eliminación, luego carga la tabla again
            }
        }
    });

    // Logica para el boton de Agregar Producto
    document.getElementById('addButton').addEventListener('click', () => {
        alert('Redirigiendo... para agregar un nuevo producto.');
        // Abre el modal para añadir
    });

    // Logica para el buscador
    document.getElementById('searchButton').addEventListener('click', () => {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const filteredProducts = productos.filter(p => 
            p.nombre.toLowerCase().includes(searchTerm) || 
            p.codigo.toLowerCase().includes(searchTerm)
        );
        renderTable(filteredProducts);
    });
});