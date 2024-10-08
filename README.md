# Statistics Tesis Data - Jbarriosl y Daniel Vilches

Este repositorio contiene un script que reune, ordena y limpia, los archivos de ingreso de causas al sistema procesal chileno, desde 2015 hasta 2024.

## Contenido del Repositorio

- **Archive.zip**: Archivo comprimido que contiene todos los archivos usados (input
- **Ingresos_por_materia_penal_2015_2024.rds**: Archivo de datos principal en formato `.rds`, que contiene toda la información sobre ingresos por materias penales desde el año 2015 hasta 2024.
- **clean.R**: Script de R utilizado para limpiar y estructurar los datos

## Requisitos previos

Para trabajar con este repositorio, asegúrate de tener instalado lo siguiente:
- **R y RStudio**: para ejecutar el análisis y los scripts.
- **Git** y **Git LFS**: para manejar archivos grandes y en caso de clonar el repositorio.

## Cargar los datos en R
Para cargar el archivo de datos Ingresos_por_materia_penal_2015_2024.rds en tu entorno de R, utiliza el siguiente código:

datos <- readRDS("Ingresos_por_materia_penal_2015_2024.rds")
