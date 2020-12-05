Follow these steps
1. Extract these files and copy them to your account in the remote host server.
2. sdesample_dvs.txt is the SDE file and sdevice_des.txt is the Sdevice file. Change the file types of these two files 
from .txt to .cmd.
3. Open SDE 
4. Go to File->Import. Open the sdesample_dvs.cmd file. Your structure is built. The final tdr file is sdesamplescript_msh.tdr.
5. Open Tecplot_sv to visualize the structure. 
6. Now run the sdevice file by typing "sdevice sdevice_des.cmd"
7. Visualize the output .tdr files(in Tecplot/Svisual) and .plt files(in Inspect) to check results. 

Commands to run the files from terminal
Note : The three files: sdesample_dvs.cmd , sdevice_des.cmd, models.par should be in the same directory
1. To create the structure,
   sde -e -l sdesample_dvs.cmd 
2. To run the device file
   sdevice sdevice_des.cmd