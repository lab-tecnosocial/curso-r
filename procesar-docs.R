library(rmarkdown)

all_rmds <- list.files(recursive = T, pattern = "\\.Rmd$", full.names = T)


knit_readme <- function(rmds){
  paths <- rmds
  folders <- dirname(paths)
  files <- basename(paths)
  
  if(!length(files > 1)){
    render(files, output_file = "README.md", output_format = "github_document", output_dir = folders)
  } else {
    
  }
  
  render <- function(){
    
  }
}

