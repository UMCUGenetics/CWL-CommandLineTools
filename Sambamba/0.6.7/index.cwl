class: CommandLineTool
cwlVersion: v1.0

label: sambamba index, tool for building standard index files for BAM data.

baseCommand: [sambamba, index]

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}
    - {position: 2, valueFrom: $(inputs.input.basename).bai}

inputs:
    input:
        type: File
        inputBinding:
            position: 1
        doc: input.bam

outputs:
    output:
        type: File
        outputBinding:
          glob: $(inputs.input.basename).bai
