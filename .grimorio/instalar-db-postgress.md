# Instalando Postgress en Unix

`sudo apt update`
`sudo apt install postgresql`
`sudo service postgresql start`

Despues podemos tener una terminal con el user de postgres cargada:
`sudo -i -u postgres`

Ahi podemos lanzar la interfaz interactiva:
`psql`
*Para salir de `psql`, `\q`*

Para cambiar la password DENTRO de `psql:
`ALTER USER postgres PASSWORD '<new-password>';`

## Tags
@programacion

## Pergaminos

## Referencias
[https://www.atlassian.com/data/admin/how-to-set-the-default-user-password-in-postgresql]
