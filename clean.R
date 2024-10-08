#library(readxl)
#library(readr)
library(stringr)
library(dplyr)
library(lubridate)
library(rio)
library(tidyr)

zipF <- "Archive.zip"
outDir <-"Archive"
unzip(zipF,exdir=outDir)


Sys.setlocale("LC_TIME", "es_ES.UTF-8")

bbdd_2015 <- rio::import("Archive/Ingresos por Materia Penal 2015.csv")
bbdd_2016 <- rio::import("Archive/Ingresos por Materia Penal 2016.csv")
bbdd_2017 <- rio::import("Archive/Ingresos por Materia Penal 2017.csv")
bbdd_2018 <- rio::import("Archive/Ingresos por Materia Penal 2018.csv")
bbdd_2019 <- rio::import("Archive/Ingresos por Materia Penal 2019.csv")
bbdd_2020 <- rio::import("Archive/Ingresos por Materia Penal 2020.csv")
bbdd_2021 <- rio::import("Archive/Ingresos por Materia Penal 2021.csv")
bbdd_2022 <- rio::import("Archive/Ingresos por Materia Penal 2022.csv")
bbdd_2023 <- rio::import("Archive/Ingresos por Materia Penal 2023.csv")
bbdd_2024 <- rio::import("Archive/Ingresos por Materia Penal ene-jun 2024.csv")

########################## MANEJO BBDD ####################################

# colnames(bbdd_2015)
bbdd_2015 <- bbdd_2015[, -c(1, 13, 14)]
# columnas[[1]]
bbdd_2016 <- bbdd_2016[, -c(1, 13, 14)]
# columnas[[2]]
bbdd_2017 <- bbdd_2017[, -c(1, 13, 14)]
# columnas[[3]]
bbdd_2018 <- bbdd_2018[, -c(1, 13, 14)]
# columnas[[4]]
bbdd_2019 <- bbdd_2019[, -c(1, 13, 14)]
# columnas[[5]]
bbdd_2020 <- bbdd_2020[, -c(1, 13)]
# columnas[[6]]
bbdd_2021 <- bbdd_2021[, -c(5, 13, 14, 15)]
# columnas[[7]]
bbdd_2022 <- bbdd_2022[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
# columnas[[8]]
bbdd_2023 <- bbdd_2023[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
# columnas[[9]]
bbdd_2024 <- bbdd_2024[, -c(1, 6, 14, 15, 16, 17, 18)]
# columnas[[10]]

colnames(bbdd_2015)[colnames(bbdd_2015) == "A¥O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2015)[colnames(bbdd_2015) == "A\xa5O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2016)[colnames(bbdd_2016) == "A¥O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2016)[colnames(bbdd_2016) == "A\xa5O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2017)[colnames(bbdd_2017) == "A¥O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2017)[colnames(bbdd_2017) == "A\xa5O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2018)[colnames(bbdd_2018) == "A¥O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2018)[colnames(bbdd_2018) == "A\xa5O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2019)[colnames(bbdd_2019) == "A¥O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2019)[colnames(bbdd_2019) == "A\xa5O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2020)[colnames(bbdd_2020) == "A\xd1O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2021)[colnames(bbdd_2021) == "A\xd1O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2022)[colnames(bbdd_2022) == "GLOSA MATERIA"] <- "MATERIA"
colnames(bbdd_2022)[colnames(bbdd_2022) == "AÃ‘O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2023)[colnames(bbdd_2023) == "GLOSA MATERIA"] <- "MATERIA"
colnames(bbdd_2023)[colnames(bbdd_2023) == "AÃ‘O INGRESO"] <- "AÑO INGRESO"

colnames(bbdd_2024)[colnames(bbdd_2024) == "GLOSA MATERIA"] <- "MATERIA"
colnames(bbdd_2024)[colnames(bbdd_2024) == "AÃ‘O INGRESO"] <- "AÑO INGRESO"
colnames(bbdd_2024)[colnames(bbdd_2024) == "CÓDIGO CORTE"] <- "COD. CORTE"
colnames(bbdd_2024)[colnames(bbdd_2024) == "CÓDIGO TRIBUNAL"] <- "COD. TRIBUNAL"



dataframes <- list(bbdd_2015, bbdd_2016, bbdd_2017, bbdd_2018, bbdd_2019, 
                   bbdd_2020, bbdd_2021, bbdd_2022, bbdd_2023, bbdd_2024)


bbdd_total_ingreso <- do.call(rbind, dataframes)

# corrige nombres de las columnas por clean code
colnames(bbdd_total_ingreso) <- colnames(bbdd_total_ingreso) %>%
  tolower() %>%
  gsub("\\.", "", .) %>%
  gsub(" ", "_", .)






