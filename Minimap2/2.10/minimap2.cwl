cwlVersion: v1.0
class: CommandLineTool

label: minimap2, map fastq file to reference genome

baseCommand: [minimap2]
stdout: $(inputs.out_sam_filename)

arguments:
  - {prefix: "-t", valueFrom: $(runtime.cores)}

inputs:
  out_sam_filename:
    type: string

  target:
    type: File
    inputBinding:
      position: 1

  query:
    type: File
    inputBinding:
      position: 2

  a:
    type: boolean?
    inputBinding:
      prefix: -a
    doc: output in the SAM format (PAF by default)

  x:
    type: string?
    inputBinding:
      prefix: -x
    doc: preset (always applied before other options) []

  r:
    type: int?
    inputBinding:
      prefix: -r
    doc: bandwidth used in chaining and DP-based alignment

  no-long-join:
    type: boolean?
    inputBinding:
      prefix: --no-long-join
    doc: Disable the long gap patching heuristic. When this option is applied, the maximum alignment gap is mostly controlled by -r.

outputs:
  output_sam:
    type: stdout
    streamable: true
