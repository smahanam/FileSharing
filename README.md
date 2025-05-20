# s2s_run Python Package 

s2s_run can be called either from a Python program or run in the standalone mode.

*Note below description uses the S2S forecast intialized on January-01, 2025 as an example.*  
  
## 1) Setting PYTHONPATH environmental variable
```export PYTHONPATH={Your_LISFDIR}/lis/utils/usaf/S2S/```  
OR  
```setenv PYTHONPATH {Your_LISFDIR}/lis/utils/usaf/S2S/```  

## 2) Creating working directories, and job files for the month
| from a Python program | Standalone |
| -----------------------------------| -----------------------------------|
| ```from s2s_run import S2Srun``` | load python |
| ```# initialize S2Srun``` | ```python s2s_app/s2s_run.py -y 2025 -m 1 -c s2s_config_global_fcst ```|
| ```s2s = S2Srun(year=2025, month=1, config_file='s2s_config_global_fcst')```| |
|```# run S2Srun```||
|```s2s.main()```||

(1) This step will create 7 run-directories for the seven steps: lis_darun, ldt_ics, bcsd_fcst, lis_fcst, s2spost, s2smetric, and s2splots under the main run-directory (scratch/202501), for e.g.:  
*https://github.com/smahanam/FileSharing/tree/main/E2ESDIR/scratch/202501*  
  
(2) Each run-directory will be populated with two separate sets of job scripts for each task (~50 jobs per forecast).  
\*.j files: are used on the SLURM job management system.    
\*.sh files: do not contain any SLURM directives or commands, that are designed for Cylc.    
  
(3) This step will also write the [runtime] snippet for Cylc implementation defining directives, environmental variables, and the order of execution of job files. For e.g.:  
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/CYLC_workflow.rc*  




