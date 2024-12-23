#resource <resource-type> <resource-name>

resource "aws_instance" "expense_multi_env" {

  for_each = var.instance_names #each.key and each.value  # db-dev = "t3.small"
  ami           = data.aws_ami.ami_info.id
  vpc_security_group_ids =  ["sg-06b1b57b365846051"] 
  instance_type = each.value
  
  tags = merge (
    var.common_tags, {
       Name = "${each.key}"
       Module = "${each.key}"
       Environment = var.environment
    }
 )
}