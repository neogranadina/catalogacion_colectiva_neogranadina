<?php

include('config.php');

$sql = "DROP TABLE `bio_dataset`, `esquemas`, `eventos_instituciones`, `instituciones`, `persona`";
mysql_select_db( 'neogranadina' );
$retval = mysql_query($sql, $conn);
if(! $retval )
{
    die('No es posible borrar las tablas:' . mysql_error());
}
echo "Tabla borrada exitosamente\n";
mysql_close($conn);
?>