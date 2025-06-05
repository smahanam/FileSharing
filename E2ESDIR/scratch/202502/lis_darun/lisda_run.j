#!/bin/bash

#######################################################################
#                        Batch Parameters 
#######################################################################

#SBATCH --account=s1189
#SBATCH --time=5:00:00
#SBATCH --constraint=mil
#SBATCH --ntasks=288 --ntasks-per-socket=48 --ntasks-per-core=1
#SBATCH --job-name=lisda_
#SBATCH --output /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_darun/lisda_%j.out
#SBATCH --error /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_darun/lisda_%j.err

#######################################################################
#                  Run LISF S2S lisda_
#######################################################################

source /etc/profile.d/modules.sh
module purge
unset LD_LIBRARY_PATH
module use --append /discover/nobackup/projects/usaf_lis/smahanam/S2S/LISF-1//env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
ulimit -s unlimited

export I_MPI_PMI_LIBRARY=/usr/slurm/lib64/libpmi2.so
export I_MPI_PMI_VALUE_LENGTH_MAX=288
cd /discover/nobackup/projects/ghilis/S2S/GLOBAL/FileSharing/E2ESDIR/scratch/202502/lis_darun
srun --mpi=pmi2 --ntasks=$SLURM_NTASKS \
     --ntasks-per-socket=$SLURM_NTASKS_PER_SOCKET \
     --ntasks-per-core=$SLURM_NTASKS_PER_CORE \
     --cpu-bind="none"  \
     ./LIS || exit 1

echo "[INFO] Completed lisda_!"

/usr/bin/touch DONE
exit 0
