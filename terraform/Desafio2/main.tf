

# Creación de subdirectorio "herramientas"
resource "local_file" "herramientas" {
    filename = "${var.nombre_entorno}/herramientas/texto.txt"
    content  = ""
}


# Creación de subdirectorio "configuracion"
resource "local_file" "configuracion" {
    filename = "${var.nombre_entorno}/configuracion/texto.txt"
    content  = ""
}

# Creación de directorios y subdirectorios de proyectos
resource "local_file" "proyecto_1" {
    filename = "${var.nombre_entorno}/proyectos/proyecto_1/texto.txt"
    content  = ""
}

resource "local_file" "proyecto_2" {
    filename = "${var.nombre_entorno}/proyectos/proyecto_2/texto.txt"
    content  = ""
}

resource "local_file" "proyecto_3" {
    filename = "${var.nombre_entorno}/proyectos/proyecto_3/texto.txt"
    content  = ""
}

# Variable de entorno
resource "null_resource" "configuracion_variables" {
    provisioner "local-exec" {
        command = "echo 'export MI_ENTORNO=${var.nombre_entorno}' >> ~/.bashrc; echo export VERSION_TF=\"1.0\" >> ~/.bashrc"
    }
}