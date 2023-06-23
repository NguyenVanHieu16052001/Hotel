-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_web
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_name` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  `emp_id` int DEFAULT NULL,
  `cus_id` int DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`account_name`),
  KEY `role_id_idx` (`role_id`),
  KEY `cus_id_idx` (`cus_id`),
  KEY `emp_id_idx` (`emp_id`),
  CONSTRAINT `cus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('hieuhdhk@gmail.com','$2a$10$NS9oIv3kGk8pfDoEiz9GgemtWNAzzFR52.yEDGwoq4Dp.dNoznaFq',1,NULL,1,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `idk_pk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (6,'An Giang'),(7,'Bà Rịa - Vũng Tàu'),(8,'Bắc Giang'),(9,'Bắc Kạn'),(10,'Bạc Liêu'),(11,'Bắc Ninh'),(12,'Bến Tre'),(13,'Bình Định'),(14,'Bình Dương'),(15,'Bình Phước'),(16,'Bình Thuận'),(17,'Cà Mau'),(5,'Cần Thơ'),(18,'Cao Bằng'),(3,'Đà Nẵng'),(19,'Đắk Lắk'),(20,'Đắk Nông'),(21,'Điện Biên'),(22,'Đồng Nai'),(23,'Đồng Tháp'),(24,'Gia Lai'),(25,'Hà Giang'),(26,'Hà Nam'),(1,'Hà Nội'),(27,'Hà Tĩnh'),(28,'Hải Dương'),(4,'Hải Phòng'),(29,'Hậu Giang'),(2,'Hồ Chí Minh'),(30,'Hòa Bình'),(31,'Hưng Yên'),(32,'Khánh Hòa'),(33,'Kiên Giang'),(34,'Kon Tum'),(35,'Lai Châu'),(36,'Lâm Đồng'),(37,'Lạng Sơn'),(38,'Lào Cai'),(39,'Long An'),(40,'Nam Định'),(41,'Nghệ An'),(42,'Ninh Bình'),(43,'Ninh Thuận'),(44,'Phú Thọ'),(63,'Phú Yên'),(45,'Quảng Bình'),(46,'Quảng Nam'),(47,'Quảng Ngãi'),(48,'Quảng Ninh'),(49,'Quảng Trị'),(50,'Sóc Trăng'),(51,'Sơn La'),(52,'Tây Ninh'),(53,'Thái Bình'),(54,'Thái Nguyên'),(55,'Thanh Hóa'),(56,'Thừa Thiên Huế'),(57,'Tiền Giang'),(58,'Trà Vinh'),(59,'Tuyên Quang'),(60,'Vĩnh Long'),(61,'Vĩnh Phúc'),(62,'Yên Bái');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(45) NOT NULL,
  `hotel_id` int NOT NULL,
  `comment` varchar(500) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_acc_idx` (`account_name`),
  KEY `fk_res_idx` (`hotel_id`),
  CONSTRAINT `fk_acc` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`),
  CONSTRAINT `fk_res` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'hieuhdhk@gmail.com',2,'tot','2023-06-21 21:28:48');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `sex` tinyint NOT NULL,
  `address` varchar(450) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nguyen Van Khách',0,'abc','2023-06-21 14:59:41.824');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) NOT NULL,
  `sex` tinyint NOT NULL DEFAULT '1',
  `address` varchar(400) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `identity_number` varchar(45) NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `city` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `city_idx` (`city`),
  CONSTRAINT `city` FOREIGN KEY (`city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Hotel Ha Noi 1','032100054531','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/image/24ffc0af-594c-498b-b797-61e5838bc8cf.png',29,1),(2,'Hotel HCM','02321323213','23 đường abd Huyện des','ấdsd@sad.com','dep.png',2,1),(4,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/44419093-7040-4451-94c4-68355241c6ce.jpg',6,1),(5,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',21,1),(6,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,0),(7,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,1),(8,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,1),(9,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,1),(10,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,1),(11,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,1),(12,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,0),(13,'Hotel Ha Noi','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/5bbe7960-f19d-48a0-9cdf-80d257377e01.png',20,1),(14,'Hotel Ha Noi','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/cbfbfdf4-10fd-4c1f-bbf1-494d0ca4843e.jpg',6,1),(15,'Hotel Ha Noi','032100054531','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/ca967bf3-44a7-4935-8143-104ef1a7e82d.png',6,1),(16,'Hotel Ha Noi','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/22c33332-f91b-4f03-8ae4-130efec3e306.png',21,1);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `rentalDayNumber` int NOT NULL,
  `day_arrival` date NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`,`account_name`,`time`),
  KEY `acc_idx` (`account_name`),
  CONSTRAINT `acc_name` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`),
  CONSTRAINT `room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'hieuhdhk@gmail.com','2022-02-02 00:00:00',1,'2023-06-24',1),(2,'hieuhdhk@gmail.com','2022-02-02 00:00:00',1,'2023-06-24',1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_STAFF'),(3,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `number` int NOT NULL,
  `area` float NOT NULL,
  `bed_numb` int NOT NULL,
  `people_numb` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_idx` (`hotel_id`),
  CONSTRAINT `hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,203,23,2,2,'http://localhost:8081/films/695daa5e-3e97-476a-b81f-a9d31bbd7fac.jpg',1,120000),(2,2,123,2,2,2,'ad.com',1,222222),(3,1,1,11,2,2,'http://localhost:8081/image/25a17dc3-c298-4bb5-9703-9d5352ae22c7.jpg',0,11),(4,1,12,2,2,1,'http://localhost:8081/image/da2c3fe0-b2c5-44b5-9766-3f0bfda4fe74.png',0,2),(5,1,202,23,2,2,'http://localhost:8081/films/36e05feb-e6df-472d-bfa4-307aee547226.png',0,11);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` bigint NOT NULL,
  `name` varchar(450) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_detail`
--

DROP TABLE IF EXISTS `service_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_detail` (
  `service_id` int NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`service_id`,`room_id`),
  KEY `room_id_idx` (`room_id`),
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_detail`
--

LOCK TABLES `service_detail` WRITE;
/*!40000 ALTER TABLE `service_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(500) NOT NULL,
  `revoked` tinyint DEFAULT NULL,
  `expired` tinyint DEFAULT NULL,
  `account_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `acc_idx` (`account_name`),
  CONSTRAINT `acc` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (80,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQzODEsImV4cCI6MTY4NzQyMDc4MX0.wW5wVWxjuG2kOxMEX9HBHdOyD-kzAmuMoJUZpsVD_bEzALyRQYE65sUMyZ3ClWxi7HqtLrDUjpN1-PqvVjBxEw',1,1,'hieuhdhk@gmail.com'),(81,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQ0MjksImV4cCI6MTY4NzkzOTIyOX0.XYGmde4m7cd7SYr8tj8nTVuQXq6jT9P5oWucnHahoZyKG8rMClV0jXxTQetzKO7SCu6UzScW4AyGIuPT-fmV2Q',1,1,'hieuhdhk@gmail.com'),(82,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQ0NDQsImV4cCI6MTY4NzkzOTI0NH0.dU_7enVPvsevnqywKsFEtDAnWTuMi9AQjO5xeBpnFobJy446zp8d9cU29kAY11sMReRR8UeWdyB_FPhGxPknOw',1,1,'hieuhdhk@gmail.com'),(83,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzY3MzAsImV4cCI6MTY4Nzk0MTUzMH0.PBzbUOkIdXpTgubV5jQ3ZxuI9SmlOuugfGjlc9snrIwgUG-b3JOR0szDFQQPFOlS_gHj4KQwyiFdAmGAVgVERQ',1,1,'hieuhdhk@gmail.com'),(84,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNDQxNDAsImV4cCI6MTY4Nzk0ODk0MH0.cLlZIhDlUy1ibUGSzKh8QKBRGANco_ynHl1XafEdJ5EXgJ3X-axVhRt_Navtzua83UiIc1DX2dCvI0X9Ev-iMg',1,1,'hieuhdhk@gmail.com'),(85,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNDYwNDYsImV4cCI6MTY4Nzk1MDg0Nn0.1cjeWgTXETfPSsSiT072R1Rgeb4ej6NkS-L4efKyCpr19FoDjVE-HMWZn0RgrWA6KBtzs3jrXVL4m0ciKcLPrg',1,1,'hieuhdhk@gmail.com'),(86,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNTYyMzcsImV4cCI6MTY4Nzk2MTAzN30.GOG2iqc1HX47UNV3ngWS1Mi2vqRasOrqb7Os9ie1UIlm5sLWkc_sbX4ecayQv7M4NCJRg7CPyy9SCDidEhr37A',1,1,'hieuhdhk@gmail.com'),(87,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNTc5MjksImV4cCI6MTY4Nzk2MjcyOX0.Fgz8sPq5jzLfsVHlHP6Xk1bsMtUCj7poe0V2MEpGl14MZqkUPI7cmHyGEOSFrbvc3sHdhDRxNT5DQf55dvbl9g',1,1,'hieuhdhk@gmail.com'),(88,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNjA0OTcsImV4cCI6MTY4Nzk2NTI5N30.sFp0zXgPbU4OuYRgTjYQDUTpuATRYRsmxyovRLLX_HtrLSLzlrbg-gN9aLHu2l8DxuI9eo8t5ZUh4KEHdCFfpA',1,1,'hieuhdhk@gmail.com'),(89,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNjA1MTAsImV4cCI6MTY4Nzk2NTMxMH0.ZBQaXcUtZKtdKz3ifdrBCKmh8CCGOcUzXplPxStfI89yk7qE5lpoG3wdnJ3v2MYjAy2TNhJh2SbXtKhRW41FZQ',1,1,'hieuhdhk@gmail.com'),(90,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDEwOTAsImV4cCI6MTY4ODAwNTg5MH0.TNNxtSIDLxBcp0NRfr2zjPxk3-HFGKBH-ZT0h7zyLzAegkBV9g4UT-Iu1CwtU_AzT_k-kFkHbOCyyMV4znupiA',1,1,'hieuhdhk@gmail.com'),(91,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDcyNTQsImV4cCI6MTY4ODAxMjA1NH0.qWlNEVlo_yANlevugb4sfJ4v57ooDTLwYUL0Ji-RznaTGZkuMST3pM31Ry_06YJrf092fGjCF-C_cdrCCm0VXg',1,1,'hieuhdhk@gmail.com'),(92,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDczMDAsImV4cCI6MTY4ODAxMjEwMH0.Tq7fmiQbnabkLpqfN5OZdDrnl4EpPUGQoyLQb_XjroqTgWHVZPAT6ea6XA_rBniydbprkyuTgpOyEnK6tIkxkg',1,1,'hieuhdhk@gmail.com'),(93,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDgzODcsImV4cCI6MTY4ODAxMzE4N30.mMOnA4C4cwBt6PUC41ujQ34UJW1oJhcg1GnT9buEKbWqjcQabqe9cmaIU5J4IRwdpo1r4JQvF3v7Ie4LM8c2Tg',1,1,'hieuhdhk@gmail.com'),(100,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDg0ODksImV4cCI6MTY4ODAxMzI4OX0.HQnBzVpFZSC6PDSq8HK3AEUymPzowjZxpj40RoRmupeDTcrdngbkyzqk04MNhYwSKmCTXPttZNMytoRZ1lsHaA',1,1,'hieuhdhk@gmail.com'),(101,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzA5NjksImV4cCI6MTY4ODAzNTc2OX0.zZTXwis7zzfwleKMlIdVOLRNx5B2_ZWZ_hF0BzwnuKXoY90tFrz2W6msxjsFczYE8Dd8eoo_nJHVYCQ8RzuuqA',1,1,'hieuhdhk@gmail.com'),(102,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzU3MTAsImV4cCI6MTY4ODA0MDUxMH0.2XsHfIv9Q4AJJaQOq6lziKr_9N_yPnhT261K-vK7OPISjLdVwOANjvsJxmbyHdyEUXP4nj2CRGD3qUZ_5d7zLg',1,1,'hieuhdhk@gmail.com'),(103,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY0MDEsImV4cCI6MTY4ODA0MTIwMX0.lkSGsvXaDRpZ2meoGUZcH9NLvGJ5ZErZ5KEjtFWMKOv2zLo2v42XjNnspEn3Hkv-k2m_4GUGM_hi8ZpM2fAmXQ',1,1,'hieuhdhk@gmail.com'),(104,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3NDAsImV4cCI6MTY4ODA0MTU0MH0.p89AdBlooT0-jP4LxIeS5PT95qjLXmmUs9PHGGjfCEBMAg-dziSrjnlsBzE0H9M9X2KI8CG08boTC6eKiRRvqg',1,1,'hieuhdhk@gmail.com'),(105,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3NjUsImV4cCI6MTY4ODA0MTU2NX0._0q4feKlInglGSjBZ2A-w1XwVPAeh92a_0EbCDEfyJRIWXbJqX5PspnZ9Yu6tdql84wCEA5N6iEl9VR5gSI2Mw',1,1,'hieuhdhk@gmail.com'),(106,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3ODgsImV4cCI6MTY4ODA0MTU4OH0.ihFiwQkeI0O9qtApz1jZzcJpWJefXZScjSLLxNJ8UaPczjodAQcOJ9K7m4s1X4lofwQpUu61nIY1Ce94ul64IA',1,1,'hieuhdhk@gmail.com'),(107,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY4NTgsImV4cCI6MTY4ODA0MTY1OH0.wU7pvYnQwq0RHSMoTrKKiUPL5rj6_5LzbyNGvSa-O4j6AXNKMB17P35So0O12M-OY1vZdlnmxSBQh5Psa1_CCw',1,1,'hieuhdhk@gmail.com'),(108,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzcwMTQsImV4cCI6MTY4ODA0MTgxNH0.jHReG2zcAYctCvITtCmHYPFcMifq7b0yYkK3p7eXlGM5nKcqBXVivisgnQ-RN4RM9z-D4OH5PJ4a60POkg4ipA',1,1,'hieuhdhk@gmail.com'),(109,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzczNjgsImV4cCI6MTY4ODA0MjE2OH0.yrj5F0SBZIktu3amSc4L5L64dTcdfTqrttm_Bfj6gQe90uqt7x7n28kZQK4nI5nHySAdYrOewlgey4oFER4fZA',1,1,'hieuhdhk@gmail.com'),(110,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzczNzksImV4cCI6MTY4ODA0MjE3OX0.Mhv_Ezr6h8hN_4OwijyBT-BKvryj5AU6ZLyQL00G6WoNpywzt1LRzu1MPKZj1Dk2BjxloJZcCnJ3kawFDWOWzQ',1,1,'hieuhdhk@gmail.com'),(111,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0Mzc0NTYsImV4cCI6MTY4ODA0MjI1Nn0._99YHdIYpR3NbIJNzjq-VFvSXsZzWOyBae-0zW97R8IEovYDRpdgZnxWRch-mbQ9x4jsB9ZgpETZQdKtDDYXaw',1,1,'hieuhdhk@gmail.com'),(112,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTE4ODMsImV4cCI6MTY4ODA1NjY4M30.acWXiu-sGH-50MwNEz0CJWdg9jJwDapebVUCLzOk0PqV-pb2FqEel2FC0LwOZ3XR-vswr4rMK9rPlU-2AmE-8Q',1,1,'hieuhdhk@gmail.com'),(113,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTIwODYsImV4cCI6MTY4ODA1Njg4Nn0.g6H7kdyVw0XBN3mIw1ZJj4qHPzIJ2UlBzjtBnCnNOeBRM-Tgx4c7bfmv9-9Hq7tjxaVX6ANXlGURM3WV_AKVlw',1,1,'hieuhdhk@gmail.com'),(114,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTI4NTQsImV4cCI6MTY4ODA1NzY1NH0.U9wiUYzfKMABeRHVO9RRv8spqxw0j-4t4SJerxfLgYTgT-PjNp6lESPV4a7i9YP1Xy4d91dhsMf12TpUFynDJg',1,1,'hieuhdhk@gmail.com'),(115,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTI5NDAsImV4cCI6MTY4ODA1Nzc0MH0.AckW8022ZOfVDBC2ZK07Dj8L7glrPsOJcPqAp0sco6XE6DZVUZFbM9BYk2UiGCCCWKCZPxXGOmfI_pG98ifAvw',1,1,'hieuhdhk@gmail.com'),(116,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTMwMjcsImV4cCI6MTY4ODA1NzgyN30.o9S_4KCAnoinymh6l_nWNqJj6I3mmsjpHKmbwxLfGc3FXFw9xy_TCY-5KOuso7IkMcdNeULfdIRGBMDidk2FtA',1,1,'hieuhdhk@gmail.com'),(117,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTMwNDAsImV4cCI6MTY4ODA1Nzg0MH0.RADXxaqB1KY59odH0XiJww7f0WrkP9Gfa-k_5gqNixv4XzLHbrm1NFbyvPsWRnA8bd3gceEMWbO03_gwttwNRg',0,0,'hieuhdhk@gmail.com');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 10:34:52
