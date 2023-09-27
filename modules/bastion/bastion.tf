resource "aws_instance" "bastion" {

  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnets_id[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = "key"
  tags                        = { Name = "bastion" }

  provisioner "local-exec" {
    command = "echo 'bastion_public_ip is' ${self.public_ip} >> ./all-ips.txt"
  }

}
