#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S s2splots_03_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
export NUM_WORKERS=5
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2splots
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2splots/plot_hybas.py -y 2025 -m 1 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast &
wait

echo "[INFO] Completed s2splots_03_!"

/usr/bin/touch DONE
exit 0
