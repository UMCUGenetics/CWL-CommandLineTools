cwlVersion: v1.0
class: CommandLineTool

label: GATK SelectVariants.
doc: Select a subset of variants from a larger callset.

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'SelectVariants'}
    - {prefix: '-nt', position: 5, valueFrom: $(runtime.cores)}

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
    variant:
        type: File
        inputBinding:
            prefix: --variant
            position: 5
    out:
        type: string
        inputBinding:
            prefix: --out
            position: 5
    selectType:
        type:
            type: enum[]?
            symbols: [INDEL, SNP, MIXED, MNP, SYMBOLIC, NO_VARIATION]
        inputBinding:
            prefix: -selectType
            position: 5

outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: $(inputs.out)
