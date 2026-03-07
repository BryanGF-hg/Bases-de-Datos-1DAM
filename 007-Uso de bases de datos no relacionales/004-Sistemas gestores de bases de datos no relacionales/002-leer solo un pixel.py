from PIL import Image

img = Image.open("favicon.png")
pixels = img.load()  # acceso directo a píxeles

variable1 = int(input("Dame la primera coordenada en X del pixel:"))
variable2= int(input("Dame la primera coordenada en Y del pixel:"))
pixel = pixels[(variable1),(variable2)]
print(pixel)

