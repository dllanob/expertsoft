-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2014 a las 23:19:09
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `expertsoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regla`
--

CREATE TABLE IF NOT EXISTS `regla` (
  `id_regla` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_regla`),
  KEY `id_area` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reglasolucion`
--

CREATE TABLE IF NOT EXISTS `reglasolucion` (
  `id_regla` int(11) NOT NULL,
  `id_solucion` int(11) NOT NULL,
  KEY `id_regla` (`id_regla`),
  KEY `id_solucion` (`id_solucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solucion`
--

CREATE TABLE IF NOT EXISTS `solucion` (
  `id_solucion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_solucion`),
  KEY `id_area` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `alias` varchar(30) NOT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `regla`
--
ALTER TABLE `regla`
  ADD CONSTRAINT `regla_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);

--
-- Filtros para la tabla `reglasolucion`
--
ALTER TABLE `reglasolucion`
  ADD CONSTRAINT `reglasolucion_ibfk_1` FOREIGN KEY (`id_regla`) REFERENCES `regla` (`id_regla`),
  ADD CONSTRAINT `reglasolucion_ibfk_2` FOREIGN KEY (`id_solucion`) REFERENCES `solucion` (`id_solucion`);

--
-- Filtros para la tabla `solucion`
--
ALTER TABLE `solucion`
  ADD CONSTRAINT `solucion_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
