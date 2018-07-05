class: CommandLineTool
cwlVersion: v1.0

label: sambamba markdup, finding duplicate reads in BAM file

baseCommand: [sambamba, markdup]

arguments:
    - {prefix: '--tmpdir', valueFrom: $(runtime.tmpdir)}
    - {position: 2, valueFrom: $(inputs.out_bam_filename) }

inputs:
    out_bam_filename: string
    input:
        type: File[]
        inputBinding:
            position: 1
        doc: input.bam files, multiple files are merged.

outputs:
    bam_file:
        type: File
        outputBinding:
            glob: $(inputs.out_bam_filename)
    bai_file:
        type: File
        outputBinding:
            glob: $(inputs.out_bam_filename).bai
