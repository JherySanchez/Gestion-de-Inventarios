document.addEventListener('DOMContentLoaded', function () {

    // Logica para abrir los modales de REGISTRO
    const btnRegistrarIngreso = document.getElementById('btnRegistrarIngreso');
    const btnRegistrarSalida = document.getElementById('btnRegistrarSalida');
    const modalIngreso = document.getElementById('ingreso-modal');
    const modalSalida = document.getElementById('salida-modal');

    if (btnRegistrarIngreso) {
        btnRegistrarIngreso.addEventListener('click', () => modalIngreso.classList.remove('hidden'));
    }
    if (btnRegistrarSalida) {
        btnRegistrarSalida.addEventListener('click', () => modalSalida.classList.remove('hidden'));
    }

    // Logica para abrir los modales de DETALLE
    const tablas = document.querySelectorAll('.product-table tbody');
    const modalDetalle = document.getElementById('detalle-modal');
    const modalDetalleContent = document.getElementById('modal-body-content');

    tablas.forEach(tablaBody => {
        tablaBody.addEventListener('click', function (e) {
            const fila = e.target.closest('tr[data-id]');
            if (fila) {
                const id = fila.dataset.id;
                const tipo = fila.dataset.tipo;
                abrirModalConDetalles(id, tipo);
            }
        });
    });

    // Logica para CERRAR cualquier modal
    document.querySelectorAll('.modal-backdrop').forEach(modal => {
        const closeBtn = modal.querySelector('.close-btn');
        if (closeBtn) {
            closeBtn.addEventListener('click', () => modal.classList.add('hidden'));
        }
        modal.addEventListener('click', e => {
            if (e.target === modal) {
                modal.classList.add('hidden');
            }
        });
    });
    
    // Función para pedir los datos al backend y mostrar el modal de DETALLE
    function abrirModalConDetalles(id, tipo) {
        const url = tipo === 'Venta' ? `/ventas/${id}` : `/ingresos/${id}`;
        
        modalDetalleContent.innerHTML = '<p>Cargando detalles...</p>';
        modalDetalle.classList.remove('hidden');

        fetch(url)
            .then(response => {
                if (!response.ok) throw new Error('Error en la respuesta del servidor.');
                return response.json();
            })
            .then(data => {
                construirContenidoModal(data, tipo);
            })
            .catch(error => {
                console.error('Error al cargar detalles:', error);
                modalDetalleContent.innerHTML = `<p style="color: red;">No se pudieron cargar los detalles.</p>`;
            });
    }

    function construirContenidoModal(data, tipo) {
    let html = '<div class="invoice-box" id="invoiceToExport">';

    if (tipo === 'Venta') {
        // factura
        html += `
            <div class="invoice-header">
                <h2>Factura de Venta</h2>
                <strong>N° de Venta:</strong> #${String(data.id_venta).padStart(6, '0')}
            </div>
            <hr>
            <div class="customer-details">
                <div><strong>Cliente:</strong> ${data.usuario.nombre}</div>
                <div><strong>Fecha:</strong> ${new Date(data.fecha_venta).toLocaleString()}</div>
            </div>

            <table class="items-table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>P. Unitario</th>
                        <th class="text-right">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
        `;

        data.detalles.forEach(d => {
            const subtotal = d.cantidad * d.precio_unitario;
            html += `
                <tr>
                    <td>${d.producto.nombre}</td>
                    <td>${d.cantidad}</td>
                    <td>S/ ${d.precio_unitario.toFixed(2)}</td>
                    <td class="text-right">S/ ${subtotal.toFixed(2)}</td>
                </tr>
            `;
        });

        html += `
                </tbody>
            </table>
            <hr>
            <div class="invoice-total">
                <strong>TOTAL:</strong>
                <span>S/ ${data.total.toFixed(2)}</span>
            </div>
        `;

    } else { // Si es un Ingreso
        // Comprobante
        html += `
            <div class="invoice-header">
                <h2>Comprobante de Ingreso</h2>
                <strong>N° de Ingreso:</strong> #${String(data.id_ingreso).padStart(6, '0')}
            </div>
            <hr>
            <div class="customer-details">
                <div><strong>Fecha:</strong> ${new Date(data.fecha_ingreso).toLocaleString()}</div>
            </div>

            <table class="items-table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad Ingresada</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${data.producto.nombre}</td>
                        <td>${data.cantidad}</td>
                    </tr>
                </tbody>
            </table>
            <div class="item-notes">
                <strong>Descripción / Notas:</strong>
                <p>${data.descripcion || 'Sin descripción'}</p>
            </div>
        `;
    }
    
    html += '</div>'; // Cierre del contenedor
    html += `
        <div class="modal-footer">
            <button id="btnExportarPDF" class="save-btn">
                <span class="material-icons">picture_as_pdf</span> Exportar a PDF
            </button>
        </div>
    `;

    modalDetalleContent.innerHTML = html;

    document.getElementById('btnExportarPDF').addEventListener('click', function() {
        const nombreArchivo = `${tipo}-${String(tipo === 'Venta' ? data.id_venta : data.id_ingreso).padStart(6, '0')}.pdf`;
        exportarAPDF('invoiceToExport', nombreArchivo);
    });

    //Para exportar PDF
    function exportarAPDF(elementId, nombreArchivo) {
    const { jsPDF } = window.jspdf;
    const element = document.getElementById(elementId);
    
    if (!element) {
        console.error("Elemento para exportar no encontrado:", elementId);
        return;
    }

    // Usamos html2canvas para tomar el
    html2canvas(element, { scale: 2 }).then(canvas => {
        const imgData = canvas.toDataURL('image/png');
        
        // Creamos el PDF
        const pdf = new jsPDF('p', 'mm', 'a4'); // p: portrait, mm: milimetros, a4: tamaño
        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = (canvas.height * pdfWidth) / canvas.width;

        // Añadimos la imagen al PDF
        pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
        
        // Descargamos el PDF
        pdf.save(nombreArchivo);
    });
}
}
});