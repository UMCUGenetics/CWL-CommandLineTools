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
    output_zip:
        type: File
        outputBinding:
            glob: $(inputs.fastq_file.nameroot).zip
    output_html:
        type: File
        outputBinding:
            glob: $(inputs.fastq_file.nameroot).html
