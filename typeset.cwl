cwlVersion: v1.2
class: CommandLineTool

baseCommand: pdflatex

requirements:
    - class: InitialWorkDirRequirement
      listing:
        - $(inputs.image)
     
inputs:
  docsrc:
    type: File
    inputBinding:
      position: 2
  image:
    type: File

outputs:
  document:
    type: File
    outputBinding:
      glob: $(inputs.docsrc.nameroot).pdf

hints:
  DockerRequirement:
    dockerPull: texlive/texlive:latest
