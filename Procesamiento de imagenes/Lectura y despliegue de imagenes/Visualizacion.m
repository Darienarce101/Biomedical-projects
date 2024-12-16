%% Limpieza
clc
clear
close all
%% Lectura y despliegue
RGB = imread("Arbol.jpg"); % Lectura de la imagen
BW = rgb2gray(RGB);        % Conversión a B/N

% Crear un espacio para mostrar las dos imágenes
figure; % Abrir una nueva ventana de figura

% Mostrar la imagen RGB en el lado izquierdo
subplot(1, 2, 1); % Dividir la figura en 1 fila y 2 columnas, seleccionar la primera
imshow(RGB); 
title("Imagen RGB"); % Agregar título

% Mostrar la imagen en escala de grises en el lado derecho
subplot(1, 2, 2); % Seleccionar la segunda columna
imshow(BW); 
title("Imagen en Escala de Grises"); % Agregar título

%% RGB layers
Rojo = RGB(:,:,1);
Azul = RGB(:,:,2);
Verd = RGB(:,:,3);

figure;
subplot(1,3,1);
imshow(Rojo);
title("Capa roja");

subplot(1,3,2);
imshow(Azul);
title("Capa azul");

subplot(1,3,3);
imshow(Rojo);
title("Capa verde");