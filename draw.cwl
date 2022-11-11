#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

baseCommand: mpost

inputs:
  circle:
    type: File
    inputBinding:
      position: 0
outputs:
  drawing:
    type: File
    outputBinding: 
      glob: '*.eps'

hints:
  DockerRequirement:
    dockerPull: texlive/texlive:latest
