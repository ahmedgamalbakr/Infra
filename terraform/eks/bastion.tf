data "aws_secretsmanager_secret" "user_accesskeys" {

  arn = "arn:aws:secretsmanager:eu-central-1:211642059984:secret:user-accesskeys-hn6JDp" 

}

data "aws_secretsmanager_secret_version" "secret_access" {
  secret_id = data.aws_secretsmanager_secret.user_accesskeys.id
}


resource "aws_instance" "bastion" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE 
  key_name      = aws_key_pair.tf-key.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id = module.network.public_subnet_id_1 

  user_data  = <<-EOF
                #!/bin/bash
                sudo mkdir /home/ubuntu/.aws/
                sudo touch /home/ubuntu/.aws/credentials
                echo "[default]" > /home/ubuntu/.aws/credentials
                echo "aws_access_key_id = ${jsondecode(data.aws_secretsmanager_secret_version.secret_access.secret_string)["aws_access_key_id"]}" >> /home/ubuntu/.aws/credentials
                echo "aws_secret_access_key = ${jsondecode(data.aws_secretsmanager_secret_version.secret_access.secret_string)["aws_secret_access_key"]}" >> /home/ubuntu/.aws/credentials
               EOF

  #   provisioner "local-exec" {
  #   command = "echo ${self.public_ip} > bastion_IP"
  # }

  
 
  tags = {
    Name = "bastionHost"
  }
}