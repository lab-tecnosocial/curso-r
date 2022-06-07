library(rmarkdown)
library(stringr)

knit_readme <- function(directory){
  rmds <- list.files(directory, pattern = "\\.Rmd$", full.names = T)
  cat(directory, rmds, length(rmds), "\n")
  if(length(rmds) == 0){
    message("No hay archivos Rmd en la carpeta", directory)
  } else if(length(rmds) == 1) {
    render(rmds, output_file = "README.md")
  } else {
    path_file <- paste0(directory, "/","temp.Rmd")
    file.create(path_file)
    cat(cat("#", directory), file = path_file, sep = "\n")
    for(i in seq_along(rmds)){
      title <- yaml_front_matter(rmds[i])$title
      body <- str_remove(rmds[i], "---(.|\n)*---")
      cat("#", title, file = path_file, append = T, sep = "\n")
      cat(body, file = path_file, sep = "\n", append = T)
      message("Archivo ", rmds[i], " procesado")
    }
    render(path_file, output_format = github_document(html_preview = F), output_file = "README.md")
    message("README listo")
    # file.remove(path_file)
  }
}

all_folders <- list.dirs(recursive = F) |> str_subset(pattern = "\\d")

lapply(all_folders, knit_readme)
