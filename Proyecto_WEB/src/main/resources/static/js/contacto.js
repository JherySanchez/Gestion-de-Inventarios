document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contactForm');

    contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const subject = document.getElementById('subject').value;
        const message = document.getElementById('message').value;

        alert(`¡Mensaje enviado!\n\nNombre: ${name}\nEmail: ${email}\nAsunto: ${subject}\nMensaje: ${message}`);

        contactForm.reset();
    });
});
