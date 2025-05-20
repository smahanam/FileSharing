#!/bin/bash

# Run tasks in parallel
PIDS=()
python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_11.py -s 2025 -m jan -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst -n 01 &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_12.py -s 2025 -m jan -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst -n 01 &
PIDS+=($!)

# Set runtime
START_TIME=$(date +%s)
TIME_LIMIT_SECONDS=$((6 * 60 * 60))  

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
        echo [INFO] Completed bcsd11-12_run.sh ! 

/usr/bin/touch DONE
exit 0
        