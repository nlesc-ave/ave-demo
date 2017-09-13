#!/bin/sh

# Internally NGINX is hosting data files on http://localhost/data
# Externally as $EXTERNAL_URL/data
# The database entries need to have their urls updated
echo "Updating urls in /app/ave.db"
echo "UPDATE metadata SET filename=REPLACE(filename, 'http://localhost', '$EXTERNAL_URL');" | sqlite3 /app/ave.db

exec "$@"
