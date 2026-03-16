-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2026 a las 17:34:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jefatura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arma`
--

CREATE TABLE `arma` (
  `CODIGOARMA` int(11) NOT NULL,
  `REFERENCIA` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CODIGOCLASE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arma`
--

INSERT INTO `arma` (`CODIGOARMA`, `REFERENCIA`, `DESCRIPCION`, `CODIGOCLASE`) VALUES
(1, 'Glock 19', 'Pistola 9mm', 1),
(2, 'M4A1', 'Fusil de asalto', 2),
(3, 'Cuchillo Tactico', 'Acero inoxidable', 3),
(4, 'Taser X2', 'Pistola electrica', 4),
(5, 'Escopeta 12', 'Escopeta recortada', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calabozo`
--

CREATE TABLE `calabozo` (
  `CODIGOCALABOZO` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `UBICACION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calabozo`
--

INSERT INTO `calabozo` (`CODIGOCALABOZO`, `NOMBRE`, `UBICACION`) VALUES
(1, 'Calabozo A', 'Bloque Norte'),
(2, 'Calabozo B', 'Bloque Sur'),
(3, 'Calabozo C', 'Bloque Este'),
(4, 'Calabozo D', 'Bloque Oeste'),
(5, 'Calabozo E', 'Bloque Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `CODIGOCASO` int(11) NOT NULL,
  `TIPOCASO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `CODIGOJUZGADO` int(11) DEFAULT NULL,
  `DOCUMENTOPOLICIA` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caso`
--

INSERT INTO `caso` (`CODIGOCASO`, `TIPOCASO`, `DESCRIPCION`, `CODIGOJUZGADO`, `DOCUMENTOPOLICIA`) VALUES
(1, 'Robo', 'Robo a comercio', 1, '1004'),
(2, 'Homicidio', 'Investigacion criminal', 2, '1002'),
(3, 'Fraude', 'Estafa bancaria', 3, '1004'),
(4, 'Narcotrafico', 'Venta ilegal sustancias', 4, '1002'),
(5, 'Vandalismo', 'Daños a propiedad', 5, '1003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CODIGOCATEGORIA` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CODIGOCATEGORIA`, `DESCRIPCION`) VALUES
(1, 'Oficial'),
(2, 'Suboficial'),
(3, 'Patrullero'),
(4, 'Detective'),
(5, 'Comandante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_arma`
--

CREATE TABLE `clase_arma` (
  `CODIGOCLASE` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_arma`
--

INSERT INTO `clase_arma` (`CODIGOCLASE`, `DESCRIPCION`) VALUES
(1, 'Arma corta'),
(2, 'Arma larga'),
(3, 'Arma blanca'),
(4, 'Arma electrica'),
(5, 'Arma traumatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delincuente`
--

CREATE TABLE `delincuente` (
  `IDENTIFICACION` varchar(20) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `CODIGOCASO` int(11) DEFAULT NULL,
  `CODIGOCALABOZO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `delincuente`
--

INSERT INTO `delincuente` (`IDENTIFICACION`, `NOMBRE`, `APELLIDO`, `TELEFONO`, `CODIGOCASO`, `CODIGOCALABOZO`) VALUES
('9001', 'Miguel', 'Rojas', '3001234567', 1, 1),
('9002', 'Pedro', 'Hernandez', '3007654321', 2, 2),
('9003', 'Luis', 'Castro', '3014567890', 3, 3),
('9004', 'Diego', 'Vargas', '3029876543', 4, 4),
('9005', 'Jorge', 'Mendoza', '3036547891', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgado`
--

CREATE TABLE `juzgado` (
  `CODIGOJUZGADO` int(11) NOT NULL,
  `NOMBREJUEZ` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juzgado`
--

INSERT INTO `juzgado` (`CODIGOJUZGADO`, `NOMBREJUEZ`) VALUES
(1, 'Juez Ramirez'),
(2, 'Juez Torres'),
(3, 'Juez Martinez'),
(4, 'Juez Lopez'),
(5, 'Juez Herrera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policia`
--

CREATE TABLE `policia` (
  `DOCUMENTO` varchar(20) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `CODIGOCATEGORIA` int(11) DEFAULT NULL,
  `FUNCION` varchar(100) DEFAULT NULL,
  `SUPERIOR` varchar(20) DEFAULT NULL,
  `CODIGOARMA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `policia`
--

INSERT INTO `policia` (`DOCUMENTO`, `NOMBRE`, `APELLIDO`, `CODIGOCATEGORIA`, `FUNCION`, `SUPERIOR`, `CODIGOARMA`) VALUES
('1001', 'Carlos', 'Perez', 5, 'Comandante', NULL, 1),
('1002', 'Luis', 'Gomez', 1, 'Oficial operativo', '1001', 2),
('1003', 'Andres', 'Martinez', 3, 'Patrullero zona norte', '1002', 4),
('1004', 'Jorge', 'Ramirez', 4, 'Investigacion', '1002', 1),
('1005', 'Daniel', 'Lopez', 2, 'Suboficial nocturno', '1001', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arma`
--
ALTER TABLE `arma`
  ADD PRIMARY KEY (`CODIGOARMA`),
  ADD KEY `CODIGOCLASE` (`CODIGOCLASE`);

--
-- Indices de la tabla `calabozo`
--
ALTER TABLE `calabozo`
  ADD PRIMARY KEY (`CODIGOCALABOZO`);

--
-- Indices de la tabla `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`CODIGOCASO`),
  ADD KEY `CODIGOJUZGADO` (`CODIGOJUZGADO`),
  ADD KEY `DOCUMENTOPOLICIA` (`DOCUMENTOPOLICIA`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CODIGOCATEGORIA`);

--
-- Indices de la tabla `clase_arma`
--
ALTER TABLE `clase_arma`
  ADD PRIMARY KEY (`CODIGOCLASE`);

--
-- Indices de la tabla `delincuente`
--
ALTER TABLE `delincuente`
  ADD PRIMARY KEY (`IDENTIFICACION`),
  ADD KEY `CODIGOCASO` (`CODIGOCASO`),
  ADD KEY `CODIGOCALABOZO` (`CODIGOCALABOZO`);

--
-- Indices de la tabla `juzgado`
--
ALTER TABLE `juzgado`
  ADD PRIMARY KEY (`CODIGOJUZGADO`);

--
-- Indices de la tabla `policia`
--
ALTER TABLE `policia`
  ADD PRIMARY KEY (`DOCUMENTO`),
  ADD KEY `CODIGOCATEGORIA` (`CODIGOCATEGORIA`),
  ADD KEY `SUPERIOR` (`SUPERIOR`),
  ADD KEY `CODIGOARMA` (`CODIGOARMA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arma`
--
ALTER TABLE `arma`
  ADD CONSTRAINT `arma_ibfk_1` FOREIGN KEY (`CODIGOCLASE`) REFERENCES `clase_arma` (`CODIGOCLASE`);

--
-- Filtros para la tabla `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `caso_ibfk_1` FOREIGN KEY (`CODIGOJUZGADO`) REFERENCES `juzgado` (`CODIGOJUZGADO`),
  ADD CONSTRAINT `caso_ibfk_2` FOREIGN KEY (`DOCUMENTOPOLICIA`) REFERENCES `policia` (`DOCUMENTO`);

--
-- Filtros para la tabla `delincuente`
--
ALTER TABLE `delincuente`
  ADD CONSTRAINT `delincuente_ibfk_1` FOREIGN KEY (`CODIGOCASO`) REFERENCES `caso` (`CODIGOCASO`),
  ADD CONSTRAINT `delincuente_ibfk_2` FOREIGN KEY (`CODIGOCALABOZO`) REFERENCES `calabozo` (`CODIGOCALABOZO`);

--
-- Filtros para la tabla `policia`
--
ALTER TABLE `policia`
  ADD CONSTRAINT `policia_ibfk_1` FOREIGN KEY (`CODIGOCATEGORIA`) REFERENCES `categoria` (`CODIGOCATEGORIA`),
  ADD CONSTRAINT `policia_ibfk_2` FOREIGN KEY (`SUPERIOR`) REFERENCES `policia` (`DOCUMENTO`),
  ADD CONSTRAINT `policia_ibfk_3` FOREIGN KEY (`CODIGOARMA`) REFERENCES `arma` (`CODIGOARMA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
