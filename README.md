# ghis2s Python Package 
 
This repository contains this README file and a mock-up working directory of the GHI-S2S forecasting system.
GHI-S2S consists of approximately 150 tasks that follow a predeifined schedule. These tasks have been grouped into 50+ job files to optimize computer resources.  
A comprehensive description of GHI-S2S can be found at:  
*https://github.com/smahanam/LISF-1/blob/support/lisf_557ww_7.7_s2srf/lis/utils/usaf/S2S/README_GHI-S2S_LIS7.7*  
  
The master script of ghis2s ([*s2s_run.py*](https://github.com/smahanam/LISF-1/blob/support/lisf_557ww_7.7_s2srf/lis/utils/usaf/S2S/ghis2s/s2s_app/s2s_run.py)) creates run-directories, establishes necessary links, generates bash script files, and sets up the complete S2S forecast experiment each month.

We present **ghis2s** as a Python package that can be called either from within an external Python program or run from the command line. The package requires only one input: a YAML configuration file containing system and experiment-related parameters/paths. Example configuration:   
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/s2s_config_global_fcast*  
  
Below two paths are specified among SETUP parameters in the configuration file:  
**E2ESDIR:** The GHI-S2S forecast directory where the S2S forecast resides that must contain the above configuration file.  
**LISFDIR:** The path to LISF installation. 

The **ghis2s** package provides a Python script, [*run_s2s_fcast.py*](https://github.com/smahanam/LISF-1/blob/parallelizing/lis/utils/usaf/S2S/ghis2s/cylc_script/run_s2s_fcast.py) , for importing **ghis2s** and executing monthly forecasts. Users are welcome to copy **run_s2s_fcast.py** into their working directories and modify it as needed.  

*The following description uses the S2S forecast initialized on January 1, 2025 as an example.*  
  
## 1) Setting up the Forecast Experiment
### a) Check E2ESDIR Directory
i) Ensure **E2ESDIR** and **LISFDIR** in the s2s_config_global_fcast configuration file are correct.  
ii) Ensure **hindcast** directory and the land initial conditions are available and linked.

### b) Set the up Working directory
i) Copy **run_s2s_fcast.py** to your working directory directory and edit *E2ESDIR* as needed.  
ii) Load the LISF Python module and set the ENVIRONMENT variable PYTHONPATH
```
on Discover e.g.
module use -a {LISFDIR}/env/discover/
module --ignore-cache load lisf_7.5_intel_2023.2.1_s2s
     
export PYTHONPATH={LISFDIR}/lis/utils/usaf/S2S/  
OR  
setenv PYTHONPATH {LISFDIR}/lis/utils/usaf/S2S/
```
### c) Test the Script
To display options, run:
``` python run_s2s_fcast.py -h ```
This will print:
```
usage: run_s2s_fcast.py [-h] -c CONFIG_FILE -y YEAR -m MONTH -e EMAIL [-s STEP] [-o] [-j]

options:
  -h, --help            show this help message and exit
  -c CONFIG_FILE, --config_file CONFIG_FILE
                        config file
  -y YEAR, --year YEAR  forecast year
  -m MONTH, --month MONTH
                        forecast month
  -e EMAIL, --email EMAIL
                        user email
  -s STEP, --step STEP  S2S step: LISDA, LDTICS, BCSD, FCST, POST, METRICS or PLOTS
  -o, --one_step        Is only one step (default: False)?
  -j, --submit_job      Submit SLURM jobs (default: False -> CYLC)?
  
Note: CONFIG_FILE, YEAR, MONTH and EMAIL are input mandatory arguments.  
```  

## 2) Creating Working Directories, and Job Files for the Forecast Month
Run the following command to initialize the forecast environment:  
  
```python run_s2s_fcast.py -y 2025 -m 1 -c s2s_config_global_fcast -e USER_EMAIL```  

This command performs the following:

**(1) Directories and links:**   
This step will create the main run-directory (scratch/202501), and 7 run-directories for the seven steps: lis_darun, ldt_ics, bcsd_fcst, lis_fcst, s2spost, s2smetric, and s2splots under the main run-directory. For example:  
*https://github.com/smahanam/FileSharing/tree/main/E2ESDIR/scratch/202501*  
  
**(2) Bash job scripts:**   
Each run-directory will be populated with two separate sets of bash job scripts for each task (approximately 50 jobs per forecast). The distribution of jobs per each step is as follows:  
lis_darun: 1; ldt_ics: 1; bcsd_fcst: 15; lis_fcst: 25; s2spost: 2; s2smetric: 3; and s2splots: 3.  
  
**\*.j files:** These are used with the SLURM job management system.    
**\*.sh files:** These contain NO SLURM directives, and are designed for **Cylc**. For example:  
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/s2spost/s2spost_01_run.sh*  
  
**(3) Cylc implementation:** This step will also generate the **CYLC_workflow.rc** file for **Cylc** implementation which defines directives, environmental variables, task dependencies, and the order of execution of job files. For example:  
*https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/CYLC_workflow.rc*  

### Optional Features
**i) -s STEP**  
The STEP option allows the user to resume the process from the last completed step of the seven E2ES steps.  
-s STEP directs **run_s2s_fcast.py** to start from a specific STEP (valid inputs: LISDA, LDTICS, BCSD, FCST, POST, METRICS or PLOTS).  
**ii) -s STEP -o**  
*-o* flag used to run only the above -s STEP, the process will exit upon completion of above STEP.  
**iii) -j** for SLURM submission  
*-j* flag is used to submit jobs to the SLURM system.

## 3) Running s2s_run  
| Cylc | SLURM |
|------| ------|
|Cylc will need to execute *sh files in the order as specified in [**CYLC_workflow.rc**](https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/CYLC_workflow.rc)|**Command line**| 
||```python s2s_app/s2s_run.py -y 2025 -m 1 -c s2s_config_global_fcst -j ```  |
||**from a Python program**|
||```from ghis2s.s2s_app.s2s_run import S2Srun``` | 
||```# initialize S2Srun``` |
||```s2s = S2Srun(year=2025, month=1, config_file='s2s_config_global_fcast')```|
||```# run S2Srun```|
||```s2s.main()```|
||```s2s.submit_jobs()```|  
|| This command will submit all generated job scripts (~50 \*.j files) to the SLURM system. The jobs will be executed according to their predefined workflow dependencies.| 
|| For example: *https://github.com/smahanam/FileSharing/blob/main/E2ESDIR/scratch/202501/SLURM_JOB_SCHEDULE*|




