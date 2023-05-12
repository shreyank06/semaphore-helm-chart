-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: smf_db
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Current Database: `smf_db`
--

/*!40000 DROP DATABASE IF EXISTS `smf_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smf_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smf_db`;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` int(11) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Current version of the SMF-DB';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `dnn`
--

DROP TABLE IF EXISTS `dnn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnn` (
  `dn_id` int(11) NOT NULL AUTO_INCREMENT,
  `dnn` varchar(255) NOT NULL,
  PRIMARY KEY (`dn_id`),
  UNIQUE KEY (`dnn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `dn_dns`
--

DROP TABLE IF EXISTS `dn_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dn_dns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dn_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `addr` varchar(255) NOT NULL,
  `ai_family` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `idx_id_apn` (`dn_id`),
  KEY `idx_name` (`name`),
  KEY `idx_addr` (`addr`),
  KEY `idx_ai_family` (`ai_family`),
  KEY `idx_priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dn_info`
--

DROP TABLE IF EXISTS `dn_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dn_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnn` varchar(255) NOT NULL,
  `network` varchar(255) NOT NULL,
  `prefix` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dn_ipv4_allocations`
--

DROP TABLE IF EXISTS `dn_ipv4_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dn_ipv4_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dn_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `si_type` int(11) NOT NULL DEFAULT '1',
  `si` varchar(255) NOT NULL,
  `static` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`dn_id`,`ip`),
  UNIQUE KEY `si` (`dn_id`,`si_type`,`si`),
  KEY `idx_ip` (`ip`),
  KEY `idx_si_type` (`si_type`),
  KEY `idx_si` (`si`),
  KEY `idx_dn_id` (`dn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=latin1 COMMENT='IPv4 Allocated addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dn_ipv6_allocations`
--

DROP TABLE IF EXISTS `dn_ipv6_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dn_ipv6_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dn_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `prefix` int(11) NOT NULL DEFAULT '64',
  `si_type` int(11) NOT NULL DEFAULT '1',
  `si` varchar(255) NOT NULL,
  `static` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`dn_id`,`ip`),
  UNIQUE KEY `si` (`dn_id`,`si_type`,`si`),
  KEY `idx_ip` (`ip`),
  KEY `idx_dn_id` (`dn_id`),
  KEY `idx_static` (`static`),
  KEY `idx_si_type` (`si_type`),
  KEY `idx_si` (`si`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='IPv6 Allocated Addresses';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 16:26:21
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: smf_db
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Current Database: `smf_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smf_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smf_db`;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES (2);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `dn_info`
--

LOCK TABLES `dnn` WRITE;
/*!40000 ALTER TABLE `dnn` DISABLE KEYS */;
INSERT INTO `dnn` VALUES (1,'default');
INSERT INTO `dnn` VALUES (2,'internet');
INSERT INTO `dnn` VALUES (3,'bt5g');
INSERT INTO `dnn` VALUES (4,'ims');
INSERT INTO `dnn` VALUES (5,'ethnet');
/*!40000 ALTER TABLE `dnn` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `dn_dns`
--

LOCK TABLES `dn_dns` WRITE;
/*!40000 ALTER TABLE `dn_dns` DISABLE KEYS */;
INSERT INTO `dn_dns` VALUES (1,1,'google','8.8.8.8',2,10);
INSERT INTO `dn_dns` VALUES (2,2,'google','8.8.8.8',2,10);
INSERT INTO `dn_dns` VALUES (3,3,'google','8.8.8.8',2,10);
INSERT INTO `dn_dns` VALUES (4,4,'google','8.8.8.8',2,10);
/*!40000 ALTER TABLE `dn_dns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dn_info`
--

LOCK TABLES `dn_info` WRITE;
/*!40000 ALTER TABLE `dn_info` DISABLE KEYS */;
INSERT INTO `dn_info` VALUES (1,'default','192.168.6.0',24);
INSERT INTO `dn_info` VALUES (2,'internet','192.168.5.0',24);
INSERT INTO `dn_info` VALUES (3,'bt5g','10.168.0.0',16);
INSERT INTO `dn_info` VALUES (4,'ims','192.168.3.0',24);
/*!40000 ALTER TABLE `dn_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dn_ipv4_allocations`
--

LOCK TABLES `dn_ipv4_allocations` WRITE;
/*!40000 ALTER TABLE `dn_ipv4_allocations` DISABLE KEYS */;
INSERT INTO `dn_ipv4_allocations` VALUES (1,1,'192.168.6.254',6,'00:00:00:00:00:01',1); /*upf itself */
INSERT INTO `dn_ipv4_allocations` VALUES (2,4,'192.168.3.254',6,'00:00:00:00:00:03',1); /*upf itself */
INSERT INTO `dn_ipv4_allocations` VALUES (3,4,'192.168.3.253',6,'00:00:00:00:00:02',1); /*ims server */
INSERT INTO `dn_ipv4_allocations` VALUES (4,1,'192.168.6.94',1,'001011234567894',1); /*random ue with fixed IP*/
/*!40000 ALTER TABLE `dn_ipv4_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dn_ipv6_allocations`
--

LOCK TABLES `dn_ipv6_allocations` WRITE;
/*!40000 ALTER TABLE `dn_ipv6_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dn_ipv6_allocations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 16:26:21
# DB access rights
grant delete,insert,select,update on smf_db.* to smf@'%' identified by 'smf';
grant delete,insert,select,update on smf_db.* to provisioning@'%' identified by 'provi';


