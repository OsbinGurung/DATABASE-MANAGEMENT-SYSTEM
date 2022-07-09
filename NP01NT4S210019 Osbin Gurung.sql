-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: online_shopping
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(255) NOT NULL,
  `AddressID` varchar(255) NOT NULL,
  `Phone_Number` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Osbin Gurung','Budhanilkantha','1234567890',19),(2,'Prabesh Tamang','Boudha','9876543210',21),(3,'Sarthak Bikram Rana','Chhetrapati','6543210789',20),(4,'Bisham Kunwor','Anamnagar','3219876540',20),(5,'Aadarsha Shakya','Chhetrapati','1472583690',20);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `DeliveryID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) NOT NULL,
  `Delivery_Tracking_Number` varchar(255) DEFAULT NULL,
  `Courier_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE KEY `Delivery_Tracking_Number` (`Delivery_Tracking_Number`),
  KEY `supplierID` (`supplierID`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,2,'NP01235689','Ram'),(2,4,'NP124578','Hari'),(3,1,'NP985632','Sam'),(4,3,'NP456123','Hari'),(5,4,'NP7893652','Ram');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderItemsDetails_ID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `Item_Name` varchar(255) NOT NULL,
  `Availability` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `OrderItemsDetails_ID` (`OrderItemsDetails_ID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`OrderItemsDetails_ID`) REFERENCES `orderitemsdetails` (`OrderItemsDetails_ID`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,3,'Shoes',10),(2,5,2,'Bag',0),(3,1,4,'Trousers',5),(4,3,2,'Toy Car',7),(5,2,2,'Bicycle',1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitemsdetails`
--

DROP TABLE IF EXISTS `orderitemsdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitemsdetails` (
  `OrderItemsDetails_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  PRIMARY KEY (`OrderItemsDetails_ID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `orderitemsdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitemsdetails`
--

LOCK TABLES `orderitemsdetails` WRITE;
/*!40000 ALTER TABLE `orderitemsdetails` DISABLE KEYS */;
INSERT INTO `orderitemsdetails` VALUES (4,1),(2,2),(1,3),(5,4),(3,5);
/*!40000 ALTER TABLE `orderitemsdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `DeliveryID` int(11) NOT NULL,
  `Total_Number_Of_Items` int(11) NOT NULL,
  `Date_of_Order` date DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `DeliveryID` (`DeliveryID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,5,'2020-12-10'),(2,1,5,2,'2020-02-10'),(3,4,1,1,'2020-04-17'),(4,3,2,8,'2020-04-28'),(5,5,5,3,'2020-02-08');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_Name` varchar(255) NOT NULL,
  `Supplier_Address` varchar(255) NOT NULL,
  `Supplier_Phone_Number` varchar(255) DEFAULT NULL,
  `Supplier_EmailID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `Supplier_EmailID` (`Supplier_EmailID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Adidas','Durnarmarg','2580819340','AdidasNP@gmail.com'),(2,'UnderArmour','Durbarmarg','5341201779','UnderArmorNP@gmail.com'),(3,'Fantech','Dillibazar','3811344804','FantechNP@gmail.com'),(4,'Samsung','Jwalakhel','2632439738','SamsunNP@gmail.com'),(5,'Sony','New Road','6803214027','SonyNP@gmail.com');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 15:22:03
