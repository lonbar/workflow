cwlVersion: v1.2
class: Workflow

inputs:
  src:
    type: File
  texfile:
    type: File
    
outputs:
  proof:
    type: File
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
      image: makepdf/newpdf 
    out: [document]
