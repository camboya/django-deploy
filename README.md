![Inove banner](inove.jpg)
Inove Escuela de Código\
info@inove.com.ar\
Web: [Inove](http://inove.com.ar)

---

# Django - Deploy
En este repositorio encontrarán los siguientes archivos:

__Ejemplos que el profesor mostrará en clase__\

* **dockerfile** (Para generar la imagen de Docker)
* **docker-compose.yml** (Para configurar el contenedor de Docker para desarrollo)
* **requirements.txt** (Que contiene las librerías que vamos a estar usando)
* **/marvel** (Directorio raíz de nuestra aplicación)
---

# Deploy 🚀

### 1. Iniciar sesión en Heroku:
Una vez en el directorio de trabajo, debemos iniciar sesión en nuestra cuenta de Heroku, por medio del Heroku CLI con el comando:

**$** `heroku login`

Este comando nos lleva al navegador para iniciar sesión en heroku, una vez iniciada la sesión en el navegador, ya queda iniciada la sesión en nuestra consola.

### 2. Crear una aplicación en Heroku:
Con la sesión iniciada, debemos crear una aplicación con el comando:

**$** `heroku apps:create inove-marvel`

En donde "inove-marvel" es el nombre que nosotros vamos a asignarle a nuestra aplicación.

### 3. Crear una imagen para enviar a Heroku:
Debemos posicionarnos con la consola dentro del directorio "ejemplo_clase", en donde está nuestro Dockerfile, y ejecutaremos el comando:

**$** `heroku container:push web -a inove-marvel`

El flag "-a inove-marvel" no siempre es necesario, indica a qué aplicación vamos a enviarle la imagen docker.

### 4. Enviar la imágen a Heroku y ponerla en funcionamiento:
Este proceso se realiza con el comando:

**$** `heroku container:release web -a inove-marvel`

## Configuración de la base de datos

La base de datos que se utilizará para el proyecto es Heroku Postgres 
Info:
https://elements.heroku.com/addons/heroku-postgresql

Debemos asignar este complemento a la aplicación y luego declarar las variables de entorno correspondientes a las credenciales de la DB a nuestra aplicación, remplazando los valores determinados en el Dockerfile para:

* POSTGRES_DB
* POSTGRES_USER
* POSTGRES_PASSWORD
* POSTGRES_HOST
* DEBUG=True --> a False

El DEBUG se deja en True para realizar los ajustes necesarios para que la aplicación quede operativa, luego se pasa a False.

---

# Comando útiles 💻

### Ejecutar BASH en el contenedor remoto:
Podemos conectarnos al contenedor remoto con el comando:

**$** `heroku run bash`

Luego debemos realizar los comandos habituales para la puesta en marcha de la aplicación en Django:

* python manage.py makemigrations
* python manage.py migrate
* python manage.py createsuperuser

Es importante que la base de datos esté conectada a nuestra aplicación, una vez realizada las migraciones, es probable que sea necesario crear las entidades para los modelos de la aplicación e_commerce, para ello ejecutaremos los comandos:

* python manage.py makemigrations e_commerce
* python manage.py migrate  e_commerce

### Ver los logs del sistema:
Para ver los logs de la aplicación, tenemos dos opciones:

**$** `heroku logs --tail`
Nos permite ver los logs de la aplicación de Heroku, pero no los internos de Django, para ello debemos ejecutar el comando:

**$** `heroku run bash`

Luego, debemos ir a la carpeta de logs en /marvel/logs y ejecutar el comando:

**$** `tail general-batch.log`

En donde `tail general-batch.log` es el log general del sistema.

---
# Consultas
alumnos@inove.com.ar