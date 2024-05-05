
blogdown::stop_server()


source("~/Dropbox/Websites/beautifulhugo/custom_code/render_posts_fun.R")


# render_post(file = "dynaSpec_dynamic_spectrograms_in_r.qmd")
#
# render_post(file = "Choosing the right method for measuring acoustic signal structure.qmd")
#

blogdown::stop_server(); blogdown::build_site(); blogdown::serve_site()

source("~/Dropbox/R_package_testing/sketchy/R/internal_functions.R")
source("~/Dropbox/R_package_testing/sketchy/R/check_urls.R")

cu <- check_urls(path = "./content/post/")

cu$URL
table(cu$Status)

cu$URL[cu$Status == "Error"]

# images should be in ./static/img/

# create spectro front page
# library(warbleR)
# cb <-
#   warbleR::image_to_wave(file = "~/Descargas/12.png",samp.rate = 80)
#
# cb <- cb + rnorm(n = length(cb@left), mean = 0, sd = 0.0005)
#
# par(mar = rep(0, 4))
# spectro(
#   cb,
#   scale = FALSE,
#   wl = 100,
#   pal = viridis::mako,
#   collevels = seq(-100, 0, 1),
#   ovlp = 0,
#   grid = FALSE
# )

