cwlVersion: v1.0
class: CommandLineTool

label: GATK HaplotypeCaller.
doc: Call germline SNPs and indels via local re-assembly of haplotypes.

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'HaplotypeCaller'}

inputs:
    gatk_jar:
        type: File
        inputBinding:
            prefix: -jar
            position: 3
    reference_sequence:
        type: File
        secondaryFiles:
            - .fai
            - ^.dict
        inputBinding:
            prefix: --reference_sequence
            position: 5
    input:
        type: File[]
        secondaryFiles:
            - ^.bai
        inputBinding:
            prefix: --input_file
            position: 5
    out:
        type: string
        inputBinding:
            prefix: --out
            position: 5
    dbsnp:
        type: File?
        inputBinding:
            prefix: --dbsnp
            position: 5
    stand_call_conf:
        type: int?
        inputBinding:
            prefix: --stand_call_conf
            position: 5
    stand_emit_conf:
        type: int?
        inputBinding:
            prefix: --stand_emit_conf
            position: 5
    intervals:
        type: File?
        inputBinding:
            prefix: --intervals
            position: 5
outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: $(inputs.out)
