<?php
  // Primero cogemos la id que viene del microformulario
  $id = $_POST['id'];
  
  // Y luego accedemos a esa información en la base de datos

  $host = "localhost";
  $user = "empleados";
  $pass = "Empleados123$";
  $db   = "empleados";

  $conexion = new mysqli($host, $user, $pass, $db);
  
  
  // Borramos los datos de un Identificador de la base de datos "empleados"
  $sql = "
  	DELETE FROM empleados
  	WHERE id = ".$id."
  ";
	
  $conexion->query($sql);  
  $conexion->close();
?>
