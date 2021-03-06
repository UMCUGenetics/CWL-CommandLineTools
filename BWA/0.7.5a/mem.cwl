cwlVersion: v1.0
class: CommandLineTool

label: bwa mem, map fastq file to reference genome.

baseCommand: [bwa, mem]
stdout: $(inputs.out_sam_filename)

arguments:
    - {prefix: "-t", valueFrom: $(runtime.cores)}

inputs:
    out_sam_filename:
        type: string

    idxbase:
        type: File
        inputBinding:
            position: 1
        secondaryFiles:
            - .amb
            - .ann
            - .bwt
            - .pac
            - .sa

    in1_fastq:
        type: File
        inputBinding:
            position: 2

    in2_fastq:
        type: File?
        inputBinding:
            position: 3

    read_group:
        type: string?
        inputBinding:
            prefix: -R
        doc: Read group header line such as '@RG\tID:foo\tSM:bar'.

    c:
        type: int?
        inputBinding:
            prefix: -c
        doc: Skip seeds with more than INT occurrences.

    M:
        type: boolean?
        inputBinding:
            prefix: -M
        doc: Mark shorter split hits as secondary (for Picard/GATK compatibility).

outputs:
    output_sam:
        type: stdout
        streamable: true
