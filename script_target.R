install.packages(targets)
install.packages(tarchetypes)
source("R/scripts travail.R")
tar_option_set(packages = c("rmarkdown","knitr"))

list(
      tar_targer(
        data,
        read.table()
    ),
      tar_target(
        #CIBLE DE LA FONCTION
        #EXECUTION DE L'ANALYSE
    ),
      tar_target(
        #nom figure
        #commande de figure
      )
)