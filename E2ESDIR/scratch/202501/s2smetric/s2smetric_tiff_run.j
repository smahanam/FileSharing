#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=3:00:00
#SBATCH --constraint=mil
#SBATCH --mem-per-cpu=40GB
#SBATCH --partition=packable
#SBATCH --job-name=s2smetric_tiff_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2smetric/s2smetric_tiff_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2smetric/s2smetric_tiff_%j.err

#######################################################################
#                  Run LISF S2S s2smetric_tiff_
#######################################################################

source /etc/profile.d/modules.sh
module purge
module use -a /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export PYTHONPATH=/discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S/
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2smetric
srun --exclusive --ntasks 1 python /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1/lis/utils/usaf/S2S//ghis2s/s2smetric/postprocess_nmme_job.py -y 2025 -m 01 -w /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/s2smetric -c /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/s2s_config_global_fcast || exit 1



echo "[INFO] Completed s2smetric_tiff_!"

/usr/bin/touch DONE
exit 0
