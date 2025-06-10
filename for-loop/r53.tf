resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id  # zone_id given in variables it will check 
  name    = "${each.key}.${var.domain_name}" # it will mongodb.devops84.shop
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}

# count must useful to [list]
# for must useful to [set & map]