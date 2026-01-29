# IaC AWS - Olympic Tracker Documentation

Bienvenue sur la documentation technique du projet **IaC AWS - Olympic Tracker**.

## Objectifs du projet

Ce projet démontre un workflow DevOps complet intégrant la Haute Disponibilité (HA) :

- **Infrastructure as Code** : Terraform pour le multi-tiering.
- **Gestion de configuration** : Ansible (Rôles, Galaxy & Bastion SSH).
- **Load Balancing** : HAProxy pour la répartition de charge Round Robin.
- **Conteneurisation** : Docker pour l'isolation applicative.
- **Sécurité** : Isolation VPC et Ansible Vault.

## 🏗️ Architecture Réseau

Le déploiement suit un flux optimisé :

1. **Terraform** : Création du cluster (1 LB + X Apps).
2. **Local** : Génération de l'inventaire Ansible incluant les directives `ProxyCommand` pour le bastion.
3. **Ansible** :
   - Déploiement de l'app sur les IPs privées des serveurs.
   - Configuration du Load Balancer pour exposer l'application sur le port 80 public.
4. **Monitoring** : Monitoring du cluster via le dashboard de statistiques HAProxy (Port 8080).
