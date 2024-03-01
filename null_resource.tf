resource "null_resource" "provisioner" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    always_run = timestamp()
  }

  depends_on = [aws_instance.bastion]

#  connection {
#    host        = "aws_instance.bastion.public_ip"
#    type        = "ssh"
#    user        = "ec2-user"
#    private_key = file("${path.module}/../Downloads/terraform-key.pem")

#  }

#  provisioner "local-exec" {
#    command = "scp -o StrictHostKeyChecking=no -i ~/Downloads/terraform-key.pem ~/Downloads/terraform-key.pem ec2-user@${aws_instance.bastion.public_ip}:~"
#  }

#  provisioner "remote-exec" {
#    inline = [
#      "chmod 400 terraform-key.pem"
#    ]
#  }
}