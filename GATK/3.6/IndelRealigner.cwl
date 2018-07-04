class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - java
inputs:
  - id: LODThresholdForCleaning
    type: double?
    inputBinding:
      position: 0
      prefix: '--LODThresholdForCleaning'
    doc: LOD threshold above which the cleaner will clean
  - id: bamout
    type: File?
    inputBinding:
      position: 0
      prefix: '--out'
    doc: The realigned bam file. Optional parameter
  - id: consensusDeterminationModel
    type: string?
    inputBinding:
      position: 0
      prefix: '--consensusDeterminationModel'
    doc: >-
      Percentage of mismatches at a locus to be considered having high entropy
      (0.0 < entropy <= 1.0)
  - id: entropyThreshold
    type: double?
    inputBinding:
      position: 0
      prefix: '--entropyThreshold'
    doc: >-
      Percentage of mismatches at a locus to be considered having high entropy
      (0.0 < entropy <= 1.0)
  - id: gatk_jar
    type: File
    inputBinding:
      position: 3
      prefix: '-jar'
  - id: inputBam_realign
    type: File
    inputBinding:
      position: 6
      prefix: '-I'
    doc: bam file produced after markDups execution
    secondaryFiles:
      - ^.bai
  - id: intervals
    type: File
    inputBinding:
      position: 7
      prefix: '-targetIntervals'
    doc: list of intervals created by realignerTargetCreataor
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - id: known
    type: 'File[]?'
    doc: >-
      Any number of VCF files representing known SNPs and/or indels. Could be
      e.g. dbSNP and/or official 1000 Genomes indel calls. SNPs in these files
      will be ignored unless the --mismatchFraction argument is used. optional
      parameter.
  - id: maxConsensuses
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxConsensuses'
    doc: >-
      Max alternate consensuses to try (necessary to improve performance in deep
      coverage)
  - id: maxIsizeForMovement
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxIsizeForMovement'
    doc: >-
      maximum insert size of read pairs that we attempt to realign. For expert
      users only!
  - id: maxPositionalMoveAllowed
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxPositionalMoveAllowed'
    doc: >-
      Maximum positional move in basepairs that a read can be adjusted during
      realignment. For expert users only!
  - id: maxReadsForConsensuses
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxReadsForConsensuses'
    doc: >-
      Max reads used for finding the alternate consensuses (necessary to improve
      performance in deep coverage)
  - id: maxReadsForRealignment
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxReadsForRealignment'
    doc: Max reads allowed at an interval for realignment
  - id: maxReadsInMemory
    type: int?
    inputBinding:
      position: 0
      prefix: '--maxReadsInMemory'
    doc: max reads allowed to be kept in memory at a time by the SAMFileWriter
  - id: nWayOut
    type: string?
    inputBinding:
      position: 0
      prefix: '--nWayOut '
    doc: >-
      Generate one output file for each input (-I) bam file (not compatible with
      -output). See the main page for more details.
  - id: noOriginalAlignmentTags
    type: boolean?
    inputBinding:
      position: 0
      prefix: '--noOriginalAlignmentTags'
    doc: >-
      Dont output the original cigar or alignment start tags for each realigned
      read in the output bam
  - id: outputfile_indelRealigner
    type: string
    inputBinding:
      position: 8
      prefix: '-o'
    doc: name of the output file from indelRealigner
  - id: reference
    type: File
    inputBinding:
      position: 5
      prefix: '-R'
    secondaryFiles:
      - .64.amb
      - .64.ann
      - .64.bwt
      - .64.pac
      - .64.sa
      - .fai
      - ^.dict
outputs:
  - id: output_indelRealigner
    type: File
    outputBinding:
      glob: $(inputs.outputfile_indelRealigner)
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  It performs local realignment of reads around indels.
    Usage: java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator -R reference.fasta -I input.bam --known indels.vcf -o forIndelRealigner.intervals.
arguments:
  - position: 2
    prefix: '-Djava.io.tmpdir='
    separate: false
    valueFrom: ./test/test-files
  - position: 4
    prefix: '-T'
    valueFrom: IndelRealigner
requirements:
  - class: InlineJavascriptRequirement
'sbg:toolAuthor': ''
'sbg:license': ''
