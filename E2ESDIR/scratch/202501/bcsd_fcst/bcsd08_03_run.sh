#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S bcsd08_03_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GFDL 15 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km//raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GFDL GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GNEMO52 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km//raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GNEMO52 GLOBAL &
wait

echo "[INFO] Completed bcsd08_03_!"

/usr/bin/touch DONE
exit 0
