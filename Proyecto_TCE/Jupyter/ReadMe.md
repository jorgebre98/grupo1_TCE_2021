# Análisis Estadístico, Preprocesamiento, Codificación, Canal, Decodificación y Visualización

En esta carpeta se encuentran los códigos para llevar a cabo los siguientes procesos:

- **Análisis de datos**: consiste en utilizar la estadística para determinar los valores de promedio, 
desviación estándar, máximo, mínimo y la cantidad de muestras de los datos recopilados. Además de 
observar si presentan una distribución específica mediante el test de Anderson - Darling y valores 
atípicos por medio del test de Grubbs.

- **Preprocesamiento**: se realiza un preprocesamiento de los datos mediante el método de filtrado Moving 
Average con una topología Simple Moving Average y utilizando una magnitud de window de 3. Además, es 
importante destacar que la elección del filtro es debido a la simplicidad del mismo y la característica 
de reducir ruido aleatorio que se pueda presentar.

- **Codificación**: se procede a convertir los datos en una serie de bits, los cuales son la representación 
en binario de cada valor de BPM sin su parte fraccionaria, una vez hecho esto se realiza una codificación 
tipo Hamming para la posterior detección de errores una vez que el mensaje haya sido transmitido y 
recibido por el receptor

- **Canal**: La simulación de un canal AWGN se realiza tomando como referencia los bits transmitidos por 
el bloque de codificación. Una vez introducidos al canal se tiene la opción de definir una relación de 
potencia de la señal y potencia de ruido (SNR) específica para simular un entorno lo más parecido a la
realidad, con un ruido llamado Additive White Gaussian Noise (AWGN), el cual tiene la particularidad de
tener una probabilidad de eventos con una distribución gaussiana y un promedio de valores de 0, con la 
misma potencia en todo el espectro de frecuencias; como resultado a la adición de ruido se tiene una 
detección errónea de los datos al momento de hacerlos pasar por un bloque de Hard Decision con un umbral
de 0,5.

- **Decodificación**: se da mediante la adquisición de datos del canal para aplicarle un análisis de los 
errores del mensaje transmitido, con el fin de aplicar una decodificación y corrección de errores con la 
posibilidad de utilizar Hamming 7-4 y 15-11 según la codificación que se haya empleado antes de realizar 
la transmisión del mensaje.

- **Visualización**: Con el fin de evaluar el proceso realizado se visualizan los datos recopilados de la 
prueba de ecostress y los obtenidos tras la transmisión y recepción de la señal. Además, se obtienen las
gráficas de la tasa de errores por bit (BER) para la codificación Hamming (7,4) y (15,11) con el fin de 
comparar el desempeño de cada una. Por su enfoque médico es imprescindible conocer las zonas de entrenamiento
en las que se encuentra el paciente con el fin de conocer si el paciente tiene alteraciones cardiológicas 
inducidas por el esfuerzo.Por último, para validar la fiabilidad del proceso realizado se compara entre la
señal real y la obtenida,mediante métricas como el error cuadrático medio (MSE) y el Pbias se define el 
porcentaje de error entre ambas. Para una mayor accesibilidad y lectura se almacena los resultados en 
un documento PDF.

Para validar su funcionamiento solo es necesario ejecutar el código. En cuanto al código *Análisis de Datos.ipynb*
y *preprocesamiento.ipynb* se necesita el archivo *Dataset.xlsx*, el cuál proporciona los datos a utilizar.

El código de *preprocesamiento.ipynb* genera un archivo el cual corresponde a *senalfiltrada.xlsx*. Dicho
archivo contiene los datos tras el filtrado de la señal. Dicho archivo generado es de necesidad para el 
bloque de codificación, ya que este aplica la codificación Hamming a los datos ya filtrados para su posterior
modulación y transmisión. Además, este bloque genera el archivo *Senalcodificada.xlsx*, la cual contiene cada 
valor codificado y dicho documento es necesario para el bloque del canal, el cual adhiere ruido blanco a la 
señal codificada.Este bloque genera el archivo *BER.xlsx*, el cual es necesario para la decodificación de
la señal, pues se encargade realizar la detección y correción de errores, además de la decodificación de la 
señal recibida. Este bloque genera el archivo *datadeco.xlsx*.

Por último se realiza el bloque de visualización, con el fin de evaluar el proceso realizado se visualizan los datos 
recopilados de la prueba de ecostress y los obtenidos tras la transmisión y recepción de la señal. Este requiere los 
siguientes archivos:

- *Dataset.xlsx*: Señal obtenida de la prueba de ecostress.
- *Senalfiltrada.xlsx*: Señal generada tras el bloque de preprocesamiento.
- *BER.xlsx*: Este archivo debe generarse 2 veces, con codificación Hamming (7,4) y (15,11).
- *datadeco.xlsx*: Archivo generado tras la decodificación de la señal recibida.
- *SenalCruda*: Señal real, la cual sirve para realizar la comparación y verificar la fiabilidad del sistema.
