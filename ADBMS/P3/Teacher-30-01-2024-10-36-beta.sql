-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
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
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `t_no` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `joining_date` date NOT NULL,
  `birth_date` date NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`t_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES (0,'accusamus','voluptatem',184162.00,0,'2008-07-13','1993-03-21','Neque sed in officia nisi velit placeat nulla.'),(1,'consequatur','beatae',239637.00,1,'1985-10-10','1972-06-21','Beatae tempore deleniti doloribus qui.'),(2,'ipsam','magnam',194450.00,0,'1998-11-20','1992-06-13','Debitis enim consequatur error.'),(3,'ut','saepe',731563.00,0,'1991-04-19','1991-07-17','Autem et dolores accusantium.'),(5,'totam','ab',661912.00,1,'2013-11-16','1986-03-30','Ut aperiam qui iusto velit unde similique illo imp'),(6,'eligendi','omnis',108521.00,1,'2020-07-20','1994-03-21','Ex porro corrupti sint.'),(7,'cupiditate','eligendi',505168.00,1,'1972-11-23','1988-10-22','Enim vero et dolorem consectetur voluptatem.'),(9,'rerum','eum',48555.00,1,'2010-05-08','1972-12-17','Odit alias nisi qui adipisci numquam veritatis.'),(19,'fugiat','iste',54421.00,1,'1995-07-13','1973-06-25','Labore culpa ex fugiat minus sit non quo.'),(23,'laboriosam','tempore',937334.00,0,'1981-12-17','1976-02-25','Laborum alias dolorem vel aut itaque.'),(27,'minus','eos',719084.00,1,'2019-05-22','1997-07-12','Id officiis sed iure voluptas nemo.'),(29,'et','reiciendis',337097.00,0,'2004-08-13','1975-07-19','Quia voluptate sed quo quo est ducimus.'),(30,'et','ipsa',622206.00,1,'2002-06-29','2020-12-27','Atque delectus eum ducimus.'),(32,'qui','molestiae',490726.00,1,'1986-05-12','2008-06-07','Expedita rem ipsam non dolores quo dolores quia to'),(50,'nisi','quas',41186.00,0,'2004-08-17','1996-11-10','Quia numquam sint sed libero eaque provident volup'),(59,'itaque','sit',396662.00,0,'1992-09-02','1981-07-04','Voluptatum placeat impedit nemo quod impedit nostr'),(62,'adipisci','quaerat',761113.00,0,'1971-01-10','1973-05-03','Minima repellendus officia iusto quia aut qui.'),(67,'corrupti','molestiae',616710.00,1,'2020-08-26','1995-04-09','Corrupti itaque numquam magnam voluptatem enim a.'),(68,'ipsa','suscipit',366308.00,0,'1982-06-10','2007-01-01','Aut quia assumenda veritatis explicabo.'),(69,'aliquid','est',997269.00,0,'1999-11-06','1993-03-24','Explicabo tempora aut esse ipsum voluptates saepe '),(86,'omnis','et',555292.00,1,'1986-09-27','1984-10-09','Et modi enim doloribus sequi.'),(90,'voluptates','est',889502.00,0,'1974-05-09','1996-05-12','Beatae consectetur ut tempora temporibus aspernatu'),(96,'qui','voluptas',416484.00,0,'1979-12-15','1992-11-18','A est sint placeat dolore reprehenderit.'),(97,'tenetur','sit',948047.00,1,'1975-10-22','2023-01-21','Atque atque labore sequi omnis.'),(345,'voluptas','occaecati',296385.00,0,'1978-08-24','2023-10-12','Et unde facilis dolorem natus.'),(376,'omnis','autem',732617.00,1,'1987-11-14','1993-11-04','Quia sequi quia voluptatum omnis id.'),(418,'dolor','occaecati',922840.00,0,'1986-02-27','2014-07-16','Sit voluptatibus et recusandae ut.'),(428,'vel','illum',788114.00,1,'1977-01-23','2011-01-28','Deserunt sed quam omnis harum similique voluptatib'),(449,'voluptatem','corporis',676755.00,0,'2000-11-16','2015-02-09','Quasi maiores qui qui earum.'),(580,'odio','asperiores',786593.00,1,'1998-07-19','2007-09-28','Similique fuga pariatur quibusdam ducimus dolore.'),(604,'molestiae','est',300413.00,1,'2004-12-13','2018-10-08','Adipisci dolorem recusandae architecto.'),(608,'in','nihil',652165.00,0,'1997-04-01','1990-10-31','Commodi quaerat et eaque aspernatur optio dicta ma'),(672,'quidem','quia',532606.00,1,'2018-02-24','1990-10-10','Sunt dicta in vel enim maiores atque sed.'),(714,'sequi','et',202924.00,1,'2022-10-10','1977-06-23','Non quis velit repellendus officia et.'),(757,'est','excepturi',535505.00,1,'2012-02-26','2015-09-08','Quaerat quia quaerat omnis nam voluptas maiores mo'),(770,'tempore','consequatur',632086.00,1,'2012-01-18','2015-10-30','Nihil suscipit recusandae asperiores a ipsam id in'),(827,'omnis','vero',941640.00,1,'1996-06-01','2016-11-04','Alias accusantium magnam repellendus.'),(1580,'inventore','minus',770843.00,1,'1992-09-06','2013-05-25','Molestiae ut consequuntur ratione fugiat quam omni'),(5527,'qui','qui',104527.00,0,'2007-12-26','1979-07-17','Et nemo itaque minima asperiores vel quia quis.'),(9589,'reprehenderit','qui',527426.00,0,'2001-08-12','1981-07-08','Temporibus numquam laborum animi ut vel.'),(9846,'dicta','et',772875.00,0,'2007-08-02','1997-11-19','Quod et dolores aut a et facilis.'),(35624,'fugiat','enim',75546.00,0,'1992-04-06','1974-12-30','Quo asperiores deserunt corporis.'),(35701,'et','nesciunt',699107.00,1,'2002-01-08','1970-06-09','Dolorem omnis voluptate voluptatem quia molestiae '),(45571,'cum','nihil',149521.00,1,'1985-11-02','2021-12-25','Itaque minima repellat odit tempore corrupti nisi '),(47009,'architecto','adipisci',737798.00,1,'1978-08-01','1985-12-23','Est molestiae adipisci et quisquam sed voluptatem.'),(83399,'deleniti','fugit',557102.00,1,'1990-10-16','1974-05-19','Ut magni aut reiciendis dolor facilis aut.'),(99475,'ut','illum',94093.00,0,'1999-04-13','1976-03-18','Dolores temporibus quis reprehenderit veritatis.'),(111209,'quo','necessitatibus',360245.00,1,'1997-09-02','1992-07-04','Accusantium omnis aut voluptate sed aspernatur et.'),(908145,'et','qui',895790.00,0,'1980-04-22','2008-08-03','Occaecati quae sapiente ad placeat earum sed autem'),(32575650,'vero','est',802512.00,0,'1971-07-08','1971-07-05','Aliquid nulla fugiat debitis distinctio quia qui n'),(38507430,'vero','voluptatem',922420.00,0,'2018-06-12','2014-05-24','Necessitatibus earum error esse natus.'),(86430006,'autem','placeat',946728.00,0,'2017-12-06','1979-02-15','Quia ut dolorum dolore quo iste.'),(93986000,'dolorum','suscipit',508689.00,1,'2015-06-06','1997-04-08','Tenetur quidem facere aspernatur perspiciatis nihi'),(96811975,'rerum','ad',626086.00,0,'1975-11-04','2018-03-14','Quis rerum aliquid doloremque quasi molestias.'),(2147483647,'doloremque','provident',229380.00,0,'2019-09-15','2020-09-23','Inventore ea occaecati voluptatem deleniti sequi v');
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 10:36:40
