class: CommandLineTool
cwlVersion: v1.0

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {position: 4, valueFrom: 'AddOrReplaceReadGroups'}
    - {prefix: 'CREATE_INDEX=', position: 5, separate: false, valueFrom: 'true'}
    - {prefix: 'OUTPUT=',  position: 6, separate: false, valueFrom: $(inputs.input.nameroot).rg.bam}


baseCommand: java


inputs:
    picard_jar:
        type: File?
        inputBinding:
          position: 3
          prefix: '-jar'

    input:
        type: File
        inputBinding:
          position: 7
          prefix: INPUT=

    ReadGroupID:
        type: string
        inputBinding:
          position: 8
          prefix: RGID=

    ReadGroupLibrary:
        type: string
        inputBinding:
          position: 9
          prefix: RGLB=
    ReadGroupPlatform:
        type: string
        inputBinding:
          position: 10
          prefix: RGPL=

    ReadGroupPlatformUnit:
        type: string
        inputBinding:
          position: 11
          prefix: RGPU=

    ReadGroupSampleName:
        type: string
        inputBinding:
          position: 12
          prefix: RGSM=
  


outputs:
    out_bam:
        type: File?
        outputBinding:
          glob: $(inputs.input.nameroot).rg.bam
