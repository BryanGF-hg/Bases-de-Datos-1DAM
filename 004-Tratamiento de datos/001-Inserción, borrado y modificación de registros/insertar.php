 <?php
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
 ?>
todo ok
