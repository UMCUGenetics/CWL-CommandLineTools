class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: gatk_reassignonemappingqualityfilter
baseCommand:
  - java
inputs:
  - id: Reference
    type: File
    inputBinding:
      position: 3
      prefix: '-R'
  - id: INPUT
    type: File
    inputBinding:
      position: 4
      prefix: '-I'
  - id: output
    type: string
    inputBinding:
      position: 5
      prefix: '-o'
  - id: rf
    type: string
    inputBinding:
      position: 6
      prefix: '-rf'
  - id: rmqf
    type: int
    inputBinding:
      position: 7
      prefix: '-RMQF'
  - id: RMQT
    type: int
    inputBinding:
      position: 8
      prefix: '-RMQT'
  - id: java_args
    type: string
    inputBinding:
      position: -7
      prefix: ''
  - id: gatk_jar
    type: File
    inputBinding:
      position: 0
      prefix: '-jar'
outputs:
  - id: bam_out
    type: File
    outputBinding:
      glob: $(inputs.output)
label: GATK-PrintReads
arguments:
  - position: 2
    prefix: '-T'
    valueFrom: PrintReads
requirements:
  - class: InlineJavascriptRequirement
'sbg:toolkit': GATK
'sbg:toolkitVersion': PrintReads
'sbg:toolAuthor': Tilman Schaefers
'sbg:license': BSD-2.0
