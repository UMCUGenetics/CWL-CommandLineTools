class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: picard__add_or_replace_read_groups
baseCommand:
  - java
inputs:
  - id: input
    type: 'File[]'
    inputBinding:
      position: 3
      prefix: INPUT=
      separate: false
  - id: java_args
    type: string
    inputBinding:
      position: 1
  - id: output
    type: string
    inputBinding:
      position: 4
      prefix: OUTPUT=
      separate: false
  - id: SortOrder
    type: string?
    inputBinding:
      position: 6
      prefix: SORT_ORDER=
      separate: false
  - id: ReadGroupID
    type: string
    inputBinding:
      position: 7
      prefix: RGID=
      separate: false
  - id: ReadGroupLibrary
    type: string
    inputBinding:
      position: 8
      prefix: RGLB=
      separate: false
  - id: ReadGroupPlatform
    type: string
    inputBinding:
      position: 9
      prefix: RGPL=
      separate: false
  - id: ReadGroupPlatformUnit
    type: string
    inputBinding:
      position: 10
      prefix: RGPU=
      separate: false
  - id: ReadGroupSampleName
    type: string
    inputBinding:
      position: 11
      prefix: RGSM=
      separate: false
  - id: ReadGroupSequenceCenter
    type: string?
    inputBinding:
      position: 12
      prefix: RGCN=
      separate: false
  - id: ReadGroupDescription
    type: string?
    inputBinding:
      position: 13
      prefix: RGDS=
      separate: false
  - id: ReadGroupRunDate
    type: string?
    inputBinding:
      position: 14
      prefix: RGDT=
      separate: false
  - id: ReadGroupPredictedInsertSize
    type: string?
    inputBinding:
      position: 15
      prefix: RGPI=
      separate: false
  - id: ReadGroupProgramGroup
    type: string?
    inputBinding:
      position: 16
      prefix: RGPG=
      separate: false
  - id: ReadGroupPlatformModel
    type: string?
    inputBinding:
      position: 17
      prefix: RGPM=
      separate: false
  - id: CREATE_INDEX
    type: string
    inputBinding:
      position: 5
      prefix: CREATE_INDEX=
outputs:
  - id: out_bam
    type: File?
    outputBinding:
      glob: $(inputs.output)
doc: CWL implementation of Picard's AddOrReplaceReadGroups subcomand
label: picard-AddOrReplaceReadGroups
arguments:
  - position: 2
    prefix: '-jar'
    shellQuote: false
    valueFrom: /Users/tschafers/jar/picard.jar AddOrReplaceReadGroups
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:license': Apache 2.0
'sbg:toolAuthor': Tilman Schaefers
'sbg:toolkit': Picard
'sbg:toolkitVersion': AddOrReplaceReadGroups
'sbg:wrapperAuthor': ''
'sbg:wrapperLicense': MIT
