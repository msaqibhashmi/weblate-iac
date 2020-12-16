output "this_rds_cluster_arn" {
  value = aws_rds_cluster.this.arn
}

output "this_rds_cluster_id" {
  value = aws_rds_cluster.this.id
}

output "this_rds_cluster_resource_id" {
  value = aws_rds_cluster.this.cluster_resource_id
}

output "this_rds_cluster_writer_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "this_rds_cluster_reader_endpoint" {
  value = aws_rds_cluster.this.reader_endpoint
}

output "this_rds_cluster_database_name" {
  value = var.database_name
}

output "this_rds_cluster_master_password" {
  value     = aws_rds_cluster.this.master_password
  sensitive = true
}

output "this_rds_cluster_port" {
  value = aws_rds_cluster.this.port
}

output "this_rds_cluster_master_username" {
  value = aws_rds_cluster.this.master_username
}

output "this_rds_cluster_instance_endpoints" {
  value = aws_rds_cluster_instance.this.*.endpoint
}
