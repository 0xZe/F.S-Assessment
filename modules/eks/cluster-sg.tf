resource "aws_security_group" "eks-cluster-sg" {
  name        = "public-sg"
  description = "Restrict SSH traffic from the Vpc & Allow HTTP and HTTPS from any where"
  vpc_id      = var.appvpc_id

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  } 

 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    description = "allow all outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
} 