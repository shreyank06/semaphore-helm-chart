-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: nssf_db
-- ------------------------------------------------------
-- Server version       5.7.27-0ubuntu0.16.04.1

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
-- Current Database: `nssf_db`
--

/*!40000 DROP DATABASE IF EXISTS `nssf_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `nssf_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `nssf_db`;

--
-- Table structure for table `nsi`
--

DROP TABLE IF EXISTS `nsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsi` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `nsi_id` varchar(256) DEFAULT NULL,
  `nrf_id` varchar(256) DEFAULT NULL,
  `target_amf_set` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Network Slice Instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsi`
--

LOCK TABLES `nsi` WRITE;
/*!40000 ALTER TABLE `nsi` DISABLE KEYS */;
INSERT INTO `nsi` VALUES (1,'nsi_id_1','nrf_id_1','1'),(2,'nsi_id_2','nrf_id_2','2');
/*!40000 ALTER TABLE `nsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snssai`
--

DROP TABLE IF EXISTS `snssai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snssai` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `sst` int(11) NOT NULL,
  `sd` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='S-NSSAIs (Single Network Slice Selection Assistance Information)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snssai`
--

LOCK TABLES `snssai` WRITE;
/*!40000 ALTER TABLE `snssai` DISABLE KEYS */;
INSERT INTO `snssai` VALUES (1,1,'000001'),(2,1,'000002');
/*!40000 ALTER TABLE `snssai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snssai_nsi_mapping`
--

DROP TABLE IF EXISTS `snssai_nsi_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snssai_nsi_mapping` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `row_id_snssai` int(11) NOT NULL,
  `row_id_nsi` int(11) NOT NULL,
  PRIMARY KEY (`row_id`),
  CONSTRAINT `snssai_nsi_mapping_ibfk_1` FOREIGN KEY (`row_id_snssai`) REFERENCES `snssai` (`row_id`),
  CONSTRAINT `snssai_nsi_mapping_ibfk_2` FOREIGN KEY (`row_id_nsi`) REFERENCES `nsi` (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Junction table of many-to-many relationship between S-NSSAI and NSI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snssai_nsi_mapping`
--

LOCK TABLES `snssai_nsi_mapping` WRITE;
/*!40000 ALTER TABLE `snssai_nsi_mapping` DISABLE KEYS */;
INSERT INTO `snssai_nsi_mapping` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `snssai_nsi_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-06 17:06:43

# DB access rights
grant delete,insert,select,update on nssf_db.* to nssf@'%' identified by 'nssfpwd';

grant delete,insert,select,update on nssf_db.* to provisioning@'%' identified by 'provi';

