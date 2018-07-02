class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: sambamba_index
baseCommand:
  - sambamba
  - index
inputs:
  - 'sbg:altPrefix': '--show-progress'
    id: progress
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-p'
    doc: Show progress
  - 'sbg:toolDefaultValue': '1'
    'sbg:altPrefix': '--nthreads'
    id: threads
    type: int?
    inputBinding:
      position: 1
      prefix: '-t'
    doc: Number of threads
  - id: in_bam
    type: File
    inputBinding:
      position: 2
    doc: input bam file
    'sbg:fileTypes': .bam
  - id: out_bai
    type: string
    inputBinding:
      position: 3
outputs:
  - id: output
    type: File
    outputBinding:
      glob: $(inputs.out_bai)
doc: sambamba index
label: sambamba-index
requirements:
  - class: InlineJavascriptRequirement
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
