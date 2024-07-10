terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


variable "nombre_entorno" {
  type = string
  default = "mi_entorno"
}

