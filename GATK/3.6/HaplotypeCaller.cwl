class: CommandLineTool
cwlVersion: v1.0

baseCommand:
  - java
  - '-d64'
  - '-jar'
  - /usr/GenomeAnalysisTK.jar
  - '--analysis_type'
  - HaplotypeCaller
inputs:
  - id: outputfile_HaplotypeCaller
    type: string?
    inputBinding:
      position: 8
      prefix: '-o'
    doc: name of the output file from HaplotypeCaller 

  - id: inputBam_HaplotypeCaller
    type: File?
    inputBinding:
      position: 6
      prefix: '-I'
    doc: bam file produced after printReads
    secondaryFiles:
      - ^.bam.bai
  - id: reference
    type: File?
    inputBinding:
      position: 5
      prefix: '-R'
    secondaryFiles:
      - .fai
      - ^.dict

outputs:
  - id: output_HaplotypeCaller
    type: File?
    outputBinding:
      glob: $(inputs.outputfile_HaplotypeCaller)
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  Call germline SNPs and indels via local re-assembly of haplotypes
requirements:
  - class: DockerRequirement
    dockerPull: 'broadinstitute/gatk3:3.8-0'
  - class: InlineJavascriptRequirement
