class: CommandLineTool
cwlVersion: v1.0

label: GATK SplitNCigarReads
doc: Documentation  

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'SplitNCigarReads'}
    - {prefix: '-nt', position: 5, valueFrom: $(runtime.cores)}
    - {prefix: '--out', position: 5, valueFrom: $(inputs.input.nameroot).ncigar_split.bam}

inputs:
    gatk_jar:
        type: File
        inputBinding:
            position: 2
            prefix: '-jar'
    
    reference_sequence:
        type: File
        inputBinding:
            position: 4
            prefix: '-R'
    input:
        type: File
        inputBinding:
            position: 5
            prefix: '-I'
    n_cigar:
        type: string
        inputBinding:
            position: 11
            prefix: '-U'
    rf:
        type: string?
        inputBinding:
            position: 8
            prefix: '-rf'
    RMQF:
        type: int?
        inputBinding:
            position: 9
            prefix: '-RMQF'
    RMQT:
        type: int?
        inputBinding:
            position: 10
            prefix: '-RMQT'


outputs:
     bam_out:
        type: File
        secondaryFiles: ^.bai
        outputBinding:
          glob: $(inputs.input.nameroot).ncigar_split.bam
