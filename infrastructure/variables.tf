variable "subscription_id" {
  description = "L'ID de la subscription Azure"
  type        = string
  default     = ""
}

variable "location" {
  description = "La localisation de la ressource"
  type        = string
  default     = ""
}

variable "username_db" {
  description = "Username for the database"
  type        = string
}

variable "password_db" {
  description = "Password for the database"
  type        = string
  sensitive = true
}

variable "docker_registry_password" {
  description = "Password for the docker registry"
  type        = string
  sensitive   = true
}