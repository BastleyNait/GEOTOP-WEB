/**
 * MOBILE CATEGORY - SIDEBAR TOGGLE
 * Funcionalidad para abrir/cerrar sidebar en móviles
 */

document.addEventListener('DOMContentLoaded', function () {

    // Solo ejecutar en móviles
    if (window.innerWidth <= 991) {
        initMobileSidebar();
    }

    // Re-inicializar en resize
    window.addEventListener('resize', function () {
        if (window.innerWidth <= 991) {
            initMobileSidebar();
        }
    });
});

function initMobileSidebar() {
    const sidebar = document.getElementById('left-column');

    if (!sidebar) return;

    // Crear botón flotante de filtros
    if (!document.querySelector('.mobile-filter-btn')) {
        const filterBtn = document.createElement('button');
        filterBtn.className = 'mobile-filter-btn';
        filterBtn.innerHTML = '<i class="material-icons">&#xE8B8;</i>'; // filter_list icon
        filterBtn.setAttribute('aria-label', 'Abrir filtros');
        document.body.appendChild(filterBtn);

        filterBtn.addEventListener('click', openSidebar);
    }

    // Crear overlay
    if (!document.querySelector('.mobile-sidebar-overlay')) {
        const overlay = document.createElement('div');
        overlay.className = 'mobile-sidebar-overlay';
        document.body.appendChild(overlay);

        overlay.addEventListener('click', closeSidebar);
    }

    // Crear botón cerrar dentro del sidebar
    if (!document.querySelector('.mobile-close-sidebar')) {
        const closeBtn = document.createElement('button');
        closeBtn.className = 'mobile-close-sidebar';
        closeBtn.innerHTML = '<i class="material-icons">&#xE5CD;</i>'; // close icon
        closeBtn.setAttribute('aria-label', 'Cerrar filtros');
        sidebar.insertBefore(closeBtn, sidebar.firstChild);

        closeBtn.addEventListener('click', closeSidebar);
    }
}

function openSidebar() {
    const sidebar = document.getElementById('left-column');
    const overlay = document.querySelector('.mobile-sidebar-overlay');

    if (sidebar && overlay) {
        sidebar.classList.add('mobile-open');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden'; // Prevenir scroll del body
    }
}

function closeSidebar() {
    const sidebar = document.getElementById('left-column');
    const overlay = document.querySelector('.mobile-sidebar-overlay');

    if (sidebar && overlay) {
        sidebar.classList.remove('mobile-open');
        overlay.classList.remove('active');
        document.body.style.overflow = ''; // Restaurar scroll
    }
}
