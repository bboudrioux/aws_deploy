# Détails de l'Infrastructure (Terraform)

L'infrastructure est décomposée en plusieurs fichiers pour une meilleure maintenance et permet une haute disponibilité.

## Structure Terraform

- `providers.tf` : Configuration des sources (AWS, TLS, Local).
- `variables.tf` : Centralisation des paramètres (Région, Type d'instance).
- `security.tf` : Groupes de sécurité isolés (Frontend LB vs Backend App).
- `ssh.tf` : Génération des clés SSH sécurisées.
- `main.tf` : Définition des instances EC2 (Multi-instances pour l'App et instance dédiée HAProxy).
- `ansible.tf` : Glue code générant l'inventaire dynamique `hosts.yml` avec support du ProxyJump.

## 🛡️ Sécurité & Réseau

- **Isolation Réseau** : Les serveurs applicatifs utilisent leurs **IPs privées** pour limiter l'exposition.
- **Bastion SSH** : L'accès aux serveurs applicatifs se fait via un rebond (Jump Host) sur l'instance HAProxy.
- **Security Groups** :
  - `haproxy_sg` : Ports 80 (Web), 22 (SSH) et 8080 (Stats) ouverts.
  - `app_sg` : Flux restreint au port 80 provenant uniquement du Load Balancer.
- **Clés SSH** : Stockage local restreint (`0600`) et rotation gérée par Terraform.
