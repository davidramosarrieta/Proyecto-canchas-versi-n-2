-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 04-11-2016 a las 15:43:12
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `canchas`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `escenario`
-- 

CREATE TABLE `escenario` (
  `idEscenario` int(11) NOT NULL auto_increment,
  `tipoEscenario` varchar(50) character set utf8 NOT NULL,
  `nombreEscenario` varchar(100) character set utf8 NOT NULL,
  `direccionEscenario` varchar(150) character set utf8 NOT NULL,
  `telefonoEscenario` double NOT NULL,
  PRIMARY KEY  (`idEscenario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

-- 
-- Volcar la base de datos para la tabla `escenario`
-- 

INSERT INTO `escenario` VALUES (4, 'Futbol 5', 'Melena', 'Medellin Cll22', 3126543218);
INSERT INTO `escenario` VALUES (5, 'Futbol 5', 'Atenea', 'Medellin Cr75', 3151239874);
INSERT INTO `escenario` VALUES (6, 'Baloncesto', 'Palbo VI', 'Medellin Cr 29', 3013634768);
INSERT INTO `escenario` VALUES (14, 'Futbol 5', 'San Diego', 'Medellin Cll 44', 3001112222);
INSERT INTO `escenario` VALUES (16, 'Futbol 11', 'Los Robles', 'Medellin Cll 70', 3145558888);
INSERT INTO `escenario` VALUES (15, 'Futbol 11', 'Teatro futbol', 'Medellin Cll51', 3113113113);
INSERT INTO `escenario` VALUES (10, 'Futbol 5', 'Las luces', 'Medellin Cr 29', 3126543218);
INSERT INTO `escenario` VALUES (11, 'Baloncesto', 'Laurel', 'Medellin Cr 26', 3001234567);
INSERT INTO `escenario` VALUES (12, 'Baloncesto', 'Internacional', 'MedellÃ­n Cr62', 3158887779);
INSERT INTO `escenario` VALUES (17, 'Voleibol', 'Pin Volei', 'Medellin Cr 44', 3129999333);
INSERT INTO `escenario` VALUES (18, 'Voleibol', 'La red', 'Medellin Cr 68', 3132224466);
INSERT INTO `escenario` VALUES (19, 'Bicicross', 'BMX pro', 'Medellin Cll 43', 3134343111);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `reserva`
-- 

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL auto_increment,
  `idEscenario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `hora` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `estado` varchar(45) character set utf8 NOT NULL,
  PRIMARY KEY  (`idReserva`),
  KEY `idEscenario` (`idEscenario`),
  KEY `cedula` (`cedula`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `reserva`
-- 

INSERT INTO `reserva` VALUES (1, 10, 92543909, 10, 9, 11, 2016, 'Confirmada');
INSERT INTO `reserva` VALUES (2, 10, 92543909, 18, 10, 11, 2016, 'Apartada');
INSERT INTO `reserva` VALUES (3, 10, 92543909, 18, 10, 12, 2016, 'Apartada');
INSERT INTO `reserva` VALUES (4, 10, 92543909, 10, 20, 11, 2016, 'Apartada');
INSERT INTO `reserva` VALUES (5, 11, 92543909, 13, 3, 2, 2017, 'Apartada');
INSERT INTO `reserva` VALUES (11, 8, 92543888, 12, 4, 1, 2017, 'Confirmada');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuario`
-- 

CREATE TABLE `usuario` (
  `cedula` int(11) NOT NULL,
  `contrasena` varchar(100) character set utf8 NOT NULL,
  `nombre` varchar(100) character set utf8 NOT NULL,
  `apellido` varchar(100) character set utf8 NOT NULL,
  `direccionUsuario` varchar(100) character set utf8 NOT NULL,
  `telefonoUsuario` varchar(100) character set utf8 NOT NULL,
  `diaNacimiento` int(11) NOT NULL,
  `mesNacimiento` int(11) NOT NULL,
  `anoNacimiento` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY  (`cedula`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- 
-- Volcar la base de datos para la tabla `usuario`
-- 

INSERT INTO `usuario` VALUES (92543909, 'davidbojeb', 'David', 'Ramos', 'Medellin Cr85', '3013634768', 8, 2, 1983, 33, 2);
INSERT INTO `usuario` VALUES (92543111, 'davidbojeb', 'Juan', 'Perez', 'Medllin Cr80', '3001234567', 15, 7, 1990, 26, 1);
INSERT INTO `usuario` VALUES (92543888, '1234', 'Esteban', 'Roble', 'Medellin Cr 29', '3001234567', 8, 2, 1990, 26, 1);
INSERT INTO `usuario` VALUES (124578962, 'elsi', 'David', 'Pacheco', 'MedellÃ­n Cr85', '3126543218', 14, 3, 1998, 18, 1);
