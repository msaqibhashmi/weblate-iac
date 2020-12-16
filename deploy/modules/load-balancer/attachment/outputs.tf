output "elb_id" {
  description = "The name of the ELB"
  value       = aws_lb.this.id
}

output "elb_arn" {
  description = "The ARN of the ELB"
  value       = aws_lb.this.arn
}

output "elb_name" {
  description = "The name of the ELB"
  value       = aws_lb.this.name
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = aws_lb.this.*.dns_name
}

output "elb_zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = aws_lb.this.*.zone_id
}

