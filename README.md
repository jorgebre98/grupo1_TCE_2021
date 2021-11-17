# grupo1_TCE_2021

## Proyecto de Taller de Comunicaciones Eléctricas

### Integrantes
### - Jorge Andrés Brenes Alfaro.
### - Pablo César Calderón Piedra.
### - Kimberly María Carvajal Méndez.
### - Jason Steven Valverde Picado.

Descripción: 

Primeramente se desarrolla la etapa de transmisión de un sistema prototipo RF para una aplicación médica, cuyo transmisor tenga la capacidad de capturar la información proveniente de un monitor de ritmo cardiaco. La función de esta etapa es que realice un análisis estadístico de los datos, un preprocesamiento de la señal; es decir, un filtrado de la señal, realice la codificación de la señal para su transmisión y por último, se realice un proceso de modulación que emplee tecnología BLE.

Se genera el diseño de la antena y el canal para su transmisión. Donde la antena tiene como función enviar el mensaje de información modulado hacia el receptor mediante
un canal de comunicación, por lo que se diseña la antena conforme al sistema de antena en el SoC nRF52832 esta basado en tecnología microstripline. En cuanto al canal modela de una manera aproximada, debido a que no se cuenta con un modelo preestablecido ni un modelo de parámetros S. Dado esto se utiliza un ruido de tipo AGWN para llevar a cabo el modelado.

Seguidamente se desarrolla la etapa de recepción de un sistema prototipo RF para una aplicación médica, cuyo receptor debe tener la capacidad de capturar la información proveniente del canal, en donde esta información debe ser demodulada por GFSK y seguido a esto decodificada, detectando y corrigiendo errores por la transmisión. Por último se debe hacer la visualización de los datos decodificados y observar la confiabilidad de la transmisión comparando los datos del receptor con los del transmisor.
