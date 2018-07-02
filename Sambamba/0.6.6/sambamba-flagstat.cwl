class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: sambamba_flagstat
baseCommand:
  - sambamba
  - flagstat
inputs:
  - 'sbg:altPrefix': '--threads'
    'sbg:toolDefaultValue': '1'
    id: threads
    type: int?
    inputBinding:
      position: 0
      prefix: '-t'
    doc: Number of threads
  - id: progress
    type: boolean?
    inputBinding:
      position: 1
      prefix: '-p'
  - id: bam_in
    type: File
    inputBinding:
      position: 2
  - id: prefix
    type: string
    inputBinding:
      position: 3
outputs:
  - id: flagstats
    type: stdout
stdout: $(inputs.prefix + '.flagstat')
requirements:
  - class: InlineJavascriptRequirement
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
