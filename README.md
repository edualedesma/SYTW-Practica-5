#Sistemas y Tecnologías Web - Práctica 5: Estadísticas de visitas al Acortador URL

**Autores: Eduardo Javier Acuña Ledesma | Sergio Díaz González**


###Descripción
Hemos mejorado la aplicación anterior añadiéndole la funcionalidad de las estadísticas por número de visitas. Si accedemos a las visitas de una url específica, podremos observar un diagrama de barras en el que se muestran los accesos agrupados por días.

###Instalación

Lo primero que haremos será clonar el repositorio de github SYTW-Practica-5 de la siguiente forma: `git clone git@github.com:alu3286/SYTW-Practica-5.git`.

Instalaremos las gemas necesarias: `bundle install`

Luego ejecutaremos en local, escribiendo `rake`en la consola.

Por último, iremos a http://localhost:4567/ para poder usar la aplicación.


###Visualización en Heroku
También puedes ver la aplicación en Heroku pinchando [aquí](http://acortador-url-est.herokuapp.com/).

###Comprobación de los tests
Para comprobar los test ejecutar en terminal `rake tests`.

Para comprobar test de los gráficos de estadísticas `rake test_estadisticas`.


# A URL shortener

See

* [DataMapper](http://datamapper.org/getting-started.html)
* [Haml](http://haml.info/)
* [Sinatra](http://www.sinatrarb.com/)
* [Deploying Rack-based Apps in Heroku](https://devcenter.heroku.com/articles/rack) y [Casiano Docs](http://nereida.deioc.ull.es/~lpp/perlexamples/node483.html#section:herokupostgres)
* [Intridea Omniauth](https://github.com/intridea/omniauth)
* [Chartkick](https://github.com/ankane/chartkick)


*Sistemas y Tecnologías Web - Eduardo Javier Acuña Ledesma | Sergio Díaz González*

