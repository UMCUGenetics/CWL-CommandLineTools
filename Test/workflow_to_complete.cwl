class: #Add missing CWL class.
cwlVersion: v1.0
label: RNAseq pre-processing workflow. 

requirements:
    - class: StepInputExpressionRequirement
    - class: InlineJavascriptRequirement

inputs:
    #Add missing inputs here
    idxbase: 
        type: #Add missing data type.
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
   #Add missing output for bwa mem.
    bam_file:
        type: File
        outputSource: sambamba_view/output

steps:
    bwa_mem:
        run: mem.cwl
        in:
            idxbase: idxbase
            in1_fastq: in1_fastq
            in2_fastq: in2_fastq
            out_sam_filename: out_sam_filename
        out: [output_sam]
       
    sambamba_view:
        #Add missing step for sambamba. 




