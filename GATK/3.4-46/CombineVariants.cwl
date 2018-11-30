cwlVersion: v1.0
class: CommandLineTool

label: GATK CombineVariants.
doc: Combine variant records from different sources.

baseCommand: java

arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    - {prefix: '--analysis_type', position: 4, valueFrom: 'CombineVariants'}


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
        type:
            type: array
            items: File
            inputBinding:
                prefix: --variant
        inputBinding:
            position: 5
    out:
        type: string
        inputBinding:
            prefix: --out
            position: 5
    assumeIdenticalSamples:
        type: boolean?
        inputBinding:
            prefix: --assumeIdenticalSamples
            position: 5

outputs:
    output_vcf:
        type: File
        outputBinding:
            glob: $(inputs.out)
