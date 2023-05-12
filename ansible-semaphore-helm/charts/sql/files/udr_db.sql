-- MySQL dump 10.16  Distrib 10.1.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: udr_db
-- ------------------------------------------------------
-- Server version	10.1.47-MariaDB-0ubuntu0.18.04.1

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
-- Current Database: `udr_db`
--

/*!40000 DROP DATABASE IF EXISTS `udr_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `udr_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `udr_db`;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` int(11) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Current version of DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sm_policy_data`
--

DROP TABLE IF EXISTS `sm_policy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm_policy_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varueid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_varueid` (`varueid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='SmPolicyData based on 3GPP 29.519 v15.6.0 section 5.4.2.5';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sm_policy_dnn_data`
--

DROP TABLE IF EXISTS `sm_policy_dnn_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm_policy_dnn_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_policy_snssai_data_id` int(11) NOT NULL,
  `dnn` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dnn` (`dnn`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='SmPolicyDnnData based on 3GPP 29.519 v15.6.0 section 5.4.2.15';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sm_policy_snssai_data`
--

DROP TABLE IF EXISTS `sm_policy_snssai_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm_policy_snssai_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_policy_data_id` int(11) NOT NULL,
  `snssai_sst` int(3) NOT NULL,
  `snssai_sd` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_snssai` (`snssai_sst`,`snssai_sd`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='SmPolicySnssaiData based on 3GPP 29.519 v15.6.0 section 5.4.2.14';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-09 11:39:19
-- MySQL dump 10.16  Distrib 10.1.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: udr_db
-- ------------------------------------------------------
-- Server version	10.1.47-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `udr_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `udr_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `udr_db`;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES (1);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sm_policy_data`
--

LOCK TABLES `sm_policy_data` WRITE;
/*!40000 ALTER TABLE `sm_policy_data` DISABLE KEYS */;
INSERT INTO `sm_policy_data` VALUES (1,'imsi-0123456789');
INSERT INTO `sm_policy_data` VALUES (2,'nai-abcde01234');
INSERT INTO `sm_policy_data` VALUES (3,'msisdn-0123456789');
INSERT INTO `sm_policy_data` VALUES (4,'extid-abc012@abcde01234');
/*!40000 ALTER TABLE `sm_policy_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sm_policy_dnn_data`
--

LOCK TABLES `sm_policy_dnn_data` WRITE;
/*!40000 ALTER TABLE `sm_policy_dnn_data` DISABLE KEYS */;
INSERT INTO `sm_policy_dnn_data` VALUES (1,1,'default');
INSERT INTO `sm_policy_dnn_data` VALUES (2,1,'internet');
INSERT INTO `sm_policy_dnn_data` VALUES (3,2,'bt5g');
INSERT INTO `sm_policy_dnn_data` VALUES (4,2,'ims');
INSERT INTO `sm_policy_dnn_data` VALUES (5,3,'Label1.Label2.Label3');
INSERT INTO `sm_policy_dnn_data` VALUES (6,4,'test');
INSERT INTO `sm_policy_dnn_data` VALUES (7,5,'test1');
INSERT INTO `sm_policy_dnn_data` VALUES (8,6,'test2');
INSERT INTO `sm_policy_dnn_data` VALUES (9,7,'test3');
INSERT INTO `sm_policy_dnn_data` VALUES (10,7,'test4');
/*!40000 ALTER TABLE `sm_policy_dnn_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sm_policy_snssai_data`
--

LOCK TABLES `sm_policy_snssai_data` WRITE;
/*!40000 ALTER TABLE `sm_policy_snssai_data` DISABLE KEYS */;
INSERT INTO `sm_policy_snssai_data` VALUES (1,1,255,'19CDE0');
INSERT INTO `sm_policy_snssai_data` VALUES (2,1,0,NULL);
INSERT INTO `sm_policy_snssai_data` VALUES (3,1,1,'37812A');
INSERT INTO `sm_policy_snssai_data` VALUES (4,2,2,'ABCDEF');
INSERT INTO `sm_policy_snssai_data` VALUES (5,2,3,'012345');
INSERT INTO `sm_policy_snssai_data` VALUES (6,3,4,NULL);
INSERT INTO `sm_policy_snssai_data` VALUES (7,4,202,'0AB1CD');
/*!40000 ALTER TABLE `sm_policy_snssai_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-09 11:39:19
# DB access rights
grant delete,insert,select,update on udr_db.* to udr@'%' identified by 'udr';
grant delete,insert,select,update on udr_db.* to provisioning@'%' identified by 'provi';


