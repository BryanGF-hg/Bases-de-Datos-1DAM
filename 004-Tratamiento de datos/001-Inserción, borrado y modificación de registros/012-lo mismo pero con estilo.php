<!doctype html>
<html>
	<head>
  	<style>
    	 body,html{width:100%;height:100%;font-family:sans-serif;}
      body{display:flex;flex-direction:column;background:lightgrey;
      justify-content:center;align-items:center;}
      header,main,footer{background:white;width:800px;padding:20px;}
      table{border:2px solid #FFEAD2;padding:10px;text-align:center;}
      form{columns:2;}
      form input{padding:10px;margin:10px;width:100%;box-sizing:border-box;}
    </style>
  </head>
  <body>
  	<header>
    	<h1>Gestor de equipos de paises</h1>
    </header>
    <main>
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
    </main>
    <footer>
    </footer>
  </body>
</html>
