output "postgres_password" {
    depends_on  = [helm_release.postgresql]
    value       = random_password.postgres.result
    sensitive   = true
    description = "postgresql password"
}
