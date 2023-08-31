-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql-docker
-- Tiempo de generación: 23-08-2023 a las 02:46:22
-- Versión del servidor: 5.7.28
-- Versión de PHP: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `qslbureaudb_dev`
--

--
-- Volcado de datos para la tabla `C_CAPTURER`
--

INSERT INTO `C_CAPTURER` (`IDCAPTURER`, `NAME`, `LASTNAME`, `USERNAME`, `PASSWORD`, `START`, `END`) VALUES
(1, 'Eduardo', 'Gutiérrez', 'geduardo', '$2a$12$RdfifnY73eOEx3vILFrhPuh3l8KT4cpJW6lWuLYivR4kO/ZEAA0EO', '2023-03-26 06:56:28', NULL);

--
-- Volcado de datos para la tabla `C_LOCAL`
--

INSERT INTO `C_LOCAL` (`IDLOCAL`, `MAXSLOTS`, `NAME`) VALUES
(1, 10, 'Sede de la FMRE'),
(2, 10, 'QRH de Eduardo Gutiérrez XE1JEG');

--
-- Volcado de datos para la tabla `D_CAPTURER_LOCAL`
--

INSERT INTO `D_CAPTURER_LOCAL` (`IDCAPTURERLOCAL`, `IDCAPTURER`, `IDLOCAL`, `START`, `END`) VALUES
(1, 1, 1, '2023-02-20', NULL),
(2, 1, 2, '2023-02-20', NULL);


INSERT INTO `C_STATUS` (`IDSTATUS`, `STATUS`, `DESCRIPTION`, `OBJECT`) VALUES
('1001', 'VIGENTE', 'La qsl captura se encuentra vigente', 'T_QSL'),
('1002', 'ELIMINADA', 'La qsl captura se encuentra eliminada', 'T_QSL'),
('2001', 'CREATED', 'El slot recien fue creado', 'T_SLOT'),
('2002', 'OPEN', 'El slot se encuentra abierto y se estan capturando qsls en el', 'T_SLOT'),
('2003', 'CLOSED', 'El slot se encuentra cerrado, no se pueden capturar mas qsls en el', 'T_SLOT'),
('2004', 'SENT', 'El slot fue enviado ', 'T_SLOT'),
('2005', 'CONFIRMED', 'Se confirmo la recepcion del slot', 'T_SLOT');


COMMIT;
