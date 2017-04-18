<?php

include('config.php');

/* No conecta con la base de datos :\ */

$sql = "DROP TABLE `agrupacion_documental`, `descripcion_unidad_documental`, `eventos_personas`, `identidad_archivo`, `info_adicional_ud`, `instituciones`, `jurisdiccion`, `legajo`, `metadata_img_digitalizada`, `personas`, `ubicacion`, `unidad_documental`";
mysql_select_db( 'neogranadina' );
$retval = mysql_query($sql, $conn);
if(! $retval )
{
    die('No es posible borrar las tablas:' . mysql_error());
}
echo "Tabla borrada exitosamente\n";
mysql_close($conn);
?>
