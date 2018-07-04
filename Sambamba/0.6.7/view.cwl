class: CommandLineTool
cwlVersion: v1.0

id: view
baseCommand:
   sambamba
   view
inputs:
  input_sam:
    type: File
    inputBinding:
      position: 3
      shellQuote: false
  output_bam_name:
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
      valueFrom: $(inputs.input_sam.nameroot + '.bam')
    default: bam
  format:
    type: string
    inputBinding:
      position: 2
      prefix: '--format'
      shellQuote: false
outputs:
  output_bam_file:
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
