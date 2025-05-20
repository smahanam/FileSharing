#!/bin/bash

# Run tasks in parallel
PIDS=()
python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CanESM5 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CESM1 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CFSv2 12 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GEOSv2 4 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GFDL 15 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GNEMO52 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
PIDS+=($!)

# Set runtime
START_TIME=$(date +%s)
TIME_LIMIT_SECONDS=$((3 * 60 * 60))  

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
        echo [INFO] Completed bcsd03_run.sh ! 

/usr/bin/touch DONE
exit 0
        