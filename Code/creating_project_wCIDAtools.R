# The following script only needs to run once
#############################################
# creating project using CIDAtools package
#############################################

# installing and loading devtools
install.packages("devtools")
library(devtools)

# installing and loading CIDAtools
devtools::install_github("CIDA-CSPH/CIDAtools")
library(CIDAtools)

# setting up file structure for project w/CIDAtools
CIDAtools::create_project()
