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
 * versions in the future. If you wish to customize PrestaShop for your\
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
    <style>
    /* ========== REDISEÑO MODERNO - 4 COLUMNAS EXACTAS ========== */
    
    /* FORZAR 4 COLUMNAS - NO MÁS, NO MENOS */
    @media (min-width: 992px) {
        .product-miniature, .js-product-miniature, .products article {
            flex: 0 0 25% !important;
            max-width: 25% !important;
            width: 25% !important;
        }
    }
    
    .products.row {
        margin: 0 -15px !important;
        display: flex !important;
        flex-wrap: wrap !important;
    }
    
    .product-miniature {
        padding: 15px !important;
    }
    
    /* SIDEBAR MODERNO */
    #left-column {
        background: linear-gradient(180deg, #ffffff 0%, #ffffffff 100%) !important;
        border-right: 2px solid #F39C12 !important;
        padding: 25px 10px !important;
    }
    
    #left-column h4, #left-column .h3, #left-column .block-categories h3 {
        color: #1a1a1a !important;
        font-weight: 800 !important;
        font-size: 16px !important;
        text-transform: uppercase !important;
        letter-spacing: 0.5px !important;
        margin-bottom: 20px !important;
        padding-bottom: 10px !important;
        border-bottom: 3px solid #F39C12 !important;
    }
    
    #left-column a {
        color: #444 !important;
        font-weight: 500 !important;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
        display: block !important;
        padding: 8px 10px !important;
        border-radius: 8px !important;
        margin-bottom: 5px !important;
    }
    
    #left-column a:hover {
        color: #F39C12 !important;
        background: rgba(243, 156, 18, 0.08) !important;
        transform: translateX(5px) !important;
        padding-left: 15px !important;
    }
    
    /* CONTENIDO PRINCIPAL */
    #content {
        background: #f9fafb !important;
        padding: 40px !important;
    }
    
    /* TARJETAS DE PRODUCTO - DISEÑO PREMIUM */
    .product-miniature article,
    .product-miniature .js-product-miniature {
        background: #ffffff !important;
        border-radius: 20px !important;
        overflow: hidden !important;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06) !important;
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) !important;
        border: 2px solid #f0f0f0 !important;
        position: relative !important;
    }
    
    .product-miniature article:hover,
    .product-miniature:hover .js-product-miniature {
        transform: translateY(-10px) scale(1.02) !important;
        box-shadow: 0 20px 40px rgba(243, 156, 18, 0.2) !important;
        border-color: #F39C12 !important;
    }
    
    /* Contenedor de imagen */
    .product-miniature .thumbnail-container {
        background: #ffffff !important;
        padding: 25px !important;
        position: relative !important;
        overflow: hidden !important;
    }
    
    .product-miniature .thumbnail-container img {
        transition: transform 0.4s ease !important;
    }
    
    .product-miniature:hover .thumbnail-container img {
        transform: scale(1.1) !important;
    }
    
    /* Texto del producto */
    .product-miniature .product-description {
        padding: 15px 20px 20px !important;
    }
    
    .product-miniature .product-title {
        margin-bottom: 10px !important;
    }
    
    .product-miniature .product-title a {
        color: #1a1a1a !important;
        font-weight: 600 !important;
        font-size: 15px !important;
        line-height: 1.4 !important;
        transition: color 0.3s ease !important;
    }
    
    .product-miniature .product-title a:hover {
        color: #F39C12 !important;
    }
    
    /* PRECIO - MUY DESTACADO */
    .product-miniature .price {
        color: #F39C12 !important;
        font-weight: 800 !important;
        font-size: 22px !important;
        display: inline-block !important;
        padding: 8px 16px !important;
        background: linear-gradient(135deg, rgba(243, 156, 18, 0.1) 0%, rgba(243, 156, 18, 0.05) 100%) !important;
        border-radius: 12px !important;
        margin-top: 10px !important;
    }
    
    /* Botones de acción */
    .product-miniature .quick-view {
        background: #F39C12 !important;
        color: white !important;
        padding: 10px 20px !important;
        border-radius: 10px !important;
        font-weight: 600 !important;
        transition: all 0.3s ease !important;
    }
    
    .product-miniature .quick-view:hover {
        background: #e08d0b !important;
        transform: scale(1.05) !important;
    }
    
    /* TÍTULO DE CATEGORÍA */
    .block-category {
        background: linear-gradient(135deg, #ffffff 0%, #fff5e6 100%) !important;
        border-radius: 20px !important;
        padding: 30px 40px !important;
        margin-bottom: 40px !important;
        border-left: 6px solid #F39C12 !important;
    }
    
    .category-title-main {
        font-size: 2.5rem !important;
        font-weight: 900 !important;
        margin-bottom: 15px !important;
    }
    
    /* Animaciones suaves */
    * {
        transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1) !important;
    }
    
    /* Responsive - mantener 4 columnas hasta tablet */
    @media (max-width: 991px) {
        .product-miniature { flex: 0 0 33.333% !important; max-width: 33.333% !important; }
    }
    
    @media (max-width: 767px) {
        .product-miniature { flex: 0 0 50% !important; max-width: 50% !important; }
        #content { padding: 20px !important; }
    }
    </style>
    
    {* --- HERO BANNER CATEGORÍA REDISEÑADO (ESTÁTICO SIN BLUR) --- *}
    <div class="category-hero-wrapper">
        <div class="category-hero-banner">
            <div class="hero-bg-image" style="background-image: url('{$urls.img_url}home/banner.png');"></div>
            {* Overlay eliminado o muy sutil si se desea *}
            <div class="hero-content">
                <h1 class="category-hero-title">{$category.name}</h1>
            </div>
        </div>
    </div>

    <style>
    /* ESTILOS HERO BANNER */
    .category-hero-wrapper {
        width: 100% !important; /* Ajustado a 100% del contenedor padre */
        margin-bottom: 30px !important;
        overflow: hidden !important;
        border-radius: 0 0 20px 20px !important; /* Bordes redondeados abajo opcionales */
    }

    .category-hero-banner {
        width: 100% !important;
        height: 350px !important; /* Altura ajustada */
        position: relative !important;
        display: flex !important;
        align-items: flex-end !important; /* Alineado abajo */
        justify-content: flex-start !important; /* Alineado izquierda */
        overflow: hidden !important;
    }

    /* Imagen de fondo SIN Blur */
    .hero-bg-image {
        position: absolute !important;
        top: 0 !important;
        left: 0 !important;
        width: 100% !important;
        height: 100% !important;
        background-size: cover !important;
        background-position: center center !important;
        background-repeat: no-repeat !important;
        z-index: 0 !important;
    }

    .hero-content {
        position: relative !important;
        z-index: 2 !important;
        text-align: left !important;
        width: auto !important;
        padding: 0 !important;
        margin-left: 40px !important;
        margin-bottom: 40px !important;
    }

    .category-hero-title {
        color: #ffffff !important;
        font-size: 3rem !important;
        font-weight: 800 !important;
        text-transform: uppercase !important;
        letter-spacing: 2px !important;
        margin: 0 !important;
        font-family: 'Montserrat', sans-serif !important;
        
        /* Efecto fondo sombra al texto */
        background-color: rgba(0, 0, 0, 0.6) !important;
        padding: 10px 25px !important;
        display: inline-block !important; /* Para que el fondo se ajuste al texto */
        box-shadow: 0 4px 15px rgba(0,0,0,0.3) !important;
        border-left: 5px solid #F39C12 !important; /* Detalle de diseño */
    }

    /* RESPONSIVE */
    @media (max-width: 991px) {
        .category-hero-banner {
            height: 280px !important;
        }
        .category-hero-title {
            font-size: 2.2rem !important;
        }
        .hero-content {
            margin-left: 20px !important;
            margin-bottom: 30px !important;
        }
    }

    @media (max-width: 576px) {
        .category-hero-banner {
            height: 200px !important;
        }
        .category-hero-title {
            font-size: 1.5rem !important;
            padding: 8px 15px !important;
        }
        .hero-content {
            margin-left: 15px !important;
            margin-bottom: 20px !important;
        }
    }
    </style>
    
    <div id="subcategories">
<p class="subcategory-heading">{l s='Subcategories'}</p>
<ul class="clearfix">
{foreach from=$subcategories item=subcategory}
<li>
<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
<img class="replace-2x" src="{$urls.base_url}img/c/{$subcategory.id_category}.jpg" alt="{$subcategory.name|escape:'html':'UTF-8'}" />
</a>
<h5><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></h5>
</li>
{/foreach}
</ul>
</div>
{/block}
