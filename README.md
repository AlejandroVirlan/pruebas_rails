# README

Proyecto creado en Rails 7

Ejecutar el comando ***bundle install*** y luego ***rails db:reset*** para que se cree la base de datos, se migren las migraciones y se rellenen las tablas con datos de prueba de la seeds.

Creado en el controlador 4 funciones para 4 endpoints. Estas funciones son las siguientes:

* **creator_notices** y **reader_notices**: Ya que no sabía exactamente a que tipo de personas estaba referido, para asegurarme, lo he hecho de los dos tipos. 
Los endpoints de estas dos funciones son ***api/v1/creator-notices*** para ver los comunicados de los creadores y ***api/v1/reader-notices***, para ver los comunicados de los receptores.

* **show_notices**: Es la refactorización de las dos anteriores, solo que ahora se le pasa un **tipo de persona** como parametro en la URL. Si se le pasa un **0**, se indica que es un **receptor**,
  y si se le pasa un **1** se está indicando que es un **creador**. En el caso de pasar cualquier otro tipo, se mostrará que es un ***Tipo incorrecto***. El endpoint para acceder es, por ejemplo:
  ***api/v1/notices?type=0***.

* **show_threads**: Este último es un extra para poder darle uso y funcionamiento al campo de **comunicado_anterior_id**. Este endpoint muestra el hilo de mensajes que existen desde un **id de comunicado** 
hasta que sea **nil**. Para acceder, el endpoint es ***api/v1/threads***

* **resources** de todas las tablas para comprobar el funcionamiento de la API.