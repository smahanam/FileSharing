#!/bin/bash

# Run tasks in parallel
PIDS=()
python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_modulefast.py QV2M Q2M TEMP kg/kg 01 9 12 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/log_files &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_modulefast.py T2M T2M TEMP K 01 9 12 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/log_files &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_modulefast.py U10M WIND10M TEMP m/s 01 9 12 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/log_files &
PIDS+=($!)

# Set runtime
START_TIME=$(date +%s)
TIME_LIMIT_SECONDS=$((4 * 60 * 60))  

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
        echo [INFO] Completed bcsd04_02_run.sh ! 

/usr/bin/touch DONE
exit 0
        