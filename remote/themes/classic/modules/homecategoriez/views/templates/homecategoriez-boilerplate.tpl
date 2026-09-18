{**
 * Override de tema para el módulo homecategoriez.
 * Reemplaza la plantilla original del módulo (lista sin estilo, imágenes
 * forzadas a 175x400 que las deformaba) por el mismo diseño de tarjeta
 * "geo-card-mini" ya usado en el resto del sitio.
 * Ubicado aquí para no perder el cambio si el módulo se actualiza.
 *}
<!-- MODULE homecategoriez -->
{if $categories}
  <section class="home-categories">
    <div class="container-fluid px-5">
      <div class="row mb-5">
        <div class="col-12 text-center section-header-pro">
          <h2 class="title-pro">CATÁLOGO <span>GENERAL</span></h2>
          <div class="separator-pro"></div>
          <p class="subtitle-pro">Explora nuestra gama completa de tecnología de precisión</p>
        </div>
      </div>

      <div class="row g-4">
        {foreach from=$categories item=category}
          {include file='_partials/category-card-item.tpl'
            id=$category->id_category
            img=$link->getCatImageLink($category->link_rewrite, $category->id_category, $pic_size_type)
            name=$category->name|escape:'html':'UTF-8'}
        {/foreach}
      </div>
    </div>
  </section>
{/if}
<!-- /MODULE homecategoriez -->
