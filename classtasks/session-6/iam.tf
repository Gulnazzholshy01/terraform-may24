/*
resource <resource_type> <logical_name> {
   for_each = var.SET or mar.MAP
}

each.value or each.key
LIST/SET -> each.value
MAP -> each.key and each.value


*/


variable "users" {
  type    = set(string)
  default = ["Aiya", "Fatima", "Simon", "Marlen"]
}

variable "users_map" {
  type = map(string)
  default = {
    user1 = "Aiya"
    user2 = "Fatima"
    user3 = "Simon"
    user4 = "Marlen"
  }
}

# resource "aws_iam_user" "lb" {
#   count = length(var.users)
#   name = var.team[count.index]
# }


# resource "aws_iam_user" "lb" {
#   for_each = var.users // 4 times
#   name = each.value
# }

# resource "aws_iam_user" "map_users"{
#     for_each = var.users_map
#     name = each.value
# }

/*
1. Aiya
2. Fatima
3. Simon
4. Marlen
*/

