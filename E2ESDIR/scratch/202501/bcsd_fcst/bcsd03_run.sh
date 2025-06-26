#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S bcsd03_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CanESM5 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CESM1 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ CFSv2 12 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GEOSv2 4 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GFDL 15 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//nmme_reorg_f.py 1 2025 /discover/nobackup/projects/usaf_lis/GHI_S2S/NMME/ /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly /discover/nobackup/projects/usaf_lis/GHI_S2S/supplementary_files//bcsd_fcst/ GNEMO52 10 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast &
wait

echo "[INFO] Completed bcsd03_!"

/usr/bin/touch DONE
exit 0
