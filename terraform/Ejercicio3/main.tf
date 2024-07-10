
resource "aws_s3_bucket" "demo3" {
    bucket = var.nombre_s3
    tags = local.common_tags
}