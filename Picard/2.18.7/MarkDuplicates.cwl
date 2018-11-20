class: CommandLineTool
cwlVersion: v1.0

label: PICARD MarkDuplicates.




arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {position: 4, valueFrom: 'MarkDuplicates'}
    - {prefix: 'VALIDATION_STRINGENCY=', separate: false, position: 5, valueFrom: 'SILENT'}
    - {prefix: 'CREATE_INDEX=', position: 6, separate: false, valueFrom: 'true'}
    - {prefix: 'METRICS_FILE=',position: 7, separate: false, valueFrom: $(inputs.input.nameroot).metrics.txt}
    - {prefix: 'OUTPUT=',  position: 8, separate: false, valueFrom: $(inputs.input.nameroot).mdup.bam}
    - {prefix: 'REMOVE_DUPLICATES=', position: 9, separate: false, valueFrom: 'true' }

baseCommand: java

inputs:
    picard_jar:
      type: File?
      inputBinding:
          position: 3
          prefix: '-jar'
    input:
      type: File[]
      inputBinding:
          position: 10
          prefix: INPUT=
 
    tmpdir:
      type: string?
      inputBinding:
          position: 11
          prefix: TMP_DIR=

outputs:
    markDups_output:
      type: File
      outputBinding:
        glob: $(inputs.outputFileName_markDups)
      secondaryFiles: ^.bai
