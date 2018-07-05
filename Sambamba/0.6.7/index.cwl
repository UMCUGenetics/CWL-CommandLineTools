class: CommandLineTool
cwlVersion: v1.0

label: sambamba index, tool for building standard index files for BAM data.

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
        type: File
        streamable: true
        outputBinding:
          glob: $(inputs.input.basename).bai
