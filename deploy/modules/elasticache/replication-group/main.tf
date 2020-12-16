resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = var.cluster_name
  replication_group_description = var.description
  node_type                     = var.node_type
  number_cache_clusters         = var.nodes
  port                          = var.port

  engine_version    = var.engine_version
  subnet_group_name = var.subnet_group_name

  automatic_failover_enabled = var.failover
  snapshot_retention_limit   = var.backup_days
  security_group_ids         = [var.default_security_group_id]

  tags = {
    Application = var.application
    Environment = var.environment
    Team        = var.team
    Project     = var.project
  }
}
