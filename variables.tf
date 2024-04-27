variable "namespace" {
    type        = string
    default     = "postgresql"
    description = "namespace to use for the installation"
}

variable "postgresql_version" {
    type        = string
    default     = null
    description = "override the PostgreSQL Helm chart version"
}

variable "storage_class" {
    type        = string
    default     = null
    description = "persistent storage class"
}

variable "storage_size" {
    type        = string
    default     = "1Gi"
    description = "size of the database persistent storage"
}
