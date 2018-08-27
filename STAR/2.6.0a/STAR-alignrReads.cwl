class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: _s_t_a_r_alignr_reads
baseCommand:
  - STAR
inputs:
  - id: fastq1
    type: File?
    inputBinding:
      position: 2
      prefix: '--readFilesIn'
  - id: fastq2
    type: File?
    inputBinding:
      position: 3
      prefix: ''
  - id: genomeDir
    type: Directory?
    inputBinding:
      position: 4
      prefix: '--genomeDir'
  - id: outSamType
    type: string?
    inputBinding:
      position: 4
      prefix: '--outSAMtype'
      shellQuote: false
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: Aligned.sortedByCoord.out.bam
    secondaryFiles:
      - .out
      - .tab
label: STAR-alignReads
arguments:
  - position: 0
    prefix: '--runMode'
    valueFrom: alignReads
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'scidap/star:v2.5.0b'
