class: CommandLineTool
cwlVersion: v1.0

label: sambamba sort, tool for sorting a BAM file.

baseCommand: [sambamba, sort]

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}
    - {prefix: '--memory-limit', valueFrom: $(runtime.ram)MiB}
    - {prefix: '--tmpdir', valueFrom: $(runtime.tmpdir)}
    - {prefix: '--out', valueFrom: $(inputs.input.nameroot).sorted.bam }

inputs:
    input:
        type: File
        inputBinding:
            position: 1
        doc: input.bam

outputs:
    output_bam:
        type: File
        secondaryFiles: .bai
        outputBinding:
            glob: $(inputs.input.nameroot).sorted.bam
