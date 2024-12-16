# Instalamos paquetería para la lectura de imágenes
if (!require("jpeg")) {
  install.packages("jpeg")
}

if (!require("magick")) {
  install.packages("magick")
}

library(magick) # Para conversión y manipulación de imágenes
library(jpeg)   # Para la lectura inicial si es necesario

# Carga de la imagen usando magick
image_path <- "Arbol.jpg"  # Ruta de la imagen
img_magick <- image_read(image_path)  # Leer la imagen como un objeto magick

# Convertir a escala de grises
grayscale_image <- image_convert(img_magick, colorspace = "gray")

# Primera ventana: Mostrar imágenes RGB y en escala de grises
windows(title = "Imagen RGB y Escala de Grises")  # Abre una nueva ventana
par(mfrow = c(1, 2))  # Configuración para mostrar dos imágenes lado a lado

# Mostrar imagen original (RGB)
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Imagen RGB")  # Lienzo en blanco
rasterImage(as.raster(img_magick), 1, 1, 2, 2)  # Imagen original

# Mostrar imagen en escala de grises (BW)
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Imagen BW")  # Lienzo en blanco
rasterImage(as.raster(grayscale_image), 1, 1, 2, 2)  # Imagen en escala de grises

# Convertir imagen a array para acceder a las capas RGB
image_array <- as.integer(image_data(img_magick))

# Extraer las capas de color (Red, Green, Blue)
red_layer <- image_array[,,1]
green_layer <- image_array[,,2]
blue_layer <- image_array[,,3]

# Convertir las capas individuales a objetos raster
red_image <- as.raster(red_layer / 255)    # Escalar valores entre 0 y 1
green_image <- as.raster(green_layer / 255)
blue_image <- as.raster(blue_layer / 255)

# Segunda ventana: Mostrar las capas RGB
windows(title = "Capas RGB")  # Abre una nueva ventana
par(mfrow = c(2, 2))  # Configuración para mostrar cuatro imágenes (2x2)

# Imagen original (RGB)
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Imagen RGB")
rasterImage(as.raster(img_magick), 1, 1, 2, 2)

# Capa Roja
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Capa Roja")
rasterImage(red_image, 1, 1, 2, 2)

# Capa Verde
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Capa Verde")
rasterImage(green_image, 1, 1, 2, 2)

# Capa Azul
plot(1:2, type = "n", xlab = "", ylab = "", axes = FALSE, main = "Capa Azul")
rasterImage(blue_image, 1, 1, 2, 2)
