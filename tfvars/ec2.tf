#resource <resource-type> <resource-name>

resource "aws_instance" "expense" {

  for_each = var.instance_names #each.key and each.value
  ami           = data.aws_ami.ami_info.id
  vpc_security_group_ids =  ["sg-092ff5452a39fc34b"]
  instance_type = each.value

  tags = merge (
    var.common_tags, {
       Name = "${each.key}"
       Module = "${each.key}"
       Environment = var.environment
    }
 )
}