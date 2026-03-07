from PIL import Image

img = Image.open("favicon.png")
pixels = img.load()   # Pixel access object

width, height = img.size

for y in range(height):
    for x in range(width):
        pixel = pixels[x, y]
        print(f"Pixel at ({x},{y}) = {pixel}")
