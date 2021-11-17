# Análisis Estadístico, Preprocesamiento, Codificación, Canal y Decodificación

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

- **Canal**: 

- **Decodificación**: 

Para validar su funcionamiento solo es necesario ejecutar el código. En cuanto al código *Análisis de Datos.ipynb*
y *preprocesamiento.ipynb* se necesita el archivo *Dataset.xlsx*, el cuál proporciona los datos a utilizar.

El código de *preprocesamiento.ipynb* genera un archivo el cual corresponde a *senalfiltrada.xlsx*. Dicho
archivo contiene los datos tras el filtrado de la señal. Dicho archivo generado es de necesidad para el 
bloque de codificación, ya que este aplica la codificación Hamming a los datos ya filtrados para su posterior
modulación y transmisión. Además, este bloque genera el archivo *Senalcodificada.xlsx*, la cual contiene cada valor
codificado.
