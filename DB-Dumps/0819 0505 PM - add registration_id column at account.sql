-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: chazatta
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `access_token` varchar(255) NOT NULL,
  `registration_id` varchar(511) NOT NULL,
  `name` varchar(31) NOT NULL,
  `email` varchar(127) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `position` varchar(15) NOT NULL,
  `phone` varchar(31) NOT NULL,
  `phone_private` tinyint(4) NOT NULL,
  `age` int(11) NOT NULL,
  `age_private` tinyint(4) NOT NULL,
  `belong` varchar(63) NOT NULL,
  `belong_private` tinyint(4) NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `score_sponsor_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idea`
--

DROP TABLE IF EXISTS `idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idea` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(511) NOT NULL,
  `area` varchar(127) NOT NULL,
  `platform` varchar(127) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `detail` varchar(8191) NOT NULL,
  `develop_start_date` date NOT NULL,
  `develop_end_date` date NOT NULL,
  `team_max_count` int(11) NOT NULL,
  `team_current_count` int(11) NOT NULL,
  `team_desire` varchar(511) NOT NULL,
  `like_count` int(11) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `idea_owner_fk_idx` (`owner`),
  CONSTRAINT `idea_owner_fk` FOREIGN KEY (`owner`) REFERENCES `account` (`access_token`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-19 17:05:31
