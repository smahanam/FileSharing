# s2s_run Python Package 

*https://github.com/smahanam/LISF-1/blob/support/lisf_557ww_7.7_s2srf/lis/utils/usaf/S2S/ghis2s/s2s_app/s2s_run.py*  
  
The s2s_run package can be called either from within another Python program or run from the command line.

*The following description uses the S2S forecast initialized on January 1, 2025 as an example.*  
  
## 1) Setting PYTHONPATH environment variable
```export PYTHONPATH={Your_LISFDIR}/lis/utils/usaf/S2S/```  
OR  
```setenv PYTHONPATH {Your_LISFDIR}/lis/utils/usaf/S2S/```  

## 2) Creating working directories, and job files for the month
| from a Python program | Command line |
| -----------------------------------| -----------------------------------|
| ```from s2s_run import S2Srun``` | load python |
| ```# initialize S2Srun``` | ```python s2s_app/s2s_run.py -y 2025 -m 1 -c s2s_config_global_fcst ```|
| ```s2s = S2Srun(year=2025, month=1, config_file='s2s_config_global_fcst')```| |
|```# run S2Srun```||
|```s2s.main()```||

(1) This step will create 7 run-directories for the seven steps: lis_darun, ldt_ics, bcsd_fcst, lis_fcst, s2spost, s2smetric, and s2splots. These will be placed under the main run-directory (scratch/202501). For example:  
*https://github.com/smahanam/FileSharing/tree/main/E2ESDIR/scratch/202501*  
  
(2) Each run-directory will be populated with two separate sets of job scripts for each task (approximately 50 jobs per forecast).  
\*.j files: These are used with the SLURM job management system.    
\*.sh files: These contain NO SLURM directives or commands, and are designed for Cylc. For example:  
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/s2spost/s2spost_01_run.sh*  
  
(3) This step will also generate the [runtime] snippet for Cylc implementation which defines directives, environmental variables, and the order of execution of job files. For e.g.:  
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/CYLC_workflow.rc*  

## 3) Running s2s_run  
| Cylc | SLURM |
|------| ------|
|Cylc will need to execute *sh files in the order as specified in *CYLC_workflow.rc*|**Command line**| 
||```python s2s_app/s2s_run.py -y 2025 -m 1 -c s2s_config_global_fcst -j ```  |
test  
|| This command will submit all generated job scripts (~50 \*.j files) to the SLURM system. The jobs will be executed according to their predefined workflow dependencies.| 
|| For example: *https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/SLURM_JOB_SCHEDULE*|




