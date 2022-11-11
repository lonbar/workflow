cwlVersion: v1.2
class: CommandLineTool

baseCommand: epstopdf

requirements:
    - class: InitialWorkDirRequirement
      listing:
        - $(inputs.postscript)

inputs:
  postscript:
    type: File
    inputBinding: 
      position: 1
      valueFrom: $(self.basename)

outputs:
  newpdf:
    type: File
    outputBinding:
      glob: "*.pdf"

hints:
  DockerRequirement:
    dockerPull: texlive/texlive:latest
