resource "aws_instance" "app_servers" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name = aws_key_pair.generated_key.key_name
  
  tags = {
    Name = "${var.project_name}-AppServer-${count.index}"
  }
}

resource "aws_instance" "haproxy" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  vpc_security_group_ids = ["${aws_security_group.haproxy_sg.id}"]
  key_name               = aws_key_pair.generated_key.key_name
  
  tags = {
    Name = "${var.project_name}-HAProxy"
  }
}