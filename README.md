# Fastapi
Ejemplo de api restfull utilizando el framework fastapi https://fastapi.tiangolo.com/

## Requerimientos
Se debera insalar fastapi, uvicorn y sqlalchemy.

## Base Mysql
Utilizar el archivo dbscript.sql para la creacion de tablas e importacion de datos de inicio.

## Configuracion del conector de la base
Se deberan modificar las siguientes lineas del archivo database.py

```Python
SQLALCHEMY_DATABASE_URL = "mysql+mysqlconnector://usuario:password@base"
```
## Author
German Conejo
