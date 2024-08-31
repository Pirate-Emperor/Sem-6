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
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EMP_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  `JOINING_DATE` date DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (0,'Dalton','Kilback',996.08,'1997-09-10',NULL),(1,'Peggie','Raynor',500190.78,'2009-05-14',NULL),(2,'Emilio','Fay',0.00,'2007-03-22',NULL),(3,'Rene','Hintz',0.00,'1986-02-22',NULL),(4,'Zelda','Tromp',297279.78,'2007-12-23',NULL),(5,'Jaiden','Hermann',12.66,'1989-08-20',NULL),(6,'Assunta','Paucek',5732.16,'2016-05-10',NULL),(7,'Einar','Hyatt',0.00,'1985-09-05',NULL),(8,'Elisa','Effertz',1256.37,'2010-10-10',NULL),(9,'Blanca','O\'Conner',0.00,'2015-09-28',NULL),(12,'Ismael','Schneider',0.00,'1976-02-08',NULL),(28,'Samara','Glover',80301.10,'2001-10-04',NULL),(31,'Lou','Price',112791.61,'2007-08-10',NULL),(40,'Ryan','Kub',30.34,'1989-03-30',NULL),(41,'Marisa','Emard',91.94,'1999-05-01',NULL),(49,'Florine','Reynolds',3.00,'2012-03-23',NULL),(51,'Christiana','Ernser',208561.10,'1996-01-06',NULL),(56,'Kim','Hayes',32.08,'1972-10-02',NULL),(57,'Luella','Bradtke',91.02,'2013-01-22',NULL),(60,'Fiona','Gutkowski',4100378.98,'1973-12-19',NULL),(63,'Demond','Mayert',12693.70,'2016-01-23',NULL),(68,'Shakira','Wuckert',3.08,'1992-10-10',NULL),(73,'Fernando','Fisher',11979.81,'1993-10-26',NULL),(81,'Jorge','Powlowski',99999999.99,'1981-11-22',NULL),(120,'Delmer','Tremblay',51420.77,'2020-03-13',NULL),(152,'Osborne','Cremin',60144415.04,'2001-01-18',NULL),(272,'Astrid','Reilly',411176.20,'2012-09-03',NULL),(302,'Kennith','D\'Amore',1384.29,'2014-11-22',NULL),(425,'Trey','Emmerich',0.00,'2016-08-06',NULL),(569,'Hildegard','Goldner',0.00,'1986-11-10',NULL),(754,'Leonor','White',0.00,'1979-01-30',NULL),(787,'Kian','Gorczany',682896.00,'2022-05-28',NULL),(823,'Minnie','Hilll',3119.20,'1980-06-10',NULL),(830,'Esteban','Kuhic',24.47,'1992-02-26',NULL),(889,'Reyes','Smitham',2046.90,'1972-08-21',NULL),(891,'Janis','Bednar',99999999.99,'2012-11-11',NULL),(987,'Mireya','Kreiger',0.00,'2018-01-12',NULL),(3828,'Jacinto','Mosciski',13324.64,'2006-10-30',NULL),(6288,'Hillary','O\'Kon',24164568.77,'1978-03-06',NULL),(9925,'Alanis','Murphy',625.25,'1982-02-14',NULL),(16427,'Samanta','Tillman',52.67,'1985-08-05',NULL),(57880,'Laura','Schmidt',2.18,'2008-08-26',NULL),(287508,'Zetta','Schumm',60557563.96,'2001-11-25',NULL),(752068,'Nolan','Schaden',141053.00,'1993-03-20',NULL),(1741200,'Zoey','Donnelly',99999999.99,'2016-02-09',NULL),(5806210,'Hermina','Satterfield',683.51,'1982-03-13',NULL),(29876816,'Anthony','Ritchie',17591.97,'1986-05-30',NULL),(59625769,'Jaren','Dooley',0.00,'2010-01-02',NULL),(65392242,'Arnoldo','Beatty',18320386.20,'1977-11-08',NULL),(2147483647,'Ari','Schamberger',984.90,'2000-10-07',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14  7:27:45
