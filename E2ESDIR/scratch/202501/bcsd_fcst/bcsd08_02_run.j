#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=5:00:00
#SBATCH --constraint=mil
#SBATCH --partition=packable
#SBATCH --mem-per-cpu=100GB
#SBATCH --job-name=bcsd08_02_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd08_02_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd08_02_%j.err

#######################################################################
#                  Run LISF S2S bcsd08_02_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km//raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CFSv2 GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GEOSv2 4 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km//raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GEOSv2 GLOBAL &
wait

echo "[INFO] Completed bcsd08_02_!"

/usr/bin/touch DONE
exit 0
