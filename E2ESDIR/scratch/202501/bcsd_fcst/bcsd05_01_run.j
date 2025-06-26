#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --constraint=mil
#SBATCH --mem=240GB
#SBATCH --cpus-per-task=10
#SBATCH --job-name=bcsd05_01_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd05_01_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd05_01_%j.err

#######################################################################
#                  Run LISF S2S bcsd05_01_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
export NUM_WORKERS=10
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --cpus-per-task=10 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_nmme_modulefast.py PRECTOT PRECTOT PRCP kg/m^2/s 01 CanESM5 9 10 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Climatology/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km/raw/Climatology /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd_fcst/NMME/bcsd/Monthly/jan01 &
wait

echo "[INFO] Completed bcsd05_01_!"

/usr/bin/touch DONE
exit 0
