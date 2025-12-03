<?php 

   $host = "localhost";
  $user = "equipo_paises";
  $pass = "Paises2526$";
  $db   = "paises";

  $conexion = new mysqli($host, $user, $pass, $db);

  $sql = "SELECT * FROM paises";

  $resultado = $conexion->query($sql);

  while ($fila = $resultado->fetch_assoc()) {
    echo '
    	<article>
      	<h3>'.$fila['pais'].'</h3>
        <p>'.$fila['ciudad'].'</p>
        <p>'.$fila['idioma'].'</p>
        <p>'.$fila['moneda'].'</p>
      </article>
    ';
  }

  $conexion->close();
 
?>
