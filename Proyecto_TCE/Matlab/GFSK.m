%**************** Modulación GFSK (Gaussian Frequency Shift Keying) ************%
%Código base obtenido de:
%               M. Andrade, Modulación FSK en Matlab, Youtube, 2017. Disponible en: https://www.youtube.com/watch?v=GTpAvGHI10o               
%               MathWorks, "gaussdesign", s.f. [Online] Disponible en: https://www.mathworks.com/help/signal/ref/gaussdesign.html

%Modificado por:
%               Jorge Andrés Brenes Alfaro
%               Pablo César Calderón Piedra
%               Kimberly María Carvajal Méndez
%               Jason Steven Valderde Picado

function [tiempo,gfsk] = GFSK ()
    clear;
    clc;
    close all;

    tic ();                     %Inicio del conteo del tiempo

    %Parámetros
    n = 10;                     %Cantidad de bits
    m = randi([0 1],1,n);       %Secuencia de bits
    fo = 2;                     %Frecuencia de "0"
    f1 = 5;                     %Frecuencia de "1"
    t=0:2*pi/99:2*pi;           %Tiempo       

    %Variables Auxiliares
    fsk = [];
    datos = [];

    %************** Modulación FSK **************%
    for n = 1:length(m)
    if m(n) == 0
      c = sin(fo*t);        %Portadora con frecuencia de "0"
      bin = zeros(1,100);   %Extensión de ceros

    else
      c = sin(f1*t);        %Portadora con frecuencia de "1"
      bin = ones(1,100);    %Extensión de unos
    end
    fsk = [fsk c];
    datos = [datos bin];
    end

    %************** Filtro Gaussiano **************%
    bt = 0.5;               %Ancho de banda relativo usado Bluethoot
    span = 2;               %Número de simbolos
    sps = 10;               %Número de muestras por simbolo
    h = gaussdesign(bt,span,sps);   %Filtro Gaussiano

    %************** Modulación GFSK **************%
    gfsk=conv(h,fsk);            %Convolución del filtro con la señal FSK

    %************** Gráficas **************%
    figure(1); hold on;

    %Grafica Binaria
    subplot(2,1,1);
    plot(datos, "b", "linewidth", 1.5);
    grid;
    title("Señal binaria");
    axis([0 100*length(m) -0.5 1.5]);
    xlabel("Tiempo"); ylabel("Amplitud");

    %Grafica Modulación FSK
    subplot(2,1,2);
    plot(fsk, "r","linewidth", 1.5);
    grid;
    title("Modulación FSK");
    axis([0 100*length(m) -1.5 1.5]);
    xlabel("Tiempo"); ylabel("Amplitud");

    figure(2); hold on;
    
    %Grafica Binaria filtrada
    subplot(2,1,1);
    datosGauss = conv(h,datos); 
    plot(datosGauss, "g", "linewidth", 1.5);
    grid;
    title("Señal binaria filtrada");
    axis([0 100*length(m) -0.5 1.5]);
    xlabel("Tiempo"); ylabel("Amplitud");

    %Grafica Modulación GFSK
    subplot(2,1,2);
    plot(gfsk, "m", "linewidth", 1.5);
    grid;
    title("Modulación GFSK");
    axis([0 100*length(m) -1.5 1.5]);
    xlabel("Tiempo"); ylabel("Amplitud");

    %Grafica de la respuesta al impulso del filtro Gaussiano
    figure(3);
    plot(h, "c", "linewidth", 1.5);
    title("Respuesta al impulso del fitro Gaussiano");
    xlabel("Tiempo"); ylabel("Amplitud");

    tiempo = toc ();    %Fin del conteo del tiempo
end