resource "kubernetes_namespace_v1" "postgresql" {
    metadata {
        name = var.namespace
    }
}

resource "random_password" "postgresql" {
    length  = 14
    special = true
    override_special = "!$%*+"
}

resource "random_password" "repmgr" {
    length  = 14
    special = true
    override_special = "!$%*+"
}

resource "random_password" "pgpool" {
    length  = 14
    special = true
    override_special = "!$%*+"
}

resource "helm_release" "postgresql" {
    namespace = kubernetes_namespace_v1.postgresql.metadata[0].name
    name      = "postgresql-ha"
    chart     = "oci://registry-1.docker.io/bitnamicharts/postgresql-ha"
    version   = var.postgresql_version
    values    = [
        <<-EOT
        global:
          storageClass: "${var.storage_class != null ? var.storage_class : ""}"
        persistence:
          size: "${var.storage_size}"
        postgresql:
          replicaCount: 3
          password: "${random_password.postgresql.result}"
          repmgrPassword: "${random_password.repmgr.result}"
        pgpool:
          adminPassword: "${random_password.pgpool.result}"
        EOT
    ]
}
