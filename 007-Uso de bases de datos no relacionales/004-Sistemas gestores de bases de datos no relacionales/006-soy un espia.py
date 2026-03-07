from PIL import Image
import math

texto = "Este es un mensaje que quiero esconder"
print(texto)

# Convertimos cada carácter a su código (0..255 para ASCII; para otros, se fuerza a 0..255)
codigos = [ord(letra) % 256 for letra in texto]

# Elegimos un tamaño cuadrado lo más compacto posible
n = len(codigos)
lado = math.ceil(math.sqrt(n))

# Imagen nueva, fondo blanco
img = Image.new("RGB", (lado, lado), (255, 255, 255))
pixels = img.load()

# Guardar cada código en un píxel: (v, v, v) sobre fondo blanco
i = 0
for y in range(lado):
    for x in range(lado):
        if i < n:
            v = codigos[i]
            pixels[x, y] = (v, v, v)
            i += 1

img.save("texto_escondido.png")
print("Guardado: texto_escondido.png")
print("Códigos:")
for letra in texto:
    print(ord(letra))

