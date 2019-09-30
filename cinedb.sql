-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-09-2019 a las 19:49:19
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinev2`
--
CREATE DATABASE IF NOT EXISTS `cinev2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `cinev2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `id_asiento` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`id_asiento`, `activo`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 0),
(5, 1),
(6, 1),
(7, 0),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento_sala`
--

CREATE TABLE `asiento_sala` (
  `id_asiento` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `fila` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `columna` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asiento_sala`
--

INSERT INTO `asiento_sala` (`id_asiento`, `id_sala`, `fila`, `columna`, `activo`) VALUES
(1, 1, 'A', '1', 1),
(2, 2, 'A', '2', 1),
(3, 1, 'A', '3', 1),
(4, 1, 'A', '4', 1),
(5, 2, 'B', '1', 1),
(6, 2, 'B', '2', 1),
(7, 3, 'C', '3', 0),
(8, 4, 'D', '13', 0),
(9, 5, 'E', '10', 1),
(10, 6, 'B', '5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributo_asiento`
--

CREATE TABLE `atributo_asiento` (
  `id_caracteristica` int(11) NOT NULL,
  `id_asiento` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `atributo_asiento`
--

INSERT INTO `atributo_asiento` (`id_caracteristica`, `id_asiento`, `valor`) VALUES
(1, 1, 0),
(1, 9, 0),
(2, 2, 0),
(2, 6, 0),
(2, 8, 0),
(3, 2, 0),
(3, 3, 0),
(4, 5, 2),
(5, 7, 0),
(5, 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributo_funcion`
--

CREATE TABLE `atributo_funcion` (
  `id_caracteristica` int(11) NOT NULL,
  `id_funcion` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `atributo_funcion`
--

INSERT INTO `atributo_funcion` (`id_caracteristica`, `id_funcion`, `valor`) VALUES
(1, 1, 0),
(5, 2, 0),
(3, 3, 0),
(4, 4, 0),
(2, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributo_sala`
--

CREATE TABLE `atributo_sala` (
  `id_caracteristica` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `atributo_sala`
--

INSERT INTO `atributo_sala` (`id_caracteristica`, `id_sala`, `valor`) VALUES
(1, 1, 0),
(2, 5, 0),
(3, 8, 0),
(4, 10, 0),
(5, 9, 0),
(6, 7, 0),
(7, 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

CREATE TABLE `boleto` (
  `id_boleto` int(11) NOT NULL,
  `id_funcion` int(11) NOT NULL,
  `id_asiento` int(11) NOT NULL,
  `id_descuento` int(11) NOT NULL,
  `precio_base` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `boleto`
--

INSERT INTO `boleto` (`id_boleto`, `id_funcion`, `id_asiento`, `id_descuento`, `precio_base`) VALUES
(1, 1, 1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto_factura`
--

CREATE TABLE `boleto_factura` (
  `id_boleto` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_asiento`
--

CREATE TABLE `caracteristica_asiento` (
  `id_caracteristica` int(11) NOT NULL,
  `caracteristica` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `caracteristica_asiento`
--

INSERT INTO `caracteristica_asiento` (`id_caracteristica`, `caracteristica`, `descripcion`) VALUES
(1, 'Estructura de acero.', 'Asiento con estructura base de acero inoxidable.'),
(2, 'Reclinable', 'Asiento reclinable'),
(3, 'Base de madera.', 'Asientos con base de madera.'),
(4, 'Con brazos sin apoyo para bebidas.', 'Brazos largos en ambos lados, sin apoyo para bebidas o comestibles.'),
(5, 'Tapiceria de cuero.', 'Asiento tapizado con cuero.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_funcion`
--

CREATE TABLE `caracteristica_funcion` (
  `id_caracteristica` int(11) NOT NULL,
  `caracteristica` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `caracteristica_funcion`
--

INSERT INTO `caracteristica_funcion` (`id_caracteristica`, `caracteristica`, `descripcion`) VALUES
(1, 'Idioma original', 'Idioma en que fue grabado la pelicula'),
(2, 'Subtitulos español', 'Proyeccion con subtitulos en español'),
(3, 'Doblada al español.', 'Proyeccion doblada al español latino'),
(4, '2D', 'Proyeccion en formato 2D'),
(5, '3D', 'Proyeccion en formato 3D.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_sala`
--

CREATE TABLE `caracteristica_sala` (
  `id_caracteristica` int(11) NOT NULL,
  `caracteristica` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `caracteristica_sala`
--

INSERT INTO `caracteristica_sala` (`id_caracteristica`, `caracteristica`, `descripcion`) VALUES
(1, 'Proyeccion 4DX.', 'Recrea condiciones fisicas de la pelicula'),
(2, 'iMax', 'Imagen de mayor tamaño y mejor resolucion.'),
(3, 'XD', 'Pantalla gigante desde el techo hasta el piso, pared a pared. Mayor cantidad de parlantes.'),
(4, '2D', 'Para proyeccion de peliculas en formato 2D, dos dimensiones.'),
(5, '3D', 'Para proyeccion de peliculas en formato 3D, tres dimensiones.'),
(6, 'Estrada especial.', 'Entrada diseñada para personas con discapacidad fisica, para acceso en silla de ruedas.'),
(7, 'Dos entradas.', 'Acceso a la sala por medio de dos entradas principales.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id_clasificacion` int(11) NOT NULL,
  `clasificacion` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasificacion`, `clasificacion`, `descripcion`) VALUES
(1, 'AA', 'Para todo publico con atractivo infantil'),
(2, 'A', 'Para todo publico'),
(3, 'B', 'Para adolescentes de 12 en adelante'),
(4, 'B15', 'No recomendable para menores de 15 años'),
(5, 'C', 'Para adultos de 18 años en adelante'),
(6, 'D', 'Peliculas para adultos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_descuento` int(11) NOT NULL,
  `id_tipo_descuento` int(11) NOT NULL,
  `porcentaje` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id_descuento`, `id_tipo_descuento`, `porcentaje`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id_director` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`id_director`, `nombre`, `apellido`, `activo`) VALUES
(1, 'Christopher', 'Nolan', 1),
(2, 'Steven', 'Spielberg', 1),
(3, 'Martin', 'Scorsese', 1),
(4, 'Quentin', 'Tarantino', 1),
(5, 'Guillermo', 'del Toro', 1),
(6, 'David', 'Fincher', 1),
(7, 'Tim', 'Burton', 0),
(8, 'Alfonso', 'Cuaron', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `caja` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `fecha`, `caja`) VALUES
(1, '2019-09-04', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id_funcion` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`id_funcion`, `id_pelicula`, `fecha`) VALUES
(1, 1, '2019-09-11'),
(2, 2, '2019-09-06'),
(3, 3, '2019-10-26'),
(4, 4, '2020-02-22'),
(5, 5, '2019-08-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`, `descripcion`, `activo`) VALUES
(1, 'Ciencia Ficcion', 'Ficción, fantástica y terror ', 1),
(2, 'Terror', 'Miedo, terror, drama.', 1),
(3, 'Animada', 'Animaciones', 1),
(4, 'Romance', 'Mucho amor', 1),
(5, 'Comedia', 'Muchos chistes', 1),
(6, 'Drama', 'Muchas lagrimas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero_pelicula`
--

CREATE TABLE `genero_pelicula` (
  `id_genero` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `genero_pelicula`
--

INSERT INTO `genero_pelicula` (`id_genero`, `id_pelicula`) VALUES
(1, 1),
(1, 5),
(2, 3),
(3, 4),
(6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_consumible`
--

CREATE TABLE `menu_consumible` (
  `id_consumible` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menu_consumible`
--

INSERT INTO `menu_consumible` (`id_consumible`, `nombre`, `precio`) VALUES
(1, 'Popcorn', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_descuento` int(11) NOT NULL,
  `monto_total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `id_descuento`, `monto_total`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_consumible`
--

CREATE TABLE `orden_consumible` (
  `id_orden` int(11) NOT NULL,
  `id_consumible` int(11) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `monto_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `orden_consumible`
--

INSERT INTO `orden_consumible` (`id_orden`, `id_consumible`, `cantidad`, `monto_total`) VALUES
(1, 1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_factura`
--

CREATE TABLE `orden_factura` (
  `id_orden` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_tipo_pago`, `monto`) VALUES
(1, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_factura`
--

CREATE TABLE `pago_factura` (
  `id_pago` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago_factura`
--

INSERT INTO `pago_factura` (`id_pago`, `id_factura`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL,
  `id_director` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  `titulo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_estreno` date NOT NULL,
  `sinopsis` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id_pelicula`, `id_director`, `id_clasificacion`, `titulo`, `duracion`, `fecha_estreno`, `sinopsis`) VALUES
(1, 1, 3, 'The Dark Night', '152 minutos', '2008-07-14', 'Con la ayuda del teniente de policía James Gordon y el recientemente elegido fiscal del distrito Harvey Dent, Batman eleva la apuesta en su guerra contra el crimen al proponerse desmantelar los grupos mafiosos restantes que plagan las calles. La sociedad es efectiva, hasta que la mafia lo arrastra al combate para evitar que un lunático criminal conocido como Joker —el Guasón en Hispanoamérica— desate un reino de caos que sumiría a Gotham City en la anarquía. '),
(2, 4, 6, 'Once Upon a Time in Hollywood', '159 minutos', '2019-07-26', 'es una película estadounidense de crimen y misterio centrada en los asesinatos de la Familia Manson, escrita y dirigida por Quentin Tarantino.'),
(3, 5, 3, 'Scary Stories to Tell in the Dark', '111 minutos', '2019-09-08', 'Está inspirada en la narrativa fracturada de los libros originales, en la estructura de las películas de horror infantil de los años ochenta.'),
(4, 7, 2, 'Dumbo', '112 minutos', '2020-01-17', 'Está basada en el relato homónimo escrito por Helen Aberson y Harold Pearl, y es en gran parte una adaptación de la película animada de 1941 de Walt Disney del mismo nombre.'),
(5, 1, 2, 'Interstellar', '169 minutos', '2014-10-26', 'En el futuro de la Tierra, una plaga global de cultivos y un segundo Dust Bowl están haciendo que el planeta sea inhabitable lentamente. El profesor Brand (Michael Caine), un brillante físico de la NASA, está trabajando en planes para salvar a la humanidad mediante el transporte de la población de la Tierra a un nuevo hogar a través de un agujero de gusano.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sala` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id_sala`, `id_sucursal`, `sala`) VALUES
(1, 1, 'Sala01'),
(2, 1, 'Sala02'),
(3, 1, 'Sala03'),
(4, 1, 'Sala04'),
(5, 2, 'Sala01'),
(6, 2, 'Sala02'),
(7, 2, 'Sala03'),
(8, 3, 'Sala01'),
(9, 3, 'Sala02'),
(10, 4, 'Sala01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `contacto` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `nombre`, `direccion`, `contacto`, `activo`) VALUES
(1, 'Metrocentro Santa Ana', 'Santa Ana, Santa Ana.', 'Kevin Figueroa', 1),
(2, 'Multiplaza.', 'Santa Tecla.', 'Estuardo Ramos', 1),
(3, 'Galerias.', '3er nivel, Paseo Gral. Escalón, San Salvador', 'Esperanza Dueñas', 1),
(4, 'Metrocentro', 'San Salvador', 'Kevin Chinchilla', 1),
(5, 'La Gran Via.', 'Santa Tecla', 'Andrea Hernandez', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_descuento`
--

CREATE TABLE `tipo_descuento` (
  `id_tipo_descuento` int(11) NOT NULL,
  `tipo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `aplicable_boleto` tinyint(1) NOT NULL,
  `aplicable_consumible` tinyint(1) NOT NULL,
  `porcentaje_sugerido` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_descuento`
--

INSERT INTO `tipo_descuento` (`id_tipo_descuento`, `tipo`, `descripcion`, `aplicable_boleto`, `aplicable_consumible`, `porcentaje_sugerido`, `activo`) VALUES
(1, 'Cupon', 'Una entrada gratis al una funcion', 1, 0, 10, 1),
(2, 'descuento popcorn', 'popcorn a mitad de precio', 0, 1, 2.5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(11) NOT NULL,
  `tipo_pago` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id_tipo_pago`, `tipo_pago`, `descripcion`, `activo`) VALUES
(1, 'efectivo', 'Pagos en efectivo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`id_asiento`);

--
-- Indices de la tabla `asiento_sala`
--
ALTER TABLE `asiento_sala`
  ADD PRIMARY KEY (`id_asiento`),
  ADD KEY `fk_asiento_has_sala_sala1_idx` (`id_sala`),
  ADD KEY `fk_asiento_has_sala_asiento1_idx` (`id_asiento`);

--
-- Indices de la tabla `atributo_asiento`
--
ALTER TABLE `atributo_asiento`
  ADD PRIMARY KEY (`id_caracteristica`,`id_asiento`),
  ADD KEY `fk_atributo_asiento_caracteristica_asiento1_idx` (`id_caracteristica`),
  ADD KEY `fk_atributo_asiento_asiento1_idx` (`id_asiento`);

--
-- Indices de la tabla `atributo_funcion`
--
ALTER TABLE `atributo_funcion`
  ADD PRIMARY KEY (`id_funcion`,`id_caracteristica`),
  ADD KEY `fk_atributo_funcion_caracteristica_funcion1_idx` (`id_caracteristica`),
  ADD KEY `fk_atributo_funcion_funcion1_idx` (`id_funcion`);

--
-- Indices de la tabla `atributo_sala`
--
ALTER TABLE `atributo_sala`
  ADD PRIMARY KEY (`id_caracteristica`,`id_sala`),
  ADD KEY `fk_atributo_sala_caracteristica_sala_idx` (`id_caracteristica`),
  ADD KEY `fk_atributo_sala_sala1_idx` (`id_sala`);

--
-- Indices de la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`id_boleto`),
  ADD KEY `fk_boleto_1_idx` (`id_funcion`),
  ADD KEY `fk_boleto_2_idx` (`id_asiento`),
  ADD KEY `fk_boleto_3_idx` (`id_descuento`);

--
-- Indices de la tabla `boleto_factura`
--
ALTER TABLE `boleto_factura`
  ADD PRIMARY KEY (`id_boleto`,`id_factura`),
  ADD KEY `fk_boletoPorFactura_1_idx` (`id_boleto`),
  ADD KEY `fk_boletoPorFactura_2_idx` (`id_factura`);

--
-- Indices de la tabla `caracteristica_asiento`
--
ALTER TABLE `caracteristica_asiento`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Indices de la tabla `caracteristica_funcion`
--
ALTER TABLE `caracteristica_funcion`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Indices de la tabla `caracteristica_sala`
--
ALTER TABLE `caracteristica_sala`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id_clasificacion`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_descuento`),
  ADD KEY `fk_descuento_tipo_descuento1_idx` (`id_tipo_descuento`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id_director`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id_funcion`),
  ADD KEY `fk_funcion_pelicula1_idx` (`id_pelicula`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `genero_pelicula`
--
ALTER TABLE `genero_pelicula`
  ADD PRIMARY KEY (`id_genero`,`id_pelicula`),
  ADD KEY `fk_pelicula_has_genero_genero1_idx` (`id_genero`),
  ADD KEY `fk_pelicula_has_genero_pelicula1_idx` (`id_pelicula`);

--
-- Indices de la tabla `menu_consumible`
--
ALTER TABLE `menu_consumible`
  ADD PRIMARY KEY (`id_consumible`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_orden_descuento1_idx` (`id_descuento`);

--
-- Indices de la tabla `orden_consumible`
--
ALTER TABLE `orden_consumible`
  ADD PRIMARY KEY (`id_orden`,`id_consumible`),
  ADD KEY `fk_orden_consumible_menu_consumible1_idx` (`id_consumible`),
  ADD KEY `fk_orden_consumible_orden2_idx` (`id_orden`);

--
-- Indices de la tabla `orden_factura`
--
ALTER TABLE `orden_factura`
  ADD PRIMARY KEY (`id_orden`,`id_factura`),
  ADD KEY `fk_orden_has_factura_factura1_idx` (`id_factura`),
  ADD KEY `fk_orden_has_factura_orden1_idx` (`id_orden`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pago_tipo_pago1_idx` (`id_tipo_pago`);

--
-- Indices de la tabla `pago_factura`
--
ALTER TABLE `pago_factura`
  ADD PRIMARY KEY (`id_pago`,`id_factura`),
  ADD KEY `fk_pagoPorFactura_1_idx` (`id_factura`),
  ADD KEY `fk_pagoPorFactura_2_idx` (`id_pago`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id_pelicula`),
  ADD KEY `fk_pelicula_director1_idx` (`id_director`),
  ADD KEY `fk_pelicula_clasificacion2_idx` (`id_clasificacion`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `fk_sala_sucursal1_idx` (`id_sucursal`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tipo_descuento`
--
ALTER TABLE `tipo_descuento`
  ADD PRIMARY KEY (`id_tipo_descuento`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asiento`
--
ALTER TABLE `asiento`
  MODIFY `id_asiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `caracteristica_sala`
--
ALTER TABLE `caracteristica_sala`
  MODIFY `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `id_funcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_descuento`
--
ALTER TABLE `tipo_descuento`
  MODIFY `id_tipo_descuento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `director`
  MODIFY `id_director` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `menu_consumible`
  MODIFY `id_consumible` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `caracteristica_asiento`
  MODIFY `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `caracteristica_funcion`
  MODIFY `id_caracteristica` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `boleto`
  MODIFY `id_boleto` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT;





--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiento_sala`
--
ALTER TABLE `asiento_sala`
  ADD CONSTRAINT `asiento_sala_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asiento_has_sala_asiento1` FOREIGN KEY (`id_asiento`) REFERENCES `asiento` (`id_asiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `atributo_asiento`
--
ALTER TABLE `atributo_asiento`
  ADD CONSTRAINT `fk_atributo_asiento_asiento1` FOREIGN KEY (`id_asiento`) REFERENCES `asiento` (`id_asiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atributo_asiento_caracteristica_asiento1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica_asiento` (`id_caracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `atributo_funcion`
--
ALTER TABLE `atributo_funcion`
  ADD CONSTRAINT `fk_atributo_funcion_caracteristica_funcion1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica_funcion` (`id_caracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atributo_funcion_funcion1` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id_funcion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `atributo_sala`
--
ALTER TABLE `atributo_sala`
  ADD CONSTRAINT `fk_atributo_sala_caracteristica_sala` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica_sala` (`id_caracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atributo_sala_sala1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `fk_boleto_1` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id_funcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boleto_2` FOREIGN KEY (`id_asiento`) REFERENCES `asiento_sala` (`id_asiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boleto_3` FOREIGN KEY (`id_descuento`) REFERENCES `descuento` (`id_descuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boleto_factura`
--
ALTER TABLE `boleto_factura`
  ADD CONSTRAINT `fk_boletoPorFactura_1` FOREIGN KEY (`id_boleto`) REFERENCES `boleto` (`id_boleto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletoPorFactura_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `fk_descuento_tipo_descuento1` FOREIGN KEY (`id_tipo_descuento`) REFERENCES `tipo_descuento` (`id_tipo_descuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fk_funcion_pelicula1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `genero_pelicula`
--
ALTER TABLE `genero_pelicula`
  ADD CONSTRAINT `fk_pelicula_has_genero_genero1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_has_genero_pelicula1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_orden_descuento1` FOREIGN KEY (`id_descuento`) REFERENCES `descuento` (`id_descuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_consumible`
--
ALTER TABLE `orden_consumible`
  ADD CONSTRAINT `fk_orden_consumible_menu_consumible1` FOREIGN KEY (`id_consumible`) REFERENCES `menu_consumible` (`id_consumible`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_consumible_orden2` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_factura`
--
ALTER TABLE `orden_factura`
  ADD CONSTRAINT `fk_orden_has_factura_factura1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orden_has_factura_orden1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_tipo_pago1` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago_factura`
--
ALTER TABLE `pago_factura`
  ADD CONSTRAINT `fk_pagoPorFactura_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pagoPorFactura_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_pelicula_clasificacion2` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificacion` (`id_clasificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_director1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `fk_sala_sucursal1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

