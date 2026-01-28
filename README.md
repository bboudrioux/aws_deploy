# IaC AWS - Olympic Tracker Documentation

[![Terraform](https://img.shields.io/badge/Terraform-1.14+-623CE4?logo=terraform)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-latest-EE0000?logo=ansible)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-enabled-2496ED?logo=docker)](https://www.docker.com/)
[![Documentation](https://img.shields.io/badge/Docs-MkDocs-009485?logo=materialformkdocs)](https://bboudrioux.github.io/aws_deploy/)

Ce dépôt contient l'automatisation complète (IaC) pour déployer l'application **IaC AWS - Olympic Tracker Documentation** sur AWS. Il combine la puissance de **Terraform** pour l'infrastructure et la flexibilité d'**Ansible** pour la configuration logicielle.

---

## Documentation complète

Pour des instructions détaillées, l'architecture complète et les guides de dépannage, consultez notre site de documentation :
**https://bboudrioux.github.io/aws_deploy/**

---

## Structure du Projet

```text
.
├── ansible/
│   ├── group_vars/      # Configuration métier (image, ports)
│   ├── roles/
│   │   └── app/         # Notre rôle applicatif (dépend de docker/pip)
│   ├── deploy.yml       # Playbook principal
│   ├── requirements.yml # Rôles communautaires (Galaxy)
│   └── secrets.yml      # Secrets chiffrés (Vault)
├── terraform/
│   ├── main.tf          # Instance EC2
│   ├── security.tf      # Firewall (SG)
│   ├── ansible.tf       # Génération dynamique de l'inventaire
│   └── variables.tf     # Paramétrage Infra
├── docs/                # Sources MkDocs
└── mkdocs.yml           # Configuration du site de doc
```

---

## 🚀 Démarrage Rapide

### 1. Cloner et installer les dépendances

```bash
git clone [https://github.com/votre-compte/olympic-tracker-infra.git](https://github.com/votre-compte/olympic-tracker-infra.git)
cd olympic-tracker-infra
ansible-galaxy install -r ansible/requirements.yml -p ansible/roles/
```

### 2. Provisionner l'infrastructure

```bash
cd terraform
terraform init
terraform apply
```

### 3. Déployer l'application

```bash
cd ..
ansible-playbook -i ansible/hosts.yml ansible/deploy.yml --ask-vault-pass
```

---

## 🛠️ Stack Technique

- **Cloud** : AWS (EC2, VPC, Security Groups)
- **IaC** : Terraform
- **Configuration** : Ansible (Roles, Vault, Galaxy)
- **App** : Docker (Container Registry GitLab)
- **Doc** : MkDocs (Material Theme)

---

## Licence

Ce projet est sous licence MIT.
