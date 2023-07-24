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
1. Inicializamos la imagen con `docker-compose run islasgeci`
2. Subimos el archivo excell 
3. Convertimos hoja por hoja a csv usando `get_weekly_summary_socorro_from_excell.py` en cada uno del los archivos `*.xlsx`. Esto genera una serie de archivos `week_1.csv`, `week_2.csv`...
Esto genera una serie de archivos `week_1.csv`, `week_2.csv`...
```
docker run -v $PWD/results:/workdir/results -v $PWD:/workdir/data islasgeci/datatools python src/get_weekly_summary_socorro_from_excell.py 1 data/Tabla_gatos_mayo2023.xlsx
```
Los archivos se generan la carpeta `datos/results`.
Para obtener la tidy del estado diario de las trampas debemos correr:
```
docker run -v $PWD/results:/workdir/results -v $PWD:/workdir/data islasgeci/diferencias_morfometria_posicion_trampas src/make_table_tidy.R --data results/socorro_cleaned_format.csv --salida results/tidy_1.csv

```
Los archivos tidy se generan en la carpeta `datos/results`.

4. Agregamos los archivos `week_*` al _tabular data package_ al archivo `esfuerzo_capturas_gatos_socorro/esfuerzos_capturas_semanales_gatos_socorro.csv`
5. Sumamos los esfuerzos mensuales y agregamos a `esfuerzo_capturas_gatos_socorro/esfuerzos_capturas_mensuales_gatos_socorro.csv`


## License

[GNU AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)

## Pendientes
- [ ] La imagen madre en datatools debería ser la base
- [ ] La prueba en datatools que verifica que las cámaras se encuentren en la lista oficial, no nos dice cuáles cámaras son las que no se encuentran.
