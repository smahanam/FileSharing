#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=7
#SBATCH --time=6:00:00
#SBATCH --constraint=mil
#SBATCH --partition=packable
#SBATCH --mem-per-cpu=69GB
#SBATCH --job-name=bcsd09-10_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd09-10_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst/bcsd09-10_%j.err

#######################################################################
#                  Run LISF S2S bcsd09-10_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/bcsd_fcst
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd/bcsd_library//combine_sub_daily_downscaled_forcings.py 2025 01 CFSv2 12 9 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//bcsd_fcst/CFSv2_25km &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M CanESM5 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M CESM1 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M CFSv2 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M GEOSv2 &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M GFDL &
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/bcsd//task_10.py -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast -s 2025 -m jan -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/ -n 01 -M GNEMO52 &
wait

echo "[INFO] Completed bcsd09-10_!"

/usr/bin/touch DONE
exit 0
