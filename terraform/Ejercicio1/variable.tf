# Definición de variables para el archivo
variable "archivo_name" {
    type    = string
    default = "archivo"
}

# Contenido del archivo
variable "contenido" {
    type    = string
    default = "Hola Mundo"
}

# Lista de archivos
variable "archivos_listas" {
    type    = list(string)
    default = ["archivo1.txt", "archivo2.txt", "archivo3.txt"]
}

# Indicador para crear el archivo
variable "crear_archivo" {
    type    = bool
    default = true
}