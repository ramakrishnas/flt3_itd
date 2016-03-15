#!/bin/bash
if [ $# -lt 1 ]; then
  echo "Usage: $0 InputRun"
  exit 1
fi
InDir="$1"
OutDir="$2"

echo $InDir
echo $OutDir

folder_tmp=${InDir/Auto_user_/}
folder=${folder_tmp/AML_*/AML}

echo $folder_tmp
echo $folder

exon14_oligo='/Volumes/Pathology/Molecular Pathology/Active Validated Tests/Oncology/AML Panel/FLT3-ITD/flt3_ex14_oligo.fa'
result_dir='/Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/'

echo $result_dir$folder

cd /Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/

pwd

mkdir $folder

cd /Volumes/Iontorrent/$InDir/plugin_out/downloads/

for i in *.fastq; do 
    echo $i;
    usearch8.osx -search_oligodb $i -db /Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/flt3_ex14_oligo.fa \
    -strand both \
    -matched /Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/$folder/${i:0:13}_flt3_exon14.fa
 
done

#usearch8.osx -search_oligodb /Volumes/Iontorrent/Auto_user_MOL-370-AML_434_496/plugin_out/downloads/IonXpress_008.fastq -db /Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/flt3_ex14_oligo.fa -strand both -matched /Volumes/Pathology/Molecular\ Pathology/Active\ Validated\ Tests/Oncology/AML\ Panel/FLT3-ITD/R370/R370_bc008_flt3_exon14.fa &

#velveth "$DIR" "$KVALUE" -shortPaired -fmtAuto -separate "$LEFT" "$RIGHT"
#velvetg "$DIR" -exp_cov auto -cov_cutoff auto -very_clean yes
echo "Results are in: $result_dir$folder" 

