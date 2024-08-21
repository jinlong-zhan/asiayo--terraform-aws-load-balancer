resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              echo "Hello $(hostname)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer${count.index}"
  }
}

output "instance_ids" {
  value = aws_instance.web[*].id
}

