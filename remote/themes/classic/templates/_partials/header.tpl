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

  {hook h='displayNavFullWidth'}
{/block}