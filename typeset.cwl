#!/usr/bin/env cwl-runner

cwlVersion: v1.0
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
#      valueFrom: $(self.basename)
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
