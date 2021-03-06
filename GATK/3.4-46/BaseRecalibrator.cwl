class: CommandLineTool
cwlVersion: v1.0


label: GATK BaseRecalibrator.
doc:  GATK-BaseRecalibrator

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'BaseRecalibrator'}
    - {prefix: '--out', position: 5, valueFrom: $(inputs.input.nameroot).recall.table}


inputs:
    gatk_jar:
        type: File
        inputBinding:
            position: 3
            prefix: '-jar'
    input:
        type: File
        secondaryFiles: ^.bai
        inputBinding:
            position: 6
            prefix: '-I'
    known:
        type: File[]?   
        inputBinding:
            separate: false
            prefix: '--knownSites'
            position: 28

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
    BQSR:
        type: File?
        inputBinding:
            position: 6
            prefix: '-BQSR'
  
outputs:
    recall_table:
        type: File
        outputBinding:
          glob: $(inputs.input.nameroot).recall.table
