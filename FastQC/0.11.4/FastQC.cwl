#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: fastqc, generate fastqc reports from fastq files.

baseCommand: fastqc

arguments:
    - {prefix: "--threads", valueFrom: $(runtime.cores)}
    - {prefix: "--outdir", valueFrom: $(runtime.outdir)}

inputs:
    fastq_file:
        type: File
        inputBinding:
            position: 1

outputs:
    zip_file:
        type: File
        outputBinding:
            glob: '*_fastqc.zip'
    html_file:
        type: File
        outputBinding:
            glob: '*_fastqc.html'
