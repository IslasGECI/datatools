<a href="https://www.islas.org.mx/"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# DataTools

DataTools es un conjunto de herramientas para transfomar datos de los proyectos de erradicación de
gato feral.

Los datos que recibimos de Isla Guadalupe e Isla Socorro tienen formatos diferentes. Para Isla Socorro usamos el script 
`get_weekly_summary_socorr.sh`

## Demo
### Isla Guadalupe
El resumen semanal del esfuerzo de trampeo lo obtenemos con la funcion `get_weekly_summary`.
Por ejemplo para obtener el resumen de los datos del 25 de julio del 2021 corremos la siguiente instrucción:
  ```bash
    ./src/get_weekly_summary.sh data/IG_POSICION_TRAMPAS_25JUL2021.csv 
  ```
### Isla Socorro
Los datos de socorro los mandan mensualmente; un archivo `*.xlsx` por mes divido en una hoja por semanas. 

Los pasos a seguir para curar los datos son los siguientes:
1. Subimos el archivo excell
2. Convertimos hoja por hoja a csv
3. Utilizamos `get_weekly_summary_socorro` en cada uno del los archivos csv.

## License

[GNU AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)
