output "postgresql_password" {
    depends_on  = [helm_release.postgresql]
    value       = random_password.postgresql.result
    sensitive   = true
    description = "postgresql password"
}
