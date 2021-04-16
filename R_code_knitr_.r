# R_code_knitr.r

setwd("C:/lab/") 

library(knitr) #uguale a require(knitr)
stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))# riga codice Rocchini
