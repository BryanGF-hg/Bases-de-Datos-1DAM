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
