-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: comp_lab
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `аудитории`
--

DROP TABLE IF EXISTS `аудитории`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `аудитории` (
  `номер_аудитории` int NOT NULL,
  `длина_аудитории` decimal(5,2) DEFAULT NULL,
  `ширина_аудитории` decimal(5,2) DEFAULT NULL,
  `площадь_аудитории` decimal(10,2) GENERATED ALWAYS AS ((`длина_аудитории` * `ширина_аудитории`)) VIRTUAL,
  PRIMARY KEY (`номер_аудитории`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `аудитории`
--

LOCK TABLES `аудитории` WRITE;
/*!40000 ALTER TABLE `аудитории` DISABLE KEYS */;
INSERT INTO `аудитории` (`номер_аудитории`, `длина_аудитории`, `ширина_аудитории`) VALUES (101,10.00,8.00),(102,12.00,10.00),(103,15.00,10.00),(104,8.00,6.00),(105,20.00,12.00),(201,9.00,7.00),(202,11.00,9.00),(203,14.00,10.00),(204,7.00,5.00),(205,18.00,15.00),(301,10.50,8.50),(302,13.00,11.00),(303,16.00,12.00),(304,6.50,5.50),(305,22.00,18.00),(401,8.50,7.00),(402,12.50,9.50),(403,17.00,13.00),(404,9.00,6.00),(405,19.00,14.00),(501,11.00,8.00),(502,10.00,10.00);
/*!40000 ALTER TABLE `аудитории` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `компьютеры`
--

DROP TABLE IF EXISTS `компьютеры`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `компьютеры` (
  `id_модели` int NOT NULL,
  `название_модели` varchar(100) DEFAULT NULL,
  `стоимость_компьютера` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_модели`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `компьютеры`
--

LOCK TABLES `компьютеры` WRITE;
/*!40000 ALTER TABLE `компьютеры` DISABLE KEYS */;
INSERT INTO `компьютеры` VALUES (1,'Dell OptiPlex 3080',45000.00),(2,'HP ProDesk 400 G6',48000.00),(3,'Lenovo ThinkCentre M720',42000.00),(4,'Acer Veriton N4660G',38000.00),(5,'ASUS ExpertCenter D500',52000.00),(6,'Apple iMac 24\"',120000.00),(7,'MSI PRO 24X',65000.00),(8,'Fujitsu Esprimo Q556',47000.00),(9,'Intel NUC 11 Pro',55000.00),(10,'HP EliteDesk 800 G8',78000.00),(11,'Dell Precision 3640',95000.00),(12,'Lenovo ThinkStation P340',110000.00),(13,'Acer Aspire TC-895',35000.00),(14,'ASUS VivoMini UN65',42000.00),(15,'Apple Mac Mini M1',75000.00),(16,'MSI Trident 3',68000.00),(17,'Fujitsu Celsius W550',125000.00),(18,'HP Z2 Mini G5',89000.00),(19,'Dell Alienware Aurora R12',150000.00),(20,'Lenovo Legion T5',92000.00),(21,'Acer Predator Orion 3000',87000.00),(22,'ASUS ROG Strix GA35',135000.00);
/*!40000 ALTER TABLE `компьютеры` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `лаборатории`
--

DROP TABLE IF EXISTS `лаборатории`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `лаборатории` (
  `id_лаборатории` int NOT NULL,
  `id_факультета` int DEFAULT NULL,
  `номер_аудитории` int DEFAULT NULL,
  `количество_компьютеров` int DEFAULT NULL,
  `id_модели` int DEFAULT NULL,
  PRIMARY KEY (`id_лаборатории`),
  KEY `id_факультета` (`id_факультета`),
  KEY `номер_аудитории` (`номер_аудитории`),
  KEY `id_модели` (`id_модели`),
  CONSTRAINT `лаборатории_ibfk_1` FOREIGN KEY (`id_факультета`) REFERENCES `факультеты` (`id_факультета`),
  CONSTRAINT `лаборатории_ibfk_2` FOREIGN KEY (`номер_аудитории`) REFERENCES `аудитории` (`номер_аудитории`),
  CONSTRAINT `лаборатории_ibfk_3` FOREIGN KEY (`id_модели`) REFERENCES `компьютеры` (`id_модели`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `лаборатории`
--

LOCK TABLES `лаборатории` WRITE;
/*!40000 ALTER TABLE `лаборатории` DISABLE KEYS */;
INSERT INTO `лаборатории` VALUES (1,1,101,15,1),(2,1,102,20,2),(3,1,103,25,3),(4,2,201,12,4),(5,2,202,18,5),(6,3,301,10,6),(7,3,302,15,7),(8,4,401,22,8),(9,4,402,16,9),(10,5,501,30,10),(11,5,502,8,11),(12,6,104,14,12),(13,7,105,20,13),(14,8,203,25,14),(15,9,204,12,15),(16,10,205,18,16),(17,11,303,10,17),(18,12,304,15,18),(19,13,305,22,19),(20,14,403,16,20),(21,15,404,30,21),(22,16,405,8,22),(23,17,101,10,1),(24,18,102,15,3),(25,19,201,20,5),(26,20,301,12,7),(27,21,401,18,9),(28,22,501,25,11);
/*!40000 ALTER TABLE `лаборатории` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `факультеты`
--

DROP TABLE IF EXISTS `факультеты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `факультеты` (
  `id_факультета` int NOT NULL,
  `наименование_факультета` varchar(100) DEFAULT NULL,
  `фамилия_директора` varchar(30) DEFAULT NULL,
  `имя_директора` varchar(30) DEFAULT NULL,
  `отчество_директора` varchar(30) DEFAULT NULL,
  `номер_администрации` int DEFAULT NULL,
  PRIMARY KEY (`id_факультета`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `факультеты`
--

LOCK TABLES `факультеты` WRITE;
/*!40000 ALTER TABLE `факультеты` DISABLE KEYS */;
INSERT INTO `факультеты` VALUES (1,'Факультет информатики и вычислительной техники','Иванов','Иван','Иванович',101),(2,'Факультет математики и кибернетики','Петров','Пётр','Петрович',102),(3,'Факультет физики и электроники','Сидоров','Сергей','Сергеевич',103),(4,'Факультет химии и биотехнологий','Кузнецова','Анна','Владимировна',104),(5,'Факультет экономики и управления','Смирнова','Ольга','Леонидовна',105),(6,'Факультет гуманитарных наук','Васильев','Дмитрий','Константинович',106),(7,'Факультет иностранных языков','Морозова','Елена','Сергеевна',107),(8,'Факультет строительства и архитектуры','Николаев','Алексей','Михайлович',108),(9,'Факультет машиностроения','Федоров','Виктор','Геннадьевич',109),(10,'Факультет энергетики','Павлова','Татьяна','Николаевна',110),(11,'Факультет юриспруденции','Лебедев','Михаил','Анатольевич',111),(12,'Факультет медицины','Козлова','Ирина','Павловна',112),(13,'Факультет психологии','Новиков','Роман','Владимирович',113),(14,'Факультет экологии','Зайцева','Лариса','Дмитриевна',114),(15,'Факультет дизайна','Соколов','Артём','Романович',115),(16,'Факультет журналистики','Волкова','Наталья','Степановна',116),(17,'Факультет театрального искусства','Алексеев','Кирилл','Борисович',117),(18,'Факультет музыки','Орлова','Мария','Тимофеевна',118),(19,'Факультет спорта и туризма','Тихонов','Владимир','Евгеньевич',119),(20,'Факультет нанотехнологий','Белова','Светлана','Геннадьевна',120),(21,'Факультет робототехники','Григорьев','Илья','Леонидович',121),(22,'Факультет космических исследований','Дмитриев','Андрей','Кириллович',122);
/*!40000 ALTER TABLE `факультеты` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-28 16:10:47
