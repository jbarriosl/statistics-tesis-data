# Statistics Tesis Data

Este repositorio contiene los archivos y datos relacionados con el análisis de materias penales realizado como parte de la tesis del magíster en estadística. Los datos cubren un rango de años desde 2015 hasta 2024 e incluyen información sobre diferentes tipos de delitos.

## Contenido del Repositorio

- **.gitattributes**: Archivo de configuración de Git LFS para manejar archivos grandes de manera eficiente.
- **.gitignore**: Lista de archivos y directorios que deben ser ignorados por Git.
- **Archive.zip**: Archivo comprimido que contiene otros archivos de soporte o datos adicionales.
- **Ingresos_por_materia_penal_2015_2024.rds**: Archivo de datos principal en formato `.rds`, que contiene toda la información sobre ingresos por materias penales desde el año 2015 hasta 2024.
- **clean.R**: Script de R utilizado para limpiar y procesar los datos.
- **statistics-tesis-data.Rproj**: Archivo de proyecto de RStudio para organizar y trabajar en este proyecto de manera eficiente.
- **.DS_Store**: Archivo generado por macOS que contiene metadatos del sistema de archivos (puede eliminarse del repositorio ya que no es necesario).

## Requisitos previos

Para trabajar con este repositorio, asegúrate de tener instalado lo siguiente:
- **R y RStudio**: para ejecutar el análisis y los scripts.
- **Git** y **Git LFS**: para manejar archivos grandes y clonar el repositorio.
- Librerías de R: `dplyr`, `stringr`, `lubridate`, y `zip`.

## Cómo clonar este repositorio
Para clonar el repositorio, usa el siguiente comando:

git clone https://github.com/tu-usuario/tu-repositorio.git

## Cargar los datos en R
Para cargar el archivo de datos Ingresos_por_materia_penal_2015_2024.rds en tu entorno de R, utiliza el siguiente código:

datos <- readRDS("Ingresos_por_materia_penal_2015_2024.rds")
