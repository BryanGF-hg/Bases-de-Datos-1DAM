<form action="insertar.php" method="POST">
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
      	  name'".$clave."'
      	  placeholder='".$clave."'
      	 >";
     }
   }
   $conexion->close();
 ?>
 <input type="submit">
</form>
