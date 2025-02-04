-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: clothes
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(20) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `colour_id` int DEFAULT NULL,
  `purpose_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ac_colour_id` (`colour_id`),
  KEY `fk_ac_purpose_id` (`purpose_id`),
  KEY `fk_ac_owner_id` (`owner_id`),
  CONSTRAINT `fk_ac_colour_id` FOREIGN KEY (`colour_id`) REFERENCES `colours` (`colour_id`),
  CONSTRAINT `fk_ac_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  CONSTRAINT `fk_ac_purpose_id` FOREIGN KEY (`purpose_id`) REFERENCES `purpose` (`purpose_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (1,'belt','Adidas',142,4,1),(2,'belt','Adidas',142,4,1),(3,'belt','Adidas',116,4,2),(4,'belt',NULL,114,3,2),(5,'belt',NULL,142,3,2),(6,'watch','Garmin',142,3,1),(7,'watch','Garmin',134,3,2),(8,'climbing harness','Mammut',134,4,1),(9,'climbing harness','Petzl',73,4,2),(10,'baseball hat','Karimor',142,5,1),(11,'baseball hat','Karimor',73,5,1),(12,'baseball hat','Karimor',114,5,2),(13,'baseball hat','Karimor',142,5,1),(14,'tie',NULL,7,2,1),(15,'tie',NULL,94,2,1),(16,'tie','CharlesTyrwhitt',3,1,2),(17,'tie','CharlesTyrwhitt',88,1,2);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_type`
--

DROP TABLE IF EXISTS `clothes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(20) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `colour_id` int DEFAULT NULL,
  `purpose_id` int DEFAULT NULL,
  `default_location_id` int DEFAULT NULL,
  `current_location_id` int DEFAULT NULL,
  `current_location_date` date DEFAULT NULL,
  `is_clean` tinyint(1) DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cl_colour_id` (`colour_id`),
  KEY `fk_cl_owner_id` (`owner_id`),
  KEY `fk_cl_purpose_id` (`purpose_id`),
  KEY `fk_cl_default_location_id` (`default_location_id`),
  KEY `fk_cl_current_location_id` (`current_location_id`),
  CONSTRAINT `fk_cl_colour_id` FOREIGN KEY (`colour_id`) REFERENCES `colours` (`colour_id`),
  CONSTRAINT `fk_cl_current_location_id` FOREIGN KEY (`current_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_cl_default_location_id` FOREIGN KEY (`default_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_cl_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  CONSTRAINT `fk_cl_purpose_id` FOREIGN KEY (`purpose_id`) REFERENCES `purpose` (`purpose_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_type`
--

LOCK TABLES `clothes_type` WRITE;
/*!40000 ALTER TABLE `clothes_type` DISABLE KEYS */;
INSERT INTO `clothes_type` VALUES (1,'t-shirt','Esprit',142,3,1,1,'2024-06-10',0,2),(2,'t-shirt','Esprit',142,3,1,1,'2024-06-10',1,2),(3,'t-shirt','Esprit',22,3,1,7,'2024-06-12',0,2),(4,'t-shirt','Esprit',22,3,1,7,'2024-06-12',0,2),(5,'t-shirt','Esprit',31,3,1,6,'2024-06-12',1,2),(6,'t-shirt','Esprit',32,3,1,6,'2024-06-12',1,2),(7,'t-shirt','Esprit',38,3,1,6,'2024-06-12',1,2),(8,'t-shirt','Esprit',97,3,1,6,'2024-06-12',1,2),(9,'t-shirt','Esprit',97,3,1,7,'2024-06-12',0,2),(10,'t-shirt','Esprit',140,3,1,7,'2024-06-12',0,2),(11,'t-shirt','Esprit',42,3,1,7,'2024-06-12',0,2),(12,'t-shirt','TheNorthFace',73,3,1,8,'2024-06-12',0,2),(13,'t-shirt','TheNorthFace',73,3,1,9,'2024-06-12',0,2),(14,'t-shirt','TheNorthFace',61,3,1,10,'2024-06-12',0,2),(15,'t-shirt','FruitOfTheLoom',7,3,1,7,'2024-06-10',0,1),(16,'t-shirt','FruitOfTheLoom',7,3,1,7,'2024-06-10',0,1),(17,'t-shirt','FruitOfTheLoom',134,3,1,7,'2024-06-10',0,1),(18,'t-shirt','FruitOfTheLoom',142,3,1,7,'2024-06-10',0,1),(19,'t-shirt','FruitOfTheLoom',142,3,1,1,'2024-06-10',1,1),(20,'t-shirt','FruitOfTheLoom',38,3,1,1,'2024-06-10',1,1),(21,'t-shirt','FruitOfTheLoom',21,3,1,1,'2024-06-10',1,1),(22,'t-shirt','FruitOfTheLoom',12,3,1,1,'2024-06-10',1,1),(23,'shirt','CharlesTyrwhitt',124,1,1,3,'2024-06-12',0,2),(24,'shirt','CharlesTyrwhitt',124,1,1,3,'2024-06-12',0,2),(25,'shirt','CharlesTyrwhitt',76,1,1,1,'2024-06-10',1,2),(26,'shirt','CharlesTyrwhitt',76,1,1,1,'2024-06-10',1,2),(27,'shirt','CharlesTyrwhitt',32,1,1,1,'2024-06-10',1,2),(28,'shirt','CharlesTyrwhitt',32,1,1,1,'2024-06-10',1,2),(29,'shirt','Marks&Spencer',116,2,1,1,'2024-06-10',1,1),(30,'shirt','Marks&Spencer',116,2,1,1,'2024-06-10',1,1),(31,'shirt','Run&Fly',62,3,1,1,'2024-06-10',1,1),(32,'shirt','Craghoppers',7,3,1,1,'2024-06-10',1,1),(33,'jeans','GAP',87,3,1,3,'2024-06-10',0,1),(34,'jeans','GAP',97,3,1,7,'2024-06-10',0,1),(35,'jeans','GAP',97,3,1,7,'2024-06-10',0,1),(36,'jeans','Marks&Spencer',98,3,1,1,'2024-06-10',1,1),(37,'jeans','Mango',97,3,1,1,'2024-06-10',1,1),(38,'jeans','Mango',97,3,1,1,'2024-06-10',1,1),(39,'jeans','Mustang',97,3,1,10,'2024-06-12',0,2),(40,'jeans','Mustang',97,3,1,10,'2024-06-12',0,2),(41,'jeans','Esprit',97,3,1,10,'2024-06-12',1,2),(42,'jeans','Esprit',97,3,1,1,'2024-06-10',1,2),(43,'jeans','MishMash',97,3,1,10,'2024-06-12',0,2),(44,'jeans','MishMash',97,3,1,1,'2024-06-10',1,2),(45,'trousers','CharlesTyrwhitt',140,1,1,1,'2024-06-10',1,2),(46,'trousers','CharlesTyrwhitt',140,1,1,1,'2024-06-10',1,2),(47,'trousers','CharlesTyrwhitt',140,1,1,1,'2024-06-10',1,2),(48,'trousers','Esprit',142,2,1,1,'2024-06-10',1,1),(49,'trousers','Next',142,2,1,1,'2024-06-10',1,1),(50,'blouse','Marks&Spencer',142,1,1,1,'2024-06-10',1,1),(51,'blouse','Marks&Spencer',46,1,1,1,'2024-06-10',1,1),(52,'blouse','Marks&Spencer',56,1,1,1,'2024-06-10',1,1),(53,'hoodie','TooTall',97,3,1,10,'2024-06-12',0,2),(54,'hoodie','TooTall',56,3,1,7,'2024-06-12',0,2),(55,'hoodie','TooTall',73,3,1,7,'2024-06-12',0,2),(56,'hoodie','JackWolfskin',67,5,1,1,'2024-06-10',1,2),(57,'hoodie','JackWolfskin',67,5,1,9,'2024-06-12',1,2),(58,'hoodie','JackWolfskin',7,5,1,9,'2024-06-12',1,2),(59,'hoodie','Craghoppers',7,5,1,1,'2024-06-10',1,1),(60,'hoodie','Craghoppers',97,5,1,7,'2024-06-10',0,1),(61,'hoodie','Craghoppers',16,3,1,1,'2024-06-10',1,1),(62,'hoodie','Craghoppers',142,3,1,7,'2024-06-10',0,1),(63,'dobok','Tusah',116,4,2,7,'2024-06-10',0,1),(64,'dobok','Mooto',116,4,2,7,'2024-06-10',0,1),(65,'dobok','Mooto',116,4,2,7,'2024-06-10',0,1),(66,'dobok','Mooto',116,4,2,6,'2024-06-10',1,1),(67,'dobok','Mooto',116,4,2,6,'2024-06-10',1,1),(68,'dobok','Adidas',116,4,2,6,'2024-06-10',1,1),(69,'dobok','Mooto',116,4,2,2,'2024-06-10',1,2),(70,'sweatpants','GAP',7,4,2,2,'2024-06-10',1,1),(71,'sweatpants','GAP',97,4,2,2,'2024-06-10',1,1),(72,'sweatpants','Adidas',142,4,2,2,'2024-06-10',1,1),(73,'sweatpants','Adidas',142,4,2,7,'2024-06-10',0,1),(74,'sweatpants','Adidas',142,4,2,7,'2024-06-10',0,1),(75,'sweatpants','TooTall',97,4,2,6,'2024-06-12',1,2),(76,'sweatpants','TooTall',97,4,2,6,'2024-06-12',1,2),(77,'sweatpants','TooTall',97,4,2,8,'2024-06-12',0,2),(78,'sweatpants','TooTall',142,4,2,8,'2024-06-12',0,2),(79,'sweatpants','TooTall',142,4,2,10,'2024-06-12',0,2),(80,'blazer','H&M',97,2,1,1,'2024-06-10',1,1),(81,'blazer','H&M',140,2,1,1,'2024-06-10',1,1),(82,'blazer','Marks&Spencer',97,2,1,1,'2024-06-10',1,1),(83,'suit jacket','CharlesTyrwhitt',140,1,1,1,'2024-06-10',1,2),(84,'suit jacket','CharlesTyrwhitt',140,1,1,1,'2024-06-10',1,2),(85,'coat','Trespass',142,5,1,1,'2024-06-10',1,2),(86,'coat','Trespass',140,5,1,1,'2024-06-10',1,2),(87,'coat','TheNorthFace',7,5,1,1,'2024-06-10',1,2),(88,'coat','TheNorthFace',97,5,1,1,'2024-06-10',1,2),(89,'coat','Regatta',19,5,1,1,'2024-06-10',1,1),(90,'coat','Craghoppers',7,5,1,1,'2024-06-10',1,1),(91,'coat','Next',142,2,1,1,'2024-06-10',1,1),(92,'fleece','Craghoppers',73,3,1,1,'2024-06-10',1,1),(93,'fleece','Craghoppers',142,3,1,7,'2024-06-10',0,1),(94,'fleece','Craghoppers',12,3,1,1,'2024-06-10',1,1),(95,'fleece','JackWolfskin',67,3,1,7,'2024-06-12',0,2),(96,'fleece','JackWolfskin',67,3,1,1,'2024-06-10',1,2),(97,'fleece','JackWolfskin',112,3,1,6,'2024-06-12',1,2),(98,'fleece','JackWolfskin',112,3,1,6,'2024-06-12',1,2),(99,'fleece','Craghoppers',7,3,1,6,'2024-06-10',1,1);
/*!40000 ALTER TABLE `clothes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colours`
--

DROP TABLE IF EXISTS `colours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colours` (
  `colour_id` int NOT NULL AUTO_INCREMENT,
  `colour_name` varchar(20) NOT NULL,
  `HEX_code` varchar(8) DEFAULT NULL,
  `RGB_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`colour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colours`
--

LOCK TABLES `colours` WRITE;
/*!40000 ALTER TABLE `colours` DISABLE KEYS */;
INSERT INTO `colours` VALUES (1,'IndianRed','#CD5C5C','rgb(205, 92, 92)'),(2,'LightCoral','#F08080','rgb(240, 128, 128)'),(3,'Salmon','#FA8072','rgb(250, 128, 114)'),(4,'DarkSalmon','#E9967A','rgb(233, 150, 122)'),(5,'LightSalmon','#FFA07A','rgb(255, 160, 122)'),(6,'Crimson','#DC143C','rgb(220, 20, 60)'),(7,'Red','#FF0000','rgb(255, 0, 0)'),(8,'FireBrick','#B22222','rgb(178, 34, 34)'),(9,'DarkRed','#8B0000','rgb(139, 0, 0)'),(10,'Pink','#FFC0CB','rgb(255, 192, 203)'),(11,'LightPink','#FFB6C1','rgb(255, 182, 193)'),(12,'HotPink','#FF69B4','rgb(255, 105, 180)'),(13,'DeepPink','#FF1493','rgb(255, 20, 147)'),(14,'MediumVioletRed','#C71585','rgb(199, 21, 133)'),(15,'PaleVioletRed','#DB7093','rgb(219, 112, 147)'),(16,'Coral','#FF7F50','rgb(255, 127, 80)'),(17,'Tomato','#FF6347','rgb(255, 99, 71)'),(18,'OrangeRed','#FF4500','rgb(255, 69, 0)'),(19,'DarkOrange','#FF8C00','rgb(255, 140, 0)'),(20,'Orange','#FFA500','rgb(255, 165, 0)'),(21,'Gold','#FFD700','rgb(255, 215, 0)'),(22,'Yellow','#FFFF00','rgb(255, 255, 0)'),(23,'LightYellow','#FFFFE0','rgb(255, 255, 224)'),(24,'LemonChiffon','#FFFACD','rgb(255, 250, 205)'),(25,'LightGoldenrodYellow','#FAFAD2','rgb(250, 250, 210)'),(26,'PapayaWhip','#FFEFD5','rgb(255, 239, 213)'),(27,'Moccasin','#FFE4B5','rgb(255, 228, 181)'),(28,'PeachPuff','#FFDAB9','rgb(255, 218, 185)'),(29,'PaleGoldenrod','#EEE8AA','rgb(238, 232, 170)'),(30,'Khaki','#F0E68C','rgb(240, 230, 140)'),(31,'DarkKhaki','#BDB76B','rgb(189, 183, 107)'),(32,'Lavender','#E6E6FA','rgb(230, 230, 250)'),(33,'Thistle','#D8BFD8','rgb(216, 191, 216)'),(34,'Plum','#DDA0DD','rgb(221, 160, 221)'),(35,'Violet','#EE82EE','rgb(238, 130, 238)'),(36,'Orchid','#DA70D6','rgb(218, 112, 214)'),(37,'Fuchsia','#FF00FF','rgb(255, 0, 255)'),(38,'Magenta','#FF00FF','rgb(255, 0, 255)'),(39,'MediumOrchid','#BA55D3','rgb(186, 85, 211)'),(40,'MediumPurple','#9370DB','rgb(147, 112, 219)'),(41,'RebeccaPurple','#663399','rgb(102, 51, 153)'),(42,'BlueViolet','#8A2BE2','rgb(138, 43, 226)'),(43,'DarkViolet','#9400D3','rgb(148, 0, 211)'),(44,'DarkOrchid','#9932CC','rgb(153, 50, 204)'),(45,'DarkMagenta','#8B008B','rgb(139, 0, 139)'),(46,'Purple','#800080','rgb(128, 0, 128)'),(47,'Indigo','#4B0082','rgb(75, 0, 130)'),(48,'SlateBlue','#6A5ACD','rgb(106, 90, 205)'),(49,'DarkSlateBlue','#483D8B','rgb(72, 61, 139)'),(50,'MediumSlateBlue','#7B68EE','rgb(123, 104, 238)'),(51,'GreenYellow','#ADFF2F','rgb(173, 255, 47)'),(52,'Chartreuse','#7FFF00','rgb(127, 255, 0)'),(53,'LawnGreen','#7CFC00','rgb(124, 252, 0)'),(54,'Lime','#00FF00','rgb(0, 255, 0)'),(55,'LimeGreen','#32CD32','rgb(50, 205, 50)'),(56,'PaleGreen','#98FB98','rgb(152, 251, 152)'),(57,'LightGreen','#90EE90','rgb(144, 238, 144)'),(58,'MediumSpringGreen','#00FA9A','rgb(0, 250, 154)'),(59,'SpringGreen','#00FF7F','rgb(0, 255, 127)'),(60,'MediumSeaGreen','#3CB371','rgb(60, 179, 113)'),(61,'SeaGreen','#2E8B57','rgb(46, 139, 87)'),(62,'ForestGreen','#228B22','rgb(34, 139, 34)'),(63,'Green','#008000','rgb(0, 128, 0)'),(64,'DarkGreen','#006400','rgb(0, 100, 0)'),(65,'YellowGreen','#9ACD32','rgb(154, 205, 50)'),(66,'OliveDrab','#6B8E23','rgb(107, 142, 35)'),(67,'Olive','#808000','rgb(128, 128, 0)'),(68,'DarkOliveGreen','#556B2F','rgb(85, 107, 47)'),(69,'MediumAquamarine','#66CDAA','rgb(102, 205, 170)'),(70,'DarkSeaGreen','#8FBC8B','rgb(143, 188, 139)'),(71,'LightSeaGreen','#20B2AA','rgb(32, 178, 170)'),(72,'DarkCyan','#008B8B','rgb(0, 139, 139)'),(73,'Teal','#008080','rgb(0, 128, 128)'),(74,'Aqua','#00FFFF','rgb(0, 255, 255)'),(75,'Cyan','#00FFFF','rgb(0, 255, 255)'),(76,'LightCyan','#E0FFFF','rgb(224, 255, 255)'),(77,'PaleTurquoise','#AFEEEE','rgb(175, 238, 238)'),(78,'Aquamarine','#7FFFD4','rgb(127, 255, 212)'),(79,'Turquoise','#40E0D0','rgb(64, 224, 208)'),(80,'MediumTurquoise','#48D1CC','rgb(72, 209, 204)'),(81,'DarkTurquoise','#00CED1','rgb(0, 206, 209)'),(82,'CadetBlue','#5F9EA0','rgb(95, 158, 160)'),(83,'SteelBlue','#4682B4','rgb(70, 130, 180)'),(84,'LightSteelBlue','#B0C4DE','rgb(176, 196, 222)'),(85,'PowderBlue','#B0E0E6','rgb(176, 224, 230)'),(86,'LightBlue','#ADD8E6','rgb(173, 216, 230)'),(87,'SkyBlue','#87CEEB','rgb(135, 206, 235)'),(88,'LightSkyBlue','#87CEFA','rgb(135, 206, 250)'),(89,'DeepSkyBlue','#00BFFF','rgb(0, 191, 255)'),(90,'DodgerBlue','#1E90FF','rgb(30, 144, 255)'),(91,'CornflowerBlue','#6495ED','rgb(100, 149, 237)'),(92,'MediumSlateBlue','#7B68EE','rgb(123, 104, 238)'),(93,'RoyalBlue','#4169E1','rgb(65, 105, 225)'),(94,'Blue','#0000FF','rgb(0, 0, 255)'),(95,'MediumBlue','#0000CD','rgb(0, 0, 205)'),(96,'DarkBlue','#00008B','rgb(0, 0, 139)'),(97,'Navy','#000080','rgb(0, 0, 128)'),(98,'MidnightBlue','#191970','rgb(25, 25, 112)'),(99,'Cornsilk','#FFF8DC','rgb(255, 248, 220)'),(100,'BlanchedAlmond','#FFEBCD','rgb(255, 235, 205)'),(101,'Bisque','#FFE4C4','rgb(255, 228, 196)'),(102,'NavajoWhite','#FFDEAD','rgb(255, 222, 173)'),(103,'Wheat','#F5DEB3','rgb(245, 222, 179)'),(104,'BurlyWood','#DEB887','rgb(222, 184, 135)'),(105,'Tan','#D2B48C','rgb(210, 180, 140)'),(106,'RosyBrown','#BC8F8F','rgb(188, 143, 143)'),(107,'SandyBrown','#F4A460','rgb(244, 164, 96)'),(108,'Goldenrod','#DAA520','rgb(218, 165, 32)'),(109,'DarkGoldenrod','#B8860B','rgb(184, 134, 11)'),(110,'Peru','#CD853F','rgb(205, 133, 63)'),(111,'Chocolate','#D2691E','rgb(210, 105, 30)'),(112,'SaddleBrown','#8B4513','rgb(139, 69, 19)'),(113,'Sienna','#A0522D','rgb(160, 82, 45)'),(114,'Brown','#A52A2A','rgb(165, 42, 42)'),(115,'Maroon','#800000','rgb(128, 0, 0)'),(116,'White','#FFFFFF','rgb(255, 255, 255)'),(117,'Snow','#FFFAFA','rgb(255, 250, 250)'),(118,'HoneyDew','#F0FFF0','rgb(240, 255, 240)'),(119,'MintCream','#F5FFFA','rgb(245, 255, 250)'),(120,'Azure','#F0FFFF','rgb(240, 255, 255)'),(121,'AliceBlue','#F0F8FF','rgb(240, 248, 255)'),(122,'GhostWhite','#F8F8FF','rgb(248, 248, 255)'),(123,'WhiteSmoke','#F5F5F5','rgb(245, 245, 245)'),(124,'SeaShell','#FFF5EE','rgb(255, 245, 238)'),(125,'Beige','#F5F5DC','rgb(245, 245, 220)'),(126,'OldLace','#FDF5E6','rgb(253, 245, 230)'),(127,'FloralWhite','#FFFAF0','rgb(255, 250, 240)'),(128,'Ivory','#FFFFF0','rgb(255, 255, 240)'),(129,'AntiqueWhite','#FAEBD7','rgb(250, 235, 215)'),(130,'Linen','#FAF0E6','rgb(250, 240, 230)'),(131,'LavenderBlush','#FFF0F5','rgb(255, 240, 245)'),(132,'MistyRose','#FFE4E1','rgb(255, 228, 225)'),(133,'Gainsboro','#DCDCDC','rgb(220, 220, 220)'),(134,'LightGray','#D3D3D3','rgb(211, 211, 211)'),(135,'Silver','#C0C0C0','rgb(192, 192, 192)'),(136,'DarkGray','#A9A9A9','rgb(169, 169, 169)'),(137,'Gray','#808080','rgb(128, 128, 128)'),(138,'DimGray','#696969','rgb(105, 105, 105)'),(139,'LightSlateGray','#778899','rgb(119, 136, 153)'),(140,'SlateGray','#708090','rgb(112, 128, 144)'),(141,'DarkSlateGray','#2F4F4F','rgb(47, 79, 79)'),(142,'Black','#000000','rgb(0, 0, 0)');
/*!40000 ALTER TABLE `colours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'wardrobe'),(2,'drawer'),(3,'bedroom door'),(4,'bathroom door'),(5,'living door'),(6,'drying rack'),(7,'laundry basket'),(8,'floor'),(9,'chair'),(10,'banister'),(11,'the pile');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(20) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Anna'),(2,'Pati'),(3,'Borrowed'),(4,'Recycled');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purpose`
--

DROP TABLE IF EXISTS `purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purpose` (
  `purpose_id` int NOT NULL AUTO_INCREMENT,
  `purpose` varchar(20) NOT NULL,
  PRIMARY KEY (`purpose_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpose`
--

LOCK TABLES `purpose` WRITE;
/*!40000 ALTER TABLE `purpose` DISABLE KEYS */;
INSERT INTO `purpose` VALUES (1,'smart'),(2,'smart-casual'),(3,'casual'),(4,'gym'),(5,'outdoor');
/*!40000 ALTER TABLE `purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_cayman_account`
--

DROP TABLE IF EXISTS `secret_cayman_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secret_cayman_account` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `cay_owner_id` int DEFAULT '1',
  `per_job` float DEFAULT NULL,
  `job_date` date DEFAULT (curdate()),
  PRIMARY KEY (`transaction_id`),
  KEY `fk_cay_owner_id` (`cay_owner_id`),
  CONSTRAINT `fk_cay_owner_id` FOREIGN KEY (`cay_owner_id`) REFERENCES `owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_cayman_account`
--

LOCK TABLES `secret_cayman_account` WRITE;
/*!40000 ALTER TABLE `secret_cayman_account` DISABLE KEYS */;
INSERT INTO `secret_cayman_account` VALUES (1,1,60,'2024-06-24'),(2,1,60,'2024-06-24');
/*!40000 ALTER TABLE `secret_cayman_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(20) NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `colour_id` int DEFAULT NULL,
  `purpose_id` int DEFAULT NULL,
  `is_clean` tinyint(1) DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sh_colour_id` (`colour_id`),
  KEY `fk_sh_purpose_id` (`purpose_id`),
  KEY `fk_sh_owner_id` (`owner_id`),
  CONSTRAINT `fk_sh_colour_id` FOREIGN KEY (`colour_id`) REFERENCES `colours` (`colour_id`),
  CONSTRAINT `fk_sh_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  CONSTRAINT `fk_sh_purpose_id` FOREIGN KEY (`purpose_id`) REFERENCES `purpose` (`purpose_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES (1,'trainers','RocketDog',56,3,1,1),(2,'trainers','RocketDog',22,3,1,1),(3,'trainers','Fila',116,3,1,1),(4,'martial arts','Adidas',116,4,1,1),(5,'climbing','ClimbX',7,4,1,1),(6,'climbing','Scarpa',73,4,1,2),(7,'climbing','Scarpa',73,4,1,2),(8,'hiking','Meindl',140,5,0,1),(9,'hiking','Scarpa',7,5,1,1),(10,'hiking','Meindl',114,5,1,2),(11,'hiking','Meindl',114,5,0,2),(12,'hiking','Scarpa',94,5,1,2),(13,'running','Karimor',59,5,0,1),(14,'running','Asics',19,5,0,2),(15,'dress','Gabor',142,1,1,1),(16,'dress',NULL,142,1,1,2),(17,'dress',NULL,142,1,1,2),(18,'heels','Gabor',7,2,1,1),(19,'heels',NULL,142,2,1,1);
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clean_clothes`
--

DROP TABLE IF EXISTS `vw_clean_clothes`;
/*!50001 DROP VIEW IF EXISTS `vw_clean_clothes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clean_clothes` AS SELECT 
 1 AS `owner_name`,
 1 AS `item`,
 1 AS `colour_name`,
 1 AS `location`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'clothes'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `update_clothes_locations` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_clothes_locations` ON SCHEDULE EVERY 1 WEEK STARTS '2024-06-27 15:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Update current_location_id to default_location_id where current_location_id = "drying rack" -> fold and put away the clothes
    UPDATE Clothes_type
    SET current_location_id = default_location_id
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
        AND current_location_date != CURDATE()
        AND owner_id = (SELECT owner_id FROM Owner WHERE owner_name = "Anna");
        
    -- Update current_location_id to "the pile" for Pati's clothes  
	UPDATE Clothes_type
    SET current_location_id = (SELECT location_ FROM Location WHERE location = "the pile")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
		AND owner_id = (SELECT owner_id FROM Owner WHERE owner_name = "Pati")
        AND current_location_date != CURDATE();

    -- Change current_location_id from "laundry basket" to "drying rack" where the owner is "Anna" -> do and hang the laundry
    UPDATE Clothes_type
    SET current_location_id = (SELECT location_id FROM Location WHERE location = "drying rack")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "laundry basket")
        AND owner_id = (SELECT owner_id FROM owner WHERE owner_name = "Anna");
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_location_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_location_event` ON SCHEDULE EVERY 7 DAY STARTS '2024-06-22 16:39:30' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Update the current_location_id to "laundry basket" where current_location_id is "banister"
    -- and current_location_date is 14 or more days ago
    UPDATE Clothes_type
    SET current_location_id = (SELECT location_id FROM Location WHERE location = "laundry basket")
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "banister")
    AND (CURDATE() - Clothes_type.current_location_date) >= 14;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'clothes'
--
/*!50003 DROP FUNCTION IF EXISTS `check_laundry_basket_items` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_laundry_basket_items`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE item_count INT;
    SET item_count = (SELECT COUNT(*) FROM clothes_type WHERE current_location_id = (SELECT location_id FROM location WHERE location = "laundry basket"));
    IF item_count >= 10 THEN
        RETURN "It's time you run the laundry!";
    ELSE
        RETURN "Laundry can wait another day or two.";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_cayman_dosh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_cayman_dosh`(
	IN per_hour FLOAT,
    IN num_hours FLOAT
)
BEGIN
	DECLARE per_job_amount FLOAT;
    DECLARE number_of_shirts INT;

	-- calculate the per_job amount, round up the num_hours as it is charged per every hour started; if any shirts need pressing, it is charged £5 per shirt in addition to the per_hour charge
    SELECT COUNT(*) INTO number_of_shirts
    FROM clothes_type
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "the pile")
        AND item = "shirt";
    IF number_of_shirts > 0 THEN
		SET per_job_amount = per_hour * CEIL(num_hours) + (number_of_shirts * 5);
	ELSEIF number_of_shirts = 0 THEN
		SET per_job_amount = per_hour * CEIL(num_hours);
    END IF; 
    
    -- update the current_location to default_location on clothes that were in "the pile" and have now been pressed, folded and put away where they belong
    UPDATE Clothes_type
    SET current_location_id = default_location_id
    WHERE current_location_id = (SELECT location_id FROM Location WHERE location = "the pile");
    
    -- update the secret_cayman_account table with the new line containing the money earn from this task
    INSERT INTO secret_cayman_account
    (per_job)
    VALUES
    (per_job_amount);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_current_location_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_current_location_date`()
BEGIN

	UPDATE Clothes_type
	SET current_location_date = CURDATE()
	WHERE current_location_date IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clean_clothes`
--

/*!50001 DROP VIEW IF EXISTS `vw_clean_clothes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clean_clothes` AS select `o`.`owner_name` AS `owner_name`,`ct`.`item` AS `item`,`col`.`colour_name` AS `colour_name`,`l`.`location` AS `location` from (((`clothes_type` `ct` left join `owner` `o` on((`ct`.`owner_id` = `o`.`owner_id`))) left join `colours` `col` on((`ct`.`colour_id` = `col`.`colour_id`))) left join `location` `l` on((`ct`.`current_location_id` = `l`.`location_id`))) where (`ct`.`is_clean` = 1) */;
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

-- Dump completed on 2024-06-24 12:32:14
