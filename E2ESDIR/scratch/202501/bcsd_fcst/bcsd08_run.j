#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --time=5:00:00
#SBATCH --constraint=mil
#SBATCH --partition=packable
#SBATCH --mem-per-cpu=80GB
#SBATCH --job-name=bcsd08_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd08_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd08_%j.err

#######################################################################
#                  Run LISF S2S bcsd08_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CanESM5 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CanESM5 GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CESM1 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CESM1 GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s CFSv2 12 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/CFSv2 GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GEOSv2 4 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GEOSv2 GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GFDL 15 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GFDL GLOBAL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//temporal_disaggregation_nmme_6hourly_module.py PRECTOT PRECTOT 2025 01 PRCP kg/m^2/s GNEMO52 10 9 2025 2025 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/Monthly/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/linked_cfsv2_precip_files/jan01 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/NMME/bcsd/6-Hourly/jan01/GNEMO52 GLOBAL &
wait

echo "[INFO] Completed bcsd08_!"

/usr/bin/touch DONE
exit 0
