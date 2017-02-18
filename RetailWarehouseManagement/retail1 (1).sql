-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: retail1
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `global_item`
--

DROP TABLE IF EXISTS `global_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_item` (
  `item_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price_per_unit($)` int(10) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_item`
--

LOCK TABLES `global_item` WRITE;
/*!40000 ALTER TABLE `global_item` DISABLE KEYS */;
INSERT INTO `global_item` VALUES (1,'Shoes','Brand:Nike,Sports shoes,Size:6,Color:Black',20),(2,'Wrist Watch','Brand:Titan,Color:Silver,Dial Shape:Square',15),(3,'Watch','Brand:Fossil,Color: Silver,Dial:Square',275),(4,'Phone cover','Phone: Iphone7,Color:White,Type:Hard',20),(5,'Wallet','Brand:Gucci,Color: Brown,Material:Leather',200),(6,'Handbag','Brand: Ralph Lauren,Color:Blue,Material: Suede',170);
/*!40000 ALTER TABLE `global_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `zipcode` int(10) NOT NULL,
  `state` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  PRIMARY KEY (`zipcode`),
  KEY `idx_state` (`state`),
  KEY `idx_city` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (28262,'NC','Charlotte'),(38282,'AZ','Phoenix'),(44444,'FL','Miami'),(85562,'AZ','Tucson'),(85705,'AZ','Tucson'),(222222,'CA','Los Angeles');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pom_userlist`
--

DROP TABLE IF EXISTS `pom_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pom_userlist` (
  `uid` int(3) NOT NULL,
  `warehouse_id` int(3) NOT NULL,
  PRIMARY KEY (`uid`,`warehouse_id`),
  KEY `idx_warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pom_userlist`
--

LOCK TABLES `pom_userlist` WRITE;
/*!40000 ALTER TABLE `pom_userlist` DISABLE KEYS */;
INSERT INTO `pom_userlist` VALUES (11,1);
/*!40000 ALTER TABLE `pom_userlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `po_id` int(3) NOT NULL AUTO_INCREMENT,
  `order_id` int(3) DEFAULT NULL,
  `supplier_id` int(3) DEFAULT NULL,
  `po_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`po_id`),
  KEY `FK_po` (`order_id`),
  KEY `FK_si` (`supplier_id`),
  KEY `idx_supplier_id` (`supplier_id`),
  KEY `idx_po_status` (`po_status`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`order_id`),
  CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (1,6,1,'placed'),(2,5,1,'placed'),(3,14,1,'placed'),(4,28,2,'placed');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_item`
--

DROP TABLE IF EXISTS `purchase_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_item` (
  `po_id` int(3) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `quantity_ordered` int(10) DEFAULT NULL,
  KEY `FK_pi` (`po_id`),
  KEY `FK_ii` (`item_id`),
  KEY `idx_order_id` (`po_id`),
  KEY `idx_item_id` (`item_id`),
  CONSTRAINT `purchase_order_item_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`po_id`),
  CONSTRAINT `purchase_order_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_item`
--

LOCK TABLES `purchase_order_item` WRITE;
/*!40000 ALTER TABLE `purchase_order_item` DISABLE KEYS */;
INSERT INTO `purchase_order_item` VALUES (1,2,10),(1,4,15),(2,3,7),(3,1,5),(4,1,1);
/*!40000 ALTER TABLE `purchase_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `carton_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `report_type` varchar(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`carton_id`,`item_id`),
  KEY `fk_i` (`item_id`),
  KEY `idx_report_type` (`report_type`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`carton_id`) REFERENCES `supplier_dispatch_carton` (`carton_id`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `warehouse_id` int(3) NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `ws_fk` (`warehouse_id`),
  KEY `s_loc_fk` (`zipcode`),
  KEY `idx_zipcode` (`zipcode`),
  CONSTRAINT `Store_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Nike','18882 Block1','Huntersville','28262',1),(2,'Berlington','5242 Concorde ','25th street','28262',1),(3,'Best Buy','34321 Concorde','City Blvd.','28262',1),(4,'GAP','421 E ','Drachman','85705',2),(5,'Puma','Suite 5A-1204','Dragram','85562',2);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order` (
  `order_id` int(3) NOT NULL AUTO_INCREMENT,
  `store_id` int(3) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `so_s_fk` (`store_id`),
  KEY `idx_storeid` (`store_id`),
  KEY `idx_status` (`status`),
  CONSTRAINT `store_order_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (4,1,'2016-10-10',0,'Order Placed'),(5,1,'2016-10-10',0,'Order Placed'),(6,1,'2016-10-10',0,'Order Placed'),(7,1,'2016-10-10',275,'Order Placed'),(8,1,'2016-10-10',215,'Order Placed'),(9,1,'2016-10-10',20,'Order Placed'),(10,1,'2016-10-10',705,'Order Placed'),(11,1,'2016-10-10',585,'Order Placed'),(13,1,'2016-10-10',100,'Complete'),(14,1,'2016-10-10',100,'Complete'),(15,1,'2016-10-10',100,'Order Placed'),(16,1,'2016-10-10',15,'Order Placed'),(17,1,'2016-10-10',90,'Order Placed'),(18,1,'2016-10-10',165,'Order Placed'),(19,1,'2016-10-10',35,'Order Placed'),(20,1,'2016-10-10',70,'Order Placed'),(21,1,'2016-10-10',345,'Order Placed'),(22,1,'2016-10-10',40,'Order Placed'),(23,1,'2016-10-10',275,'Order Placed'),(24,1,'2016-10-10',315,'Order Placed'),(25,1,'2016-10-10',275,'Order Placed'),(26,1,'2016-10-10',275,'Order Placed'),(27,1,'2016-11-27',20,'Complete'),(28,1,'2016-10-29',190,'Complete'),(29,1,'2016-10-29',210,'Complete'),(30,1,'2016-10-29',145,'Order Placed'),(31,1,'2016-11-27',20,'Order Placed'),(32,1,'2016-11-27',190,'Order Placed');
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_storeOrder_insert
BEFORE INSERT ON store_order
For each row
BEGIN
set 
new.delivery_date=DATE_ADD(CURDATE(),INTERVAL 7 DAY);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `store_order_item`
--

DROP TABLE IF EXISTS `store_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order_item` (
  `order_id` int(3) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `quantity_ordered` int(3) DEFAULT NULL,
  KEY `soi_i_fk` (`item_id`),
  KEY `soi_o_fk` (`order_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_item_id` (`item_id`),
  CONSTRAINT `store_order_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`),
  CONSTRAINT `store_order_item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order_item`
--

LOCK TABLES `store_order_item` WRITE;
/*!40000 ALTER TABLE `store_order_item` DISABLE KEYS */;
INSERT INTO `store_order_item` VALUES (11,1,1),(11,2,1),(11,3,2),(13,1,0),(14,1,0),(15,1,5),(16,2,1),(17,2,2),(17,4,3),(18,2,2),(18,4,3),(18,2,5),(19,2,1),(19,4,1),(20,2,1),(20,4,1),(20,2,1),(20,4,1),(21,2,1),(21,4,1),(21,2,1),(21,4,1),(21,3,1),(22,1,2),(23,3,1),(24,1,1),(24,3,1),(24,4,1),(25,3,1),(26,3,1),(27,1,1),(28,1,0),(28,6,1),(29,1,0),(29,6,3),(29,1,0);
/*!40000 ALTER TABLE `store_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_representative`
--

DROP TABLE IF EXISTS `store_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_representative` (
  `uid` int(3) NOT NULL DEFAULT '0',
  `store_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `s_fk` (`store_id`),
  KEY `idx_store_id` (`store_id`),
  CONSTRAINT `Store_Representative_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `Store_Representative_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_representative`
--

LOCK TABLES `store_representative` WRITE;
/*!40000 ALTER TABLE `store_representative` DISABLE KEYS */;
INSERT INTO `store_representative` VALUES (1,1),(2,1),(5,2),(6,3);
/*!40000 ALTER TABLE `store_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(3) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(15) NOT NULL,
  `address_line_1` varchar(15) NOT NULL,
  `address_line_2` varchar(15) NOT NULL,
  `zipcode` int(10) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `sup_loc_fk` (`zipcode`),
  KEY `idx_szipcode` (`zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'ABC factory','9511 University','block2',222222),(2,'ABC factory','9511 UT','block2',222222),(3,'XYZ factory','2016 JK drive','Elm street',44444);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_dispatch_carton`
--

DROP TABLE IF EXISTS `supplier_dispatch_carton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_dispatch_carton` (
  `carton_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  PRIMARY KEY (`carton_id`),
  KEY `fk_p` (`po_id`),
  CONSTRAINT `supplier_dispatch_carton_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_dispatch_carton`
--

LOCK TABLES `supplier_dispatch_carton` WRITE;
/*!40000 ALTER TABLE `supplier_dispatch_carton` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_dispatch_carton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_dispatch_carton_item`
--

DROP TABLE IF EXISTS `supplier_dispatch_carton_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_dispatch_carton_item` (
  `carton_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`carton_id`,`item_id`),
  KEY `fk_i` (`item_id`),
  CONSTRAINT `supplier_dispatch_carton_item_ibfk_1` FOREIGN KEY (`carton_id`) REFERENCES `supplier_dispatch_carton` (`carton_id`),
  CONSTRAINT `supplier_dispatch_carton_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_dispatch_carton_item`
--

LOCK TABLES `supplier_dispatch_carton_item` WRITE;
/*!40000 ALTER TABLE `supplier_dispatch_carton_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_dispatch_carton_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_representative`
--

DROP TABLE IF EXISTS `supplier_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_representative` (
  `uid` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `idx_supplier_id` (`supplier_id`),
  CONSTRAINT `supplier_representative_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `supplier_representative_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_representative`
--

LOCK TABLES `supplier_representative` WRITE;
/*!40000 ALTER TABLE `supplier_representative` DISABLE KEYS */;
INSERT INTO `supplier_representative` VALUES (12,1),(13,2),(14,3);
/*!40000 ALTER TABLE `supplier_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_stock`
--

DROP TABLE IF EXISTS `supplier_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_stock` (
  `supplier_id` int(3) DEFAULT NULL,
  `item_id` int(3) DEFAULT NULL,
  `quantity_available` int(3) DEFAULT NULL,
  KEY `FK_supp` (`supplier_id`),
  KEY `FK_ss` (`item_id`),
  CONSTRAINT `supplier_stock_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `supplier_stock_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_stock`
--

LOCK TABLES `supplier_stock` WRITE;
/*!40000 ALTER TABLE `supplier_stock` DISABLE KEYS */;
INSERT INTO `supplier_stock` VALUES (1,2,20),(2,4,10),(3,6,15);
/*!40000 ALTER TABLE `supplier_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `uid` int(3) NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_username` (`username`),
  KEY `idx_name` (`first_name`,`last_name`),
  KEY `idx_designation` (`designation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('vimoka','vm1','Vimoka','Nalluri',1,'Store Representative'),('raka','r1','Raka','Choudhury',2,'Store Representative'),('chinmay','c1','Chinmay','Rawool',3,'Warehouse Manager'),('nitish','n1','Nitish','Rangarajan',4,'Warehouse Manager'),('John','j1','John','Nester',5,'Store Representative'),('Cho','c1','Cho','Chang',6,'Store Representative'),('Daniel','d1','Daniel','Radcliffe',7,'Store Representative'),('james','j2','James','Wilson',8,'Store Representative'),('jennifer','j3','Jennifer','Aniston',9,'Warehouse Manager'),('angelina','a1','Angelina','Scott',10,'Warehouse Manager'),('Ashish','v1','Ashish','Choudhury',11,'POM User'),('Anurag','a2','Anurag','Kishore',12,'Supplier'),('Joey','j6','Joey','Tribbiani',13,'Supplier'),('Ross','r1','Ross','Geller',14,'Supplier');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `warehouse_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  KEY `ws_loc_fk` (`zipcode`),
  KEY `idx_zipcode` (`zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Warehouse_CLT','9511 University Terrace','John Kirk Drive','28262'),(2,'Warehouse_PH','1009 Block-2','XYZ Street','38282');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_manager`
--

DROP TABLE IF EXISTS `warehouse_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_manager` (
  `uid` int(3) NOT NULL DEFAULT '0',
  `warehouse_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `w_fk` (`warehouse_id`),
  KEY `idx_warehouse_id` (`warehouse_id`),
  CONSTRAINT `Warehouse_Manager_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  CONSTRAINT `Warehouse_Manager_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_manager`
--

LOCK TABLES `warehouse_manager` WRITE;
/*!40000 ALTER TABLE `warehouse_manager` DISABLE KEYS */;
INSERT INTO `warehouse_manager` VALUES (3,1),(4,1),(9,2),(10,2);
/*!40000 ALTER TABLE `warehouse_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_order`
--

DROP TABLE IF EXISTS `warehouse_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_order` (
  `order_id` int(3) NOT NULL,
  `item_id` int(3) NOT NULL,
  `quantity_ordered` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `fk_w_ino` (`item_id`),
  CONSTRAINT `warehouse_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`order_id`),
  CONSTRAINT `warehouse_order_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `store_order_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_order`
--

LOCK TABLES `warehouse_order` WRITE;
/*!40000 ALTER TABLE `warehouse_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_stock`
--

DROP TABLE IF EXISTS `warehouse_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_stock` (
  `warehouse_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `quantity_available` int(11) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`,`item_id`),
  KEY `ws_i_fk` (`item_id`),
  CONSTRAINT `Warehouse_Stock_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  CONSTRAINT `Warehouse_Stock_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `global_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_stock`
--

LOCK TABLES `warehouse_stock` WRITE;
/*!40000 ALTER TABLE `warehouse_stock` DISABLE KEYS */;
INSERT INTO `warehouse_stock` VALUES (1,1,0),(1,2,7),(1,3,2),(1,4,1),(1,5,1),(1,6,1);
/*!40000 ALTER TABLE `warehouse_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'retail1'
--

--
-- Dumping routines for database 'retail1'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDesignation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDesignation`(in id int(11))
BEGIN
   SELECT designation FROM user where uid=id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetItemDescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetItemDescription`(in id int(11))
BEGIN
   SELECT description FROM global_item where item_id=id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetItemName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetItemName`(in id int(11))
BEGIN
   SELECT name FROM global_item where item_id=id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsername`(in id int(11))
BEGIN
   SELECT username FROM user where uid=id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_insert_deficit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_insert_deficit`( IN carton_id INT, IN item_id INT,IN quantity int)
BEGIN
	INSERT INTO retail1.report(carton_id,item_id,report_type,quantity) 
    VALUES(carton_id,item_id,"DEFICIT",quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_insert_surplus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_insert_surplus`( IN carton_id INT, IN item_id INT,IN quantity int)
BEGIN
	INSERT INTO retail1.report(carton_id,item_id,report_type,quantity) 
    VALUES(carton_id,item_id,"SURPLUS",quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21  1:10:00
