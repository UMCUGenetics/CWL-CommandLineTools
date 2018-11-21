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
    - {prefix: '--plots', position: 5, valueFrom: $(inputs.input.nameroot).BQSR.pdf}


inputs:
    gatk_jar:
        type: File
        inputBinding:
            position: 3
            prefix: '-jar'
            
    input:
        type: File
        secondaryFiles: .bai
        inputBinding:
            prefix: --input_file
            position: 5
            
    reference_sequence:
        type: File
        inputBinding:
            position: 5
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
          position: 29
          prefix: '-BQSR'
      
    before:
        type: File?
        inputBinding:
            position: 4
            prefix: '-before'
 
    after:
        type: File?
        inputBinding:
            position: 5
            prefix: '-after'



outputs:
  output_analyze_covariates:
        type: File?
        outputBinding:
            glob: $(inputs.input.nameroot).BQSR.pdf


