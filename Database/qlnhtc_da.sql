-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: qlnhtc_da
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
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '123456',
  `active` tinyint(1) DEFAULT '1',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `account` VALUES (177,'thuyngan','$2a$10$RDcj4wqED3ASnuyGTCSbtOlrOFkrz8g12bB2pYRoL/XQzg1gsSxsy',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664364214/ysbfiqgafwpuc16trxmz.jpg'),(178,'admin','$2a$10$RDcj4wqED3ASnuyGTCSbtOlrOFkrz8g12bB2pYRoL/XQzg1gsSxsy',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1638005661/qgfrosazadmq6qul68dp.jpg'),(179,'admin2','$2a$10$RDcj4wqED3ASnuyGTCSbtOlrOFkrz8g12bB2pYRoL/XQzg1gsSxsy',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1639657476/fvosjtddddgevlgtfgb7.jpg'),(181,'hoahiep','$2a$10$RtRJJWx443JPusM/gg1zr.QU05t5isyZhp9uOHxQ4j5c5a1v/uu/K',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664421878/qcbiirst7u9nscepwlzl.jpg');
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count_food` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Bánh Mặn đầu giờ',1),(2,'Món khai vị',1),(3,'Món súp',1),(4,'Món chính',3),(5,'Món tráng miệng',2),(6,'Nước giải khát/Rượu',2),(7,'Bánh cưới',1);
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
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `weddinghall_id` int NOT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE KEY `feedback_id_UNIQUE` (`feedback_id`),
  KEY `fk_user_feedback_idx` (`user_id`),
  KEY `fk_weddinghall_fb_idx` (`weddinghall_id`),
  CONSTRAINT `fk_user_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_weddinghall_fb` FOREIGN KEY (`weddinghall_id`) REFERENCES `weddinghall` (`weddinghall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (6,'sảnh cưới đẹp, khâu tổ chức của nhà hàng tốt, nhân viên nhiệt tình!!','2022-09-28 19:18:01',177,31);
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`food_id`),
  UNIQUE KEY `food_id_UNIQUE` (`food_id`),
  KEY `fk_cate_food_idx` (`category_id`),
  CONSTRAINT `fk_cate_food` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (10,'Tôm chiên cốm xanh',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/Tom_1_v2qlm0.jpg','Tôm chiên cốm xanh'),(11,'Bò cuộn phô mai',1,250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Bo_1_dfuvuu.jpg',''),(13,'Bánh Bacon Cuộn',1,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Banhbacon_1_kzeqix.jpg',''),(14,'Chả Giò Hải Sản Sốt Trái Cây',1,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaGio_1_qukyhb.jpg','Chả Giò Hải Sản Sốt Trái Cây'),(15,'Tôm Chiên Tempura',1,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomTempura_1_k6rpcm.jpg',''),(16,'Chạo Cá Nướng Xả',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaoCa_1_fzwmqs.jpg','Chạo Cá Nướng Xả'),(18,'Mực nhồi trứng muối chiên giòn',1,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Muc_1_mwcerv.jpg',''),(19,'Hải sản đút lò Sốt cay - xà lách',1,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/HaiSan_1_dvtuqw.jpg','Hải sản đút lò Sốt cay - xà lách'),(20,'Gỏi Củ Hủ Dừa Tôm Thịt',2,280000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/goicuhudua_2_v7mqpo.jpg',''),(21,'Gỏi bò ngũ sắc Thái Lan',2,270000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goibo_2_unper1.jpg',''),(22,'Tàu Hũ Ki Cuộn Tôm',2,170000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/tau_hu_ki_cuon_tom_2_g2ipuj.jpg',''),(23,'Gỏi Tôm Tứ Quý',2,300000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goi_tu_quy_2_hwkgkt.jpg',''),(24,'Củ sen bách hoa sốt chua ngọt',2,320000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CuSenBachHoa_2_ydxrdk.jpg',''),(25,'Cá chẽm sốt chua ngọt',4,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531776/CaChemSot_2_hcymcx.jpg',''),(26,'Cánh gà nướng sốt BBQ dùng vời salad - Ba rọi cuộn nấm sốt phô mai',4,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CanhGaNuong_2_xtqcb7.jpg','Cánh gà nướng sốt BBQ dùng vời salad - Ba rọi cuộn nấm sốt phô mai'),(27,'Salad củ hũ dừa và tôm càng sốt cay',2,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531787/SaladTom_2_ygoyqr.jpg',''),(28,'Tôm cuộn khoai môn chiên giòn sốt tartar',2,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomChien_2_j5uhaj.jpg',''),(31,'Sườn non hầm rượu vang – Bánh mì',4,440000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonHam_4_l03bzk.jpg',''),(32,'Lẩu bò miso – mì Udon',4,460000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/LauBo_4_kai8cg.jpg',''),(33,'Bò lúc lắc khoai tây',2,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/BoLucLac_4_juuxu8.jpg',''),(34,'Tôm sú nướng tiêu',4,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomNuong_4_lwzjif.jpg',''),(37,'Súp nấm bào ngư',3,410000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupBaoNgu_3_lta4cf.jpg',''),(38,'Súp cua',3,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupCua_3_vl62vl.jpg',''),(39,'Súp Hải Sản Tóc Tiên',3,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupTocTien_3_yz6og6.jpg',''),(40,'Sườn Non Tiềm Sâm Hạt Sen',3,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonNon_3_kvhgtx.jpg',''),(41,'Xôi xoài',5,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531797/XoiXoai_5_ikhbff.jpg',''),(42,'Set bánh 1',5,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531792/SetBanh2_5_ak2xio.jpg',''),(43,'Set bánh 2',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531771/Banh_5_z7cig9.jpg',''),(45,'Cooktail trái cây 1',6,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661426058/kx8vdtthkmrizukrirju.jpg',''),(46,'Cooktail trái cây 2',6,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc3_rfojaf.jpg',''),(47,'Cooktail trái cây 3',6,180000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661426119/tjyvi0ifkjsdvsnznhxe.jpg',''),(48,'Cooktail trái cây 4',6,200000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc_yg9pf9.jpg',''),(49,'Rượu vang',6,1250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531784/RuouVang_pmhgqa.jpg',''),(50,'Bia',6,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531772/Bia_tnpuby.jpg',''),(51,'Bánh cưới 1',7,500000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake1_xdhbxy.jpg',''),(52,'Bánh cưới 2',7,800000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake2_ojci2m.jpg',''),(53,'Bánh cưới 3',7,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake3_vehabo.jpg',''),(54,'Bánh cưới 4',7,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake4_q3eybi.jpg',''),(55,'Bánh cưới 5',7,750000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake5_a3nlby.jpg',''),(56,'Cơm Nhật cà ri và tôm sốt teppan',4,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/ComNhatCari_4_mdgpr9.jpg',''),(57,'Bồ câu quay mắm nhĩ dùng với bánh bao chiên',4,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/BoCauQuayMam_4_qyvfi9.jpg',''),(58,'Ba rọi heo quay củ hồi - Tiến vua chua ngọt',4,360000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BaRoiHeoQuay_4_k3z8ok.jpg',''),(59,'Bánh mousse chanh dây',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BanhChanhDay_5_ybbr72.jpg',''),(60,'Bánh Croissant Meat Jambon',1,140000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661055795/k8r33brfjq9c8jacnxdi.jpg','Bánh Croissant Meat Jambon'),(61,'Khai vị uyên ương',2,250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661224078/xvki3yxxprwbnotft9z2.jpg','Khai vị uyên ương'),(64,'Súp bóng cá cua',3,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1662268033/pvbs05z7v3sd8h5qp5js.jpg','Món súp này có nguyên liệu chính là bong bóng cá và thịt cua.');
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
  `price_food` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_id`,`food_id`),
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
  `party_date` date NOT NULL,
  `quantity_table` int NOT NULL DEFAULT '1',
  `total_price` decimal(10,0) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `user_id` int NOT NULL,
  `paymentmethods_id` int NOT NULL,
  `weddinghall_id` int NOT NULL,
  `weddingservices_id` int NOT NULL,
  `shift_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_payment_order_idx` (`paymentmethods_id`),
  KEY `fk_user_order_idx` (`user_id`),
  KEY `fk_weddinghall_od_idx` (`weddinghall_id`),
  KEY `fk_od_services_idx` (`weddingservices_id`),
  KEY `fk_shift_od_idx` (`shift_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`paymentmethods_id`) REFERENCES `paymentmethods` (`paymentmethods_id`),
  CONSTRAINT `fk_shift_od` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`),
  CONSTRAINT `fk_user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_wdhall_od` FOREIGN KEY (`weddinghall_id`) REFERENCES `weddinghall` (`weddinghall_id`),
  CONSTRAINT `fk_wdservices_od` FOREIGN KEY (`weddingservices_id`) REFERENCES `weddingservices` (`weddingservices_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `payments` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` float DEFAULT '1',
  PRIMARY KEY (`paymentmethods_id`),
  UNIQUE KEY `paymentmethods_id_UNIQUE` (`paymentmethods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
INSERT INTO `paymentmethods` VALUES (1,'Tiền mặt',0),(2,'Thanh toán qua Momo',0.05);
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `coefficient` float NOT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Ca sáng (9h-16h)',1),(2,'Ca tối (17h - 22h)',1.2);
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_card` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('NAM','NỮ','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NAM',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` enum('ADMIN','EMPLOYEE','CUSTOMER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'CUSTOMER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `identity_card_UNIQUE` (`identity_card`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (177,'Nguyễn Thị Thuý Ngân','321608253','2001-07-21','0965931468','nguyenthithuyngan0701@gmail.com','NỮ',NULL,'CUSTOMER'),(178,'Nguyễn Thị Thúy Ngân','123456789102','2001-07-21','0965211468','1951052129ngan@ou.edu.vn','NỮ','Quản lý','ADMIN'),(179,'Đặng Thị Kim Ngân','123456789109','2001-01-01','0976417942','kimngan1805@gmail.com','NỮ','Quản lý nhân sự','ADMIN'),(180,'Đặng Thị Kim Ngân','112233441123','2004-08-11','0947914679','1951050046ngan@gmail.com','NỮ',NULL,'CUSTOMER'),(181,'Nguyễn Hòa Hiệp','321478619','2004-09-08','0947687169','hiep@gmail.com','NAM','Tư vấn khách hàng','EMPLOYEE'),(183,'Võ Thị Ngọc Bích','321608253114','2000-06-15','0946741987','bich@gmail.com','NỮ','Tổ chức sự kiện','EMPLOYEE');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weddinghall`
--

DROP TABLE IF EXISTS `weddinghall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weddinghall` (
  `weddinghall_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `max_table` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`weddinghall_id`),
  UNIQUE KEY `weddinghall_id_UNIQUE` (`weddinghall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddinghall`
--

LOCK TABLES `weddinghall` WRITE;
/*!40000 ALTER TABLE `weddinghall` DISABLE KEYS */;
INSERT INTO `weddinghall` VALUES (29,'Sảnh Sân thượng',1,10,12000000,'Không gian nhỏ phù hợp với tiệc cưới gia đình, phù hợp với những tiệc diễn ra vào buổi tối...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661565293/n7ckzuadrou8r88fcix3.jpg'),(30,'Sảnh sân vườn',1,40,30000000,'Sân vườn rộng rãi, thoáng mát, phù hợp với nhiều phong cách, khách hàng có thể thoải mái yêu cầu phong cách trang trí','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660965544/ixqlyvlfe01rxrq0flgy.jpg'),(31,'Sảnh Lobby ',1,15,14000000,'Không gian gác mái độc đáo và ấm cúng phù hợp với những bữa tiệc nhỏ thân mật','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304120/qqtujacuxozvfpdsnwpe.jpg'),(32,'Sảnh ngoài trời',1,20,25000000,'','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1662267588/u5k24usouqrveibpco6n.jpg'),(33,'Sảnh hồ bơi',1,20,30000000,'Không gian hồ bơi rộng rãi thoáng mát, phù hợp với những cặp đôi thích sự mới mẻ độc đáo với pool party...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304791/yufcsqcl33zhbnh3hkit.jpg'),(34,'Sảnh Idylic Love',1,30,35000000,'Không gian phòng tiệc lớn và sang trọng...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304460/w5myglxy0gno6vbjciyv.jpg'),(35,'Sảnh Just Say Yes',1,25,30000000,'Không gian phòng tiệc với sức chứa lớn, phong cách vừa hiện đại vừa không kém phòng sang trọng...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304615/ojowwkwaijjtmzhv7yjy.jpg'),(36,'Sảnh Roseella Sweet ',1,25,28000000,NULL,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304684/o8kvmrm9jtkrjwbyhqj4.jpg');
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`weddingservices_id`),
  UNIQUE KEY `weddingservices_id_UNIQUE` (`weddingservices_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingservices`
--

LOCK TABLES `weddingservices` WRITE;
/*!40000 ALTER TABLE `weddingservices` DISABLE KEYS */;
INSERT INTO `weddingservices` VALUES (172,'Trọn gói yêu thương ',40000000,'- Trang trí theo yêu cầu  - Chụp ảnh cưới, quay phóng sự cưới - Nghi thức cưới: Rót cát',1),(173,'Gắn kết tơ duyên ',26000000,'- Trang trí theo yêu cầu - Chụp ảnh cưới, quay phóng sự cưới có Flycam - Nghi thức cưới: Thắt dây tơ hồng',1),(174,'Trọn gói yêu thương 2',28000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc - Chụp ảnh cưới, quay phóng sự cưới - Nghi thức cưới: Rót cát',1),(175,'Gắn kết tơ duyên 2',30000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc - Nghi thức cưới: Thắt dây tơ hồng',1),(176,'Hạnh phúc ngọt ngào',35000000,'- Trang trí theo yêu cầu - Chụp ảnh cưới, quay phóng sự cưới có Flycam - Nghi thức cưới: Rót gạo',1),(177,'Khởi đầu hạnh phúc',20000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc - Chụp ảnh cưới trọn bộ - Nghi thức cưới: Rót rượu',1);
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

-- Dump completed on 2022-09-30 13:15:55
