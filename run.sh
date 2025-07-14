#!/bin/bash

#!/bin/bash
echo "Starte EVCC Add-on..."

# Create config directory if missing
mkdir -p /data

cd /app
./evcc -c /config/evcc.yaml

# Run EVCC
exec /usr/bin/evcc --config /data/evcc.yaml