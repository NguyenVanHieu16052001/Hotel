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
INSERT INTO `accounts` VALUES ('admin','$2a$10$NS9oIv3kGk8pfDoEiz9GgemtWNAzzFR52.yEDGwoq4Dp.dNoznaFq',1,NULL,NULL,1),('BKG-0001','$2a$10$za6ftAoYtRs23d3OL1HQH./Ef2PFpNDWAPUEJ5oeKAAWf9E9tvRBG',1,5,NULL,2),('BKG-000131322','$2a$10$qP4.rUJ8ekkCe4HkJURrQu0bOqp7X.nVTkJ1vFsNAlhrMPPzyW6t6',1,6,NULL,2),('BKG-00013244','$2a$10$0BNObsoMK0uhDiSccVEiBOrozm1UUrOfA02fhZjL.GJjqQ5cCkm9O',1,7,NULL,2),('hieuhdhk@gmail.com','$2a$10$NS9oIv3kGk8pfDoEiz9GgemtWNAzzFR52.yEDGwoq4Dp.dNoznaFq',1,NULL,1,3),('hieuhdhk2@gmail.com','$2a$10$NS9oIv3kGk8pfDoEiz9GgemtWNAzzFR52.yEDGwoq4Dp.dNoznaFq',1,1,NULL,2),('hieuhdhk3@gmail.com','$2a$10$NS9oIv3kGk8pfDoEiz9GgemtWNAzzFR52.yEDGwoq4Dp.dNoznaFq',1,2,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'hieuhdhk@gmail.com',2,'tot','2023-06-21 21:28:48'),(2,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:08:52'),(3,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:09:45'),(4,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:09:51'),(5,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:09:53'),(6,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:11:28'),(7,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:11:44'),(8,'hieuhdhk@gmail.com',1,'Nice','2023-06-24 13:11:55'),(9,'hieuhdhk@gmail.com',1,'Nice','2023-06-25 08:00:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'NV1',1,'97 ManThien','094344342','12233333312',1),(2,'NV2',1,'98 Man Thien','023314234','12345552344',1),(5,'BKG-0001',1,'BKG-0001','BKG-0001','BKG-0001',1),(6,'BKG-0001',1,'BKG-0001','BKG-0001','BKG-0001',1),(7,'BKG-0001',1,'BKG-0001','BKG-0001','BKG-0001',1);
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
INSERT INTO `hotels` VALUES (1,'Hotel Hau Giang 1','032100054531','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/fe4e6365-778f-4c88-b4db-39b1d0a76680.jfif',29,1),(2,'Hotel Hau Giang 2','02321323213','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/d1766655-7e83-4c3b-9275-415d32bc285f.jfif',29,1),(4,'Hotel Dong Thap','(+84) 968416844,(+84) 968416844','23 đường abd Huyện des,23 đường abd Huyện des','hieuhdhk@gmail.com,hieuhdhk@gmail.com','http://localhost:8081/films/286198f0-c882-4b19-b1b0-0a397d0ed4f6.jfif',23,1),(5,'Hotel Dien Bien 1','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/a8ac2299-2cb5-4a3b-8a8d-3b2b0583d1d9.jfif',21,1),(6,'Hotel HN','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,0),(7,'Hotel Ha Noi','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/6a400e16-796d-44c9-95c9-aaf1dc4411c3.jpg',1,1),(8,'Hotel Ha Noi New','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/41ab344b-ea7f-4c4c-b316-bf469adba444.jfif',1,1),(9,'Hotel HN 1','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/72d2a431-121d-4c4d-afd7-587f6a198c68.jfif',1,1),(10,'Hotel HN 2','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/710ecdfd-5b08-4323-8d23-fd085a662959.jpg',1,1),(11,'Hotel new','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/films/cb5c67a5-1a2a-4bd5-af12-323886980f6d.jfif',1,1),(12,'Hotel HN 3','(+84) 968416844','23 đường abd Huyện des','hieuhdhk@gmail.com','http://localhost:8081/image/19a59be1-1356-4862-8776-2a89d6cd6640.png',1,0),(13,'Hotel Dak Nong','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/c3143e31-7660-4602-bf4f-86a8ee6a1178.jfif',20,1),(14,'Hotel Dak Lak','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/2afbe03b-789b-4e8a-bcc2-ffcff585f84a.jpg',19,1),(15,'Hotel Dien Bien 2','032100054531','23 đường abd Huyện ','ấdsd@sad.com','http://localhost:8081/films/c47756b5-9b3d-45db-b197-8952804847bc.jpg',21,1),(16,'Hotel Dien Bien 3','03210005453','23 đường abd Huyện des','ấdsd@sad.com','http://localhost:8081/films/c2c6c604-9194-4863-a186-e128672eea96.jpg',21,1);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `account_name` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `rental_day_number` int NOT NULL,
  `checkin` date NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `paid_amount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_idx` (`account_name`),
  KEY `room` (`room_id`),
  CONSTRAINT `acc_name` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`),
  CONSTRAINT `room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (6,1,'hieuhdhk@gmail.com','2023-02-02 00:00:00',5,'2023-06-23',-1,50000),(7,1,'hieuhdhk@gmail.com','2023-06-23 19:53:09',1,'2023-07-01',-1,20000),(8,1,'hieuhdhk@gmail.com','2023-06-23 19:53:36',1,'2023-07-01',0,20000),(9,1,'hieuhdhk@gmail.com','2023-06-23 19:56:30',1,'2023-07-01',-1,20000),(1000,1,'hieuhdhk@gmail.com','2023-06-23 20:06:59',1,'2023-07-01',-1,20000),(1001,1,'hieuhdhk@gmail.com','2023-06-23 20:07:52',1,'2023-07-01',-1,29000),(1002,1,'hieuhdhk@gmail.com','2023-06-23 20:08:44',1,'2023-07-01',0,20000),(1014,11,'hieuhdhk@gmail.com','2023-06-25 07:59:41',1,'2023-06-18',-1,120000);
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
  `acreage` float NOT NULL,
  `bed_numb` int NOT NULL,
  `people_numb` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_idx` (`hotel_id`),
  CONSTRAINT `hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,203,23,2,2,'http://localhost:8081/films/c4b2c348-9c7f-467a-a993-ec89f77330eb.jfif',1,120000),(2,2,123,2,2,2,'http://localhost:8081/films/fcccc7ff-03e3-4e45-9fb4-61decb813996.jpg',1,222222),(3,6,1,11,2,2,'http://localhost:8081/image/25a17dc3-c298-4bb5-9703-9d5352ae22c7.jpg',1,100000),(4,4,12,2,2,1,'http://localhost:8081/films/696b3628-8218-49e7-a362-3d797300c0d1.jpg',1,220000),(5,5,202,23,2,2,'http://localhost:8081/films/36e05feb-e6df-472d-bfa4-307aee547226.png',1,150000),(6,1,205,23,1,2,'http://localhost:8081/films/2ad4ddf4-4116-4393-bb2a-98594cc82b12.jfif',1,400000),(7,16,202,23,2,2,'http://localhost:8081/films/6288abb8-5820-4e87-9a97-c19459b5263f.jpg',1,250000),(8,16,205,1,1,2,'http://localhost:8081/films/04aee302-4413-466e-a4b5-a515adb13d2b.jpg',1,300000),(9,15,202,23,2,2,'http://localhost:8081/films/dcc79afb-5445-437a-a493-a0f4e18bac0f.jpg',1,200000),(10,15,205,23,2,2,'http://localhost:8081/films/fb47b087-ea6f-4171-9049-977f4dc2c295.jpg',1,300000),(11,14,205,11,1,2,'http://localhost:8081/films/ec6c114a-6e0a-48a0-b467-e1b0a883eba6.jpg',1,120000),(12,14,202,23,2,2,'http://localhost:8081/films/2d8018c2-15de-4cac-880c-5b43f4556539.jpg',1,200000),(13,13,205,23,1,1,'http://localhost:8081/films/9f99dd6b-07cd-448a-96b0-8599e0fec101.jpg',1,400000),(14,13,202,23,2,2,'http://localhost:8081/films/b63a1d0a-a2b3-41a0-8929-62a614713136.jpg',1,300000);
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (80,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQzODEsImV4cCI6MTY4NzQyMDc4MX0.wW5wVWxjuG2kOxMEX9HBHdOyD-kzAmuMoJUZpsVD_bEzALyRQYE65sUMyZ3ClWxi7HqtLrDUjpN1-PqvVjBxEw',1,1,'hieuhdhk@gmail.com'),(81,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQ0MjksImV4cCI6MTY4NzkzOTIyOX0.XYGmde4m7cd7SYr8tj8nTVuQXq6jT9P5oWucnHahoZyKG8rMClV0jXxTQetzKO7SCu6UzScW4AyGIuPT-fmV2Q',1,1,'hieuhdhk@gmail.com'),(82,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzQ0NDQsImV4cCI6MTY4NzkzOTI0NH0.dU_7enVPvsevnqywKsFEtDAnWTuMi9AQjO5xeBpnFobJy446zp8d9cU29kAY11sMReRR8UeWdyB_FPhGxPknOw',1,1,'hieuhdhk@gmail.com'),(83,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczMzY3MzAsImV4cCI6MTY4Nzk0MTUzMH0.PBzbUOkIdXpTgubV5jQ3ZxuI9SmlOuugfGjlc9snrIwgUG-b3JOR0szDFQQPFOlS_gHj4KQwyiFdAmGAVgVERQ',1,1,'hieuhdhk@gmail.com'),(84,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNDQxNDAsImV4cCI6MTY4Nzk0ODk0MH0.cLlZIhDlUy1ibUGSzKh8QKBRGANco_ynHl1XafEdJ5EXgJ3X-axVhRt_Navtzua83UiIc1DX2dCvI0X9Ev-iMg',1,1,'hieuhdhk@gmail.com'),(85,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNDYwNDYsImV4cCI6MTY4Nzk1MDg0Nn0.1cjeWgTXETfPSsSiT072R1Rgeb4ej6NkS-L4efKyCpr19FoDjVE-HMWZn0RgrWA6KBtzs3jrXVL4m0ciKcLPrg',1,1,'hieuhdhk@gmail.com'),(86,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNTYyMzcsImV4cCI6MTY4Nzk2MTAzN30.GOG2iqc1HX47UNV3ngWS1Mi2vqRasOrqb7Os9ie1UIlm5sLWkc_sbX4ecayQv7M4NCJRg7CPyy9SCDidEhr37A',1,1,'hieuhdhk@gmail.com'),(87,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNTc5MjksImV4cCI6MTY4Nzk2MjcyOX0.Fgz8sPq5jzLfsVHlHP6Xk1bsMtUCj7poe0V2MEpGl14MZqkUPI7cmHyGEOSFrbvc3sHdhDRxNT5DQf55dvbl9g',1,1,'hieuhdhk@gmail.com'),(88,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNjA0OTcsImV4cCI6MTY4Nzk2NTI5N30.sFp0zXgPbU4OuYRgTjYQDUTpuATRYRsmxyovRLLX_HtrLSLzlrbg-gN9aLHu2l8DxuI9eo8t5ZUh4KEHdCFfpA',1,1,'hieuhdhk@gmail.com'),(89,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODczNjA1MTAsImV4cCI6MTY4Nzk2NTMxMH0.ZBQaXcUtZKtdKz3ifdrBCKmh8CCGOcUzXplPxStfI89yk7qE5lpoG3wdnJ3v2MYjAy2TNhJh2SbXtKhRW41FZQ',1,1,'hieuhdhk@gmail.com'),(90,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDEwOTAsImV4cCI6MTY4ODAwNTg5MH0.TNNxtSIDLxBcp0NRfr2zjPxk3-HFGKBH-ZT0h7zyLzAegkBV9g4UT-Iu1CwtU_AzT_k-kFkHbOCyyMV4znupiA',1,1,'hieuhdhk@gmail.com'),(91,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDcyNTQsImV4cCI6MTY4ODAxMjA1NH0.qWlNEVlo_yANlevugb4sfJ4v57ooDTLwYUL0Ji-RznaTGZkuMST3pM31Ry_06YJrf092fGjCF-C_cdrCCm0VXg',1,1,'hieuhdhk@gmail.com'),(92,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDczMDAsImV4cCI6MTY4ODAxMjEwMH0.Tq7fmiQbnabkLpqfN5OZdDrnl4EpPUGQoyLQb_XjroqTgWHVZPAT6ea6XA_rBniydbprkyuTgpOyEnK6tIkxkg',1,1,'hieuhdhk@gmail.com'),(93,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDgzODcsImV4cCI6MTY4ODAxMzE4N30.mMOnA4C4cwBt6PUC41ujQ34UJW1oJhcg1GnT9buEKbWqjcQabqe9cmaIU5J4IRwdpo1r4JQvF3v7Ie4LM8c2Tg',1,1,'hieuhdhk@gmail.com'),(100,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MDg0ODksImV4cCI6MTY4ODAxMzI4OX0.HQnBzVpFZSC6PDSq8HK3AEUymPzowjZxpj40RoRmupeDTcrdngbkyzqk04MNhYwSKmCTXPttZNMytoRZ1lsHaA',1,1,'hieuhdhk@gmail.com'),(101,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzA5NjksImV4cCI6MTY4ODAzNTc2OX0.zZTXwis7zzfwleKMlIdVOLRNx5B2_ZWZ_hF0BzwnuKXoY90tFrz2W6msxjsFczYE8Dd8eoo_nJHVYCQ8RzuuqA',1,1,'hieuhdhk@gmail.com'),(102,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzU3MTAsImV4cCI6MTY4ODA0MDUxMH0.2XsHfIv9Q4AJJaQOq6lziKr_9N_yPnhT261K-vK7OPISjLdVwOANjvsJxmbyHdyEUXP4nj2CRGD3qUZ_5d7zLg',1,1,'hieuhdhk@gmail.com'),(103,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY0MDEsImV4cCI6MTY4ODA0MTIwMX0.lkSGsvXaDRpZ2meoGUZcH9NLvGJ5ZErZ5KEjtFWMKOv2zLo2v42XjNnspEn3Hkv-k2m_4GUGM_hi8ZpM2fAmXQ',1,1,'hieuhdhk@gmail.com'),(104,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3NDAsImV4cCI6MTY4ODA0MTU0MH0.p89AdBlooT0-jP4LxIeS5PT95qjLXmmUs9PHGGjfCEBMAg-dziSrjnlsBzE0H9M9X2KI8CG08boTC6eKiRRvqg',1,1,'hieuhdhk@gmail.com'),(105,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3NjUsImV4cCI6MTY4ODA0MTU2NX0._0q4feKlInglGSjBZ2A-w1XwVPAeh92a_0EbCDEfyJRIWXbJqX5PspnZ9Yu6tdql84wCEA5N6iEl9VR5gSI2Mw',1,1,'hieuhdhk@gmail.com'),(106,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY3ODgsImV4cCI6MTY4ODA0MTU4OH0.ihFiwQkeI0O9qtApz1jZzcJpWJefXZScjSLLxNJ8UaPczjodAQcOJ9K7m4s1X4lofwQpUu61nIY1Ce94ul64IA',1,1,'hieuhdhk@gmail.com'),(107,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzY4NTgsImV4cCI6MTY4ODA0MTY1OH0.wU7pvYnQwq0RHSMoTrKKiUPL5rj6_5LzbyNGvSa-O4j6AXNKMB17P35So0O12M-OY1vZdlnmxSBQh5Psa1_CCw',1,1,'hieuhdhk@gmail.com'),(108,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzcwMTQsImV4cCI6MTY4ODA0MTgxNH0.jHReG2zcAYctCvITtCmHYPFcMifq7b0yYkK3p7eXlGM5nKcqBXVivisgnQ-RN4RM9z-D4OH5PJ4a60POkg4ipA',1,1,'hieuhdhk@gmail.com'),(109,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzczNjgsImV4cCI6MTY4ODA0MjE2OH0.yrj5F0SBZIktu3amSc4L5L64dTcdfTqrttm_Bfj6gQe90uqt7x7n28kZQK4nI5nHySAdYrOewlgey4oFER4fZA',1,1,'hieuhdhk@gmail.com'),(110,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0MzczNzksImV4cCI6MTY4ODA0MjE3OX0.Mhv_Ezr6h8hN_4OwijyBT-BKvryj5AU6ZLyQL00G6WoNpywzt1LRzu1MPKZj1Dk2BjxloJZcCnJ3kawFDWOWzQ',1,1,'hieuhdhk@gmail.com'),(111,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0Mzc0NTYsImV4cCI6MTY4ODA0MjI1Nn0._99YHdIYpR3NbIJNzjq-VFvSXsZzWOyBae-0zW97R8IEovYDRpdgZnxWRch-mbQ9x4jsB9ZgpETZQdKtDDYXaw',1,1,'hieuhdhk@gmail.com'),(112,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTE4ODMsImV4cCI6MTY4ODA1NjY4M30.acWXiu-sGH-50MwNEz0CJWdg9jJwDapebVUCLzOk0PqV-pb2FqEel2FC0LwOZ3XR-vswr4rMK9rPlU-2AmE-8Q',1,1,'hieuhdhk@gmail.com'),(113,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTIwODYsImV4cCI6MTY4ODA1Njg4Nn0.g6H7kdyVw0XBN3mIw1ZJj4qHPzIJ2UlBzjtBnCnNOeBRM-Tgx4c7bfmv9-9Hq7tjxaVX6ANXlGURM3WV_AKVlw',1,1,'hieuhdhk@gmail.com'),(114,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTI4NTQsImV4cCI6MTY4ODA1NzY1NH0.U9wiUYzfKMABeRHVO9RRv8spqxw0j-4t4SJerxfLgYTgT-PjNp6lESPV4a7i9YP1Xy4d91dhsMf12TpUFynDJg',1,1,'hieuhdhk@gmail.com'),(115,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTI5NDAsImV4cCI6MTY4ODA1Nzc0MH0.AckW8022ZOfVDBC2ZK07Dj8L7glrPsOJcPqAp0sco6XE6DZVUZFbM9BYk2UiGCCCWKCZPxXGOmfI_pG98ifAvw',1,1,'hieuhdhk@gmail.com'),(116,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTMwMjcsImV4cCI6MTY4ODA1NzgyN30.o9S_4KCAnoinymh6l_nWNqJj6I3mmsjpHKmbwxLfGc3FXFw9xy_TCY-5KOuso7IkMcdNeULfdIRGBMDidk2FtA',1,1,'hieuhdhk@gmail.com'),(117,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc0NTMwNDAsImV4cCI6MTY4ODA1Nzg0MH0.RADXxaqB1KY59odH0XiJww7f0WrkP9Gfa-k_5gqNixv4XzLHbrm1NFbyvPsWRnA8bd3gceEMWbO03_gwttwNRg',1,1,'hieuhdhk@gmail.com'),(118,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDE2MTUsImV4cCI6MTY4ODEwNjQxNX0.P6ZBfzPSNG1CbVSLTpa7rAoOLiUTClzvoRJgBuj-ldB48gZjJdtCfKf4FhMVyx6S5xCePc5PKZ2prgrGRW2qdw',1,1,'hieuhdhk@gmail.com'),(119,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDIxNTcsImV4cCI6MTY4ODEwNjk1N30.FEhSk_mBp68Yxn4CLl2aj7tlkq22_F_oPtinlG1eaK040VyH_oWdwrSTrjUEZX0yzkjHcBHRO1ImPx3_qjiQtQ',1,1,'hieuhdhk@gmail.com'),(120,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDI0MzcsImV4cCI6MTY4ODEwNzIzN30.Q0tqJTY9LVTyug-N1iYap16Y0YW7Lk6KI_9nbe6kUcZ8xPKKCmwlHHgDZzxAOFwKtwdOZ22AyGiyu52WnFmB5g',1,1,'hieuhdhk@gmail.com'),(121,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDI4MjQsImV4cCI6MTY4ODEwNzYyNH0.FobxjnF2-wlocP7IM3-l-oYdYpfS-K5WNZkBnmNogJkc4lNrKzeUP-DHRNOfDNiAYFeQiqy_Vy1jHcoCtUDjfg',1,1,'hieuhdhk@gmail.com'),(122,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDM0OTksImV4cCI6MTY4ODEwODI5OX0.k4eMjvndu5XD_RlYYr1qRTgUm5uxYCEY3x1pwxHajkFnJWtwvS1_vx2I-ET4wSmo97lKZtJA0cEQ2ABTlTcrJg',1,1,'hieuhdhk@gmail.com'),(123,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUwNDA3NSwiZXhwIjoxNjg4MTA4ODc1fQ.urdTylS7J4nz8k6_wIRnSwpbQohyhWkrZoO9RSRWdzWHVxwdkE6Y8gaLSLLbG498TXjMntNm89LiUByuN-u7tw',1,1,'admin'),(124,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDQxMTUsImV4cCI6MTY4ODEwODkxNX0.tATZc5H1XVEttns6xjT--YnVmPedHpugNKaXbrMC7cAuJIxGa-dQgw-erGMTs9PPvO9rDVKJqzu3THTEeHp5fA',1,1,'hieuhdhk@gmail.com'),(125,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUwODYzMCwiZXhwIjoxNjg4MTEzNDMwfQ.m31wGan7z3FvdGRsnzN0_M2tDj-T3WCeGWjmN5Jf5w1uDWdTRhJhq22mZ6wRMWGZsfV8cqP1LFKeDnNXQUIEhw',1,1,'admin'),(126,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MDkwOTgsImV4cCI6MTY4ODExMzg5OH0.0D5PVamAMSkuTHZQz-ckU2d2FiCNt8ja0As7IIvM2qaUBqu9rcVu0pNePNdE4Z2AEuquxb9bp2zspkqpESSY2Q',1,1,'hieuhdhk@gmail.com'),(127,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUwOTI5MywiZXhwIjoxNjg4MTE0MDkzfQ.Z3N_USmJzXb1jXUVUN8cua3CTOaqGepuVg7C5rNdfJ_SEnIoEwbMmkJ2qMR8oaJVevp-fJdmcUyuBKcFhmev2Q',1,1,'admin'),(128,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MjA5ODYsImV4cCI6MTY4ODEyNTc4Nn0.ruMRYCQP9zkS_ZqOALvQraGPbCl_RdJBpsWWOvtwjMVcIa_jE6hsgykdtb6tAvT9ThwOd_5YSc9Oa0fBzne1MA',1,1,'hieuhdhk@gmail.com'),(129,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUyNzUzNiwiZXhwIjoxNjg4MTMyMzM2fQ.n9jpm6mPqwpB7ro_oYcgKtXpnwojtQUG79k4_-t5HWS3g79Xb8x5oCBf5Xw45_kBKcW9lYU1_T51um_rERIw9Q',1,1,'admin'),(130,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1Mjc1NjUsImV4cCI6MTY4ODEzMjM2NX0.fY-gK50fMSxevRVLpOF8H7ObC6EJ1HnilGagH65nxVK3_rt9J0kFD5-fwr4MrVPu1JZoOg6EtHU0tq6LDZwp4A',1,1,'hieuhdhk@gmail.com'),(131,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MzIxMTAsImV4cCI6MTY4ODEzNjkxMH0.ZVybLI10JygPCBQSJLSaxpBJbqPnjAxRk1wMJ2L5r6ACh7XSG3LezfaRbdZIZnz5vtCPaiuNPAOq31Gz2H2Hxw',1,1,'hieuhdhk@gmail.com'),(132,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MzIyNDIsImV4cCI6MTY4ODEzNzA0Mn0.LsIar3yyk_RtV0f0LEcklMIOjPc-0gPjWXJ2UVqON4EnMmwbOKNdWvf5sH1u8jRkCqpzvauOo3mEiEYr3xRGrA',1,1,'hieuhdhk@gmail.com'),(133,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MzU4NzksImV4cCI6MTY4ODE0MDY3OX0.7UcNEBz4CwPJ42U7bL54L5squZPypsVwsbcQFxjeuSH9d6HGMy6AnMhJG3vJkLtft93CAyjLeL_GKwq6q9zrlw',1,1,'hieuhdhk@gmail.com'),(134,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MzU5NjMsImV4cCI6MTY4ODE0MDc2M30.o0rhKX-qa3sIlsPgLdvRaXaDgIeFDyXoUFm3F95KHx3FbLiWq6VW67F8RDaR0Br-04VZliG5zkgNM49R4hHaGA',1,1,'hieuhdhk@gmail.com'),(135,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUzNjMxNCwiZXhwIjoxNjg4MTQxMTE0fQ.6nfE5x18H96D50-bQAmAcj4QRMDMkE4aKSYNdyFhgKwEx3mveZbwvaVl2M-rdPf9MsVmmYfXnCJ0aoHi1NKghw',1,1,'admin'),(136,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1MzcyNDQsImV4cCI6MTY4ODE0MjA0NH0.wIri-2t6moZxAFWWxEm-DOyk2zdwNCIaYS2dLP8WCKB3ejZ9SJCp7I9JCMGHTH7nQpZz8yQJKzo9nDRxHGXdWg',1,1,'hieuhdhk@gmail.com'),(137,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzUzNzI1NCwiZXhwIjoxNjg4MTQyMDU0fQ.YJ99448nkkm1hOtXtj8xZ4GPzq-3zNaQyrz2ZlpOfONChC5Rp9JGWVVhBPFz6jY260Eoe1uDK7ylvFB0sZ0axg',1,1,'admin'),(138,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzU0MTk3NywiZXhwIjoxNjg4MTQ2Nzc3fQ.BmUz0sUQyAV0pRhz-W_9BWifOawb9LIgNeBH8ig8h1d9kbOrXtiBCv8oEqsIRSnOsvOAeoFq30F9BY67E0YrBw',1,1,'admin'),(139,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzU0Mjg5MSwiZXhwIjoxNjg4MTQ3NjkxfQ.IH_yp5Iaq1MwwC7HFm0SgjdimhU6VWJxkFJb0REkKFLlu5flhMbab-cF-5uhmMxZMH9Esr3g4aN8wDkMvlD2Yg',1,1,'admin'),(140,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzU3MjM5NCwiZXhwIjoxNjg4MTc3MTk0fQ.BwFFOgMVqnz0r2_6tE_n7m4N3uaMwZt55j-s_TmMUdql5cTb-5586_AF7jWcO1u3PHPCWQvGtB1NUqvaO2Yesw',1,1,'admin'),(141,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1Nzk1NTAsImV4cCI6MTY4ODE4NDM1MH0.SxTKzncqkL_tXFyQjZWQQ8LO_WD1t5CAKmpVAo_sBHa8SLdWe-cPqyeOHLfhny0WD9TusrMTnBg6klTV_vdnng',1,1,'hieuhdhk@gmail.com'),(142,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1ODE1NzYsImV4cCI6MTY4ODE4NjM3Nn0.TNmnKejzLSx3uVHEYujlUeXpbazFvLzVReCdaisnLoV86LqoWIt6UIM83_h_qVizN6ZjWeQJc8Lj5XwSe1s0jQ',1,1,'hieuhdhk@gmail.com'),(143,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzU4MTYzNSwiZXhwIjoxNjg4MTg2NDM1fQ.VKmA5cKOrWzJVnQdyVU2_l35t4ttRS6QWjslB0Xy50Bu33FjtN1zOcPmW8xBlajvRR9Q5cnu519hZ2R4rLvdBg',1,1,'admin'),(144,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1ODE3NDYsImV4cCI6MTY4ODE4NjU0Nn0.iTLVsEYSrckT7fxNWXJG_6pWsxtD_Nkl3fqeGa3CN4rsNW92TwXSZQ0kkQYtmCF_XlnLgSj8_90zLLfjVGY2cA',1,1,'hieuhdhk@gmail.com'),(145,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzU4MjQxNywiZXhwIjoxNjg4MTg3MjE3fQ.gPYKf8XkxOaT4ihiV8jXyrujWTcv-Eudd2aneBFblethvG1zNoV0H7fBUt284wpirnhHEc2v82jM85XuCCukTQ',1,1,'admin'),(146,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc1ODI1MzAsImV4cCI6MTY4ODE4NzMzMH0.-AURFaL-cJiyQ_Ly0yGh9Yh4k37sSzgBeyjn93iq79y2n1mR2qH83GBapmmThFhlXBrATBErlpHQRgZ7CdvjYA',1,1,'hieuhdhk@gmail.com'),(147,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MDI4MDIsImV4cCI6MTY4ODIwNzYwMn0.wSYRouZiW1EPWZkDAYw8dWEpzen7NDLVQ9flqYsNHSnnFBkB0r5SeEsQmTNOSioAReS7BcnCOKVLOaWgJV8MRw',1,1,'hieuhdhk@gmail.com'),(148,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzYwMjgyMCwiZXhwIjoxNjg4MjA3NjIwfQ.gojqfBWl1DJ5F87dQan9kN3j0HJaUnWDYNR-MwwgBT4GqwcBmZlRxkXZNE277SBQ62oKJCuVXoPruRT65lFizQ',1,1,'admin'),(149,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MTM1MjgsImV4cCI6MTY4ODIxODMyOH0.LdLqLdq1wYlKH8KUKSPNDybId4ktNuiZ3cccOl70VBDhgJlAtot6CrdmHDeGQgZaXg6grEDtsTzR4yPWVJRnaQ',1,1,'hieuhdhk@gmail.com'),(150,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MTM5OTksImV4cCI6MTY4ODIxODc5OX0.Q2vhN7-1zci5fTiCjjICEfhzPQlA-1MFJh_qJ4SFqbMSCJWRfNBkVNVfc9DAKFUf28xGtx8vSBI1d47Mfc-jJA',1,1,'hieuhdhk@gmail.com'),(151,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MTYyNjQsImV4cCI6MTY4ODIyMTA2NH0.XB-ZO9oLAs_QT6AaPwUR_qyxj1toOm_CPrCV0QBegh0AkSFQhQWFtz4kTaWDYZZf_QvCu66lrnRQqbOLtEmJWw',1,1,'hieuhdhk@gmail.com'),(152,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MTY0MzIsImV4cCI6MTY4ODIyMTIzMn0.LLYD6KpSd2lIv8iEjftwwB5_-UuDHRvKb3G9RbHt9tpfifZDnwXG_-qeXdR93AOetczbo7_nLHM_HzyZXm_yKw',1,1,'hieuhdhk@gmail.com'),(153,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzYxNjcxOCwiZXhwIjoxNjg4MjIxNTE4fQ.OY8OL5VUfB81p00OFawz_wfIJ3uzdLrhQGScB5VEb3Y_pwzGWYLD3jtP30Rd3MAYdggpCbZ9Pw84aQ8Pez2SsQ',1,1,'admin'),(154,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2MTY3ODYsImV4cCI6MTY4ODIyMTU4Nn0.2FridnCuisVe7wzsk0_kPEt81x6-Q4KwUILfquPUlxtkHMvEI88n0ZFKAgm3AVd-GwuWp5KRuDd0Pp1xp9qAIg',1,1,'hieuhdhk@gmail.com'),(155,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzYxOTAyOSwiZXhwIjoxNjg4MjIzODI5fQ.ijNqx_dVorIpEbLdZb8YLWmGZnLQcpUuLbzwmTw-qKABkJFhO3JSxHUkAQBoW0Lx0sLs0obSi0bs3tlJWU-M5A',1,1,'admin'),(156,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzYyMTU2NywiZXhwIjoxNjg4MjI2MzY3fQ.aDOWUo9qxBMoejXnu1C7QTLSVZYTxe3j7nylSOnpZabikmUY0UU5FCK0yhc4KEtOhxp1dBqc7Col0f9AC58CNA',1,1,'admin'),(157,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2NTMzNzgsImV4cCI6MTY4ODI1ODE3OH0.G3eBeXeZAkTQzIQ4I1wvY3d8N46wk8yOifW8HUQuh9i2cQTFGiK-uWuycmIEIic8a-k6kTS3zxJRYHjVrx2P2w',1,1,'hieuhdhk@gmail.com'),(158,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2NTMzODUsImV4cCI6MTY4ODI1ODE4NX0.PYvUoubM7sHfgdEsg-z3UVeobvhgDBmDlfVlZ1ahaZKsFobp7kQuKSnr2PoBcLFJUvoJnsGWnD7IZuYzIjPRxQ',1,1,'hieuhdhk@gmail.com'),(159,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzY1MzY5MiwiZXhwIjoxNjg4MjU4NDkyfQ.alLUFBYzPqUcTDHwWU7k3c5-nHLsQhVIU2o8L8T2dUPbb-tAPRDFts6ohSb-YCjZmpyCSHVGERUJdkBjMshmqQ',1,1,'admin'),(160,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2NTM3MTIsImV4cCI6MTY4ODI1ODUxMn0.2yniLphK5ZFvpmHpVt5tr1_1lUpCCMjz1NbnDnIpGHYmSH_iJ9N0f4BUvEOn49wqNdXDSc6_5j-UZD94MhPqag',1,1,'hieuhdhk@gmail.com'),(161,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJoaWV1aGRoa0BnbWFpbC5jb20iLCJpYXQiOjE2ODc2NTQ3MTEsImV4cCI6MTY4ODI1OTUxMX0.pjx-XuBkGCCDktF8zZNGBN7WbcydOm2piQvIsKAYc9LglaYZZQpp2_s8uqi0yE_DqemNUX5Udq_igy5kaVzebw',1,1,'hieuhdhk@gmail.com'),(162,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY4NzY1NTIzNywiZXhwIjoxNjg4MjYwMDM3fQ.AlYFoJ1xWZjn3s1YHKMfw8R5yM52Tf2R_RHsbBhowTJsIoCZcUo1Iekxa4CPFrO65AKGlgZWZI_HBRcgD-uyIg',0,0,'admin');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hotel_web'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAvailableHotels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAvailableHotels`( 
	IN city INT,
    IN checkin DATE,
    IN rentalDays INT)
BEGIN
    SELECT DISTINCT h.*
    FROM hotels h
    INNER JOIN rooms r ON r.hotel_id = h.id
    WHERE h.city = city
		AND h.status = 1
        AND r.status = 1
        AND NOT EXISTS (
            SELECT 1
            FROM reservation res
            WHERE res.room_id = r.id
                AND ((res.checkin >= checkin AND res.checkin < DATE_ADD(checkin,INTERVAL  rentalDays DAY ))
                OR (DATE_ADD(res.checkin,INTERVAL  res.rental_day_number  DAY ) > checkin AND DATE_ADD(res.checkin,INTERVAL  res.rental_day_number  DAY ) <= DATE_ADD(checkin,INTERVAL  rentalDays DAY))
                OR (res.checkin < checkin AND DATE_ADD(res.checkin,INTERVAL  res.rental_day_number  DAY ) > DATE_ADD(checkin,INTERVAL  rentalDays-1 DAY)))
                AND res.status <> 0
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_available_room_by_hotel_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_available_room_by_hotel_name`(
checkin DATE, 
rental_day_number INT, 
hotel_id INT)
BEGIN
	SELECT *
	FROM rooms r 
	WHERE r.hotel_id IN (
		SELECT hotels.id
		FROM hotels
		WHERE hotels.id = hotel_id
	) AND r.id NOT IN (	
		SELECT rs.room_id
			FROM reservation rs 
			WHERE  	(rs.status = 1 OR rs.status = 2) AND (						
							(rs.checkin >= checkin AND rs.checkin < DATE_ADD(checkin,INTERVAL rental_day_number DAY))
						 OR 
						(	
							DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) > checkin AND 
							DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) <= DATE_ADD(checkin, INTERVAL rental_day_number DAY)
						)
						OR 
						(rs.checkin <= checkin AND DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) >= DATE_ADD(checkin, INTERVAL rental_day_number DAY))
					)
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_hotel_and_its_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_hotel_and_its_price`(
checkin DATE, 
rental_day_number INT, 
city_name NVARCHAR(50))
BEGIN
	SELECT ht.*, ht_temp.price
    FROM hotels ht
    INNER JOIN  
	(SELECT r.hotel_id AS ht_id, MIN(r.price) AS price
    FROM rooms r
    WHERE r.hotel_id IN (
		SELECT hotels.id
		FROM hotels
		WHERE hotels.city = (
			SELECT city.id 
			FROM city 
			WHERE city.name = city_name
            ) AND hotels.status = 1
	) AND r.id NOT IN (
			SELECT rs.room_id
			FROM reservation rs 
			WHERE  	(rs.status = 1 OR rs.status = 2) AND (						
							(rs.checkin >= checkin AND rs.checkin < DATE_ADD(checkin,INTERVAL rental_day_number DAY))
						 OR 
						(	
							DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) > checkin AND 
							DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) <= DATE_ADD(checkin, INTERVAL rental_day_number DAY)
						)
						OR 
						(
							rs.checkin <= checkin AND 
							DATE_ADD(rs.checkin, INTERVAL rs.rental_day_number DAY) >= DATE_ADD(checkin, INTERVAL rental_day_number DAY)
						)
					)                
		)
	GROUP BY r.hotel_id) ht_temp
    ON ht.id = ht_temp.ht_id AND ht.status = 1; 
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

-- Dump completed on 2023-07-12 13:53:59
