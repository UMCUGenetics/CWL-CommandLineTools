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
    type: File
    inputBinding:
      position: 1
      prefix: '-jar'
  - id: Reference
    type: File
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
      position: 7
      prefix: '-plots'
  - id: BQSR
    type: File?
    inputBinding:
      position: 6
      prefix: '-BQSR'
  - id: csv
    type: string?
    inputBinding:
      position: 5
      prefix: '-csv'
outputs:
  - id: output_pdf
    type: File?
    outputBinding:
      glob: $(inputs.plots)
    secondaryFiles: []
  - id: output_csv
    type: File?
    outputBinding:
      glob: $(inputs.csv)
label: GATK-AnalyzeCovariats
arguments:
  - position: 2
    prefix: '-T'
    shellQuote: false
    valueFrom: AnalyzeCovariates
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': MIT
