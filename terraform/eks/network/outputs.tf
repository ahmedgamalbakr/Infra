output vpc_cidr {
  value       = aws_vpc.main.id
  
}



output public_subnet_id_1 {
  value       = aws_subnet.public_1.id
 
}

output private_subnet_id_1 {
  value       = aws_subnet.private_1.id
 
}


output private_subnet_id_2 {
  value       = aws_subnet.private_2.id
 
}