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
  - 'sbg:altPrefix': '--nthreads'
    'sbg:toolDefaultValue': '1'
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
      valueFrom: $(self.path)
    doc: input bam file
    'sbg:fileTypes': .bam
  - id: index
    type: File?
    inputBinding:
      position: 3
      valueFrom: $(inputs.in_bam.basename + '.bai')
outputs:
  - id: output
    type: File
    outputBinding:
      glob: $(inputs.index)
doc: sambamba index
label: sambamba-index
requirements:
  - class: InlineJavascriptRequirement
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
