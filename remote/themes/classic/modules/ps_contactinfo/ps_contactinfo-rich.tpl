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

<div class="contact-rich-pro">
  <h4 class="contact-heading">{l s='Store information' d='Shop.Theme.Global'}</h4>
  
  <div class="contact-block">
    <div class="contact-icon"><i class="material-icons">location_on</i></div>
    <div class="contact-details">
        <strong>Geotop AQP</strong><br>
        {$contact_infos.address.formatted nofilter}
    </div>
  </div>

  {if $contact_infos.phone}
    <div class="contact-separator"></div>
    <div class="contact-block">
      <div class="contact-icon"><i class="material-icons">phone</i></div>
      <div class="contact-details">
        <span class="label">{l s='Call us:' d='Shop.Theme.Global'}</span>
        <a href="tel:{$contact_infos.phone}" class="contact-link">{$contact_infos.phone}</a>
       </div>
    </div>
  {/if}

  {if $contact_infos.fax}
    <div class="contact-separator"></div>
    <div class="contact-block">
      <div class="contact-icon"><i class="material-icons">print</i></div>
      <div class="contact-details">
        <span class="label">{l s='Fax:' d='Shop.Theme.Global'}</span>
        <span>{$contact_infos.fax}</span>
      </div>
    </div>
  {/if}

  {if $contact_infos.email}
    <div class="contact-separator"></div>
    <div class="contact-block">
      <div class="contact-icon"><i class="material-icons">email</i></div>
      <div class="contact-details">
        <span class="label">{l s='Email us:' d='Shop.Theme.Global'}</span>
        <a href="mailto:{$contact_infos.email}" class="contact-link email-link">{$contact_infos.email}</a>
       </div>
    </div>
  {/if}

  {* MAPA EMBEBIDO *}
  <div class="contact-map-wrapper mt-4">
      <div style="width: 100%; height: 200px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1); border: 1px solid #f1f1f1;">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3827.2!2d-71.5088889!3d-16.4152778!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91424a5f6a8b1c23%3A0x8b1c23456789abcd!2sBrasil%20305%2C%20Paucarpata%2C%20Arequipa%2C%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1735737600000!5m2!1ses!2spe"
          width="100%"
          height="100%"
          style="border: 0;"
          allowfullscreen
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
  </div>
</div>
