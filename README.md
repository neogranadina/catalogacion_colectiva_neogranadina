# catalogacion_colectiva_neogranadina
Construcción de una plataforma para exhibición y catalogación colectiva de los documentos digitalizados por la fundación @neogranadina

# Instalación

1. Cree una base de datos en la cual alojará la información. 
2. Edite su configuración de base de datos en el archivo config.php:

```php
$servername = "localhost";
$username = "root";
$password = "xxxxxx";
$dbname = "neogranadina";
```

3. Suba los archivos a su servidor al lugar donde funcionará el repositorio.
4. INSTALAR la BAse de DatoS [INSTALL] <<--
5. ¡Éxito! Se han instalado las tablas de la base de datos

# Errores y mejoras

Dejar un mensaje en Issues

# Versión

Pre-alpha

# Siguiente paso:

Utilizar un framework para ingresar la información a la base de datos e interactuar con las imágenes de archivo y las unidades documentales. ¿Opciones?
* Drupal
* Zend framework
