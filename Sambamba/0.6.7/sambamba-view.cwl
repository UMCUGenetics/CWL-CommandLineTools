class: CommandLineTool
cwlVersion: v1.0

id: view
baseCommand:
  - sambamba
  - view
inputs:
  - id: input_sam
    type: File
    inputBinding:
      position: 3
      shellQuote: false
  - id: output_bam_name
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
      valueFrom: $(inputs.input_sam.nameroot + '.bam')
  - 'sbg:toolDefaultValue': bam
    id: format
    type: string
    inputBinding:
      position: 2
      prefix: '--format'
      shellQuote: false
outputs:
  - id: output_bam_file
    type: File
    outputBinding:
      glob: $(inputs.output_bam_name)
doc: CWL implementation of Sambamba view subcommand
label: sambamba view
arguments:
  - position: 1
    prefix: ''
    valueFrom: '-S'
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:license': ''
'sbg:toolAuthor': ''
'sbg:toolkit': Sambamba
'sbg:toolkitVersion': view
'sbg:wrapperAuthor': TIlman Schaefers
'sbg:wrapperLicense': MIT
