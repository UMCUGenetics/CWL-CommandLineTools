class: CommandLineTool
cwlVersion: v1.0

label: sambamba view, tool for extracting information from SAM/BAM files.

baseCommand: [sambamba, view]
stdout: $(inputs.input.nameroot).$(inputs.output_format)

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}

inputs:
    input:
        type: File
        streamable: true
        inputBinding:
            position: 2
        doc: input.bam or input.sam

    sam-input:
        type: boolean
        inputBinding:
            position: 1
            prefix: --sam-input

    output_format:
        type:
            type: enum
            symbols: [sam, bam, cram, json]
        inputBinding:
            position: 1
            prefix: --format

outputs:
    output:
        type: stdout
        streamable: true
