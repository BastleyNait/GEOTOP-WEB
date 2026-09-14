{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable tos
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {$cms.meta_title}
{/block}

{block name='page_content_container'}
  {if isset($cms) && $cms.id == 4}
    {* Custom redesigned About Us page *}
    <div class="about-us-modern">
      
      {* Hero Section *}
      <section class="about-hero">
        <div class="container">
          <h1>Nosotros</h1>
          <p class="hero-subtitle">GEOTOP AQP</p>
          <p class="hero-description">
            Una empresa de alto nivel que pone a su servicio soluciones innovadoras con prácticas tecnológicas que lo ayudan a planificar con total confianza todo tipo de trabajo que se requiera en geodesia, cartografía, obra civiles, topografía minera, y calibración. Desarrollo topográfico y servicio topográfico de primera como civil.
          </p>
        </div>
      </section>

      {* Company Information Section *}
      <section class="company-info">
        <div class="container"> {* Image Cards Grid *}
            <div class="image-cards-grid" style="overflow: hidden;" >
                
                
                <div class="image-card" data-aos="fade-up" data-aos-delay="400">
                <img style="object-position: top;" src="{$urls.base_url}img/cms/nuevo/banner_productos.png" alt="Soporte Técnico" loading="lazy">
                <div class="image-card-overlay">
                  <span>Productos</span>
                </div>
              </div>
              <div class="image-card" data-aos="fade-up" data-aos-delay="500">
                <img src="{$urls.base_url}img/cms/nuevo/dron.jpg" alt="Soporte Técnico" loading="lazy">
                <div class="image-card-overlay">
                  <span>Soporte Especializado</span>
                </div>
              </div>
              <div class="image-card" data-aos="fade-up" data-aos-delay="600">
                <img style="transform: scale(1.4);"  src="{$urls.base_url}img/cms/banner-main.jpeg" alt="Soporte de calibracion" loading="lazy">
                <div class="image-card-overlay">
                  <span>Soporte de calibración</span>
                </div>
              </div>
              <div class="image-card" data-aos="fade-up" data-aos-delay="100">
                <img src="{$urls.base_url}img/cms/tecnico5.jpg" alt="Equipo Técnico GEOTOP" loading="lazy">
                <div class="image-card-overlay">
                  <span>Equipo Profesional</span>
                </div>
              </div>
              <div class="image-card" data-aos="fade-up" data-aos-delay="200">
                <img src="{$urls.base_url}img/cms/sobre-nosotros.jpeg" alt="Servicios GEOTOP" loading="lazy">
                <div class="image-card-overlay">
                  <span>Servicios Especializados</span>
                </div>
              </div>
              <div class="image-card" data-aos="fade-up" data-aos-delay="300">
                <img src="{$urls.base_url}img/cms/nuevo/en_la_calle.jpg" alt="Soporte Técnico" loading="lazy">
                <div class="image-card-overlay">
                  <span>Soporte Técnico</span>
                </div>
              </div>
              
            </div>
          <h2 class="section-title" style="margin-top: 1em;">Sobre nosotros</h2>
          <div class="company-grid">
            <div class="company-card">
              <h3>Nuestra empresa</h3>
              <p>
                GEOTOP AQP es una empresa de alto nivel que pone a su servicio soluciones innovadoras con prácticas tecnológicas que lo ayudan a planificar con total confianza todo tipo de trabajo que se requiera en geodesia, cartografía, obras civiles, topografía minera, y calibración. Desarrollo topográfico y servicio topográfico de primera como civil.
              </p>
            </div>
            <div class="company-card">
              <h3>PERFIL</h3>
              <p>
                Nuestros ingenieros colegiados cuentan con amplia experiencia en geodesia, cartografía, obras civiles, topografía superficial y topografía minera, y Calibración. Mantenimiento y Reparación de Equipos Topográficos de Todas las Marcas asegurando a nuestros clientes todos sus conocimientos y esmerado trabajo en equipo con el objetivo de hacer realidad sus proyectos.
              </p>
            </div>
          </div>
        </div>
      </section>

      {* Vision & Mission Section with Image Cards *}
      <section class="vision-mission">
        <div class="container">
           
          <h2 class="section-title">Nuestra Visión y Misión</h2>
          
          <div class="vm-wrapper">
            {* Vision/Mission Boxes *}
            <div class="vm-container">
              <div class="vm-box">
                <h3>VISIÓN</h3>
                <p>
                  Ser la empresa líder y de vanguardia en el Ámbito del Servicio Técnico. Calibración, Mantenimiento, Reparación y Venta de Equipos de Topografía.
                </p>
              </div>
              <div class="vm-box">
                <h3>MISIÓN</h3>
                <p>
                  Brindar un servicio de calidad excepcional respaldado por la exactitud y la confiabilidad de nuestros resultados.
                </p>
              </div>
            </div>

            
          </div>
        </div>
      </section>

      {* Team Section with Image *}
      <section class="team-section">
        <div class="container">
          <h2 class="section-title">NUESTRO PERSONAL</h2>
          <div class="team-content">
            <div class="team-image-container">
              <img src="{$urls.base_url}img/cms/NOSOTROS_01.jpg" alt="Equipo GEOTOP" loading="lazy">
            </div>
            <div class="team-description">
              <p>
                Nuestro equipo de ingenieros profesionales está comprometido con la excelencia en cada proyecto, brindando soluciones técnicas precisas y confiables.
              </p>
            </div>
          </div>
        </div>
      </section>

      {* Services Section *}
      <section class="services-grid">
        <div class="container">
          <h2 class="section-title">CALIBRACIÓN – REPARACIÓN DE INSTRUMENTOS TOPOGRÁFICOS DE TODAS LAS MARCAS</h2>
          <div class="services-list">
            <div class="service-item">Niveles Ópticos</div>
            <div class="service-item">Niveles Láser digital</div>
            <div class="service-item">Teodolitos</div>
            <div class="service-item">Estación total</div>
            <div class="service-item">GPS</div>
            <div class="service-item">Reglas y Carros de Vía</div>
            <div class="service-item">Inspeción de Vías RLM</div>
            <div class="service-item">Aviso de cje Hz (limpieza y engrase de Artilería y mecánica)</div>
            <div class="service-item">Revisión general</div>
            <div class="service-item">Calibración de Equipos Topográficos</div>
          </div>
        </div>
      </section>

    </div>
  {elseif isset($cms) && $cms.id == 8}
    {* Custom redesigned Services page *}
    <div class="services-modern">
      
      {* Hero Section *}
      <section class="services-hero">
        <div class="container">
          <h1>Nuestros Servicios</h1>
          <p class="hero-tagline">Soluciones Profesionales en Topografía</p>
          <p class="hero-text">
            Ofrecemos servicios especializados de calibración, mantenimiento y reparación para equipos topográficos de todas las marcas, con los más altos estándares de calidad.
          </p>
        </div>
      </section>

      {* Service Categories Section *}
      <section class="services-grid-section">
        <div class="container">
          <h2 class="section-title-services">Nuestros Servicios Especializados</h2>
          
          <div class="service-categories">
            {* Calibración y Reparación *}
            <div class="service-category">
              <div class="service-category-header">
                <h3>Calibración y Reparación</h3>
              </div>
              <div class="service-category-content">
                <ul class="service-category-list">
                  <li>Niveles Ópticos</li>
                  <li>Niveles Láser Digital</li>
                  <li>Teodolitos</li>
                  <li>Estación Total</li>
                  <li>GPS / GNSS</li>
                  <li>Calibración Certificada</li>
                </ul>
              </div>
            </div>

            {* Mantenimiento *}
            <div class="service-category">
              <div class="service-category-header">
                <h3>Mantenimiento Preventivo</h3>
              </div>
              <div class="service-category-content">
                <ul class="service-category-list">
                  <li>Limpieza y Engrase</li>
                  <li>Ajuste de Ejes</li>
                  <li>Revisión General</li>
                  <li>Inspección de Componentes</li>
                  <li>Actualización de Software</li>
                  <li>Verificación de Precisión</li>
                </ul>
              </div>
            </div>

            {* Servicios Especiales *}
            <div class="service-category">
              <div class="service-category-header">
                <h3>Servicios Especiales</h3>
              </div>
              <div class="service-category-content">
                <ul class="service-category-list">
                  <li>Reglas y Carros de Vía</li>
                  <li>Inspección de Vías RLM</li>
                  <li>Venta de Equipos</li>
                  <li>Asesoría Técnica</li>
                  <li>Capacitación</li>
                  <li>Soporte en Campo</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>

      {* Image Gallery Section *}
      <section class="services-gallery">
        <div class="container">
          <h2 class="section-title-services">Nuestros Proyectos</h2>
          
          <div class="gallery-grid">

            <div class="gallery-item">
              <img src="{$urls.base_url}img/cms/SUBTERRANEA_01.jpg" alt="Minería Subterránea" loading="lazy">
              <div class="gallery-item-overlay">
                <h3 class="gallery-item-title">Minería Subterránea</h3>
                <p class="gallery-item-description">Servicios especializados de topografía para operaciones mineras subterráneas.</p>
              </div>
            </div>

            <div class="gallery-item">
              <img src="{$urls.base_url}img/cms/OBRAS_CIVILES_4.jpg" alt="Obras Civiles" loading="lazy">
              <div class="gallery-item-overlay">
                <h3 class="gallery-item-title">Obras Civiles</h3>
                <p class="gallery-item-description">Levantamientos y replanteos para proyectos de construcción e infraestructura.</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {* CTA Section *}
      <section class="services-cta">
        <div class="container">
          <h2>¿Necesita Nuestros Servicios?</h2>
          <p>Contáctenos para obtener una cotización personalizada y asesoría profesional para su proyecto.</p>
          <a href="{$urls.pages.contact}" class="cta-button">Contactar Ahora</a>
        </div>
      </section>

    </div>
  {elseif isset($cms) && $cms.id == 6}
    {* Custom redesigned Technical Support page *}
    <div class="support-modern">
      
      {* Hero Section *}
      <section class="support-hero">
        <div class="container">
          <h1>Soporte Técnico</h1>
          <p class="hero-subtitle">Expertos en Mantenimiento y Calibración</p>
          <p class="hero-description">
            Brindamos soporte técnico especializado para equipos topográficos con técnicos certificados y equipamiento de última generación.
          </p>
        </div>
      </section>


{* Image Showcase Section *}
      <section class="support-showcase">
        <div class="container">
          <h2 class="section-title-support">Nuestro Trabajo</h2>
          
         <div class="showcase-grid">
            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/COMPLETO_LA OTRA IMAGEN_6.jpg" alt="Soporte Técnico Completo" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Servicio Completo</h3>
                <p class="showcase-text">Atención integral desde el diagnóstico hasta la entrega final del equipo calibrado.</p>
              </div>
            </div>

            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/reparacion_et2.jpg" alt="Equipamiento Profesional" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Equipamiento de Punta</h3>
                <p class="showcase-text">Contamos con tecnología de última generación para servicios de calibración de precisión.</p>
              </div>
            </div>
            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/servicio1.jpg" alt="Equipamiento Profesional" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Calibración y Reparación</h3>
                <p class="showcase-text">Contamos con profesionales altamente calificados para realizar calibraciones y reparaciones.</p>
              </div>
            </div>

            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/SOPORTE TEC_03.jpg" alt="Equipo Técnico" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Técnicos Especializados</h3>
                <p class="showcase-text">Nuestro equipo está certificado por los principales fabricantes de equipos topográficos.</p>
              </div>
            </div>
            
            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/reparacion_et3.jpg" alt="Reparación de Estaciones Totales" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Reparación Especializada</h3>
                <p class="showcase-text">Diagnóstico y reparación profunda de estaciones totales, recuperando la precisión angular y de distancia original.</p>
              </div>
            </div>

            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/calibracion_et1.jpg" alt="Laboratorio de Calibración" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Certificación y Calibración</h3>
                <p class="showcase-text">Ajuste técnico bajo normativa para niveles, teodolitos y GPS, garantizando la fiabilidad de sus mediciones.</p>
              </div>
            </div>

            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/reparacion_dron.jpg" alt="Mantenimiento de Drones" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Soporte para Drones</h3>
                <p class="showcase-text">Mantenimiento preventivo y configuración de sistemas UAV para levantamientos fotogramétricos de alto rendimiento.</p>
              </div>
            </div>

            <div class="showcase-item">
              <img src="{$urls.base_url}img/cms/nuevo/capacitacion1.jpg" alt="Capacitación y Asesoría" loading="lazy">
              <div class="showcase-overlay">
                <h3 class="showcase-title">Capacitación Técnica</h3>
                <p class="showcase-text">Asesoría experta y entrenamiento en el manejo de software y hardware topográfico de última generación.</p>
              </div>
            </div>
            
        </div>


            
            
            
        </div>
      </section>

      {* Features Section *}
      <section class="support-features">
        <div class="container">
          <h2 class="section-title-support">Nuestras Especialidades</h2>
          
          <div class="features-grid">
            <div class="feature-card">
              <div class="feature-icon">🔧</div>
              <h3>Mantenimiento Preventivo</h3>
              <p>Programas de mantenimiento preventivo para prolongar la vida útil de sus equipos y garantizar su precisión.</p>
            </div>

            <div class="feature-card">
              <div class="feature-icon">⚙️</div>
              <h3>Calibración Certificada</h3>
              <p>Calibración con certificados de trazabilidad internacional siguiendo normas ISO y estándares del fabricante.</p>
            </div>

            <div class="feature-card">
              <div class="feature-icon">🛠️</div>
              <h3>Reparación Experta</h3>
              <p>Diagnóstico y reparación de equipos topográficos de todas las marcas con repuestos originales.</p>
            </div>

            <div class="feature-card">
              <div class="feature-icon">📊</div>
              <h3>Diagnóstico Técnico</h3>
              <p>Evaluación completa del estado de sus equipos con informes técnicos detallados y recomendaciones.</p>
            </div>

            <div class="feature-card">
              <div class="feature-icon">⚡</div>
              <h3>Servicio Rápido</h3>
              <p>Tiempos de respuesta optimizados para minimizar el tiempo de inactividad de sus proyectos.</p>
            </div>

            <div class="feature-card">
              <div class="feature-icon">✓</div>
              <h3>Garantía de Calidad</h3>
              <p>Todos nuestros servicios incluyen garantía y seguimiento post-servicio para asegurar su satisfacción.</p>
            </div>
          </div>
        </div>
      </section>

      

      {* CTA Section *}
      <section class="support-cta">
        <div class="container">
          <h2>¿Necesita Soporte Técnico?</h2>
          <p>Solicite una cotización o agende una visita técnica. Estamos listos para ayudarle.</p>
          <div class="cta-buttons">
            <a href="{$urls.pages.contact}" class="cta-btn cta-btn-primary">Solicitar Servicio</a>
            <a href="tel:+51999999999" class="cta-btn cta-btn-secondary">Llamar Ahora</a>
          </div>
        </div>
      </section>

    </div>
  {else}
    {* Original CMS content for other pages *}
    <section id="content" class="page-content page-cms page-cms-{$cms.id}">
      {block name='cms_content'}
        {$cms.content nofilter}
      {/block}

      {block name='hook_cms_dispute_information'}
        {hook h='displayCMSDisputeInformation'}
      {/block}

      {block name='hook_cms_print_button'}
        {hook h='displayCMSPrintButton'}
      {/block}
    </section>
  {/if}
{/block}
