(TeX-add-style-hook
 "options"
 (lambda ()
   (TeX-add-symbols
    "mytocdepth"
    "FrameCommand")
   (LaTeX-add-environments
    "myshaded"))
 :latex)

