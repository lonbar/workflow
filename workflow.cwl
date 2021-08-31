#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
    src: File
    texfile: File
    
outputs:
  proof:
    type: File
    #outputSource: makepdf/newpdf
    outputSource: makedoc/document

steps:
  makefigure:
    run: draw.cwl
    in: 
      circle: src
    out: [drawing]

  makepdf:
    run: convert.cwl
    in:
      postscript: makefigure/drawing
    out: [newpdf]

  makedoc:
    run: typeset.cwl
    in:
      docsrc: texfile 
    out: [document]
