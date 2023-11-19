resource "aws_instance" "demo" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group1]
}
resource "nul_resource" "null" {
  

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("week12.pem")
    host        = aws_instance.demo.public_dns
  }
  provisioner "local-exec" {
    command = "echo Hello"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "mkdir Kouadio",
      "pwd",
      "nproc"
    ]

  }
  provisioner "file" {
    source      = "week12.pem"
    destination = "/tmp/week12.pem"
  }
}

resource "aws_iam_group" "group1" {
  name = "Devops"

}
