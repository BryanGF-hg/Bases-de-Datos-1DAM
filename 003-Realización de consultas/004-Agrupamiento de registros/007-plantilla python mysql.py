import mysql.connector
conexion = mysql.connector.connect(
 host="localhost",user="clientes",password="Test123$",database="clientes"
)
cursor = conexion.cursor()
curso.execute('''
  SELECT COUNT(color)
  FROM productos; --resumen

  SELECT 
  COUNT(color) AS cantidad,
  color
  FROM productos
  GROUP BY color
  ORDER BY COUNT(color) ASC;
''')
filas = cursor.fetchall()
print(filas)
