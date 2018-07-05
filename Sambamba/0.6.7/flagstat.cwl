class: CommandLineTool
cwlVersion: v1.0

label: sambamba flagstat, getting flag statistics from BAM file.

baseCommand: [sambamba, flagstat]
stdout: $(inputs.input.nameroot).flagstat

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
