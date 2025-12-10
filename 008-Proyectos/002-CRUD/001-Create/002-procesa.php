<?php
  // Primero cogemos la información que viene del formulario
  $nombre = $_POST['nombre'];
  $puesto = $_POST['puesto'];
  $salario = $_POST['salario'];
  $fecha_contratacion = $_POST['fecha_contratacion'];
  $departamento = $_POST['departamento'];
  
  // Y luego metemos esa información en la base de datos

  $host = "localhost";
  $user = "empleados";
  $pass = "Empleados123$";
  $db   = "empleados";

  $conexion = new mysqli($host, $user, $pass, $db);
  
  
  // Insertamos los datos a la base de datos "empleados"
  $sql = "
  	INSERT INTO empleados VALUES(
  	 NULL,
  	 '".$nombre."',
  	 '".$puesto."',
  	 '".$salario."',
  	 '".$fecha_contratacion."',
  	 '".$departamento."'
  	);
  ";
	
  $conexion->query($sql);  
  $conexion->close();
?>
