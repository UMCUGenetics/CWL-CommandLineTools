# CWL-CommandLineTools
UMCU Genetics CWL CommandLineTools

## Getting started with CWL
- [CWL User Guide](https://www.commonwl.org/user_guide/)
- [CWL tutorial using SNPEFF](http://andrewjesaitis.com/2017/02/common-workflow-language---a-tutorial-on-making-bioinformatics-repeatable/)

## CWL Workflows
Put uri to our workflows here.

## Contributing
We invite anybody to contribute to the UMCU Genetics CWL CommandLineTools repository. If you would like to contribute please use the following procedure:
- Fork the repository
- Commit the changes to your fork
- Submit a pull request

The pull request will be reviewed and included as fast as possible.

### Contributing guidelines
- Use the `tool/version/subtool` folder structure of this repository.
- Use CamelCase for tool names
- Use the original tool version numbering
- Use tool option names for optional inputs and outputs.
- Use lowercase with words separated by underscores for positional inputs and outputs.
- All input and output identifiers should reflect their conceptual identity. Use informative names like unaligned_sequences, reference_genome, phylogeny, or aligned_sequences instead of foo_input, foo_file, result, input, output, and so forth.
- Mark all input and output Files that are read from or written to in a streaming compatible way (only once, no random-access), as streamable: true.
- Include a top level short `label` summarising the tool/workflow.
- If useful, include a top level `doc` as well. This should provide a longer, more detailed description than was provided in the top level `label`.
- Use type: enum instead of type: string for elements with a fixed list of valid values.
<!-- - format should be specified for all input and output Files. Bioinformatics tools should use format identifiers from EDAM. -->
