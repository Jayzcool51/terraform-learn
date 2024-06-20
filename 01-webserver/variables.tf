##type
#description to use the variable, also applicable also for plan and apply (good for teammate to understand variable)

# default - if no value pass then it will use default value

# type - string, number, bool, list, map, set, object, tuple, any

# validation - custom validation rules

# sensitive - any secret you pass to terraform

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

# verify value is number
# variable "number_example" {
#   description = "An example of a number variable in Terraform"
#   type        = number
#   default     = 42
# }

# # verify value is list 
# variable "list_example" {
#   description = "An example of a list in Terraform"
#   type        = list
#   default     = ["a", "b", "c"]
# }

# # verify value  of map containing string
# variable "map_example" {
#   description = "An example of a map in Terraform"
#   type        = map(string)

#   default = {
#     key1 = "value1"
#     key2 = "value2"
#     key3 = "value3"
#   }
# }

