#!/bin/bash
case "$1" in
  start)
    cd /pacecourt && docker compose up -d
    ;;
  stop)
    cd /pacecourt && docker compose stop
    ;;
  restart)
    cd /pacecourt && docker compose restart
    ;;
  logs)
    docker logs -f pacecourt-frappe-1
    ;;
  status)
    docker ps --filter "name=pacecourt"
    ;;
  build-frontend)
    docker exec pacecourt-frappe-1 bash -c "cd /home/frappe/frappe-bench && bench build --app crm"
    ;;
  migrate)
    docker exec pacecourt-frappe-1 bash -c "cd /home/frappe/frappe-bench && bench --site crm.localhost migrate --skip-failing"
    ;;
  backup)
    mkdir -p /pacecourt/backups
    docker exec pacecourt-mariadb-1 mysqldump -u root -p123 _c8b3e5206096f0bd > /pacecourt/backups/crm_backup_$(date +%Y%m%d_%H%M%S).sql
    echo "Backup saved in /pacecourt/backups/"
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|logs|status|build-frontend|migrate|backup}"
    exit 1
    ;;
esac
