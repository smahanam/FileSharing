#!/bin/bash

# Run tasks in parallel
PIDS=()
mpirun -np 288 --map-by socket:PE=48 --bind-to none ./LIS &
PIDS+=($!)

# Set runtime
START_TIME=$(date +%s)
TIME_LIMIT_SECONDS=$((5 * 60 * 60))  

while true; do
sleep 60
CURRENT_TIME=$(date +%s)
ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

if [ $ELAPSED_TIME -ge $TIME_LIMIT_SECONDS ]; then
    echo "[ERROR] Job exceeded time limit ($TIME_LIMIT). Killing processes..."
    for PID in "${PIDS[@]}"; do
        kill $PID 2>/dev/null
        sleep 2
        kill -9 $PID 2>/dev/null
    done
exit 1
fi

ALL_DONE=true
for PID in "${PIDS[@]}"; do
    if kill -0 $PID 2>/dev/null; then
        ALL_DONE=false
        break
    fi
done

if $ALL_DONE; then
    break
fi
done
        echo [INFO] Completed lisda_run.sh ! 

/usr/bin/touch DONE
exit 0
        