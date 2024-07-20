CREATE DATABASE  IF NOT EXISTS `vending` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vending`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vending
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'15845845 test street','west jordan','ut','85955','USA',46.000000,46.000000,'2024-07-20 03:41:14');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(15,1567);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `snack_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `machine_id` (`machine_id`),
  KEY `snack_id` (`snack_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`),
  CONSTRAINT `cart_item_ibfk_3` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`snack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (7,15,1,1,8);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `customer_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mr. Test 845','theOneAndOnlyTestEmail@test785459.com','testPassword','2024-07-20 03:56:17'),(1567,'Billy Joel','pianoMan@gmail.com','Didn\'tStartTheFire','2024-07-20 05:31:46');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(50) NOT NULL,
  `expense_reason` enum('Repair','Stock','Pay','Other') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`machine_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (1,'test machine 466845',1);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_slot`
--

DROP TABLE IF EXISTS `machine_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine_slot` (
  `slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_count` int(11) NOT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `snack_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `machine_id` (`machine_id`),
  KEY `snack_id` (`snack_id`),
  CONSTRAINT `machine_slot_ibfk_1` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`),
  CONSTRAINT `machine_slot_ibfk_2` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`snack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_slot`
--

LOCK TABLES `machine_slot` WRITE;
/*!40000 ALTER TABLE `machine_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'The big man');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_machine`
--

DROP TABLE IF EXISTS `manager_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_machine` (
  `manager_machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`manager_machine_id`),
  KEY `manager_id` (`manager_id`),
  KEY `machine_id` (`machine_id`),
  CONSTRAINT `manager_machine_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`),
  CONSTRAINT `manager_machine_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_machine`
--

LOCK TABLES `manager_machine` WRITE;
/*!40000 ALTER TABLE `manager_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_time`
--

DROP TABLE IF EXISTS `manager_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_time` (
  `manager_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `time_in` datetime NOT NULL,
  `time_out` datetime DEFAULT NULL,
  PRIMARY KEY (`manager_time_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `manager_time_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_time`
--

LOCK TABLES `manager_time` WRITE;
/*!40000 ALTER TABLE `manager_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_vault`
--

DROP TABLE IF EXISTS `payment_vault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_vault` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `card_type` enum('Visa','AMEX','Discover','MasterCard') NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `security_code` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiration_date` varchar(7) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_vault_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_vault`
--

LOCK TABLES `payment_vault` WRITE;
/*!40000 ALTER TABLE `payment_vault` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_vault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snack`
--

DROP TABLE IF EXISTS `snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack` (
  `snack_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` decimal(10,2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `sold_count` int(11) DEFAULT '0',
  PRIMARY KEY (`snack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snack`
--

LOCK TABLES `snack` WRITE;
/*!40000 ALTER TABLE `snack` DISABLE KEYS */;
INSERT INTO `snack` VALUES (1,1000.00,'test_candy','test_brand','USA',1500),(22,1.50,'Seaweed snack','Wang ','Korea',0),(23,1.00,'Butter Finger','Ferrero','USA',0),(24,2.00,'Bon Bons','Eiffel','France',0),(25,5.00,'Beef Jerky','Jack Links','USA',0);
/*!40000 ALTER TABLE `snack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snack_request`
--

DROP TABLE IF EXISTS `snack_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) DEFAULT NULL,
  `snack_name` varchar(50) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `machine_id` (`machine_id`),
  CONSTRAINT `snack_request_ibfk_1` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snack_request`
--

LOCK TABLES `snack_request` WRITE;
/*!40000 ALTER TABLE `snack_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `snack_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `customer_id` (`customer_id`),
  KEY `address_id` (`address_id`),
  KEY `cart_id` (`cart_id`),
  KEY `machine_id` (`machine_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20  1:44:26
