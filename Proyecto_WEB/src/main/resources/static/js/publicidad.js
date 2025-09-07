    // Datos de ejemplo
    const anuncios = [
        {
            id: 1,
            titulo: '¡Descuento del 50% en Laptops!',
            descripcion: 'Aprovecha nuestra oferta especial por tiempo limitado en laptops seleccionadas.',
            imagen: '/img/Laptop.avif',
        },
        {
            id: 2,
            titulo: 'Nuevo Stock: Perifericos Gaming',
            descripcion: 'Llegaron los ultimos modelos de teclados, mouses y audífonos para gamers.',
            imagen: '/img/Mouse.avif',
        },
        {
            id: 3,
            titulo: 'Articulos de Oficina',
            descripcion: 'Renueva tu espacio de trabajo con precios increibles en todos nuestros productos de oficina.',
            imagen: '/img/Webcam.avif',
        },
    ];

    const adGrid = document.getElementById('ad-grid');

    // Para crear un anuncio
    function createAdCard(anuncio) {
        const card = document.createElement('div');
        card.className = 'ad-card';
        card.setAttribute('data-id', anuncio.id);
        
        card.innerHTML = `
            <img src="${anuncio.imagen}" alt="${anuncio.titulo}" class="ad-image">
            <div class="ad-content">
                <h3>${anuncio.titulo}</h3>
                <p>${anuncio.descripcion}</p>
            </div>
            <div class="ad-actions">
                <button class="ad-action-button edit-ad-btn" title="Modificar Anuncio">
                    <span class="material-icons">edit</span>
                </button>
                <button class="ad-action-button delete-ad-btn" title="Eliminar Anuncio">
                    <span class="material-icons">delete</span>
                </button>
            </div>
        `;

        card.querySelector('.edit-ad-btn').addEventListener('click', () => {
            alert(`Modificar anuncio: ${anuncio.titulo}`);
        });
        
        card.querySelector('.delete-ad-btn').addEventListener('click', () => {
            if (confirm(`¿Estás seguro de que quieres eliminar el anuncio "${anuncio.titulo}"?`)) {
                alert(`Anuncio "${anuncio.titulo}" eliminado.`);
                card.remove();
            }
        });
        
        return card;
    }

    // Renderizar tarjetas
    anuncios.forEach(item => {
        const card = createAdCard(item);
        adGrid.appendChild(card);
    });

    // Evento para el botón añadir anuncio
    document.getElementById('addAdButton').addEventListener('click', () => {
        alert('Redirigiendo... para añadir un nuevo anuncio.');
    });
