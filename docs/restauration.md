# Procédure de Restauration

1. Extraire l'archive:
   tar -xzf /backup/backup_*.tar.gz -C /tmp/restore

2. Démarrer uniquement la base de données:
   docker compose up -d db

3. Restaurer le dump SQL:
   docker exec -i odoo_db psql -U odoo postgres < /tmp/restore/database.sql

4. Copier le filestore:
   docker cp /tmp/restore/filestore/. odoo_app:/var/lib/odoo/

5. Démarrer toute la stack:
   docker compose up -d

6. Vérifier que le module Ventes est présent.
