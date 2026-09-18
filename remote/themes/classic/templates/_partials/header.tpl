{**
 * HEADER GEOTOP
 * Estructura y estilos en assets/css/header.css (cargado en head.tpl).
 *}

{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container-fluid px-md-5">
      <div class="row align-items-center">
        {* Botón hamburguesa: solo mobile. El clic lo maneja theme.js
           (busca #menu-icon), no hace falta JS propio.
           Este theme.css es de un Bootstrap 4 viejo: no trae .col ni
           .col-auto (sin sufijo de tamaño), hay que darle tamaño a
           cada columna en cada punto de quiebre. *}
        <div class="col-xs-2 d-md-none">
          <div id="menu-icon">
            <i class="material-icons">menu</i>
          </div>
        </div>

        {* Selector de idioma/moneda, iniciar sesión, carrito *}
        <div class="col-xs-10 col-md-12 d-flex justify-content-end">
          {hook h='displayNav2'}
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top bg-white">
    <div class="container-fluid px-md-5">
      <div class="row align-items-center">
        <div class="col-xs-6 col-md-2" id="_desktop_logo">
          <a href="{$urls.base_url}">
            <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
          </a>
        </div>

        <div class="col-md-8 d-none d-md-flex justify-content-center position-static">
          {hook h='displayTop'}
        </div>

        <div class="col-xs-6 col-md-2 d-flex flex-column align-items-end">
          <div class="search-widget-wrapper d-none d-md-block">
            {hook h='displaySearch'}
          </div>
          <a href="https://www.lo-exacto.com/buscar-certificados" target="_blank" class="btn-certificate" title="Buscar certificados">
            <i class="material-icons">verified_user</i>
            <span class="d-none d-xl-inline">BUSCAR CERTIFICADOS</span>
          </a>
        </div>
      </div>

      <div id="mobile_top_menu_wrapper" class="row d-md-none" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div class="search-widget-wrapper">
            {hook h='displaySearch'}
          </div>
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
    </div>
  </div>

  {hook h='displayNavFullWidth'}
{/block}
