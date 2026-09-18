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
{foreach from=$stylesheets.external item=stylesheet}
  <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}">
{/foreach}
{foreach from=$stylesheets.inline item=stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}

{* Utilidades de Bootstrap 4 (.d-none, .d-md-flex, etc.) que el
   theme.css de este sitio no trae — ver utilities.css. *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/utilities.css?v=2" type="text/css" media="all">

{* Header / navbar (todas las páginas)
   ?v= se sube a mano cada vez que se edita header.css. *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/header.css?v=5" type="text/css" media="all">

{* Custom CSS for category header fix *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/category-header-fix.css" type="text/css" media="all">

{* Custom CSS for the homepage (hero, services, categories)
   ?v= se sube a mano cada vez que se edita home.css, para que el
   navegador no siga usando una copia vieja en caché. *}
{if isset($page.page_name) && $page.page_name == 'index'}
  <link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/home.css?v=3" type="text/css" media="all">
{/if}

{* Custom CSS for user info alignment fix *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/user-info-fix.css" type="text/css" media="all">

{* REDISEÑO PROFESIONAL COMPLETO DE CATEGORÍAS - 4 COLUMNAS *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/category-pro-redesign.css" type="text/css" media="all">

{* DISEÑO MÓVIL OPTIMIZADO
   ?v= a mano en cada edición, ver nota al inicio de este archivo. *}
<link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/mobile-category-fix.css?v=1" type="text/css" media="all">

{* Custom CSS for About Us page redesign (page ID 4) *}
{if isset($page.page_name) && $page.page_name == 'cms' && isset($cms) && $cms.id == 4}
  <link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/about-us-redesign.css" type="text/css" media="all">
{/if}

{* Custom CSS for Services page redesign (page ID 8) *}
{if isset($page.page_name) && $page.page_name == 'cms' && isset($cms) && $cms.id == 8}
  <link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/services-redesign.css" type="text/css" media="all">
{/if}

{* Custom CSS for Technical Support page redesign (page ID 6) *}
{if isset($page.page_name) && $page.page_name == 'cms' && isset($cms) && $cms.id == 6}
  <link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/support-redesign.css" type="text/css" media="all">
{/if}

{* Custom CSS for Contact page redesign *}
{if isset($page.page_name) && $page.page_name == 'contact'}
  <link rel="stylesheet" href="{$urls.base_url}themes/classic/assets/css/contact-redesign.css" type="text/css" media="all">
{/if}

