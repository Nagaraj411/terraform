resource "aws_route53_record" "www" {
  count   = length(var.instances)
  zone_id = var.zone_id                                        # zone_id given in variables it will check 
  name    = "${var.instances[count.index]}.${var.domain_name}" # it will mongodb.devops84.shop
  # variable 1 {var.instances[count.index]}   It will take the instances name like mongodb, catalogue
  # variable 2 {var.domain_name}  It will take the domain name & connect to instance like mongodb.devops84.shop & catalogue.devops84.shop etc..
  #This is called INTERPOLATION  2 variables along with string
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}