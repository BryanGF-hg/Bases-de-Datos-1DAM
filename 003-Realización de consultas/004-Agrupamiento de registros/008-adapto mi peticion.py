import mysql.connector
conexion = mysql.connector.connect(
 host="localhost",user="clientes",password="Test123$",database="clientes"
)
cursor = conexion.cursor()
cursor.execute('''
  SELECT COUNT(color)
  FROM productos;

  SELECT 
  COUNT(color) AS cantidad,
  color
  FROM productos
  GROUP BY color
  ORDER BY COUNT(color) ASC;
''')
filas = cursor.fetchall()
cantidades = []
etiquetas = []
for fila in filas:
 cantidades.append(fila[0])
 etiquetas.append(fila[1])
print(filas)
