<!doctype html>
<html>
	<head>
  	<style>
    	html,body{width:100%;height:100%;padding:0px;margin:0px;}
    	body{display:flex;}
    	nav{background:#FF511C;padding:20px;gap:20px;display:flex;flex:1;flex-direction:column;}
    	nav a{background:#FFFFFF;color:#39D0BD;text-decoration:none;padding:10px;}
    	main{padding:20px;flex:4;}
     table td{padding:10px;}
     table{border:2px solid #39D0BD;width:100%;}   
    </style>
  </head>
  <body>
    <?php
      // Primero me conecto a la base de datos
      // Esto es común para todo el archivo
        $host = "localhost";
        $user = "tiendaonlinedamdaw";
        $pass = "Tiendaonlinedamdaw123$";
        $db   = "tiendaonlinedamdaw";

        $conexion = new mysqli($host, $user, $pass, $db);
    ?>

    <nav>
    <?php
      // Ahora lo que quiero es un listado de las tablas en la base de datos
        $resultado = $conexion->query("
          SHOW TABLES;
        ");
        while ($fila = $resultado->fetch_assoc()) {
          echo '<a href="?tabla='.$fila['Tables_in_'.$db].'">'.$fila['Tables_in_'.$db].'</a>';
        }
    ?>
    </nav>
    <main>
      <table>
      <?php
      // Y ahora creo los registros de la tabla
        $resultado = $conexion->query("
          SELECT * FROM ".$_GET['tabla'].";
        ");
        while ($fila = $resultado->fetch_assoc()) {
          echo "<tr>";
          foreach($fila as $clave=>$valor){
            echo "<td>".$valor."</td>";
          }
          echo "</tr>";
         }
      ?>
      </table>
    </main>
  </body>
</html>
