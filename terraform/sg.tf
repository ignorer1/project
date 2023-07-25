resource "aws_security_group" "allow_tls" {
    name        = "allow-jenkins"
    description = "Allow Jenkins inbound traffic"
    vpc_id      = "vpc-01617a8f54d26dc10"
    ingress {
        description = "TLS from VPC"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "TLS from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "TLS from VPC"
        from_port   = 30000
        to_port     = 30000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}

