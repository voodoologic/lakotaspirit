-- MySQL dump 10.13  Distrib 5.1.47, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: akamados_lakotadev
-- ------------------------------------------------------
-- Server version	5.1.47-community-log

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,1,16,75,7,'2010-09-01 20:24:53','2010-09-02 02:07:14'),(2,1,18,75,2,'2010-09-02 01:20:32','2010-09-02 01:21:20'),(3,1,19,75,1,'2010-09-02 01:21:44','2010-09-02 01:21:44'),(4,1,20,75,1,'2010-09-02 01:26:11','2010-09-02 01:26:11'),(5,2,20,16,1,'2010-09-02 01:29:34','2010-09-02 01:29:34'),(6,2,21,16,2,'2010-09-02 01:54:49','2010-09-02 01:54:50'),(7,2,16,16,5,'2010-09-02 02:00:49','2010-09-02 02:00:55'),(8,3,16,0,3,'2010-09-02 02:06:02','2010-09-02 02:29:46'),(9,5,16,8,1,'2010-09-02 02:06:20','2010-09-02 02:06:20'),(10,12,16,NULL,1,'2010-09-02 02:29:33','2010-09-02 02:29:33'),(11,3,22,0,1,'2010-09-02 02:41:05','2010-09-02 02:41:05'),(12,2,22,16,1,'2010-09-02 02:41:13','2010-09-02 02:41:13'),(13,2,23,16,4,'2010-09-02 03:12:26','2010-09-02 04:17:33'),(14,3,23,0,11,'2010-09-02 03:24:02','2010-09-02 04:02:38'),(15,1,23,75,2,'2010-09-02 03:37:46','2010-09-02 04:03:40'),(16,27,23,NULL,1,'2010-09-02 04:29:19','2010-09-02 04:29:19'),(17,1,25,75,2,'2010-09-02 04:53:15','2010-09-02 05:50:38'),(18,2,25,16,1,'2010-09-02 05:06:20','2010-09-02 05:06:20'),(19,1,30,75,5,'2010-09-03 20:39:09','2010-09-03 20:56:31'),(20,3,30,0,9,'2010-09-03 20:41:05','2010-09-03 21:16:43'),(21,2,30,16,3,'2010-09-03 20:54:55','2010-09-03 21:19:32'),(22,4,30,0,1,'2010-09-03 20:56:51','2010-09-03 20:56:51'),(23,5,30,8,1,'2010-09-03 20:57:00','2010-09-03 20:57:00'),(24,7,30,150,4,'2010-09-03 21:20:31','2010-09-03 22:12:11'),(25,8,30,0,2,'2010-09-03 21:55:09','2010-09-03 23:02:49'),(26,9,30,NULL,2,'2010-09-03 23:02:59','2010-09-03 23:03:22'),(27,31,32,50,1,'2010-09-03 23:21:28','2010-09-03 23:21:28'),(28,33,32,50,1,'2010-09-03 23:21:36','2010-09-03 23:21:36'),(29,32,32,50,2,'2010-09-03 23:21:39','2010-09-03 23:21:42'),(30,14,32,50,2,'2010-09-03 23:22:48','2010-09-03 23:22:54'),(31,2,32,16,1,'2010-09-04 01:20:37','2010-09-04 01:20:37'),(40,4,35,0,2,'2010-09-05 20:33:37','2010-09-05 20:33:42'),(41,5,35,8,1,'2010-09-05 20:33:46','2010-09-05 20:33:46'),(52,2,36,16,1,'2010-09-05 22:36:44','2010-09-05 22:36:44'),(57,21,34,50,1,'2010-09-06 04:05:59','2010-09-06 04:12:31'),(61,1,36,75,1,'2010-09-06 04:23:55','2010-09-06 04:23:55'),(62,4,36,0,2,'2010-09-06 04:24:02','2010-09-06 04:29:14'),(67,2,34,16,6,'2010-09-06 10:24:00','2010-09-07 02:19:19'),(72,2,44,16,1,'2010-09-08 08:26:55','2010-09-08 08:30:56'),(73,3,46,0,1,'2010-09-14 15:48:45','2010-09-14 15:48:45'),(79,8,54,50,1,'2010-09-25 18:02:50','2010-09-25 18:02:50'),(80,3,62,0,1,'2010-10-01 11:05:03','2010-10-01 11:05:03'),(81,3,64,0,1,'2010-10-01 11:05:06','2010-10-01 11:05:06'),(82,3,66,0,1,'2010-10-01 11:05:19','2010-10-01 11:05:19'),(83,3,68,0,1,'2010-10-01 11:05:20','2010-10-01 11:05:20'),(84,3,70,0,1,'2010-10-01 11:05:24','2010-10-01 11:05:24'),(85,3,76,0,1,'2010-10-01 11:05:48','2010-10-01 11:05:48'),(86,3,78,0,1,'2010-10-01 11:05:51','2010-10-01 11:05:51'),(87,3,82,0,1,'2010-10-01 11:06:06','2010-10-01 11:06:06'),(88,3,86,0,1,'2010-10-01 11:08:16','2010-10-01 11:08:16'),(89,3,90,0,1,'2010-10-01 11:08:20','2010-10-01 11:08:20'),(90,3,94,0,1,'2010-10-01 11:09:40','2010-10-01 11:09:40'),(91,3,102,0,1,'2010-10-01 11:14:58','2010-10-01 11:14:58'),(92,3,106,0,1,'2010-10-01 11:20:07','2010-10-01 11:20:07'),(101,1,111,75,1,'2010-10-01 12:13:55','2010-10-01 12:13:55'),(102,2,111,16,1,'2010-10-01 12:14:20','2010-10-01 12:14:20'),(116,5,110,8,3,'2010-10-01 13:17:39','2010-10-01 13:17:46'),(123,2,112,16,1,'2010-10-02 19:54:26','2010-10-02 19:54:26'),(124,1,112,75,1,'2010-10-02 20:48:23','2010-10-02 20:48:23'),(132,2,115,16,1,'2010-10-03 10:57:17','2010-10-03 10:57:17'),(133,3,115,0,1,'2010-10-03 10:57:22','2010-10-03 10:57:22'),(134,5,115,8,1,'2010-10-03 10:57:38','2010-10-03 10:57:38'),(136,7,109,150,1,'2010-10-04 03:08:46','2010-10-04 03:08:46'),(138,9,109,50,1,'2010-10-04 03:08:55','2010-10-04 03:08:55'),(139,3,116,0,1,'2010-10-04 22:55:23','2010-10-04 22:55:23'),(140,2,116,16,1,'2010-10-04 22:55:25','2010-10-04 22:55:25'),(141,5,116,8,1,'2010-10-04 22:55:32','2010-10-04 22:55:32'),(142,1,120,75,1,'2010-10-06 00:12:41','2010-10-06 00:12:41'),(143,2,120,16,1,'2010-10-06 00:12:41','2010-10-06 00:12:41'),(144,3,120,0,1,'2010-10-06 00:12:42','2010-10-06 00:12:42'),(149,11,159,50,1,'2010-10-29 21:35:32','2010-10-29 21:35:32'),(150,2,159,16,1,'2010-10-29 21:35:33','2010-10-29 21:35:33'),(152,4,194,0,1,'2010-11-11 19:11:21','2010-11-11 19:11:21'),(153,3,194,0,1,'2010-11-11 19:11:31','2010-11-11 19:11:31'),(154,6,194,13,1,'2010-11-11 19:11:57','2010-11-11 19:11:57'),(155,9,202,50,1,'2010-11-16 00:26:14','2010-11-16 00:26:14'),(156,34,235,50,1,'2010-12-01 06:03:15','2010-12-01 06:03:15'),(158,2,245,16,1,'2010-12-02 21:33:39','2010-12-02 21:33:39'),(160,1,256,75,1,'2010-12-14 22:43:20','2010-12-14 22:43:20'),(161,3,256,0,1,'2010-12-15 00:57:22','2010-12-15 00:57:22'),(162,3,259,0,1,'2010-12-15 04:37:15','2010-12-15 04:37:15'),(163,2,259,49,1,'2010-12-15 04:37:16','2010-12-15 04:37:16'),(164,1,259,75,1,'2010-12-15 04:37:18','2010-12-15 04:37:18'),(165,6,257,13,1,'2010-12-15 07:14:58','2010-12-15 07:14:58'),(166,5,262,8,1,'2010-12-15 21:12:32','2010-12-15 21:12:32');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2010-08-26 01:13:39','2010-08-26 01:13:39'),(2,'2010-08-26 02:05:25','2010-08-26 02:05:25'),(3,'2010-08-26 05:32:07','2010-08-26 05:32:07'),(4,'2010-08-26 22:15:57','2010-08-26 22:15:57'),(5,'2010-08-27 00:36:46','2010-08-27 00:36:46'),(6,'2010-08-27 19:29:03','2010-08-27 19:29:03'),(7,'2010-08-28 07:29:46','2010-08-28 07:29:46'),(8,'2010-08-28 20:06:51','2010-08-28 20:06:51'),(9,'2010-08-30 11:51:56','2010-08-30 11:51:56'),(10,'2010-08-30 17:40:52','2010-08-30 17:40:52'),(11,'2010-08-30 17:40:53','2010-08-30 17:40:53'),(12,'2010-08-30 17:40:54','2010-08-30 17:40:54'),(13,'2010-08-30 19:36:53','2010-08-30 19:36:53'),(14,'2010-08-31 20:26:09','2010-08-31 20:26:09'),(15,'2010-08-31 21:24:52','2010-08-31 21:24:52'),(16,'2010-09-01 19:19:44','2010-09-01 19:19:44'),(17,'2010-09-01 20:03:28','2010-09-01 20:03:28'),(18,'2010-09-02 01:07:50','2010-09-02 01:07:50'),(19,'2010-09-02 01:21:38','2010-09-02 01:21:38'),(20,'2010-09-02 01:25:56','2010-09-02 01:25:56'),(21,'2010-09-02 01:54:45','2010-09-02 01:54:45'),(22,'2010-09-02 02:41:01','2010-09-02 02:41:01'),(23,'2010-09-02 03:12:14','2010-09-02 03:12:14'),(24,'2010-09-02 04:22:35','2010-09-02 04:22:35'),(25,'2010-09-02 04:30:33','2010-09-02 04:30:33'),(26,'2010-09-02 05:25:51','2010-09-02 05:25:51'),(27,'2010-09-02 05:52:08','2010-09-02 05:52:08'),(28,'2010-09-02 05:56:52','2010-09-02 05:56:52'),(29,'2010-09-03 04:32:30','2010-09-03 04:32:30'),(30,'2010-09-03 19:54:54','2010-09-03 19:54:54'),(31,'2010-09-03 20:37:56','2010-09-03 20:37:56'),(32,'2010-09-03 23:13:05','2010-09-03 23:13:05'),(33,'2010-09-04 15:42:18','2010-09-04 15:42:18'),(34,'2010-09-05 19:33:42','2010-09-05 19:33:42'),(35,'2010-09-05 20:33:16','2010-09-05 20:33:16'),(36,'2010-09-05 22:36:17','2010-09-05 22:36:17'),(37,'2010-09-06 20:12:31','2010-09-06 20:12:31'),(38,'2010-09-06 21:38:04','2010-09-06 21:38:04'),(39,'2010-09-07 06:54:07','2010-09-07 06:54:07'),(40,'2010-09-07 14:07:33','2010-09-07 14:07:33'),(41,'2010-09-08 01:47:10','2010-09-08 01:47:10'),(42,'2010-09-08 02:01:04','2010-09-08 02:01:04'),(43,'2010-09-08 05:30:08','2010-09-08 05:30:08'),(44,'2010-09-08 08:26:48','2010-09-08 08:26:48'),(45,'2010-09-12 21:04:58','2010-09-12 21:04:58'),(46,'2010-09-14 15:48:25','2010-09-14 15:48:25'),(47,'2010-09-14 23:41:02','2010-09-14 23:41:02'),(48,'2010-09-15 12:32:54','2010-09-15 12:32:54'),(49,'2010-09-16 16:25:48','2010-09-16 16:25:48'),(50,'2010-09-17 17:34:31','2010-09-17 17:34:31'),(51,'2010-09-19 12:02:30','2010-09-19 12:02:30'),(52,'2010-09-20 19:05:06','2010-09-20 19:05:06'),(53,'2010-09-23 04:05:20','2010-09-23 04:05:20'),(54,'2010-09-25 04:04:29','2010-09-25 04:04:29'),(55,'2010-09-25 21:37:05','2010-09-25 21:37:05'),(56,'2010-09-26 03:54:58','2010-09-26 03:54:58'),(57,'2010-10-01 11:04:59','2010-10-01 11:04:59'),(58,'2010-10-01 11:04:59','2010-10-01 11:04:59'),(59,'2010-10-01 11:05:01','2010-10-01 11:05:01'),(60,'2010-10-01 11:05:01','2010-10-01 11:05:01'),(61,'2010-10-01 11:05:03','2010-10-01 11:05:03'),(62,'2010-10-01 11:05:03','2010-10-01 11:05:03'),(63,'2010-10-01 11:05:06','2010-10-01 11:05:06'),(64,'2010-10-01 11:05:06','2010-10-01 11:05:06'),(65,'2010-10-01 11:05:18','2010-10-01 11:05:18'),(66,'2010-10-01 11:05:19','2010-10-01 11:05:19'),(67,'2010-10-01 11:05:20','2010-10-01 11:05:20'),(68,'2010-10-01 11:05:20','2010-10-01 11:05:20'),(69,'2010-10-01 11:05:24','2010-10-01 11:05:24'),(70,'2010-10-01 11:05:24','2010-10-01 11:05:24'),(71,'2010-10-01 11:05:29','2010-10-01 11:05:29'),(72,'2010-10-01 11:05:29','2010-10-01 11:05:29'),(73,'2010-10-01 11:05:42','2010-10-01 11:05:42'),(74,'2010-10-01 11:05:42','2010-10-01 11:05:42'),(75,'2010-10-01 11:05:48','2010-10-01 11:05:48'),(76,'2010-10-01 11:05:48','2010-10-01 11:05:48'),(77,'2010-10-01 11:05:50','2010-10-01 11:05:50'),(78,'2010-10-01 11:05:50','2010-10-01 11:05:50'),(79,'2010-10-01 11:05:54','2010-10-01 11:05:54'),(80,'2010-10-01 11:05:54','2010-10-01 11:05:54'),(81,'2010-10-01 11:06:06','2010-10-01 11:06:06'),(82,'2010-10-01 11:06:06','2010-10-01 11:06:06'),(83,'2010-10-01 11:06:07','2010-10-01 11:06:07'),(84,'2010-10-01 11:06:07','2010-10-01 11:06:07'),(85,'2010-10-01 11:08:15','2010-10-01 11:08:15'),(86,'2010-10-01 11:08:15','2010-10-01 11:08:15'),(87,'2010-10-01 11:08:18','2010-10-01 11:08:18'),(88,'2010-10-01 11:08:18','2010-10-01 11:08:18'),(89,'2010-10-01 11:08:20','2010-10-01 11:08:20'),(90,'2010-10-01 11:08:20','2010-10-01 11:08:20'),(91,'2010-10-01 11:08:23','2010-10-01 11:08:23'),(92,'2010-10-01 11:08:23','2010-10-01 11:08:23'),(93,'2010-10-01 11:09:40','2010-10-01 11:09:40'),(94,'2010-10-01 11:09:40','2010-10-01 11:09:40'),(95,'2010-10-01 11:09:44','2010-10-01 11:09:44'),(96,'2010-10-01 11:09:44','2010-10-01 11:09:44'),(97,'2010-10-01 11:09:55','2010-10-01 11:09:55'),(98,'2010-10-01 11:09:55','2010-10-01 11:09:55'),(99,'2010-10-01 11:14:45','2010-10-01 11:14:45'),(100,'2010-10-01 11:14:45','2010-10-01 11:14:45'),(101,'2010-10-01 11:14:58','2010-10-01 11:14:58'),(102,'2010-10-01 11:14:58','2010-10-01 11:14:58'),(103,'2010-10-01 11:15:02','2010-10-01 11:15:02'),(104,'2010-10-01 11:15:03','2010-10-01 11:15:03'),(105,'2010-10-01 11:20:07','2010-10-01 11:20:07'),(106,'2010-10-01 11:20:07','2010-10-01 11:20:07'),(107,'2010-10-01 11:20:09','2010-10-01 11:20:09'),(108,'2010-10-01 11:20:10','2010-10-01 11:20:10'),(109,'2010-10-01 11:20:43','2010-10-01 11:20:43'),(110,'2010-10-01 11:59:09','2010-10-01 11:59:09'),(111,'2010-10-01 12:13:44','2010-10-01 12:13:44'),(112,'2010-10-02 19:42:18','2010-10-02 19:42:18'),(113,'2010-10-02 20:35:59','2010-10-02 20:35:59'),(114,'2010-10-03 00:35:20','2010-10-03 00:35:20'),(115,'2010-10-03 02:29:48','2010-10-03 02:29:48'),(116,'2010-10-04 22:55:03','2010-10-04 22:55:03'),(117,'2010-10-05 05:04:32','2010-10-05 05:04:32'),(118,'2010-10-05 10:37:57','2010-10-05 10:37:57'),(119,'2010-10-05 18:25:32','2010-10-05 18:25:32'),(120,'2010-10-06 00:12:37','2010-10-06 00:12:37'),(121,'2010-10-06 06:09:49','2010-10-06 06:09:49'),(122,'2010-10-06 11:01:33','2010-10-06 11:01:33'),(123,'2010-10-07 07:21:43','2010-10-07 07:21:43'),(124,'2010-10-08 01:33:10','2010-10-08 01:33:10'),(125,'2010-10-08 02:49:57','2010-10-08 02:49:57'),(126,'2010-10-09 01:59:45','2010-10-09 01:59:45'),(127,'2010-10-10 02:36:34','2010-10-10 02:36:34'),(128,'2010-10-10 05:38:18','2010-10-10 05:38:18'),(129,'2010-10-10 18:13:41','2010-10-10 18:13:41'),(130,'2010-10-11 11:03:27','2010-10-11 11:03:27'),(131,'2010-10-11 11:03:28','2010-10-11 11:03:28'),(132,'2010-10-11 11:03:28','2010-10-11 11:03:28'),(133,'2010-10-12 15:03:10','2010-10-12 15:03:10'),(134,'2010-10-12 20:34:01','2010-10-12 20:34:01'),(135,'2010-10-15 06:21:25','2010-10-15 06:21:25'),(136,'2010-10-15 20:45:50','2010-10-15 20:45:50'),(137,'2010-10-16 09:52:42','2010-10-16 09:52:42'),(138,'2010-10-16 09:52:42','2010-10-16 09:52:42'),(139,'2010-10-20 23:08:24','2010-10-20 23:08:24'),(140,'2010-10-21 18:35:44','2010-10-21 18:35:44'),(141,'2010-10-22 07:05:54','2010-10-22 07:05:54'),(142,'2010-10-22 22:34:06','2010-10-22 22:34:06'),(143,'2010-10-23 12:13:40','2010-10-23 12:13:40'),(144,'2010-10-25 18:06:22','2010-10-25 18:06:22'),(145,'2010-10-25 18:31:13','2010-10-25 18:31:13'),(146,'2010-10-25 19:50:14','2010-10-25 19:50:14'),(147,'2010-10-26 01:23:53','2010-10-26 01:23:53'),(148,'2010-10-26 04:34:39','2010-10-26 04:34:39'),(149,'2010-10-26 20:06:30','2010-10-26 20:06:30'),(150,'2010-10-27 03:06:40','2010-10-27 03:06:40'),(151,'2010-10-27 05:40:11','2010-10-27 05:40:11'),(152,'2010-10-27 05:50:56','2010-10-27 05:50:56'),(153,'2010-10-27 13:36:36','2010-10-27 13:36:36'),(154,'2010-10-27 21:16:51','2010-10-27 21:16:51'),(155,'2010-10-28 17:05:52','2010-10-28 17:05:52'),(156,'2010-10-28 17:16:17','2010-10-28 17:16:17'),(157,'2010-10-28 20:31:50','2010-10-28 20:31:50'),(158,'2010-10-29 04:43:11','2010-10-29 04:43:11'),(159,'2010-10-29 21:29:18','2010-10-29 21:29:18'),(160,'2010-10-30 05:05:43','2010-10-30 05:05:43'),(161,'2010-10-30 05:07:29','2010-10-30 05:07:29'),(162,'2010-10-30 05:07:34','2010-10-30 05:07:34'),(163,'2010-10-30 05:07:47','2010-10-30 05:07:47'),(164,'2010-10-30 05:07:51','2010-10-30 05:07:51'),(165,'2010-10-30 05:08:07','2010-10-30 05:08:07'),(166,'2010-10-30 05:08:19','2010-10-30 05:08:19'),(167,'2010-10-30 05:08:21','2010-10-30 05:08:21'),(168,'2010-10-30 05:09:48','2010-10-30 05:09:48'),(169,'2010-10-30 05:09:59','2010-10-30 05:09:59'),(170,'2010-10-30 05:10:02','2010-10-30 05:10:02'),(171,'2010-10-30 05:10:22','2010-10-30 05:10:22'),(172,'2010-10-30 05:10:25','2010-10-30 05:10:25'),(173,'2010-10-30 05:10:37','2010-10-30 05:10:37'),(174,'2010-10-30 05:11:19','2010-10-30 05:11:19'),(175,'2010-10-30 05:11:19','2010-10-30 05:11:19'),(176,'2010-10-30 05:12:03','2010-10-30 05:12:03'),(177,'2010-10-30 05:12:03','2010-10-30 05:12:03'),(178,'2010-10-31 00:41:37','2010-10-31 00:41:37'),(179,'2010-10-31 16:36:06','2010-10-31 16:36:06'),(180,'2010-10-31 20:36:53','2010-10-31 20:36:53'),(181,'2010-11-01 05:52:51','2010-11-01 05:52:51'),(182,'2010-11-01 05:53:43','2010-11-01 05:53:43'),(183,'2010-11-04 00:34:43','2010-11-04 00:34:43'),(184,'2010-11-04 04:58:10','2010-11-04 04:58:10'),(185,'2010-11-04 07:52:32','2010-11-04 07:52:32'),(186,'2010-11-04 07:52:33','2010-11-04 07:52:33'),(187,'2010-11-06 04:02:51','2010-11-06 04:02:51'),(188,'2010-11-09 19:22:43','2010-11-09 19:22:43'),(189,'2010-11-09 21:56:15','2010-11-09 21:56:15'),(190,'2010-11-10 01:30:44','2010-11-10 01:30:44'),(191,'2010-11-10 05:52:55','2010-11-10 05:52:55'),(192,'2010-11-11 18:47:24','2010-11-11 18:47:24'),(193,'2010-11-11 19:00:47','2010-11-11 19:00:47'),(194,'2010-11-11 19:08:07','2010-11-11 19:08:07'),(195,'2010-11-12 22:58:36','2010-11-12 22:58:36'),(196,'2010-11-13 13:12:02','2010-11-13 13:12:02'),(197,'2010-11-13 19:05:46','2010-11-13 19:05:46'),(198,'2010-11-13 19:08:21','2010-11-13 19:08:21'),(199,'2010-11-15 01:19:20','2010-11-15 01:19:20'),(200,'2010-11-15 01:57:31','2010-11-15 01:57:31'),(201,'2010-11-15 08:06:32','2010-11-15 08:06:32'),(202,'2010-11-15 23:54:52','2010-11-15 23:54:52'),(203,'2010-11-16 16:55:21','2010-11-16 16:55:21'),(204,'2010-11-16 16:55:42','2010-11-16 16:55:42'),(205,'2010-11-17 10:03:46','2010-11-17 10:03:46'),(206,'2010-11-19 22:15:28','2010-11-19 22:15:28'),(207,'2010-11-20 15:32:44','2010-11-20 15:32:44'),(208,'2010-11-22 21:43:48','2010-11-22 21:43:48'),(209,'2010-11-22 23:10:38','2010-11-22 23:10:38'),(210,'2010-11-24 13:14:11','2010-11-24 13:14:11'),(211,'2010-11-24 13:15:56','2010-11-24 13:15:56'),(212,'2010-11-24 13:15:58','2010-11-24 13:15:58'),(213,'2010-11-24 13:16:03','2010-11-24 13:16:03'),(214,'2010-11-24 13:16:05','2010-11-24 13:16:05'),(215,'2010-11-24 13:16:10','2010-11-24 13:16:10'),(216,'2010-11-24 13:16:15','2010-11-24 13:16:15'),(217,'2010-11-24 13:16:16','2010-11-24 13:16:16'),(218,'2010-11-24 13:16:19','2010-11-24 13:16:19'),(219,'2010-11-24 13:16:21','2010-11-24 13:16:21'),(220,'2010-11-24 13:16:26','2010-11-24 13:16:26'),(221,'2010-11-24 13:16:26','2010-11-24 13:16:26'),(222,'2010-11-24 13:16:30','2010-11-24 13:16:30'),(223,'2010-11-24 13:16:31','2010-11-24 13:16:31'),(224,'2010-11-24 13:16:35','2010-11-24 13:16:35'),(225,'2010-11-24 13:16:35','2010-11-24 13:16:35'),(226,'2010-11-24 13:16:40','2010-11-24 13:16:40'),(227,'2010-11-24 13:16:42','2010-11-24 13:16:42'),(228,'2010-11-24 13:16:43','2010-11-24 13:16:43'),(229,'2010-11-26 21:54:31','2010-11-26 21:54:31'),(230,'2010-11-27 21:10:26','2010-11-27 21:10:26'),(231,'2010-11-29 19:06:44','2010-11-29 19:06:44'),(232,'2010-11-30 18:43:48','2010-11-30 18:43:48'),(233,'2010-11-30 21:26:04','2010-11-30 21:26:04'),(234,'2010-12-01 03:26:29','2010-12-01 03:26:29'),(235,'2010-12-01 05:59:39','2010-12-01 05:59:39'),(236,'2010-12-01 21:12:18','2010-12-01 21:12:18'),(237,'2010-12-01 21:12:35','2010-12-01 21:12:35'),(238,'2010-12-01 21:12:39','2010-12-01 21:12:39'),(239,'2010-12-02 14:30:18','2010-12-02 14:30:18'),(240,'2010-12-02 16:41:29','2010-12-02 16:41:29'),(241,'2010-12-02 17:15:10','2010-12-02 17:15:10'),(242,'2010-12-02 20:59:42','2010-12-02 20:59:42'),(243,'2010-12-02 20:59:43','2010-12-02 20:59:43'),(244,'2010-12-02 20:59:44','2010-12-02 20:59:44'),(245,'2010-12-02 21:33:25','2010-12-02 21:33:25'),(246,'2010-12-03 00:31:37','2010-12-03 00:31:37'),(247,'2010-12-04 00:34:16','2010-12-04 00:34:16'),(248,'2010-12-07 19:41:26','2010-12-07 19:41:26'),(249,'2010-12-08 21:58:21','2010-12-08 21:58:21'),(250,'2010-12-09 04:05:26','2010-12-09 04:05:26'),(251,'2010-12-09 18:56:31','2010-12-09 18:56:31'),(252,'2010-12-11 11:13:56','2010-12-11 11:13:56'),(253,'2010-12-13 20:31:29','2010-12-13 20:31:29'),(254,'2010-12-13 22:01:17','2010-12-13 22:01:17'),(255,'2010-12-14 03:46:07','2010-12-14 03:46:07'),(256,'2010-12-14 19:57:09','2010-12-14 19:57:09'),(257,'2010-12-14 20:41:44','2010-12-14 20:41:44'),(258,'2010-12-14 22:54:52','2010-12-14 22:54:52'),(259,'2010-12-15 04:05:40','2010-12-15 04:05:40'),(260,'2010-12-15 05:40:42','2010-12-15 05:40:42'),(261,'2010-12-15 17:46:55','2010-12-15 17:46:55'),(262,'2010-12-15 21:09:49','2010-12-15 21:09:49'),(263,'2010-12-16 05:33:34','2010-12-16 05:33:34'),(264,'2010-12-16 09:01:16','2010-12-16 09:01:16'),(265,'2010-12-16 09:01:16','2010-12-16 09:01:16'),(266,'2010-12-16 10:05:03','2010-12-16 10:05:03'),(267,'2010-12-16 20:04:22','2010-12-16 20:04:22'),(268,'2010-12-17 14:29:30','2010-12-17 14:29:30'),(269,'2010-12-18 16:45:26','2010-12-18 16:45:26'),(270,'2010-12-19 09:12:15','2010-12-19 09:12:15'),(271,'2010-12-26 17:44:50','2010-12-26 17:44:50'),(272,'2010-12-28 21:17:46','2010-12-28 21:17:46'),(273,'2010-12-29 19:09:43','2010-12-29 19:09:43'),(274,'2010-12-30 03:39:16','2010-12-30 03:39:16'),(275,'2010-12-30 19:57:27','2010-12-30 19:57:27'),(276,'2010-12-31 19:55:21','2010-12-31 19:55:21'),(277,'2010-12-31 20:55:15','2010-12-31 20:55:15'),(278,'2011-01-01 13:41:35','2011-01-01 13:41:35'),(279,'2011-01-01 13:42:15','2011-01-01 13:42:15'),(280,'2011-01-01 13:42:22','2011-01-01 13:42:22'),(281,'2011-01-01 13:42:24','2011-01-01 13:42:24'),(282,'2011-01-01 13:42:32','2011-01-01 13:42:32'),(283,'2011-01-01 13:42:38','2011-01-01 13:42:38'),(284,'2011-01-01 13:42:39','2011-01-01 13:42:39'),(285,'2011-01-01 13:42:44','2011-01-01 13:42:44'),(286,'2011-01-01 13:42:46','2011-01-01 13:42:46'),(287,'2011-01-01 13:42:54','2011-01-01 13:42:54'),(288,'2011-01-01 13:42:55','2011-01-01 13:42:55'),(289,'2011-01-01 13:42:59','2011-01-01 13:42:59'),(290,'2011-01-01 13:42:59','2011-01-01 13:42:59'),(291,'2011-01-01 13:43:01','2011-01-01 13:43:01'),(292,'2011-01-01 13:43:07','2011-01-01 13:43:07'),(293,'2011-01-01 13:43:08','2011-01-01 13:43:08'),(294,'2011-01-01 13:43:10','2011-01-01 13:43:10'),(295,'2011-01-01 13:43:11','2011-01-01 13:43:11'),(296,'2011-01-01 13:43:12','2011-01-01 13:43:12'),(297,'2011-01-01 13:43:14','2011-01-01 13:43:14'),(298,'2011-01-01 13:43:14','2011-01-01 13:43:14');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `short_description` text,
  `price` float DEFAULT NULL,
  `style_slightly_vary` tinyint(1) DEFAULT NULL,
  `native_style` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `quantity` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Zuni offering bowl','pottery',NULL,'','see following item for a full description.',0,1,1,'2010-07-04 19:17:04','2010-12-15 04:37:44','DSC03561.JPG','image/jpeg',1850212,'2010-08-18 01:48:22',1,2,1),(2,'Zuni offering bowl','pottery',NULL,'approx 4\"x 3\"','This is a handmade offering bowl. It was made using the \"coil\" method and given it\'s smooth finish by polishing with a rounded river rock. The fine parallel lines represent failing rain, which nurture the growing seedling seen unfurling. The fine lines are painted using a single piece of yucca grass. The dappled terra cotta paint was applied and allowed to be spattered by a rain shower. This type of offering bowl is used by the Zuni during prayers for life giving rain. This is a unique one of a kind piece of artwork.',49,1,1,'2010-07-09 23:48:52','2010-12-15 04:40:08','DSC03560.JPG','image/jpeg',1948471,'2010-08-18 02:01:01',1,2,1),(3,'Fetish necklace with Zuni Bears','necklace',NULL,'25 inches','The Bear is a symbol of protection and good health. When a fetish necklace is worn it is done in the hope that the representative animals\' spirit will imbue the wearer with positive energies.\r\nThe Bears are carved from black jet. Black being the colour of our ancestors. The inlaid turquoise heart lines represent a long life. The necklace is strung with red coral hei\'shi beads and turquoise nuggets. Turquoise is considered a stone of heavens\' blessing and red represents the human spirit.                                                                                            This necklace is a powerful symbol, wear it in good health.',0,1,1,'2010-07-10 03:52:19','2010-12-15 06:36:01','DSC02230.JPG','image/jpeg',123305,'2010-08-18 02:13:09',1,2,1),(4,'kachina doll','katchina',NULL,'20\'','Dancing guy',0,0,0,'2010-07-19 16:00:19','2010-11-04 00:46:35','DSC02218.JPG','image/jpeg',122266,'2010-08-18 02:12:32',1,1,1),(5,'claw necklace','necklace',NULL,'','Here is where the description goes',8,0,0,'2010-08-19 04:59:22','2010-10-01 13:01:49','DSC02760.JPG','image/jpeg',1809595,'2010-08-19 04:59:17',1,1,3),(6,'Fossil Shell Necklace','necklace',NULL,'','',13,0,0,'2010-08-19 06:56:07','2010-08-25 20:30:46','DSC02722.JPG','image/jpeg',1971757,'2010-08-19 06:56:01',1,1,1),(7,'Mastadon Ivory','necklace',NULL,'','short description',150,0,0,'2010-08-19 06:59:40','2010-10-27 07:35:23','DSC02729.JPG','image/jpeg',1706201,'2010-08-19 06:59:35',1,1,1),(8,'lakota jewelry','necklace',NULL,'','Short description of product',50,0,0,'2010-08-19 07:02:51','2010-10-27 07:24:46','DSC02733.JPG','image/jpeg',2027974,'2010-08-19 07:02:47',1,1,1),(9,'lakota jewelry','generic',NULL,'','',50,0,0,'2010-08-19 07:05:47','2010-11-04 00:49:42','DSC03541.JPG','image/jpeg',1756627,'2010-08-19 07:05:41',1,1,1),(10,'C Pot','generic',NULL,'','',50,0,0,'2010-08-19 07:09:35','2010-11-04 00:49:53','DSC03580_2.JPG','image/jpeg',1786327,'2010-08-19 07:09:30',2,1,1),(11,'Bear','Generic',NULL,'','blajbkldsjvlkdsjflkasdjv',50,0,0,'2010-08-19 07:12:19','2010-10-27 04:30:34','DSC03547.JPG','image/jpeg',2177497,'2010-08-19 07:12:11',1,1,1),(12,'Mud head Katchina','Katchina',NULL,'','',50,0,0,'2010-08-19 07:16:58','2010-09-03 23:11:35','DSC03660.JPG','image/jpeg',1475003,'2010-08-19 07:16:54',1,1,1),(13,'Amber necklace','necklace',NULL,'','',50,0,0,'2010-08-19 07:20:11','2010-09-03 23:11:36','DSC03734.JPG','image/jpeg',1994110,'2010-08-19 07:20:07',1,1,1),(14,'Mouse Katchina','generic',NULL,'','',50,0,0,'2010-08-19 07:23:35','2010-11-04 00:49:53','DSC03682.JPG','image/jpeg',1620441,'2010-08-19 07:23:31',1,1,1),(15,'Badger Katchina','Katchina',NULL,'','',500,0,0,'2010-08-19 07:26:41','2010-08-19 07:26:41','DSC03668.JPG','image/jpeg',1561884,'2010-08-19 07:26:37',1,1,1),(16,'Rhodachrosite Necklace','necklace',NULL,'','Short description',50,0,0,'2010-08-19 07:29:41','2010-10-27 07:29:43','DSC03725.JPG','image/jpeg',1813429,'2010-08-19 07:29:36',1,1,1),(17,'Horse Pipe','generic',NULL,'','',50,0,0,'2010-08-19 07:32:23','2010-11-04 00:49:53','DSC03698.JPG','image/jpeg',2129774,'2010-08-19 07:32:20',1,1,1),(18,'necklace','necklace',NULL,'','description',50,1,0,'2010-08-19 07:52:07','2010-10-27 07:31:50','DSC02746.JPG','image/jpeg',2010714,'2010-08-19 07:52:02',1,1,1),(19,'turquoise steer skull','artifact',NULL,'','',50,1,0,'2010-08-19 07:55:03','2010-09-03 23:11:36','DSC02990.JPG','image/jpeg',1855306,'2010-08-19 07:54:58',1,1,1),(20,'Lakota warrior hair shirt','Artifact',NULL,'','',50,1,0,'2010-08-19 07:58:22','2010-09-03 23:11:36','DSC03202.JPG','image/jpeg',2187282,'2010-08-19 07:58:17',1,1,1),(21,'sterling buckle','buckle',NULL,'','',50,1,0,'2010-08-19 08:01:37','2010-09-03 23:11:36','DSC03213.JPG','image/jpeg',2501092,'2010-08-19 08:01:31',1,1,1),(22,'Sterling turquoise claw bracelet','Antique bracelet',NULL,'','',50,1,0,'2010-08-19 08:06:34','2010-09-03 23:11:36','DSC03218.JPG','image/jpeg',2150149,'2010-08-19 08:06:26',1,1,1),(23,'Carved citrine bear','Artifact',NULL,'','',50,1,0,'2010-08-19 08:09:16','2010-09-03 23:11:36','DSC03544.JPG','image/jpeg',1701652,'2010-08-19 08:09:11',1,1,1),(24,'Handmade painted pot','Pottery',NULL,'','',50,1,0,'2010-08-19 08:12:42','2010-09-03 23:11:36','DSC03571.JPG','image/jpeg',2154006,'2010-08-19 08:12:37',1,1,1),(25,'Turquoise and Jaspernecklace','necklace',NULL,'','short description',50,1,0,'2010-08-19 08:16:58','2010-10-27 07:33:21','DSC03724.JPG','image/jpeg',2071128,'2010-08-19 08:16:54',1,1,1),(26,'Longhair Zuni Katchina','Katchina',NULL,'','',50,1,0,'2010-08-20 04:12:00','2010-09-03 23:11:36','DSC03675.JPG','image/jpeg',2087127,'2010-08-20 04:11:53',1,1,1),(27,'Sterling inlay Zuni belt buckle','belt buckle',NULL,'','',50,1,0,'2010-08-20 04:15:28','2010-09-03 23:11:36','DSC03214.JPG','image/jpeg',2282116,'2010-08-20 04:15:25',1,1,1),(28,'Longhair Zuni Katchina','Katchina',NULL,'','',50,1,0,'2010-08-20 04:21:34','2010-09-03 23:11:36','DSC03676.JPG','image/jpeg',1692647,'2010-08-20 04:21:30',1,1,1),(29,'longhair Zuni Katchina','katchina',NULL,'','',50,1,0,'2010-08-20 04:27:40','2010-09-03 23:11:36','DSC03678.JPG','image/jpeg',1781783,'2010-08-20 04:27:35',1,1,1),(30,'Katchina Hopi eagle dancer','katchina',NULL,'','',50,1,0,'2010-08-20 04:32:09','2010-09-03 23:11:36','DSC03681.JPG','image/jpeg',1731729,'2010-08-20 04:32:02',1,1,1),(31,'Katchina Hopi sun face','Katchina',NULL,'','',50,1,0,'2010-08-20 04:35:53','2010-09-03 23:11:36','DSC03694.JPG','image/jpeg',1745065,'2010-08-20 04:35:47',1,1,1),(32,'Turquoise and Jasper necklace','Necklace',NULL,'','Short description of item',50,1,0,'2010-08-20 04:40:13','2010-10-27 07:28:55','DSC03730.JPG','image/jpeg',1757466,'2010-08-20 04:40:07',1,1,1),(33,'Turquoise and Sterling cross','Pendant',NULL,'approx 2\"x2.75\"x.5\"','Hand-carved turquoise cross framed in sterling silver with heavy chain bale. reversible side has rough nugget look. This is a one of a kind piece.',35,1,0,'2010-08-20 04:43:50','2010-12-14 20:56:09','IMG_0433.JPG','image/jpeg',774521,'2010-08-20 04:43:46',1,1,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `ship_to_first_name` varchar(255) DEFAULT NULL,
  `ship_to_last_name` varchar(255) DEFAULT NULL,
  `ship_to_address` varchar(255) DEFAULT NULL,
  `ship_to_city` varchar(255) DEFAULT NULL,
  `ship_to_postal_code` varchar(255) DEFAULT NULL,
  `ship_to_country` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','home','<h1>Lakota Spirit</h1>\r\n<p><span class=\"text\">The Lakota are a spiritual and free spirited people  living on the Central Plains of The United States. LAKOTA SPIRIT brings  to you the very best of Native American artistic expression and helps  capture that sense of freedom for your own unique style.</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',1,'2010-07-10 01:13:45','2010-09-26 04:22:43',0),(2,'admin','admin','<p>Here is the body text for admin</p>\r\n<p>Go to <a title=\"Order Administration\" href=\"../../admin/order/\"><span style=\"color: #888888;\">Administration</span></a> page</p>\r\n<p>Edit <a href=\"../pages\">Pages</a></p>\r\n<p>Edit <a href=\"../../users\">Users</a></p>\r\n<p>Edit <a href=\"../../items\">Jewelry</a></p>\r\n<p>&nbsp;</p>',4,'2010-07-10 01:21:11','2010-12-14 20:45:27',1),(3,'contact','Contact Us','<h3 style=\"text-align: center;\"><span style=\"font-size: small;\">Mark \"Wolf\" Faulkins</span></h3>\r\n<p style=\"text-align: center;\"><span style=\"font-size: medium;\">415-531-5642</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: x-large;\"><a title=\"email\" href=\"http://scr.im/shunkaska\" target=\"_blank\">Email Wolf</a></span></p>',4,'2010-07-10 03:19:04','2010-08-19 02:43:31',0),(4,'about','About Us','Here it page about Lakota Spirit Jewelry ',5,'2010-07-10 03:19:44','2010-07-10 03:19:44',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_notifications`
--

DROP TABLE IF EXISTS `payment_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text,
  `cart_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_notifications`
--

LOCK TABLES `payment_notifications` WRITE;
/*!40000 ALTER TABLE `payment_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100703190728'),('20100704004023'),('20100704193019'),('20100708061623'),('20100708063445'),('20100710010854'),('20100817221115'),('20100824214331'),('20100824214339'),('20100905220901'),('20100906023344'),('20100906023514'),('20100926055539'),('20100928064822'),('20100928065302');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `persistence_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL DEFAULT '1',
  `bio` text,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Wolf','shunkaska55@yahoo.com','93b975da2061a2e3296daf88568a8875770f9b348feb3614cd9e8a5ff8c0eb7c6cb1ab43dce04280313df1ac92a515c3adf23d5fc7dc501fc106fac9ba641f75','KlKsp30fg7bzVNqWEgWE','35002b03f0f5a755312b3216203b2f12591b60165d1c76fd5c506d2fec0877bdbc416e14edd52d644905a32337e0ee2d0307b7679110a98fb8891f6a10711b6c','2010-07-09 22:06:28','2010-09-26 04:42:53','Mark','Faulkins',4,'this biography','DSC00175.JPG','image/jpeg',2613928,'2010-09-26 04:42:47'),(2,'Admin','headley.douglas@gmail.com','154ec2b59b3d0c9c79a3f4d7fe9b11350af57797073c0731d71336ce53d59b6b1148d1fd2660a568f6765c6db7ddd96142b9f542c3a4a74acfb43f01e039ba7f','KBzw8BdsF3FIIWL_XwcV','26ff1c7f17e519055be4bc41ba0998513d41cacbeb2a89ef7135b88873d4708b1c524bb5b19000e3ac3cb1f8e4c0de27dc635232242b8118e3b419415efed5ee','2010-07-09 23:21:38','2010-08-18 00:04:58','Doug','Headley',5,NULL,NULL,NULL,NULL,NULL),(3,'testmaster','fucku@fucku.com','ff071977988ecec830df48725d368d1f0913004cdbfd5ef9cbdb4a4d7b927cd391756232045c16c8ea131ee3fb26c6f84575429fec48b0bc9a3db256dce6f36e','5qIwsG4yjEHFNFLP2uTJ','c3cfa41ec30dfd62433d311c3d8336f3c858ee9f809b5b7e111d7a42f322112da14acb121565662a9c962fb1dd0e75acb4317d73ef9c3858c51e28ee3e157d4d','2010-11-04 05:47:30','2010-11-04 05:47:30','Test','testmaster',3,'I don\'t have a bio, but this is to test user level 3',NULL,NULL,NULL,NULL),(4,'kasi','kkfaulkins@gmail.com','5c94ed80ff69e8a9ac71fc75d915b975659b2319f320f9f6ff312eeaf8ddefe34371fd796c44962a48338cf69959c6b08626e011b2874b7aa72f6ac8cfcbee07','QWfG7LFwNSpTNdS3Dw4s','cf7a6aeb5d77aa97606eb4219c504e0bbde8cd4142ca9a8d6005d82a5f56376f48fc9e4e33b54a403c18142c859597e9b35492a4c96da47af9e995ff47ea7da9','2010-11-13 19:07:41','2010-11-13 19:07:41','Kasi','Faulkins',4,'this is the bio',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2011-01-04 14:31:31
