-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_17
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-cll-lve

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
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES
(1,'ut','atque'),
(2,'molestiae','nobis'),
(3,'reiciendis','rem'),
(4,'quisquam','cumque'),
(5,'quas','distinctio'),
(6,'omnis','repellendus'),
(7,'voluptate','vero'),
(8,'aliquid','fuga'),
(9,'est','nulla'),
(10,'quis','totam'),
(11,'cumque','nobis'),
(12,'et','impedit'),
(13,'dolorem','eum'),
(14,'dolor','laborum'),
(15,'deleniti','assumenda'),
(16,'doloremque','eos'),
(17,'natus','ut'),
(18,'laborum','et'),
(19,'non','eius'),
(20,'corporis','porro'),
(21,'quaerat','vel'),
(22,'ipsam','quia'),
(23,'cumque','nisi'),
(24,'amet','quae'),
(25,'blanditiis','labore'),
(26,'laudantium','numquam'),
(27,'eaque','tempore'),
(28,'dolor','voluptatem'),
(29,'magni','totam'),
(30,'modi','voluptatem'),
(31,'repellat','asperiores'),
(32,'molestias','autem'),
(33,'minus','ab'),
(34,'placeat','excepturi'),
(35,'mollitia','quia'),
(36,'magni','nihil'),
(37,'laudantium','dicta'),
(38,'aut','consequuntur'),
(39,'voluptatem','nulla'),
(40,'omnis','et'),
(41,'rerum','qui'),
(42,'ut','quod'),
(43,'vel','consequatur'),
(44,'vero','qui'),
(45,'alias','doloribus'),
(46,'aliquid','molestiae'),
(47,'sunt','nobis'),
(48,'a','laboriosam'),
(49,'in','ab'),
(50,'dolor','quas'),
(51,'consequatur','a'),
(52,'consequatur','culpa'),
(53,'et','molestiae'),
(54,'et','dicta'),
(55,'fugiat','vel'),
(56,'nostrum','rem'),
(57,'aperiam','nihil'),
(58,'tempore','modi'),
(59,'deserunt','occaecati'),
(60,'modi','non'),
(61,'id','et'),
(62,'alias','voluptate'),
(63,'provident','non'),
(64,'ipsum','reiciendis'),
(65,'officia','aut'),
(66,'officiis','voluptatem'),
(67,'provident','molestiae'),
(68,'libero','voluptatibus'),
(69,'quisquam','optio'),
(70,'saepe','deleniti'),
(71,'minima','facilis'),
(72,'ut','veniam'),
(73,'nisi','laudantium'),
(74,'sit','quis'),
(75,'officiis','laborum'),
(76,'aut','cum'),
(77,'veniam','enim'),
(78,'aut','neque'),
(79,'sunt','dolor'),
(80,'quo','vero'),
(81,'dolorum','recusandae'),
(82,'ullam','eos'),
(83,'quasi','dolorem'),
(84,'provident','sed'),
(85,'ex','porro'),
(86,'praesentium','aut'),
(87,'accusantium','culpa'),
(88,'molestiae','aliquam'),
(89,'eum','ut'),
(90,'eum','deserunt'),
(91,'optio','ut'),
(92,'enim','aliquid'),
(93,'voluptas','dolor'),
(94,'nobis','ut'),
(95,'aperiam','et'),
(96,'incidunt','et'),
(97,'corporis','qui'),
(98,'molestiae','et'),
(99,'corrupti','ipsa'),
(100,'est','veniam');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-12 10:15:15
