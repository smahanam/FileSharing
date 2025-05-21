#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --time=4:00:00
#SBATCH --constraint=mil
#SBATCH --partition=packable
#SBATCH --mem-per-cpu=100GB
#SBATCH --job-name=bcsd05_02_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd05_02_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd05_02_%j.err

#######################################################################
#                  Run LISF S2S bcsd05_02_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_nmme_modulefast.py PRECTOT PRECTOT PRCP kg/m^2/s 02 GEOSv2 9 4 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Climatology/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km/raw/Climatology /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/bcsd/Monthly/feb01 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_nmme_modulefast.py PRECTOT PRECTOT PRCP kg/m^2/s 02 GFDL 9 15 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Climatology/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km/raw/Climatology /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/bcsd/Monthly/feb01 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//bias_correction_nmme_modulefast.py PRECTOT PRECTOT PRCP kg/m^2/s 02 GNEMO52 9 10 2025 2025 1991 2020 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Climatology/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/USAF-LIS7.3rc8_25km/raw/Climatology /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/raw/Monthly/feb01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/bcsd_fcst/bcsd_fcst/NMME/bcsd/Monthly/feb01 &
wait

echo "[INFO] Completed bcsd05_02_!"

/usr/bin/touch DONE
exit 0
