## Ejercicio de Terraform - Estructura de Proyecto

### Descripción del Proyecto

Imagina que estás trabajando en el desarrollo de un sitio web estático y necesitas definir la estructura de directorios y algunos archivos locales para organizar tu proyecto. Utiliza Terraform para gestionar esta estructura.

### Requerimientos

1. **Estructura de Directorios:**
   - Crea un recurso local que represente el directorio principal del proyecto con el nombre "mi_sitio_web".
   - Dentro de este directorio, crea dos subdirectorios: "assets" y "pages".

2. **Directorio "assets":**
   - Crea un recurso local que represente el directorio "assets".
   - Dentro de "assets", crea dos subdirectorios: "css" y "js".

3. **Directorio "pages":**
   - Crea un recurso local que represente el directorio "pages".
   - Dentro de "pages", crea dos archivos HTML: "index.html" y "about.html".
   - Define un contenido básico para cada archivo HTML.

### Restricciones

- Utiliza recursos locales para definir la estructura del proyecto.
- Personaliza los nombres de los directorios y archivos según las indicaciones.
- Asegúrate de que la estructura final refleje la organización mencionada en la descripción del proyecto.

### Instrucciones

1. Crea un archivo `main.tf` con la configuración de Terraform.
2. Ejecuta `terraform init y plan` para inicializar el directorio de trabajo.
3. Ejecuta `terraform apply` para aplicar la configuración y crear la estructura del proyecto.
4. Verifica que la estructura de directorios y archivos se haya creado correctamente.
5. Documenta tu código y el propósito de cada recurso local utilizado.

---

