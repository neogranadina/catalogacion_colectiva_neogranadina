-- Descripción de las fuentes:

CREATE TABLE `identidad_archivo` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`sigla` varchar(20) COLLATE utf8_unicode_ci NOT NULL, 
	`id_ubicacion` text COLLATE utf8_unicode_ci,
	`subsistema` text COLLATE utf8_unicode_ci,
	--  Subsistema del Archivo. Ejemplo: Archivo universitario, archivo regional, archivo local, archivo general, archivo de gestión... [crear opciones cerradas en un formulario]
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `agrupacion_documental` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_identidad_archivo` int(10) unsigned NOT NULL,
	`nivel_descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	-- fondo, sección, subsección, serie, subserie [crear opciones cerradas en un formulario]
	`titulo` varchar(255) COLLATE utf8_unicode_ci,
	`fecha_inicial` date,
	`fecha_final` date,
	`volumen`text COLLATE utf8_unicode_ci,
	`soporte` varchar(255),
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `legajo` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_agrupacion_documental` int(10)  unsigned NOT NULL,
	`titulo` varchar(255) COLLATE utf8_unicode_ci,
	`fecha_inicial` date,
	`fecha_final` date,
	`soporte` varchar(255),
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `unidad_documental` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_legajo` int(10)  unsigned NOT NULL,
	`nivel_descripcion` varchar(255) COLLATE  utf8_unicode_ci NOT NULL,
	-- unidad documental compuesta, unidad documental simple [crear opciones cerradas en un formulario]
	`titulo` varchar(255) COLLATE utf8_unicode_ci,
	`fecha_inicial` date,
	`fecha_final` date,
	`soporte` varchar(255),
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `descripcion_unidad_documental` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_unidad_documental` int(10) unsigned NOT NULL,
	`id_imagen_dig` int(10) unsigned NOT NULL,
	-- metadata imagen digitalizada en tabla metadata_img_digitalizada
	`id_personas` text COLLATE utf8_unicode_ci,
	`institucion_archivistica` text COLLATE utf8_unicode_ci,
	`id_tipo_info_adicional` int(10) NOT NULL,
	-- en tabla relacional por la cantidad de variables
	`texto` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- tabla para las variables de la información adicional en la descripción documental.
CREATE TABLE `info_adicional_ud` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`tipo_info_adicional` varchar(255) COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- inserción de variables en la tabla `info_adicional_ud`

INSERT INTO info_adicional_ud VALUES 
("1","Lugar de creación"),
("2", "Lugar(es) mencionados"),
("3", "Autor(es)"),
("4", "Escribano"),
("5", "Tipo de documento"),
("6", "Personas mencionadas"),
("7", "Instituciones mencionadas"),
("8", "Evento(s)"),
("9", "Sinópsis"),
("10", "Transcripción");

CREATE TABLE `metadata_img_digitalizada` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_creador` text COLLATE utf8_unicode_ci,
	`institucion_archivistica` text COLLATE utf8_unicode_ci,
	`encargado_digitalizacion` text COLLATE utf8_unicode_ci,
	`resolucion_img` text COLLATE utf8_unicode_ci,
	`tiempo_exposicion`text COLLATE utf8_unicode_ci,
	`camara` text COLLATE utf8_unicode_ci,
	`fecha_hora_captura` text COLLATE utf8_unicode_ci,
	`encargado_procesamiento` text COLLATE utf8_unicode_ci,
	`fecha_procesamiento` text COLLATE utf8_unicode_ci,
	`comentarios` text COLLATE utf8_unicode_ci,
	`url` tinytext COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- descripción autores documento

CREATE TABLE `instituciones` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_unidad_documental` int(10) unsigned NOT NULL,
	`nombres_estandarizado` varchar(255) COLLATE utf8_unicode_ci,
	`otros_nombres` text COLLATE utf8_unicode_ci,
	`tipo` text COLLATE utf8_unicode_ci,
	`fecha_establecimiento` text COLLATE utf8_unicode_ci,
	`fecha_clausura` text COLLATE utf8_unicode_ci,
	`sinopsis` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `personas` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_unidad_documental` int(10) unsigned NOT NULL,
	`nombre` text COLLATE utf8_unicode_ci,
	`apellidos` text COLLATE utf8_unicode_ci,
	`otros_nombres` text COLLATE utf8_unicode_ci,
	`genero` text COLLATE utf8_unicode_ci,
	`fecha_nacimiento` text COLLATE utf8_unicode_ci,
	`fecha_muerte` text COLLATE utf8_unicode_ci,
	`categoria_juridica` text COLLATE utf8_unicode_ci,
	`biografia_corta` text COLLATE utf8_unicode_ci,
	`biografia` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `eventos_personas` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_personas` int(10) unsigned NOT NULL,
	`tipo_evento` text COLLATE utf8_unicode_ci,
	-- evento de vida, evento profesional, otros eventos...
	`fecha_inicio` text COLLATE utf8_unicode_ci,
	`fecha_final` text COLLATE utf8_unicode_ci,
	`id_ubicacion` text COLLATE utf8_unicode_ci,
	`sujeto_participante` text COLLATE utf8_unicode_ci,
	`objeto_participante` text COLLATE utf8_unicode_ci,
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ubicacion` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`id_jurisdiccion` int(10) unsigned NOT NULL,
	`nombre_ubicacion` text COLLATE utf8_unicode_ci,
	`longitud` decimal(20,7) NOT NULL DEFAULT '0.0000000',
	`latitud` decimal(20,7) NOT NULL DEFAULT '0.0000000',
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `jurisdiccion` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`nombre_jurisdiccion` text COLLATE utf8_unicode_ci,
	`temporalidad` text COLLATE utf8_unicode_ci,
	`descripcion` text COLLATE utf8_unicode_ci,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO jurisdiccion VALUES
("1","Virreinato","siglo XVI-XVII",""),
("2","Audiencia","siglo XVI-XVII",""),
("3","Ciudad", "siglo XVI-XVII",""),
("4","Corregimiento", "siglo XVI-XVII",""),
("5","Repartimiento","siglo XVI-XVII",""),
("6","Pueblo","siglo XVI-XVII",""),
("7","Virreinato","siglo XVIII",""),
("8","Audiencia","siglo XVIII",""),
("9","Corregimiento","siglo XVIII",""),
("10","Repartimiento","siglo XVIII",""),
("11","Pueblo","siglo XVIII",""),
("12","País","siglo XIX-XXI",""),
("13","Departamento","siglo XIX-XXI",""),
("14","Estado","siglo XIX-XXI",""),
("15","Provincia","siglo XIX-XXI",""),
("16","Cantón","siglo XIX-XXI",""),
("17","Municipio","siglo XIX-XXI",""),
("18","Localidad","siglo XIX-XXI","");