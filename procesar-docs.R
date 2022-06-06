library(rmarkdown)
library(yaml)

all_rmds <- list.files(recursive = T, pattern = "\\.Rmd$", full.names = T)


knit_readme <- function(rmds){
  if(!length(files > 1)){
    render(rmds, output_file = "README.md")
  } else {
    md_document()
  }
}

