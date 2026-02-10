Una palabra (o una frase) puede tener varios significados (semánticos):

fresa = 
color = rojo
tamaño = pequeño
sabor = acido, dulce
textura = solida, rugosa
perecedero = perecedero
temporada = si

platano - cereza

SQL = fresa LIKE platano
SQL = fresa LIKE cereza

Para realizar un entrenamiento hacen falta embeddings
Los embeddings (vectores) los calcula un modelo de IA en modo inferencia
Geeneralmente se usa el modelo nomic

ollama pull nomic-embed-text:v1.5

