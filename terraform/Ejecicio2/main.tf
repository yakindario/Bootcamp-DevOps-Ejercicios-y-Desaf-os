terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "random" {

}
  
resource "random_string" "prefijo" {
count = 4
    length = 4
    special = false
    upper = false
    numeric = false
}

resource "local_file" "archivo" {
  count = 4
  content = "Lista de Archivo ${count.index}"
  filename = "archivo${count.index}.txt"
  
}