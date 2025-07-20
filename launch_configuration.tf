resource "aws_launch_template" "launch_template" {
  name_prefix   = "web-server-"
  image_id      = data.aws_ssm_parameter.instance_ami.value
  instance_type = "t3.micro"

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from Terraform" > /var/www/html/index.html
            EOF
  )

  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}