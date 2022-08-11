<a href="https://www.islas.org.mx/"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# DataTools

DataTools es un conjunto de herramientas para transfomar datos de los proyectos de erradicación de
gato feral.

Los datos que recibimos de Isla Guadalupe e Isla Socorro tienen formatos diferentes. Para Isla Socorro usamos el script 
`get_weekly_summary_socorro.sh`

## Demo
### Isla Guadalupe
El resumen semanal del esfuerzo de trampeo lo obtenemos con la función `get_weekly_summary`.
Por ejemplo para obtener el resumen de los datos del 25 de julio del 2021 corremos la siguiente instrucción:
  ```bash
    ./src/get_weekly_summary.sh data/IG_POSICION_TRAMPAS_25JUL2021.csv 
  ```
### Isla Socorro
Los datos de Socorro los mandan mensualmente; un archivo `*.xlsx` por mes dividido en una hoja por semanas. 

Los pasos a seguir para curar los datos son los siguientes:
1. Subimos el archivo excell
2. Convertimos hoja por hoja a csv usando `get_weekly_summary_socorro_from_excell.py` en cada uno del los archivos `*.xlsx`. Esto genera una serie de archivos `week_1.csv`, `week_2.csv`...
3. Agregamos los archivos `week_*` al _tabular data package_

## License

[GNU AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)
