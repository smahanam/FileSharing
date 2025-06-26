#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S bcsd06_01_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
export NUM_WORKERS=12
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --cpus-per-task=12 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_6hourly_module.py LWGAB LWS 2025 01 TEMP W/m^2 CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/6-Hourly/jan01 GLOBAL &
srun --exclusive --cpus-per-task=12 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_6hourly_module.py PS PS 2025 01 TEMP Pa CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/6-Hourly/jan01 GLOBAL &
srun --exclusive --cpus-per-task=12 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_6hourly_module.py QV2M Q2M 2025 01 TEMP kg/kg CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/6-Hourly/jan01 GLOBAL &
wait

echo "[INFO] Completed bcsd06_01_!"

/usr/bin/touch DONE
exit 0
