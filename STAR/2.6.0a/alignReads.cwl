class: CommandLineTool
cwlVersion: v1.0

arguments:
    - {prefix: '--runMode ', position: 1, separate: false, valueFrom: 'alignReads'}
    - {prefix: '--outSAMtype ', position: 4, separate: false, valueFrom: 'BAM SortedByCoordinate'}
    - {prefix: '--readFilesCommand ', position: 5, separate: false, valueFrom: 'zcat'}
    - {prefix: '--runThreadN ', position: 6, separate: false, valueFrom: $(runtime.cores)}
    - {prefix: '--outFileNamePrefix ', position: 7, separate: false, valueFrom: 'Aligned.sortedByCoord.out'}
  
label: STAR-alignReads
doc: align reads to transcriptome.


baseCommand: STAR

inputs:
    fastq1:
        type: File?
        inputBinding:
            position: 2
            prefix: '--readFilesIn'
    fastq2:
        type: File?
        inputBinding:
            position: 3
            prefix: ''
    genomeDir:
        type: Directory?
        inputBinding:
            position: 8
            prefix: '--genomeDir'
    outReadsUnmapped:
        type: string?
        inputBinding:
            position: 9
            prefix: '--outReadsUnmapped'
    outSAMstrandField:
        type: string?
        inputBinding:
            position: 10
            prefix: '--outSAMstrandField'
    outSJfilterIntronMaxVsReadN:
        type:  int[]?
        inputBinding:
            position: 11
            prefix: '--outSJfilterIntronMaxVsReadN'
    chimJunctionOverhangMin:
        type: int?
        inputBinding:
            position: 12
            prefix: '--chimJunctionOverhangMin'

    outFilterMultimapNmax:
        type: int?
        inputBinding:
            position: 13
            prefix: '--outFilterMultimapNmax'
    outFilterMismatchNmax:
        type: int?
        inputBinding:
            position: 14
            prefix: '--outFilterMismatchNmax'
    outFilterMismatchNoverLmax:
        type: int?
        inputBinding:
            position: 15
            prefix: '--outFilterMismatchNoverLmax'
 
    outFilterMatchNminOverLread:
        type: float?
        inputBinding:
            position: 16
            prefix: '--outFilterMatchNminOverLread'
   
    outFilterScoreMinOverLread:
        type: float?
        inputBinding:
            position: 17
            prefix: '--outFilterScoreMinOverLread'

    clip3pAdapterSeq:
        type: string?
        inputBinding:
            position: 18
            prefix: '--clip3pAdapterSeq'
  
    clip3pAdapterMMp:
        type: float?
        inputBinding:
          position: 19
          prefix: '--clip3pAdapterMMp'
  
    clip5pNbases:
        type: int?
        inputBinding:
          position: 20
          prefix: '--clip5pNbases'
 
    alignIntronMax:
        type: int?
        inputBinding:
          position: 21
          prefix: '--alignIntronMax'

    alignEndsType:
        type: string?
        inputBinding:
          position: 22
          prefix: '--alignEndsType'
  
    chimSegmentMin:
        type: int?
        inputBinding:
          position: 23
          prefix: '--chimSegmentMin'
 
    twopassMode:
        type: string?
        inputBinding:
          position: 24
          prefix: '--twopassMode'
    
outputs:
    output:
        type: File
        outputBinding:
          glob: $(inputs.outFileNamePrefix).bam
        secondaryFiles:
          - .out
          - .tab

