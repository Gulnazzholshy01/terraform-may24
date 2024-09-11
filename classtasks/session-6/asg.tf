# resource "aws_autoscaling_group" "bar" {
#   name                      = "foobar3-terraform-test"
#   max_size                  = 5
#   min_size                  = 2
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 4
#   force_delete              = true
#   placement_group           = aws_placement_group.test.id
#   launch_configuration      = aws_launch_configuration.foobar.name
#   vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]

#   instance_maintenance_policy {
#     min_healthy_percentage = 90
#     max_healthy_percentage = 120
#   }


#    dynamic "tag" {
#     for_each = var.asg_tags
#     content {
#         key = tag.value.key
#         value = tag.value.value
#         propagate_at_launch = tag.value.propagate_at_launch
#     }

# }

# variable "asg_tags" {
#     default = {
#        tag1  {
#         env = dev
#         team = devops

#        }
#     }
# }

/* 

dynamic + for_each = used in inline block to create nultiple instance 
*/