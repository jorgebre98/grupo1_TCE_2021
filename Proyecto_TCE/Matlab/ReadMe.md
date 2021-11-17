## Modulación y Demodulación

En la presente carpeta se encontrará 2 archivos los cuales son encargados de 
realizar la modulación y demodulación de la señal para su transmisión y modulación.

- **Modulación**: tras la codificación de los datos estos pasan a través de un bloque de 
modulación que permitirá la transmisión de los datos, donde se toma el proceso de 
modulación aplicado a la tecnología BLE el cual corresponde a una modulación de tipo GFSK 
(*Gaussian Frequency Shift Keying*).

- **Demodulación**: tras la transmisión de la señal por medio de la antena y del canal utilizado
se realiza el proceso de demodulación el cual ...

Para validar dichos procesos se debe ejecutar los códigos desarrollados en el software Matlab, 
el cual para la modulación, el cual corresponde al archivo denomidado como *GFSK.m* muestra la 
secuencia de bits, la cual proviene del codificador. También muestra los bits después de aplicar
un filtro Gaussiano y por último la modulación GFSK, además de dar el valor del tiempo obtenido
tras la ejecución del script y un vector con los valores obtenidos de la modulación GFSK.

En cuanto al proceso de demodulación, de igual forma que el anterior, se debe ejecutar el código
en el software Matlab, donde su archivo corresponde a *demodulacion_GFSK.m*. Este muestra ...
