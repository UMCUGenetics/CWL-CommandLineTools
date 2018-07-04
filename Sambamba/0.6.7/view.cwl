class: CommandLineTool
cwlVersion: v1.0

label: sambamba view, tool for extracting information from SAM/BAM files.

baseCommand: [sambamba, view]
#sambamba view -t $opt{MAPPING_THREADS} --format=bam -S -o $coreName.bam.tmp

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

    output_filename:
        type: string
        inputBinding:
            position: 1
            prefix: --output-filename

    output_format:
        type:
            type: enum
            symbols: [sam, bam, cram, json]
        inputBinding:
            position: 1
            prefix: --format

outputs:
    output:
        type: File
        outputBinding:
            glob: $(inputs.output_filename)
