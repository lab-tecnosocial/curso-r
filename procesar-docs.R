library(rmarkdown)
library(readr)
library(stringr)

knit_readme <- function(directory){
  rmds <- list.files(directory, pattern = "\\.Rmd$", full.names = T)
  if(length(rmds) == 0){
    message("No hay archivos Rmd en la carpeta", directory)
  } else if(length(rmds) == 1) {
    render(rmds, output_file = "README.md")
  } else {
    path_file <- paste0(directory, "/","temp.Rmd")
    file.create(path_file)
    directory_clean_name <- directory |> str_sub(6, -1) |> str_replace_all("-", " ") |> str_to_sentence()
    write_file(paste("#", directory_clean_name, "\n"), file = path_file)
    for(i in seq_along(rmds)){
      title <- yaml_front_matter(rmds[i])$title
      doc <- read_file(rmds[i]) 
      body <- str_remove(doc, "---\\n(.|\n)*\\n---\\n")
      write_file(paste("#", title, "\n"), file = path_file, append = T)
      write_file(body, file = path_file, append = T)
      message("Archivo: ", rmds[i], " procesado")
    }
    render(path_file, output_format = github_document(html_preview = F), output_file = "README.md")
    message("README listo: ", directory)
    file.remove(path_file)
  }
}

all_folders <- list.dirs(recursive = F) |> str_subset(pattern = "\\d")

lapply(all_folders, knit_readme)
