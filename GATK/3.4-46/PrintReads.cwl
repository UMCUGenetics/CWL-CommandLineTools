class: CommandLineTool
cwlVersion: v1.0

label: GATK-PrintReads

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'PrintReads'}
    - {prefix: '-nt', position: 5, valueFrom: $(runtime.cores)}
    - {prefix: '--out', position: 5, valueFrom: $(inputs.input.nameroot).PrintReads.bam}

inputs:
    
    gatk_jar:
        type: File
        inputBinding:
            position: 3
            prefix: '-jar'

    input:
        type: File
        inputBinding:
            position: 6
            prefix: '-I'
        secondaryFiles:
          - ^.bai

    recall_table:
        type: File
        inputBinding:
            position: 7
            prefix: '-BQSR'

    reference_sequence:
        type: File
        inputBinding:
            position: 5
            prefix: '-R'
        secondaryFiles:
          - .amb
          - .ann
          - .bwt
          - .pac
          - .sa
          - .fai
          - ^.dict




outputs:
    output_printReads:
      type: File
      outputBinding:
        glob: $(inputs.input.nameroot).PrintReads.bam

