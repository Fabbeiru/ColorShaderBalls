# ColorShaderBalls by Fabián Alfonso Beirutti Pérez
Color shader balls sketch using GLSL on processing.

## Introducción
El objetivo de esta práctica de la asignatura de 4to, Creación de Interfaces de Usuario (CIU), es empezar a tratar los conceptos y las primitivas del tratamiento de señales de entrada como imágenes y vídeos. Para ello, se ha pedido el desarrollo de una aplicación que a partir de una señal de entrada de vídeo, el usuario pueda interactuar de alguna manera con el proyecto. Todo ello, usando el lenguaje de programación y el IDE llamado Processing. Este permite desarrollar código en diferentes lenguajes y/o modos, como puede ser processing (basado en Java), p5.js (librería de JavaScript), Python, entre otros.
<p align="center"><img src="/colorShaderBallsGif.gif" alt="Color shader balls sketch using GLSL on processing"></img></p>

## Controles
Los controles de la aplicación se mostrarán en todo momento por pantalla para facilitar su uso al usuario:
- **Tecla R:** Reinicia el juego.
- **Movimiento de la cabeza:** Mueve la boca animada que representa al jugador.
- **Tecla ESC:** Cierre de la aplicación.

## Descripción
Aprovechando que el lenguaje de programación que utiliza el IDE Processing por defecto está basado en Java, podemos desarrollar nuestro código utilizando el paradigma de programación de "Programación Orientada a Objetos". Así pues, hemos descrito tres clases de Java:
- **ColorShaderBalls:** clase principal.

## Explicación
### Clase ColorShaderBalls
Esta es la clase principal de la aplicación, la cual gestiona la información mostrada por pantalla al usuario (interfaz gráfica), esto es, el desarrollo de los métodos setup() y draw().

Como se puede ver, en la función *setup()*, cargamos e inicializamos todas las variables y objetos que vamos utilizar a lo largo del programa. Además, en la función *draw()*, controlamos, según los valores de variables booleanas que se manejan según la interacción del usuario con la aplicación, que pantallas se muestran por pantalla como puede ser el menú, el juego o la pantalla de victoria.

Por otra parte, esta misma clase es la que maneja la interacción entre el usuario y la interfaz mediante la implementación de los métodos keyPressed(), keyReleased(), mousePressed(), entre otros. Un ejemplo se muestra a continuación:

### Clase ColorShaderBalls

## Descarga y prueba
Para poder probar correctamente el código, descargar los ficheros (el .zip del repositorio) y en la carpeta llamada ColorShaderBalls se encuentran los archivos de la aplicación listos para probar y ejecutar. El archivo "README.md" y aquellos fuera de la carpeta del proyecto (ColorShaderBalls), son opcionales, si se descargan no deberían influir en el funcionamiento del código ya que, son usados para darle formato a la presentación y explicación del repositorio en la plataforma GitHub.

Adicionalmente, dado que se ha usado una librería adicional en esta práctica, para probarla será necesario:
- Añadir e importar la librería *controlP5* en Processing.

## Recursos empleados
Para la realización de este sistema planetario en 3D, se han consultado y/o utilizado los siguientes recursos:
* Guión de prácticas de la asignatura CIU
* <a href="https://processing.org">Página de oficial de Processing y sus referencias y ayudas</a>
* Processing IDE

Por otro lado, las librerías empleadas fueron:
* <a href="https://github.com/extrapixel/gif-animation">GifAnimation</a> de Patrick Meister.
* controlP5 de Andreas Schlegel.
