resource "aws_instance" "bastion" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = element([for each_subnet in aws_subnet.public_subnet : each_subnet.id], 0)

  tags = {
    Name = local.bastion_host
  }
  #provisioner "local-exec" {
  #  command = "scp -o StrictHostKeyChecking=no -i ~/Downloads/terraform-key.pem ~/Downloads/terraform-key.pem ec2-user@${aws_instance.bastion.public_ip}:~"
  #}
  vpc_security_group_ids = [aws_security_group.bastion_host.id]

}

resource "aws_security_group" "bastion_host" {
  name        = "allow_bastion_host"
  description = "Allow ssh into private subnet resources using this"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "allow ssh to bastion host from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_bastion_host_sg"
  }
}