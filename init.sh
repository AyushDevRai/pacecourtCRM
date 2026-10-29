#!/bin/bash
set -e

# Disable MariaDB client SSL to prevent TLS/SSL errors with non-SSL docker MariaDB
cat << 'EOF' > /home/frappe/.my.cnf
[client]
ssl = 0
EOF

if [ -d "/home/frappe/frappe-bench/apps/frappe" ]; then
    echo "Bench already exists, verifying configuration..."
    /home/frappe/frappe-bench/env/bin/pip install orjson
    /home/frappe/frappe-bench/env/bin/pip install -e /home/frappe/frappe-bench/apps/frappe
    /home/frappe/frappe-bench/env/bin/pip install -e /home/frappe/frappe-bench/apps/crm
    cd /home/frappe/frappe-bench
    sed -i "s/bench serve  --port 8000/bench serve --host 0.0.0.0 --port 8000/" ./Procfile 2>/dev/null || true
    sed -i "s/bench serve --port 8000/bench serve --host 0.0.0.0 --port 8000/" ./Procfile 2>/dev/null || true
    bench --site crm.localhost migrate --skip-failing || true
    exec bench start
fi

echo "=========================================="
echo "Initializing new bench with Frappe develop..."
echo "=========================================="

bench init --skip-redis-config-generation frappe-bench --version develop

cd frappe-bench

# Use containers instead of localhost
bench set-mariadb-host mariadb
bench set-redis-cache-host redis://redis:6379
bench set-redis-queue-host redis://redis:6379
bench set-redis-socketio-host redis://redis:6379

# Remove redis, watch from Procfile, ensure external host binding
sed -i '/redis/d' ./Procfile
sed -i '/watch/d' ./Procfile
sed -i 's/bench serve/bench serve --host 0.0.0.0/' ./Procfile

# Get required apps
bench get-app whatsapp
bench get-app crm https://github.com/AyushDevRai/PC_CRM.git --branch main

# Create site
bench new-site crm.localhost \
    --force \
    --mariadb-root-password 123 \
    --admin-password admin \
    --no-mariadb-socket

# Install app crm
bench --site crm.localhost install-app crm

# Wait for MariaDB to be fully responsive
until mysql -h mariadb -u root -p123 -e "SELECT 1;" &>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 2
done

# If database backup exists, restore it into MariaDB
if [ -f "/workspace/db_backup/crm_database.sql" ]; then
    echo "=========================================="
    echo "Restoring database from crm_database.sql..."
    echo "=========================================="
    mysql -h mariadb -u root -p123 -e "CREATE DATABASE IF NOT EXISTS \`_c8b3e5206096f0bd\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    mysql -h mariadb -u root -p123 -e "GRANT ALL PRIVILEGES ON \`_c8b3e5206096f0bd\`.* TO '_c8b3e5206096f0bd'@'%' IDENTIFIED BY '5MzrmC5k0ELtDJxv'; FLUSH PRIVILEGES;"
    mysql -h mariadb -u root -p123 _c8b3e5206096f0bd < /workspace/db_backup/crm_database.sql
    echo "Database dump restored successfully!"

    # Write site_config.json pointing to the restored DB
    cat << 'EOF_CONFIG' > /home/frappe/frappe-bench/sites/crm.localhost/site_config.json
{
 "db_name": "_c8b3e5206096f0bd",
 "db_password": "5MzrmC5k0ELtDJxv",
 "db_type": "mariadb",
 "db_user": "_c8b3e5206096f0bd",
 "developer_mode": 1,
 "encryption_key": "eUqWtLcESiXL1l2tVnm6oKy8mBBLPs2liRvbljJdWTU=",
 "flow_server_secret": "8fb0f28e17aade1de8700496c3c2c49309b2879a4421c0b0",
 "host_name": "http://187.127.128.195:8000",
 "installed_apps": [
  "frappe",
  "crm"
 ],
 "mute_emails": 0,
 "server_script_enabled": 1
}
EOF_CONFIG

    mkdir -p /home/frappe/frappe-bench/sites/crm.localhost/logs
    bench --site crm.localhost clear-cache
    bench --site crm.localhost migrate --skip-failing || true
fi

bench --site crm.localhost set-config developer_mode 1
bench --site crm.localhost set-config host_name "http://187.127.128.195:8000"
bench --site crm.localhost set-config mute_emails 0
bench --site crm.localhost set-config server_script_enabled 1
bench --site crm.localhost clear-cache
bench use crm.localhost

# Build frontend assets
bench build --app crm

echo "=========================================="
echo " SETUP COMPLETE! Starting bench..."
echo "=========================================="
exec bench start
