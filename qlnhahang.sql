-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: qlnhahang
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `user_id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '123456',
  `active` tinyint(1) DEFAULT '1',
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_account` (`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,'admin','123456',1,NULL),(3,'user1','123456',1,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Bánh Mặn đầu giờ'),(2,'Món khai vị'),(3,'Món súp'),(4,'Món chính'),(5,'Món tráng miệng'),(6,'Nước giải khát/Rượu'),(7,'Bánh cưới');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` date DEFAULT NULL,
  `user_id` int NOT NULL,
  `wedding_id` int NOT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE KEY `feedback_id_UNIQUE` (`feedback_id`),
  KEY `fk_user_feedback_idx` (`user_id`),
  KEY `fk_wedding_fb_idx` (`wedding_id`),
  CONSTRAINT `fk_user_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_wedding_fb` FOREIGN KEY (`wedding_id`) REFERENCES `wedding` (`wedding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`food_id`),
  UNIQUE KEY `food_id_UNIQUE` (`food_id`),
  KEY `fk_cate_food_idx` (`category_id`),
  CONSTRAINT `fk_cate_food` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (10,'Tôm chiên cốm xanh',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/Tom_1_v2qlm0.jpg',NULL),(11,'Bò cuộn phô mai',1,250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Bo_1_dfuvuu.jpg',NULL),(13,'Bánh Bacon Cuộn',1,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Banhbacon_1_kzeqix.jpg',NULL),(14,'Chả Giò Hải Sản Sốt Trái Cây',1,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaGio_1_qukyhb.jpg',NULL),(15,'Tôm Chiên Tempura',1,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomTempura_1_k6rpcm.jpg',NULL),(16,'Chạo Cá Nướng Xả',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaoCa_1_fzwmqs.jpg',NULL),(17,'Cánh gà nướng',1,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/canh_ga_nuong_1_cxsffg.jpg',NULL),(18,'Mực nhồi trứng muối chiên giòn',1,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Muc_1_mwcerv.jpg',NULL),(19,'Hải sản đút lò Sốt cay - xà lách',1,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/HaiSan_1_dvtuqw.jpg',NULL),(20,'Gỏi Củ Hủ Dừa Tôm Thịt',2,280000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/goicuhudua_2_v7mqpo.jpg',NULL),(21,'Gỏi bò ngũ sắc Thái Lan',2,270000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goibo_2_unper1.jpg',NULL),(22,'Tàu Hũ Ki Cuộn Tôm',2,170000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/tau_hu_ki_cuon_tom_2_g2ipuj.jpg',NULL),(23,'Gỏi Tôm Tứ Quý',2,300000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goi_tu_quy_2_hwkgkt.jpg',NULL),(24,'Củ sen bách hoa sốt chua ngọt',2,320000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CuSenBachHoa_2_ydxrdk.jpg',NULL),(25,'Cá chẽm sốt chua ngọt',2,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531776/CaChemSot_2_hcymcx.jpg',NULL),(26,'Cánh gà nướng sốt BBQ dùng vời salad - Ba rọi cuộn nấm sốt phô mai',2,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CanhGaNuong_2_xtqcb7.jpg',NULL),(27,'Salad củ hũ dừa và tôm càng sốt cay',2,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531787/SaladTom_2_ygoyqr.jpg',NULL),(28,'Tôm cuộn khoai môn chiên giòn sốt tartar',2,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomChien_2_j5uhaj.jpg',NULL),(31,'Sườn non hầm rượu vang – Bánh mì',4,440000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonHam_4_l03bzk.jpg',NULL),(32,'Lẩu bò miso – mì Udon',4,460000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/LauBo_4_kai8cg.jpg',NULL),(33,'Bò lúc lắc khoai tây',4,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/BoLucLac_4_juuxu8.jpg',NULL),(34,'Tôm sú nướng tiêu',4,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomNuong_4_lwzjif.jpg',NULL),(37,'Súp nấm bào ngư',3,410000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupBaoNgu_3_lta4cf.jpg',NULL),(38,'Súp cua',3,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupCua_3_vl62vl.jpg',NULL),(39,'Súp Hải Sản Tóc Tiên',3,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupTocTien_3_yz6og6.jpg',NULL),(40,'Sườn Non Tiềm Sâm Hạt Sen',3,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonNon_3_kvhgtx.jpg',NULL),(41,'Xôi xoài',5,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531797/XoiXoai_5_ikhbff.jpg',NULL),(42,'Set bánh 1',5,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531792/SetBanh2_5_ak2xio.jpg',NULL),(43,'Set bánh 2',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531771/Banh_5_z7cig9.jpg',NULL),(45,'Cooktail trái cây 1',6,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc2_tjoq2w.jpg',NULL),(46,'Cooktail trái cây 2',6,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc3_rfojaf.jpg',NULL),(47,'Cooktail trái cây 3',6,180000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531783/Nuoc4_uv5gpw.jpg',NULL),(48,'Cooktail trái cây 4',6,200000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc_yg9pf9.jpg',NULL),(49,'Rượu vang',6,1250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531784/RuouVang_pmhgqa.jpg',NULL),(50,'Bia',6,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531772/Bia_tnpuby.jpg',NULL),(51,'Bánh cưới 1',7,500000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake1_xdhbxy.jpg',NULL),(52,'Bánh cưới 2',7,800000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake2_ojci2m.jpg',NULL),(53,'Bánh cưới 3',7,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake3_vehabo.jpg',NULL),(54,'Bánh cưới 4',7,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake4_q3eybi.jpg',NULL),(55,'Bánh cưới 5',7,750000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake5_a3nlby.jpg',NULL),(56,'Cơm Nhật cà ri và tôm sốt teppan',4,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/ComNhatCari_4_mdgpr9.jpg',NULL),(57,'Bồ câu quay mắm nhĩ dùng với bánh bao chiên',4,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/BoCauQuayMam_4_qyvfi9.jpg',NULL),(58,'Ba rọi heo quay củ hồi - Tiến vua chua ngọt',4,360000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BaRoiHeoQuay_4_k3z8ok.jpg',NULL),(59,'Bánh mousse chanh dây',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BanhChanhDay_5_ybbr72.jpg',NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  KEY `fk_order_id_idx` (`order_id`),
  KEY `fk_food_id_idx` (`food_id`),
  CONSTRAINT `fk_food_id` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `party_date` date DEFAULT NULL,
  `quantity_table` int DEFAULT '1',
  `total_price` decimal(10,0) DEFAULT NULL,
  `user_id` int NOT NULL,
  `paymentmethods_id` int NOT NULL,
  `wedding_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_payment_order_idx` (`paymentmethods_id`),
  KEY `fk_user_order_idx` (`user_id`),
  KEY `fk_wedding_od_idx` (`wedding_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`paymentmethods_id`) REFERENCES `paymentmethods` (`paymentmethods_id`),
  CONSTRAINT `fk_user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_wedding_od` FOREIGN KEY (`wedding_id`) REFERENCES `wedding` (`wedding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethods` (
  `paymentmethods_id` int NOT NULL AUTO_INCREMENT,
  `payments` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` float DEFAULT '1',
  PRIMARY KEY (`paymentmethods_id`),
  UNIQUE KEY `paymentmethods_id_UNIQUE` (`paymentmethods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_card` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('NAM','NỮ') COLLATE utf8mb4_unicode_ci DEFAULT 'NAM',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` enum('ADMIN','EMPLOYEE','CUSTOMER') COLLATE utf8mb4_unicode_ci DEFAULT 'CUSTOMER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `identity_card_UNIQUE` (`identity_card`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Nguyễn Thị Thúy Ngân','123456789102','2001-07-21','0965931468','1951052129ngan@ou.edu.vn','NỮ','Quản lý','ADMIN'),(3,'Đặng Thị Kim Ngân','102984873104','2001-01-01','0123456789','1951052046ngan@ou.edu.vn','NỮ','Quản lý bộ phận','EMPLOYEE');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding`
--

DROP TABLE IF EXISTS `wedding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding` (
  `wedding_id` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `coefficient` float DEFAULT '1',
  `weddinghall_id` int NOT NULL,
  `weddingservices_id` int NOT NULL,
  PRIMARY KEY (`wedding_id`),
  KEY `fk_wd_services_idx` (`weddingservices_id`),
  KEY `fk_wd_wd_hall_idx` (`weddinghall_id`),
  CONSTRAINT `fk_wd_services` FOREIGN KEY (`weddingservices_id`) REFERENCES `weddingservices` (`weddingservices_id`),
  CONSTRAINT `fk_wd_wd_hall` FOREIGN KEY (`weddinghall_id`) REFERENCES `weddinghall` (`weddinghall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding`
--

LOCK TABLES `wedding` WRITE;
/*!40000 ALTER TABLE `wedding` DISABLE KEYS */;
INSERT INTO `wedding` VALUES (1,'JUST SAY YES ',NULL,1,1,1),(2,'ROSEELLA SWEET ',NULL,1,5,2),(3,'IDYLIC LOVE',NULL,1,6,3),(4,'BOHEMAIN',NULL,1,3,4),(5,'ROSEELLA SWEET 2',NULL,1.5,7,4),(6,'POOL WEDDING ',NULL,1.5,2,1),(7,'POOL WEDDING 2',NULL,2,2,5);
/*!40000 ALTER TABLE `wedding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddinghall`
--

DROP TABLE IF EXISTS `weddinghall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddinghall` (
  `weddinghall_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `max_table` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`weddinghall_id`),
  UNIQUE KEY `weddinghall_id_UNIQUE` (`weddinghall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddinghall`
--

LOCK TABLES `weddinghall` WRITE;
/*!40000 ALTER TABLE `weddinghall` DISABLE KEYS */;
INSERT INTO `weddinghall` VALUES (1,'Sảnh chính 1',1,30,30000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/JSYWedding_e1kbbn.jpg'),(2,'Sảnh hồ bơi',1,25,25000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531790/SanhCuoiHoBoi3_ofk0wt.jpg'),(3,'Sảnh Lobby',1,20,20000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531790/SanhLobby2_oouhas.jpg'),(5,'Sảnh chính 2',1,30,30000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531783/RSWedding_zp9qo2.jpg'),(6,'Sảnh chính 3',1,25,25000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531780/ILWedding_fpltn0.jpg'),(7,'Sảnh sân vườn',1,50,40000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531792/SanhSanVuon3_gl17xs.jpg');
/*!40000 ALTER TABLE `weddinghall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddingservices`
--

DROP TABLE IF EXISTS `weddingservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddingservices` (
  `weddingservices_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`weddingservices_id`),
  UNIQUE KEY `weddingservices_id_UNIQUE` (`weddingservices_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingservices`
--

LOCK TABLES `weddingservices` WRITE;
/*!40000 ALTER TABLE `weddingservices` DISABLE KEYS */;
INSERT INTO `weddingservices` VALUES (1,'Trọn gói yêu thương',25000000,NULL),(2,'Trăm năm hạnh phúc',30000000,NULL),(3,'Gắn kết tơ duyên',30000000,NULL),(4,'Hạnh phúc ngọt ngào',35000000,NULL),(5,'Trọn gói yêu thương 2',40000000,NULL);
/*!40000 ALTER TABLE `weddingservices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 20:31:16
