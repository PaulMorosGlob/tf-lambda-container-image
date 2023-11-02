variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "sandbox"
}

variable "app_name" {
  type    = string
  # prefixes with a random string to avoid collisions
  default = "myapp"
}