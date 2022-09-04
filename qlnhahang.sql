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
INSERT INTO `account` VALUES (2,'admin','$2a$10$8m21ryW6KS8P5WbG8d6v1uH5jDORGozH9obpE3d1A/SjTTFI9syvm',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1638005661/qgfrosazadmq6qul68dp.jpg'),(45,'kimngan','$2a$10$FeJkwuWY1FrrzrFbNcQjb.LTyo1abzZi0qEdcPW5BrWCq/hi9Aa.S',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1639657476/fvosjtddddgevlgtfgb7.jpg'),(112,'ngochuyen','$2a$10$641.jd51/k3k4yFdP0G7FuvXzq4YhmFJeqEf5qkTuJFGTCe4cyWb2',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660382855/rmokttasharpxfydfjsv.jpg'),(113,'yennhi','$2a$10$rWuSe9ZgraKqBBrm2uLgvuuLi2l4zc/Iy8DhpAuOPb.jEzlCFpsUa',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660456885/nexdaxac2wqqxmhiq9ie.ico'),(114,'ngocbich','$2a$10$rWuSe9ZgraKqBBrm2uLgvuuLi2l4zc/Iy8DhpAuOPb.jEzlCFpsUa',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1639887194/vebc1ptmht5igrw7dexb.jpg'),(117,'hoahiep','$2a$10$FhsOmgArdvK3WON9bL6USOoqTidX.7RHzupvrULbF5QNJc4PBD6y2',0,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660472489/aloye69k0jngkduw4klt.jpg'),(120,'khanhduy','$2a$10$62.qzqVyOcWG3nMJNWyMOewcyh6QgOme9Ec7ev4RF3W50EZSBT552',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660472624/xlhrojhzcnb3ifmppeus.jpg'),(121,'ngoccuong','$2a$10$42IsImqvDF2tfMNMVSoqdee5mkDHT0IOfZCecBZcWkq7GBK9X8fwa',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660481229/rhzfd2utllavkczmfvjd.jpg'),(124,'phong','$2a$10$BnXalTO5tf1Zmbt1b.MnQOC810uKmamDX8MKWtz52x/feNkJHnjNi',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660483897/fu7imy9mpuzgqy44ojvk.jpg'),(128,'ngochan','$2a$10$9M4Vv1WxJe9o6m1KIwwOF.kJ/ykxRCGtUodmpiaYEt4W08/9/9yia',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661178592/rtlvdumffqxv8b9rm9bv.jpg'),(129,'dieuhien','$2a$10$HEYGozdznDjNq3B5cjsaCOL13qYkjXYWqUf2byBTPJWhIiv9ilS2m',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661076719/n5vrgquhbowdtzfoqdv3.jpg'),(139,'admin2','$2a$10$42IsImqvDF2tfMNMVSoqdee5mkDHT0IOfZCecBZcWkq7GBK9X8fwa',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661181108/vpmx2m45ewevupngqsfc.jpg'),(140,'kimloan','$2a$10$xs4wuMPvaSz8FJKZgjEMiOV5VEl2ctg6PA5NCb96.pLAMH0HYJRy.',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661218359/upb5ztlvm1lfhijku2cw.jpg'),(142,'dieuque','$2a$10$AibCAn9muAFERm9VdTSoWeMlxwYdf06/xuEHhoQRxojsHBPtGaz0K',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661218628/h4zcjcz4k8qrhyqsgw9x.jpg'),(144,'thaolan','$2a$10$zBxYnuqyKJ1hdg3FKOHD9utUznXpA.GeYetfJ8hwYqPGUd8Mh5SX2',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661500241/oklfviqhijuzjgvgxjcp.jpg'),(150,'minhthanh','$2a$10$hzVeHMq0QS/5LiUnGIgmn.2GNBXsyKF3MicpzpDaddDhWjS0DrlDa',1,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661574604/utgufw9afszugy2ao1zh.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (10,'Tôm chiên cốm xanh',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/Tom_1_v2qlm0.jpg','Tôm chiên cốm xanh'),(11,'Bò cuộn phô mai',1,250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Bo_1_dfuvuu.jpg',NULL),(13,'Bánh Bacon Cuộn',1,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/Banhbacon_1_kzeqix.jpg',NULL),(14,'Chả Giò Hải Sản Sốt Trái Cây',1,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaGio_1_qukyhb.jpg','Chả Giò Hải Sản Sốt Trái Cây'),(15,'Tôm Chiên Tempura',1,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomTempura_1_k6rpcm.jpg',NULL),(16,'Chạo Cá Nướng Xả',1,150000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/ChaoCa_1_fzwmqs.jpg','Chạo Cá Nướng Xả'),(18,'Mực nhồi trứng muối chiên giòn',1,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Muc_1_mwcerv.jpg',NULL),(19,'Hải sản đút lò Sốt cay - xà lách',1,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/HaiSan_1_dvtuqw.jpg',NULL),(20,'Gỏi Củ Hủ Dừa Tôm Thịt',2,280000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531779/goicuhudua_2_v7mqpo.jpg',NULL),(21,'Gỏi bò ngũ sắc Thái Lan',2,270000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goibo_2_unper1.jpg',NULL),(22,'Tàu Hũ Ki Cuộn Tôm',2,170000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/tau_hu_ki_cuon_tom_2_g2ipuj.jpg',NULL),(23,'Gỏi Tôm Tứ Quý',2,300000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/goi_tu_quy_2_hwkgkt.jpg',NULL),(24,'Củ sen bách hoa sốt chua ngọt',2,320000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CuSenBachHoa_2_ydxrdk.jpg',NULL),(25,'Cá chẽm sốt chua ngọt',2,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531776/CaChemSot_2_hcymcx.jpg',NULL),(26,'Cánh gà nướng sốt BBQ dùng vời salad - Ba rọi cuộn nấm sốt phô mai',2,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/CanhGaNuong_2_xtqcb7.jpg','Cánh gà nướng sốt BBQ dùng vời salad - Ba rọi cuộn nấm sốt phô mai'),(27,'Salad củ hũ dừa và tôm càng sốt cay',2,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531787/SaladTom_2_ygoyqr.jpg',NULL),(28,'Tôm cuộn khoai môn chiên giòn sốt tartar',2,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomChien_2_j5uhaj.jpg',NULL),(31,'Sườn non hầm rượu vang – Bánh mì',4,440000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonHam_4_l03bzk.jpg',NULL),(32,'Lẩu bò miso – mì Udon',4,460000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/LauBo_4_kai8cg.jpg',NULL),(33,'Bò lúc lắc khoai tây',4,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/BoLucLac_4_juuxu8.jpg',NULL),(34,'Tôm sú nướng tiêu',4,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531795/TomNuong_4_lwzjif.jpg',NULL),(37,'Súp nấm bào ngư',3,410000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupBaoNgu_3_lta4cf.jpg',NULL),(38,'Súp cua',3,350000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupCua_3_vl62vl.jpg',NULL),(39,'Súp Hải Sản Tóc Tiên',3,290000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531794/SupTocTien_3_yz6og6.jpg',NULL),(40,'Sườn Non Tiềm Sâm Hạt Sen',3,430000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531793/SuonNon_3_kvhgtx.jpg',NULL),(41,'Xôi xoài',5,160000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531797/XoiXoai_5_ikhbff.jpg',NULL),(42,'Set bánh 1',5,240000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531792/SetBanh2_5_ak2xio.jpg',NULL),(43,'Set bánh 2',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531771/Banh_5_z7cig9.jpg',NULL),(45,'Cooktail trái cây 1',6,230000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661426058/kx8vdtthkmrizukrirju.jpg',''),(46,'Cooktail trái cây 2',6,190000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc3_rfojaf.jpg',NULL),(47,'Cooktail trái cây 3',6,180000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661426119/tjyvi0ifkjsdvsnznhxe.jpg',''),(48,'Cooktail trái cây 4',6,200000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531782/Nuoc_yg9pf9.jpg',NULL),(49,'Rượu vang',6,1250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531784/RuouVang_pmhgqa.jpg',NULL),(50,'Bia',6,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531772/Bia_tnpuby.jpg',NULL),(51,'Bánh cưới 1',7,500000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake1_xdhbxy.jpg',NULL),(52,'Bánh cưới 2',7,800000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake2_ojci2m.jpg',NULL),(53,'Bánh cưới 3',7,450000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake3_vehabo.jpg',NULL),(54,'Bánh cưới 4',7,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake4_q3eybi.jpg',NULL),(55,'Bánh cưới 5',7,750000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531778/DecorateCake5_a3nlby.jpg',NULL),(56,'Cơm Nhật cà ri và tôm sốt teppan',4,260000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531777/ComNhatCari_4_mdgpr9.jpg',NULL),(57,'Bồ câu quay mắm nhĩ dùng với bánh bao chiên',4,550000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531773/BoCauQuayMam_4_qyvfi9.jpg',NULL),(58,'Ba rọi heo quay củ hồi - Tiến vua chua ngọt',4,360000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BaRoiHeoQuay_4_k3z8ok.jpg',NULL),(59,'Bánh mousse chanh dây',5,210000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1659531770/BanhChanhDay_5_ybbr72.jpg',NULL),(60,'Bánh Croissant Meat Jambon',1,140000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661055795/k8r33brfjq9c8jacnxdi.jpg','Bánh Croissant Meat Jambon'),(61,'Khai vị uyên ương',2,250000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661224078/xvki3yxxprwbnotft9z2.jpg','Khai vị uyên ương'),(62,'Cánh gà nướng',4,360000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661224282/tqbypgwrmwm8omwvbrcm.jpg','Cánh gà nướng mật ong'),(63,'test',6,100000,'https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661567789/fj2t40oqm13mqtmjsmwb.jpg','test');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-08-24',1,'2022-08-29',15,150000000,113,1,31),(2,'2022-08-24',0,'2022-08-27',10,90000000,121,1,28);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
INSERT INTO `paymentmethods` VALUES (1,'Tiền mặt',1),(2,'Thanh toán qua Momo',0.05);
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_card` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('NAM','NỮ') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NAM',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` enum('ADMIN','EMPLOYEE','CUSTOMER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'CUSTOMER',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `identity_card_UNIQUE` (`identity_card`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Nguyễn Thị Thúy Ngân','123456789102','2001-07-21','0965931468','1951052129ngan@ou.edu.vn','NỮ','Quản lý','ADMIN'),(45,'Đặng Thị Kim Ngân','12345678910','2001-01-01','0123456789','ngan@gmail.com','NỮ',NULL,'CUSTOMER'),(112,'Nguyễn Thị Ngọc Huyền','321608253102','2001-06-12','0944761897','test@gmail.com','NỮ',NULL,'CUSTOMER'),(113,'Lê Nguyễn Yến Nhi','321608253189','2001-05-09','0944761894','','NỮ',NULL,'CUSTOMER'),(114,'Võ Thị Ngọc Bích','321608253114','2001-01-01','0946741987','bich@gmail.com','NỮ','Quản lý nhân sự','EMPLOYEE'),(117,'Nguyễn Hòa Hiệp','123478147963','2002-08-05','123','','NAM',NULL,'CUSTOMER'),(120,'Huỳnh Đinh Khánh Duy','123213123123','2002-08-13','12342123123','','NAM',NULL,'CUSTOMER'),(121,'Cao Ngọc Cường','321608253134','2000-03-01','0897324862','','NAM',NULL,'CUSTOMER'),(124,'Võ Hoài Phong','321608253125','2000-03-01','0941879461','','NAM',NULL,'CUSTOMER'),(125,'Nguyễn Thị Ngọc Hân','321608253178','2002-08-13','0941879478',NULL,'NỮ',NULL,'CUSTOMER'),(127,'Lê Hồng Yến','321608253112','2002-08-13','0947894168',NULL,'NAM','Tổ chức sự kiện','EMPLOYEE'),(128,'Lê Thị Kim Quyên','123123123256','2022-08-24','12312312312','a12312@gmail.com','NỮ','Tổ trưởng phục vụ','EMPLOYEE'),(129,'Phan Thị Diệu Hiền','321608253141','2001-07-12','0947647125','hien@gmail.com','NỮ',NULL,'CUSTOMER'),(139,'Đặng Thị Kim Ngân','112233441123','2004-08-11','11121232312','1951052046ngan@ou.edu.vn','NỮ','Quản lý','ADMIN'),(140,'Huỳnh Kim Loan','321647893125','1999-06-09','0964751946','customer@gmail.com','NỮ',NULL,'CUSTOMER'),(142,'Phạm Thị Diệu Quế','321608253111','2001-10-19','0945791463','que@gmail.com','NỮ','Tư vấn khách hàng','EMPLOYEE'),(143,'Lê Phạm Thảo Vy','321456781148','2000-06-12','0964782496','vy@gmail.com','NỮ','Bếp trưởng','EMPLOYEE'),(144,'Trần Ngọc Thảo Lan','321489746694','1999-06-16','0964782169','lan@gmail.com','NỮ',NULL,'CUSTOMER'),(150,'Nguyễn Minh Thành','321478491','2004-08-04','0964791486','thanh@gmail.com','NAM',NULL,'CUSTOMER'),(151,'Nguyễn Trương Tố Uyên','321478941','2000-09-20','0964127486','touyen@gmail.com','NỮ','MC sự kiện','EMPLOYEE');
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
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `coefficient` float DEFAULT '1',
  `weddinghall_id` int NOT NULL,
  `weddingservices_id` int NOT NULL,
  PRIMARY KEY (`wedding_id`),
  KEY `fk_wd_services_idx` (`weddingservices_id`),
  KEY `fk_wd_wd_hall_idx` (`weddinghall_id`),
  CONSTRAINT `fk_wd_services` FOREIGN KEY (`weddingservices_id`) REFERENCES `weddingservices` (`weddingservices_id`),
  CONSTRAINT `fk_wd_wd_hall` FOREIGN KEY (`weddinghall_id`) REFERENCES `weddinghall` (`weddinghall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding`
--

LOCK TABLES `wedding` WRITE;
/*!40000 ALTER TABLE `wedding` DISABLE KEYS */;
INSERT INTO `wedding` VALUES (25,'IDYLIC LOVE','Không gian phòng tiệc sang trọng, sảnh cưới lớn phù hợp với những buổi tiệc có số lượng khách lớn, đi kèm với dịch vụ cưới trọn gói...',1,12,165),(28,'BOHEMAIN','Không gian sảnh tiệc gác mái vừa độc đáo vừa gần gũi ấm cúng...',1,11,168),(29,'JUST SAY YES ','',1.2,13,167),(30,'ROSEELLA SWEET ','',1,14,166),(31,'POOL WEDDING ','',1.4,15,5),(32,'test','test',1,14,168);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddinghall`
--

LOCK TABLES `weddinghall` WRITE;
/*!40000 ALTER TABLE `weddinghall` DISABLE KEYS */;
INSERT INTO `weddinghall` VALUES (8,'Sảnh Sân thượng',1,10,12000000,'Không gian nhỏ phù hợp với tiệc cưới gia đình, phù hợp với những tiệc diễn ra vào buổi tối...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661565293/n7ckzuadrou8r88fcix3.jpg'),(9,'Sảnh sân vườn 2',1,25,22000000,'Sân vườn rộng rãi, thoáng mát, phù hợp với nhiều phong cách, khách hàng có thể thoải mái yêu cầu phong cách trang trí','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1660965544/ixqlyvlfe01rxrq0flgy.jpg'),(10,'Sảnh cưới 4',1,25,20000000,'Phong cách trang trí đơn giản nhưng không kém phần sang trọng...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661231521/vvjt1vbhcqwezkjldvms.jpg'),(11,'Sảnh Lobby ',1,15,15000000,'Không gian gác mái độc đáo và ấm cúng phù hợp với những bữa tiệc nhỏ thân mật','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304120/qqtujacuxozvfpdsnwpe.jpg'),(12,'Sảnh chính 1',1,50,40000000,'Không gian phòng tiệc lớn và sang trọng...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304460/w5myglxy0gno6vbjciyv.jpg'),(13,'Sảnh chính 2',1,40,35000000,'Không gian phòng tiệc với sức chứa lớn, phong cách vừa hiện đại vừa không kém phòng sang trọng...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304615/ojowwkwaijjtmzhv7yjy.jpg'),(14,'Sảnh chính 3',1,35,25000000,'','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304684/o8kvmrm9jtkrjwbyhqj4.jpg'),(15,'Sảnh hồ bơi',1,25,30000000,'Không gian hồ bơi rộng rãi thoáng mát, phù hợp với những cặp đôi thích sự mới mẻ độc đáo với pool party...','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661304791/yufcsqcl33zhbnh3hkit.jpg'),(25,'test',1,50,1000000,'123123','https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1661523961/ntlqhvuzdznffhnk3pbl.jpg');
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
  PRIMARY KEY (`weddingservices_id`),
  UNIQUE KEY `weddingservices_id_UNIQUE` (`weddingservices_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weddingservices`
--

LOCK TABLES `weddingservices` WRITE;
/*!40000 ALTER TABLE `weddingservices` DISABLE KEYS */;
INSERT INTO `weddingservices` VALUES (5,'Trọn gói yêu thương ',40000000,'- Trang trí theo yêu cầu \r\n- Chụp ảnh cưới, quay phóng sự cưới \r\n- Nghi thức cưới: Rót gạo'),(162,'Gắn kết tơ duyên ',26000000,'- Trang trí theo yêu cầu\r\n - Chụp ảnh cưới, quay phóng sự cưới có Flycam \r\n- Nghi thức cưới: Thắt dây tơ hồng'),(164,'add dv',123,'edit add 2'),(165,'Trọn gói yêu thương',28000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc - Chụp ảnh cưới, quay phóng sự cưới - Nghi thức cưới: Rót gạo'),(166,'Gắn kết tơ duyên 2',30000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc \r\n- Chụp ảnh cưới, quay phóng sự cưới có Flycam \r\n- Nghi thức cưới: Thắt dây tơ hồng'),(167,'Hạnh phúc ngọt ngào',35000000,'- Trang trí theo yêu cầu\r\n- Chụp ảnh cưới, quay phóng sự cưới có Flycam \r\n- Nghi thức cưới: Rót cát'),(168,'Khởi đầu hạnh phúc',20000000,'- Trang trí theo yêu cầu, có nến lung linh cho các bàn tiệc \r\n- Chụp ảnh cưới, quay phóng sự cưới \r\n- Nghi thức cưới: Rót cát'),(169,'test add dịch vụ',123,'test edit');
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

-- Dump completed on 2022-08-29 18:29:32
