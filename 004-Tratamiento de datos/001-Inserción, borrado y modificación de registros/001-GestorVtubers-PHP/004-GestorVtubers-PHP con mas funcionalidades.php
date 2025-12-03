<!-- Estructura para Eliminar IDs dentro de la tabla holoen_vtubers-->
<?php
  if(isset($_GET['operacion'])){
     $host = "localhost";$user = "usuario_vtubers";
     $pass = "Vtubers123$";$db   = "vtubers";
     $conexion = new mysqli($host, $user, $pass, $db);
     $sql = "
      	DELETE FROM holoen_vtubers
      	WHERE id = ".$_GET['id']."
     ";
     $conexion->query($sql);
     $conexion->close();
   }
?>


<!-- Estructura para Eliminar -- TODOS ---  IDs dentro de la tabla holoen_vtubers-->
<?php
  if(isset($_GET['eliminar'])){
     $host = "localhost";$user = "usuario_vtubers";
     $pass = "Vtubers123$";$db   = "vtubers";
     $conexion = new mysqli($host, $user, $pass, $db);
     $sql = "
      	DELETE FROM holoen_vtubers;
     ";
     $conexion->query($sql);
     $conexion->close();
   }
?>

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
    	<h1>Gestor de Miembros de Hololive English</h1>
    </header>
    <main>
      <!-- insert -->
     <?php
	     if(isset($_POST['id'])){
         $host = "localhost";$user = "equipo_paises";
         $pass = "Paises2526$";$db   = "paises";
         $conexion = new mysqli($host, $user, $pass, $db);
         $sql = "
         	INSERT INTO holoen_vtubers
           VALUES(
            	".$_POST['id'].",
             '".$_POST['Name']."',
             '".$_POST['Branch']."',
             '".$_POST['MainColor']."',
             '".$_POST['BackgroundColor']."'
           );
         ";
         $conexion->query($sql);
         $conexion->close();
       }
     ?>
     
     <!-- Tabla -->
     <table>
       <?php
         $host = "localhost";$user = "usuario_vtubers";
         $pass = "Vtubers123$";$db   = "vtubers";
         $conexion = new mysqli($host, $user, $pass, $db);
         $sql = "SELECT * FROM holoen_vtubers";
         $resultado = $conexion->query($sql);
         while ($fila = $resultado->fetch_assoc()) {
           echo "<tr>";
           foreach($fila as $clave=>$valor){
             echo "<td>".$valor."</td>";
           }
           echo "
            <td>
             <a href='?operacion=eliminar&id=".$fila['id']."'>
              ❌️
             </a>
            </td>";   /////// BOTON DE ELIMINAR ///////
           echo "</tr>";
         }
         $conexion->close();
       ?>
     </table>
     <!-- Formulario(sirve para crear nuevos IDs dentro de la tabla) -->
     <form action="?" method="POST">
      <?php
         $host = "localhost";$user = "usuario_vtubers";
         $pass = "Vtubers123$";$db   = "vtubers";
         $conexion = new mysqli($host, $user, $pass, $db);
         $sql = "SELECT * FROM holoen_vtubers LIMIT 1";
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
      
     <form>
      <a href='?eliminar=eliminar&id=".$fila['id']."'>
       Eliminar
      </a>     
     </form>
     
    </main>
    <footer>
    </footer>
  </body>
</html>
