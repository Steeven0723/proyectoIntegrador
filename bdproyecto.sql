-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2024 a las 02:59:28
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comité`
--

CREATE TABLE `comité` (
  `ID_Comite` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `ID_Docente` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`ID_Docente`, `Nombre`, `Apellido`, `Especialidad`, `Correo`, `Teléfono`, `ID_Usuario`) VALUES
(1, 'dsfaf', 'dsaf', NULL, 'dfsaf@unicesar.edu.co', NULL, 6),
(2, '2332', 'sdda', NULL, 'as@unice.co', NULL, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `ID_Estudiante` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`ID_Estudiante`, `Nombre`, `Apellido`, `Fecha_Nacimiento`, `Correo`, `Teléfono`, `ID_Usuario`) VALUES
(1, 'steeven', 'quintero', NULL, 'sd@unicesar.edu.co', NULL, 5),
(2, 'eqw', 'qwe', NULL, 'asd@unice.edu', NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `ID_Evaluacion` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Descripción` text DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ID_Materia` int(11) DEFAULT NULL,
  `ID_Docente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `ID_Materia` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripción` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `ID_Permiso` int(11) NOT NULL,
  `Nombre_Permiso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`ID_Permiso`, `Nombre_Permiso`) VALUES
(1, 'Crear Evaluación'),
(2, 'Revisar Evaluación'),
(3, 'Ver Resultados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `ID_Resultado` int(11) NOT NULL,
  `ID_Estudiante` int(11) DEFAULT NULL,
  `ID_Evaluacion` int(11) DEFAULT NULL,
  `Nota` decimal(5,2) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisiones`
--

CREATE TABLE `revisiones` (
  `ID_Revision` int(11) NOT NULL,
  `ID_Comite` int(11) DEFAULT NULL,
  `ID_Resultado` int(11) DEFAULT NULL,
  `Fecha_Revision` date DEFAULT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_Rol`, `Nombre_Rol`) VALUES
(4, 'Admin'),
(3, 'Comité'),
(2, 'Docente'),
(1, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `ID_Rol` int(11) NOT NULL,
  `ID_Permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`ID_Rol`, `ID_Permiso`) VALUES
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ID_Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre_Usuario`, `Contraseña`, `Email`, `ID_Rol`) VALUES
(1, 'estudiante1', 'password123', 'estudiante1@example.com', 1),
(2, 'docente1', 'password123', 'docente1@example.com', 2),
(3, 'comite1', 'password123', 'comite1@example.com', 3),
(4, 'Admin', 'admin123', 'Admin@unicesar.edu.co', 4),
(5, 'steeven07', '$2y$10$PZOVdxgKvQ46bgvTsaCqj.1M7ROS2ttSoQ33KEpH1AWtkGJTOiSlq', 'sd@unicesar.edu.co', 1),
(6, 'dsd', '$2y$10$Amj.JmEVFLYEsiuBQOpFUO2CAyxspCazezF4oA4gR/PNdpWAwf13y', 'dfsaf@unicesar.edu.co', 2),
(7, 'qwe', '$2y$10$WcOuYUiAFprQJW1Ukvzypu13wtLvgFOfO8SKs449kmRJWKBIr/ew6', 'asd@unice.edu', 1),
(8, 'dasd', '$2y$10$HJlgZ1gHaVCjySsLFkKS/uX9RvJeHfrRl2BL6vQ./Ix.tRkZBxIm2', 'as@unice.co', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comité`
--
ALTER TABLE `comité`
  ADD PRIMARY KEY (`ID_Comite`),
  ADD UNIQUE KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`ID_Docente`),
  ADD UNIQUE KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`ID_Estudiante`),
  ADD UNIQUE KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`ID_Evaluacion`),
  ADD KEY `ID_Materia` (`ID_Materia`),
  ADD KEY `ID_Docente` (`ID_Docente`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID_Materia`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`ID_Permiso`),
  ADD UNIQUE KEY `Nombre_Permiso` (`Nombre_Permiso`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`ID_Resultado`),
  ADD KEY `ID_Estudiante` (`ID_Estudiante`),
  ADD KEY `ID_Evaluacion` (`ID_Evaluacion`);

--
-- Indices de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD PRIMARY KEY (`ID_Revision`),
  ADD KEY `ID_Comite` (`ID_Comite`),
  ADD KEY `ID_Resultado` (`ID_Resultado`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_Rol`),
  ADD UNIQUE KEY `Nombre_Rol` (`Nombre_Rol`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`ID_Rol`,`ID_Permiso`),
  ADD KEY `ID_Permiso` (`ID_Permiso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Nombre_Usuario` (`Nombre_Usuario`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comité`
--
ALTER TABLE `comité`
  MODIFY `ID_Comite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `ID_Docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `ID_Estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `ID_Evaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `ID_Materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `ID_Permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `ID_Resultado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  MODIFY `ID_Revision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comité`
--
ALTER TABLE `comité`
  ADD CONSTRAINT `comité_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID_Materia`),
  ADD CONSTRAINT `evaluaciones_ibfk_2` FOREIGN KEY (`ID_Docente`) REFERENCES `docentes` (`ID_Docente`);

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `estudiantes` (`ID_Estudiante`),
  ADD CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`ID_Evaluacion`) REFERENCES `evaluaciones` (`ID_Evaluacion`);

--
-- Filtros para la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD CONSTRAINT `revisiones_ibfk_1` FOREIGN KEY (`ID_Comite`) REFERENCES `comité` (`ID_Comite`),
  ADD CONSTRAINT `revisiones_ibfk_2` FOREIGN KEY (`ID_Resultado`) REFERENCES `resultados` (`ID_Resultado`);

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `rol_permiso_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`),
  ADD CONSTRAINT `rol_permiso_ibfk_2` FOREIGN KEY (`ID_Permiso`) REFERENCES `permisos` (`ID_Permiso`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
