

- Rodrigo Viladegut 51113
- Luciano Paniagua 52334

<img src="icon.png" align="left" width="64" height="64">

# Forest Survivor
## Videojuego desarrollado en el motor gráfico de godot para la materia de Infografía.

<img align="center" src="assets/art/background/BackgroundMenu.png">
<img align="center" src="assets/art/background/backgroundhell.png">

-----------------
## De que trata el Forest Survivor?
*Forest Survivor* es un juego de plataformas desarrollado por completo en el motod gráfico de Godot, en el cual, el principal objetivo es 
derrotar al malvado demonio, pasando antes por una serie de pruebas, como son los esbirros del malvado demonio, plataformas inestables y caídas libres.
Nuestro héroe deberá sobrevivir a estas pruebas, recogiendo monedas como incentivo, que lo ayudarán regenerando su vida.
Mucha suerte en esta aventura y esperemos la pueda completar de manera satisfactoria!

El sentido de Forest Survivor se basa en un tipico juego de plataformas en el motor grafico de Godot, que cuenta con un personaje principal, enemigos que se mueven por el mapa, monedas que son parte del objetivo del personaje principal, el mapa, el Boss y el nivel final. Para ejecutar el proyecto solo se debe ejecutar el archivo .exe, y si se quiere ver el código, debemos descargar e importar el proyecto de Github al Godot local.

Al comenzar a jugar, el usuario debe recolectar todas las monedas del mapa evitando morir. Este morirá si los enemigos chocan con el personaje prinicpal o si este cae fuera del mapa. Si es que este muere, se debera poner pausa con el botón ESC y reiniciar el juego, tambien entramos a pantalla completa con F11. El personaje principal podrá matar a los enemigos con su habilidad de disparo, la cual funciona con la tecla SPACE o boton izquierdo del mouse.

Para las animaciones usamos los tipicos AnimationPlayer y los organizamos en un AnimationTree, para que estas animaciones estes respectivamente organizadas y sean responsivas a lo que pase en pantalla. Luego usamos Sprites y Collisions shapes para hacer las colisiones, ademas de usar el RayCast2D para que cada personaje este ubicado correctamente sobre el poligono que es el mapa. Esta parte ademas usa layers para saber con que debe interactuar.

# Mucha suerte en tu travesía!




