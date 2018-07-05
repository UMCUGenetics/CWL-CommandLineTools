#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: GATK RealignerTargetCreator.
doc: Define intervals to target for local realignment.

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'RealignerTargetCreator'}
    - {prefix: '-nt', position: 5, valueFrom: $(runtime.cores)}

inputs:
    gatk_jar:
        type: File
        inputBinding:
            prefix: -jar
            position: 3
    reference_sequence:
        type: File
        secondaryFiles:
            - .fai
            - ^.dict
        inputBinding:
            prefix: --reference_sequence
            position: 5
    input:
        type: File
        secondaryFiles:
            - .bai
        inputBinding:
            prefix: --input_file
            position: 5
    out:
        type: string
        default: $(inputs.input.nameroot).IndelRealigner.intervals
        inputBinding:
            prefix: --out
            position: 5
    known:
        type: File[]?
        inputBinding:
            prefix: --known
            position: 5
        doc: Input VCF file(s) with known indels.

outputs:
    output_intervals:
        type: File
        outputBinding:
            glob: $(inputs.out)
