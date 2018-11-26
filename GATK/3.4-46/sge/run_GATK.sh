#!/bin/bash

## Submission parameters
#$ -q all.q
#$ -e VC.err
#$ -V
#$ -cwd
#$ -pe threaded 10
#$ -l h_vmem=40G
#$ -M t.schafers@umcutrecht.nl
#$ -m beas

#/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../SplitNCigarReads.cwl ../yml/SplitNCigarReads.yml
#/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../RealignerTargetCreator.cwl ../yml/RealignerTargetCreator.yml
#/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../IndelRealigner.cwl ../yml/IndelRealigner.yml
#/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../BaseRecalibrator.cwl ../yml/BaseRecalibrator-BQSR.yml
#/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../AnalyzeCovariates.cwl ../yml/AnalyzeCovariates.yml
/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../PrintReads.cwl ../yml/PrintReads.yml
