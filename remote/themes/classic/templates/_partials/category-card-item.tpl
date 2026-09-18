{* Item de Categoría Adaptable *}
<div class="col-xs-6 col-md-4 col-lg-3"> {* col-lg-3 significa 12/3 = 4 columnas *}
    <a href="{$link->getCategoryLink($id)}" class="geo-card-mini">
        <div class="geo-bg" style="background-image: url('{$img}');"></div>
        <div class="geo-content"><h3>{$name}</h3></div>
    </a>
</div>