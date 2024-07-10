terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "archivo_assets" {
  type = list(object({
    name    = string
    content = string
    create  = bool
  }))
  default = [
    {
      name    = "mi_sitio_web/assets/css/styles.css"
      content = "Hola Mundo"
      create  = true
    },
    {
      name    = "mi_sitio_web/assets/js/scripts.js"
      content = "Hola Mundo"
      create  = true
    }
  ]
}

variable "archivo_pages" {
  type = list(object({
    name    = string
    content = string
    create  = bool
  }))
  default = [
    {
      name    = "mi_sitio_web/pages/index.html"
      content = <<-EOT
        <html>
          <head>
            <title>Página de inicio</title>
          </head>
          <body>
            <h1>Hola Mundo desde la página de inicio</h1>
          </body>
        </html>
      EOT
      create  = true
    },
    {
      name    = "mi_sitio_web/pages/about.html"
      content = <<-EOT
        <html>
          <head>
            <title>Acerca de</title>
          </head>
          <body>
            <h1>Hola Mundo desde la página Acerca de</h1>
          </body>
        </html>
      EOT
      create  = true
    }
  ]
}