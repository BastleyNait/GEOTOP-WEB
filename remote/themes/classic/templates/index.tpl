{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
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

    {block name='page_content_container'}
      <section id="content" class="page-home">

        {block name='page_content_top'}
          {* Contenido exclusivo de la portada (antes vivía, por error, en header.tpl) *}

          {* 1. HERO con carrusel de imágenes de fondo *}
          <div class="modern-hero-wrapper">
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
          </div>

          {* 2. Servicios *}
          <section class="services-section">
            <div class="container-fluid home-section-inner">

              <div class="row mb-3">
                <div class="col-12 text-center section-header-pro">
                  <h2 class="title-pro">NUESTROS <span>SERVICIOS</span></h2>
                  <div class="separator-pro"></div>
                  <p class="subtitle-pro">Servicios especializados de topografía y geodesia con equipos de alta precisión para garantizar el éxito de sus proyectos</p>
                </div>
              </div>

              <div class="row d-flex align-items-stretch">

                <div class="col-md-6 col-lg-3 mb-3 d-flex">
                  <div class="service-card-pro w-100">
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

                <div class="col-md-6 col-lg-3 mb-3 d-flex">
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

                <div class="col-md-6 col-lg-3 mb-3 d-flex">
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

                <div class="col-md-6 col-lg-3 mb-3 d-flex">
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

              <div class="row mt-3">
                <div class="col-12 text-center">
                  <a href="{$link->getPageLink('contact')}" class="btn-cotizar-pro">COTIZAR PROYECTO</a>
                </div>
              </div>

            </div>
          </section>
        {/block}

        {block name='page_content'}
          {block name='hook_home'}
            {$HOOK_HOME nofilter}
          {/block}
        {/block}
      </section>
    {/block}
