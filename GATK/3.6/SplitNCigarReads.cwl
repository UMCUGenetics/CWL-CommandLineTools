class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: gatk_splitncigarreads
baseCommand:
  - java
inputs:
  - id: java_args
    type: string
    inputBinding:
      position: 0
  - id: gatk_jar
    type: File
    inputBinding:
      position: 2
      prefix: '-jar'
      shellQuote: false
  - id: Reference
    type: File
    inputBinding:
      position: 4
      prefix: '-R'
  - id: INPUT
    type: File
    inputBinding:
      position: 5
      prefix: '-I'
  - id: OUTPUT
    type: string
    inputBinding:
      position: 6
      prefix: '-o'
  - id: N_CIGAR
    type: string
    inputBinding:
      position: 11
      prefix: '-U'
  - id: rf
    type: string?
    inputBinding:
      position: 8
      prefix: '-rf'
  - id: RMQF
    type: int?
    inputBinding:
      position: 9
      prefix: '-RMQF'
  - id: RMQT
    type: int?
    inputBinding:
      position: 10
      prefix: '-RMQT'
outputs:
  - id: bam_out
    type: File?
    outputBinding:
      glob: $(inputs.OUTPUT)
label: GATK-SplitNCigarReads
arguments:
  - position: 3
    prefix: '-T'
    valueFrom: SplitNCigarReads
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:license': ''
'sbg:toolAuthor': ''
'sbg:toolkit': GATK
'sbg:toolkitVersion': SplitNCigarReads
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
