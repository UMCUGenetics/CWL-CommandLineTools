class: CommandLineTool
cwlVersion: v1.0

label: SnpEff
doc:  SnpEff

baseCommand: java
stdout: $(inputs.vcf.nameroot).snpeff.vcf


arguments:
    - {prefix: '-Xmx', position: 1, separate: false, valueFrom: $(runtime.ram)M}
    - {prefix: '-Djava.io.tmpdir=', position: 2, separate: false, valueFrom: $(runtime.tmpdir)}
    
inputs:
    snpeff_jar:
        type: File
        inputBinding:
            position: 3
            prefix: '-jar'
            
    config:
        type: File
        inputBinding:
            position: 4
            prefix: '-c'

    database:
        type: File
        inputBinding:
            position: 5
      
    vcf:
        type: File
        inputBinding:
            position: 6
            prefix: '-v'
 
    hgvs:
        type: boolean
        inputBinding:
            position: 7
            prefix: '-hgvs'
    lof:
        type: boolean
        inputBinding:
            position: 7
            prefix: '-lo'
    no-downstream:
        type: boolean
        inputBinding:
            position: 7
            prefix: '-no-downstream'
    no-upstream:
        type: boolean
        inputBinding:
            position: 7
            prefix: '-no-upstream'
    no-intergenic:
        type: boolean
        inputBinding:
            position: 7
            prefix: '-no-intergenic'
    
outputs:
    output_snpeff:
        type: stdout
        streamable: true
