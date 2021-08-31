#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

baseCommand: pdflatex

#requirements:
#    - class: InitialWorkDirRequirement
#      listing:
#        - $(inputs.docsrc)
     
inputs:
  docsrc:
    type: File
    inputBinding:
      position: 2
#      valueFrom: $(self.basename)

outputs:
  document:
    type: File
    outputBinding:
      glob: "*.pdf"
