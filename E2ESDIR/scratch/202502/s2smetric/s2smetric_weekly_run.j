#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=4:00:00
#SBATCH --constraint=mil
#SBATCH --partition=packable
#SBATCH --mem-per-cpu=8GB
#SBATCH --cpus-per-task=5
#SBATCH --job-name=s2smetric_weekly_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric_weekly_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric_weekly_%j.err

#######################################################################
#                  Run LISF S2S s2smetric_weekly_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
export NUM_WORKERS=5
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CanESM5 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CanESM5 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CESM1 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CESM1 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CFSv2 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 CFSv2 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GEOSv2 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GEOSv2 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GFDL /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GFDL /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GNEMO52 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 ANOM &
srun --exclusive --cpus-per-task=5 --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//lis/utils/usaf/S2S/ghis2s/s2smetric/metrics_library/compute_weekly_anom.py 02 2025 GNEMO52 /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR//s2s_config_global_fcast /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/s2smetric/s2smetric/202502 SANOM &
wait

echo "[INFO] Completed s2smetric_weekly_!"

/usr/bin/touch DONE
exit 0
