-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: udm_db
-- ------------------------------------------------------
-- Server version	10.3.29-MariaDB-0ubuntu0.20.04.1

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
-- Current Database: `udm_db`
--

/*!40000 DROP DATABASE IF EXISTS `udm_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `udm_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `udm_db`;

--
-- Table structure for table `am_data`
--

DROP TABLE IF EXISTS `am_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_data` (
  `supi` varchar(255) NOT NULL,
  `access_and_mobility_sub_data` longtext NOT NULL,
  PRIMARY KEY (`supi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Access and Mobility Subscription Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` int(11) NOT NULL,
  `compatible` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Current version of DB and the minimum version for compatibility';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpsi`
--

DROP TABLE IF EXISTS `gpsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gpsi_identity` (`identity`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Generic Public Subscription Identifier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpsi_supi_association`
--

DROP TABLE IF EXISTS `gpsi_supi_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpsi_supi_association` (
  `gpsi_id` int(11) NOT NULL,
  `supi_id` int(11) NOT NULL,
  PRIMARY KEY (`gpsi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='GPSI-SUPI association';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_identifier`
--

DROP TABLE IF EXISTS `group_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_group_id` varchar(255) NOT NULL,
  `external_group_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_internal_group_id` (`internal_group_id`),
  UNIQUE KEY `idx_external_group_id` (`external_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Group Identifier';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `home_network_keys`
--

DROP TABLE IF EXISTS `home_network_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_network_keys` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `plmn_id` varchar(6) NOT NULL,
  `pub_key` blob DEFAULT NULL,
  `pvt_key` blob DEFAULT NULL,
  PRIMARY KEY (`plmn_id`, `key_id`),
  KEY `idx_row_id` (`row_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnn_configurations`
--

DROP TABLE IF EXISTS `dnn_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnn_configurations` (
  `supi` varchar(255),
  `plmnid` varchar(8), -- of the form mccmnc
  `sst` int(8),
  `dnn` varchar(255) NOT NULL,
  `json` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='DNN Configurations for SUPI, PLMNID and Slice/Service Type combinations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supi`
--

DROP TABLE IF EXISTS `supi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(255) NOT NULL,
  `k` tinyblob DEFAULT NULL,
  `amf` tinyblob DEFAULT NULL,
  `op` tinyblob DEFAULT NULL,
  `sqn` varchar(64) NOT NULL DEFAULT '000000000000',
  `auth_type` int(11) NOT NULL,
  `op_is_opc` tinyint(1) NOT NULL DEFAULT 0,
  `usim_type` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_supi_identity` (`identity`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Subscriber Permanent Identifier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-23 11:18:33
-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: udm_db
-- ------------------------------------------------------
-- Server version	10.3.29-MariaDB-0ubuntu0.20.04.1

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
-- Current Database: `udm_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `udm_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `udm_db`;

--
-- Dumping data for table `am_data`
--

LOCK TABLES `am_data` WRITE;
/*!40000 ALTER TABLE `am_data` DISABLE KEYS */;
INSERT INTO `am_data` VALUES ('0','{\"subscribedUeAmbr\": {\"uplink\": \"1.25 Gbps\", \"downlink\": \"1.75 Gbps\"}, \"nssai\": {\"supportedFeatures\": \"Supported Features here\", \"defaultSingleNssais\": [{\"sst\": 1}, {\"sst\": 1, \"sd\": \"000001\"}, {\"sst\": 1, \"sd\": \"d143a5\"}]}}');
INSERT INTO `am_data` VALUES ('001011234567894','{"subscribedUeAmbr": {"uplink": "1.25 Gbps", "downlink": "1.75 Gbps"}, "nssai": {"supportedFeatures": "Supported Features here", "defaultSingleNssais": [{"sst": 1, "sd": "000002"}]}}');
/*!40000 ALTER TABLE `am_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES (9,4);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gpsi`
--

LOCK TABLES `gpsi` WRITE;
/*!40000 ALTER TABLE `gpsi` DISABLE KEYS */;
INSERT INTO `gpsi` VALUES (1,'msisdn-991011234567890');
INSERT INTO `gpsi` VALUES (2,'msisdn-991011234567891');
INSERT INTO `gpsi` VALUES (3,'msisdn-991011234567892');
INSERT INTO `gpsi` VALUES (4,'msisdn-991011234567893');
INSERT INTO `gpsi` VALUES (5,'msisdn-991011234567894');
INSERT INTO `gpsi` VALUES (6,'msisdn-991011234567899');
/*!40000 ALTER TABLE `gpsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gpsi_supi_association`
--

LOCK TABLES `gpsi_supi_association` WRITE;
/*!40000 ALTER TABLE `gpsi_supi_association` DISABLE KEYS */;
INSERT INTO `gpsi_supi_association` VALUES (1,1);
INSERT INTO `gpsi_supi_association` VALUES (2,2);
INSERT INTO `gpsi_supi_association` VALUES (3,3);
INSERT INTO `gpsi_supi_association` VALUES (4,4);
INSERT INTO `gpsi_supi_association` VALUES (5,5);
INSERT INTO `gpsi_supi_association` VALUES (6,6);
/*!40000 ALTER TABLE `gpsi_supi_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `group_identifier`
--

LOCK TABLES `group_identifier` WRITE;
/*!40000 ALTER TABLE `group_identifier` DISABLE KEYS */;
INSERT INTO `group_identifier` VALUES (1,'TestGroup1','TestGroup1@domain.com');
/*!40000 ALTER TABLE `group_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `home_network_keys`
--

LOCK TABLES `home_network_keys` WRITE;
/*!40000 ALTER TABLE `home_network_keys` DISABLE KEYS */;
INSERT INTO `home_network_keys` VALUES (1,1,'00101','458CA63A4FC6B49D32CE3B30563D08E1CC0BF89ACED46BD297C668C71530FA1A','705DDC4F6266353AFD121EF7783AFEF5875CE31AEF418703D8EC0B07A8926656');
INSERT INTO `home_network_keys` VALUES (2,2,'00101','029AA5F56E4C8CCFBF4DEFD51ED15F28B3A7A4C0131EB09CC0F93FD7927716882D','6005745E780F70826082A45243821B7EA3A01EA7E05F09BFC61AA8DD4C5378C7');
/*!40000 ALTER TABLE `home_network_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dnn_configurations`
--

LOCK TABLES `dnn_configurations` WRITE;
/*!40000 ALTER TABLE `dnn_configurations` DISABLE KEYS */;
INSERT INTO `dnn_configurations` VALUES ('default_data',NULL,'1','default','{ "pduSessionTypes": { "defaultSessionType": "IPV4" }, "sscModes": { "defaultSscMode": "SSC_MODE_1" }, "iwkEpsInd": false, "5gQosProfile": { "5qi": 9, "arp": {  "priorityLevel": 2,  "preemptCap": "NOT_PREEMPT",  "preemptVuln": "NOT_PREEMPTABLE" } }, "sessionAmbr": { "uplink": "1.25 Gbps", "downlink": "1.75 Gbps" }  }');
INSERT INTO `dnn_configurations` VALUES ('default_data',NULL,'1','ims','{ "pduSessionTypes": { "defaultSessionType": "IPV4" }, "sscModes": { "defaultSscMode": "SSC_MODE_1" }, "iwkEpsInd": false, "5gQosProfile": { "5qi": 5, "arp": {  "priorityLevel": 2,  "preemptCap": "NOT_PREEMPT",  "preemptVuln": "NOT_PREEMPTABLE" } }, "sessionAmbr": { "uplink": "1.25 Mbps", "downlink": "1.75 Mbps" }  }');
INSERT INTO `dnn_configurations` VALUES ('default_data',NULL,'1','internet','{ "pduSessionTypes": { "defaultSessionType": "IPV4" }, "sscModes": { "defaultSscMode": "SSC_MODE_1" }, "iwkEpsInd": false, "5gQosProfile": { "5qi": 9, "arp": {  "priorityLevel": 2,  "preemptCap": "NOT_PREEMPT",  "preemptVuln": "NOT_PREEMPTABLE" } }, "sessionAmbr": { "uplink": "1.25 Gbps", "downlink": "1.75 Gbps" }  }');
INSERT INTO `dnn_configurations` VALUES ('default_data',NULL,'1','bt5g','{ "pduSessionTypes": { "defaultSessionType": "IPV4" }, "sscModes": { "defaultSscMode": "SSC_MODE_1" }, "iwkEpsInd": false, "5gQosProfile": { "5qi": 9, "arp": {  "priorityLevel": 2,  "preemptCap": "NOT_PREEMPT",  "preemptVuln": "NOT_PREEMPTABLE" } }, "sessionAmbr": { "uplink": "1.25 Gbps", "downlink": "1.75 Gbps" }  }');
/*!40000 ALTER TABLE `dnn_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supi`
--

LOCK TABLES `supi` WRITE;
/*!40000 ALTER TABLE `supi` DISABLE KEYS */;
/* HELP: id, identity, k, amf, op, sqn, auth_type(0- 5gaka, 1- eapaka), op_is_opc(1 if op is opc), usim_type(0- milenage, 1- XOR) */
INSERT INTO `supi` VALUES (1,'001011234567891',0x00000000000000000000000000000000,0x8000,0x00000000000000000000000000000000,'000000000017',0,0,0); /* UE1 5G-AKA */
INSERT INTO `supi` VALUES (2,'001011234567892',0x00000000000000000000000000000000,0x8000,0x00000000000000000000000000000000,'000000000017',1,0,0); /* UE2 EAP-AKA */
INSERT INTO `supi` VALUES (3,'001011234567893',0x00000000000000000000000000000000,0x8000,0x00000000000000000000000000000000,'000000000017',0,0,0); /* UE3 N3IWF */
INSERT INTO `supi` VALUES (4,'001011234567894',0x00000000000000000000000000000000,0x8000,0x00000000000000000000000000000000,'000000000017',0,0,0); /* UE4 NSSF */
INSERT INTO `supi` VALUES (5,'001011234567895',0x00000000000000000000000000000000,0x8000,0x66E94BD4EF8A2C3B884CFA59CA342B2E,'000000000017',1,1,0);
INSERT INTO `supi` VALUES (6,'001011234567896',0x00000000000000000000000000000000,0x8000,0x66E94BD4EF8A2C3B884CFA59CA342B2E,'000000000017',0,1,0);
INSERT INTO `supi` VALUES (7,'001010123456789',0x00112233445566778899AABBCCDDEEFF,0x8000,0x00000000000000000000000000000000,'000000000000',0,0,1); /* Anritsu Test USIM (XOR)*/
/*!40000 ALTER TABLE `supi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-23 11:18:33
# DB access rights
grant delete,insert,select,update on udm_db.* to udm@'%' identified by 'udm';
grant delete,insert,select,update on udm_db.* to provisioning@'%' identified by 'provi';


