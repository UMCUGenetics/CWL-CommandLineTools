class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - SURVIVOR
  - simSV
inputs:
  - id: Parameter_file
    type: File
    inputBinding:
      position: 2
  - id: Reference_file
    type: File
    inputBinding:
      position: 1
  - id: output_prefix
    type: string
    inputBinding:
      position: 5
  - id: read_type
    type: int
    inputBinding:
      position: 4
  - id: snp_mutation_freq
    type: int
    inputBinding:
      position: 3
outputs:
  - id: fasta_out
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).fasta
  - id: bed_out
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).bed
  - id: vcf_out
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).vcf
requirements:
  - class: InlineJavascriptRequirement
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
