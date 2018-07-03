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
      position: 5
      prefix: '-R'
  - id: INPUT
    type: File
    inputBinding:
      position: 3
      prefix: '-I'
  - id: output
    type: string
    inputBinding:
      position: 4
      prefix: '-o'
  - id: java_args
    type: string
    inputBinding:
      position: 0
      prefix: ''
      shellQuote: false
  - id: gatk_jar
    type: File
    inputBinding:
      position: 1
      prefix: '-jar'
  - id: BQSR
    type: File?
    inputBinding:
      position: 6
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
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:license': ''
'sbg:toolAuthor': ''
'sbg:toolkit': GATK
'sbg:toolkitVersion': PrintReads
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
