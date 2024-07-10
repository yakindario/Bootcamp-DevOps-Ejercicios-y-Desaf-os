**Ejercicio de Terraform - Configuración de Entorno de Desarrollo**

### Descripción del Proyecto

En este ejercicio, utilizarás Terraform para definir y configurar recursos locales que simularán la configuración de un entorno de desarrollo. Esto incluirá la creación de directorios para proyectos, configuración de variables de entorno y la instalación de herramientas de desarrollo básicas.

### Requerimientos

1. **Estructura de Proyectos:**
   - Crea un recurso local que represente el directorio principal del entorno de desarrollo con el nombre "mi_entorno_desarrollo".
   - Dentro de este directorio, crea tres subdirectorios: "proyectos", "herramientas" y "configuracion".

2. **Directorio de Proyectos:**
   - Crea un recurso local que represente el directorio de proyectos.
   - Dentro de este directorio, crea tres subdirectorios de proyectos llamados "proyecto_1", "proyecto_2" y "proyecto_3".

3. **Configuración de Variables de Entorno:**
   - Crea un recurso local que represente la configuración de variables de entorno.
   - Define al menos dos variables de entorno, por ejemplo, "RUTA_PROYECTOS" y "VERSION_TF".

4. **Instalación de Herramientas de Desarrollo:**
   - Crea un recurso local que represente la instalación de dos herramientas de desarrollo básicas, como "git" y "terraform".

### Restricciones

- Utiliza recursos locales para definir la estructura y configuración del entorno de desarrollo.
- Personaliza los nombres de los directorios, subdirectorios, variables de entorno y herramientas de desarrollo según las indicaciones.
- Asegúrate de que la estructura final refleje la organización mencionada en la descripción del proyecto.

### Instrucciones

1. Crea un archivo `main.tf` con la configuración de Terraform.
2. Ejecuta `terraform init` para inicializar el directorio de trabajo.
3. Ejecuta `terraform apply` para aplicar la configuración y simular la configuración del entorno de desarrollo.
4. Verifica que la estructura de directorios, configuración de variables de entorno y la instalación de herramientas se haya realizado correctamente.
5. Documenta tu código y el propósito de cada recurso local utilizado.

---