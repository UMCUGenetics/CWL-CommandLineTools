class: CommandLineTool
cwlVersion: v1.0

label: sambamba index, tool for indexing a BAM file.

baseCommand: [sambamba, index]

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}

inputs:
    input:
        type: File
        streamable: true
        inputBinding:
            position: 1
        doc: input.bam

outputs:
    output:
        type: stdout
        streamable: true
        outputBinding:
          glob: $(inputs.input.basename).bai
