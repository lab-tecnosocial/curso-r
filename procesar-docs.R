library(rmarkdown)
library(stringr)

all_rmds <- list.files(recursive = T, pattern = "\\.Rmd$", full.names = T)


knit_readme <- function(folder){
  rmds <- list.files(folder, pattern = ".Rmd$", full.names = T)
  if(!length(rmds) > 1){
    render(rmds, output_file = "README.md")
  } else {
    file.create("temp.Rmd")
    cat(cat("#", rmds), file = "temp.Rmd", sep = "\n")
    for(i in seq_along(rmds)){
      title <- yaml_front_matter(rmds[i])$title
      body <- str_remove(rmds[i], "---(.|\n)*---")
      cat("#", title, file = "temp.Rmd", append = T, sep = "\n")
      cat(body, file = "temp.Rmd", sep = "\n", append = T)
    }
    render("temp.Rmd", output_format = "github_document", output_file = "README.md")
    file.remove("temp.Rmd")
  }
}

