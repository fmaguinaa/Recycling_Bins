-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: recyclingbins
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basurero`
--

DROP TABLE IF EXISTS `basurero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basurero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basurero`
--

LOCK TABLES `basurero` WRITE;
/*!40000 ALTER TABLE `basurero` DISABLE KEYS */;
INSERT INTO `basurero` VALUES (1,'Lima',-12.0451952,-77.0321625),(2,'Miraflores',-12.1216915,-77.0291925),(3,'San Borja',-12.1074235,-76.9991706),(4,'San Isidro',-12.099013,-77.034666),(5,'San Miguel',-12.0924719,-77.079084),(6,'Surco',-12.1451273,-77.0052109),(7,'SMP',-12.0305039,-77.057327),(8,'Rimac',-12.042229,-77.02926),(9,'VES',-12.2130296,-76.9370171),(10,'VMT',-12.1624436,-76.9435966);
/*!40000 ALTER TABLE `basurero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipalidad`
--

DROP TABLE IF EXISTS `municipalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipalidad`
--

LOCK TABLES `municipalidad` WRITE;
/*!40000 ALTER TABLE `municipalidad` DISABLE KEYS */;
INSERT INTO `municipalidad` VALUES (1,'Lima'),(2,'Miraflores'),(3,'San Borja'),(4,'San Isidro'),(5,'San Miguel'),(6,'Surco'),(7,'SMP'),(8,'Rimac'),(9,'VES'),(10,'VMT');
/*!40000 ALTER TABLE `municipalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Organicos'),(2,'Latas de Metal'),(3,'Papel y Carton'),(4,'Plastico'),(5,'Vidrio'),(6,'Peligrosos');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipobasurero`
--

DROP TABLE IF EXISTS `tipobasurero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipobasurero` (
  `idbasurero` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  KEY `idbasurero` (`idbasurero`),
  KEY `idtipo` (`idtipo`),
  CONSTRAINT `tipobasurero_ibfk_1` FOREIGN KEY (`idbasurero`) REFERENCES `basurero` (`id`),
  CONSTRAINT `tipobasurero_ibfk_2` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipobasurero`
--

LOCK TABLES `tipobasurero` WRITE;
/*!40000 ALTER TABLE `tipobasurero` DISABLE KEYS */;
INSERT INTO `tipobasurero` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,4),(3,5),(3,6),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,6),(6,1),(6,1),(6,2),(6,3),(6,4),(6,6),(7,1),(7,2),(7,3),(7,5),(8,1),(8,2),(8,3),(8,4),(9,2),(9,3),(9,4),(9,5),(10,1),(10,2),(10,5),(10,6);
/*!40000 ALTER TABLE `tipobasurero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion` (
  `idbasurero` int(11) DEFAULT NULL,
  `idmun` int(11) DEFAULT NULL,
  KEY `idbasurero` (`idbasurero`),
  KEY `idmun` (`idmun`),
  CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`idbasurero`) REFERENCES `basurero` (`id`),
  CONSTRAINT `ubicacion_ibfk_2` FOREIGN KEY (`idmun`) REFERENCES `municipalidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(30) DEFAULT NULL,
  `clave` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin'),(2,'uni','uni');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitas` (
  `idbasurero` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fechavisita` date DEFAULT NULL,
  `objreciclado` varchar(30) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  KEY `idbasurero` (`idbasurero`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`idbasurero`) REFERENCES `basurero` (`id`),
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-05 18:15:37
