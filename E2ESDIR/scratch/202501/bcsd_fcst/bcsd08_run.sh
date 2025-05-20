#!/bin/bash

# Run tasks in parallel
PIDS=()
python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CanESM5 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CanESM5 GLOBAL &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CESM1 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CESM1 GLOBAL &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CFSv2 GLOBAL &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GEOSv2 4 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GEOSv2 GLOBAL &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GFDL 15 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GFDL GLOBAL &
PIDS+=($!)

python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GNEMO52 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GNEMO52 GLOBAL &
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
        echo [INFO] Completed bcsd08_run.sh ! 

/usr/bin/touch DONE
exit 0
        