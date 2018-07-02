class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - java
inputs:
  - id: barcodeTag
    type: string?
    inputBinding:
      position: 10
      prefix: BARCODE_TAG=
    doc: Barcode SAM tag (ex. BC for 10X Genomics) Default value null
  - id: comment
    type: 'File[]?'
    inputBinding:
      position: 17
    doc: >-
      Comment(s) to include in the output files header. Default value null. This
      option may be specified 0 or more times
  - default: 'true'
    id: createIndex
    type: string?
    inputBinding:
      position: 20
      prefix: CREATE_INDEX=
    doc: >-
      Whether to create a BAM index when writing a coordinate-sorted BAM file.
      Default value false. This option can be set to 'null' to clear the default
      value. Possible values {true, false}
  - id: groupCommandLine
    type: string?
    inputBinding:
      position: 15
      prefix: PROGRAM_GROUP_COMMAND_LINE=
    doc: >-
      Value of CL tag of PG record to be created. If not supplied the command
      line will be detected automatically. Default value null
  - id: groupCommandName
    type: string?
    inputBinding:
      position: 16
      prefix: PROGRAM_GROUP_NAME=
    doc: >-
      Value of PN tag of PG record to be created. Default value MarkDuplicates.
      This option can be set to 'null' to clear the default value
  - id: groupVersion
    type: string?
    inputBinding:
      position: 14
      prefix: PROGRAM_GROUP_VERSION=
    doc: >-
      Value of VN tag of PG record to be created. If not specified, the version
      will be detected automatically. Default value null
  - id: inputFileName_markDups
    type: 'File[]'
    inputBinding:
      position: 4
      prefix: INPUT=
    doc: >-
      One or more input SAM or BAM files to analyze. Must be coordinate sorted.
      Default value null. This option may be specified 0 or more times
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - id: maxFileHandles
    type: int?
    inputBinding:
      position: 8
      prefix: MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=
    doc: >-
      Maximum number of file handles to keep open when spilling read ends to
      disk. Set this number a little lower than the per-process maximum number
      of file that may be open. This number can be found by executing the
      'ulimit -n' command on a Unix system. Default value 8000. This option can
      be set to 'null' to clear the default value
  - id: metricsFile
    type: string?
    inputBinding:
      position: 6
      prefix: METRICS_FILE=
    doc: File to write duplication metrics to Required
  - id: outputFileName_markDups
    type: string
    inputBinding:
      position: 5
      prefix: OUTPUT=
    doc: The output file to write marked records to Required
  - id: pixelDistance
    type: int?
    inputBinding:
      position: 19
      prefix: OPTICAL_DUPLICATE_PIXEL_DISTANCE=
    doc: >-
      The maximum offset between two duplicte clusters in order to consider them
      optical duplicates. This should usually be set to some fairly small number
      (e.g. 5-10 pixels) unless using later versions of the Illumina pipeline
      that multiply pixel values by 10, in which case 50-100 is more normal.
      Default value 100. This option can be set to 'null' to clear the default
      value
  - id: readOneBarcodeTag
    type: string?
    inputBinding:
      position: 11
      prefix: READ_ONE_BARCODE_TAG=
    doc: Read one barcode SAM tag (ex. BX for 10X Genomics) Default value null
  - id: readSorted
    type: string?
    inputBinding:
      position: 22
      prefix: ASSUME_SORTED=
    doc: >-
      If true, assume that the input file is coordinate sorted even if the
      header says otherwise. Default value false. This option can be set to
      'null' to clear the default value. Possible values {true, false}
  - id: readTwoBarcodeTag
    type: string?
    inputBinding:
      position: 12
      prefix: READ_TWO_BARCODE_TAG=
    doc: Read two barcode SAM tag (ex. BX for 10X Genomics) Default value null
  - id: recordId
    type: string?
    inputBinding:
      position: 13
      prefix: PROGRAM_RECORD_ID=
    doc: >-
      The program record ID for the @PG record(s) created by this program. Set
      to null to disable PG record creation. This string may have a suffix
      appended to avoid collision with other program record IDs. Default value
      MarkDuplicates. This option can be set to 'null' to clear the default
      value
  - id: regularExpression
    type: string?
    inputBinding:
      position: 18
      prefix: READ_NAME_REGEX=
    doc: >-
      Regular expression that can be used to parse read names in the incoming
      SAM file. Read names are parsed to extract three variables tile/region, x
      coordinate and y coordinate. These values are used to estimate the rate of
      optical duplication in order to give a more accurate estimated library
      size. Set this option to null to disable optical duplicate detection. The
      regular expression should contain three capture groups for the three
      variables, in order. It must match the entire read name. Note that if the
      default regex is specified, a regex match is not actually done, but
      instead the read name is split on colon character. For 5 element names,
      the 3rd, 4th and 5th elements are assumed to be tile, x and y values. For
      7 element names (CASAVA 1.8), the 5th, 6th, and 7th elements are assumed
      to be tile, x and y values. Default value
      [a-zA-Z0-9]+:[0-9]:([0-9]+):([0-9]+):([0-9]+).*. This option can be set to
      'null' to clear the default value
  - id: removeDuplicates
    type: string?
    inputBinding:
      position: 7
      prefix: REMOVE_DUPLICATES=
    doc: >-
      If true do not write duplicates to the output file instead of writing them
      with appropriate flags set. Default value false. This option can be set to
      'null' to clear the default value. Possible values {true, false}
  - id: sortRatio
    type: double?
    inputBinding:
      position: 9
      prefix: SORTING_COLLECTION_SIZE_RATIO=
    doc: >-
      This number, plus the maximum RAM available to the JVM, determine the
      memory footprint used by some of the sorting collections. If you are
      running out of memory, try reducing this number. Default value 0.25. This
      option can be set to 'null' to clear the default value
  - id: tmpdir
    type: string?
    inputBinding:
      position: 21
      prefix: TMP_DIR=
    doc: Default value null. This option may be specified 0 or more times.
outputs:
  - id: markDups_output
    type: File
    outputBinding:
      glob: $(inputs.outputFileName_markDups)
  - id: markDups_output_index
    type: File
    outputBinding:
      glob: $("*.bai")
arguments:
  - position: 2
    prefix: '-jar'
    shellQuote: false
    valueFrom: /Users/tschafers/jar/picard.jar
  - position: 4
    valueFrom: VALIDATION_STRINGENCY=SILENT
  - position: 3
    prefix: ''
    shellQuote: false
    valueFrom: MarkDuplicates
requirements:
  - class: ShellCommandRequirement
  - class: InlineJavascriptRequirement
'sbg:toolkit': Picard
'sbg:toolAuthor': 'Farah Zaib Khan, Sehrish Kanwal'
'sbg:license': Apache 2.0
'sbg:wrapperAuthor': ''
'sbg:wrapperLicense': ''
'sbg:toolkitVersion': MarkDuplicates
