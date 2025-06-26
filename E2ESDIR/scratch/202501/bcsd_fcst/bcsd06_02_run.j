#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --time=5:00:00
#SBATCH --constraint=mil
#SBATCH --mem=240GB
#SBATCH --cpus-per-task=12
#SBATCH --job-name=bcsd06_02_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd06_02_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd06_02_%j.err

#######################################################################
#                  Run LISF S2S bcsd06_02_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
export NUM_WORKERS=12
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --cpus-per-task=12 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_6hourly_module.py T2M T2M 2025 01 TEMP K CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/6-Hourly/jan01 GLOBAL &
srun --exclusive --cpus-per-task=12 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_6hourly_module.py U10M WIND10M 2025 01 TEMP m/s CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/raw/6-Hourly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km/bcsd/6-Hourly/jan01 GLOBAL &
wait

echo "[INFO] Completed bcsd06_02_!"

/usr/bin/touch DONE
exit 0
