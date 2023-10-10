DROP DATABASE IF EXISTS `phone`;
CREATE DATABASE  IF NOT EXISTS `phone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `phone`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: phone
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_pic` LONGTEXT DEFAULT NULL,
  `product_q` int(11) DEFAULT '1',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'xxx@gmail.com','IPhone14',NULL,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cartview`
--

DROP TABLE IF EXISTS `cartview`;
/*!50001 DROP VIEW IF EXISTS `cartview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cartview` AS SELECT 
 1 AS `cid`,
 1 AS `email`,
 1 AS `product_name`,
 1 AS `product_pic`,
 1 AS `product_price`,
 1 AS `product_q`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `idea`
--

DROP TABLE IF EXISTS `idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idea` (
  `idea_id` varchar(45) NOT NULL,
  `idea_name` varchar(45) NOT NULL,
  `idea_contents` text NOT NULL,
  `idea_pic` varchar(45) NOT NULL,
  PRIMARY KEY (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idea`
--

LOCK TABLES `idea` WRITE;
/*!40000 ALTER TABLE `idea` DISABLE KEYS */;
INSERT INTO `idea` VALUES 
('1','傅子杰','好棒好開心','front1'),
('2','張伃倢','這次是設計前端的部分，去想每一個頁面的排版真的心好累，組員太厲害了，讓我很順利的完成','front2'),
('3','簡承弘','上完這堂課感覺受益良多','front3'),
('4','黃恆嘉','挑戰自己！加油！有趣！','after1'),
('5','沈鈺芳','很有挑戰性的一次專案','after2'),
('6','何睿涵','人要衣裝，佛要金裝，手機也當然要有自己的美麗保護殼。很有趣又具有挑戰性的專案！','after3'),
('7','洪名遠','在這次專案裡獲得寶貴的經驗及難忘的回憶！','after4');
/*!40000 ALTER TABLE `idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `addr` varchar(45) DEFAULT NULL,
  `birth` date NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin@gmail.com','1234','','admin','0987654321','','2022-11-11'),('xxx@gmail.com','1234','','哈哈哈','0987654321','','2022-11-11');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `msgid` int(8) NOT NULL AUTO_INCREMENT,
  `msg_content` text NOT NULL,
  `msg_date` datetime NOT NULL,
  `star` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'有趣好玩','2023-01-18 00:00:00',4,'1234@gmail.com'),(2,'材質堅固','2023-05-05 00:00:00',5,'2345@gmail.com'),(3,'圖片印刷的不太好','2023-06-01 00:00:00',2,'3456@gmail.com');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_form`
--

DROP TABLE IF EXISTS `order_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_form` (
  `oid` int(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_pic` varchar(45) DEFAULT NULL,
  `product_q` int(11) DEFAULT '1',
  `price` varchar(45) NOT NULL,
  `receiver_name` varchar(45) NOT NULL,
  `city` varchar(10) NOT NULL,
  `receiver_address` varchar(45) NOT NULL,
  `receiver_tel` varchar(45) NOT NULL,
  `memo` text,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_form`
--

LOCK TABLES `order_form` WRITE;
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` VALUES (1,'f_ish','IPhone13',NULL,1,'350','小fish','LONDON','你猜呀','0968681101','好好做'),(2,'little_ffish','IPhone13',NULL,1,'350','small魚','NEW YORK','我還沒有買房子','0968681101','想尖叫');
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int(8) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `product_note` varchar(45) DEFAULT NULL,
  `product_price` int(6) DEFAULT NULL,
  `product_pic` varchar(45) DEFAULT '',
  `product_q` int(6) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'IPhone14',NULL,140,'14',63),(2,'IPhone13',NULL,130,'13',47),(3,'IPhone12',NULL,120,'12',89),(4,'IPhone11',NULL,110,'11',66),(5,'IPhone10',NULL,100,'10',45),(6,'IPhone9',NULL,90,'9',88);
#(7,'IPhone8',NULL,80,'8',50)
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cartview`
--

/*!50001 DROP VIEW IF EXISTS `cartview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cartview` AS select `cart`.`cid` AS `cid`,`cart`.`email` AS `email`,`cart`.`product_name` AS `product_name`,`cart`.`product_pic` AS `product_pic`,`product`.`product_price` AS `product_price`,`cart`.`product_q` AS `product_q` from (`cart` join `product` on((`product`.`product_name` = `cart`.`product_name`))) */;
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

-- Dump completed on 2023-06-10  4:36:33
