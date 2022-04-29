install.packages(targets)
install.packages(tarchetypes)
source("R/scripts travail.R")
library(targets)
tar_option_set(packages = c("MASS","igraph"))

list(
      tar_target(
        n_coll,
        read.table("scripts travail/R/n_coll")
    ),
      tar_target(
        histo,
        curve(dnorm(nrow(n_coll),mean(n_coll),sd(n_coll)), add=T, col="red")
    ),
      tar_target(
        histdn,
        hist(n_coll, prob=T),
      )
)

list(
  tar_target(
    n_coll,
    read.table("scripts travail/R/n_coll")
  ),
  tar_target(
    shapiro,
    shapiro.test(n_coll)
  ),
  tar_target(
    shapirodn,
    hist(n_coll, prob=T),
  )
)


