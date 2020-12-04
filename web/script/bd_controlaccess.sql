-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2020 a las 16:58:51
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_controlaccess`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoderado`
--

CREATE TABLE `apoderado` (
  `IDAPODERADO` int(11) NOT NULL,
  `IDPARENTESCO` int(11) NOT NULL,
  `IDPERSONA` int(11) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `IDAREA` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`IDAREA`, `DESCRIPCION`) VALUES
(1, 'SECRETARIA'),
(2, 'GERENCIA'),
(3, 'FINANZAS'),
(4, 'ACADEMICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `IDGRADO` int(11) NOT NULL,
  `DESCRIPCION` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`IDGRADO`, `DESCRIPCION`) VALUES
(1, 'PRIMERO'),
(2, 'SEGUNDO'),
(3, 'TERCERO'),
(4, 'CUARTO'),
(5, 'QUINTO'),
(6, 'SEXTO'),
(7, 'I-3AÑOS'),
(8, 'I-4AÑOS'),
(9, 'I-5AÑOS'),
(10, 'SELECCIONAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `IDHISTORIAL` int(11) NOT NULL,
  `TIPO` int(1) NOT NULL,
  `NROTICKET` varchar(14) NOT NULL,
  `FECHA` date NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `IMPORTE` decimal(8,2) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `IDMATRICULA` int(11) NOT NULL,
  `YEAR` varchar(4) NOT NULL,
  `IDHISTORIAL` int(11) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL,
  `IDGRADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `IDPARENTESCO` int(11) NOT NULL,
  `PARENTESCO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`IDPARENTESCO`, `PARENTESCO`) VALUES
(1, 'PADRE'),
(2, 'MADRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IDPERSONA` int(11) NOT NULL,
  `IDTIPODOC` int(11) DEFAULT NULL,
  `NRODOC` varchar(11) DEFAULT NULL,
  `NOMBRES` varchar(60) DEFAULT NULL,
  `APELLIDOS` varchar(100) DEFAULT NULL,
  `TELEFONO` varchar(11) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IDPERSONA`, `IDTIPODOC`, `NRODOC`, `NOMBRES`, `APELLIDOS`, `TELEFONO`, `CORREO`) VALUES
(1, 1, '12345672', 'ADMINISTRADOR', 'DIRECTOR', '988251450', 'admin@admin.edu.pe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `IDPERSONAL` int(11) NOT NULL,
  `IDAREA` int(11) NOT NULL,
  `IDPERSONA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IDROL` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IDROL`, `DESCRIPCION`) VALUES
(1, 'ADMIN'),
(2, 'USUARIO'),
(3, 'ALUMNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `IDTIPODOC` int(11) NOT NULL,
  `TIPO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipodoc`
--

INSERT INTO `tipodoc` (`IDTIPODOC`, `TIPO`) VALUES
(1, 'DNI'),
(2, 'C.EXT.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `ESTADO` int(1) DEFAULT NULL,
  `IDPERSONA` int(11) DEFAULT NULL,
  `IDROL` int(11) NOT NULL,
  `IDGRADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `USUARIO`, `PASSWORD`, `ESTADO`, `IDPERSONA`, `IDROL`, `IDGRADO`) VALUES
(1, 'admin', 'admin', 1, 1, 3, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apoderado`
--
ALTER TABLE `apoderado`
  ADD PRIMARY KEY (`IDAPODERADO`),
  ADD KEY `APODERADO-PRENTECO` (`IDPARENTESCO`),
  ADD KEY `PERSONA - APODERADO` (`IDPERSONA`),
  ADD KEY `USUARIO-APODERADO` (`IDUSUARIO`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`IDAREA`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`IDGRADO`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`IDHISTORIAL`),
  ADD UNIQUE KEY `NROTICKET` (`NROTICKET`),
  ADD KEY `HISTOR - USER` (`IDUSUARIO`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`IDMATRICULA`),
  ADD KEY `MATR - USER` (`IDUSUARIO`),
  ADD KEY `MATR - HISTORIAL` (`IDHISTORIAL`),
  ADD KEY `matricula-grado` (`IDGRADO`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`IDPARENTESCO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD KEY `PERSONA-TIPODOC` (`IDTIPODOC`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`IDPERSONAL`),
  ADD KEY `PERSONAL-AREA` (`IDAREA`),
  ADD KEY `PERSONAL-PERSONA` (`IDPERSONA`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IDROL`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`IDTIPODOC`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `USER-PERSONA` (`IDPERSONA`),
  ADD KEY `USER-ROL` (`IDROL`),
  ADD KEY `USER-GRADO` (`IDGRADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apoderado`
--
ALTER TABLE `apoderado`
  MODIFY `IDAPODERADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `IDAREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `IDGRADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `IDHISTORIAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `IDMATRICULA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `IDPARENTESCO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IDPERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34610;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `IDPERSONAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IDROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  MODIFY `IDTIPODOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apoderado`
--
ALTER TABLE `apoderado`
  ADD CONSTRAINT `APODERADO-PRENTECO` FOREIGN KEY (`IDPARENTESCO`) REFERENCES `parentesco` (`IDPARENTESCO`),
  ADD CONSTRAINT `PERSONA - APODERADO` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `USUARIO-APODERADO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `HISTOR - USER` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `MATR - HISTORIAL` FOREIGN KEY (`IDHISTORIAL`) REFERENCES `historial` (`IDHISTORIAL`),
  ADD CONSTRAINT `MATR - USER` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`),
  ADD CONSTRAINT `matricula-grado` FOREIGN KEY (`IDGRADO`) REFERENCES `grado` (`IDGRADO`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `PERSONA-TIPODOC` FOREIGN KEY (`IDTIPODOC`) REFERENCES `tipodoc` (`IDTIPODOC`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `PERSONAL-AREA` FOREIGN KEY (`IDAREA`) REFERENCES `area` (`IDAREA`),
  ADD CONSTRAINT `PERSONAL-PERSONA` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `USER-GRADO` FOREIGN KEY (`IDGRADO`) REFERENCES `grado` (`IDGRADO`),
  ADD CONSTRAINT `USER-PERSONA` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `USER-ROL` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
