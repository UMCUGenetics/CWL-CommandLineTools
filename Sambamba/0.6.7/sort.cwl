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
    bam_file:
        type: File
        outputBinding:
            glob: $(inputs.input.nameroot).sorted.bam
    bai_file:
        type: File
        outputBinding:
            glob: $(inputs.input.nameroot).sorted.bam.bai
