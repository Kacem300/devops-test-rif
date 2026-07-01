# Journal IA

## Prompt 1
"Generate a docker compose.yml for Odoo 17 postgreSQL 15, and nginx"

J'ai demandé à l'IA d'écrire un docker-compose.yml pour Odoo, PostgreSQL et Nginx. Elle m'a donné un fichier basique avec 3 services. J'ai ajouté un réseau privé pour isoler PostgreSQL et j'ai déplacé les mots de passe dans un fichier .env parce que le test exigeait de bien gérer la sécurité.


## Prompt 2
"Write a Bash backup script for Odoo using pg_dump and tar"



J'ai demandé à l'IA de générer un script de sauvegarde Bash avec pg_dump et tar. Elle m'a donné un script simple. J'y ai ajouté des logs, un horodatage et une gestion des erreurs parce que le sujet demandait explicitement ces points pour avoir tous les points.



## Prompt 3

"how to restore a postgreSQL dump from the host into a Docker container"


J'ai demandé à l'IA comment restaurer un dump PostgreSQL depuis l'hôte vers un conteneur Docker. Elle m'a donné la commande docker exec -i psql < dump.sql. Je l'ai transformée en une procédure complète qui restaure aussi le filestore, car je devais simuler un crash total et documenter une procédure de récupération qui fonctionne.



