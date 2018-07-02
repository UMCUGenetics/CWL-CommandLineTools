class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
baseCommand:
  - java
inputs:
  - id: ERCIS
    type: int?
    inputBinding:
      position: 28
      prefix: '--indelSizeToEliminateInRefModel'
    doc: The size of an indel to check for in the reference model
  - id: GVCFGQBands
    type: 'int[]?'
    inputBinding:
      position: 31
    doc: Input prior for calls
  - id: activeProbabilityThreshold
    type: double?
    inputBinding:
      position: 58
      prefix: '--activeProbabilityThreshold'
    doc: Threshold for the probability of a profile state being active.
  - id: activeRegionExtension
    type: int?
    inputBinding:
      position: 57
      prefix: '--activeRegionExtension'
    doc: >-
      The active region extension; if not provided defaults to Walker annotated
      default
  - id: activeRegionMaxSize
    type: int?
    inputBinding:
      position: 56
      prefix: '--activeRegionMaxSize'
    doc: >-
      The active region maximum size; if not provided defaults to Walker
      annotated default
  - id: activeRegionOut
    type: File?
    inputBinding:
      position: 55
      prefix: '--activeRegionOut'
    doc: Output the active region to this IGV formatted file
  - id: activityProfileOut
    type: File?
    inputBinding:
      position: 54
      prefix: '--activityProfileOut'
    doc: Output the raw activity profile results in IGV format
  - id: allSitePLs
    type: boolean?
    inputBinding:
      position: 51
      prefix: '--allSitePLs'
    doc: Annotate all sites with PLs
  - id: alleles
    type: 'string[]?'
    inputBinding:
      position: 53
    doc: >-
      The set of alleles at which to genotype when --genotyping_mode is
      GENOTYPE_GIVEN_ALLELES
  - id: allowNonUniqueKmersInRef
    type: boolean?
    inputBinding:
      position: 52
      prefix: '--allowNonUniqueKmersInRef'
    doc: Allow graphs that have non-unique kmers in the reference
  - id: annotateNDA
    type: boolean?
    inputBinding:
      position: 50
      prefix: '--annotateNDA'
    doc: >-
      If provided, we will annotate records with the number of alternate alleles
      that were discovered (but not necessarily genotyped) at a given site
  - id: annotation
    type: 'string[]?'
    inputBinding:
      position: 49
    doc: One or more specific annotations to apply to variant calls
  - id: bamOutput
    type: File?
    inputBinding:
      position: 48
      prefix: '--bamOutput'
    doc: File to which assembled haplotypes should be written
  - id: bamWriterType
    type: string?
    inputBinding:
      position: 47
      prefix: '--bamWriterType'
    doc: Which haplotypes should be written to the BAM.
  - id: bandPassSigma
    type: double?
    inputBinding:
      position: 46
      prefix: '--consensus'
    doc: >-
      The sigma of the band pass filter Gaussian kernel; if not provided
      defaults to Walker annotated default
  - id: comp
    type: 'string[]?'
    inputBinding:
      position: 45
    doc: >-
      comp binds reference ordered data. This argument supports ROD files of the
      following types BCF2, VCF, VCF3
  - id: consensus
    type: boolean?
    inputBinding:
      position: 44
      prefix: '--consensus'
    doc: >-
      Print out very verbose debug information about each triggering active
      region
  - id: contamination
    type: File?
    inputBinding:
      position: 43
      prefix: '--contamination_fraction_to_filter'
    doc: >-
      Tab-separated File containing fraction of contamination in sequencing data
      (per sample) to aggressively remove. Format should be "" (Contamination is
      double) per line; No header.
  - id: dbsnp
    type: File?
    inputBinding:
      position: 7
      prefix: '--dbsnp'
    doc: latest_dbsnp.vcf set of known indels
  - id: debug
    type: boolean?
    inputBinding:
      position: 42
      prefix: '--debug'
    doc: >-
      Print out very verbose debug information about each triggering active
      region
  - id: disableOptimizations
    type: boolean?
    inputBinding:
      position: 41
      prefix: '--disableOptimizations'
    doc: Dont skip calculations in ActiveRegions with no variants
  - id: doNotRunPhysicalPhasing
    type: boolean?
    inputBinding:
      position: 40
      prefix: '--doNotRunPhysicalPhasing'
    doc: >-
      As of GATK 3.3, HaplotypeCaller outputs physical (read-based) information
      (see version 3.3 release notes and documentation for details). This
      argument disables that behavior.
  - id: dontIncreaseKmerSizesForCycles
    type: boolean?
    inputBinding:
      position: 39
      prefix: '--dontIncreaseKmerSizesForCycles'
    doc: Disable iterating over kmer sizes when graph cycles are detected
  - id: dontTrimActiveRegions
    type: boolean?
    inputBinding:
      position: 39
      prefix: '--dontTrimActiveRegions'
    doc: >-
      If specified, we will not trim down the active region from the full region
      (active + extension) to just the active interval for genotyping
  - id: emitRefConfidence
    type: string?
    inputBinding:
      position: 38
      prefix: '--emitRefConfidence'
    doc: Mode for emitting reference confidence scores
  - id: excludeAnnotation
    type: 'string[]?'
    inputBinding:
      position: 37
    doc: One or more specific annotations to exclude
  - id: forceActive
    type: boolean?
    inputBinding:
      position: 36
      prefix: '--forceActive'
    doc: 'If provided, all bases will be tagged as active'
  - id: gatk_jar
    type: File
    inputBinding:
      position: 3
      prefix: '-jar'
  - id: gcpHMM
    type: int?
    inputBinding:
      position: 35
      prefix: '--gcpHMM'
    doc: Flat gap continuation penalty for use in the Pair HMM
  - id: genotyping_mode
    type: string?
    inputBinding:
      position: 34
      prefix: '--genotyping_mode'
    doc: >-
      The --genotyping_mode argument is an enumerated type
      (GenotypingOutputMode), which can have one of the following values
  - id: globalMAPQ
    type: int?
    inputBinding:
      position: 15
      prefix: '--phredScaledGlobalReadMismappingRate'
    doc: The global assumed mismapping rate for reads
  - id: graphOutput
    type: File?
    inputBinding:
      position: 33
      prefix: '--graphOutput'
    doc: Write debug assembly graph information to this file
  - id: group
    type: 'string[]?'
    inputBinding:
      position: 32
    doc: Input prior for calls
  - id: heterozygosity
    type: double?
    inputBinding:
      position: 30
      prefix: '--heterozygosity'
    doc: Heterozygosity for indel calling
  - id: indel_heterozygosity
    type: double?
    inputBinding:
      position: 29
      prefix: '--indel_heterozygosity'
    doc: Heterozygosity for indel calling
  - id: inputBam_HaplotypeCaller
    type: File
    inputBinding:
      position: 6
      prefix: '-I'
    doc: bam file produced after printReads
    secondaryFiles:
      - ^.bai
  - id: input_prior
    type: 'double[]?'
    inputBinding:
      position: 27
    doc: Input prior for calls
  - default: '-Xmx4g'
    id: java_arg
    type: string
    inputBinding:
      position: 1
  - id: kmerSize
    type: 'int[]?'
    inputBinding:
      position: 26
    doc: Kmer size to use in the read threading assembler
  - id: maxNumHaplotypesInPopulation
    type: int?
    inputBinding:
      position: 24
      prefix: '--maxNumHaplotypesInPopulation'
    doc: Maximum number of haplotypes to consider for your population
  - id: maxReadsInRegionPerSample
    type: int?
    inputBinding:
      position: 23
      prefix: '--maxReadsInRegionPerSample'
    doc: Maximum reads in an active region
  - id: max_alternate_alleles
    type: int?
    inputBinding:
      position: 25
      prefix: '--max_alternate_alleles'
    doc: Maximum number of alternate alleles to genotype
  - id: minDanglingBranchLength
    type: int?
    inputBinding:
      position: 21
      prefix: '--minDanglingBranchLength'
    doc: Minimum length of a dangling branch to attempt recovery
  - id: minPruning
    type: int?
    inputBinding:
      position: 20
      prefix: '--minPruning'
    doc: Minimum support to not prune paths in the graph
  - id: minReadsPerAlignmentStart
    type: int?
    inputBinding:
      position: 19
      prefix: '--minReadsPerAlignmentStart'
    doc: >-
      Minimum number of reads sharing the same alignment start for each genomic
      location in an active region
  - id: min_base_quality_score
    type: int?
    inputBinding:
      position: 22
      prefix: '--min_base_quality_score'
    doc: Minimum base quality required to consider a base for calling
  - id: numPruningSamples
    type: int?
    inputBinding:
      position: 18
      prefix: '--numPruningSamples'
    doc: Number of samples that must pass the minPruning threshold
  - id: output_mode
    type: string?
    inputBinding:
      position: 17
      prefix: '--output_mode'
    doc: The PCR indel model to use
  - id: outputfile_HaplotypeCaller
    type: string
    inputBinding:
      position: 8
      prefix: '-o'
    doc: name of the output file from HaplotypeCaller
  - id: pcr_indel_model
    type: string?
    inputBinding:
      position: 16
      prefix: '--pcr_indel_model'
    doc: The PCR indel model to use
  - id: reference
    type: File
    inputBinding:
      position: 5
      prefix: '-R'
    secondaryFiles:
      - .fai
      - ^.dict
  - id: sample_name
    type: string?
    inputBinding:
      position: 14
      prefix: '--sample_name'
    doc: Use additional trigger on variants found in an external alleles file
  - id: sample_ploidy
    type: int?
    inputBinding:
      position: 13
      prefix: '--sample_ploidy'
    doc: Use additional trigger on variants found in an external alleles file
  - id: stand_call_conf
    type: double?
    inputBinding:
      position: 12
      prefix: '--standard_min_confidence_threshold_for_calling'
    doc: >-
      The minimum phred-scaled confidence threshold at which variants should be
      called
  - id: stand_emit_conf
    type: double?
    inputBinding:
      position: 11
      prefix: '--standard_min_confidence_threshold_for_emitting'
    doc: >-
      The minimum phred-scaled confidence threshold at which variants should be
      emitted (and filtered with LowQual if less than the calling threshold)
  - id: threads
    type: int?
    inputBinding:
      position: 56
      prefix: '-nct'
  - id: useAllelesTrigger
    type: boolean?
    inputBinding:
      position: 10
      prefix: '--useAllelesTrigger'
    doc: Use additional trigger on variants found in an external alleles file
  - id: useFilteredReadsForAnnotations
    type: boolean?
    inputBinding:
      position: 9
      prefix: '--useFilteredReadsForAnnotations'
    doc: >-
      Use the contamination-filtered read maps for the purposes of annotating
      variants
  - id: targetsIntervalList
    type: File?
    inputBinding:
      position: 59
      prefix: '-L'
    doc: Interval file
outputs:
  - id: output_HaplotypeCaller
    type: File
    outputBinding:
      glob: $(inputs.outputfile_HaplotypeCaller)
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  Call germline SNPs and indels via local re-assembly of haplotypes
arguments:
  - position: 2
    prefix: '-Djava.io.tmpdir='
    separate: false
    valueFrom: ./test/test-files
  - position: 4
    prefix: '-T'
    valueFrom: HaplotypeCaller
requirements:
  - class: InlineJavascriptRequirement
'sbg:toolkit': GATK
'sbg:wrapperAuthor': Tilman Schaefers
'sbg:wrapperLicense': Apache 2.0
'sbg:license': Apache 2.0
'sbg:toolAuthor': 'Farah Zaib Khan, Sehrish Kanawal'
'sbg:toolkitVersion': HaplotypeCaller
