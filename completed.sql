-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: surmile
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `b_route`
--

DROP TABLE IF EXISTS `b_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_route` (
  `brid` int(11) NOT NULL,
  PRIMARY KEY (`brid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_route`
--

LOCK TABLES `b_route` WRITE;
/*!40000 ALTER TABLE `b_route` DISABLE KEYS */;
INSERT INTO `b_route` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `b_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_stops`
--

DROP TABLE IF EXISTS `b_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_stops` (
  `bsid` varchar(4) NOT NULL,
  `bs_name` varchar(20) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bsid`),
  KEY `sid` (`sid`),
  CONSTRAINT `b_stops_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `e_services` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_stops`
--

LOCK TABLES `b_stops` WRITE;
/*!40000 ALTER TABLE `b_stops` DISABLE KEYS */;
INSERT INTO `b_stops` VALUES ('A001','Asad Gate',1),('B001','Bosila',1),('C001','College Gate',1),('F001','Farm Gate',2),('J001','Jahangir Gate',3),('K001','Katabon',7),('M001','Mohammadpur',1),('M002','Mohakhali',4),('S001','Shyamoli',5),('S002','Shahbagh',6),('S003','Science Lab/City Col',7),('S004','Shukrabad',8);
/*!40000 ALTER TABLE `b_stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `bid` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `brid` int(11) DEFAULT NULL,
  `plate_num` varchar(25) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  KEY `brid` (`brid`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `bus_company` (`cid`),
  CONSTRAINT `bus_ibfk_2` FOREIGN KEY (`brid`) REFERENCES `b_route` (`brid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (101,20,1,1,'Dhaka  P 11 2345'),(102,20,1,1,'Dhaka  P 11 6789'),(201,30,3,2,'Dhaka  K 11 9999'),(202,20,2,3,'Dhaka  K 11 2349'),(301,30,3,2,'Dhaka  A 12 5897');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_company`
--

DROP TABLE IF EXISTS `bus_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_company` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_company`
--

LOCK TABLES `bus_company` WRITE;
/*!40000 ALTER TABLE `bus_company` DISABLE KEYS */;
INSERT INTO `bus_company` VALUES (1,'Rob Rob',1896578542,'63, purana paltan (2nd floor), (adjacent dainik bangla moor), Dhaka, Bangladesh'),(2,'Alif',1556533533,'Japan Garden City, Ring Rd, Dhaka, Bangladesh'),(3,'Thikana',1785412698,'elephant road, bara magh bazar, ramna, Dhaka, bangladesh');
/*!40000 ALTER TABLE `bus_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_emp`
--

DROP TABLE IF EXISTS `bus_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_emp` (
  `dri_id` varchar(4) DEFAULT NULL,
  `con_id` varchar(4) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  KEY `dri_id` (`dri_id`),
  KEY `con_id` (`con_id`),
  KEY `bid` (`bid`),
  CONSTRAINT `bus_emp_ibfk_1` FOREIGN KEY (`dri_id`) REFERENCES `dri_list` (`dri_id`),
  CONSTRAINT `bus_emp_ibfk_2` FOREIGN KEY (`con_id`) REFERENCES `con_list` (`con_id`),
  CONSTRAINT `bus_emp_ibfk_3` FOREIGN KEY (`bid`) REFERENCES `bus` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_emp`
--

LOCK TABLES `bus_emp` WRITE;
/*!40000 ALTER TABLE `bus_emp` DISABLE KEYS */;
INSERT INTO `bus_emp` VALUES ('D001','C001',101),('D003','C002',102),('D001','C004',201),('D005','C003',202),('D004','C005',301),('D006','C006',201),('D007','C007',202),('D008','C008',102),('D009','C009',101),('D010','C010',301);
/*!40000 ALTER TABLE `bus_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `con_list`
--

DROP TABLE IF EXISTS `con_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_list` (
  `con_id` varchar(4) NOT NULL,
  `con_cell` int(11) DEFAULT NULL,
  `con_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_list`
--

LOCK TABLES `con_list` WRITE;
/*!40000 ALTER TABLE `con_list` DISABLE KEYS */;
INSERT INTO `con_list` VALUES ('C001',1896574523,'Dukhu Mia'),('C002',1478532658,'Mokless'),('C003',1523658745,'Foysal'),('C004',1354658745,'Hakim'),('C005',1856324956,'Anik'),('C006',1986521232,'Newaz'),('C007',1996652332,'Kazi'),('C008',1745236211,'Sameer'),('C009',1966522331,'Hossain'),('C010',1563111232,'Hasan');
/*!40000 ALTER TABLE `con_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dri_list`
--

DROP TABLE IF EXISTS `dri_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dri_list` (
  `dri_id` varchar(4) NOT NULL,
  `dri_cell` int(11) DEFAULT NULL,
  `dri_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dri_list`
--

LOCK TABLES `dri_list` WRITE;
/*!40000 ALTER TABLE `dri_list` DISABLE KEYS */;
INSERT INTO `dri_list` VALUES ('D001',1987452365,'Rezwan'),('D002',1452136541,'Tahin'),('D003',1963254215,'Thomas'),('D004',1985632458,'Tashin'),('D005',1652369874,'Abrar'),('D006',1665522354,'Tanim'),('D007',1356998452,'Hani'),('D008',1655563259,'Milon'),('D009',1332658745,'Kamal'),('D010',1334566999,'Jamal');
/*!40000 ALTER TABLE `dri_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_services`
--

DROP TABLE IF EXISTS `e_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_services` (
  `sid` int(11) NOT NULL,
  `s_name` varchar(50) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_services`
--

LOCK TABLES `e_services` WRITE;
/*!40000 ALTER TABLE `e_services` DISABLE KEYS */;
INSERT INTO `e_services` VALUES (1,'Mohammadpur Police Station',1712345678),(2,'Tejgaon Police Station',1712345789),(3,'Sher-e-Bangla Police Station',1712345966),(4,'Banani Police Station',1712436879),(5,'Adabar Police Station',1712335610),(6,'Shahbagh Police Station',1712346699),(7,'New Market Police Station',1712345669),(8,'Dhanmondi Police Station',1712345858);
/*!40000 ALTER TABLE `e_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_news`
--

DROP TABLE IF EXISTS `emergency_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergency_news` (
  `eid` int(11) NOT NULL,
  `reason` varchar(1500) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `cid` (`cid`),
  CONSTRAINT `emergency_news_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `bus_company` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_news`
--

LOCK TABLES `emergency_news` WRITE;
/*!40000 ALTER TABLE `emergency_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian` (
  `gid` varchar(6) DEFAULT NULL,
  `uid` varchar(6) DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `guardian_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES ('U0002','U0003'),('U0005','U0001');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psngr_type`
--

DROP TABLE IF EXISTS `psngr_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psngr_type` (
  `pid` varchar(1) NOT NULL,
  `type` varchar(7) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psngr_type`
--

LOCK TABLES `psngr_type` WRITE;
/*!40000 ALTER TABLE `psngr_type` DISABLE KEYS */;
INSERT INTO `psngr_type` VALUES ('A','Regular'),('B','Student'),('C','Staff');
/*!40000 ALTER TABLE `psngr_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safe_search`
--

DROP TABLE IF EXISTS `safe_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safe_search` (
  `ssid` varchar(6) NOT NULL,
  `uid` varchar(6) DEFAULT NULL,
  `bsid` varchar(4) DEFAULT NULL,
  `s_un_safe` varchar(1) NOT NULL,
  PRIMARY KEY (`ssid`),
  KEY `uid` (`uid`),
  KEY `bsid` (`bsid`),
  CONSTRAINT `safe_search_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `safe_search_ibfk_2` FOREIGN KEY (`bsid`) REFERENCES `b_stops` (`bsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safe_search`
--

LOCK TABLES `safe_search` WRITE;
/*!40000 ALTER TABLE `safe_search` DISABLE KEYS */;
INSERT INTO `safe_search` VALUES ('S0001','U0003','M002','5'),('S0002','U0004','B001','4'),('S0003','U0001','C001','3'),('S0004','U0003','M002','3'),('S0005','U0002','K001','1');
/*!40000 ALTER TABLE `safe_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stops_routes`
--

DROP TABLE IF EXISTS `stops_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stops_routes` (
  `bsid` varchar(4) DEFAULT NULL,
  `brid` int(11) DEFAULT NULL,
  KEY `bsid` (`bsid`),
  KEY `brid` (`brid`),
  CONSTRAINT `stops_routes_ibfk_1` FOREIGN KEY (`bsid`) REFERENCES `b_stops` (`bsid`),
  CONSTRAINT `stops_routes_ibfk_2` FOREIGN KEY (`brid`) REFERENCES `b_route` (`brid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stops_routes`
--

LOCK TABLES `stops_routes` WRITE;
/*!40000 ALTER TABLE `stops_routes` DISABLE KEYS */;
INSERT INTO `stops_routes` VALUES ('M001',1),('A001',1),('F001',1),('J001',1),('M002',1),('B001',2),('M001',2),('A001',2),('C001',2),('S001',2),('S002',3),('K001',3),('S002',3),('S003',3),('A001',3),('M001',3);
/*!40000 ALTER TABLE `stops_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_table`
--

DROP TABLE IF EXISTS `t_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_table` (
  `tid` varchar(7) NOT NULL,
  `p_date` date DEFAULT NULL,
  `exp` date DEFAULT NULL,
  `start_loc_id` varchar(4) DEFAULT NULL,
  `end_loc_id` varchar(4) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `p_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `start_loc_id` (`start_loc_id`),
  KEY `end_loc_id` (`end_loc_id`),
  KEY `bid` (`bid`),
  KEY `p_type` (`p_type`),
  CONSTRAINT `t_table_ibfk_1` FOREIGN KEY (`start_loc_id`) REFERENCES `b_stops` (`bsid`),
  CONSTRAINT `t_table_ibfk_2` FOREIGN KEY (`end_loc_id`) REFERENCES `b_stops` (`bsid`),
  CONSTRAINT `t_table_ibfk_3` FOREIGN KEY (`bid`) REFERENCES `bus` (`bid`),
  CONSTRAINT `t_table_ibfk_4` FOREIGN KEY (`p_type`) REFERENCES `psngr_type` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_table`
--

LOCK TABLES `t_table` WRITE;
/*!40000 ALTER TABLE `t_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(6) NOT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_cont` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('U0001','Kazi Najrul',1564587896),('U0002','Rabindranath',1658965236),('U0003','Satyajit',1336589653),('U0004','Jashim Uddin',1665896325),('U0005','Micheal Modhusudan ',1336589665);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11  3:49:18
