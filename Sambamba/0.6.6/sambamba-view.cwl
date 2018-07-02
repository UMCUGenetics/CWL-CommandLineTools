class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: sambamba_view
baseCommand:
  - sambamba
  - view
inputs:
  - id: input_sam
    type: File
    inputBinding:
      position: 3
      shellQuote: false
  - id: out_bam_name
    type: string?
    inputBinding:
      position: 5
      prefix: '-o'
      shellQuote: false
  - id: format
    type: string
    inputBinding:
      position: 2
      prefix: '--format'
      shellQuote: false
outputs:
  - id: out_bam
    type: File
    outputBinding:
      glob: $(inputs.out_bam_name)
doc: CWL implementation of Sambamba view subcommand
label: sambamba view
arguments:
  - position: 1
    prefix: ''
    valueFrom: '-S'
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:license': Apache 2.0
'sbg:toolAuthor': Tilman Schaefers
'sbg:toolkit': Sambamba
'sbg:wrapperAuthor': ''
'sbg:wrapperLicense': ''
'sbg:toolkitVersion': view
