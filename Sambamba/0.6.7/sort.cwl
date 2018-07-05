class: CommandLineTool
cwlVersion: v1.0

label: sambamba sort, tool for sorting a BAM file.

baseCommand: [sambamba, sort]
stdout: $(inputs.input.nameroot).sorted.bam

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}

inputs:
    input:
        type: File
        streamable: true
        inputBinding:
            position: 1
        doc: input.bam

    memory-limit:
        type: string?
        inputBinding:
            prefix: --memory-limit

    tmpdir:
        type: string?
        inputBinding:
          prefix: --tmpdir

    output_name:
      type: string?
      inputBinding:
        prefix: '--out'
        valueFrom: $(inputs.input.nameroot + '.sorted.bam')

outputs:
    output:
        type: stdout
        streamable: true
