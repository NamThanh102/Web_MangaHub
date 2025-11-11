-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: webtruyen_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Thể loại',7,'add_category'),(26,'Can change Thể loại',7,'change_category'),(27,'Can delete Thể loại',7,'delete_category'),(28,'Can view Thể loại',7,'view_category'),(29,'Can add Truyện tranh',8,'add_comic'),(30,'Can change Truyện tranh',8,'change_comic'),(31,'Can delete Truyện tranh',8,'delete_comic'),(32,'Can view Truyện tranh',8,'view_comic'),(33,'Can add Chương',9,'add_chapter'),(34,'Can change Chương',9,'change_chapter'),(35,'Can delete Chương',9,'delete_chapter'),(36,'Can view Chương',9,'view_chapter'),(37,'Can add Trang',10,'add_page'),(38,'Can change Trang',10,'change_page'),(39,'Can delete Trang',10,'delete_page'),(40,'Can view Trang',10,'view_page'),(41,'Can add Yêu thích',11,'add_favorite'),(42,'Can change Yêu thích',11,'change_favorite'),(43,'Can delete Yêu thích',11,'delete_favorite'),(44,'Can view Yêu thích',11,'view_favorite'),(45,'Can add Lịch sử đọc',12,'add_readinghistory'),(46,'Can change Lịch sử đọc',12,'change_readinghistory'),(47,'Can delete Lịch sử đọc',12,'delete_readinghistory'),(48,'Can view Lịch sử đọc',12,'view_readinghistory'),(49,'Can add Đánh giá',13,'add_review'),(50,'Can change Đánh giá',13,'change_review'),(51,'Can delete Đánh giá',13,'delete_review'),(52,'Can view Đánh giá',13,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$W20mn3ARFPmen1Bqaxt6sn$xaapD7WrhKEnWSbkx47CbGI/ubITG1QvAMQ4zaFn51E=','2025-11-09 14:19:13.317002',0,'B23DCCN276','','','haiductinh@gmail.com',0,1,'2025-11-09 09:50:13.304675'),(2,'pbkdf2_sha256$1000000$NfJuhGxNn0zYELR3p6kmu9$eMtZ0tOXJ3TwOMAQOhRrNdblgtBpJkGk0dWCoyKqwKg=','2025-11-09 14:19:24.301245',1,'admin','','','hehe@gmail.com',1,1,'2025-11-09 09:56:58.467147'),(3,'pbkdf2_sha256$1000000$hiAA0FHyJ37KjbuCag9bH0$/2/V62td0GwHcaFLX5kQ6g1H4gdGL4IM7k41fqw+gpk=','2025-11-11 15:26:48.423318',1,'nam','','','nam@gmail.com',1,1,'2025-11-10 15:11:21.450273'),(4,'pbkdf2_sha256$1000000$uDrcONhBlfTYb8ESexDwbW$w9f1YZYfE5axpiTwU+qs2d31nR5wGTQqaJf3hrSBPvg=','2025-11-10 15:13:03.462957',0,'nam1','','','nam1@gmail.com',0,1,'2025-11-10 15:13:03.156861'),(5,'pbkdf2_sha256$1000000$teeu5FuH59LZud5N8uZ3Rv$5fg7N6PDNE3YF11m6It32tAYvJph2KDvldqUI1RU27E=','2025-11-10 17:57:11.468313',0,'nam11','','','nam11@gmail.com',0,1,'2025-11-10 17:57:11.189865');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_category`
--

DROP TABLE IF EXISTS `core_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'Tình cảm','','2025-11-09 10:00:16.022680','tinh-cam'),(2,'Action','','2025-11-09 14:27:11.010072','action'),(3,'Sci-fi','','2025-11-09 14:27:28.481038','sci-fi'),(4,'Fantasy','','2025-11-09 14:28:11.205060','fantasy'),(5,'Ngôn Tình','','2025-11-09 14:28:24.732953','ngon-tinh'),(6,'Romance','','2025-11-09 14:28:44.686447','romance'),(7,'Mystery','','2025-11-09 14:28:53.922837','mystery'),(14,'Oneshot','','2025-11-09 14:30:21.416464','oneshot'),(15,'School Life','','2025-11-09 14:30:38.860368','school-life'),(16,'Shounen','','2025-11-09 14:30:52.858193','shounen');
/*!40000 ALTER TABLE `core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_chapter`
--

DROP TABLE IF EXISTS `core_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_chapter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_number` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `comic_id` bigint NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_chapter_comic_id_chapter_number_847d7561_uniq` (`comic_id`,`chapter_number`),
  KEY `core_chapte_comic_i_e881ad_idx` (`comic_id`,`chapter_number`),
  KEY `core_chapter_slug_2944e837` (`slug`),
  CONSTRAINT `core_chapter_comic_id_c0db1da3_fk_core_comic_id` FOREIGN KEY (`comic_id`) REFERENCES `core_comic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_chapter`
--

LOCK TABLES `core_chapter` WRITE;
/*!40000 ALTER TABLE `core_chapter` DISABLE KEYS */;
INSERT INTO `core_chapter` VALUES (1,'Chương 01 (Truyện 01)',1,'2025-11-10 00:09:21.000000',1,'truyen-01-chuong-01'),(2,'Chương 02 (Truyện 01)',2,'2025-11-10 00:09:21.000000',1,'truyen-01-chuong-02'),(3,'Chương 03 (Truyện 01)',3,'2025-11-10 00:09:21.000000',1,'truyen-01-chuong-03'),(4,'Chương 04 (Truyện 01)',4,'2025-11-10 00:09:21.000000',1,'truyen-01-chuong-04'),(5,'Chương 01 (Truyện 02)',1,'2025-11-10 00:09:21.000000',2,'truyen-02-chuong-01'),(6,'Chương 02 (Truyện 02)',2,'2025-11-10 00:09:21.000000',2,'truyen-02-chuong-02'),(7,'Chương 03 (Truyện 02)',3,'2025-11-10 00:09:21.000000',2,'truyen-02-chuong-03'),(8,'Chương 04 (Truyện 02)',4,'2025-11-10 00:09:21.000000',2,'truyen-02-chuong-04'),(9,'Chương 01 (Truyện 03)',1,'2025-11-10 00:09:21.000000',3,'truyen-03-chuong-01'),(10,'Chương 02 (Truyện 03)',2,'2025-11-10 00:09:21.000000',3,'truyen-03-chuong-02'),(11,'Chương 03 (Truyện 03)',3,'2025-11-10 00:09:21.000000',3,'truyen-03-chuong-03'),(12,'Chương 04 (Truyện 03)',4,'2025-11-10 00:09:21.000000',3,'truyen-03-chuong-04'),(13,'Chương 01 (Truyện 04)',1,'2025-11-10 00:09:21.000000',4,'truyen-04-chuong-01'),(14,'Chương 02 (Truyện 04)',2,'2025-11-10 00:09:21.000000',4,'truyen-04-chuong-02'),(15,'Chương 03 (Truyện 04)',3,'2025-11-10 00:09:21.000000',4,'truyen-04-chuong-03'),(16,'Chương 04 (Truyện 04)',4,'2025-11-10 00:09:21.000000',4,'truyen-04-chuong-04'),(17,'Chương 01 (Truyện 05)',1,'2025-11-10 00:09:21.000000',5,'truyen-05-chuong-01'),(18,'Chương 02 (Truyện 05)',2,'2025-11-10 00:09:21.000000',5,'truyen-05-chuong-02'),(19,'Chương 03 (Truyện 05)',3,'2025-11-10 00:09:21.000000',5,'truyen-05-chuong-03'),(20,'Chương 04 (Truyện 05)',4,'2025-11-10 00:09:21.000000',5,'truyen-05-chuong-04'),(21,'Chương 01 (Truyện 06)',1,'2025-11-10 00:09:21.000000',6,'truyen-06-chuong-01'),(22,'Chương 02 (Truyện 06)',2,'2025-11-10 00:09:21.000000',6,'truyen-06-chuong-02'),(23,'Chương 03 (Truyện 06)',3,'2025-11-10 00:09:21.000000',6,'truyen-06-chuong-03'),(24,'Chương 04 (Truyện 06)',4,'2025-11-10 00:09:21.000000',6,'truyen-06-chuong-04'),(25,'Chương 01 (Truyện 07)',1,'2025-11-10 00:09:21.000000',7,'truyen-07-chuong-01'),(26,'Chương 02 (Truyện 07)',2,'2025-11-10 00:09:21.000000',7,'truyen-07-chuong-02'),(27,'Chương 03 (Truyện 07)',3,'2025-11-10 00:09:21.000000',7,'truyen-07-chuong-03'),(28,'Chương 04 (Truyện 07)',4,'2025-11-10 00:09:21.000000',7,'truyen-07-chuong-04'),(29,'Chương 01 (Truyện 08)',1,'2025-11-10 00:09:21.000000',8,'truyen-08-chuong-01'),(30,'Chương 02 (Truyện 08)',2,'2025-11-10 00:09:21.000000',8,'truyen-08-chuong-02'),(31,'Chương 03 (Truyện 08)',3,'2025-11-10 00:09:21.000000',8,'truyen-08-chuong-03'),(32,'Chương 04 (Truyện 08)',4,'2025-11-10 00:09:21.000000',8,'truyen-08-chuong-04'),(37,'Chương 01 (Truyện 10)',1,'2025-11-10 00:09:21.000000',10,'truyen-10-chuong-01'),(38,'Chương 02 (Truyện 10)',2,'2025-11-10 00:09:21.000000',10,'truyen-10-chuong-02'),(39,'Chương 03 (Truyện 10)',3,'2025-11-10 00:09:21.000000',10,'truyen-10-chuong-03'),(40,'Chương 04 (Truyện 10)',4,'2025-11-10 00:09:21.000000',10,'truyen-10-chuong-04'),(41,'Chương 01 (Truyện 11)',1,'2025-11-10 00:09:21.000000',11,'truyen-11-chuong-01'),(42,'Chương 02 (Truyện 11)',2,'2025-11-10 00:09:21.000000',11,'truyen-11-chuong-02'),(43,'Chương 03 (Truyện 11)',3,'2025-11-10 00:09:21.000000',11,'truyen-11-chuong-03'),(44,'Chương 04 (Truyện 11)',4,'2025-11-10 00:09:21.000000',11,'truyen-11-chuong-04'),(45,'Chương 01 (Truyện 12)',1,'2025-11-10 00:09:21.000000',12,'truyen-12-chuong-01'),(46,'Chương 02 (Truyện 12)',2,'2025-11-10 00:09:21.000000',12,'truyen-12-chuong-02'),(47,'Chương 03 (Truyện 12)',3,'2025-11-10 00:09:21.000000',12,'truyen-12-chuong-03'),(48,'Chương 04 (Truyện 12)',4,'2025-11-10 00:09:21.000000',12,'truyen-12-chuong-04'),(49,'Chương 01 (Truyện 13)',1,'2025-11-10 00:09:21.000000',13,'truyen-13-chuong-01'),(50,'Chương 02 (Truyện 13)',2,'2025-11-10 00:09:21.000000',13,'truyen-13-chuong-02'),(51,'Chương 03 (Truyện 13)',3,'2025-11-10 00:09:21.000000',13,'truyen-13-chuong-03'),(52,'Chương 04 (Truyện 13)',4,'2025-11-10 00:09:21.000000',13,'truyen-13-chuong-04'),(53,'Chương 01 (Truyện 14)',1,'2025-11-10 00:09:21.000000',14,'truyen-14-chuong-01'),(54,'Chương 02 (Truyện 14)',2,'2025-11-10 00:09:21.000000',14,'truyen-14-chuong-02'),(55,'Chương 03 (Truyện 14)',3,'2025-11-10 00:09:21.000000',14,'truyen-14-chuong-03'),(56,'Chương 04 (Truyện 14)',4,'2025-11-10 00:09:21.000000',14,'truyen-14-chuong-04'),(61,'Chương 01 (Truyện 15)',1,'2025-11-10 13:21:21.869487',15,'truyen-15-chuong-01'),(62,'Chương 02 (Truyện 15)',2,'2025-11-10 13:25:14.734601',15,'chapter-2'),(63,'Chương 03 (Truyện 15)',3,'2025-11-10 13:27:10.004204',15,'chapter-3'),(64,'Chương 04 (Truyện 15)',4,'2025-11-10 13:29:55.833437',15,'chapter-4'),(65,'Chương 01 (Truyện 09)',1,'2025-11-10 13:31:41.747627',9,'chapter-1'),(66,'Chương 02 (Truyện 09)',2,'2025-11-10 13:33:14.707612',9,'chapter-2'),(67,'Chương 3 (Truyện 09)',3,'2025-11-10 13:34:19.831687',9,'chapter-3'),(68,'Chương 04 (Truyện 09)',4,'2025-11-10 13:35:31.422202',9,'chapter-4');
/*!40000 ALTER TABLE `core_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_comic`
--

DROP TABLE IF EXISTS `core_comic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_comic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `core_comic_created_b2a0d7_idx` (`created_at` DESC),
  KEY `core_comic_status_e2bb66_idx` (`status`),
  CONSTRAINT `core_comic_chk_1` CHECK ((`views` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_comic`
--

LOCK TABLES `core_comic` WRITE;
/*!40000 ALTER TABLE `core_comic` DISABLE KEYS */;
INSERT INTO `core_comic` VALUES (1,'One Piece','Eiichiro Oda','As a child, Monkey D. Luffy was inspired to become a pirate by listening to the tales of the buccaneer \"Red-Haired\" Shanks. But Luffy\'s life changed when he accidentally ate the Gum-Gum Devil Fruit and gained the power to stretch like rubber...at the cost of never being able to swim again! Years later, still vowing to become the king of the pirates, Luffy sets out on his adventure...one guy alone in a rowboat, in search of the legendary \"One Piece,\" said to be the greatest treasure in the world...','comic_covers/cover_72rwrOt.jpg','ongoing',107,'2025-11-10 00:09:21.000000','2025-11-11 15:28:19.779569','one-piece'),(2,'Jujutsu Kaisen Modulo','Gege Akutami / Yuji Iwasaki','It\'s been 68 years since the Culling Game. In 2086, an alien race known as the Simurians arrive on Earth in a spaceship. The fate of the world lies in the hands of two jujutsu sorcerers Yuka and Tsurugi Okkotsu. Jujutsu sorcerers and aliens, what chaos will be born from this meeting?','comic_covers/cover_wQ9biI2.jpg','ongoing',205,'2025-11-10 00:09:21.000000','2025-11-10 12:42:13.065709','jujutsu-kaisen-modulo'),(3,'Akane-banashi','Yuki Suenaga / Takamasa Moue','Rakugo--the ultimate form of storytelling, where everything in a story is expressed with just your body and words. Shinta and his daughter Akane have been seduced by this wonderful form of classical entertainment. Having observed her father strive to pass the shin\'uchi rakugo test, Akane will take her own steps into this unique world!','comic_covers/cover_etRdw8j.jpg','ongoing',302,'2025-11-10 00:09:21.000000','2025-11-10 11:28:09.704747','akane-banashi'),(4,'Boruto: Two Blue Vortex','Masashi Kishimoto / Mikio Ikemoto','With everyone\'s memories having been altered, Boruto finds himself being hunted by his own village. After escaping with Sasuke, what future awaits Boruto...?','comic_covers/cover_b1sYBNL.jpg','ongoing',403,'2025-11-10 00:09:21.000000','2025-11-10 12:43:34.684914','boruto-two-blue-vortex'),(5,'Food Wars!: Shokugeki no Soma','Yuto Tsukuda / Shun Saeki / Yuki Morisaki','Soma Yukihira\'s old man runs a small family restaurant in the less savory end of town. Aiming to one day surpass his father\'s culinary prowess, Soma hones his skills day in and day out until one day, out of the blue, his father decides to enroll Soma in a classy culinary school! Can Soma really cut it in a school that prides itself on a 10 percent graduation rate? And cacn he convince the beautiful, domineering heiress of the school that he belongs there at all?!','comic_covers/cover_DocfHYl.jpg','ongoing',507,'2025-11-10 00:09:21.000000','2025-11-10 11:20:40.013481','food-wars-shokugeki-no-soma'),(6,'Boruto: Naruto Next Generations','Masashi Kishimoto / Mikio Ikemoto / Ukyo Kodachi','Years have passed since Naruto and Sasuke teamed up to defeat Kaguya, the progenitor of chakra and the greatest threat the ninja world has ever faced. Times are now peaceful and the new generation of shinobi has not experienced the same hardships as its parents. Perhaps that is why Boruto would rather play video games than train. However, one passion does burn deep in this ninja boy’s heart, and that is the desire to defeat his father!','comic_covers/cover_GqacOOl.jpg','completed',611,'2025-11-10 00:09:21.000000','2025-11-10 18:22:09.275590','boruto-naruto-next-generations'),(7,'Red Cat Ramen','Angyaman','Meet Tamako, who’s found her way into an interview at a ramen shop run solely by cats. When the feline manager asks if she likes cats, Tamako admits that she’s actually more of a dog person...only to be hired on the spot! But her job description isn’t quite what she expects ? rather than serving ramen, she’s now a dedicated cat caretaker...?!','comic_covers/cover_HcljmCe.jpg','hiatus',700,'2025-11-10 00:09:21.000000','2025-11-10 11:22:19.738319','red-cat-ramen'),(8,'BUNGO-unreal','Yuji Ninomiya','After diligently practicing \"wall ball,\" Bungo Ishihama meets Yukio Noda, a member of Japan\'s youth baseball national team in a fateful encounter. The two then advance to middle school and join the ultra-competitive \"Seio Senior\" team. Aiming for the top of middle school baseball, they engage in fierce battles! As time passes, the duo moves on to high school, setting their sights on achieving \"five consecutive Koshien championships,\" once again striving for the top!','comic_covers/cover_ah8g1R0.jpg','ongoing',803,'2025-11-10 00:09:21.000000','2025-11-10 11:25:59.969874','bungo-unreal'),(9,'Xin Chào! Bác Sĩ Thú Y','Đang Cập Nhật','Truyện tranh Xin Chào! Bác Sĩ Thú Y được cập nhật nhanh và đầy đủ nhất . Bạn đọc đừng quên để lại bình luận và chia sẻ, ủng hộ ra các chương mới nhất của truyện Xin Chào! Bác Sĩ Thú Y.','comic_covers/cover_lm33eg0.jpg','ongoing',916,'2025-11-10 00:09:21.000000','2025-11-10 16:42:18.473625','xin-chao-bac-si-thu-y'),(10,'Hima-Ten!','Genki Ono','High school home ec expert Tenichi earns extra money with a part-time job cleaning houses. But one day, Himari, the owner and model of the popular cosmetics brand Hima Riz, transfers into his class. Say hello to some company president girl x house-cleaner boy romantic comedy hijinks!','comic_covers/cover_6Cwp1Mp.jpg','completed',1002,'2025-11-10 00:09:21.000000','2025-11-10 11:25:22.259241','hima-ten'),(11,'The Urban Legend Files','Kazuki Hiraoka','Mokume is a first-year college student and occult fanatic! She hunts down an older student, Kugutsu, who is rumored to attract urban legends of all kinds... What will happen when she joins the Occult Club? The long-awaited occult comedy from the creator of “Janji”, Kazuki Hiraoka!','comic_covers/cover_pbDxF0s.jpg','ongoing',1102,'2025-11-10 00:09:21.000000','2025-11-10 13:09:33.847845','the-urban-legend-files'),(12,'Choujin X','Kazuki Hiraoka','The latest from Sui Ishida! Superpowered choujin battle action!!','comic_covers/cover_7OjUNB2.jpg','completed',1206,'2025-11-10 00:09:21.000000','2025-11-10 13:06:39.609127','choujin-x'),(13,'Gunze Arabaki\'s Magnificently Maniacal Menagerie!','Kyosuke Usuta','Sixteen-year-old Inari Anamori has always had a soft spot for animals. But on his first day at his new school, things take a wild turn—he’s suddenly attacked by a bizarre creature he encountered in the forest! Just when things look grim, he’s rescued by Gunze Arabaki, a mysterious loner with a deep disdain for people. Their fateful encounter throws Inari headfirst into a chaotic school life filled with strange creatures, wild antics, and nonstop surprises. Get ready for the start of Kyosuke Usuta’s latest gag manga—an off-the-wall comedy where the weird is just getting started!','comic_covers/cover_uX6H6dP.jpg','completed',1302,'2025-11-10 00:09:21.000000','2025-11-10 11:23:07.346341','gunze-arabakis-magnificently-maniacal-menagerie'),(14,'Eunuch of Empire','Kei Saikawa / Kotaro Shono','Eunuchs, the only men allowed to serve in the secret garden known as the harem. When a young eunuch named Jafar encounters three beautiful sisters there, their meeting shakes the country to its foundations! Brought to you by the tag-team of Kotaro Shono, the artist of World\'s End Harem, and Kei Saikawa, the creator of Hero Organization, a tale of suspense in a beautiful, otherworldly country unfolds!','comic_covers/cover_8n58ZL9.jpg','hiatus',1401,'2025-11-10 00:09:21.000000','2025-11-10 11:21:47.490848','eunuch-of-empire'),(15,'Genikasuri','Toshio Sako','After one fateful match, former professional boxer Ryo Harima awakens from a two-year vegetative state to find out his career is over, his father has died, and he\'s been betrayed by his gym… Broken and fueled by rage, he vows to make it to the top of the boxing world, but this time as a promoter. Prepare yourself for a story about manipulation and money from the dark corner of the boxing world!!','comic_covers/cover_Fekgywa.jpg','completed',1534,'2025-11-10 00:09:21.000000','2025-11-11 15:27:47.993443','genikasuri');
/*!40000 ALTER TABLE `core_comic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_comic_categories`
--

DROP TABLE IF EXISTS `core_comic_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_comic_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comic_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_comic_categories_comic_id_category_id_6d31bf38_uniq` (`comic_id`,`category_id`),
  KEY `core_comic_categories_category_id_322b9743_fk_core_category_id` (`category_id`),
  CONSTRAINT `core_comic_categories_category_id_322b9743_fk_core_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`id`),
  CONSTRAINT `core_comic_categories_comic_id_1a5420be_fk_core_comic_id` FOREIGN KEY (`comic_id`) REFERENCES `core_comic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_comic_categories`
--

LOCK TABLES `core_comic_categories` WRITE;
/*!40000 ALTER TABLE `core_comic_categories` DISABLE KEYS */;
INSERT INTO `core_comic_categories` VALUES (4,1,2),(5,1,4),(6,1,6),(7,1,7),(8,2,2),(9,2,4),(11,3,5),(13,3,6),(12,3,14),(10,3,15),(14,4,2),(15,4,15),(16,5,4),(17,5,6),(18,5,7),(19,6,2),(20,6,4),(21,6,5),(22,6,7),(23,6,14),(25,7,3),(26,7,6),(27,7,15),(24,7,16),(28,8,5),(30,8,6),(29,8,14),(31,9,4),(32,9,5),(33,9,6),(34,9,7),(35,9,14),(36,10,5),(37,10,6),(38,10,7),(39,10,14),(40,10,15),(41,11,5),(43,11,7),(42,11,14),(44,12,5),(45,12,6),(46,12,7),(47,12,14),(48,12,15),(50,13,5),(52,13,6),(51,13,14),(49,13,15),(53,14,5),(55,14,6),(54,14,14),(58,15,6),(57,15,14),(56,15,15),(3,30,15);
/*!40000 ALTER TABLE `core_comic_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_favorite`
--

DROP TABLE IF EXISTS `core_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `comic_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_favorite_user_id_comic_id_1608b027_uniq` (`user_id`,`comic_id`),
  KEY `core_favorite_comic_id_80bf1c0a_fk_core_comic_id` (`comic_id`),
  CONSTRAINT `core_favorite_comic_id_80bf1c0a_fk_core_comic_id` FOREIGN KEY (`comic_id`) REFERENCES `core_comic` (`id`),
  CONSTRAINT `core_favorite_user_id_6e3cf6dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_favorite`
--

LOCK TABLES `core_favorite` WRITE;
/*!40000 ALTER TABLE `core_favorite` DISABLE KEYS */;
INSERT INTO `core_favorite` VALUES (2,'2025-11-10 15:21:45.319236',9,4),(3,'2025-11-10 15:27:51.592636',9,3),(4,'2025-11-10 15:41:55.825978',15,3);
/*!40000 ALTER TABLE `core_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_number` int unsigned NOT NULL,
  `chapter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_page_chapter_id_b3a0b6d3` (`chapter_id`),
  CONSTRAINT `core_page_chapter_id_b3a0b6d3_fk_core_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `core_chapter` (`id`),
  CONSTRAINT `core_page_page_number_62702843_check` CHECK ((`page_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,'Truyện Giả Lập Số 01/Chuong 01/001.jpg',1,1),(2,'Truyện Giả Lập Số 01/Chuong 01/002.jpg',2,1),(3,'Truyện Giả Lập Số 01/Chuong 01/003.jpg',3,1),(4,'Truyện Giả Lập Số 01/Chuong 02/001.jpg',1,2),(5,'Truyện Giả Lập Số 01/Chuong 02/002.jpg',2,2),(6,'Truyện Giả Lập Số 01/Chuong 02/003.jpg',3,2),(7,'Truyện Giả Lập Số 01/Chuong 03/001.jpg',1,3),(8,'Truyện Giả Lập Số 01/Chuong 03/002.jpg',2,3),(9,'Truyện Giả Lập Số 01/Chuong 03/003.jpg',3,3),(10,'Truyện Giả Lập Số 01/Chuong 04/001.jpg',1,4),(11,'Truyện Giả Lập Số 01/Chuong 04/002.jpg',2,4),(12,'Truyện Giả Lập Số 01/Chuong 04/003.jpg',3,4),(13,'Truyện Giả Lập Số 02/Chuong 01/001.jpg',1,5),(14,'Truyện Giả Lập Số 02/Chuong 01/002.jpg',2,5),(15,'Truyện Giả Lập Số 02/Chuong 01/003.jpg',3,5),(16,'Truyện Giả Lập Số 02/Chuong 02/001.jpg',1,6),(17,'Truyện Giả Lập Số 02/Chuong 02/002.jpg',2,6),(18,'Truyện Giả Lập Số 02/Chuong 02/003.jpg',3,6),(19,'Truyện Giả Lập Số 02/Chuong 03/001.jpg',1,7),(20,'Truyện Giả Lập Số 02/Chuong 03/002.jpg',2,7),(21,'Truyện Giả Lập Số 02/Chuong 03/003.jpg',3,7),(22,'Truyện Giả Lập Số 02/Chuong 04/001.jpg',1,8),(23,'Truyện Giả Lập Số 02/Chuong 04/002.jpg',2,8),(24,'Truyện Giả Lập Số 02/Chuong 04/003.jpg',3,8),(25,'Truyện Giả Lập Số 03/Chuong 01/001.jpg',1,9),(26,'Truyện Giả Lập Số 03/Chuong 01/002.jpg',2,9),(27,'Truyện Giả Lập Số 03/Chuong 01/003.jpg',3,9),(28,'Truyện Giả Lập Số 03/Chuong 02/001.jpg',1,10),(29,'Truyện Giả Lập Số 03/Chuong 02/002.jpg',2,10),(30,'Truyện Giả Lập Số 03/Chuong 02/003.jpg',3,10),(31,'Truyện Giả Lập Số 03/Chuong 03/001.jpg',1,11),(32,'Truyện Giả Lập Số 03/Chuong 03/002.jpg',2,11),(33,'Truyện Giả Lập Số 03/Chuong 03/003.jpg',3,11),(34,'Truyện Giả Lập Số 03/Chuong 04/001.jpg',1,12),(35,'Truyện Giả Lập Số 03/Chuong 04/002.jpg',2,12),(36,'Truyện Giả Lập Số 03/Chuong 04/003.jpg',3,12),(37,'Truyện Giả Lập Số 04/Chuong 01/001.jpg',1,13),(38,'Truyện Giả Lập Số 04/Chuong 01/002.jpg',2,13),(39,'Truyện Giả Lập Số 04/Chuong 01/003.jpg',3,13),(40,'Truyện Giả Lập Số 04/Chuong 02/001.jpg',1,14),(41,'Truyện Giả Lập Số 04/Chuong 02/002.jpg',2,14),(42,'Truyện Giả Lập Số 04/Chuong 02/003.jpg',3,14),(43,'Truyện Giả Lập Số 04/Chuong 03/001.jpg',1,15),(44,'Truyện Giả Lập Số 04/Chuong 03/002.jpg',2,15),(45,'Truyện Giả Lập Số 04/Chuong 03/003.jpg',3,15),(46,'Truyện Giả Lập Số 04/Chuong 04/001.jpg',1,16),(47,'Truyện Giả Lập Số 04/Chuong 04/002.jpg',2,16),(48,'Truyện Giả Lập Số 04/Chuong 04/003.jpg',3,16),(49,'Truyện Giả Lập Số 05/Chuong 01/001.jpg',1,17),(50,'Truyện Giả Lập Số 05/Chuong 01/002.jpg',2,17),(51,'Truyện Giả Lập Số 05/Chuong 01/003.jpg',3,17),(52,'Truyện Giả Lập Số 05/Chuong 02/001.jpg',1,18),(53,'Truyện Giả Lập Số 05/Chuong 02/002.jpg',2,18),(54,'Truyện Giả Lập Số 05/Chuong 02/003.jpg',3,18),(55,'Truyện Giả Lập Số 05/Chuong 03/001.jpg',1,19),(56,'Truyện Giả Lập Số 05/Chuong 03/002.jpg',2,19),(57,'Truyện Giả Lập Số 05/Chuong 03/003.jpg',3,19),(58,'Truyện Giả Lập Số 05/Chuong 04/001.jpg',1,20),(59,'Truyện Giả Lập Số 05/Chuong 04/002.jpg',2,20),(60,'Truyện Giả Lập Số 05/Chuong 04/003.jpg',3,20),(61,'Truyện Giả Lập Số 06/Chuong 01/001.jpg',1,21),(62,'Truyện Giả Lập Số 06/Chuong 01/002.jpg',2,21),(63,'Truyện Giả Lập Số 06/Chuong 01/003.jpg',3,21),(64,'Truyện Giả Lập Số 06/Chuong 02/001.jpg',1,22),(65,'Truyện Giả Lập Số 06/Chuong 02/002.jpg',2,22),(66,'Truyện Giả Lập Số 06/Chuong 02/003.jpg',3,22),(67,'Truyện Giả Lập Số 06/Chuong 03/001.jpg',1,23),(68,'Truyện Giả Lập Số 06/Chuong 03/002.jpg',2,23),(69,'Truyện Giả Lập Số 06/Chuong 03/003.jpg',3,23),(70,'Truyện Giả Lập Số 06/Chuong 04/001.jpg',1,24),(71,'Truyện Giả Lập Số 06/Chuong 04/002.jpg',2,24),(72,'Truyện Giả Lập Số 06/Chuong 04/003.jpg',3,24),(73,'Truyện Giả Lập Số 07/Chuong 01/001.jpg',1,25),(74,'Truyện Giả Lập Số 07/Chuong 01/002.jpg',2,25),(75,'Truyện Giả Lập Số 07/Chuong 01/003.jpg',3,25),(76,'Truyện Giả Lập Số 07/Chuong 02/001.jpg',1,26),(77,'Truyện Giả Lập Số 07/Chuong 02/002.jpg',2,26),(78,'Truyện Giả Lập Số 07/Chuong 02/003.jpg',3,26),(79,'Truyện Giả Lập Số 07/Chuong 03/001.jpg',1,27),(80,'Truyện Giả Lập Số 07/Chuong 03/002.jpg',2,27),(81,'Truyện Giả Lập Số 07/Chuong 03/003.jpg',3,27),(82,'Truyện Giả Lập Số 07/Chuong 04/001.jpg',1,28),(83,'Truyện Giả Lập Số 07/Chuong 04/002.jpg',2,28),(84,'Truyện Giả Lập Số 07/Chuong 04/003.jpg',3,28),(85,'Truyện Giả Lập Số 08/Chuong 01/001.jpg',1,29),(86,'Truyện Giả Lập Số 08/Chuong 01/002.jpg',2,29),(87,'Truyện Giả Lập Số 08/Chuong 01/003.jpg',3,29),(88,'Truyện Giả Lập Số 08/Chuong 02/001.jpg',1,30),(89,'Truyện Giả Lập Số 08/Chuong 02/002.jpg',2,30),(90,'Truyện Giả Lập Số 08/Chuong 02/003.jpg',3,30),(91,'Truyện Giả Lập Số 08/Chuong 03/001.jpg',1,31),(92,'Truyện Giả Lập Số 08/Chuong 03/002.jpg',2,31),(93,'Truyện Giả Lập Số 08/Chuong 03/003.jpg',3,31),(94,'Truyện Giả Lập Số 08/Chuong 04/001.jpg',1,32),(95,'Truyện Giả Lập Số 08/Chuong 04/002.jpg',2,32),(96,'Truyện Giả Lập Số 08/Chuong 04/003.jpg',3,32),(109,'Truyện Giả Lập Số 10/Chuong 01/001.jpg',1,37),(110,'Truyện Giả Lập Số 10/Chuong 01/002.jpg',2,37),(111,'Truyện Giả Lập Số 10/Chuong 01/003.jpg',3,37),(112,'Truyện Giả Lập Số 10/Chuong 02/001.jpg',1,38),(113,'Truyện Giả Lập Số 10/Chuong 02/002.jpg',2,38),(114,'Truyện Giả Lập Số 10/Chuong 02/003.jpg',3,38),(115,'Truyện Giả Lập Số 10/Chuong 03/001.jpg',1,39),(116,'Truyện Giả Lập Số 10/Chuong 03/002.jpg',2,39),(117,'Truyện Giả Lập Số 10/Chuong 03/003.jpg',3,39),(118,'Truyện Giả Lập Số 10/Chuong 04/001.jpg',1,40),(119,'Truyện Giả Lập Số 10/Chuong 04/002.jpg',2,40),(120,'Truyện Giả Lập Số 10/Chuong 04/003.jpg',3,40),(121,'Truyện Giả Lập Số 11/Chuong 01/001.jpg',1,41),(122,'Truyện Giả Lập Số 11/Chuong 01/002.jpg',2,41),(123,'Truyện Giả Lập Số 11/Chuong 01/003.jpg',3,41),(124,'Truyện Giả Lập Số 11/Chuong 02/001.jpg',1,42),(125,'Truyện Giả Lập Số 11/Chuong 02/002.jpg',2,42),(126,'Truyện Giả Lập Số 11/Chuong 02/003.jpg',3,42),(127,'Truyện Giả Lập Số 11/Chuong 03/001.jpg',1,43),(128,'Truyện Giả Lập Số 11/Chuong 03/002.jpg',2,43),(129,'Truyện Giả Lập Số 11/Chuong 03/003.jpg',3,43),(130,'Truyện Giả Lập Số 11/Chuong 04/001.jpg',1,44),(131,'Truyện Giả Lập Số 11/Chuong 04/002.jpg',2,44),(132,'Truyện Giả Lập Số 11/Chuong 04/003.jpg',3,44),(133,'Truyện Giả Lập Số 12/Chuong 01/001.jpg',1,45),(134,'Truyện Giả Lập Số 12/Chuong 01/002.jpg',2,45),(135,'Truyện Giả Lập Số 12/Chuong 01/003.jpg',3,45),(136,'Truyện Giả Lập Số 12/Chuong 02/001.jpg',1,46),(137,'Truyện Giả Lập Số 12/Chuong 02/002.jpg',2,46),(138,'Truyện Giả Lập Số 12/Chuong 02/003.jpg',3,46),(139,'Truyện Giả Lập Số 12/Chuong 03/001.jpg',1,47),(140,'Truyện Giả Lập Số 12/Chuong 03/002.jpg',2,47),(141,'Truyện Giả Lập Số 12/Chuong 03/003.jpg',3,47),(142,'Truyện Giả Lập Số 12/Chuong 04/001.jpg',1,48),(143,'Truyện Giả Lập Số 12/Chuong 04/002.jpg',2,48),(144,'Truyện Giả Lập Số 12/Chuong 04/003.jpg',3,48),(145,'Truyện Giả Lập Số 13/Chuong 01/001.jpg',1,49),(146,'Truyện Giả Lập Số 13/Chuong 01/002.jpg',2,49),(147,'Truyện Giả Lập Số 13/Chuong 01/003.jpg',3,49),(148,'Truyện Giả Lập Số 13/Chuong 02/001.jpg',1,50),(149,'Truyện Giả Lập Số 13/Chuong 02/002.jpg',2,50),(150,'Truyện Giả Lập Số 13/Chuong 02/003.jpg',3,50),(151,'Truyện Giả Lập Số 13/Chuong 03/001.jpg',1,51),(152,'Truyện Giả Lập Số 13/Chuong 03/002.jpg',2,51),(153,'Truyện Giả Lập Số 13/Chuong 03/003.jpg',3,51),(154,'Truyện Giả Lập Số 13/Chuong 04/001.jpg',1,52),(155,'Truyện Giả Lập Số 13/Chuong 04/002.jpg',2,52),(156,'Truyện Giả Lập Số 13/Chuong 04/003.jpg',3,52),(157,'Truyện Giả Lập Số 14/Chuong 01/001.jpg',1,53),(158,'Truyện Giả Lập Số 14/Chuong 01/002.jpg',2,53),(159,'Truyện Giả Lập Số 14/Chuong 01/003.jpg',3,53),(160,'Truyện Giả Lập Số 14/Chuong 02/001.jpg',1,54),(161,'Truyện Giả Lập Số 14/Chuong 02/002.jpg',2,54),(162,'Truyện Giả Lập Số 14/Chuong 02/003.jpg',3,54),(163,'Truyện Giả Lập Số 14/Chuong 03/001.jpg',1,55),(164,'Truyện Giả Lập Số 14/Chuong 03/002.jpg',2,55),(165,'Truyện Giả Lập Số 14/Chuong 03/003.jpg',3,55),(166,'Truyện Giả Lập Số 14/Chuong 04/001.jpg',1,56),(167,'Truyện Giả Lập Số 14/Chuong 04/002.jpg',2,56),(168,'Truyện Giả Lập Số 14/Chuong 04/003.jpg',3,56),(197,'comics/the-urban-legend-files/chapter_1/image.jpg',4,41),(198,'comics/genikasuri/chapter_1/image_bFwFRZa.jpg',1,61),(199,'comics/genikasuri/chapter_2/image.jpg',1,62),(200,'comics/genikasuri/chapter_3/image.jpg',1,63),(201,'comics/genikasuri/chapter_4/image.jpg',1,64),(202,'comics/xin-chao-bac-si-thu-y/chapter_1/image.jpg',1,65),(203,'comics/xin-chao-bac-si-thu-y/chapter_2/image.jpg',1,66),(204,'comics/xin-chao-bac-si-thu-y/chapter_3/image.jpg',1,67),(205,'comics/xin-chao-bac-si-thu-y/chapter_4/image.jpg',1,68);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_readinghistory`
--

DROP TABLE IF EXISTS `core_readinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_readinghistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `read_at` datetime(6) NOT NULL,
  `chapter_id` bigint NOT NULL,
  `comic_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `page_number` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_readinghistory_user_id_comic_id_41ead20f_uniq` (`user_id`,`comic_id`),
  KEY `core_readinghistory_chapter_id_6427d836_fk_core_chapter_id` (`chapter_id`),
  KEY `core_readinghistory_comic_id_0e04ef6b_fk_core_comic_id` (`comic_id`),
  KEY `core_readinghistory_user_id_e56a3a9c` (`user_id`),
  KEY `core_readin_user_id_fc79c3_idx` (`user_id`,`read_at` DESC),
  CONSTRAINT `core_readinghistory_chapter_id_6427d836_fk_core_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `core_chapter` (`id`),
  CONSTRAINT `core_readinghistory_comic_id_0e04ef6b_fk_core_comic_id` FOREIGN KEY (`comic_id`) REFERENCES `core_comic` (`id`),
  CONSTRAINT `core_readinghistory_user_id_e56a3a9c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `core_readinghistory_chk_1` CHECK ((`page_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_readinghistory`
--

LOCK TABLES `core_readinghistory` WRITE;
/*!40000 ALTER TABLE `core_readinghistory` DISABLE KEYS */;
INSERT INTO `core_readinghistory` VALUES (4,'2025-11-09 16:18:19.839666',67,23,2,1),(5,'2025-11-09 16:19:44.985753',75,25,2,1),(6,'2025-11-09 17:20:06.418856',2,1,2,1),(7,'2025-11-10 12:43:28.166012',5,2,2,1),(10,'2025-11-09 17:23:35.466908',16,4,2,1),(11,'2025-11-10 04:11:59.516654',17,5,2,1),(12,'2025-11-10 03:51:43.274629',29,8,2,1),(13,'2025-11-10 13:06:41.469946',45,12,2,1),(14,'2025-11-10 13:10:13.250646',41,11,2,1),(17,'2025-11-10 13:29:59.875487',64,15,2,1),(18,'2025-11-10 13:31:53.818336',65,9,2,1),(19,'2025-11-10 13:38:25.240086',23,6,2,1),(20,'2025-11-10 15:24:52.038402',65,9,4,1),(21,'2025-11-10 15:24:34.795721',21,6,4,1),(22,'2025-11-10 16:42:24.189624',66,9,3,1),(23,'2025-11-11 15:27:49.408334',61,15,3,1),(24,'2025-11-10 16:54:12.632861',21,6,3,1),(25,'2025-11-11 06:33:33.160921',1,1,3,1);
/*!40000 ALTER TABLE `core_readinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-11-09 10:00:16.023475','1','Tình cảm',1,'[{\"added\": {}}]',7,2),(2,'2025-11-09 10:00:31.380334','1','ffffff',1,'[{\"added\": {}}]',8,2),(3,'2025-11-09 10:00:43.439025','1','ffffff - Ch.1: dddddddddđ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"ffffff - Ch.1 - Trang 1\"}}]',9,2),(4,'2025-11-09 10:01:23.361900','2','ffffff - Ch.1.00 - Trang 1',1,'[{\"added\": {}}]',10,2),(5,'2025-11-09 14:18:33.874661','1','ffffff - Ch.1.00: dddddddddđ',3,'',9,2),(6,'2025-11-09 14:19:44.967518','1','ffffff',3,'',8,2),(7,'2025-11-09 14:27:11.010928','2','Action',1,'[{\"added\": {}}]',7,2),(8,'2025-11-09 14:27:28.481558','3','Sci-fi',1,'[{\"added\": {}}]',7,2),(9,'2025-11-09 14:28:11.205509','4','Fantasy',1,'[{\"added\": {}}]',7,2),(10,'2025-11-09 14:28:24.733488','5','Ngôn Tình',1,'[{\"added\": {}}]',7,2),(11,'2025-11-09 14:28:44.686894','6','Romance',1,'[{\"added\": {}}]',7,2),(12,'2025-11-09 14:28:53.923529','7','Mystery',1,'[{\"added\": {}}]',7,2),(13,'2025-11-09 14:29:56.291066','13','Jvinai',1,'[{\"added\": {}}]',7,2),(14,'2025-11-09 14:30:05.598964','13','Jvinai',3,'',7,2),(15,'2025-11-09 14:30:21.416921','14','Oneshot',1,'[{\"added\": {}}]',7,2),(16,'2025-11-09 14:30:38.860786','15','School Life',1,'[{\"added\": {}}]',7,2),(17,'2025-11-09 14:30:52.858621','16','Shounen',1,'[{\"added\": {}}]',7,2),(18,'2025-11-09 14:48:43.447297','16','Cô Gái Trong Màn Đêm',2,'[{\"changed\": {\"fields\": [\"Th\\u1ec3 lo\\u1ea1i\", \"L\\u01b0\\u1ee3t xem\"]}}, {\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1: R\\u1ed3i l\\u01b0\\u1ee3t s\\u1ea5m ti\\u1ebfp\"}}, {\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.2: G\\u00e3 n\\u00e0y c\\u0169ng gan \\u0111\\u1ea5y\"}}, {\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.3: S\\u1ea5m gi\\u00f3 g\\u00e0o th\\u00e9t\"}}, {\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.4: Hai tay L\\u00e2m V\\u00e3n\"}}]',8,2),(19,'2025-11-09 14:49:53.676165','2','Cô Gái Trong Màn Đêm - Ch.1.00: Rồi lượt sấm tiếp',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 1\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 2\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 3\"}}]',9,2),(20,'2025-11-09 14:53:23.564483','2','Cô Gái Trong Màn Đêm - Ch.1.00: Rồi lượt sấm tiếp',3,'',9,2),(21,'2025-11-09 14:53:56.428040','16','Cô Gái Trong Màn Đêm',2,'[{\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1: S\\u1ea5m gi\\u00f3 g\\u00e0o th\\u00e9t\"}}]',8,2),(22,'2025-11-09 14:54:41.821163','6','Cô Gái Trong Màn Đêm - Ch.1.00: Sấm gió gào thét',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 1\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 2\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 3\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"C\\u00f4 G\\u00e1i Trong M\\u00e0n \\u0110\\u00eam - Ch.1.00 - Trang 5\"}}]',9,2),(23,'2025-11-09 14:56:14.361763','6','Cô Gái Trong Màn Đêm - Ch.1.00: Sấm gió gào thét',3,'',9,2),(24,'2025-11-09 14:58:09.934497','16','Cô Gái Trong Màn Đêm',3,'',8,2),(25,'2025-11-09 16:22:24.178867','30','Truyen 30',2,'[{\"changed\": {\"fields\": [\"Th\\u1ec3 lo\\u1ea1i\"]}}]',8,2),(26,'2025-11-09 17:21:49.231789','57','Truyện Giả Lập Số 15 - Ch.1.00: Chương 01 (Truyện 15)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Truy\\u1ec7n Gi\\u1ea3 L\\u1eadp S\\u1ed1 15 - Ch.1.00 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Truy\\u1ec7n Gi\\u1ea3 L\\u1eadp S\\u1ed1 15 - Ch.1.00 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Truy\\u1ec7n Gi\\u1ea3 L\\u1eadp S\\u1ed1 15 - Ch.1.00 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(27,'2025-11-10 03:59:29.889326','1','One Piece',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(28,'2025-11-10 04:00:15.235308','2','Jujutsu Kaisen Modulo',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(29,'2025-11-10 04:01:03.663814','3','Akane-banashi',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(30,'2025-11-10 04:01:46.175076','4','Boruto: Two Blue Vortex',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(31,'2025-11-10 04:03:22.513212','5','Food Wars!: Shokugeki no Soma',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(32,'2025-11-10 04:03:56.097131','6','Boruto: Naruto Next Generations',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(33,'2025-11-10 04:04:48.496402','6','Boruto: Naruto Next Generations',2,'[{\"changed\": {\"fields\": [\"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(34,'2025-11-10 04:05:26.482037','7','Red Cat Ramen',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(35,'2025-11-10 04:05:56.882424','8','BUNGO-unreal',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(36,'2025-11-10 04:06:38.719599','9','Class of Brains',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\", \"L\\u01b0\\u1ee3t xem\"]}}]',8,2),(37,'2025-11-10 04:07:07.087693','10','Hima-Ten!',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(38,'2025-11-10 04:07:44.580298','11','The Urban Legend Files',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(39,'2025-11-10 04:08:07.760912','12','Choujin X',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(40,'2025-11-10 04:08:39.488073','13','Gunze Arabaki\'s Magnificently Maniacal Menagerie!',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(41,'2025-11-10 04:09:07.959970','14','Eunuch of Empire',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(42,'2025-11-10 04:09:36.897977','15','Genikasuri',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\", \"Th\\u1ec3 lo\\u1ea1i\", \"Tr\\u1ea1ng th\\u00e1i\"]}}]',8,2),(43,'2025-11-10 04:12:34.060069','5','Food Wars!: Shokugeki no Soma',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(44,'2025-11-10 10:34:26.547035','15','Genikasuri',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(45,'2025-11-10 10:35:19.315645','15','Genikasuri',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(46,'2025-11-10 10:48:42.068392','57','Genikasuri - Ch.1: Chương 01 (Truyện 15)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(47,'2025-11-10 10:53:22.704176','58','Genikasuri - Ch.2: Chương 02 (Truyện 15)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 5\"}}]',9,2),(48,'2025-11-10 10:53:55.674372','58','Genikasuri - Ch.2: Chương 02 (Truyện 15)',2,'[]',9,2),(49,'2025-11-10 10:54:30.795820','58','Genikasuri - Ch.2: Chương 02 (Truyện 15)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 4\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 5\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(50,'2025-11-10 10:54:58.113344','58','Genikasuri - Ch.2: Chương 02 (Truyện 15)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 4\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 5\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(51,'2025-11-10 10:59:55.671554','59','Genikasuri - Ch.3: Chương 03 (Truyện 15)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(52,'2025-11-10 11:02:48.541551','60','Genikasuri - Ch.4: Chương 04 (Truyện 15)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(53,'2025-11-10 11:07:13.834179','9','Class of Brains',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(54,'2025-11-10 11:11:43.748563','9','Xin Chào! Bác Sĩ Thú Y',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1\", \"Slug\", \"T\\u00e1c gi\\u1ea3\", \"M\\u00f4 t\\u1ea3\"]}}]',8,2),(55,'2025-11-10 11:12:18.381957','9','Xin Chào! Bác Sĩ Thú Y',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\", \"L\\u01b0\\u1ee3t xem\"]}}]',8,2),(56,'2025-11-10 11:14:01.100846','33','Xin Chào! Bác Sĩ Thú Y - Ch.1: Chương 01 (Truyện 09)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(57,'2025-11-10 11:15:03.469465','34','Xin Chào! Bác Sĩ Thú Y - Ch.2: Chương 02 (Truyện 09)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(58,'2025-11-10 11:16:16.193311','35','Xin Chào! Bác Sĩ Thú Y - Ch.3: Chương 03 (Truyện 09)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(59,'2025-11-10 11:17:41.596666','36','Xin Chào! Bác Sĩ Thú Y - Ch.4: Chương 04 (Truyện 09)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 4\"}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 5\"}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 2\", \"fields\": [\"Trang truy\\u1ec7n\"]}}, {\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 3\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(60,'2025-11-10 11:19:14.279769','1','One Piece',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(61,'2025-11-10 11:20:40.015901','5','Food Wars!: Shokugeki no Soma',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(62,'2025-11-10 11:21:32.138190','14','Eunuch of Empire',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(63,'2025-11-10 11:21:47.494047','14','Eunuch of Empire',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(64,'2025-11-10 11:22:19.740812','7','Red Cat Ramen',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(65,'2025-11-10 11:23:05.668538','13','Gunze Arabaki\'s Magnificently Maniacal Menagerie!',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(66,'2025-11-10 11:24:15.765801','12','Choujin X',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(67,'2025-11-10 11:24:34.895012','12','Choujin X',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(68,'2025-11-10 11:25:20.767536','10','Hima-Ten!',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(69,'2025-11-10 11:25:54.832645','8','BUNGO-unreal',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(70,'2025-11-10 11:26:51.217579','4','Boruto: Two Blue Vortex',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(71,'2025-11-10 11:27:34.819581','2','Jujutsu Kaisen Modulo',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(72,'2025-11-10 11:28:09.707701','3','Akane-banashi',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(73,'2025-11-10 11:30:48.261363','11','The Urban Legend Files',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(74,'2025-11-10 13:10:09.843002','41','The Urban Legend Files - Ch.1: Chương 01 (Truyện 11)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"The Urban Legend Files - Ch.1 - Trang 4\"}}]',9,2),(75,'2025-11-10 13:12:56.028684','57','Genikasuri - Ch.1: Chương 01 (Truyện 15)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(76,'2025-11-10 13:13:39.062789','57','Genikasuri - Ch.1: Chương 01 (Truyện 15)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,2),(77,'2025-11-10 13:19:44.086245','169','Genikasuri - Ch.1 - Trang 1',2,'[{\"changed\": {\"fields\": [\"Trang truy\\u1ec7n\"]}}]',10,2),(78,'2025-11-10 13:20:51.978798','57','Genikasuri - Ch.1: Chương 01 (Truyện 15)',3,'',9,2),(79,'2025-11-10 13:21:21.870400','15','Genikasuri',2,'[{\"added\": {\"name\": \"Ch\\u01b0\\u01a1ng\", \"object\": \"Genikasuri - Ch.1: Ch\\u01b0\\u01a1ng 01 (Truy\\u1ec7n 15)\"}}]',8,2),(80,'2025-11-10 13:22:02.262582','61','Genikasuri - Ch.1: Chương 01 (Truyện 15)',2,'[{\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.1 - Trang 1\"}}]',9,2),(81,'2025-11-10 13:24:10.991497','183','Genikasuri - Ch.2 - Trang 4',2,'[]',10,2),(82,'2025-11-10 13:24:23.416219','58','Genikasuri - Ch.2: Chương 02 (Truyện 15)',3,'',9,2),(83,'2025-11-10 13:25:14.738705','62','Genikasuri - Ch.2: Chapter 2- Chương 02 (Truyện 15)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.2 - Trang 1\"}}]',9,2),(84,'2025-11-10 13:25:55.009894','59','Genikasuri - Ch.3: Chương 03 (Truyện 15)',3,'',9,2),(85,'2025-11-10 13:25:55.009930','60','Genikasuri - Ch.4: Chương 04 (Truyện 15)',3,'',9,2),(86,'2025-11-10 13:27:10.009467','63','Genikasuri - Ch.3: Chapter 3 - Chương 03 (Truyện 15)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.3 - Trang 1\"}}]',9,2),(87,'2025-11-10 13:28:12.764291','62','Genikasuri - Ch.2: Chương 02 (Truyện 15)',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1 ch\\u01b0\\u01a1ng\"]}}]',9,2),(88,'2025-11-10 13:28:18.812777','63','Genikasuri - Ch.3: Chương 03 (Truyện 15)',2,'[{\"changed\": {\"fields\": [\"Ti\\u00eau \\u0111\\u1ec1 ch\\u01b0\\u01a1ng\"]}}]',9,2),(89,'2025-11-10 13:29:55.837272','64','Genikasuri - Ch.4: Chương 04 (Truyện 15)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Genikasuri - Ch.4 - Trang 1\"}}]',9,2),(90,'2025-11-10 13:30:37.494372','33','Xin Chào! Bác Sĩ Thú Y - Ch.1: Chương 01 (Truyện 09)',3,'',9,2),(91,'2025-11-10 13:30:37.494405','34','Xin Chào! Bác Sĩ Thú Y - Ch.2: Chương 02 (Truyện 09)',3,'',9,2),(92,'2025-11-10 13:30:37.494423','35','Xin Chào! Bác Sĩ Thú Y - Ch.3: Chương 03 (Truyện 09)',3,'',9,2),(93,'2025-11-10 13:30:37.494438','36','Xin Chào! Bác Sĩ Thú Y - Ch.4: Chương 04 (Truyện 09)',3,'',9,2),(94,'2025-11-10 13:31:41.753380','65','Xin Chào! Bác Sĩ Thú Y - Ch.1: Chương 01 (Truyện 09)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 1\"}}]',9,2),(95,'2025-11-10 13:33:14.713512','66','Xin Chào! Bác Sĩ Thú Y - Ch.2: Chương 02 (Truyện 09)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.2 - Trang 1\"}}]',9,2),(96,'2025-11-10 13:34:19.835178','67','Xin Chào! Bác Sĩ Thú Y - Ch.3: Chương 3 (Truyện 09)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.3 - Trang 1\"}}]',9,2),(97,'2025-11-10 13:35:31.424864','68','Xin Chào! Bác Sĩ Thú Y - Ch.4: Chương 04 (Truyện 09)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.4 - Trang 1\"}}]',9,2),(98,'2025-11-10 13:39:25.035088','6','Boruto: Naruto Next Generations',2,'[{\"changed\": {\"fields\": [\"\\u1ea2nh b\\u00eca\"]}}]',8,2),(99,'2025-11-10 15:27:30.933193','65','Xin Chào! Bác Sĩ Thú Y - Ch.1: Chương 01 (Truyện 09)',2,'[{\"changed\": {\"name\": \"Trang\", \"object\": \"Xin Ch\\u00e0o! B\\u00e1c S\\u0129 Th\\u00fa Y - Ch.1 - Trang 1\", \"fields\": [\"Trang truy\\u1ec7n\"]}}]',9,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','category'),(9,'core','chapter'),(8,'core','comic'),(11,'core','favorite'),(10,'core','page'),(12,'core','readinghistory'),(13,'core','review'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-11-09 09:47:09.406114'),(2,'auth','0001_initial','2025-11-09 09:47:10.835456'),(3,'admin','0001_initial','2025-11-09 09:47:11.146842'),(4,'admin','0002_logentry_remove_auto_add','2025-11-09 09:47:11.159252'),(5,'admin','0003_logentry_add_action_flag_choices','2025-11-09 09:47:11.170493'),(6,'contenttypes','0002_remove_content_type_name','2025-11-09 09:47:11.391564'),(7,'auth','0002_alter_permission_name_max_length','2025-11-09 09:47:11.538065'),(8,'auth','0003_alter_user_email_max_length','2025-11-09 09:47:11.576604'),(9,'auth','0004_alter_user_username_opts','2025-11-09 09:47:11.587231'),(10,'auth','0005_alter_user_last_login_null','2025-11-09 09:47:11.695244'),(11,'auth','0006_require_contenttypes_0002','2025-11-09 09:47:11.700902'),(12,'auth','0007_alter_validators_add_error_messages','2025-11-09 09:47:11.711834'),(13,'auth','0008_alter_user_username_max_length','2025-11-09 09:47:11.846127'),(14,'auth','0009_alter_user_last_name_max_length','2025-11-09 09:47:11.984908'),(15,'auth','0010_alter_group_name_max_length','2025-11-09 09:47:12.015107'),(16,'auth','0011_update_proxy_permissions','2025-11-09 09:47:12.031290'),(17,'auth','0012_alter_user_first_name_max_length','2025-11-09 09:47:12.167592'),(18,'core','0001_initial','2025-11-09 09:47:13.670735'),(19,'core','0002_review_alter_category_options_alter_comic_options_and_more','2025-11-09 09:47:15.631376'),(20,'core','0003_alter_page_unique_together','2025-11-09 09:47:15.750343'),(21,'core','0004_alter_page_image','2025-11-09 09:47:15.764025'),(22,'core','0005_rename_core_chap_comic_i_8371f8_idx_core_chapte_comic_i_e881ad_idx_and_more','2025-11-09 09:47:15.906907'),(23,'sessions','0001_initial','2025-11-09 09:47:15.978017'),(24,'core','0006_delete_review','2025-11-10 15:11:02.580050');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dbks51sueb1s03ycyx3ak2wxdwl52lwf','.eJxVjMEOwiAQRP-FsyECLbAevfsNZGEXqRpISnsy_rtt0oOeJpn3Zt4i4LqUsHaew0TiIow4_XYR05PrDuiB9d5kanWZpyh3RR60y1sjfl0P9--gYC_bWqFnAMWUzQiYiQcNGiEnRqe942S19-fkXLLRIcGI7I01PGxBKoL4fAECgDiM:1vIqGe:Q8MgbwzdIj49sojhQA9Lm1UA0gf1IbZ_GrtrgFEsHMI','2025-11-25 15:26:48.426953'),('dokp3on88rskdotqrp3b93khbpv138ra','.eJxVjMEOwiAQRP-FsyECLbAevfsNZGEXqRpISnsy_rtt0oOeJpn3Zt4i4LqUsHaew0TiIow4_XYR05PrDuiB9d5kanWZpyh3RR60y1sjfl0P9--gYC_bWqFnAMWUzQiYiQcNGiEnRqe942S19-fkXLLRIcGI7I01PGxBKoL4fAECgDiM:1vIWWu:caBP-H-lLaF9sE6pXoXrLVZHWqfo1mT3AcCUQLga3c8','2025-11-24 18:22:16.726224'),('frb7cd17cfnqdbik2sflr11auovpmjrw','.eJxVjEEOwiAQRe_C2hBAWsCl-56BzAyDVA1NSrsy3l1JutDtf-_9l4iwbyXujdc4J3ERRpx-NwR6cO0g3aHeFklL3dYZZVfkQZuclsTP6-H-HRRo5VsDoR8JEIIGlxitNwOosw6BfECylDJn5fyIBDqx0x0ZFWCwSoPP4v0BEqU4jQ:1vI6GK:V1edw_R_vBw5FzbxvujsDbtH3Vvox8oGmNI95twI-8o','2025-11-23 14:19:24.309493');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-11 23:32:40
