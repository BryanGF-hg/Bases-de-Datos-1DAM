<!doctype html>
<html lang="es">
  <head>
    <title>Bryan Glot Fong</title>
    <meta charset="utf-8">
  </head>
  <body>
    <!--
     Es importante que el formulario tenga los mismos campos
     quel al base de datos
     Es decir: se debe mantener la base de datos
    -->
    
    <form action="002-procesa.php" method="POST">
      <input type="text" name="nombre" placeholder="nombre">
		   	<input type="text" name="puesto" placeholder="puesto">
      <input type="text" name="salario" placeholder="salario">
      <input type="text" name="fecha_contratacion" placeholder="fecha_contratacion">
      <input type="text" name="departamento" placeholder="departamento">
      <input type="submit">
    </form>
  </body>
</html>
