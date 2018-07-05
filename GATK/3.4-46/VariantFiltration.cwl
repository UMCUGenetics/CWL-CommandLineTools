#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: GATK VariantFiltration.

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', valueFrom: 'VariantFiltration', position: 4}
    - {prefix: '-nt', valueFrom: $(runtime.cores), position: 5}

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
    variant:
        type: File
        inputBinding:
            prefix: --variant
            position: 5
    out:
        type: string
        inputBinding:
            prefix: --out
            position: 5
    filterExpression:
        type: string
        inputBinding:
            prefix: --filterExpression
            position: 5
    filterName:
        type: string
        inputBinding:
            prefix: --filterName
            position: 5
    clusterSize:
        type: int?
        inputBinding:
            prefix: --clusterSize
            position: 5
    clusterWindowSize:
        type: int?
        inputBinding:
            prefix: --clusterWindowSize
            position: 5

outputs:
    output:
        type: File
        outputBinding:
            glob: $(inputs.out)
