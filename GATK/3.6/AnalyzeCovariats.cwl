class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: _analyze_covariats
baseCommand:
  - java
inputs:
  - id: java_arg
    type: string
    inputBinding:
      position: 0
  - id: gatk_path
    type: File?
    inputBinding:
      position: 1
      prefix: '-jar'
  - id: Reference
    type: File?
    inputBinding:
      position: 3
      prefix: '-R'
    doc: Reference Genome
    'sbg:fileTypes': .fasta
  - id: before
    type: File?
    inputBinding:
      position: 4
      prefix: '-before'
    doc: Recall table before
    'sbg:fileTypes': .table
  - id: after
    type: File?
    inputBinding:
      position: 5
      prefix: '-after'
    doc: recall table 2nd pass
  - id: plots
    type: string?
    inputBinding:
      position: 6
      prefix: '-plots'
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: $(inputs.plots)
label: GATK-AnalyzeCovariats
arguments:
  - position: 2
    prefix: ''
    valueFrom: AnalyzeCovariates
requirements:
  - class: InlineJavascriptRequirement
