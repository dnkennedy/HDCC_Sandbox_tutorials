#!/bin/bash
wb_command='/shared/hackathon/working-area/workbench/workbench_rh/bin_rh_linux64/wb_command'
results_folder=$1
fileroot=$2
for file in `ls ${results_folder}/*${fileroot}_PC*.tsv` ; do
  PCnumtemp=`echo $file | awk -FPC '{print $3}'`
  PCnum=`echo $PCnumtemp | awk -F. '{print $1}'`
  ${wb_command} -cifti-convert -from-text ${file} $PWD/template_anon_Gordon_Connectivity_Matrix.pconn.nii ${results_folder}/${fileroot}_PC${PCnumtemp}.pconn.nii
  done
for file in `ls ${results_folder}/*${fileroot}_ROI-sum-weight_PC*.tsv` ; do
  PCnumtemp=`echo $file | awk -FPC '{print $3}'`
  PCnum=`echo $PCnumtemp | awk -F. '{print $1}'`
  ${wb_command} -cifti-convert -from-text ${file} $PWD/template_anon_anon_Gordon_Scalar.pscalar.nii ${results_folder}/${fileroot}_ROI-sum-weight_PC${PCnumtemp}.pscalar.nii
  done
