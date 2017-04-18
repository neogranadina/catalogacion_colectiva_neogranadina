<?php

include('config.php');

$query = file_get_contents(RAIZ_APLICACION . '/db/neogranadina_db.sql');

if (mysqli_multi_query($conn, $query)) {
    echo "¡Éxito! Se han instalado las tablas de la base de datos <br/>";
} else {
    echo "Error al crear  las tablas. Por favor revisar el siguiente mensaje de error: " . $conn->error;
}

$conn->close();

?>