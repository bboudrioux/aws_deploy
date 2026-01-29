output "app_servers_ssh" {
  value = [for instance in aws_instance.app_servers : "ssh -i ${local_sensitive_file.pem_file.filename} ubuntu@${instance.public_dns}"]
}

output "haproxy_ssh" {
  value = "Pour se connecter au serveur 'haproxy':\n\tssh -i ${local_sensitive_file.pem_file.filename} -o IdentitiesOnly=yes ubuntu@${aws_instance.haproxy.public_dns}"
}

output "haproxy_http" {
  value = "Pour accéder au load-balancer:\n\thttp://${aws_instance.haproxy.public_dns}"
}

# output "elasticsearch" {
#   description = "URL de la base de données ElasticSearch"
#   value       = aws_opensearch_domain.iac-aws-elasticsearch.endpoint
# }

# output "kibana" {
#   description = "URL de connexion à l'instance Kibana"
#   value       = aws_opensearch_domain.iac-aws-elasticsearch.dashboard_endpoint
# }