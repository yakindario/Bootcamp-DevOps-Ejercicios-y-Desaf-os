/*
  Este archivo de configuración de Terraform define los recursos locales y proveedores necesarios para el ejercicio 1.
  Los recursos locales incluyen archivos de ejemplo que se crean en función de las variables proporcionadas.
  El proveedor local se utiliza para interactuar con el sistema de archivos local.
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "local" {

}

resource "local_file" "ejemplo" {
  filename = "{var.archivo_name}.txt"
  content  = var.contenido
}

resource "local_file" "ejemplo_lista" {
  for_each = toset(var.archivos_listas)
  filename = each.value
  content  = var.contenido
}

resource "local_file" "ejemplo_condicional" {
  count    = var.crear_archivo ? 1 : 0
  filename = "archivo_condicional.txt"
  content  = var.contenido
}