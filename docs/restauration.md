# Procédure de Restauration

## Prérequis
- Avoir une sauvegarde disponible dans `/backup/backup_*.tar.gz`
- Docker et Docker Compose installés

## Étapes de restauration

### 1. Extraire l'archive
```bash

BACKUP_FILE=$(sudo ls -t /backup/backup_*.tar.gz | head -n1)
mkdir -p /tmp/restore
sudo tar -xzf "$BACKUP_FILE" -C /tmp/restore

```

#2. Démarrer uniquement la base de données


vsudo docker compose up -d db
sleep 5

#3. Restaurer le dump PostgreSQL
sudo docker exec -i odoo_db psql -U odoo postgres < /tmp/restore/database.sql
#4. Démarrer Odoo
sudo docker compose up -d odoo
#5. Restaurer le filestore
sudo docker cp /tmp/restore/filestore/. odoo_app:/var/lib/odoo/
#6. Redémarrer la stack complète
sudo docker compose down
sudo docker compose up -d
#7. Vérifier le bon fonctionnement
Accéder à http://localhost:8069 ou http://erp.local
