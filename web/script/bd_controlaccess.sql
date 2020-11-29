
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


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
(1, 1, '12345678', 'Maria Eva', 'Castillo Suarez', '988251450', 'maria@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IDROL` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IDROL`, `DESCRIPCION`, `ESTADO`) VALUES
(1, 'ADMINISTRADOR', 1),
(2, 'USUARIO', 2);

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
(2, 'CARNET E.'),
(3, 'RUC'),
(4, 'PASAPORTE');

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
  `IDROL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `USUARIO`, `PASSWORD`, `ESTADO`, `IDPERSONA`, `IDROL`) VALUES
(1, 'admin', 'admin', 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD KEY `PERSONA-TIPODOC` (`IDTIPODOC`);

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
  ADD KEY `USER-ROL` (`IDROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IDPERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34571;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IDROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  MODIFY `IDTIPODOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `PERSONA-TIPODOC` FOREIGN KEY (`IDTIPODOC`) REFERENCES `tipodoc` (`IDTIPODOC`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `USER-PERSONA` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `USER-ROL` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`);
COMMIT;
