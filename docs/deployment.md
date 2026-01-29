# Déploiement Applicatif (Ansible)

Nous utilisons une approche modulaire basée sur les **Rôles Ansible** pour orchestrer le cluster.

## Modularité & Dépendances

Le déploiement est multi-niveaux pour séparer la logique applicative du routage.

### Rôles utilisés :

1. **geerlingguy.pip / docker** : Provisionnement des nœuds applicatifs.
2. **app** (Local) : Gère l'authentification GitLab et le cycle de vie du conteneur Docker.
3. **haproxy** (Local) : Installe et configure le Load Balancer avec templating dynamique Jinja2.

## Flux de déploiement

1. **Provisionnement App** : Installation de Docker et déploiement du conteneur sur les serveurs du groupe `app_servers`.
2. **Configuration LB** : Installation de HAProxy sur le groupe `load_balancers`.
3. **Dynamic Templating** : Génération de `haproxy.cfg` en listant automatiquement les IPs des serveurs applicatifs.
4. **Validation** : Vérification de la syntaxe de configuration avant le redémarrage du service.
