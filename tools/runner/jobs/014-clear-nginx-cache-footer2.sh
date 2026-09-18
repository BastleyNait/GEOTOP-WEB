#!/bin/bash
# nginx (delante de Apache/PHP en este hosting) cachea la respuesta
# HTML completa; por eso los cambios de plantilla a veces no se ven
# aunque el archivo y la caché de Smarty ya estén al día.
set -euo pipefail
uapi --output=jsonpretty NginxCaching clear_cache
