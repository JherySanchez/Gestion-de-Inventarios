document.addEventListener('DOMContentLoaded', function () {
    // Mostrar mensaje de éxito
    const successEl = document.getElementById('successMessage');
    if (successEl) {
        const msg = successEl.dataset.message;
        if (msg) {
            alert(msg);
            successEl.remove();
        }
    }

    // Mostrar mensaje de error
    const errorEl = document.getElementById('errorMessage');
    if (errorEl) {
        const msg = errorEl.dataset.message;
        if (msg) {
            alert('Error: ' + msg);
            errorEl.remove();
        }
    }

    // Confirmar antes de enviar formularios
    document.querySelectorAll('.config-form').forEach(form => {
        form.addEventListener('submit', function (e) {
            if (!confirm('¿Deseas guardar los cambios?')) {
                e.preventDefault();
            } else {
                alert('Cambios guardados correctamente.');
            }
        });
    });
});
