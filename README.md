<<<<<<< HEAD
# DevOps Selection Test - Odoo Stack

## Prérequis
- Ubuntu 20.04+, Docker 24+, Compose v2, Git
- 4GB RAM, 5GB disque libre

## Démarrage en 5 commandes
1. `git clone <votre-repo> && cd test-selection-devops`
2. `cp .env.example .env` (modifiez les mots de passe)
3. `sudo echo "127.0.0.1 erp.local" >> /etc/hosts`
4. `docker compose up -d`
5. Accédez à `http://erp.local` ou `http://localhost:8069`

## Sauvegarde
Exécutez `sudo ./apps/backup.sh`. Archive créée dans `/backup/`.

## Restauration
Consultez `docs/restauration.md`.
=======
# devops-test-rif
>>>>>>> c533259cc4acbfd4fd6a15423d42bc241146d860
