-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: barberia_db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barberia`
--

DROP TABLE IF EXISTS `barberia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barberia` (
  `idBarberia` int NOT NULL AUTO_INCREMENT,
  `nombreBarberia` varchar(45) NOT NULL,
  `direccionBarberia` varchar(45) NOT NULL,
  `Distrito_idDistrito` int NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`idBarberia`),
  UNIQUE KEY `idBarberia_UNIQUE` (`idBarberia`),
  KEY `fk_Barberia_Distrito1_idx` (`Distrito_idDistrito`),
  CONSTRAINT `fk_Barberia_Distrito1` FOREIGN KEY (`Distrito_idDistrito`) REFERENCES `distrito` (`idDistrito`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barberia`
--

LOCK TABLES `barberia` WRITE;
/*!40000 ALTER TABLE `barberia` DISABLE KEYS */;
INSERT INTO `barberia` VALUES (1,'A & S Barber Shop','Av. José Pardo 620',21,'15074'),(2,'NewYork Barberia Clásica','Av. Sta. Cruz 835',21,'15074'),(3,'Cupper’s 65 Barber Shop','Av. República de Panamá 6550',6,'15003'),(4,'Klipperz','Av. Angamos 2268',41,'15047'),(5,'Barbería La Paz','Av. La Paz 418',21,'15074'),(6,'Barbería Carpone','Calle Schell 361',21,'15074'),(7,'Barbería Il Capo','Manuel Villaran 838',41,'15038'),(8,'Montreal Barber Shop','Calle San Martin 429',21,'15074'),(9,'Camaleon Barber Shop','Jorge Chávez 129',21,'15074'),(10,'The Barber Company','Av. Arenales 2211',16,'15073'),(11,'Lima Cutz Baber Lounge Barberia Barber Shop','Av. Caminos del Inca 3189',40,'15053'),(12,'Lima Barber Club','Av. General Eugenio Garzón 598',13,'15076'),(13,'Barbaric Barber Shop & Club','Av. Javier Prado Este 6520',6,'15034'),(14,'Good Fella\'s Barbershop Perú','Av. La Marina 3285',6,'15001'),(15,'Batistino Barbería','Av. El Polo 481 Monterrico',40,'15038'),(16,'Barbería Barba Negra','Calle Colón 185',21,'15074'),(17,'Barber Brother\'s','Villa Real',6,'15701'),(18,'El Turco','Av. San Martin 662',3,'15047'),(19,'BARLOVENTO BARBER SHOP','Av. Ramon Herrera 301',6,'15004'),(20,'Barbería Perú Style','Av. Arnaldo Márquez 1263',13,'15084');
/*!40000 ALTER TABLE `barberia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barbero`
--

DROP TABLE IF EXISTS `barbero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barbero` (
  `idBarbero` int NOT NULL AUTO_INCREMENT,
  `nombreBarbero` varchar(45) NOT NULL,
  `apellidoBarbero` varchar(45) NOT NULL,
  `apodoBarbero` varchar(45) NOT NULL,
  `correoBarbero` varchar(45) NOT NULL,
  `passwordBarbero` varchar(45) NOT NULL,
  `descripcionBarbero` varchar(45) NOT NULL,
  `telefonoBarbero` varchar(11) NOT NULL,
  `contenidoFotoPerfilBarbero` blob NOT NULL,
  `Barberia_idBarberia` int NOT NULL,
  PRIMARY KEY (`idBarbero`),
  UNIQUE KEY `idBarbero_UNIQUE` (`idBarbero`),
  KEY `fk_Barbero_Barberia1_idx` (`Barberia_idBarberia`),
  CONSTRAINT `fk_Barbero_Barberia1` FOREIGN KEY (`Barberia_idBarberia`) REFERENCES `barberia` (`idBarberia`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barbero`
--

LOCK TABLES `barbero` WRITE;
/*!40000 ALTER TABLE `barbero` DISABLE KEYS */;
INSERT INTO `barbero` VALUES (1,'Si','Le Lievre','Dorolice','dlelievre0@angelfire.com','l0sbfIH','fusce consequat nulla nisl nunc','6862613853',_binary 'https://robohash.org/temporanatusharum.png?size=50x50&set=set1',20),(2,'Jory','Perrington','Casper','cperrington1@amazon.co.jp','5VmlPFBBcP','penatibus et magnis dis parturient montes nas','6478975971',_binary 'https://robohash.org/ducimustemporaperspiciatis.png?size=50x50&set=set1',13),(3,'Abelard','Lygoe','Karisa','klygoe2@odnoklassniki.ru','exDcLi1nJ','habitasse platea dictumst maecenas ut massa q','8302080581',_binary 'https://robohash.org/reprehenderitundelaborum.png?size=50x50&set=set1',11),(4,'Erik','Ingold','Christabella','cingold3@vimeo.com','Fv63tjY8','in lacus curabitur at ipsum ac tellus semper ','7698962619',_binary 'https://robohash.org/autemutincidunt.png?size=50x50&set=set1',17),(5,'Nefen','Steffans','Gearard','gsteffans4@about.com','Yh97FhF33Q','ultrices posuere cubilia curae nulla dapibus ','7485043214',_binary 'https://robohash.org/teneturmagniut.png?size=50x50&set=set1',2),(6,'Marco','Plenty','Kurt','kplenty5@a8.net','LvNvLIrb','sit amet lobortis sapien sapien non mi intege','3393487394',_binary 'https://robohash.org/praesentiummolestiaeillo.png?size=50x50&set=set1',19),(7,'Katina','Paylie','Riobard','rpaylie6@twitter.com','fOWD2YY3','dolor morbi vel lectus in quam fringilla','9377211885',_binary 'https://robohash.org/estestmagnam.png?size=50x50&set=set1',15),(8,'Chickie','Blown','Peyton','pblown7@pcworld.com','2PhiX1dYsf6','habitasse platea dictumst morbi vestibulum','5714235408',_binary 'https://robohash.org/consequunturdoloresmaiores.png?size=50x50&set=set1',10),(9,'Thadeus','Shinfield','Burlie','bshinfield8@cisco.com','eNB3fhDZIw','habitasse platea dictumst aliquam augue quam ','2503354437',_binary 'https://robohash.org/temporatotamnobis.png?size=50x50&set=set1',20),(10,'Licha','Andrioletti','Helenka','handrioletti9@techcrunch.com','GM9JH643D','orci luctus et ultrices posuere cubilia curae','8916591439',_binary 'https://robohash.org/pariaturexercitationemexcepturi.png?size=50x50&set=set1',7),(11,'Penn','Stoute','Benedetta','bstoutea@comcast.net','3s2w7ZxmGE','nisi volutpat eleifend donec ut dolor morbi v','8322429876',_binary 'https://robohash.org/advoluptatemodio.png?size=50x50&set=set1',6),(12,'Audra','Folan','Malanie','mfolanb@weebly.com','yFfgpYyaLx','aenean auctor gravida sem praesent id','7103166818',_binary 'https://robohash.org/pariaturnihilquae.png?size=50x50&set=set1',19),(13,'Algernon','Phillot','Jean','jphillotc@marriott.com','DB8TpZ','cubilia curae mauris viverra diam vitae quam ','6127409365',_binary 'https://robohash.org/hicquoqui.png?size=50x50&set=set1',3),(14,'Pauly','Osler','Gayelord','goslerd@360.cn','pF14EJGeX5','nec dui luctus rutrum nulla','4942938967',_binary 'https://robohash.org/nemoestprovident.png?size=50x50&set=set1',6),(15,'Demetris','Pareman','Brigit','bparemane@webmd.com','4BXBlDAlhPtT','in tempus sit amet sem fusce','7537417646',_binary 'https://robohash.org/nihilarchitectominus.png?size=50x50&set=set1',8),(16,'Irvine','Fossey','Ofelia','ofosseyf@sciencedaily.com','3h0RRAIyL7Ek','convallis nunc proin at turpis a pede posuere','5386630783',_binary 'https://robohash.org/eiusdignissimosveritatis.png?size=50x50&set=set1',18),(17,'Bryna','Bartell','Darrel','dbartellg@cnn.com','MQy3X2l5t','vel enim sit amet nunc','1513492314',_binary 'https://robohash.org/velestvoluptas.png?size=50x50&set=set1',11),(18,'Dru','Longman','Ignaz','ilongmanh@canalblog.com','xZJEKcvLRcn','odio porttitor id consequat in','3044568525',_binary 'https://robohash.org/utnequeest.png?size=50x50&set=set1',19),(19,'Opaline','Etherson','Worthington','wethersoni@goo.gl','4vUdCKxH17A','suscipit ligula in lacus curabitur at ipsum','7148913903',_binary 'https://robohash.org/utofficiissit.png?size=50x50&set=set1',12),(20,'Leanor','Snalom','Barbara','bsnalomj@unicef.org','BCg3D7qYBln','venenatis non sodales sed tincidunt','9224123856',_binary 'https://robohash.org/estoditvoluptas.png?size=50x50&set=set1',7);
/*!40000 ALTER TABLE `barbero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barberoespecialidad`
--

DROP TABLE IF EXISTS `barberoespecialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barberoespecialidad` (
  `Especialidad_idEspecialidad` int NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  KEY `fk_BarberoEspecialidad_Barbero1_idx` (`Barbero_idBarbero`),
  KEY `fk_BarberoEspecialidad_Especialidad1_idx` (`Especialidad_idEspecialidad`),
  CONSTRAINT `fk_BarberoEspecialidad_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`),
  CONSTRAINT `fk_BarberoEspecialidad_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barberoespecialidad`
--

LOCK TABLES `barberoespecialidad` WRITE;
/*!40000 ALTER TABLE `barberoespecialidad` DISABLE KEYS */;
INSERT INTO `barberoespecialidad` VALUES (3,20),(1,1),(3,6),(2,20),(2,4),(3,10),(3,19),(3,6),(3,4),(2,8),(1,18),(1,17),(3,18),(1,10),(1,4),(1,8),(3,9),(2,9),(1,12),(1,7);
/*!40000 ALTER TABLE `barberoespecialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(45) NOT NULL,
  `apellidoCliente` varchar(45) NOT NULL,
  `correoCliente` varchar(45) NOT NULL,
  `passwordCliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Nan','Bartrap','nbartrap0@boston.com','a1wsy3tzj'),(2,'Remus','Yuille','ryuille1@imdb.com','9ri0mMT'),(3,'Rosalia','Binny','rbinny2@godaddy.com','cMNjucMobi8S'),(4,'Shannan','Grouer','sgrouer3@time.com','oxcJw5DEf'),(5,'Rodi','Macken','rmacken4@slate.com','sgoMdys8wzT0'),(6,'Herschel','Lainton','hlainton5@wix.com','x2wr3GIrE'),(7,'Cherye','Cottrill','ccottrill6@imdb.com','YsmaYX'),(8,'Dallas','Lealle','dlealle7@so-net.ne.jp','2b4PhL7ovI'),(9,'Dalenna','Haney','dhaney8@nps.gov','X68UfRO2e'),(10,'Fanchette','Boxhill','fboxhill9@php.net','sMeMAeIZFsT'),(11,'Atlante','Tordiffe','atordiffea@t-online.de','BK17loz4CAe'),(12,'Sofia','Racine','sracineb@google.ru','2phRgic'),(13,'Helyn','Pietzner','hpietznerc@parallels.com','Za7TUx9'),(14,'Meta','Santorini','msantorinid@bloglovin.com','XYtmMFCTvsMh'),(15,'Jeanelle','Butterfill','jbutterfille@infoseek.co.jp','IHBRgr5cI'),(16,'Austina','Laddle','aladdlef@jimdo.com','UqSADIVH7'),(17,'Marve','Lackham','mlackhamg@cyberchimps.com','O6Z85L'),(18,'Kimbra','O\'Kielt','kokielth@1und1.de','aJ0faf'),(19,'Lula','Polye','lpolyei@goo.gl','vscLzeBGg2wg'),(20,'Marcellus','Tombleson','mtomblesonj@yale.edu','aWym3jX8');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coladereservaenservicio`
--

DROP TABLE IF EXISTS `coladereservaenservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coladereservaenservicio` (
  `Servicio_idServicio` int NOT NULL,
  `Reserva_idReserva` int NOT NULL,
  KEY `fk_ColaDeReservaEnServicio_Servicio_idx` (`Servicio_idServicio`),
  KEY `fk_ColaDeReservaEnServicio_Reserva1_idx` (`Reserva_idReserva`),
  CONSTRAINT `fk_ColaDeReservaEnServicio_Reserva1` FOREIGN KEY (`Reserva_idReserva`) REFERENCES `reserva` (`idReserva`),
  CONSTRAINT `fk_ColaDeReservaEnServicio_Servicio` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coladereservaenservicio`
--

LOCK TABLES `coladereservaenservicio` WRITE;
/*!40000 ALTER TABLE `coladereservaenservicio` DISABLE KEYS */;
INSERT INTO `coladereservaenservicio` VALUES (3,4),(4,3),(4,4),(5,3),(1,4);
/*!40000 ALTER TABLE `coladereservaenservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE KEY `idDepartamento_UNIQUE` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Amazonas'),(2,'Áncash'),(3,'Apurímac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Callao'),(8,'Cusco'),(9,'Huancavelica'),(10,'Huánuco'),(11,'Ica'),(12,'Junín'),(13,'La Libertad'),(14,'Lambayeque'),(15,'Lima'),(16,'Loreto'),(17,'Madre de Dios'),(18,'Moquegua'),(19,'Pasco'),(20,'Piura'),(21,'Puno'),(22,'San Martín'),(23,'Tacna'),(24,'Tumbes'),(25,'Ucayali');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `idDistrito` int NOT NULL AUTO_INCREMENT,
  `nombreDistrito` varchar(45) NOT NULL,
  `Departamento_idDepartamento` int NOT NULL,
  PRIMARY KEY (`idDistrito`),
  UNIQUE KEY `idDistrito_UNIQUE` (`idDistrito`),
  KEY `fk_Distrito_Departamento1_idx` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Distrito_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Ancón',15),(2,'Ate',15),(3,'Barranco',15),(4,'Breña',15),(5,'Carabayllo',15),(6,'Cercado de Lima',15),(7,'Chaclacayo',15),(8,'Chorrillos',15),(9,'Cieneguilla',15),(10,'Comas',15),(11,'El agustino',15),(12,'Independencia',15),(13,'Jesús maría',15),(14,'La molina',15),(15,'La victoria',15),(16,'Lince',15),(17,'Los olivos',15),(18,'Lurigancho',15),(19,'Lurín',15),(20,'Magdalena del mar',15),(21,'Miraflores',15),(22,'Pachacámac',15),(23,'Pucusana',15),(24,'Pueblo libre',15),(25,'Puente piedra',15),(26,'Punta hermosa',15),(27,'Punta negra',15),(28,'Rímac',15),(29,'San bartolo',15),(30,'San borja',15),(31,'San isidro',15),(32,'San Juan de Lurigancho',15),(33,'San Juan de Miraflores',15),(34,'San Luis',15),(35,'San Martin de Porres',15),(36,'San Miguel',15),(37,'Santa Anita',15),(38,'Santa María del Mar',15),(39,'Santa Rosa',15),(40,'Santiago de Surco',15),(41,'Surquillo',15),(42,'Villa el Salvador',15),(43,'Villa Maria del Triunfo',15);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `idEspecialidad` int NOT NULL AUTO_INCREMENT,
  `nombreEspecialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idEspecialidad`),
  UNIQUE KEY `idEspecialidad_UNIQUE` (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'CORTES CLÁSICOS '),(2,'AFEITADO TIPO DEGRADO'),(3,'FIGURAS EN EN PELO'),(4,'CUIDADO DE LA BARBA'),(5,'Tratamiento de cabello'),(6,'Pintado');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotocliente`
--

DROP TABLE IF EXISTS `fotocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotocliente` (
  `idFotoCliente` int NOT NULL AUTO_INCREMENT,
  `contenidoFotoCliente` blob NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idFotoCliente`),
  UNIQUE KEY `idFotoCliente_UNIQUE` (`idFotoCliente`),
  KEY `fk_FotoCliente_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_FotoCliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotocliente`
--

LOCK TABLES `fotocliente` WRITE;
/*!40000 ALTER TABLE `fotocliente` DISABLE KEYS */;
INSERT INTO `fotocliente` VALUES (1,_binary 'https://robohash.org/voluptateestdolorem.png?size=50x50&set=set1',8),(2,_binary 'https://robohash.org/utpossimusqui.png?size=50x50&set=set1',14),(3,_binary 'https://robohash.org/velitidiste.png?size=50x50&set=set1',9),(4,_binary 'https://robohash.org/etconsecteturquam.png?size=50x50&set=set1',17),(5,_binary 'https://robohash.org/providentutculpa.png?size=50x50&set=set1',1),(6,_binary 'https://robohash.org/namblanditiisimpedit.png?size=50x50&set=set1',20),(7,_binary 'https://robohash.org/itaquecumqueculpa.png?size=50x50&set=set1',2),(8,_binary 'https://robohash.org/idquiinventore.png?size=50x50&set=set1',15),(9,_binary 'https://robohash.org/illumenimtotam.png?size=50x50&set=set1',8),(10,_binary 'https://robohash.org/etodioquia.png?size=50x50&set=set1',12),(11,_binary 'https://robohash.org/delectusnostrumest.png?size=50x50&set=set1',2),(12,_binary 'https://robohash.org/nequeenimcumque.png?size=50x50&set=set1',3),(13,_binary 'https://robohash.org/corrupticonsequaturnihil.png?size=50x50&set=set1',9),(14,_binary 'https://robohash.org/quaesuntnam.png?size=50x50&set=set1',17),(15,_binary 'https://robohash.org/porrositimpedit.png?size=50x50&set=set1',10),(16,_binary 'https://robohash.org/voluptatesedest.png?size=50x50&set=set1',4),(17,_binary 'https://robohash.org/eiussitet.png?size=50x50&set=set1',11),(18,_binary 'https://robohash.org/voluptatemquioccaecati.png?size=50x50&set=set1',1),(19,_binary 'https://robohash.org/iurefugitdolores.png?size=50x50&set=set1',6),(20,_binary 'https://robohash.org/etminusvero.png?size=50x50&set=set1',11);
/*!40000 ALTER TABLE `fotocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotoportafolio`
--

DROP TABLE IF EXISTS `fotoportafolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotoportafolio` (
  `idFotoPortafolio` int NOT NULL AUTO_INCREMENT,
  `contenidoFotoPortafolio` blob NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  PRIMARY KEY (`idFotoPortafolio`),
  UNIQUE KEY `idFotoPortafolio_UNIQUE` (`idFotoPortafolio`),
  KEY `fk_FotoPortafolio_Barbero1_idx` (`Barbero_idBarbero`),
  CONSTRAINT `fk_FotoPortafolio_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotoportafolio`
--

LOCK TABLES `fotoportafolio` WRITE;
/*!40000 ALTER TABLE `fotoportafolio` DISABLE KEYS */;
INSERT INTO `fotoportafolio` VALUES (1,_binary 'https://robohash.org/sedeumdolor.png?size=50x50&set=set1',2),(2,_binary 'https://robohash.org/inciduntsedconsequatur.png?size=50x50&set=set1',7),(3,_binary 'https://robohash.org/nonautunde.png?size=50x50&set=set1',15),(4,_binary 'https://robohash.org/asperioresnisiquia.png?size=50x50&set=set1',5),(5,_binary 'https://robohash.org/mollitiaquiased.png?size=50x50&set=set1',7),(6,_binary 'https://robohash.org/remillumdolorum.png?size=50x50&set=set1',15),(7,_binary 'https://robohash.org/exercitationemsuntrem.png?size=50x50&set=set1',18),(8,_binary 'https://robohash.org/nihilvoluptasmollitia.png?size=50x50&set=set1',15),(9,_binary 'https://robohash.org/doloremqueetanimi.png?size=50x50&set=set1',8),(10,_binary 'https://robohash.org/etundequo.png?size=50x50&set=set1',2),(11,_binary 'https://robohash.org/occaecatidistinctioeos.png?size=50x50&set=set1',13),(12,_binary 'https://robohash.org/estpariatursit.png?size=50x50&set=set1',9),(13,_binary 'https://robohash.org/quisfugaquae.png?size=50x50&set=set1',8),(14,_binary 'https://robohash.org/tenetursedpariatur.png?size=50x50&set=set1',5),(15,_binary 'https://robohash.org/harumeumdolor.png?size=50x50&set=set1',7),(16,_binary 'https://robohash.org/possimussuntmollitia.png?size=50x50&set=set1',8),(17,_binary 'https://robohash.org/magnamaperiammolestias.png?size=50x50&set=set1',9),(18,_binary 'https://robohash.org/estlaudantiumasperiores.png?size=50x50&set=set1',7),(19,_binary 'https://robohash.org/quamullamvelit.png?size=50x50&set=set1',10),(20,_binary 'https://robohash.org/quoistereprehenderit.png?size=50x50&set=set1',6);
/*!40000 ALTER TABLE `fotoportafolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinion`
--

DROP TABLE IF EXISTS `opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opinion` (
  `idOpinion` int NOT NULL AUTO_INCREMENT,
  `nombreOpinion` varchar(45) NOT NULL,
  `descripcionOpinion` varchar(45) NOT NULL,
  `notaOpinion` varchar(45) NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  PRIMARY KEY (`idOpinion`),
  UNIQUE KEY `idOpinion_UNIQUE` (`idOpinion`),
  KEY `fk_Opinion_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Opinion_Barbero1_idx` (`Barbero_idBarbero`),
  CONSTRAINT `fk_Opinion_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`),
  CONSTRAINT `fk_Opinion_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion`
--

LOCK TABLES `opinion` WRITE;
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
INSERT INTO `opinion` VALUES (1,'Veriee','Drainage of Left Brachial Artery, Perc Endo A','10',1,16),(2,'Bruis','Bypass Sup Vena Cava to Pulm Vn Cnfl w Synth ','2',4,18),(3,'Linell','Bypass Jejunum to Jejunum with Autol Sub, Ope','6',18,18),(4,'Silvain','CT Scan of Thorax using L Osm Contrast','2',19,18),(5,'Katheryn','Supplement Left Foot Vein with Synth Sub, Ope','6',7,7);
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `fechaReserva` varchar(45) NOT NULL,
  `estadoReserva` varchar(45) NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Servicio_idServicio` int NOT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `idReserva_UNIQUE` (`idReserva`),
  KEY `fk_Reserva_Barbero1_idx` (`Barbero_idBarbero`),
  KEY `fk_Reserva_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Reserva_Servicio1_idx` (`Servicio_idServicio`),
  CONSTRAINT `fk_Reserva_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`),
  CONSTRAINT `fk_Reserva_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_Reserva_Servicio1` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'08-09-2023','por atender',6,20,5),(2,'26-08-2023','por atender',13,20,4),(3,'09-08-2023','por atender',8,9,1),(4,'07-08-2023','por atender',12,11,3);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `nombreServicio` varchar(45) NOT NULL,
  `descripcionServicio` varchar(45) NOT NULL,
  `precioServicio` decimal(10,0) NOT NULL,
  `estadoServicio` tinyint(1) NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `idServicio_UNIQUE` (`idServicio`),
  KEY `fk_Servicio_Barbero1_idx` (`Barbero_idBarbero`),
  CONSTRAINT `fk_Servicio_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Corte de cabello','Corte de cabello moderno y estilizado',18,1,2),(2,'Afeitado','Afeitado limpio y suave',50,0,19),(3,'Servicio de tinte','Coloración del cabello con variedad de tonos',36,1,14),(4,'Manicura','Cuidado de las uñas y las manos',36,0,5),(5,'Pedicura','Cuidado de las uñas y los pies',49,1,1),(9,'Facial','Cuidado y limpieza de la piel del rostro',40,1,1),(10,'Depilación de cejas','Depilación y tratamiento de cejas',20,0,1),(11,'Permanente masculina','Styling de ondas y rizos',80,1,1),(12,'Fade Style','Degradado con estilo clásico',50,1,1),(13,'Peeling capilar','Tratamiento anti caspa',35,1,1);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idTag` int NOT NULL AUTO_INCREMENT,
  `nombreTag` varchar(45) NOT NULL,
  PRIMARY KEY (`idTag`),
  UNIQUE KEY `idTag_UNIQUE` (`idTag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Cortes'),(2,'Diseños'),(3,'Adultos'),(4,'Niños');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagbarbero`
--

DROP TABLE IF EXISTS `tagbarbero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagbarbero` (
  `Tag_idTag` int NOT NULL,
  `Barbero_idBarbero` int NOT NULL,
  KEY `fk_TagBarbero_Tag1_idx` (`Tag_idTag`),
  KEY `fk_TagBarbero_Barbero1_idx` (`Barbero_idBarbero`),
  CONSTRAINT `fk_TagBarbero_Barbero1` FOREIGN KEY (`Barbero_idBarbero`) REFERENCES `barbero` (`idBarbero`),
  CONSTRAINT `fk_TagBarbero_Tag1` FOREIGN KEY (`Tag_idTag`) REFERENCES `tag` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagbarbero`
--

LOCK TABLES `tagbarbero` WRITE;
/*!40000 ALTER TABLE `tagbarbero` DISABLE KEYS */;
INSERT INTO `tagbarbero` VALUES (3,4),(4,14),(4,10),(3,15),(2,5),(1,20),(1,20),(4,15),(3,17),(1,11),(1,8),(4,7),(4,3),(1,8),(4,6),(2,13),(1,1),(2,20),(3,7),(1,9);
/*!40000 ALTER TABLE `tagbarbero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-05 14:37:43
