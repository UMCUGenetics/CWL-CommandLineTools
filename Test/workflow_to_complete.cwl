class: Workflow
cwlVersion: v1.0
label: RNAseq pre-processing workflow. 

requirements:
    - class: StepInputExpressionRequirement
    - class: InlineJavascriptRequirement

inputs:
    #Add missing input arguments

    idxbase: 
        type: File
        secondaryFiles:
            - .amb
            - .ann
            - .bwt
            - .pac
            - .sa
            - .fai
            - ^.dict

    output_format:
        type:
            type: enum
            symbols: [sam, bam, cram, json]

outputs:
    sam_file:
        type: File
        outputSource: bwa_mem/output_sam
    #Add missing output sink for bwa mem

steps:
    #Add missing step for bwa mem
       
    sambamba_view:
        run: view.cwl
        in:
            input: bwa_mem/output_sam
            sam-input: sam-input
            output_format: output_format
        out: 
            [output]





