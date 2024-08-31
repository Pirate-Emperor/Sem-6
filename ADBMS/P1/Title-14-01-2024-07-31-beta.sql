-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Title`
--

DROP TABLE IF EXISTS `Title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Title` (
  `EMP_REF_ID` int(11) DEFAULT NULL,
  `EMP_TITLE` varchar(50) DEFAULT NULL,
  `AFFECTED_FROM` date DEFAULT NULL,
  KEY `EMP_REF_ID` (`EMP_REF_ID`),
  CONSTRAINT `Title_ibfk_1` FOREIGN KEY (`EMP_REF_ID`) REFERENCES `Employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Title`
--

LOCK TABLES `Title` WRITE;
/*!40000 ALTER TABLE `Title` DISABLE KEYS */;
INSERT INTO `Title` VALUES (0,'Dietrich, Cronin and Keebler','2008-06-24'),(1,'Hauck LLC','2011-01-17'),(2,'Yost Inc','2005-09-08'),(3,'Fadel Inc','1981-12-19'),(4,'Weber-Huels','1981-07-28'),(5,'Schroeder and Sons','2008-10-05'),(6,'Cremin Ltd','1986-12-23'),(7,'Walter LLC','2022-04-24'),(8,'Hegmann Group','1978-08-10'),(9,'Toy Inc','1986-01-25'),(12,'Borer, Stracke and Schuppe','2001-12-14'),(28,'Schmeler, Lueilwitz and Stroman','1998-04-02'),(31,'Flatley Group','1991-02-01'),(40,'Harvey, Lynch and Upton','2022-08-14'),(41,'Waelchi Ltd','1999-02-02'),(49,'Osinski, Williamson and Renner','2009-07-22'),(51,'Kohler, Waters and Emmerich','1976-06-14'),(56,'Mills PLC','1987-01-08'),(57,'Jast Ltd','1982-07-12'),(60,'Glover, Waelchi and Ferry','1994-05-05'),(63,'Blick and Sons','1997-05-12'),(68,'Turner, Schimmel and Lockman','1973-01-26'),(73,'Toy-Champlin','1991-01-13'),(81,'Heidenreich, Bernhard and Sporer','2004-08-10'),(120,'Bartell, Tromp and Howe','1975-05-15'),(152,'Russel, Ebert and Marks','2002-11-09'),(272,'Hirthe Group','2004-12-01'),(302,'Greenfelder, Carroll and Bergstrom','1998-09-15'),(425,'Senger, Medhurst and Mertz','1992-09-29'),(569,'Quigley-Rutherford','1989-12-13'),(754,'Hansen and Sons','1980-06-28'),(787,'Glover, Rippin and Feeney','1977-08-10'),(823,'Renner, Leffler and Ortiz','1990-05-20'),(830,'Bayer-Dicki','2018-04-16'),(889,'Ebert PLC','2006-07-20'),(891,'Herman LLC','2016-03-29'),(987,'Bergstrom-Hessel','2001-01-11'),(3828,'Pollich-Pacocha','1994-08-20'),(6288,'Sawayn-Cruickshank','1983-03-20'),(9925,'Powlowski Group','2018-12-09'),(16427,'Wyman Ltd','2023-10-05'),(57880,'Maggio LLC','1977-11-20'),(287508,'Bartell-Kutch','1971-02-27'),(752068,'Rosenbaum-Lubowitz','1981-06-15'),(1741200,'Littel LLC','2010-11-16'),(5806210,'Rempel Group','2000-09-25'),(29876816,'Huels, Schiller and Cremin','1991-12-16'),(59625769,'Keeling LLC','2009-02-16'),(65392242,'Kassulke Inc','1982-05-12'),(2147483647,'Emard, Schmitt and Leffler','2005-08-26');
/*!40000 ALTER TABLE `Title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14  7:31:11
