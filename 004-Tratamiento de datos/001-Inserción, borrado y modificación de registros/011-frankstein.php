<!-- Primero pongo el insert -->
<?php
	if(isset($_POST['id'])){
    $host = "localhost";$user = "equipo_paises";
    $pass = "Paises2526$";$db   = "paises";
    $conexion = new mysqli($host, $user, $pass, $db);
    $sql = "
    	INSERT INTO paises
      VALUES(
       	".$_POST['id'].",
        '".$_POST['pais']."',
        '".$_POST['ciudad']."',
        '".$_POST['idioma']."',
        '".$_POST['moneda']."'
      );
    ";
    $conexion->query($sql);
    $conexion->close();
  }
?>
<!-- Luego pongo la tabla -->
<table>
  <?php
    $host = "localhost";$user = "equipo_paises";
    $pass = "Paises2526$";$db   = "paises";
    $conexion = new mysqli($host, $user, $pass, $db);
    $sql = "SELECT * FROM paises";
    $resultado = $conexion->query($sql);
    while ($fila = $resultado->fetch_assoc()) {
      echo "<tr>";
      foreach($fila as $clave=>$valor){
        echo "<td>".$valor."</td>";
      }
      echo "</tr>";
    }
    $conexion->close();
  ?>
</table>
<!-- Por ultimo pongo el formulario -->
<form action="?" method="POST">
  <?php
    $host = "localhost";$user = "equipo_paises";
    $pass = "Paises2526$";$db   = "paises";
    $conexion = new mysqli($host, $user, $pass, $db);
    $sql = "SELECT * FROM paises LIMIT 1";
    $resultado = $conexion->query($sql);
    while ($fila = $resultado->fetch_assoc()) {
      foreach($fila as $clave=>$valor){
        echo "
        	<input 
          	type='text' 
            name='".$clave."' 
            placeholder='".$clave."'
          >";
      }
    }
    $conexion->close();
  ?>
  <input type="submit">
</form>
