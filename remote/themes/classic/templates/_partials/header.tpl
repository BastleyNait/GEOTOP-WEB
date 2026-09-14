F{**
 * HEADER GEOTOP FINAL - ESTRUCTURA CORREGIDA
 *}

{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav d-none d-md-block" style="background:#fff; border-bottom:1px solid #f1f1f1; padding:8px 0; font-size:12px;">
    <div class="container-fluid px-md-5">
      <div class="row">
        <div class="col-md-6 d-flex align-items-center text-muted">
            <i class="material-icons" style="font-size:15px; color:#F39C12; margin-right:5px;">verified</i>
            <strong>Distribuidores Oficiales:</strong>&nbsp; Leica · Garmin · Topcon
        </div>
        <div class="col-md-6">
          <div class="text-right">
            {hook h='displayNav2'}
          </div>
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top sticky-top bg-white" style="box-shadow: 0 4px 20px rgba(0,0,0,0.05); padding: 15px 0; z-index: 1000;">
    <div class="container-fluid px-md-5">
       <div class="row align-items-center">
        {* 1. LOGO *}
        <div class="col-4 col-md-2" id="_desktop_logo">
            <a href="{$urls.base_url}">
              <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}" style="max-height: 60px; width: auto;">
            </a>
        </div>
        {* 2. MENÚ *}
        <div class="col-md-7 d-none d-md-flex justify-content-center position-static">
            {hook h='displayTop'}
        </div>
        {* 3. BUSCADOR Y CARRITO *}
        {* 3. BUSCADOR Y CARRITO + BOTÓN CERTIFICADO *}
        <div class="col-8 col-md-3 d-flex flex-column justify-content-center align-items-end">
            <div class="d-flex align-items-center justify-content-end w-100">
                <div class="search-widget-wrapper mr-3">
                   {hook h='displaySearch'}
                </div>
                <div id="_desktop_cart">
                    {hook h='displayCart'}
                </div>
            </div>
            {* BOTÓN CERTIFICADO SUTIL *}
            <div class="mt-1">
                <a href="https://www.lo-exacto.com/buscar-certificados" target="_blank" class="btn-certificate-subtle" style="padding: 2px 0; font-size: 11px;">
                    <i class="material-icons" style="font-size: 24px; margin-right: 3px;">verified_user</i>
                    BUSCAR CERTIFICADOS
                </a>
            </div>
        </div>
      </div>
      <div id="mobile_top_menu_wrapper" class="row d-md-none" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
      </div>

    </div>
  </div>

  {* === ZONA HOME (SOLO VISIBLE EN PORTADA) === *}
  {if $page.page_name == 'index'}
    
    {* 1. HERO BANNER CON CARRUSEL AUTOMÁTICO *}
    <div class="modern-hero-wrapper">
        {* 3 Imágenes de fondo que rotan automáticamente *}
        <div class="hero-slideshow">
            <div class="hero-slide active" style="background-image: url('{$urls.img_url}home/banner6.png');"></div>
            <div class="hero-slide" style="background-image: url('{$urls.img_url}home/banner-main.jpeg');"></div>
            <div class="hero-slide" style="background-image: url('{$urls.img_url}home/banner.png');"></div>
            <div class="hero-slide" style="background-image: url('{$urls.img_url}home/banner5.png');"></div>
            <div class="hero-slide" style="background-image: url('{$urls.img_url}home/banner3.png');"></div>
            <div class="hero-slide" style="background-image: url('{$urls.img_url}home/banner4.png');"></div>
        </div>
        
        <div class="modern-hero-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="text-uppercase">Servicio Técnico<br>Certificado</h1>
                        <p>Expertos en calibración, mantenimiento y reparación de instrumental topográfico.</p>
                        <a href="{$link->getCategoryLink(5)}" class="btn-hero">VER CATÁLOGO</a>
                        <a href="{$link->getCMSLink(6)}" class="btn-hero">SERVICIO TÉCNICO</a>
                    </div>
                </div>
            </div>
        </div>

        {* Script para el carrusel automático *}
        <script>
        (function() {
            const slides = document.querySelectorAll('.hero-slide');
            let currentSlide = 0;
            
            function showNextSlide() {
                slides[currentSlide].classList.remove('active');
                currentSlide = (currentSlide + 1) % slides.length;
                slides[currentSlide].classList.add('active');
            }
            
            // Cambiar cada 5 segundos
            setInterval(showNextSlide, 5000);
        })();
        </script>
    </div>

    {* --- SECCIÓN DE SERVICIOS PRO --- *}
   {* --- SECCIÓN DE SERVICIOS (REPLICA EXACTA LO-EXACTO) --- *}
    <div class="services-section section-padding" style="background-color: #fff; padding: 80px 0;">
        <div class="container-fluid px-5">
            
            {* 1. ENCABEZADO CENTRADO (Bloque de ancho limitado para centrar texto) *}
            <div class="row justify-content-center mb-5">
                {* Usamos col-12 para que ocupe todo el ancho y no se divida *}
                <div class="col-12 text-center">
                    <h2 class="service-main-title">
                        Nuestros Servicios de <span>Ingeniería</span>
                    <p class="service-main-desc">
                        Ofrecemos servicios especializados de topografía y geodesia con equipos de alta precisión para garantizar el éxito de sus proyectos.
                    </p>
                    </h2>
                </div>
            </div>

            {* 2. GRID DE TARJETAS (Igualdad de altura forzada con Flexbox) *}
            <div class="row g-4 d-flex align-items-stretch">
                
                {* TARJETA 1 *}
                <div class="col-md-6 col-lg-3 mb-4 d-flex">
                    <div class="service-card-pro w-100"> {* w-100 asegura que llene el ancho *}
                        <div class="card-img-header" style="background-image: url('https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=600');">
                            <div class="floating-icon" style="background: #3498db;">
                                <i class="material-icons">apartment</i>
                            </div>
                        </div>
                        <div class="card-body-pro">
                            <h3>Obras Civiles</h3>
                            <p class="desc">Control y ejecución integral de proyectos de infraestructura.</p>
                            <ul class="pro-list">
                                <li>Control de obras civiles y fluviales</li>
                                <li>Carreteras y Alcantarillado</li>
                                <li>Movimientos de Tierra</li>
                                <li>Excavaciones y Cimentaciones</li>
                            </ul>
                        </div>
                    </div>
                </div>

                {* TARJETA 2 *}
                <div class="col-md-6 col-lg-3 mb-4 d-flex">
                    <div class="service-card-pro w-100">
                        <div class="card-img-header" style="background-image: url('https://images.unsplash.com/photo-1614730321146-b6fa6a46bcb4?w=600');">
                            <div class="floating-icon" style="background: #27ae60;">
                                <i class="material-icons">public</i>
                            </div>
                        </div>
                        <div class="card-body-pro">
                            <h3>Geodesia Satelital</h3>
                            <p class="desc">Precisión milimétrica para redes y puntos de control.</p>
                            <ul class="pro-list">
                                <li>Puntos de control geodésicos</li>
                                <li>Redes geodésicas y rurales</li>
                                <li>Replanteo en RTK</li>
                                <li>Actualización Cartográfica</li>
                            </ul>
                        </div>
                    </div>
                </div>

                {* TARJETA 3 *}
                <div class="col-md-6 col-lg-3 mb-4 d-flex">
                    <div class="service-card-pro w-100">
                        <div class="card-img-header" style="background-image: url('https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?w=600');">
                            <div class="floating-icon" style="background: #F39C12;">
                                <i class="material-icons">landscape</i>
                            </div>
                        </div>
                        <div class="card-body-pro">
                            <h3>Topografía Minera</h3>
                            <p class="desc">Control de operaciones mineras a cielo abierto.</p>
                            <ul class="pro-list">
                                <li>Levantamiento de pies y crestas</li>
                                <li>Replanteo de perforación</li>
                                <li>Control de cubicaciones</li>
                                <li>Monitoreo de Subsidencias</li>
                            </ul>
                        </div>
                    </div>
                </div>

                {* TARJETA 4 *}
                <div class="col-md-6 col-lg-3 mb-4 d-flex">
                    <div class="service-card-pro w-100">
                        <div class="card-img-header" style="background-image: url('https://images.unsplash.com/photo-1464207687429-7505649dae38?w=600');">
                            <div class="floating-icon" style="background: #c0392b;">
                                <i class="material-icons">flash_on</i>
                            </div>
                        </div>
                        <div class="card-body-pro">
                            <h3>Obras Subterráneas</h3>
                            <p class="desc">Soluciones topográficas en entornos confinados.</p>
                            <ul class="pro-list">
                                <li>Levantamiento de túneles</li>
                                <li>Poligonal de precisión</li>
                                <li>Control de valorizaciones</li>
                                <li>Trazo de dirección y gradiente</li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            
            {* Botón Cotizar Centrado *}
            <div class="row mt-5">
                <div class="col-12 text-center">
                     <a href="{$link->getPageLink('contact')}" class="btn-cotizar-pro">COTIZAR PROYECTO</a>
                </div>
            </div>
        </div>
    </div>

    {* 3. CATÁLOGO GENERAL (GRID 4X4 CORREGIDO) *}
    <div class="catalog-grid-section" style="background-color: #f4f6f8; padding: 100px 0;">
        <div class="container-fluid px-5">
            <div class="row mb-5">
                <div class="col-12 text-center section-header-pro">
                    <h2 class="title-pro">CATÁLOGO <span style="color: #F39C12;">GENERAL</span></h2>
                    <div class="separator-pro"></div>
                    <p class="subtitle-pro">Explora nuestra gama completa de tecnología de precisión</p>
                </div>
            </div>

            {* AQUÍ ESTÁ LA CLAVE: col-lg-3 PARA TODOS (4 por fila) *}
            <div class="row g-4">
                
                {* Fila 1 *}
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(5)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/estaciones_totales.png');"></div>
                        <div class="geo-content"><h3>Estaciones Totales</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(4)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/niveles.png');"></div>
                        <div class="geo-content"><h3>Niveles</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(7)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/teodolitos.png');"></div>
                        <div class="geo-content"><h3>Teodolitos</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(8)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/gps_diferenciales.png');"></div>
                        <div class="geo-content"><h3>GPS Diferenciales</h3></div>
                    </a>
                </div>

                {* Fila 2 *}
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(39)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/gps_navegadores.png');"></div>
                        <div class="geo-content"><h3>GPS Navegadores</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(38)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/gps_submetricos.png');"></div>
                        <div class="geo-content"><h3>GPS Submétricos</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(66)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/lidars.png');"></div>
                        <div class="geo-content"><h3>Lidars</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(67)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/drones.png');"></div>
                        <div class="geo-content"><h3>Drones</h3></div>
                    </a>
                </div>

                {* Fila 3 *}
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(71)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/brujulas.png');"></div>
                        <div class="geo-content"><h3>Brújulas</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(68)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/rastreo.png');"></div>
                        <div class="geo-content"><h3>Rastreo</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(69)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('{$urls.img_url}catalog/radios.png');"></div>
                        <div class="geo-content"><h3>Radios</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(70)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=500');"></div>
                        <div class="geo-content"><h3>Ecosondas</h3></div>
                    </a>
                </div>

                {* Fila 4 *}
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(73)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=500');"></div>
                        <div class="geo-content"><h3>Accesorios</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(76)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=500');"></div>
                        <div class="geo-content"><h3>Distanciómetros</h3></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(78)}" class="geo-card-mini">
                        <div class="geo-bg" style="background-image: url('https://images.unsplash.com/photo-1584907797015-7554cd315667?w=500');"></div>
                        <div class="geo-content"><h3>Placas Geodésicas</h3></div>
                    </a>
                </div>
                
                {* Botón MÁS *}
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="{$link->getCategoryLink(3)}" class="geo-card-mini geo-card-more">
                        <div class="geo-bg" style="background: #F39C12;"></div>
                        <div class="geo-content">
                            <h3>MÁS<br>PRODUCTOS</h3>
                            <i class="material-icons" style="font-size: 35px; color: white; margin-top: 10px;">add_circle</i>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </div>
  {/if}

  {hook h='displayNavFullWidth'}
{/block}