-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Medical_Imaging
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL DEFAULT 'USA',
  `Postal_Code` varchar(10) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2 Street','Baltimore','Maryland','USA','21201'),(2,'2 Street','Jersey','New Jersey','USA','07302'),(3,'23 Street','New York City','New York','USA','10001'),(4,'Pike Street','Seattle','Washington','USA','05432');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_part`
--

DROP TABLE IF EXISTS `body_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_part` (
  `Body_PartID` int(11) NOT NULL AUTO_INCREMENT,
  `Body_Part_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Body_PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_part`
--

LOCK TABLES `body_part` WRITE;
/*!40000 ALTER TABLE `body_part` DISABLE KEYS */;
INSERT INTO `body_part` VALUES (4,'Heart'),(101,'Brain'),(102,'Knee'),(103,'Shoulder');
/*!40000 ALTER TABLE `body_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_part_disease`
--

DROP TABLE IF EXISTS `body_part_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_part_disease` (
  `Body_Part_DiseaseID` int(11) NOT NULL,
  `Body_PartID` int(11) NOT NULL,
  `DiseaseID` int(11) NOT NULL,
  KEY `Body_PartID` (`Body_PartID`),
  KEY `DiseaseID` (`DiseaseID`),
  CONSTRAINT `body_part_disease_ibfk_1` FOREIGN KEY (`Body_PartID`) REFERENCES `body_part` (`Body_PartID`),
  CONSTRAINT `body_part_disease_ibfk_2` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`DiseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_part_disease`
--

LOCK TABLES `body_part_disease` WRITE;
/*!40000 ALTER TABLE `body_part_disease` DISABLE KEYS */;
INSERT INTO `body_part_disease` VALUES (1,101,1),(2,101,2),(3,101,3),(4,101,4),(5,101,5),(6,101,6),(7,101,7),(8,101,8),(9,101,9),(10,101,10),(11,101,11),(12,101,12),(13,101,13),(14,101,14),(15,101,15),(16,102,15),(17,103,15),(18,101,16),(19,101,17),(20,102,18),(21,103,18),(22,102,19),(23,103,19),(24,101,20),(25,102,20),(26,103,20),(27,101,23),(28,102,23),(29,103,23),(30,101,24),(31,102,24),(32,103,24),(33,101,25),(34,101,26),(35,101,28),(36,102,29),(37,103,29);
/*!40000 ALTER TABLE `body_part_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_part_technique`
--

DROP TABLE IF EXISTS `body_part_technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_part_technique` (
  `Body_Part_TechniqueID` int(11) NOT NULL,
  `Body_PartID` int(11) NOT NULL,
  `Imaging_TechniqueID` int(11) NOT NULL,
  KEY `Body_PartID` (`Body_PartID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `body_part_technique_ibfk_1` FOREIGN KEY (`Body_PartID`) REFERENCES `body_part` (`Body_PartID`),
  CONSTRAINT `body_part_technique_ibfk_2` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_part_technique`
--

LOCK TABLES `body_part_technique` WRITE;
/*!40000 ALTER TABLE `body_part_technique` DISABLE KEYS */;
INSERT INTO `body_part_technique` VALUES (1,101,1),(2,101,2),(3,101,7),(4,102,1),(5,102,2),(6,102,7),(7,103,1),(8,103,2),(9,103,7);
/*!40000 ALTER TABLE `body_part_technique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ct_scan_image`
--

DROP TABLE IF EXISTS `ct_scan_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ct_scan_image` (
  `CT_Scan_Image` int(11) NOT NULL AUTO_INCREMENT,
  `Image` blob NOT NULL,
  `Imaging_TechniqueID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CT_Scan_Image`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `ct_scan_image_ibfk_1` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ct_scan_image`
--

LOCK TABLES `ct_scan_image` WRITE;
/*!40000 ALTER TABLE `ct_scan_image` DISABLE KEYS */;
INSERT INTO `ct_scan_image` VALUES (1,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_1.jpg',7),(2,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_2.jpg',7),(3,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_3.jpg',7),(4,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_4.jpg',7),(5,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_5.jpg',7),(6,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_6.jpg',7),(7,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_7.jpg',7),(8,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_8.jpg',7),(9,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_9.jpg',7),(10,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_10.jpg',7),(11,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_11.jpg',7),(12,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_12.jpg',7),(13,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_13.jpg',7),(14,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_14.jpg',7),(15,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_15.jpg',7),(16,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_16.jpg',7),(17,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_17.jpg',7),(18,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_18.jpg',7),(19,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_19.jpg',7),(20,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_20.jpg',7),(21,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_21.jpg',7),(22,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_22.jpg',7),(23,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_23.jpg',7),(24,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_24.jpg',7),(25,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_25.jpg',7),(26,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_26.jpg',7),(27,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_27.jpg',7),(28,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_28.jpg',7),(29,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_29.jpg',7),(30,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_30.jpg',7),(31,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_31.jpg',7),(32,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_32.jpg',7),(33,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_33.jpg',7),(34,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_34.jpg',7),(35,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_35.jpg',7),(36,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_36.jpg',7),(37,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_37.jpg',7),(38,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_38.jpg',7),(39,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_39.jpg',7),(40,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_40.jpg',7),(41,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_41.jpg',7),(42,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_42.jpg',7),(43,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_43.jpg',7),(44,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_44.jpg',7),(45,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_44.jpg',7),(46,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_46.jpg',7),(47,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_47.jpg',7),(48,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_48.jpg',7),(49,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_49.jpg',7),(50,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_50.jpg',7),(51,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_51.jpg',7),(52,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_52.jpg',7),(53,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_53.jpg',7),(54,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_54.jpg',7),(55,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_55.jpg',7),(56,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_56.jpg',7),(57,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_57.jpg',7),(58,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_58.jpg',7),(59,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_59.jpg',7),(60,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_60.jpg',7),(61,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_61.jpg',7),(62,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_62.jpg',7),(63,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_63.jpg',7),(64,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_64.jpg',7),(65,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_65.jpg',7),(66,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_66.jpg',7),(67,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_67.jpg',7),(68,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_68.jpg',7),(69,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_69.jpg',7),(70,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_70.jpg',7),(71,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_71.jpg',7),(72,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_72.jpg',7),(73,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_73.jpg',7),(74,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_74.jpg',7),(75,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_75.jpg',7),(76,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_76.jpg',7),(77,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_77.jpg',7),(78,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_78.jpg',7),(79,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_79.jpg',7),(80,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_80.jpg',7),(81,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_81.jpg',7),(82,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_82.jpg',7),(83,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_83.jpg',7),(84,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_84.jpg',7),(85,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_85.jpg',7),(86,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_86.jpg',7),(87,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_87.jpg',7),(88,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_88.jpg',7),(89,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_89.jpg',7),(90,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_90.jpg',7),(91,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_91.jpg',7),(92,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_92.jpg',7),(93,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_93.jpg',7),(94,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_94.jpg',7),(95,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_95.jpg',7),(96,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_96.jpg',7),(97,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_97.jpg',7),(98,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_98.jpg',7),(99,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_99.jpg',7),(100,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_100.jpg',7),(101,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_101.jpg',7),(102,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_102.jpg',7),(103,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_103.jpg',7),(104,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_104.jpg',7),(105,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_105.jpg',7),(106,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_106.jpg',7),(107,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_107.jpg',7),(108,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_108.jpg',7),(109,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_109.jpg',7),(110,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_110.jpg',7),(111,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_111.jpg',7),(112,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_112.jpg',7),(113,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_113.jpg',7),(114,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_114.jpg',7),(115,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_115.jpg',7),(116,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_116.jpg',7),(117,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_117.jpg',7),(118,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_118.jpg',7),(119,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_119.jpg',7),(120,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_120.jpg',7),(121,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_121.jpg',7),(122,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_122.jpg',7),(123,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_123.jpg',7),(124,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_124.jpg',7),(125,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_125.jpg',7),(126,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_126.jpg',7),(127,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_127.jpg',7),(128,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_128.jpg',7),(129,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_129.jpg',7),(130,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_130.jpg',7),(131,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_131.jpg',7),(132,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_132.jpg',7),(133,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_133.jpg',7),(134,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_134.jpg',7),(135,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_135.jpg',7),(136,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_136.jpg',7),(137,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_137.jpg',7),(138,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_138.jpg',7),(139,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_139.jpg',7),(140,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_140.jpg',7),(141,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_141.jpg',7),(142,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_142.jpg',7),(143,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_143.jpg',7),(144,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_144.jpg',7),(145,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_145.jpg',7),(146,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_146.jpg',7),(147,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_147.jpg',7),(148,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_148.jpg',7),(149,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_149.jpg',7),(150,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_150.jpg',7),(151,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_151.jpg',7),(152,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_152.jpg',7),(153,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_153.jpg',7),(154,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_154.jpg',7),(155,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_155.jpg',7),(156,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_156.jpg',7),(157,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_157.jpg',7),(158,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_158.jpg',7),(159,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_159.jpg',7),(160,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_160.jpg',7),(161,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_161.jpg',7),(162,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_162.jpg',7),(163,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_163.jpg',7),(164,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_164.jpg',7),(165,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_165.jpg',7),(166,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_166.jpg',7),(167,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_167.jpg',7),(168,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_168.jpg',7),(169,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_169.jpg',7),(170,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_170.jpg',7),(171,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_171.jpg',7),(172,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_172.jpg',7),(173,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_173.jpg',7),(174,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_174.jpg',7),(175,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//CT//CT_175.jpg',7);
/*!40000 ALTER TABLE `ct_scan_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Description`
--

DROP TABLE IF EXISTS `Description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Description` (
  `DescriptionID` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL DEFAULT 'No Description',
  `Body_Part` varchar(50) NOT NULL,
  `Technique_Name` varchar(50) NOT NULL,
  `Body_PartID` int(11) NOT NULL,
  `Imaging_TechniqueID` int(11) NOT NULL,
  KEY `Body_PartID` (`Body_PartID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `description_ibfk_1` FOREIGN KEY (`Body_PartID`) REFERENCES `body_part` (`Body_PartID`),
  CONSTRAINT `description_ibfk_2` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Description`
--

LOCK TABLES `Description` WRITE;
/*!40000 ALTER TABLE `Description` DISABLE KEYS */;
INSERT INTO `Description` VALUES (1,'Magnetic resonance imaging (MRI) of the head is a painless, \nnoninvasive test that produces detailed images of your brain and brain stem. \nAn MRI machine creates the images using a magnetic field and radio waves. \nThis test is also known as a brain MRI or a cranial MRI. \nYou will go to a hospital or radiology center to take a head MRI.','Brain','MRI',101,2),(2,'Magnetic resonance imaging (MRI) of the knee uses a powerful magnetic field, \nradio waves and a computer to produce detailed pictures of the structures within the knee joint. \nIt is typically used to help diagnose or evaluate pain, weakness, swelling or bleeding in and around the joint. \nKnee MRI does not use ionizing radiation, and it can help determine whether you require surgery.',' Knee','MRI',102,2),(3,'Magnetic resonance imaging (MRI) of the shoulder uses a powerful magnetic field, \nradio waves and a computer to produce detailed pictures of the bones, tendons, \nmuscles and blood vessels within the shoulder joint. It is primarily used to assess injuries.','Shoulder','MRI',103,2),(4,'A CT of the brain is a noninvasive diagnostic imaging procedure that uses\n special X-rays measurements to produce horizontal, or axial, images (often called slices) of the brain. \n Brain CT scans can provide more detailed information about brain tissue and brain structures than standard X-rays of the head,\n thus providing more data related to injuries and/or diseases of the brain.','Brain','CT',101,7),(5,'A computed tomography (CT) scan is a type of X-ray that shows cross-sectional images of a specific area on your body. \nFor example, a CT scan of your knee would help doctors diagnose disease or inspect injuries on your knee. \nA CT scanner circles the body and sends images to a computer. The computer uses these images to make detailed pictures. \nThis allows doctors and trained technicians to see the muscles, tendons, ligaments, vessels, and bones that make up your knee.','Knee','CT',102,7),(6,'A shoulder computed tomography scan or (CT or CAT scan) creates cross-sectional images of the shoulder using specialized X-ray cameras. \nThis scan can help doctors see the bones and soft tissues in the shoulder in order to detect abnormalities. \nThe CT scan may also help identify tumors and blood clots. A CT scan can be performed with or without contrast dye. \nThe contrast material helps your doctor analyze important vessels and structures. \nIt also allows them to identify abnormalities that cannot be seen without the dye.','Shoulder','CT',103,7),(7,'A skull X-ray is an imaging test doctors use to examine the bones of the skull, \nincluding the facial bones, the nose, and the sinuses.avg an easy, quick, \nand effective method that has been used for decades to help doctors view the area that houses your most vital organ â€” your brain.','Brain','Xray',101,1),(8,'A standard X-ray is a simple test in which an X-ray beam \n(a form of electromagnetic radiation) is passed through the knee to create a two-dimensional picture of the bones that form the joint. \nYour doctor can use X-rays to view bone spurs. \nBony overgrowths at the joint are a sign of osteoarthritis.','Knee','Xray',102,1),(9,'A standard X-ray is a simple test in which an X-ray beam (a form of electromagnetic radiation) \nis passed through the shoulder to create a two-dimensional picture of the bones that form the joint. \nYour doctor can use X-rays to view: joint space.','Shoulder','Xray',103,1);
/*!40000 ALTER TABLE `Description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `DiseaseID` int(11) NOT NULL AUTO_INCREMENT,
  `Disease_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`DiseaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'HIV infection'),(2,'Stroke'),(3,'Coma'),(4,'Alzheimers disease'),(5,'Brain tumor'),(6,'Multiple sclerosis'),(7,'Aneurysms'),(8,'Venous malformations'),(9,'Hemorrhage'),(10,'Subdural hematoma'),(11,'Degenerative diseases'),(12,'Hypoxic encephalopathy'),(13,'Encephalomyelitis'),(14,'Hydrocephalus'),(15,'Bone injuries'),(16,'Traumatic brain injury'),(17,'Dementia'),(18,'Bone tumor'),(19,'Bone fractures'),(20,'Cancer'),(21,'Liver masses'),(22,'Emphysema'),(23,'Internal injuries'),(24,'Infection'),(25,'Cystic fibrosis'),(26,'Headache'),(27,'Abdominal Aortic Aneurysm'),(28,'Epilepsy'),(29,'Arthritis'),(30,'Osteoporosis'),(31,'Ligament damage');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `disease_ctscan`
--

DROP TABLE IF EXISTS `disease_ctscan`;
/*!50001 DROP VIEW IF EXISTS `disease_ctscan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_ctscan` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `disease_detection`
--

DROP TABLE IF EXISTS `disease_detection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_detection` (
  `Disease_DetectionID` int(11) NOT NULL AUTO_INCREMENT,
  `Imaging_TechniqueID` int(11) NOT NULL,
  `DiseaseID` int(11) NOT NULL,
  PRIMARY KEY (`Disease_DetectionID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  KEY `DiseaseID` (`DiseaseID`),
  CONSTRAINT `disease_detection_ibfk_1` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`),
  CONSTRAINT `disease_detection_ibfk_2` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`DiseaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_detection`
--

LOCK TABLES `disease_detection` WRITE;
/*!40000 ALTER TABLE `disease_detection` DISABLE KEYS */;
INSERT INTO `disease_detection` VALUES (1,3,1),(2,7,2),(3,1,2),(4,7,3),(5,2,3),(6,2,4),(7,9,4),(8,2,5),(9,2,6),(10,7,7),(11,7,8),(12,2,8),(13,7,9),(14,2,10),(15,2,11),(16,2,12),(17,2,13),(18,2,14),(19,4,14),(20,7,14),(21,2,15),(22,2,16),(23,7,16),(24,2,17),(25,7,17),(26,1,18),(27,2,18),(28,7,18),(29,1,19),(30,2,19),(31,7,20),(32,1,21),(33,2,21),(34,4,21),(35,7,21),(36,7,22),(37,1,23),(38,2,23),(39,7,23),(40,2,24),(41,7,24),(42,1,25),(43,2,25),(44,7,25),(45,2,26),(46,7,26),(47,4,27),(48,2,28),(49,1,29),(50,2,29),(51,1,30);
/*!40000 ALTER TABLE `disease_detection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_hospital`
--

DROP TABLE IF EXISTS `disease_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_hospital` (
  `Disease_HospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `DiseaseID` int(11) NOT NULL,
  `HospitalID` int(11) NOT NULL,
  PRIMARY KEY (`Disease_HospitalID`),
  KEY `DiseaseID` (`DiseaseID`),
  KEY `HospitalID` (`HospitalID`),
  CONSTRAINT `disease_hospital_ibfk_1` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`DiseaseID`),
  CONSTRAINT `disease_hospital_ibfk_2` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_hospital`
--

LOCK TABLES `disease_hospital` WRITE;
/*!40000 ALTER TABLE `disease_hospital` DISABLE KEYS */;
INSERT INTO `disease_hospital` VALUES (111,2,1),(112,3,1),(113,4,1),(114,5,3),(115,6,4),(116,7,1),(117,8,5),(118,9,6),(119,10,7),(120,18,1),(121,19,8),(122,20,9),(123,28,1),(124,29,6),(125,30,10);
/*!40000 ALTER TABLE `disease_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `disease_mri`
--

DROP TABLE IF EXISTS `disease_mri`;
/*!50001 DROP VIEW IF EXISTS `disease_mri`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_mri` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `disease_xray`
--

DROP TABLE IF EXISTS `disease_xray`;
/*!50001 DROP VIEW IF EXISTS `disease_xray`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `disease_xray` AS SELECT 
 1 AS `DiseaseID`,
 1 AS `Disease_Name`,
 1 AS `Imaging_Technique_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `HospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `Hospital_Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`HospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Mayo Clinic Hospital','Rochester','Minnesota','USA'),(2,'Mayo Clinic Hospital','Jacksonville','Florida','USA'),(3,'Mayo Clinic Hospital','Phoenix','Arizona','USA'),(4,'Cleveland Clinic Neurological Institute','Cleveland','Ohio','USA'),(5,'Mount Sinai Hospital','New York City','New York','USA'),(6,'The Johns Hopkins Hospital','Baltimore','Maryland','USA'),(7,'Neurological Surgery P.C.','Rockville','New York','USA'),(8,'Arkansas Surgical Hospital','North Little Rock','Arkansas','USA'),(9,'H. Lee Moffitt Cancer Center & Research Institute','Tampa','Florida','USA'),(10,'Brigham and Womens Hospital','Boston','Massachusetts','USA');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imaging_technique`
--

DROP TABLE IF EXISTS `imaging_technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imaging_technique` (
  `Imaging_TechniqueID` int(11) NOT NULL AUTO_INCREMENT,
  `Imaging_Technique_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Imaging_TechniqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imaging_technique`
--

LOCK TABLES `imaging_technique` WRITE;
/*!40000 ALTER TABLE `imaging_technique` DISABLE KEYS */;
INSERT INTO `imaging_technique` VALUES (1,'X-Ray'),(2,'MRI'),(3,'Nuclear medicine'),(4,'Ultrsound'),(5,'Elastography'),(6,'Photoacoustic imaging'),(7,'CT Scan'),(8,'Echocardiography'),(9,'Functional near-infrared spectroscopy'),(10,'Magnetic Particle Imaging');
/*!40000 ALTER TABLE `imaging_technique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mri_image`
--

DROP TABLE IF EXISTS `mri_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mri_image` (
  `MRI_ImageID` int(11) NOT NULL AUTO_INCREMENT,
  `Image` blob NOT NULL,
  `Imaging_TechniqueID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MRI_ImageID`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `mri_image_ibfk_1` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mri_image`
--

LOCK TABLES `mri_image` WRITE;
/*!40000 ALTER TABLE `mri_image` DISABLE KEYS */;
INSERT INTO `mri_image` VALUES (1,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_1.jpg',2),(2,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_2.jpg',2),(3,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(4,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(5,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(6,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(7,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(8,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(9,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(10,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(11,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(12,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(13,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(14,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(15,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(16,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(17,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(18,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(19,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(20,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(21,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(22,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(23,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(24,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(25,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(26,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(27,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(28,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(29,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(30,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(31,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(32,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(33,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(34,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(35,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(36,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(37,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(38,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(39,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(40,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(41,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(42,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(43,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(44,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(45,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(46,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(47,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(48,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(49,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(50,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//brain//MRI//brain_3.jpg',2),(51,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_1.jpg',2),(52,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_2.jpg',2),(53,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_3.jpg',2),(54,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_4.jpg',2),(55,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_5.jpg',2),(56,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_6.jpg',2),(57,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_7.jpg',2),(58,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_8.jpg',2),(59,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_9.jpg',2),(60,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_10.jpg',2),(61,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_11.jpg',2),(62,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_12.jpg',2),(63,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_13.jpg',2),(64,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_14.jpg',2),(65,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_15.jpg',2),(66,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_16.jpg',2),(67,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_17.jpg',2),(68,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_18.jpg',2),(69,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_19.jpg',2),(70,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_20.jpg',2),(71,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_21.jpg',2),(72,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_22.jpg',2),(73,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_23.jpg',2),(74,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_24.jpg',2),(75,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_25.jpg',2),(76,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_26.jpg',2),(77,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_27.jpg',2),(78,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_28.jpg',2),(79,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_29.jpg',2),(80,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_30.jpg',2),(81,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_31.jpg',2),(82,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_32.jpg',2),(83,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_33.jpg',2),(84,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_34.jpg',2),(85,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_35.jpg',2),(86,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_36.jpg',2),(87,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_37.jpg',2),(89,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_38.jpg',2),(90,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_39.jpg',2),(91,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_40.jpg',2),(92,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_41.jpg',2),(93,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_42.jpg',2),(94,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_43.jpg',2),(95,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_44.jpg',2),(96,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_45.jpg',2),(97,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_46.jpg',2),(98,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_47.jpg',2),(99,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_48.jpg',2),(100,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//Knee//MRI//knee_49.jpg',2),(101,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_1.jpg',2),(102,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_2.jpg',2),(103,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_3.jpg',2),(104,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_4.jpg',2),(105,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_5.jpg',2),(106,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_6.jpg',2),(107,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_7.jpg',2),(108,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_8.jpg',2),(109,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_9.jpg',2),(110,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_10.jpg',2),(111,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_11.jpg',2),(112,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_12.jpg',2),(113,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_13.jpg',2),(114,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_14.jpg',2),(115,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_15.jpg',2),(116,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_16.jpg',2),(117,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_17.jpg',2),(118,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_18.jpg',2),(119,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_19.jpg',2),(120,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_20.jpg',2),(121,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_21.jpg',2),(122,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_22.jpg',2),(123,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_23.jpg',2),(124,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_24.jpg',2),(125,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_25.jpg',2),(126,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_26.jpg',2),(127,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_27.jpg',2),(128,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_28.jpg',2),(129,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_29.jpg',2),(130,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_30.jpg',2),(131,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_31.jpg',2),(132,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_32.jpg',2),(133,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_33.jpg',2),(134,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_34.jpg',2),(135,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_35.jpg',2),(136,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_36.jpg',2),(137,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_37.jpg',2),(138,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_38.jpg',2),(139,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_39.jpg',2),(140,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_40.jpg',2),(141,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_41.jpg',2),(142,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_42.jpg',2),(143,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_43.jpg',2),(144,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_44.jpg',2),(145,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_45.jpg',2),(146,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_46.jpg',2),(147,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_47.jpg',2),(148,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_48.jpg',2),(149,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_49.jpg',2),(150,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_50.jpg',2),(151,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_51.jpg',2),(152,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_52.jpg',2),(153,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_53.jpg',2),(154,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_54.jpg',2),(155,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_55.jpg',2),(156,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_56.jpg',2),(157,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_57.jpg',2),(158,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_58.jpg',2),(159,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_59.jpg',2),(160,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_60.jpg',2),(161,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_61.jpg',2),(162,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_62.jpg',2),(163,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_63.jpg',2),(164,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_64.jpg',2),(165,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_65.jpg',2),(166,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_66.jpg',2),(167,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_67.jpg',2),(168,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_68.jpg',2),(169,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_69.jpg',2),(170,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_70.jpg',2),(171,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_71.jpg',2),(172,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_72.jpg',2),(173,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_73.jpg',2),(174,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_74.jpg',2),(175,_binary 'C://Users//nares//OneDrive//Desktop//dmdd//All_images//shoulder//MRI//shoulder_75.jpg',2);
/*!40000 ALTER TABLE `mri_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Result`
--

DROP TABLE IF EXISTS `Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Result` (
  `ResultID` int(11) NOT NULL AUTO_INCREMENT,
  `Image` blob,
  `Body_Part_Name` varchar(50) NOT NULL,
  `Imaging_Technique_Name` varchar(50) NOT NULL,
  `Accuracy_By_Body_Part` varchar(50) NOT NULL,
  `Accuracy_By_Technique` varchar(50) NOT NULL,
  PRIMARY KEY (`ResultID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Result`
--

LOCK TABLES `Result` WRITE;
/*!40000 ALTER TABLE `Result` DISABLE KEYS */;
/*!40000 ALTER TABLE `Result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `Role_Name` (`Role_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (4,'Doctor'),(2,'Instructor'),(3,'Patient'),(1,'System Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` enum('Decline to respond','Male','Female','Transgender') DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone_No` varchar(50) DEFAULT NULL,
  `AddressID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  CONSTRAINT `user_chk_1` CHECK ((`Age` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'Nancy','Gyle',26,'Female','ng@gmail.com','(201) 456 6578',2),(12,'Sam','Crush',21,'Male','sc@gmail.com','(673) 234 1238',1),(13,'Micheal','Johnson',26,'Male','mj@gmail.com','(673) 113 1238',3),(14,'Mike','Crush',45,'Transgender','mc@gmail.com','(224) 776 8767',4),(15,'Nidhi','Goyal',24,'Female','goyal.ni@husky.neu.edu','(201)626-0670',21);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_INSERT_NULL` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
IF NEW.Phone_No = ' ' THEN
SET NEW.Phone_No = NULL;
ELSEIF
NEW.Email =' ' THEN
SET NEW.Email = NULL;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User_Login`
--

DROP TABLE IF EXISTS `User_Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Login` (
  `User_LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL DEFAULT 'No Username',
  `Password` blob NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`User_LoginID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Login`
--

LOCK TABLES `User_Login` WRITE;
/*!40000 ALTER TABLE `User_Login` DISABLE KEYS */;
INSERT INTO `User_Login` VALUES (1001,'ng@gmail.com',_binary 'ng@123',11),(1002,'sc@gmail.com',_binary 'sc@111',12),(1003,'mj@gmail.com',_binary 'mj@111',13),(1004,'mc@gmail.com',_binary 'mc@111',14),(1005,'goyal.ni@husky.neu.e',_binary 'žß»œ ´¶\Ù\ï	¤\n¢',15);
/*!40000 ALTER TABLE `User_Login` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `User_Login_BEFORE_INSERT` BEFORE INSERT ON `user_login` FOR EACH ROW BEGIN
IF NEW.UserID = ' ' THEN
SIGNAL SQLSTATE '45000';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `User_RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`User_RoleID`),
  KEY `fk_role_ur` (`RoleID`),
  KEY `fk_user_ur` (`UserID`),
  CONSTRAINT `fk_role_ur` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`),
  CONSTRAINT `fk_user_ur` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (101,11,1),(102,13,2),(103,14,3),(104,12,4);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_user` AFTER INSERT ON `user_role` FOR EACH ROW BEGIN
INSERT INTO user_with_instructor_role_vw
(First_Name, Last_Name, Age, Sex, Email, Phone_No, Role_Name)
SELECT u.First_Name, u.Last_Name, u.Age, u.Sex, u.Email, u.Phone_No, r.Role_Name
FROM User u
INNER JOIN User_Role ur
INNER JOIN Role r
WHERE u.UserID = ur.UserID
AND ur.RoleID = r.RoleID
AND r. Role_Name = 'Instructor';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_with_instructor_role_vw`
--

DROP TABLE IF EXISTS `user_with_instructor_role_vw`;
/*!50001 DROP VIEW IF EXISTS `user_with_instructor_role_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_with_instructor_role_vw` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Age`,
 1 AS `Sex`,
 1 AS `Email`,
 1 AS `Phone_No`,
 1 AS `Role_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xray_image`
--

DROP TABLE IF EXISTS `xray_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xray_image` (
  `XRay_Image` int(11) NOT NULL AUTO_INCREMENT,
  `Image` blob NOT NULL,
  `Imaging_TechniqueID` int(11) DEFAULT NULL,
  PRIMARY KEY (`XRay_Image`),
  KEY `Imaging_TechniqueID` (`Imaging_TechniqueID`),
  CONSTRAINT `xray_image_ibfk_1` FOREIGN KEY (`Imaging_TechniqueID`) REFERENCES `imaging_technique` (`Imaging_TechniqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xray_image`
--

LOCK TABLES `xray_image` WRITE;
/*!40000 ALTER TABLE `xray_image` DISABLE KEYS */;
INSERT INTO `xray_image` VALUES (1,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_1.jpg',1),(2,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_2.jpg',1),(3,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_3.jpg',1),(4,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_4.jpg',1),(5,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_5.jpg',1),(6,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_6.jpg',1),(7,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_7.jpg',1),(8,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_8.jpg',1),(9,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_9.jpg',1),(10,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_10.jpg',1),(11,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_11.jpg',1),(12,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_12.jpg',1),(13,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_13.jpg',1),(14,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_14.jpg',1),(15,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_15.jpg',1),(16,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_16.jpg',1),(17,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_17.jpg',1),(18,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_18.jpg',1),(19,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_19.jpg',1),(20,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_20.jpg',1),(21,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_21.jpg',1),(22,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_22.jpg',1),(23,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_23.jpg',1),(24,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_24.jpg',1),(25,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_25.jpg',1),(26,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_26.jpg',1),(27,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_27.jpg',1),(28,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_28.jpg',1),(29,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_29.jpg',1),(30,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_30.jpg',1),(31,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_31.jpg',1),(32,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_32.jpg',1),(33,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_33.jpg',1),(34,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_34.jpg',1),(35,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_35.jpg',1),(36,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_36.jpg',1),(37,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_37.jpg',1),(38,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_38.jpg',1),(39,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_39.jpg',1),(40,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_40.jpg',1),(41,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_41.jpg',1),(42,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_42.jpg',1),(43,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_43.jpg',1),(44,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_44.jpg',1),(45,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_45.jpg',1),(46,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_46.jpg',1),(47,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_47.jpg',1),(48,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_48.jpg',1),(49,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_49.jpg',1),(50,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_50.jpg',1),(51,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_51.jpg',1),(52,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_52.jpg',1),(53,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_53.jpg',1),(54,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_54.jpg',1),(55,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_55.jpg',1),(56,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_56.jpg',1),(57,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_57.jpg',1),(58,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_58.jpg',1),(59,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_59.jpg',1),(60,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_60.jpg',1),(61,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_61.jpg',1),(62,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_62.jpg',1),(63,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_63.jpg',1),(64,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_64.jpg',1),(65,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_65.jpg',1),(66,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_66.jpg',1),(67,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_67.jpg',1),(68,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_68.jpg',1),(69,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_69.jpg',1),(70,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_70.jpg',1),(71,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_71.jpg',1),(72,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_72.jpg',1),(73,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_73.jpg',1),(74,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_74.jpg',1),(75,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_75.jpg',1),(76,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_76.jpg',1),(77,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_77.jpg',1),(78,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_78.jpg',1),(79,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_79.jpg',1),(80,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_80.jpg',1),(81,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_81.jpg',1),(82,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_82.jpg',1),(83,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_83.jpg',1),(84,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_84.jpg',1),(85,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_85.jpg',1),(86,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_86.jpg',1),(87,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_87.jpg',1),(88,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_88.jpg',1),(89,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_89.jpg',1),(90,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_90.jpg',1),(91,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_91.jpg',1),(92,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_92.jpg',1),(93,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_93.jpg',1),(94,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_94.jpg',1),(95,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_95.jpg',1),(96,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_96.jpg',1),(97,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_97.jpg',1),(98,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_98.jpg',1),(99,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_99.jpg',1),(100,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_100.jpg',1),(101,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_101.jpg',1),(102,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_102.jpg',1),(103,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_103.jpg',1),(104,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_104.jpg',1),(105,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_105.jpg',1),(106,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_106.jpg',1),(107,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_107.jpg',1),(108,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_108.jpg',1),(109,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_109.jpg',1),(110,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_110.jpg',1),(111,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_111.jpg',1),(112,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_112.jpg',1),(113,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_113.jpg',1),(114,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_114.jpg',1),(115,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_115.jpg',1),(116,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_116.jpg',1),(117,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_117.jpg',1),(118,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_118.jpg',1),(119,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_119.jpg',1),(120,_binary 'C://Users//nares//OneDrive//Desktop//Final_image//Final_image//Xray//xray_120.jpg',1);
/*!40000 ALTER TABLE `xray_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Medical_Imaging'
--

--
-- Dumping routines for database 'Medical_Imaging'
--
/*!50003 DROP FUNCTION IF EXISTS `body_part_max_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `body_part_max_image`() RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
 DECLARE stringValue VARCHAR(50);
 DECLARE Total__Brain_Image INT;
 DECLARE Total__Knee_Image INT;
 DECLARE Total__Shoulder_Image INT;
 
 SET Total__Brain_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN MRI_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Brain'); 
    
SET Total__Knee_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN CT_Scan_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Knee');
    
SET Total__Shoulder_Image = (SELECT COUNT(B.Body_PartID) FROM Body_Part B 
    JOIN Body_Part_Technique BT JOIN XRay_Image I
    WHERE B.Body_PartID = BT.Body_PartID 
    AND BT.Imaging_TechniqueID = I.Imaging_TechniqueID AND Body_Part_Name = 'Shoulder');
    
IF (Total__Brain_Image > Total__Knee_Image) AND (Total__Brain_Image > Total__Shoulder_Image) THEN
SET stringValue = 'BRAIN';
ELSEIF Total__Brain_Image > Total__Knee_Image THEN                
SET stringValue = 'BRAIN';
ELSEIF Total__Brain_Image > Total__Shoulder_Image THEN                
SET stringValue = 'BRAIN';

ELSEIF (Total__Knee_Image > Total__Brain_Image) AND (Total__Knee_Image > Total__Shoulder_Image) THEN
SET stringValue = 'KNEE';
ELSEIF Total__Knee_Image > Total__Brain_Image THEN                
SET stringValue = 'KNEE';
ELSEIF Total__Knee_Image > Total__Shoulder_Image THEN                
SET stringValue = 'KNEE';

ELSEIF (Total__Shoulder_Image > Total__Brain_Image) AND (Total__Shoulder_Image > Total__Knee_Image) THEN
SET stringValue = 'KNEE';
ELSEIF Total__Shoulder_Image > Total__Knee_Image THEN                
SET stringValue = 'KNEE';
ELSEIF Total__Shoulder_Image > Total__Shoulder_Image THEN                
SET stringValue = 'KNEE';
ELSE
SET stringValue = 'ALL ARE EQUAL';
 END IF;
 RETURN stringValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `technique_performance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `technique_performance`() RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
Begin
 DECLARE stringValue VARCHAR(50);
 DECLARE Total__By_MRI INT;
 DECLARE Total__By_CT_SCAN INT;
 DECLARE Total__By_XRAY INT;
 
 SET Total__By_MRI = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'MRI'); 
SET Total__By_CT_SCAN = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'CT Scan');
SET Total__By_XRAY = (SELECT COUNT(d.DiseaseID) FROM Disease d 
    JOIN Disease_Detection dd JOIN Imaging_Technique i 
    WHERE d.DiseaseID = dd.DiseaseID 
    AND DD.Imaging_TechniqueID = i.Imaging_TechniqueID AND i.Imaging_Technique_Name = 'X-Ray');
 IF (Total__By_MRI > Total__By_CT_SCAN) AND (Total__By_MRI > Total__By_XRAY) THEN
 SET stringValue = 'MRI detected more disease than CT Scan AND X-Ray ';
 ELSEIF Total__By_MRI > Total__By_CT_SCAN THEN                
 SET stringValue = 'MRI detected more disease than CT_Scan';
 ELSEIF Total__By_MRI > Total__By_XRAY THEN                
 SET stringValue = 'MRI detected more disease than X-Ray';
 ELSE
 SET stringValue = 'MRI detected less disease than CT Scan and X-Ray';
 END IF;
 RETURN stringValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_body_part` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_body_part`(IN bodypartID INT, IN bodypartname VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO body_part (Body_PartID, Body_Part_Name)
SELECT @bodypartID, @bodypartname;
SET @message_text = 'New BodyPart added successfully';
SELECT @message_text;
##LIMIT 1
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_disease`(IN diseaseID INT, IN diseasename VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO Disease (DiseaseID, Disease_Name)
SELECT @diseaseid, @diseasename;
SET @message_text = 'Disease added successfully';
SELECT @message_text;
##LIMIT 1

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_imaging_technique` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_imaging_technique`(IN techniqueID INT, IN techniquename VARCHAR(50))
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO Imaging_Technique (Imaging_TechniqueID, Imaging_Technique_Name)
SELECT @techniqueID, @techniquename;
SET @message_text = 'New Technique added successfully';
SELECT @message_text;
##LIMIT 1
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(IN userid INT, IN fname VARCHAR(50), IN lname VARCHAR(50), IN age INT, IN sex VARCHAR(10), IN emailid VARCHAR(50), IN phone VARCHAR(50), IN addressid INT)
BEGIN
DECLARE message_text VARCHAR(50);
INSERT INTO User (UserID, First_Name, Last_Name, Age, Sex, Email, Phone_No, AddressID)
SELECT @userid, @fname, @lname, @age, @sex, @emailid, @phone, @addressid;
SET @message_text = 'User added successfully';
SELECT @message_text;
##LIMIT 1
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_technique_for_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_technique_for_disease`(IN diseasename VARCHAR(50))
BEGIN
SELECT Imaging_Technique_Name 
FROM Imaging_Technique I
WHERE Imaging_TechniqueID IN (
	SELECT Imaging_TechniqueID 
    FROM Disease_Detection DD
	JOIN Disease D
	WHERE I.Imaging_TechniqueID = DD.Imaging_TechniqueID
	AND DD.DiseaseID = D.DiseaseID
	AND Disease_Name = diseasename);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verify_user_login_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_user_login_proc`(IN user_name VARCHAR(1000), IN password VARCHAR(1000))
    READS SQL DATA
BEGIN
	SELECT IF(count(*) > 0, 0, 1) AS Result
    FROM user_login 
    WHERE Username = user_name 
    AND Password = password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `disease_ctscan`
--

/*!50001 DROP VIEW IF EXISTS `disease_ctscan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_ctscan` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'CT Scan')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disease_mri`
--

/*!50001 DROP VIEW IF EXISTS `disease_mri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_mri` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'MRI')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `disease_xray`
--

/*!50001 DROP VIEW IF EXISTS `disease_xray`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `disease_xray` AS select `d`.`DiseaseID` AS `DiseaseID`,`d`.`Disease_Name` AS `Disease_Name`,`i`.`Imaging_Technique_Name` AS `Imaging_Technique_Name` from ((`imaging_technique` `i` join `disease_detection` `dd`) join `disease` `d`) where ((`dd`.`Imaging_TechniqueID` = `i`.`Imaging_TechniqueID`) and (`dd`.`DiseaseID` = `d`.`DiseaseID`) and (`i`.`Imaging_Technique_Name` = 'X-Ray')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_with_instructor_role_vw`
--

/*!50001 DROP VIEW IF EXISTS `user_with_instructor_role_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_with_instructor_role_vw` AS select `u`.`First_Name` AS `First_Name`,`u`.`Last_Name` AS `Last_Name`,`u`.`Age` AS `Age`,`u`.`Sex` AS `Sex`,`u`.`Email` AS `Email`,`u`.`Phone_No` AS `Phone_No`,`r`.`Role_Name` AS `Role_Name` from ((`user` `u` join `user_role` `ur`) join `role` `r`) where ((`u`.`UserID` = `ur`.`UserID`) and (`ur`.`RoleID` = `r`.`RoleID`) and (`r`.`Role_Name` = 'Instructor')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-10 16:46:16
