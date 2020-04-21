-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: assignment
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `email_addr` varchar(30) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`email_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('jkr@gmail.com','jk','rolling'),('markt@gmail.com','Mark','Twain'),('mayal@gmail.com','maya','aungelou'),('ohenry@gmail.com','o','henry'),('stephenk@gmail.com','stephen','king');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `Paperid` varchar(6) NOT NULL,
  `title` char(20) DEFAULT NULL,
  `FileName` char(20) DEFAULT NULL,
  PRIMARY KEY (`Paperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES ('p01','the TNT Punch','f1'),('p02','trampoline','f2'),('p03','This life','f3'),('p04','Time','f4'),('p05','Beach House','f5');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` varchar(4) NOT NULL,
  `MeritScore` int DEFAULT NULL,
  `Paperid` varchar(6) NOT NULL,
  `ReadabilityScore` int DEFAULT NULL,
  `OriginalScore` int DEFAULT NULL,
  `RelevanceScore` int DEFAULT NULL,
  `rid` varchar(5) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `Paperid` (`Paperid`),
  KEY `rid` (`rid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Paperid`) REFERENCES `paper` (`Paperid`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `rvr` (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('v01',97,'p01',98,94,96,'r01'),('v02',87,'p02',91,86,73,'r02'),('v03',78,'p03',82,84,83,'r03'),('v04',88,'p04',86,79,81,'r04'),('v05',69,'p05',71,65,80,'r05');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rvr`
--

DROP TABLE IF EXISTS `rvr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rvr` (
  `Rid` varchar(5) NOT NULL,
  `Fname` char(10) DEFAULT NULL,
  `Lname` char(10) DEFAULT NULL,
  `AuthorFeedback` char(10) DEFAULT NULL,
  `CommiteeFeedback` char(10) DEFAULT NULL,
  `PhoeNum` int DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rvr`
--

LOCK TABLES `rvr` WRITE;
/*!40000 ALTER TABLE `rvr` DISABLE KEYS */;
INSERT INTO `rvr` VALUES ('r01','rick','ross','Excellent','excellent',100),('r02','mike','perry','Excellent','good',200),('r03','Rivv','rs','good','good',300),('r04','mia','wallace','good','good',400),('r05','dean','lewis','good','bad',500);
/*!40000 ALTER TABLE `rvr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `Tid` varchar(4) NOT NULL,
  `topicname` char(10) DEFAULT NULL,
  PRIMARY KEY (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES ('T01','Ethics'),('T02','Events'),('T03','Art'),('T04','Abstract');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-21 12:04:29
