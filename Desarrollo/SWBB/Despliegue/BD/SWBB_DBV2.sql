-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2023 a las 15:33:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia_db`
--
DROP DATABASE IF EXISTS `barberia_db`;
CREATE DATABASE IF NOT EXISTS `barberia_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `barberia_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barberia`
--

CREATE TABLE `barberia` (
  `idBarberia` int(11) NOT NULL,
  `nombreBarberia` varchar(45) NOT NULL,
  `direccionBarberia` varchar(45) NOT NULL,
  `Distrito_idDistrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `barberia`
--

INSERT INTO `barberia` (`idBarberia`, `nombreBarberia`, `direccionBarberia`, `Distrito_idDistrito`) VALUES
(1, 'Yakijo', 'California', 149),
(2, 'Skyndu', 'Idaho', 193),
(3, 'Skiptube', 'District of Columbia', 193),
(4, 'Eidel', 'Arizona', 85),
(5, 'Topicstorm', 'New York', 128),
(6, 'Thoughtmix', 'Arizona', 183),
(7, 'Photobug', 'Texas', 38),
(8, 'Tagopia', 'Georgia', 157),
(9, 'Jayo', 'California', 80),
(10, 'Flipstorm', 'Ohio', 20),
(11, 'Twinder', 'New York', 32),
(12, 'Devpoint', 'Alabama', 126),
(13, 'Realmix', 'California', 41),
(14, 'Edgepulse', 'California', 164),
(15, 'Tagpad', 'District of Columbia', 134),
(16, 'Wikido', 'Alabama', 54),
(17, 'Dynabox', 'Illinois', 112),
(18, 'Skyble', 'Texas', 187),
(19, 'Trunyx', 'West Virginia', 6),
(20, 'Voolia', 'Florida', 72);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero`
--

CREATE TABLE `barbero` (
  `idBarbero` int(11) NOT NULL,
  `nombreBarbero` varchar(45) NOT NULL,
  `apellidoBarbero` varchar(45) NOT NULL,
  `apodoBarbero` varchar(45) NOT NULL,
  `correoBarbero` varchar(45) NOT NULL,
  `passwordBarbero` varchar(45) NOT NULL,
  `descripcionBarbero` varchar(45) NOT NULL,
  `telefonoBarbero` varchar(11) NOT NULL,
  `contenidoFotoPerfilBarbero` blob NOT NULL,
  `Barberia_idBarberia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `barbero`
--

INSERT INTO `barbero` (`idBarbero`, `nombreBarbero`, `apellidoBarbero`, `apodoBarbero`, `correoBarbero`, `passwordBarbero`, `descripcionBarbero`, `telefonoBarbero`, `contenidoFotoPerfilBarbero`, `Barberia_idBarberia`) VALUES
(1, 'Si', 'Le Lievre', 'Dorolice', 'dlelievre0@angelfire.com', 'l0sbfIH', 'fusce consequat nulla nisl nunc', '6862613853', 0x68747470733a2f2f726f626f686173682e6f72672f74656d706f72616e61747573686172756d2e706e673f73697a653d3530783530267365743d73657431, 20),
(2, 'Jory', 'Perrington', 'Casper', 'cperrington1@amazon.co.jp', '5VmlPFBBcP', 'penatibus et magnis dis parturient montes nas', '6478975971', 0x68747470733a2f2f726f626f686173682e6f72672f647563696d757374656d706f72617065727370696369617469732e706e673f73697a653d3530783530267365743d73657431, 13),
(3, 'Abelard', 'Lygoe', 'Karisa', 'klygoe2@odnoklassniki.ru', 'exDcLi1nJ', 'habitasse platea dictumst maecenas ut massa q', '8302080581', 0x68747470733a2f2f726f626f686173682e6f72672f726570726568656e6465726974756e64656c61626f72756d2e706e673f73697a653d3530783530267365743d73657431, 11),
(4, 'Erik', 'Ingold', 'Christabella', 'cingold3@vimeo.com', 'Fv63tjY8', 'in lacus curabitur at ipsum ac tellus semper ', '7698962619', 0x68747470733a2f2f726f626f686173682e6f72672f617574656d7574696e636964756e742e706e673f73697a653d3530783530267365743d73657431, 17),
(5, 'Nefen', 'Steffans', 'Gearard', 'gsteffans4@about.com', 'Yh97FhF33Q', 'ultrices posuere cubilia curae nulla dapibus ', '7485043214', 0x68747470733a2f2f726f626f686173682e6f72672f74656e657475726d61676e6975742e706e673f73697a653d3530783530267365743d73657431, 2),
(6, 'Marco', 'Plenty', 'Kurt', 'kplenty5@a8.net', 'LvNvLIrb', 'sit amet lobortis sapien sapien non mi intege', '3393487394', 0x68747470733a2f2f726f626f686173682e6f72672f7072616573656e7469756d6d6f6c657374696165696c6c6f2e706e673f73697a653d3530783530267365743d73657431, 19),
(7, 'Katina', 'Paylie', 'Riobard', 'rpaylie6@twitter.com', 'fOWD2YY3', 'dolor morbi vel lectus in quam fringilla', '9377211885', 0x68747470733a2f2f726f626f686173682e6f72672f6573746573746d61676e616d2e706e673f73697a653d3530783530267365743d73657431, 15),
(8, 'Chickie', 'Blown', 'Peyton', 'pblown7@pcworld.com', '2PhiX1dYsf6', 'habitasse platea dictumst morbi vestibulum', '5714235408', 0x68747470733a2f2f726f626f686173682e6f72672f636f6e73657175756e747572646f6c6f7265736d61696f7265732e706e673f73697a653d3530783530267365743d73657431, 10),
(9, 'Thadeus', 'Shinfield', 'Burlie', 'bshinfield8@cisco.com', 'eNB3fhDZIw', 'habitasse platea dictumst aliquam augue quam ', '2503354437', 0x68747470733a2f2f726f626f686173682e6f72672f74656d706f7261746f74616d6e6f6269732e706e673f73697a653d3530783530267365743d73657431, 20),
(10, 'Licha', 'Andrioletti', 'Helenka', 'handrioletti9@techcrunch.com', 'GM9JH643D', 'orci luctus et ultrices posuere cubilia curae', '8916591439', 0x68747470733a2f2f726f626f686173682e6f72672f7061726961747572657865726369746174696f6e656d6578636570747572692e706e673f73697a653d3530783530267365743d73657431, 7),
(11, 'Penn', 'Stoute', 'Benedetta', 'bstoutea@comcast.net', '3s2w7ZxmGE', 'nisi volutpat eleifend donec ut dolor morbi v', '8322429876', 0x68747470733a2f2f726f626f686173682e6f72672f6164766f6c7570746174656d6f64696f2e706e673f73697a653d3530783530267365743d73657431, 6),
(12, 'Audra', 'Folan', 'Malanie', 'mfolanb@weebly.com', 'yFfgpYyaLx', 'aenean auctor gravida sem praesent id', '7103166818', 0x68747470733a2f2f726f626f686173682e6f72672f70617269617475726e6968696c717561652e706e673f73697a653d3530783530267365743d73657431, 19),
(13, 'Algernon', 'Phillot', 'Jean', 'jphillotc@marriott.com', 'DB8TpZ', 'cubilia curae mauris viverra diam vitae quam ', '6127409365', 0x68747470733a2f2f726f626f686173682e6f72672f68696371756f7175692e706e673f73697a653d3530783530267365743d73657431, 3),
(14, 'Pauly', 'Osler', 'Gayelord', 'goslerd@360.cn', 'pF14EJGeX5', 'nec dui luctus rutrum nulla', '4942938967', 0x68747470733a2f2f726f626f686173682e6f72672f6e656d6f65737470726f766964656e742e706e673f73697a653d3530783530267365743d73657431, 6),
(15, 'Demetris', 'Pareman', 'Brigit', 'bparemane@webmd.com', '4BXBlDAlhPtT', 'in tempus sit amet sem fusce', '7537417646', 0x68747470733a2f2f726f626f686173682e6f72672f6e6968696c6172636869746563746f6d696e75732e706e673f73697a653d3530783530267365743d73657431, 8),
(16, 'Irvine', 'Fossey', 'Ofelia', 'ofosseyf@sciencedaily.com', '3h0RRAIyL7Ek', 'convallis nunc proin at turpis a pede posuere', '5386630783', 0x68747470733a2f2f726f626f686173682e6f72672f656975736469676e697373696d6f737665726974617469732e706e673f73697a653d3530783530267365743d73657431, 18),
(17, 'Bryna', 'Bartell', 'Darrel', 'dbartellg@cnn.com', 'MQy3X2l5t', 'vel enim sit amet nunc', '1513492314', 0x68747470733a2f2f726f626f686173682e6f72672f76656c657374766f6c75707461732e706e673f73697a653d3530783530267365743d73657431, 11),
(18, 'Dru', 'Longman', 'Ignaz', 'ilongmanh@canalblog.com', 'xZJEKcvLRcn', 'odio porttitor id consequat in', '3044568525', 0x68747470733a2f2f726f626f686173682e6f72672f75746e657175656573742e706e673f73697a653d3530783530267365743d73657431, 19),
(19, 'Opaline', 'Etherson', 'Worthington', 'wethersoni@goo.gl', '4vUdCKxH17A', 'suscipit ligula in lacus curabitur at ipsum', '7148913903', 0x68747470733a2f2f726f626f686173682e6f72672f75746f666669636969737369742e706e673f73697a653d3530783530267365743d73657431, 12),
(20, 'Leanor', 'Snalom', 'Barbara', 'bsnalomj@unicef.org', 'BCg3D7qYBln', 'venenatis non sodales sed tincidunt', '9224123856', 0x68747470733a2f2f726f626f686173682e6f72672f6573746f646974766f6c75707461732e706e673f73697a653d3530783530267365743d73657431, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barberoespecialidad`
--

CREATE TABLE `barberoespecialidad` (
  `Especialidad_idEspecialidad` int(11) NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `barberoespecialidad`
--

INSERT INTO `barberoespecialidad` (`Especialidad_idEspecialidad`, `Barbero_idBarbero`) VALUES
(3, 20),
(1, 1),
(3, 6),
(2, 20),
(2, 4),
(3, 10),
(3, 19),
(3, 6),
(3, 4),
(2, 8),
(1, 18),
(1, 17),
(3, 18),
(1, 10),
(1, 4),
(1, 8),
(3, 9),
(2, 9),
(1, 12),
(1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(45) NOT NULL,
  `apellidoCliente` varchar(45) NOT NULL,
  `correoCliente` varchar(45) NOT NULL,
  `passwordCliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombreCliente`, `apellidoCliente`, `correoCliente`, `passwordCliente`) VALUES
(1, 'Nan', 'Bartrap', 'nbartrap0@boston.com', 'a1wsy3tzj'),
(2, 'Remus', 'Yuille', 'ryuille1@imdb.com', '9ri0mMT'),
(3, 'Rosalia', 'Binny', 'rbinny2@godaddy.com', 'cMNjucMobi8S'),
(4, 'Shannan', 'Grouer', 'sgrouer3@time.com', 'oxcJw5DEf'),
(5, 'Rodi', 'Macken', 'rmacken4@slate.com', 'sgoMdys8wzT0'),
(6, 'Herschel', 'Lainton', 'hlainton5@wix.com', 'x2wr3GIrE'),
(7, 'Cherye', 'Cottrill', 'ccottrill6@imdb.com', 'YsmaYX'),
(8, 'Dallas', 'Lealle', 'dlealle7@so-net.ne.jp', '2b4PhL7ovI'),
(9, 'Dalenna', 'Haney', 'dhaney8@nps.gov', 'X68UfRO2e'),
(10, 'Fanchette', 'Boxhill', 'fboxhill9@php.net', 'sMeMAeIZFsT'),
(11, 'Atlante', 'Tordiffe', 'atordiffea@t-online.de', 'BK17loz4CAe'),
(12, 'Sofia', 'Racine', 'sracineb@google.ru', '2phRgic'),
(13, 'Helyn', 'Pietzner', 'hpietznerc@parallels.com', 'Za7TUx9'),
(14, 'Meta', 'Santorini', 'msantorinid@bloglovin.com', 'XYtmMFCTvsMh'),
(15, 'Jeanelle', 'Butterfill', 'jbutterfille@infoseek.co.jp', 'IHBRgr5cI'),
(16, 'Austina', 'Laddle', 'aladdlef@jimdo.com', 'UqSADIVH7'),
(17, 'Marve', 'Lackham', 'mlackhamg@cyberchimps.com', 'O6Z85L'),
(18, 'Kimbra', 'O\'Kielt', 'kokielth@1und1.de', 'aJ0faf'),
(19, 'Lula', 'Polye', 'lpolyei@goo.gl', 'vscLzeBGg2wg'),
(20, 'Marcellus', 'Tombleson', 'mtomblesonj@yale.edu', 'aWym3jX8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coladereservaenservicio`
--

CREATE TABLE `coladereservaenservicio` (
  `Servicio_idServicio` int(11) NOT NULL,
  `Reserva_idReserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `coladereservaenservicio`
--

INSERT INTO `coladereservaenservicio` (`Servicio_idServicio`, `Reserva_idReserva`) VALUES
(3, 4),
(4, 3),
(4, 4),
(5, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `nombreDepartamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `nombreDepartamento`) VALUES
(1, 'Amazonas'),
(2, 'Áncash'),
(3, 'Apurímac'),
(4, 'Arequipa'),
(5, 'Ayacucho'),
(6, 'Cajamarca'),
(7, 'Callao'),
(8, 'Cusco'),
(9, 'Huancavelica'),
(10, 'Huánuco'),
(11, 'Ica'),
(12, 'Junín'),
(13, 'La Libertad'),
(14, 'Lambayeque'),
(15, 'Lima'),
(16, 'Loreto'),
(17, 'Madre de Dios'),
(18, 'Moquegua'),
(19, 'Pasco'),
(20, 'Piura'),
(21, 'Puno'),
(22, 'San Martín'),
(23, 'Tacna'),
(24, 'Tumbes'),
(25, 'Ucayali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `idDistrito` int(11) NOT NULL,
  `nombreDistrito` varchar(45) NOT NULL,
  `Departamento_idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`idDistrito`, `nombreDistrito`, `Departamento_idDepartamento`) VALUES
(1, 'CHACHAPOYAS ', 1),
(2, 'BAGUA', 1),
(3, 'BONGARA', 1),
(4, 'CONDORCANQUI', 1),
(5, 'LUYA', 1),
(6, 'RODRIGUEZ DE MENDOZA', 1),
(7, 'UTCUBAMBA', 1),
(8, 'HUARAZ', 2),
(9, 'AIJA', 2),
(10, 'ANTONIO RAYMONDI', 2),
(11, 'ASUNCION', 2),
(12, 'BOLOGNESI', 2),
(13, 'CARHUAZ', 2),
(14, 'CARLOS FERMIN FITZCARRALD', 2),
(15, 'CASMA', 2),
(16, 'CORONGO', 2),
(17, 'HUARI', 2),
(18, 'HUARMEY', 2),
(19, 'HUAYLAS', 2),
(20, 'MARISCAL LUZURIAGA', 2),
(21, 'OCROS', 2),
(22, 'PALLASCA', 2),
(23, 'POMABAMBA', 2),
(24, 'RECUAY', 2),
(25, 'SANTA', 2),
(26, 'SIHUAS', 2),
(27, 'YUNGAY', 2),
(28, 'ABANCAY', 3),
(29, 'ANDAHUAYLAS', 3),
(30, 'ANTABAMBA', 3),
(31, 'AYMARAES', 3),
(32, 'COTABAMBAS', 3),
(33, 'CHINCHEROS', 3),
(34, 'GRAU', 3),
(35, 'AREQUIPA', 4),
(36, 'CAMANA', 4),
(37, 'CARAVELI', 4),
(38, 'CASTILLA', 4),
(39, 'CAYLLOMA', 4),
(40, 'CONDESUYOS', 4),
(41, 'ISLAY', 4),
(42, 'LA UNION', 4),
(43, 'HUAMANGA', 5),
(44, 'CANGALLO', 5),
(45, 'HUANCA SANCOS', 5),
(46, 'HUANTA', 5),
(47, 'LA MAR', 5),
(48, 'LUCANAS', 5),
(49, 'PARINACOCHAS', 5),
(50, 'PAUCAR DEL SARA SARA', 5),
(51, 'SUCRE', 5),
(52, 'VICTOR FAJARDO', 5),
(53, 'VILCAS HUAMAN', 5),
(54, 'CAJAMARCA', 6),
(55, 'CAJABAMBA', 6),
(56, 'CELENDIN', 6),
(57, 'CHOTA ', 6),
(58, 'CONTUMAZA', 6),
(59, 'CUTERVO', 6),
(60, 'HUALGAYOC', 6),
(61, 'JAEN', 6),
(62, 'SAN IGNACIO', 6),
(63, 'SAN MARCOS', 6),
(64, 'SAN PABLO', 6),
(65, 'SANTA CRUZ', 6),
(66, 'CALLAO', 7),
(67, 'CUSCO', 8),
(68, 'ACOMAYO', 8),
(69, 'ANTA', 8),
(70, 'CALCA', 8),
(71, 'CANAS', 8),
(72, 'CANCHIS', 8),
(73, 'CHUMBIVILCAS', 8),
(74, 'ESPINAR', 8),
(75, 'LA CONVENCION', 8),
(76, 'PARURO', 8),
(77, 'PAUCARTAMBO', 8),
(78, 'QUISPICANCHI', 8),
(79, 'URUBAMBA', 8),
(80, 'HUANCAVELICA', 9),
(81, 'ACOBAMBA', 9),
(82, 'ANGARAES', 9),
(83, 'CASTROVIRREYNA', 9),
(84, 'CHURCAMPA', 9),
(85, 'HUAYTARA', 9),
(86, 'TAYACAJA', 9),
(87, 'HUANUCO', 10),
(88, 'AMBO', 10),
(89, 'DOS DE MAYO', 10),
(90, 'HUACAYBAMBA', 10),
(91, 'HUAMALIES', 10),
(92, 'LEONCIO PRADO', 10),
(93, 'MARA&Ntilde;ON', 10),
(94, 'PACHITEA', 10),
(95, 'PUERTO INCA', 10),
(96, 'LAURICOCHA', 10),
(97, 'YAROWILCA', 10),
(98, 'ICA', 11),
(99, 'CHINCHA', 11),
(100, 'NAZCA', 11),
(101, 'PALPA', 11),
(102, 'PISCO', 11),
(103, 'HUANCAYO', 12),
(104, 'CONCEPCION', 12),
(105, 'CHANCHAMAYO', 12),
(106, 'JAUJA', 12),
(107, 'JUNIN', 12),
(108, 'SATIPO', 12),
(109, 'TARMA', 12),
(110, 'YAULI', 12),
(111, 'CHUPACA', 12),
(112, 'TRUJILLO', 13),
(113, 'ASCOPE', 13),
(114, 'BOLIVAR', 13),
(115, 'CHEPEN', 13),
(116, 'JULCAN', 13),
(117, 'OTUZCO', 13),
(118, 'PACASMAYO', 13),
(119, 'PATAZ', 13),
(120, 'SANCHEZ CARRION', 13),
(121, 'SANTIAGO DE CHUCO', 13),
(122, 'GRAN CHIMU', 13),
(123, 'VIRU', 13),
(124, 'CHICLAYO', 14),
(125, 'FERRE&Ntilde;AFE', 14),
(126, 'LAMBAYEQUE', 14),
(127, 'LIMA', 15),
(128, 'BARRANCA', 15),
(129, 'CAJATAMBO', 15),
(130, 'CANTA', 15),
(131, 'CA&Ntilde;ETE', 15),
(132, 'HUARAL', 15),
(133, 'HUAROCHIRI', 15),
(134, 'HUAURA', 15),
(135, 'OYON', 15),
(136, 'YAUYOS', 15),
(137, 'MAYNAS', 16),
(138, 'ALTO AMAZONAS', 16),
(139, 'LORETO', 16),
(140, 'MARISCAL RAMON CASTILLA', 16),
(141, 'REQUENA', 16),
(142, 'UCAYALI', 16),
(143, 'TAMBOPATA', 17),
(144, 'MANU', 17),
(145, 'TAHUAMANU', 17),
(146, 'MARISCAL NIETO', 18),
(147, 'GENERAL SANCHEZ CERRO', 18),
(148, 'ILO', 18),
(149, 'PASCO', 19),
(150, 'DANIEL ALCIDES CARRION', 19),
(151, 'OXAPAMPA', 19),
(152, 'PIURA', 20),
(153, 'AYABACA', 20),
(154, 'HUANCABAMBA', 20),
(155, 'MORROPON', 20),
(156, 'PAITA', 20),
(157, 'SULLANA', 20),
(158, 'TALARA', 20),
(159, 'SECHURA', 20),
(160, 'PUNO', 21),
(161, 'AZANGARO', 21),
(162, 'CARABAYA', 21),
(163, 'CHUCUITO', 21),
(164, 'EL COLLAO', 21),
(165, 'HUANCANE', 21),
(166, 'LAMPA', 21),
(167, 'MELGAR', 21),
(168, 'MOHO', 21),
(169, 'SAN ANTONIO DE PUTINA', 21),
(170, 'SAN ROMAN', 21),
(171, 'SANDIA', 21),
(172, 'YUNGUYO', 21),
(173, 'MOYOBAMBA', 22),
(174, 'BELLAVISTA', 22),
(175, 'EL DORADO', 22),
(176, 'HUALLAGA', 22),
(177, 'LAMAS', 22),
(178, 'MARISCAL CACERES', 22),
(179, 'PICOTA', 22),
(180, 'RIOJA', 22),
(181, 'SAN MARTIN', 22),
(182, 'TOCACHE', 22),
(183, 'TACNA', 23),
(184, 'CANDARAVE', 23),
(185, 'JORGE BASADRE', 23),
(186, 'TARATA', 23),
(187, 'TUMBES', 24),
(188, 'CONTRALMIRANTE VILLAR', 24),
(189, 'ZARUMILLA', 24),
(190, 'CORONEL PORTILLO', 25),
(191, 'ATALAYA', 25),
(192, 'PADRE ABAD', 25),
(193, 'PURUS', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `nombreEspecialidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `nombreEspecialidad`) VALUES
(1, 'CORTES CLÁSICOS '),
(2, 'AFEITADO TIPO DEGRADO'),
(3, 'FIGURAS EN EN PELO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotocliente`
--

CREATE TABLE `fotocliente` (
  `idFotoCliente` int(11) NOT NULL,
  `contenidoFotoCliente` blob NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `fotocliente`
--

INSERT INTO `fotocliente` (`idFotoCliente`, `contenidoFotoCliente`, `Cliente_idCliente`) VALUES
(1, 0x68747470733a2f2f726f626f686173682e6f72672f766f6c757074617465657374646f6c6f72656d2e706e673f73697a653d3530783530267365743d73657431, 8),
(2, 0x68747470733a2f2f726f626f686173682e6f72672f7574706f7373696d75737175692e706e673f73697a653d3530783530267365743d73657431, 14),
(3, 0x68747470733a2f2f726f626f686173682e6f72672f76656c69746964697374652e706e673f73697a653d3530783530267365743d73657431, 9),
(4, 0x68747470733a2f2f726f626f686173682e6f72672f6574636f6e73656374657475727175616d2e706e673f73697a653d3530783530267365743d73657431, 17),
(5, 0x68747470733a2f2f726f626f686173682e6f72672f70726f766964656e74757463756c70612e706e673f73697a653d3530783530267365743d73657431, 1),
(6, 0x68747470733a2f2f726f626f686173682e6f72672f6e616d626c616e646974696973696d70656469742e706e673f73697a653d3530783530267365743d73657431, 20),
(7, 0x68747470733a2f2f726f626f686173682e6f72672f69746171756563756d71756563756c70612e706e673f73697a653d3530783530267365743d73657431, 2),
(8, 0x68747470733a2f2f726f626f686173682e6f72672f6964717569696e76656e746f72652e706e673f73697a653d3530783530267365743d73657431, 15),
(9, 0x68747470733a2f2f726f626f686173682e6f72672f696c6c756d656e696d746f74616d2e706e673f73697a653d3530783530267365743d73657431, 8),
(10, 0x68747470733a2f2f726f626f686173682e6f72672f65746f64696f717569612e706e673f73697a653d3530783530267365743d73657431, 12),
(11, 0x68747470733a2f2f726f626f686173682e6f72672f64656c65637475736e6f737472756d6573742e706e673f73697a653d3530783530267365743d73657431, 2),
(12, 0x68747470733a2f2f726f626f686173682e6f72672f6e65717565656e696d63756d7175652e706e673f73697a653d3530783530267365743d73657431, 3),
(13, 0x68747470733a2f2f726f626f686173682e6f72672f636f727275707469636f6e73657175617475726e6968696c2e706e673f73697a653d3530783530267365743d73657431, 9),
(14, 0x68747470733a2f2f726f626f686173682e6f72672f7175616573756e746e616d2e706e673f73697a653d3530783530267365743d73657431, 17),
(15, 0x68747470733a2f2f726f626f686173682e6f72672f706f72726f736974696d70656469742e706e673f73697a653d3530783530267365743d73657431, 10),
(16, 0x68747470733a2f2f726f626f686173682e6f72672f766f6c7570746174657365646573742e706e673f73697a653d3530783530267365743d73657431, 4),
(17, 0x68747470733a2f2f726f626f686173682e6f72672f6569757373697465742e706e673f73697a653d3530783530267365743d73657431, 11),
(18, 0x68747470733a2f2f726f626f686173682e6f72672f766f6c7570746174656d7175696f63636165636174692e706e673f73697a653d3530783530267365743d73657431, 1),
(19, 0x68747470733a2f2f726f626f686173682e6f72672f697572656675676974646f6c6f7265732e706e673f73697a653d3530783530267365743d73657431, 6),
(20, 0x68747470733a2f2f726f626f686173682e6f72672f65746d696e75737665726f2e706e673f73697a653d3530783530267365743d73657431, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotoportafolio`
--

CREATE TABLE `fotoportafolio` (
  `idFotoPortafolio` int(11) NOT NULL,
  `contenidoFotoPortafolio` blob NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `fotoportafolio`
--

INSERT INTO `fotoportafolio` (`idFotoPortafolio`, `contenidoFotoPortafolio`, `Barbero_idBarbero`) VALUES
(1, 0x68747470733a2f2f726f626f686173682e6f72672f73656465756d646f6c6f722e706e673f73697a653d3530783530267365743d73657431, 2),
(2, 0x68747470733a2f2f726f626f686173682e6f72672f696e636964756e74736564636f6e73657175617475722e706e673f73697a653d3530783530267365743d73657431, 7),
(3, 0x68747470733a2f2f726f626f686173682e6f72672f6e6f6e617574756e64652e706e673f73697a653d3530783530267365743d73657431, 15),
(4, 0x68747470733a2f2f726f626f686173682e6f72672f6173706572696f7265736e697369717569612e706e673f73697a653d3530783530267365743d73657431, 5),
(5, 0x68747470733a2f2f726f626f686173682e6f72672f6d6f6c6c69746961717569617365642e706e673f73697a653d3530783530267365743d73657431, 7),
(6, 0x68747470733a2f2f726f626f686173682e6f72672f72656d696c6c756d646f6c6f72756d2e706e673f73697a653d3530783530267365743d73657431, 15),
(7, 0x68747470733a2f2f726f626f686173682e6f72672f657865726369746174696f6e656d73756e7472656d2e706e673f73697a653d3530783530267365743d73657431, 18),
(8, 0x68747470733a2f2f726f626f686173682e6f72672f6e6968696c766f6c75707461736d6f6c6c697469612e706e673f73697a653d3530783530267365743d73657431, 15),
(9, 0x68747470733a2f2f726f626f686173682e6f72672f646f6c6f72656d7175656574616e696d692e706e673f73697a653d3530783530267365743d73657431, 8),
(10, 0x68747470733a2f2f726f626f686173682e6f72672f6574756e646571756f2e706e673f73697a653d3530783530267365743d73657431, 2),
(11, 0x68747470733a2f2f726f626f686173682e6f72672f6f636361656361746964697374696e6374696f656f732e706e673f73697a653d3530783530267365743d73657431, 13),
(12, 0x68747470733a2f2f726f626f686173682e6f72672f65737470617269617475727369742e706e673f73697a653d3530783530267365743d73657431, 9),
(13, 0x68747470733a2f2f726f626f686173682e6f72672f7175697366756761717561652e706e673f73697a653d3530783530267365743d73657431, 8),
(14, 0x68747470733a2f2f726f626f686173682e6f72672f74656e6574757273656470617269617475722e706e673f73697a653d3530783530267365743d73657431, 5),
(15, 0x68747470733a2f2f726f626f686173682e6f72672f686172756d65756d646f6c6f722e706e673f73697a653d3530783530267365743d73657431, 7),
(16, 0x68747470733a2f2f726f626f686173682e6f72672f706f7373696d757373756e746d6f6c6c697469612e706e673f73697a653d3530783530267365743d73657431, 8),
(17, 0x68747470733a2f2f726f626f686173682e6f72672f6d61676e616d6170657269616d6d6f6c6573746961732e706e673f73697a653d3530783530267365743d73657431, 9),
(18, 0x68747470733a2f2f726f626f686173682e6f72672f6573746c617564616e7469756d6173706572696f7265732e706e673f73697a653d3530783530267365743d73657431, 7),
(19, 0x68747470733a2f2f726f626f686173682e6f72672f7175616d756c6c616d76656c69742e706e673f73697a653d3530783530267365743d73657431, 10),
(20, 0x68747470733a2f2f726f626f686173682e6f72672f71756f69737465726570726568656e64657269742e706e673f73697a653d3530783530267365743d73657431, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinion`
--

CREATE TABLE `opinion` (
  `idOpinion` int(11) NOT NULL,
  `nombreOpinion` varchar(45) NOT NULL,
  `descripcionOpinion` varchar(45) NOT NULL,
  `notaOpinion` varchar(45) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `opinion`
--

INSERT INTO `opinion` (`idOpinion`, `nombreOpinion`, `descripcionOpinion`, `notaOpinion`, `Cliente_idCliente`, `Barbero_idBarbero`) VALUES
(1, 'Veriee', 'Drainage of Left Brachial Artery, Perc Endo A', '10', 1, 16),
(2, 'Bruis', 'Bypass Sup Vena Cava to Pulm Vn Cnfl w Synth ', '2', 4, 18),
(3, 'Linell', 'Bypass Jejunum to Jejunum with Autol Sub, Ope', '6', 18, 18),
(4, 'Silvain', 'CT Scan of Thorax using L Osm Contrast', '2', 19, 18),
(5, 'Katheryn', 'Supplement Left Foot Vein with Synth Sub, Ope', '6', 7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `fechaReserva` varchar(45) NOT NULL,
  `estadoReserva` varchar(45) NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Servicio_idServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idReserva`, `fechaReserva`, `estadoReserva`, `Barbero_idBarbero`, `Cliente_idCliente`, `Servicio_idServicio`) VALUES
(1, '08-09-2023', 'por atender', 6, 20, 5),
(2, '26-08-2023', 'por atender', 13, 20, 4),
(3, '09-08-2023', 'por atender', 8, 9, 1),
(4, '07-08-2023', 'por atender', 12, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `nombreServicio` varchar(45) NOT NULL,
  `descripcionServicio` varchar(45) NOT NULL,
  `precioServicio` decimal(10,0) NOT NULL,
  `estadoServicio` varchar(45) NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `nombreServicio`, `descripcionServicio`, `precioServicio`, `estadoServicio`, `Barbero_idBarbero`) VALUES
(1, 'elit proin', 'Pressure ulcer of right heel, stage 1', 18, 'urgente', 2),
(2, 'accumsan tortor quis', 'Other instability, right ankle', 50, 'urgente', 19),
(3, 'ultrices', 'Disp fx of trapezium, right wrist, subs for f', 36, 'urgente', 14),
(4, 'erat id', 'Moderate laceration of unsp part of pancreas,', 36, 'urgente', 5),
(5, 'amet nulla', 'Other benign neoplasm of skin, unspecified', 49, 'urgente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag`
--

CREATE TABLE `tag` (
  `idTag` int(11) NOT NULL,
  `nombreTag` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tag`
--

INSERT INTO `tag` (`idTag`, `nombreTag`) VALUES
(1, 'Cortes'),
(2, 'Diseños'),
(3, 'Adultos'),
(4, 'Niños');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tagbarbero`
--

CREATE TABLE `tagbarbero` (
  `Tag_idTag` int(11) NOT NULL,
  `Barbero_idBarbero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tagbarbero`
--

INSERT INTO `tagbarbero` (`Tag_idTag`, `Barbero_idBarbero`) VALUES
(3, 4),
(4, 14),
(4, 10),
(3, 15),
(2, 5),
(1, 20),
(1, 20),
(4, 15),
(3, 17),
(1, 11),
(1, 8),
(4, 7),
(4, 3),
(1, 8),
(4, 6),
(2, 13),
(1, 1),
(2, 20),
(3, 7),
(1, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barberia`
--
ALTER TABLE `barberia`
  ADD PRIMARY KEY (`idBarberia`),
  ADD UNIQUE KEY `idBarberia_UNIQUE` (`idBarberia`),
  ADD KEY `fk_Barberia_Distrito1_idx` (`Distrito_idDistrito`);

--
-- Indices de la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD PRIMARY KEY (`idBarbero`),
  ADD UNIQUE KEY `idBarbero_UNIQUE` (`idBarbero`),
  ADD KEY `fk_Barbero_Barberia1_idx` (`Barberia_idBarberia`);

--
-- Indices de la tabla `barberoespecialidad`
--
ALTER TABLE `barberoespecialidad`
  ADD KEY `fk_BarberoEspecialidad_Barbero1_idx` (`Barbero_idBarbero`),
  ADD KEY `fk_BarberoEspecialidad_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`);

--
-- Indices de la tabla `coladereservaenservicio`
--
ALTER TABLE `coladereservaenservicio`
  ADD KEY `fk_ColaDeReservaEnServicio_Servicio_idx` (`Servicio_idServicio`),
  ADD KEY `fk_ColaDeReservaEnServicio_Reserva1_idx` (`Reserva_idReserva`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD UNIQUE KEY `idDepartamento_UNIQUE` (`idDepartamento`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`idDistrito`),
  ADD UNIQUE KEY `idDistrito_UNIQUE` (`idDistrito`),
  ADD KEY `fk_Distrito_Departamento1_idx` (`Departamento_idDepartamento`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`),
  ADD UNIQUE KEY `idEspecialidad_UNIQUE` (`idEspecialidad`);

--
-- Indices de la tabla `fotocliente`
--
ALTER TABLE `fotocliente`
  ADD PRIMARY KEY (`idFotoCliente`),
  ADD UNIQUE KEY `idFotoCliente_UNIQUE` (`idFotoCliente`),
  ADD KEY `fk_FotoCliente_Cliente1_idx` (`Cliente_idCliente`);

--
-- Indices de la tabla `fotoportafolio`
--
ALTER TABLE `fotoportafolio`
  ADD PRIMARY KEY (`idFotoPortafolio`),
  ADD UNIQUE KEY `idFotoPortafolio_UNIQUE` (`idFotoPortafolio`),
  ADD KEY `fk_FotoPortafolio_Barbero1_idx` (`Barbero_idBarbero`);

--
-- Indices de la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD PRIMARY KEY (`idOpinion`),
  ADD UNIQUE KEY `idOpinion_UNIQUE` (`idOpinion`),
  ADD KEY `fk_Opinion_Cliente1_idx` (`Cliente_idCliente`),
  ADD KEY `fk_Opinion_Barbero1_idx` (`Barbero_idBarbero`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD UNIQUE KEY `idReserva_UNIQUE` (`idReserva`),
  ADD KEY `fk_Reserva_Barbero1_idx` (`Barbero_idBarbero`),
  ADD KEY `fk_Reserva_Cliente1_idx` (`Cliente_idCliente`),
  ADD KEY `fk_Reserva_Servicio1_idx` (`Servicio_idServicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD UNIQUE KEY `idServicio_UNIQUE` (`idServicio`),
  ADD KEY `fk_Servicio_Barbero1_idx` (`Barbero_idBarbero`);

--
-- Indices de la tabla `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`idTag`),
  ADD UNIQUE KEY `idTag_UNIQUE` (`idTag`);

--
-- Indices de la tabla `tagbarbero`
--
ALTER TABLE `tagbarbero`
  ADD KEY `fk_TagBarbero_Tag1_idx` (`Tag_idTag`),
  ADD KEY `fk_TagBarbero_Barbero1_idx` (`Barbero_idBarbero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barberia`
--
ALTER TABLE `barberia`
  MODIFY `idBarberia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `barbero`
--
ALTER TABLE `barbero`
  MODIFY `idBarbero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `idDistrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fotocliente`
--
ALTER TABLE `fotocliente`
  MODIFY `idFotoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `fotoportafolio`
--
ALTER TABLE `fotoportafolio`
  MODIFY `idFotoPortafolio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `opinion`
--
ALTER TABLE `opinion`
  MODIFY `idOpinion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tag`
--
ALTER TABLE `tag`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barberia`
--
ALTER TABLE `barberia`
  ADD CONSTRAINT `fk_Barberia_Distrito1` FOREIGN KEY (`Distrito_idDistrito`) REFERENCES `distrito` (`idDistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD CONSTRAINT `fk_Barbero_Barberia1` FOREIGN KEY (`Barberia_idBarberia`) REFERENCES `barberia` (`idBarberia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `barberoespecialidad`
--
ALTER TABLE `barberoespecialidad`
  ADD CONSTRAINT `fk_BarberoEspecialidad_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BarberoEspecialidad_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `coladereservaenservicio`
--
ALTER TABLE `coladereservaenservicio`
  ADD CONSTRAINT `fk_ColaDeReservaEnServicio_Reserva1` FOREIGN KEY (`Reserva_idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ColaDeReservaEnServicio_Servicio` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `fk_Distrito_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fotocliente`
--
ALTER TABLE `fotocliente`
  ADD CONSTRAINT `fk_FotoCliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fotoportafolio`
--
ALTER TABLE `fotoportafolio`
  ADD CONSTRAINT `fk_FotoPortafolio_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD CONSTRAINT `fk_Opinion_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Opinion_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_Reserva_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Servicio1` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_Servicio_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tagbarbero`
--
ALTER TABLE `tagbarbero`
  ADD CONSTRAINT `fk_TagBarbero_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TagBarbero_Tag1` FOREIGN KEY (`Tag_idTag`) REFERENCES `tag` (`idTag`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
