(TeX-add-style-hook
 "maininc"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("scrartcl" "fontsize=11pt" "paper=A4" "notitlepage")))
   (TeX-run-style-hooks
    "latex2e"
    "../headers/paper"
    "../headers/packages1"
    "../headers/babel"
    "../headers/svg"
    "../headers/packages2"
    "../headers/defaultcolors"
    "../headers/hyphenation"
    "../headers/commands"
    "../headers/title"
    "../headers/options"
    "../headers/formattings"
    "../headers/unicodes"
    "../headers/templates"
    "../headers/templates-dirk"
    "../headers/templates-chemie"
    "hyphsubst"
    "scrartcl"
    "scrartcl10"
    "lmodern"
    "xltxtra"
    "fontspec"))
 :latex)

