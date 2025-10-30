document.addEventListener('DOMContentLoaded', function() {
    
    // Datos de ejemplo
    const dashboardData = {
        totalProductos: 1245,
        productosBajoStock: 15,
        ultimasEntradas: [
            { nombre: 'Laptop Dell XPS 15', cantidad: 5 },
            { nombre: 'Mouse Logitech MX Master', cantidad: 20 },
            { nombre: 'Monitor LG Ultrawide', cantidad: 3 }
        ],
        actividadReciente: [
            { producto: 'Laptop Dell XPS 15', cantidad: 25, tipo: 'Entrada', fecha: '2025-09-05' },
            { producto: 'Mouse Logitech', cantidad: 50, tipo: 'Entrada', fecha: '2025-09-05' },
            { producto: 'Monitor LG Ultrawide', cantidad: 12, tipo: 'Entrada', fecha: '2025-09-04' },
            { producto: 'Teclado HyperX Alloy Rise', cantidad: 30, tipo: 'Salida', fecha: '2025-09-04' },
            { producto: 'Audífonos Razer Blackshark V3', cantidad: 18, tipo: 'Salida', fecha: '2025-09-03' },
            { producto: 'Logitech MX Brio Webcam 4K', cantidad: 10, tipo: 'Salida', fecha: '2025-09-03' }

        ]
    };

    // Actualizar las tarjetas del dashboard
    document.getElementById('total-productos').textContent = dashboardData.totalProductos;
    document.getElementById('bajo-stock').textContent = dashboardData.productosBajoStock;
    
    // Cargar ultimas entradas
    const ultimasEntradasList = document.getElementById('ultimas-entradas-lista');
    dashboardData.ultimasEntradas.forEach(item => {
        const li = document.createElement('li');
        li.textContent = `${item.nombre} (${item.cantidad})`;
        ultimasEntradasList.appendChild(li);
    });

    // Cargar tabla de actividad reciente
    const activityBody = document.getElementById('activity-body');
    dashboardData.actividadReciente.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.producto}</td>
            <td>${item.cantidad}</td>
            <td>${item.tipo}</td>
            <td>${item.fecha}</td>
        `;
        activityBody.appendChild(row);
    });

});