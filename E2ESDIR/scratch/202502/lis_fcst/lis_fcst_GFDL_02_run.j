#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --time=7:00:00
#SBATCH --constraint=mil
#SBATCH --ntasks=288 --ntasks-per-socket=48 --ntasks-per-core=1
#SBATCH --job-name=lis_fcst_GFDL_02_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_fcst/lis_fcst_GFDL_02_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_fcst/lis_fcst_GFDL_02_%j.err

#######################################################################
#                  Run LISF S2S lis_fcst_GFDL_02_
#######################################################################

source /etc/profile.d/modules.sh
module purge
unset LD_LIBRARY_PATH
module use --append /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_fcst
export I_MPI_PMI_LIBRARY=/usr/slurm/lib64/libpmi2.so
export I_MPI_PMI_VALUE_LENGTH_MAX=288
srun --mpi=pmi2 --ntasks=$SLURM_NTASKS \
     --ntasks-per-socket=$SLURM_NTASKS_PER_SOCKET \
     --ntasks-per-core=$SLURM_NTASKS_PER_CORE \
     --cpu-bind="none"  \
     ./LIS -f input/lis.config_files/GFDL/lis.config.s2sglobal.noahmp401.hymap2.da_ics_forecast_GFDL_202502_02 || exit 1

echo "[INFO] Completed lis_fcst_GFDL_02_!"

/usr/bin/touch DONE
exit 0
