class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - java
inputs:
  - id: gatk_jar
    type: File
    inputBinding:
      position: 3
      prefix: '-jar'
  - id: inputBam_printReads
    type: File
    inputBinding:
      position: 6
      prefix: '-I'
    doc: bam file produced after indelRealigner
    secondaryFiles:
      - ^.bai
  - id: input_baseRecalibrator
    type: File
    inputBinding:
      position: 7
      prefix: '-BQSR'
    doc: the recalibration table produced by BaseRecalibration
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - id: number
    type: string?
    inputBinding:
      position: 13
      prefix: '--number'
    doc: Exclude all reads with this platform from the output
  - id: outputfile_printReads
    type: string?
    inputBinding:
      position: 8
      prefix: '-o'
    doc: name of the output file from indelRealigner
  - id: platform
    type: string?
    inputBinding:
      position: 13
      prefix: '--platform'
    doc: Exclude all reads with this platform from the output
  - id: readGroup
    type: string?
    inputBinding:
      position: 12
      prefix: '--readGroup'
    doc: Exclude all reads with this read group from the output
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
  - id: sample_file
    type: 'File[]?'
    inputBinding:
      position: 11
  - id: sample_name
    type: 'string[]?'
    inputBinding:
      position: 10
    doc: >-
      Sample name to be included in the analysis. Can be specified multiple
      times.
  - id: simplify
    type: boolean?
    inputBinding:
      position: 9
      prefix: '--simplify'
    doc: Erase all extra attributes in the read but keep the read group information
  - default: 4
    id: threads
    type: int
    inputBinding:
      position: 14
      prefix: '-nct'
outputs:
  - id: output_printReads
    type: File
    outputBinding:
      glob: $(inputs.outputfile_printReads)
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  Prints all reads that have a mapping quality above zero
    Usage: java -Xmx4g -jar GenomeAnalysisTK.jar -T PrintReads -R reference.fasta -I input1.bam -I input2.bam -o output.bam --read_filter MappingQualityZero
arguments:
  - position: 2
    prefix: '-Djava.io.tmpdir='
    separate: false
    valueFrom: ./test/test-files
  - position: 4
    prefix: '-T'
    valueFrom: PrintReads
requirements:
  - class: InlineJavascriptRequirement
