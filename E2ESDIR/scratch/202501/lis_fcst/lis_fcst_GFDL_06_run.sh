#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################


#######################################################################
#                  Run LISF S2S lis_fcst_GFDL_06_
#######################################################################

source /etc/profile.d/modules.sh
module purge
unset LD_LIBRARY_PATH
module use --append /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export I_MPI_PMI_LIBRARY=/usr/slurm/lib64/libpmi2.so
export I_MPI_PMI_VALUE_LENGTH_MAX=288
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202501/lis_fcst
srun --mpi=pmi2 --ntasks=$SLURM_NTASKS \
     --ntasks-per-socket=$SLURM_NTASKS_PER_SOCKET \
     --ntasks-per-core=$SLURM_NTASKS_PER_CORE \
     --cpu-bind="none"  \
     ./LIS -f input/lis.config_files/GFDL/lis.config.s2sglobal.noahmp401.hymap2.da_ics_forecast_GFDL_202501_06 || exit 1

echo "[INFO] Completed lis_fcst_GFDL_06_!"

/usr/bin/touch DONE
exit 0
