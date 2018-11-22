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

/hpc/cog_bioinf/ridder/users/tschafers/miniconda3/envs/rnaseq/bin/cwltool --no-container ../alignReads.cwl ../alignReads.yml
