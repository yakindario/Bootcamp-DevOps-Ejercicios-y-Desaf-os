resource "aws_default_vpc" "default" {
    # cidr_block = "10.0.0.0/16"
# 
  tags = {
    name = "Default VPC"
  }
    
  }

resource "aws_default_subnet" "az_a" {
    availability_zone = "us-east-1a"
    # vpc_id     = aws_default_vpc.default.id
    # cidr_block = "10.0.10.0/16"
    }


resource "aws_security_group" "grupo_seguridad" {
    name = "grupo_seguridad"
    description = "Permiso conexion http"
    vpc_id = aws_default_vpc.default.id

    ingress {
        description = "Allow HTTP inbound traffic"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_key_pair" "key" {
    key_name = "123"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMtgEH8l2EuwdE63Fum6lj8PX4nNn95+hw7XCZGG7/d yakin.oh@gmail.com"
}
resource "aws_ami" "ubuntu" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  imds_support        = "v2.0" # Enforce usage of IMDSv2. You can safely remove this line if your application explicitly doesn't support it.
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "snap-xxxxxxxx"
    volume_size = 8
  }
}


resource "aws_instance" "web" {
  ami           = aws_ami.ubuntu.id
  instance_type = var.tipo_instancia
  key_name      = aws_key_pair.key.key_name
  subnet_id     = aws_default_subnet.az_a.id
  user_data     = file("install.sh")
  tags          = local.common_tags
}

