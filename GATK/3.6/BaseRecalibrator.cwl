class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - java
inputs:
  - id: binary_tag_name
    type: string?
    inputBinding:
      position: 27
      prefix: '--binary_tag_name'
    doc: the binary tag covariate name if using it
  - id: bqsrBAQGapOpenPenalty
    type: double?
    inputBinding:
      position: 26
      prefix: '--bqsrBAQGapOpenPenalty'
    doc: >-
      BQSR BAQ gap open penalty (Phred Scaled). Default value is 40. 30 is
      perhaps better for whole genome call sets
  - id: covariate
    type:
      - 'null'
      - type: array
        items: string
        inputBinding:
          prefix: '--covariate'
    inputBinding:
      position: 25
    doc: >-
      One or more covariates to be used in the recalibration. Can be specified
      multiple times
  - id: deletions_default_quality
    type: int?
    inputBinding:
      position: 24
      prefix: '--deletions_default_quality'
    doc: default quality for the base deletions covariate
  - id: gatk_jar
    type: File
    inputBinding:
      position: 3
      prefix: '-jar'
  - id: indels_context_size
    type: int?
    inputBinding:
      position: 23
      prefix: '--indels_context_size'
    doc: Size of the k-mer context to be used for base insertions and deletions
  - id: inputBam_BaseRecalibrator
    type: File
    inputBinding:
      position: 6
      prefix: '-I'
    doc: bam file produced after indelRealigner
    secondaryFiles:
      - ^.bai
  - id: insertions_default_quality
    type: int?
    inputBinding:
      position: 22
      prefix: '--insertions_default_quality'
    doc: default quality for the base insertions covariate
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - id: known
    type:
      - 'null'
      - type: array
        items: File
        inputBinding:
          prefix: '--knownSites'
    inputBinding:
      position: 28
    doc: >-
      Any number of VCF files representing known SNPs and/or indels. Could be
      e.g. dbSNP and/or official 1000 Genomes indel calls. SNPs in these files
      will be ignored unless the --mismatchFraction argument is used. optional
      parameter.
  - id: list
    type: boolean?
    inputBinding:
      position: 21
      prefix: '--list'
    doc: List the available covariates and exit
  - id: lowMemoryMode
    type: boolean?
    inputBinding:
      position: 19
      prefix: '--lowMemoryMode'
    doc: >-
      Reduce memory usage in multi-threaded code at the expense of threading
      efficiency
  - id: low_quality_tail
    type: int?
    inputBinding:
      position: 20
      prefix: '--low_quality_tail'
    doc: minimum quality for the bases in the tail of the reads to be considered
  - id: maximum_cycle_value
    type: int?
    inputBinding:
      position: 18
      prefix: '--maximum_cycle_value'
    doc: The maximum cycle value permitted for the Cycle covariate
  - id: mismatches_context_size
    type: int?
    inputBinding:
      position: 17
      prefix: '--mismatches_context_size'
    doc: Size of the k-mer context to be used for base mismatches
  - id: mismatches_default_quality
    type: int?
    inputBinding:
      position: 16
      prefix: '--mismatches_default_quality'
    doc: default quality for the base mismatches covariate
  - id: no_standard_covs
    type: boolean?
    inputBinding:
      position: 15
      prefix: '--no_standard_covs'
    doc: >-
      Do not use the standard set of covariates, but rather just the ones listed
      using the -cov argument
  - id: out
    type: File?
    inputBinding:
      position: 14
      prefix: '--out'
    doc: The output recalibration table file to create
  - id: outputfile_BaseRecalibrator
    type: string
    inputBinding:
      position: 8
      prefix: '-o'
    doc: name of the output file from baseRecalibrator
  - id: quantizing_levels
    type: boolean?
    inputBinding:
      position: 13
      prefix: '--quantizing_levels'
    doc: >-
      Sort the rows in the tables of reports. Whether GATK report tables should
      have rows in sorted order, starting from leftmost column
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
  - id: run_without_dbsnp_potentially_ruining_quality
    type: boolean?
    inputBinding:
      position: 12
      prefix: '--run_without_dbsnp_potentially_ruining_quality'
    doc: >-
      If specified, allows the recalibrator to be used without a dbsnp rod. Very
      unsafe and for expert users only.
  - id: solid_nocall_strategy
    type: string?
    inputBinding:
      position: 11
      prefix: '--solid_nocall_strategy'
    doc: >-
      Defines the behavior of the recalibrator when it encounters no calls in
      the color space. Options = THROW_EXCEPTION, LEAVE_READ_UNRECALIBRATED, or
      PURGE_READ
  - id: solid_recal_mode
    type: string?
    inputBinding:
      position: 10
      prefix: '--solid_recal_mode'
    doc: >-
      How should we recalibrate solid bases in which the reference was inserted?
      Options = DO_NOTHING, SET_Q_ZERO, SET_Q_ZERO_BASE_N, or REMOVE_REF_BIAS
  - id: sort_by_all_columns
    type: boolean?
    inputBinding:
      position: 9
      prefix: '--sort_by_all_columns'
    doc: >-
      Sort the rows in the tables of reports. Whether GATK report tables should
      have rows in sorted order, starting from leftmost column
  - default: 4
    id: threads
    type: int
    inputBinding:
      position: 26
      prefix: '-nct'
  - id: BQSR
    type: File?
    inputBinding:
      position: 29
      prefix: '-BQSR'
outputs:
  - id: output_baseRecalibrator
    type: File
    outputBinding:
      glob: $(inputs.outputfile_BaseRecalibrator)
doc: >
  GATK-BaseRecalibrator.cwl is developed for CWL consortium

  It generate base recalibration table to compensate for systematic errors in
  basecalling confidences
    Usage: java -jar GenomeAnalysisTK.jar -T BaseRecalibrator -R reference.fasta -I my_reads.bam -knownSites latest_dbsnp.vcf -o recal_data.table.
arguments:
  - position: 2
    prefix: '-Djava.io.tmpdir='
    separate: false
    valueFrom: ./test/test-files
  - position: 4
    prefix: '-T'
    valueFrom: BaseRecalibrator
requirements:
  - class: InlineJavascriptRequirement
'sbg:license': ''
'sbg:toolAuthor': ''
