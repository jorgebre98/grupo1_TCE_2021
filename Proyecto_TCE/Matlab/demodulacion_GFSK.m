%****************  Demodulación GFSK (Gaussian Frequency Shift Keying) ************%
%Código base obtenido de:
%               S. Raza, ``MATLAB code for FSK modulation and demodulation", 2018. [Online] 
%               Disponible en: https://www.mathworks.com/matlabcentral/fileexchange/44821-matlab-code-for-fsk-modulation-and-demodulation
%
%Modificado por:
%               Jorge Andrés Brenes Alfaro
%               Pablo César Calderón Piedra
%               Kimberly María Carvajal Méndez
%               Jason Steven Valderde Picado

function [tiempo, mensaje]=demodulacion_GFSK()
    
    clear;
    clc;
    close all;
    tic ();                     %Inicio del conteo del tiempo

    [time,gfsk] = GFSK ();      %Obtención de modulación gfsk
    
    %Parámetros
    fo = 2;                     %Frecuencia de "0"
    f1 = 5;                     %Frecuencia de "1"
    t=0:2*pi/99:2*pi;           %Tiempo
    bits = [];                  %Bits que comprenden el mensaje
    
    for n = 100:100:length(gfsk)
        % Portadoras
        y1 = sin(fo*t);
        y2 = sin(f1*t);
        
        % Demodulacion
        demod_fo = y1.*gfsk((n-(100-1)):n);
        demod_f1 = y2.*gfsk((n-(100-1)):n);
        
        % Integrador
        z0 = trapz(t,demod_fo);
        z1 = trapz(t,demod_f1);
        umbral_0 = abs(round(2*z0));
        umbral_1 = abs(round(2*z1));
        
        % Desición
        if (umbral_0 > 1/2)
            bit = 0;
        elseif (umbral_1 > 1/2)
            bit = 1;
        end
        bits = [bits bit];        %Se guardan los bits demodulados
    end
    
    % Expansión de cadena de bits
    mensaje = [];
    for n = 1:length(bits)
        if (bits(n) == 1)
            msj = ones(1,100);
        else
            msj = zeros(1,100);
        end
        mensaje = [mensaje msj];
    end
    
%************** Gráficas **************%
    figure(4);
    
    %Grafica Modulación GFSK
    subplot(2,1,1);
    plot(gfsk, "m", "linewidth", 1.5);
    grid on;
    title("Señal Recibida");
    axis([0 length(gfsk) -1.5 1.5]);
    xlabel("Tiempo"); ylabel("Amplitud");

    %Grafica Binaria recibida
    subplot(2,1,2);
    plot(mensaje,"linewidth",2.5);
    grid on;
    axis([0 length(mensaje) -0.5 1.5]);
    title("Señal Demodulada");
    xlabel("Tiempo"); ylabel("Amplitud");
        
    tiempo = toc ();    %Fin del conteo del tiempo
end
