#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S s2splots_01_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2splots
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2splots/plot_mena.py -y 2025 -m 01 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2splots/plot_anom_verify.py -y 2025 -m 1 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast -l 1 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2splots/plot_anom_verify.py -y 2025 -m 1 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast -l 2 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2splots/plot_weekly_anom.py -y 2025 -m 1 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast &
wait

echo "[INFO] Completed s2splots_01_!"

/usr/bin/touch DONE
exit 0
