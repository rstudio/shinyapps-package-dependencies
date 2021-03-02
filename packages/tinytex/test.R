options(download.file.method = "curl")
install.packages("tinytex", repos = "https://cran.rstudio.com")
tinytex::install_tinytex()
tinytex::tlmgr_install(c("svg", "koma-script", "trimspaces", "ifplatform", "catchfile", "transparent", "fp", "ms", "pgf"))
tinytex::tlmgr_update()
tex_document <- "
\\documentclass{article}
\\usepackage[inkscapearea=page]{svg}
\\begin{document}
\\includesvg{test}
\\end{document}
"
download.file(url = "https://upload.wikimedia.org/wikipedia/commons/8/84/Example.svg", destfile = "test.svg")
write(tex_document, file = "test.tex", append = TRUE)
tinytex::latexmk(file = "test.tex", engine_args = "-shell-escape")

