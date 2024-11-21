# Datos para tesis de estadistica - Juan Barrios y Daniel Vilches
Contacto: jbarriosl@uc.cl y devilches@uc.cl

# Proyecto de Integración de Bases de Datos Judiciales

Este proyecto tiene como objetivo automatizar la importación, limpieza y unificación de múltiples bases de datos judiciales, que se encuentran en archivos CSV comprimidos. El script procesa los datos, corrige inconsistencias en los nombres de columnas y combina todas las bases de datos en un solo dataframe unificado para su análisis posterior.

# Consulta de datos (script en R)

Estos son datos publicos, por lo tanto si quieres consultados en R, usa las siguientes lineas de codigo:

	url <- "https://github.com/jbarriosl/statistics-tesis-data/raw/main/Ingresos_por_materia_penal_2015_2024.rds"
	datos <- readRDS(url(url))"


## Dependencias

Este proyecto requiere las siguientes librerías de R:

	1. dplyr: Para la manipulación de datos.
	2. rio: Para la importación de archivos CSV.
	
## Ejecución del Script

Si necesitas o deseas ejecutar el script, sigue los siguientes pasos:

	1.	Asegúrate de tener instaladas las librerías necesarias (dplyr, rio).
	2.	Ejecuta el archivo "script.r"" completo desde tu entorno de R.

El resultado final será un único dataframe que contiene la información consolidada de todas las bases de datos originales, listo para su análisis.



