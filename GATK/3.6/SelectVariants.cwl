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
  - default: '-Xmx8g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - default: '-Djava.io.tmpdir=/tmp'
    id: java_tmp
    type: string?
  - default: selected.indels.vcf
    id: output_filename
    type: string
    inputBinding:
      position: 8
      prefix: '-o'
  - id: raw_vcf
    type: File
    inputBinding:
      position: 6
      prefix: '-V'
    doc: input vcf File raw variant calls from haplotype caller
  - id: reference
    type: File
    inputBinding:
      position: 5
      prefix: '-R'
    doc: reference genome
    secondaryFiles:
      - .fai
      - ^.dict
  - default: INDEL
    id: select_type
    type: string
    inputBinding:
      position: 7
      prefix: '-selectType'
outputs:
  - id: output_File
    doc: the selected variants as a vcf file
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
doc: |
  GATK-SelectVariants.cwl is developed for CWL consortium

  Usage:
  ```
  java -Xmx8G \
        -jar gatk.jar
        -T SelectVariants \
        -R reference.fa \
        -V raw_HC_variants.vcf \
        -selectType INDEL \
        -o raw_indels.vcf
  ```
arguments:
  - position: 4
    prefix: '-T'
    valueFrom: SelectVariants
hints:
  - class: EnvVarRequirement
    envDef:
      - envName: PATH
        envValue: '/usr/local/bin/:/usr/bin:/bin'
requirements:
  - class: InlineJavascriptRequirement
'sbg:toolkit': GATK
'sbg:toolAuthor': h3abionet
'sbg:license': Apache 2.0
'sbg:toolkitVersion': SelectVariants
'sbg:wrapperAuthor': ''
