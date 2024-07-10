provider "local" {}

resource "local_file" "crear_file_local" {
    for_each = { for idx, file in var.archivo_assets : idx => file }
  filename = each.value.name
  content  = each.value.content
}

resource "local_file" "crear_file_pages" {
    for_each = { for idx, file in var.archivo_pages : idx => file }
  filename = each.value.name
  content  = each.value.content
  
}