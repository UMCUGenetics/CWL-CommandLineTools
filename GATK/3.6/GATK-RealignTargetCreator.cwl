class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
baseCommand:
  - java
inputs:
  - id: gatk_jar
    type: File
    inputBinding:
      position: 1
      prefix: '-jar'
  - id: inputBam_realign
    type: File
    inputBinding:
      position: 5
      prefix: '-I'
      shellQuote: false
    doc: |
      bam file produced after mark-duplicates execution
    secondaryFiles:
      - ^.bai
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 0
  - id: known
    type:
      - 'null'
      - type: array
        items: File
        inputBinding:
          prefix: '--known'
    inputBinding:
      position: 8
    doc: >
      Any number of VCF files representing known SNPs and/or indels. Could be
      e.g. dbSNP and/or official 1000 Genomes indel calls. SNPs in these files
      will be ignored unless the --mismatchFraction argument is used. optional
      parameter.
  - id: maxIntervalSize
    type: int?
    inputBinding:
      position: 10
      prefix: '--maxIntervalSize'
    doc: >
      maximum interval size; any intervals larger than this value will be
      dropped. optional paramter
  - id: minReadsAtLocus
    type: int?
    inputBinding:
      position: 12
      prefix: '--minReadsAtLocus'
    doc: |
      minimum reads at a locus to enable using the entropy calculation
  - id: mismatchFraction
    type: int?
    inputBinding:
      position: 12
      prefix: '--mismatchFraction'
    doc: >
      fraction of base qualities needing to mismatch for a position to have high
      entropy
  - id: outputfile_realignTarget
    type: string
    inputBinding:
      position: 7
      prefix: '-o'
    doc: |
      name of the output file from realignTargetCreator
  - id: reference
    type: File
    inputBinding:
      position: 5
      prefix: '-R'
    doc: |
      human reference sequence along with the secondary files.
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
      - ^.dict
  - default: 4
    id: threads
    type: int
    inputBinding:
      position: 17
      prefix: '-nt'
  - id: windowSize
    type: int?
    inputBinding:
      position: 13
      prefix: '--windowSize'
    doc: |
      window size for calculating entropy or SNP clusters
outputs:
  - id: output_realignTarget
    type: File
    outputBinding:
      glob: $(inputs.outputfile_realignTarget)
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
    It accepts 3 input files and produces a file containing list of target intervals to pass to the IndelRealigner.
    Usage: java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator -R reference.fasta -I input.bam --known indels.vcf -o forIndelRealigner.intervals.
arguments:
  - position: 4
    prefix: '-T'
    valueFrom: RealignerTargetCreator
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
