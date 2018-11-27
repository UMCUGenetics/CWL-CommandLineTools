class: CommandLineTool
cwlVersion: v1.0

label: GATK-AnalyzeCovariats
doc:  GATK-AnalyzeCovariats

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'AnalyzeCovariates'}
    - {prefix: '-nt', position: 5, valueFrom: $(runtime.cores)}
    - {prefix: '-plots', position: 10, valueFrom: recallQC.BQSR.pdf}
    - {prefix: '-l', position: 11, valueFrom: DEBUG}       

inputs:
    gatk_jar:
        type: File
        inputBinding:
            position: 3
            prefix: '-jar'
            
    reference_sequence:
        type: File
        inputBinding:
            position: 6
            prefix: '-R'
        secondaryFiles:
          - .amb
          - .ann
          - .bwt
          - .pac
          - .sa
          - .fai
          - ^.dict 

    BQSR:
      type: File?
      inputBinding:
          position: 7
          prefix: '-BQSR'
      
    before:
        type: File?
        inputBinding:
            position: 8
            prefix: '-before'
 
    after:
        type: File?
        inputBinding:
            position: 9
            prefix: '-after'



outputs:
  output_analyze_covariates:
        type: File
        outputBinding:
            glob: recallQC.BQSR.pdf
        secondaryFiles:
          - ^.csv
         
