library(dplyr)
library(rio)

zipF <- "Archive.zip"
outDir <-"Archive"
unzip(zipF,exdir=outDir)

# importa las bbdd -------------------------------------------------------------
archivos <- list.files("Archive",
                       pattern = "Ingresos por Materia Penal .*\\.csv",
                       full.names = TRUE)
for (archivo in archivos) {
  nombre_base <- gsub(".*Ingresos por Materia Penal (\\d{4}).*|.*Ingresos por Materia Penal (.*-.*)\\.csv",
                      "\\1\\2",
                      basename(archivo))
  nombre_base <- ifelse(nombre_base == "ene-jun 2024", "2024", nombre_base)
  nombre_base <- paste0("bbdd_", nombre_base)
  assign(nombre_base, rio::import(archivo))
}

nombre_bases = ls(pattern = "bbdd_")

# limpieza nombres bbdds ------------------------------------------------------

# Función para realizar las transformaciones en cada dataframe
aplicar_transformaciones <- function(df) {
  # Reemplazos de nombres de columnas para corregir problemas específicos
  reemplazos <- list(
    "A¥O INGRESO" = "AÑO INGRESO",
    "A\xa5O INGRESO" = "AÑO INGRESO",
    "A\xd1O INGRESO" = "AÑO INGRESO",
    "AÃ‘O INGRESO" = "AÑO INGRESO",
    "AÃ\u0091O INGRESO" = "AÑO INGRESO",
    "AÃ\u0091O" = "AÑO",
    "GLOSA MATERIA" = "MATERIA",
    "CÓDIGO CORTE" = "COD. CORTE",
    "CÃ\u0093DIGO TRIBUNAL" = "COD. TRIBUNAL",
    "CÃ\u0093DIGO CORTE" = "COD. CORTE",
    "CÓDIGO TRIBUNAL" = "COD. TRIBUNAL",
    "Nø" = "N",
    "N°" = "N",
    "TOTAL INGRESOS POR MATERIAS(*)" = "TOTAL INGRESOS POR MATERIAS"
  )
  
  # Convertir los nombres de las columnas a UTF-8 para evitar problemas de codificación
  colnames(df) <- iconv(colnames(df), from = "latin1", to = "UTF-8", sub = "")
  
  # Realizar los reemplazos de nombres de columnas según el diccionario
  for (col_name in names(reemplazos)) {
    new_name <- reemplazos[[col_name]]
    if (col_name %in% colnames(df)) {
      colnames(df)[colnames(df) == col_name] <- new_name
    }
  }
  
  # Convertir a minúsculas y limpiar nombres
  colnames(df) <- colnames(df) %>%
    tolower() %>%
    gsub("\\.", "", .) %>%
    gsub(" ", "_", .)
  
  df$rit <- as.character(df$rit)
  return(df)
}

# Aplicar las transformaciones a todos los dataframes en el entorno
for (base in nombre_bases) {
  df <- get(base)
  df <- aplicar_transformaciones(df)
  assign(base, df)
}


# unir -------------------------------------------------------------------------
# selecciona las columnas a utilizar
bbdd_2015 <- bbdd_2015[, -c(1, 13, 14)]
bbdd_2016 <- bbdd_2016[, -c(1, 13, 14)]
bbdd_2017 <- bbdd_2017[, -c(1, 13, 14)]
bbdd_2018 <- bbdd_2018[, -c(1, 13, 14)]
bbdd_2019 <- bbdd_2019[, -c(1, 13, 14)]
bbdd_2020 <- bbdd_2020[, -c(1, 13)]
bbdd_2021 <- bbdd_2021[, -c(5, 13, 14, 15)]
bbdd_2022 <- bbdd_2022[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
bbdd_2023 <- bbdd_2023[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
bbdd_2024 <- bbdd_2024[, -c(1, 6, 14, 15, 16, 17, 18)]

df <- list(bbdd_2015, bbdd_2016, bbdd_2017, bbdd_2018, bbdd_2019, 
                   bbdd_2020, bbdd_2021, bbdd_2022, bbdd_2023, bbdd_2024)

# combina todoen base a todo lo visto y siendo este el codigo final, redacta el readme

library(dplyr)
library(rio)

zipF <- "Archive.zip"
outDir <-"Archive"
unzip(zipF,exdir=outDir)

# importa las bbdd -------------------------------------------------------------
archivos <- list.files("Archive",
                       pattern = "Ingresos por Materia Penal .*\\.csv",
                       full.names = TRUE)
for (archivo in archivos) {
  nombre_base <- gsub(".*Ingresos por Materia Penal (\\d{4}).*|.*Ingresos por Materia Penal (.*-.*)\\.csv",
                      "\\1\\2",
                      basename(archivo))
  nombre_base <- ifelse(nombre_base == "ene-jun 2024", "2024", nombre_base)
  nombre_base <- paste0("bbdd_", nombre_base)
  assign(nombre_base, rio::import(archivo))
}

nombre_bases = ls(pattern = "bbdd_")

# limpieza nombres bbdds ------------------------------------------------------

# Función para realizar las transformaciones en cada dataframe
aplicar_transformaciones <- function(df) {
  # Reemplazos de nombres de columnas para corregir problemas específicos
  reemplazos <- list(
    "A¥O INGRESO" = "AÑO INGRESO",
    "A\xa5O INGRESO" = "AÑO INGRESO",
    "A\xd1O INGRESO" = "AÑO INGRESO",
    "AÃ‘O INGRESO" = "AÑO INGRESO",
    "AÃ\u0091O INGRESO" = "AÑO INGRESO",
    "AÃ\u0091O" = "AÑO",
    "GLOSA MATERIA" = "MATERIA",
    "CÓDIGO CORTE" = "COD. CORTE",
    "CÃ\u0093DIGO TRIBUNAL" = "COD. TRIBUNAL",
    "CÃ\u0093DIGO CORTE" = "COD. CORTE",
    "CÓDIGO TRIBUNAL" = "COD. TRIBUNAL",
    "Nø" = "N",
    "N°" = "N",
    "TOTAL INGRESOS POR MATERIAS(*)" = "TOTAL INGRESOS POR MATERIAS"
  )
  
  # Convertir los nombres de las columnas a UTF-8 para evitar problemas de codificación
  colnames(df) <- iconv(colnames(df), from = "latin1", to = "UTF-8", sub = "")
  
  # Realizar los reemplazos de nombres de columnas según el diccionario
  for (col_name in names(reemplazos)) {
    new_name <- reemplazos[[col_name]]
    if (col_name %in% colnames(df)) {
      colnames(df)[colnames(df) == col_name] <- new_name
    }
  }
  
  # Convertir a minúsculas y limpiar nombres
  colnames(df) <- colnames(df) %>%
    tolower() %>%
    gsub("\\.", "", .) %>%
    gsub(" ", "_", .)
  
  df$rit <- as.character(df$rit)
  return(df)
}

# Aplicar las transformaciones a todos los dataframes en el entorno
for (base in nombre_bases) {
  df <- get(base)
  df <- aplicar_transformaciones(df)
  assign(base, df)
}


# unir -------------------------------------------------------------------------
# selecciona las columnas a utilizar
bbdd_2015 <- bbdd_2015[, -c(1, 13, 14)]
bbdd_2016 <- bbdd_2016[, -c(1, 13, 14)]
bbdd_2017 <- bbdd_2017[, -c(1, 13, 14)]
bbdd_2018 <- bbdd_2018[, -c(1, 13, 14)]
bbdd_2019 <- bbdd_2019[, -c(1, 13, 14)]
bbdd_2020 <- bbdd_2020[, -c(1, 13)]
bbdd_2021 <- bbdd_2021[, -c(5, 13, 14, 15)]
bbdd_2022 <- bbdd_2022[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
bbdd_2023 <- bbdd_2023[, -c(1, 6, 8, 15, 16, 17, 18, 19)]
bbdd_2024 <- bbdd_2024[, -c(1, 6, 14, 15, 16, 17, 18)]

df <- list(bbdd_2015, bbdd_2016, bbdd_2017, bbdd_2018, bbdd_2019, 
                   bbdd_2020, bbdd_2021, bbdd_2022, bbdd_2023, bbdd_2024)

# combina todo
df <- do.call(rbind, df)
