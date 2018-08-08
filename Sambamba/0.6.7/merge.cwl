class: CommandLineTool
cwlVersion: v1.0

label: sambamba merge, tool for merging several BAM files into one

baseCommand: [sambamba, merge]

arguments:
    - {prefix: '--nthreads', valueFrom: $(runtime.cores)}

inputs:
  out_bam_filename:
    type: string
    inputBinding:
      position: 1

  input:
    type: File[]
    inputBinding:
        position: 2

outputs:
    output_bam:
        type: File
        secondaryFiles: .bai
        outputBinding:
            glob: $(inputs.out_bam_filename)
