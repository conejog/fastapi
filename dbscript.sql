-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2020 a las 21:46:56
-- Versión del servidor: 5.6.41-84.1
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `keepthis_apishows`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `butacas`
--

CREATE TABLE `butacas` (
  `idButaca` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  `Butaca` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `butacas`
--

INSERT INTO `butacas` (`idButaca`, `idSala`, `Butaca`, `Cantidad`) VALUES
(1, 1, 'Palco', 30),
(2, 1, 'Balcon', 30),
(3, 1, 'Sector 1', 40),
(4, 1, 'Sector 2', 40),
(5, 1, 'General', 200),
(6, 2, 'General', 100),
(7, 2, 'Vip', 40),
(8, 2, 'Ultima Fila', 20),
(9, 3, 'General', 50),
(10, 3, 'Vip', 45),
(11, 4, 'General', 100),
(12, 4, 'Vip', 50),
(13, 4, 'Primer piso', 40),
(14, 5, 'General', 100),
(15, 5, 'Vip', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `idFuncion` int(11) NOT NULL,
  `idTeatro` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  `idShow` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Titulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`idFuncion`, `idTeatro`, `idSala`, `idShow`, `Fecha`, `Hora`, `Titulo`) VALUES
(1, 1, 1, 1, '2020-12-07', '20:00:00', 'Funcion noche'),
(2, 2, 2, 4, '2020-12-21', '18:00:00', 'Noche de clasicos'),
(3, 2, 3, 2, '2021-01-19', '19:00:00', 'David Bowie'),
(4, 2, 3, 2, '2021-01-20', '19:00:00', 'David Bowie'),
(5, 2, 3, 2, '2021-01-21', '19:00:00', 'David Bowie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idPrecio` int(11) NOT NULL,
  `idFuncion` int(11) NOT NULL,
  `idButaca` int(11) NOT NULL,
  `Precio` float NOT NULL,
  `Disponibles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idPrecio`, `idFuncion`, `idButaca`, `Precio`, `Disponibles`) VALUES
(1, 1, 1, 300, 30),
(2, 1, 2, 250, 28),
(3, 1, 3, 250, 40),
(4, 1, 4, 200, 40),
(5, 1, 5, 100, 200),
(6, 2, 6, 200, 100),
(7, 2, 7, 400, 40),
(8, 3, 9, 1500, 46),
(9, 3, 10, 2000, 45),
(10, 4, 9, 1500, 50),
(11, 4, 10, 2000, 45),
(12, 5, 9, 1500, 50),
(13, 5, 10, 2000, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) NOT NULL,
  `Nombre` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `Documento` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idFuncion` int(11) DEFAULT NULL,
  `idButaca` int(11) DEFAULT NULL,
  `Precio` float NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `Nombre`, `Documento`, `Fecha`, `idFuncion`, `idButaca`, `Precio`, `Cantidad`) VALUES
(4, 'nombre persona', '28444333', '2020-12-02 02:07:38', 1, 2, 300, 2),
(5, 'Juan Perez', '32000321', '2020-12-02 02:30:28', 3, 9, 1500, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `idSala` int(11) NOT NULL,
  `idTeatro` int(11) NOT NULL,
  `Sala` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`idSala`, `idTeatro`, `Sala`) VALUES
(1, 1, 'Sala Unica'),
(2, 2, 'Sala Alfa'),
(3, 2, 'Sala Beta'),
(4, 3, 'Sala Master'),
(5, 3, 'Sala Acustica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shows`
--

CREATE TABLE `shows` (
  `idShow` int(11) NOT NULL,
  `Titulo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Descripcion` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `shows`
--

INSERT INTO `shows` (`idShow`, `Titulo`, `Descripcion`) VALUES
(1, 'La gran orquesta', 'Gira de la gran orquesta'),
(2, 'David Bowie', 'David Bovie en concierto'),
(3, 'Show de magia', 'Show de magia del gran mago'),
(4, 'Pianistas', 'Show de grandes pianistas'),
(5, 'Cuentos Clasicos', 'Obra teatral de cuentos clasicos'),
(6, 'La divina comedia', 'Obra teatral'),
(7, 'Hamlet', 'Obra teatral'),
(8, 'La obra maestra', 'Obra teatral unipersonal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teatros`
--

CREATE TABLE `teatros` (
  `idTeatro` int(11) NOT NULL,
  `Teatro` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `teatros`
--

INSERT INTO `teatros` (`idTeatro`, `Teatro`) VALUES
(1, 'Gran Rex'),
(2, 'Teatro Colon'),
(3, 'Teatro Cervantes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `butacas`
--
ALTER TABLE `butacas`
  ADD PRIMARY KEY (`idButaca`),
  ADD KEY `salas` (`idSala`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`idFuncion`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idPrecio`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`idSala`);

--
-- Indices de la tabla `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`idShow`);

--
-- Indices de la tabla `teatros`
--
ALTER TABLE `teatros`
  ADD PRIMARY KEY (`idTeatro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `butacas`
--
ALTER TABLE `butacas`
  MODIFY `idButaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `funciones`
--
ALTER TABLE `funciones`
  MODIFY `idFuncion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idPrecio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `idSala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `shows`
--
ALTER TABLE `shows`
  MODIFY `idShow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `teatros`
--
ALTER TABLE `teatros`
  MODIFY `idTeatro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `butacas`
--
ALTER TABLE `butacas`
  ADD CONSTRAINT `salas` FOREIGN KEY (`idSala`) REFERENCES `salas` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
