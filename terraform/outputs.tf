output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "ssh_connection_command" {
  value = "ssh -i ${local_sensitive_file.pem_file.filename} ubuntu@${aws_instance.app_server.public_ip}"
}

# output "elasticsearch" {
#   description = "URL de la base de données ElasticSearch"
#   value       = aws_opensearch_domain.iac-aws-elasticsearch.endpoint
# }

# output "kibana" {
#   description = "URL de connexion à l'instance Kibana"
#   value       = aws_opensearch_domain.iac-aws-elasticsearch.dashboard_endpoint
# }