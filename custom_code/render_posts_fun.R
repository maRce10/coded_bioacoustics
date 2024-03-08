render_post <-
  function(site.path = ".",
           qmd.path = "_qmd",
           file)
  {
    rlang::check_installed("knitr")

    ## Blog-specific directories.  This will depend on how you organize your blog.
    # site.path <- site.path # directory of jekyll blog (including trailing slash)
    # fig.dir <- "assets/Rfig/" # directory to save figures
    # posts.path <- paste0(site.path, "_posts/") # directory for converted markdown files
    # cache.path <- paste0(site.path, "_cache") # necessary for plots

    input <- file.path(normalizePath(site.path), qmd.path, file)
    # rmarkdown::render(input = input, output_dir = output_dir, output_file = output_file)

    rmd <- readLines(input)
    yaml <-
      c(
        "---",
        grep("^title:", rmd, value = TRUE),
        grep("^subtitle:", rmd, value = TRUE),
        grep("^date:", rmd, value = TRUE),
        grep("^tags:", rmd, value = TRUE), #tags
        "---"
      )

    date <- substr(yaml[3], start = 8, stop = 17)

    # render_markdown()
    output_file <- paste0(date, "-", gsub("Rmd$|qmd$", "md", file))
    output_dir <- file.path(normalizePath(site.path), "content/post")
    quarto::quarto_render(input = input, output_file = output_file, output_format = "md")

    md <- readLines(file.path(normalizePath(site.path), output_file))

    md2 <- c(yaml, md[4:length(md)])

    writeLines(md2, file.path(output_dir, output_file))

    # unlink(list.files(path = "./_qmd/", pattern = "\\.wav$"))

    unlink(file.path(normalizePath(site.path), output_file))

    }
