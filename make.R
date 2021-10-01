files <- list.files("sources", full.names = TRUE, pattern = "*.Rmd")
for (f in files) {

    # Getting hash
    hash <- system2("git", c("diff", files[1]), stdout = TRUE)

    if (!length(hash))
      next

    rmarkdown::render(
      input = f,
      output_dir = ".",
      intermediates_dir = tempdir()
    )
}