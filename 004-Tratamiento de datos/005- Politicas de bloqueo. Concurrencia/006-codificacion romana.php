<?php
 function codificaRomana($cadena){
  for($i = 0;$i<strlen($cadena);$i++){
   $cadena[$i] = chr(ord($cadena[$i])+1); 
  }
  return $cadena;
 }
 function descodificaRomana($cadena){
  for($i = 0;$i<strlen($cadena);$i++){
   $cadena[$i] = chr(ord($cadena[$i])+1); 
  }
  return $cadena;
 }

 
 $original = "Hola, intento de hacer un texto más largo";
 echo $original;
 echo "<br>";
 
 $codificado = codificaRomana($original);
 echo $codificado;
 echo "<br>";
 
 $descodificado =  descodificaRomana($codificado);
 echo $descodificado;
 echo "<br>";  
?>
