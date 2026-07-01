# Journal IA

## Prompt 1
**Prompt** : "Écrire un docker-compose.yml pour Odoo 17 avec PostgreSQL 15 et Nginx"
**Généré** : Un fichier avec 3 services.
**Modifié** : J'ai ajouté le réseau privé pour isoler PostgreSQL, et externalisé les variables dans `.env`.
**Pourquoi** : La sécurité et la documentation sont des points clés du test.

## Prompt 2
**Prompt** : "Générer un script Bash de backup pour Odoo utilisant pg_dump et tar"
**Généré** : Un script simple avec pg_dump.
**Modifié** : J'ai ajouté le logging dans `/var/log/backup.log`, l'horodatage, et la gestion d'erreurs.
**Pourquoi** : Le sujet exige explicitement ces fonctionnalités pour les points.

## Prompt 3
**Prompt** : "Comment restaurer un dump PostgreSQL dans un conteneur Docker depuis l'hôte ?"
**Généré** : Commande `docker exec -i container psql < dump.sql`.
**Modifié** : J'ai intégré cette commande dans une procédure complète avec copie du filestore.
**Pourquoi** : Pour simuler un crash complet et documenter le runbook.

**Ce que j'ai appris** : J'ai appris à utiliser `docker cp` pour récupérer des répertoires entiers depuis un conteneur, et à combiner cela avec une restauration SQL en une seule procédure fiable.
