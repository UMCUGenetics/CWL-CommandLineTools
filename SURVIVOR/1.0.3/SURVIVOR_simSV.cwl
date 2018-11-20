class: CommandLineTool
cwlVersion: v1.0

label: survivor simSV

baseCommand: [SURVIVOR, simSV]

inputs:
    Parameter_file:
        type: File
        inputBinding:
            position: 1
    Reference_file:
        type: File
        inputBinding:
            position: 2
    output_prefix:
        type: string
        inputBinding:
            position: 3
    read_type:
        type: int
        inputBinding:
            position: 4
    snp_mutation_freq:
        type: int
        inputBinding:
            position: 3
outputs:
    fasta_out:
        type: File
        outputBinding:
            glob: $(inputs.output_prefix).fasta
        secondaryFiles:
            - .bed
            - .vcf 
  
