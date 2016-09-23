#!/bin/bash

EXE_DIR=${EXE_DIR:-$(dirname $0)}
QUERIES_FILE_NAME=${QUERIES_FILE_NAME:-influx-http-8-hosts-queries.gz}
source ${EXE_DIR}/query_common.sh

until curl http://${DATABASE_HOST}:8086/ping 2>/dev/null; do
    echo "Waiting for InfluxDB"
    sleep 1
done

cat ${QUERIES_FILE} | gunzip | query_benchmarker_influxdb \
				   --print-responses=${PRINT_RESPONSES} \
                                   --workers=${NUM_WORKERS} \
                                   --url=http://${DATABASE_HOST}:8086