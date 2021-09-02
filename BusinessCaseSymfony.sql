-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: BusinessCaseSymfony
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.21.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `garage_id` int NOT NULL,
  `carburant_id` int NOT NULL,
  `modele_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee_circulation` int NOT NULL,
  `kilometrage` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `ref_annonce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_annonce` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F65593E5C4FFF555` (`garage_id`),
  KEY `IDX_F65593E532DAAD24` (`carburant_id`),
  KEY `IDX_F65593E5AC14B70A` (`modele_id`),
  CONSTRAINT `FK_F65593E532DAAD24` FOREIGN KEY (`carburant_id`) REFERENCES `carburant` (`id`),
  CONSTRAINT `FK_F65593E5AC14B70A` FOREIGN KEY (`modele_id`) REFERENCES `modele` (`id`),
  CONSTRAINT `FK_F65593E5C4FFF555` FOREIGN KEY (`garage_id`) REFERENCES `garage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annonce`
--

LOCK TABLES `annonce` WRITE;
/*!40000 ALTER TABLE `annonce` DISABLE KEYS */;
INSERT INTO `annonce` VALUES (59,15,2,218,'testPhoto','dqzdq',1982,45,245.00,'EHIjdmT25D','2021-08-13'),(60,15,4,17,'dzqd','dzqqzd',1984,15487,5148454.00,'LxDzIWgTVi','2021-08-13'),(61,15,4,17,'dzqd','dzqqzd',1984,15487,5148454.00,'hwuetsGzTd','2021-08-13'),(62,15,4,17,'dzqd','dzqqzd',1984,15487,5148454.00,'jcj3xP8lk4','2021-08-13'),(63,16,6,616,'fqzdzqd','dzuiqduqgidhqz',1245,1245,1245.00,'dqzdqz45qz5d','2021-08-23'),(64,16,6,616,'fqzdzqd','dzuiqduqgidhqz',1245,1245,1245.00,'dqzdqz45qz5d','2021-08-23');
/*!40000 ALTER TABLE `annonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carburant`
--

DROP TABLE IF EXISTS `carburant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carburant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carburant`
--

LOCK TABLES `carburant` WRITE;
/*!40000 ALTER TABLE `carburant` DISABLE KEYS */;
INSERT INTO `carburant` VALUES (1,'Essence'),(2,'Diesel'),(3,'Hybride'),(4,'Electricite'),(5,'GPL'),(6,'Autres');
/*!40000 ALTER TABLE `carburant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20210721124709','2021-07-21 14:47:21',868),('DoctrineMigrations\\Version20210721142139','2021-07-21 16:21:46',119),('DoctrineMigrations\\Version20210806074015','2021-08-06 09:40:21',95),('DoctrineMigrations\\Version20210806074754','2021-08-06 09:47:59',259),('DoctrineMigrations\\Version20210806080152','2021-08-06 10:01:57',40),('DoctrineMigrations\\Version20210806090417','2021-08-06 11:04:25',140),('DoctrineMigrations\\Version20210806093359','2021-08-06 11:34:06',172),('DoctrineMigrations\\Version20210806093445','2021-08-06 11:34:48',168),('DoctrineMigrations\\Version20210806093707','2021-08-06 11:37:11',99),('DoctrineMigrations\\Version20210806094459','2021-08-06 11:45:05',119);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage`
--

DROP TABLE IF EXISTS `garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionnel_id` int DEFAULT NULL,
  `ligne1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ligne2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ligne3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_postal` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F26610B8A49CC82` (`professionnel_id`),
  CONSTRAINT `FK_9F26610B8A49CC82` FOREIGN KEY (`professionnel_id`) REFERENCES `professionnel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage`
--

LOCK TABLES `garage` WRITE;
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` VALUES (15,'KokugaGarage','0358234812','59603621411827',2,'90 Place de la Gare','','','68000','COLMAR'),(16,'AAA','4875412457','12345678987456',2,'24 dqzdqz','','','15487','dqzq');
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Audi'),(2,'Chevrolet'),(3,'Cadillac'),(4,'Acura'),(5,'BMW'),(6,'Chrysler'),(7,'Ford'),(8,'Buick'),(9,'INFINITI'),(10,'GMC'),(11,'Honda'),(12,'Hyundai'),(13,'Jeep'),(14,'Genesis'),(15,'Dodge'),(16,'Jaguar'),(17,'Kia'),(18,'Land Rover'),(19,'Lexus'),(20,'Mercedes-Benz'),(21,'Mitsubishi'),(22,'Lincoln'),(23,'MAZDA'),(24,'Nissan'),(25,'MINI'),(26,'Porsche'),(27,'Ram'),(28,'Subaru'),(29,'Toyota'),(30,'Volkswagen'),(31,'Volvo'),(32,'Alfa Romeo'),(33,'FIAT'),(34,'Freightliner'),(35,'Maserati'),(36,'Tesla'),(37,'Aston Martin'),(38,'Bentley'),(39,'Ferrari'),(40,'Lamborghini'),(41,'Lotus'),(42,'McLaren'),(43,'Rolls-Royce'),(44,'smart'),(45,'Scion'),(46,'SRT'),(47,'Suzuki'),(48,'Fisker'),(49,'Maybach'),(50,'Mercury'),(51,'Saab'),(52,'HUMMER'),(53,'Pontiac'),(54,'Saturn'),(55,'Isuzu'),(56,'Panoz'),(57,'Oldsmobile'),(58,'Daewoo'),(59,'Eagle'),(60,'Geo'),(61,'Plymouth'),(62,'Daihatsu'),(63,'Polestar'),(64,'Rivian');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modele` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marque_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_100285584827B9B2` (`marque_id`),
  CONSTRAINT `FK_100285584827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele`
--

LOCK TABLES `modele` WRITE;
/*!40000 ALTER TABLE `modele` DISABLE KEYS */;
INSERT INTO `modele` VALUES (1,1,'Q3'),(2,2,'Malibu'),(3,3,'Escalade ESV'),(4,2,'Corvette'),(5,4,'RLX'),(6,2,'Silverado 2500 HD Crew Cab'),(7,5,'3 Series'),(8,6,'Pacifica'),(9,2,'Colorado Crew Cab'),(10,5,'X3'),(11,4,'TLX'),(12,2,'Silverado 3500 HD Crew Cab'),(13,5,'7 Series'),(14,7,'Fusion'),(15,8,'Envision'),(16,1,'SQ5'),(17,1,'R8'),(18,2,'Traverse'),(19,4,'MDX'),(20,9,'QX80'),(21,8,'Encore'),(22,10,'Sierra 2500 HD Crew Cab'),(23,11,'Insight'),(24,3,'XT6'),(25,3,'XT5'),(26,3,'XT4'),(27,8,'Enclave'),(28,1,'Q5'),(29,12,'Santa Fe'),(30,7,'EcoSport'),(31,7,'Escape'),(32,7,'Mustang'),(33,12,'Sonata'),(34,7,'Edge'),(35,2,'Camaro'),(36,12,'Kona Electric'),(37,2,'Equinox'),(38,10,'Sierra 3500 HD Crew Cab'),(39,13,'Gladiator'),(40,5,'X7'),(41,3,'CT6-V'),(42,1,'A7'),(43,2,'Blazer'),(44,7,'F150 SuperCrew Cab'),(45,2,'Suburban'),(46,11,'Civic'),(47,13,'Compass'),(48,3,'Escalade'),(49,6,'Voyager'),(50,11,'Accord Hybrid'),(51,10,'Terrain'),(52,2,'Spark'),(53,10,'Sierra 1500 Crew Cab'),(54,12,'NEXO'),(55,12,'Veloster'),(56,2,'Silverado 1500 Crew Cab'),(57,14,'G70'),(58,3,'CT5'),(59,11,'Odyssey'),(60,12,'Elantra GT'),(61,4,'RDX'),(62,10,'Yukon XL'),(63,7,'Ranger SuperCab'),(64,7,'Expedition MAX'),(65,12,'Kona'),(66,9,'QX50'),(67,15,'Durango'),(68,10,'Yukon'),(69,12,'Palisade'),(70,11,'Ridgeline'),(71,13,'Cherokee'),(72,2,'Bolt EV'),(73,7,'Expedition'),(74,12,'Elantra'),(75,11,'Passport'),(76,15,'Charger'),(77,11,'Accord'),(78,9,'QX60'),(79,12,'Venue'),(80,11,'Pilot'),(81,13,'Grand Cherokee'),(82,2,'Tahoe'),(83,10,'Acadia'),(84,2,'Impala'),(85,11,'CR-V'),(86,5,'X5'),(87,9,'Q60'),(88,7,'Ranger SuperCrew'),(89,2,'Trax'),(90,12,'Ioniq Plug-in Hybrid'),(91,16,'E-PACE'),(92,12,'Tucson'),(93,7,'Explorer'),(94,11,'HR-V'),(95,16,'I-PACE'),(96,9,'Q50'),(97,14,'G80'),(98,16,'F-PACE'),(99,13,'Renegade'),(100,12,'Accent'),(101,16,'F-TYPE'),(102,13,'Wrangler'),(103,17,'Sorento'),(104,17,'Rio'),(105,18,'Discovery Sport'),(106,17,'Sedona'),(107,17,'Optima'),(108,17,'Sportage'),(109,17,'Optima Hybrid'),(110,17,'Optima Plug-in Hybrid'),(111,18,'Range Rover Evoque'),(112,17,'Telluride'),(113,17,'Forte'),(114,13,'Wrangler Unlimited'),(115,17,'Soul'),(116,18,'Range Rover Sport'),(117,18,'Range Rover'),(118,17,'Stinger'),(119,18,'Discovery'),(120,18,'Range Rover Velar'),(121,19,'ES'),(122,19,'LC'),(123,19,'LX'),(124,19,'RC'),(125,19,'GX'),(126,19,'IS'),(127,19,'GS'),(128,19,'LS'),(129,19,'UX'),(130,20,'GLS'),(131,20,'CLA'),(132,21,'Outlander Sport'),(133,22,'MKZ'),(134,22,'Aviator'),(135,19,'NX'),(136,23,'CX-30'),(137,21,'Eclipse Cross'),(138,23,'MAZDA3'),(139,21,'Mirage G4'),(140,22,'Navigator'),(141,24,'Armada'),(142,23,'CX-5'),(143,22,'Corsair'),(144,22,'Navigator L'),(145,20,'G-Class'),(146,22,'Nautilus'),(147,19,'RX'),(148,24,'Kicks'),(149,24,'Murano'),(150,23,'MAZDA6'),(151,20,'C-Class'),(152,24,'NV3500 HD Passenger'),(153,20,'GLA'),(154,23,'CX-9'),(155,24,'NV1500 Cargo'),(156,20,'E-Class'),(157,25,'Countryman'),(158,20,'GLE'),(159,24,'Maxima'),(160,24,'370Z'),(161,20,'GLC'),(162,21,'Mirage'),(163,24,'Altima'),(164,24,'GT-R'),(165,21,'Outlander'),(166,21,'Outlander PHEV'),(167,24,'NV3500 HD Cargo'),(168,26,'Panamera'),(169,26,'Taycan'),(170,24,'Pathfinder'),(171,24,'Rogue'),(172,24,'NV200'),(173,26,'911'),(174,24,'Rogue Sport'),(175,26,'Macan'),(176,26,'Cayenne Coupe'),(177,26,'Cayenne'),(178,24,'NV2500 HD Cargo'),(179,27,'3500 Crew Cab'),(180,27,'1500 Crew Cab'),(181,28,'BRZ'),(182,24,'Versa'),(183,29,'Avalon'),(184,28,'WRX'),(185,29,'Camry'),(186,28,'Impreza'),(187,28,'Ascent'),(188,28,'Legacy'),(189,29,'Corolla Hatchback'),(190,28,'Crosstrek'),(191,29,'Corolla'),(192,29,'86'),(193,28,'Forester'),(194,29,'Avalon Hybrid'),(195,27,'2500 Crew Cab'),(196,29,'4Runner'),(197,28,'Outback'),(198,29,'C-HR'),(199,29,'Camry Hybrid'),(200,29,'Corolla Hybrid'),(201,29,'GR Supra'),(202,29,'Highlander'),(203,29,'Prius'),(204,29,'Prius Prime'),(205,29,'RAV4'),(206,29,'Tacoma Access Cab'),(207,29,'Sienna'),(208,29,'Land Cruiser'),(209,29,'Yaris'),(210,29,'RAV4 Hybrid'),(211,29,'Highlander Hybrid'),(212,29,'Sequoia'),(213,29,'Tundra Double Cab'),(214,29,'Tacoma Double Cab'),(215,29,'Tundra CrewMax'),(216,30,'Passat'),(217,29,'Yaris Hatchback'),(218,4,'MDX Sport Hybrid'),(219,4,'RLX Sport Hybrid'),(220,1,'A6'),(221,31,'XC40'),(222,1,'A4'),(223,1,'Q7'),(224,1,'Q8'),(225,1,'RS 5'),(226,4,'NSX'),(227,32,'4C Spider'),(228,31,'XC60'),(229,30,'Tiguan'),(230,31,'XC90'),(231,1,'A8'),(232,5,'4 Series'),(233,4,'ILX'),(234,5,'2 Series'),(235,1,'A3'),(236,1,'S5'),(237,1,'A4 allroad'),(238,1,'e-tron'),(239,30,'Jetta'),(240,1,'RS 3'),(241,32,'Stelvio'),(242,32,'Giulia'),(243,1,'A5'),(244,1,'S3'),(245,1,'S4'),(246,5,'5 Series'),(247,5,'M5'),(248,5,'i8'),(249,5,'8 Series'),(250,5,'M6'),(251,5,'i3'),(252,5,'6 Series'),(253,5,'M4'),(254,1,'TT'),(255,8,'Regal Sportback'),(256,5,'X6 M'),(257,5,'X2'),(258,3,'CTS-V'),(259,5,'X1'),(260,5,'X6'),(261,5,'X4'),(262,3,'CT6'),(263,8,'Regal TourX'),(264,5,'M2'),(265,8,'Cascada'),(266,3,'CTS'),(267,2,'Cruze'),(268,5,'Z4'),(269,3,'XTS'),(270,8,'LaCrosse'),(271,3,'ATS-V'),(272,3,'ATS'),(273,2,'Express 2500 Cargo'),(274,2,'Colorado Extended Cab'),(275,2,'Express 2500 Passenger'),(276,2,'Express 3500 Passenger'),(277,2,'Silverado 2500 HD Double Cab'),(278,2,'Silverado 1500 Regular Cab'),(279,2,'Express 3500 Cargo'),(280,2,'Silverado 1500 LD Double Cab'),(281,2,'Silverado 2500 HD Regular Cab'),(282,2,'Silverado 1500 Double Cab'),(283,2,'Sonic'),(284,6,'Pacifica Hybrid'),(285,15,'Challenger'),(286,33,'500L'),(287,2,'Volt'),(288,33,'500e'),(289,33,'500'),(290,15,'Journey'),(291,7,'F150 Super Cab'),(292,2,'Suburban 3500HD'),(293,15,'Grand Caravan Passenger'),(294,6,'300'),(295,33,'500c'),(296,33,'500 Abarth'),(297,33,'124 Spider'),(298,7,'F250 Super Duty Regular Cab'),(299,33,'500X'),(300,33,'500c Abarth'),(301,7,'F150 Regular Cab'),(302,7,'F450 Super Duty Crew Cab'),(303,7,'F350 Super Duty Crew Cab'),(304,7,'Fiesta'),(305,7,'F250 Super Duty Crew Cab'),(306,7,'F350 Super Duty Super Cab'),(307,7,'Flex'),(308,7,'Transit 150 Van'),(309,10,'Canyon Crew Cab'),(310,14,'G90'),(311,7,'Fusion Energi'),(312,7,'Transit Connect Cargo'),(313,7,'Transit 150 Wagon'),(314,7,'Transit 350 Van'),(315,7,'F250 Super Duty Super Cab'),(316,10,'Sierra 1500 Double Cab'),(317,7,'Transit 250 Van'),(318,7,'Transit 350 Wagon'),(319,7,'Transit Connect Passenger'),(320,34,'Sprinter 2500 Cargo'),(321,7,'Taurus'),(322,10,'Sierra 1500 Limited Double Cab'),(323,11,'Clarity Electric'),(324,10,'Sierra 2500 HD Double Cab'),(325,10,'Sierra 2500 HD Regular Cab'),(326,10,'Canyon Extended Cab'),(327,10,'Sierra 1500 Regular Cab'),(328,11,'Civic Type R'),(329,11,'Clarity Fuel Cell'),(330,11,'Clarity Plug-in Hybrid'),(331,11,'Fit'),(332,12,'Ioniq Electric'),(333,12,'Sonata Hybrid'),(334,12,'Ioniq Hybrid'),(335,12,'Sonata Plug-in Hybrid'),(336,9,'Q70'),(337,9,'QX30'),(338,16,'XE'),(339,17,'Niro'),(340,16,'XF'),(341,16,'XJ'),(342,17,'Niro Plug-in Hybrid'),(343,17,'Cadenza'),(344,17,'K900'),(345,17,'Niro EV'),(346,17,'Soul EV'),(347,35,'Levante'),(348,23,'MX-5 Miata RF'),(349,23,'MX-5 Miata'),(350,22,'Continental'),(351,22,'MKT'),(352,23,'CX-3'),(353,22,'MKC'),(354,20,'A-Class'),(355,35,'Ghibli'),(356,20,'Mercedes-AMG C-Class'),(357,20,'CLS'),(358,20,'Mercedes-AMG CLA'),(359,20,'GLC Coupe'),(360,20,'Mercedes-AMG CLS'),(361,12,'Santa Fe XL'),(362,20,'Mercedes-AMG E-Class'),(363,20,'Mercedes-AMG GLE'),(364,20,'Mercedes-AMG G-Class'),(365,20,'Mercedes-AMG GLA'),(366,20,'Mercedes-AMG S-Class'),(367,20,'SL'),(368,20,'Mercedes-AMG GT'),(369,20,'Metris Passenger'),(370,20,'Mercedes-AMG GLE Coupe'),(371,20,'Mercedes-Maybach S-Class'),(372,20,'Mercedes-AMG GLC Coupe'),(373,25,'Convertible'),(374,20,'S-Class'),(375,20,'Metris Cargo'),(376,20,'SLC'),(377,20,'Mercedes-AMG SLC'),(378,20,'Mercedes-AMG GLC'),(379,20,'Mercedes-AMG SL'),(380,25,'Hardtop 2 Door'),(381,25,'Hardtop 4 Door'),(382,25,'Clubman'),(383,20,'Mercedes-AMG GLS'),(384,24,'TITAN XD Crew Cab'),(385,24,'Titan Crew Cab'),(386,26,'718 Boxster'),(387,24,'Frontier King Cab'),(388,24,'Frontier Crew Cab'),(389,24,'LEAF'),(390,24,'Sentra'),(391,24,'TITAN Single Cab'),(392,24,'NV200 Taxi'),(393,24,'Titan King Cab'),(394,24,'TITAN XD Single Cab'),(395,24,'Versa Note'),(396,27,'2500 Mega Cab'),(397,24,'TITAN XD King Cab'),(398,27,'1500 Classic Quad Cab'),(399,27,'1500 Classic Crew Cab'),(400,27,'1500 Classic Regular Cab'),(401,26,'718 Cayman'),(402,27,'1500 Quad Cab'),(403,27,'2500 Regular Cab'),(404,27,'3500 Mega Cab'),(405,27,'ProMaster Cargo Van'),(406,27,'ProMaster City'),(407,27,'ProMaster Window Van'),(408,36,'Model X'),(409,36,'Model 3'),(410,27,'3500 Regular Cab'),(411,36,'Model S'),(412,29,'Mirai'),(413,30,'Atlas'),(414,29,'Prius c'),(415,30,'Golf SportWagen'),(416,30,'Arteon'),(417,30,'e-Golf'),(418,30,'Golf'),(419,30,'Golf GTI'),(420,30,'Jetta GLI'),(421,30,'Beetle'),(422,30,'Golf Alltrack'),(423,31,'S60'),(424,30,'Golf R'),(425,31,'V60'),(426,31,'V90'),(427,31,'S90'),(428,37,'Vanquish S'),(429,32,'4C'),(430,37,'DB11'),(431,1,'A3 Sportback e-tron'),(432,1,'S7'),(433,1,'S6'),(434,1,'S8'),(435,1,'RS 7'),(436,38,'Bentayga'),(437,38,'Flying Spur'),(438,5,'M3'),(439,38,'Mulsanne'),(440,5,'X5 M'),(441,2,'City Express'),(442,2,'Silverado 3500 HD Double Cab'),(443,2,'Silverado 3500 HD Regular Cab'),(444,39,'GTC4Lusso'),(445,39,'488 GTB'),(446,39,'812 Superfast'),(447,39,'Portofino'),(448,39,'488 Spider'),(449,7,'C-MAX Hybrid'),(450,7,'F350 Super Duty Regular Cab'),(451,7,'Focus'),(452,7,'Transit 350 HD Van'),(453,34,'Sprinter 2500 Crew'),(454,34,'Sprinter 3500 Cargo'),(455,34,'Sprinter WORKER Cargo'),(456,34,'Sprinter 3500XD Cargo'),(457,34,'Sprinter 2500 Passenger'),(458,10,'Savana 2500 Passenger'),(459,10,'Savana 3500 Passenger'),(460,10,'Savana 3500 Cargo'),(461,10,'Savana 2500 Cargo'),(462,10,'Sierra 3500 HD Double Cab'),(463,10,'Sierra 3500 HD Regular Cab'),(464,12,'Santa Fe Sport'),(465,17,'Forte5'),(466,40,'Huracan'),(467,40,'Aventador'),(468,35,'Quattroporte'),(469,22,'MKX'),(470,41,'Evora 400'),(471,42,'570GT'),(472,35,'GranTurismo'),(473,42,'720S'),(474,42,'570S'),(475,20,'Metris WORKER Cargo'),(476,20,'Metris WORKER Passenger'),(477,20,'Sprinter 3500 XD Cargo'),(478,43,'Ghost'),(479,27,'1500 Regular Cab'),(480,44,'fortwo electric drive'),(481,43,'Wraith'),(482,43,'Dawn'),(483,44,'fortwo electric drive cabrio'),(484,43,'Phantom'),(485,29,'Corolla iM'),(486,29,'Yaris iA'),(487,30,'Tiguan Limited'),(488,37,'Rapide S'),(489,37,'Vanquish'),(490,37,'Vantage'),(491,1,'A5 Sport'),(492,8,'Regal'),(493,8,'Verano'),(494,6,'200'),(495,2,'SS'),(496,39,'F12berlinetta'),(497,39,'California'),(498,15,'Viper'),(499,7,'C-MAX Energi'),(500,7,'Expedition EL'),(501,34,'Sprinter WORKER Passenger'),(502,10,'Acadia Limited'),(503,12,'Azera'),(504,9,'QX70'),(505,12,'Tucson Fuel Cell'),(506,13,'Patriot'),(507,19,'CT'),(508,20,'B-Class'),(509,21,'Lancer'),(510,21,'i-MiEV'),(511,24,'Quest'),(512,24,'JUKE'),(513,44,'fortwo cabrio'),(514,44,'fortwo'),(515,29,'Prius v'),(516,29,'Tundra Regular Cab'),(517,30,'CC'),(518,30,'Touareg'),(519,37,'DB9 GT'),(520,1,'allroad'),(521,3,'ELR'),(522,3,'SRX'),(523,2,'Cruze Limited'),(524,2,'Impala Limited'),(525,2,'Malibu Limited'),(526,15,'Dart'),(527,6,'Town & Country'),(528,2,'Spark EV'),(529,39,'FF'),(530,11,'CR-Z'),(531,12,'Genesis'),(532,12,'Genesis Coupe'),(533,12,'Equus'),(534,17,'Forte Koup'),(535,18,'LR4'),(536,42,'650S'),(537,22,'MKS'),(538,42,'675LT'),(539,20,'CLS-Class'),(540,20,'GL-Class'),(541,20,'GLE Coupe'),(542,20,'Mercedes-Maybach S 600'),(543,20,'SLK'),(544,20,'Mercedes-AMG SLK'),(545,25,'Paceman'),(546,26,'Cayman'),(547,26,'Boxster'),(548,45,'iA'),(549,45,'tC'),(550,45,'iM'),(551,45,'FR-S'),(552,30,'Eos'),(553,37,'DB9'),(554,31,'S80'),(555,31,'XC70'),(556,2,'Captiva Sport'),(557,39,'458 Italia'),(558,39,'458 Speciale'),(559,39,'458 Spider'),(560,7,'Focus ST'),(561,11,'Crosstour'),(562,9,'Q40'),(563,16,'XK'),(564,18,'LR2'),(565,20,'M-Class'),(566,20,'CLA-Class'),(567,23,'MAZDA5'),(568,20,'GLK-Class'),(569,20,'GLA-Class'),(570,20,'SLS-Class'),(571,20,'SL-Class'),(572,20,'SLK-Class'),(573,25,'Coupe'),(574,25,'Roadster'),(575,21,'Lancer Evolution'),(576,24,'Rogue Select'),(577,24,'Xterra'),(578,45,'iQ'),(579,28,'XV Crosstrek'),(580,27,'C/V Tradesman'),(581,45,'xB'),(582,29,'Prius Plug-in Hybrid'),(583,29,'Venza'),(584,4,'TSX'),(585,4,'TL'),(586,2,'Express 1500 Cargo'),(587,2,'Express 1500 Passenger'),(588,2,'Suburban 1500'),(589,15,'Avenger'),(590,7,'E350 Super Duty Cargo'),(591,7,'E150 Passenger'),(592,7,'E150 Cargo'),(593,7,'E250 Cargo'),(594,7,'E350 Super Duty Passenger'),(595,10,'Savana 1500 Cargo'),(596,10,'Savana 1500 Passenger'),(597,10,'Yukon XL 1500'),(598,40,'Gallardo'),(599,23,'MAZDA2'),(600,41,'Evora'),(601,42,'MP4-12C'),(602,20,'CL-Class'),(603,24,'cube'),(604,25,'Hardtop'),(605,28,'Tribeca'),(606,27,'ProMaster 3500 Cargo'),(607,27,'ProMaster 2500 Cargo'),(608,45,'xD'),(609,27,'ProMaster 1500 Cargo'),(610,29,'FJ Cruiser'),(611,29,'Tacoma Regular Cab'),(612,30,'GTI'),(613,30,'Routan'),(614,30,'Jetta SportWagen'),(615,4,'ZDX'),(616,5,'1 Series'),(617,3,'Escalade EXT'),(618,2,'Avalanche'),(619,2,'Silverado 2500 HD Extended Cab'),(620,2,'Silverado 3500 HD Extended Cab'),(621,2,'Silverado 1500 Extended Cab'),(622,2,'Suburban 2500'),(623,10,'Sierra 3500 HD Extended Cab'),(624,10,'Sierra 1500 Extended Cab'),(625,10,'Yukon XL 2500'),(626,10,'Sierra 2500 HD Extended Cab'),(627,9,'EX'),(628,9,'QX'),(629,9,'G'),(630,9,'JX'),(631,9,'FX'),(632,9,'M'),(633,47,'SX4'),(634,47,'Kizashi'),(635,47,'Grand Vitara'),(636,29,'Matrix'),(637,31,'C30'),(638,31,'C70'),(639,4,'RL'),(640,37,'Rapide'),(641,37,'DBS'),(642,37,'Virage'),(643,2,'Colorado Regular Cab'),(644,15,'Caliber'),(645,48,'Karma'),(646,10,'Canyon Regular Cab'),(647,12,'Veracruz'),(648,13,'Liberty'),(649,19,'HS'),(650,19,'LFA'),(651,49,'62'),(652,23,'CX-7'),(653,49,'57'),(654,20,'R-Class'),(655,21,'Eclipse'),(656,21,'Galant'),(657,27,'C/V'),(658,47,'Equator Extended Cab'),(659,47,'Equator Crew Cab'),(660,3,'DTS'),(661,8,'Lucerne'),(662,2,'Aveo'),(663,2,'HHR'),(664,3,'STS'),(665,39,'599 GTB Fiorano'),(666,15,'Grand Caravan Cargo'),(667,39,'599 GTO'),(668,39,'612 Scaglietti'),(669,15,'Nitro'),(670,7,'Crown Victoria'),(671,7,'Ranger Super Cab'),(672,7,'Ranger Regular Cab'),(673,11,'Accord Crosstour'),(674,11,'Element'),(675,41,'Elise'),(676,19,'IS F'),(677,22,'Town Car'),(678,41,'Exige'),(679,23,'RX-8'),(680,23,'Tribute'),(681,50,'Milan'),(682,50,'Mariner'),(683,50,'Grand Marquis'),(684,21,'Endeavor'),(685,51,'9-4X'),(686,51,'3-Sep'),(687,27,'Dakota Crew Cab'),(688,27,'Dakota Extended Cab'),(689,51,'5-Sep'),(690,31,'V50'),(691,31,'S40'),(692,38,'Azure T'),(693,38,'Brooklands'),(694,2,'Cobalt'),(695,15,'Ram 2500 Regular Cab'),(696,6,'PT Cruiser'),(697,6,'Sebring'),(698,15,'Ram 1500 Quad Cab'),(699,15,'Ram 1500 Crew Cab'),(700,15,'Ram 2500 Mega Cab'),(701,15,'Ram 1500 Regular Cab'),(702,15,'Ram 3500 Crew Cab'),(703,15,'Ram 2500 Crew Cab'),(704,15,'Ram 3500 Mega Cab'),(705,15,'Ram 3500 Regular Cab'),(706,7,'E150 Super Duty Passenger'),(707,7,'Explorer Sport Trac'),(708,52,'H3T'),(709,52,'H3'),(710,17,'Rondo'),(711,13,'Commander'),(712,40,'Murcielago'),(713,19,'SC'),(714,50,'Mountaineer'),(715,53,'Vibe'),(716,53,'G6'),(717,53,'G3'),(718,54,'VUE'),(719,54,'Outlook'),(720,30,'New Beetle'),(721,31,'V70'),(722,38,'Arnage'),(723,38,'Azure'),(724,3,'XLR'),(725,2,'TrailBlazer'),(726,15,'Ram 3500 Quad Cab'),(727,6,'Aspen'),(728,39,'430 Scuderia'),(729,15,'Ram 2500 Quad Cab'),(730,39,'F430'),(731,7,'Taurus X'),(732,10,'Envoy'),(733,11,'S2000'),(734,52,'H2'),(735,17,'Amanti'),(736,17,'Borrego'),(737,17,'Spectra'),(738,18,'LR3'),(739,23,'B-Series Regular Cab'),(740,20,'CLK-Class'),(741,23,'B-Series Extended Cab'),(742,24,'350Z'),(743,50,'Sable'),(744,20,'SLR McLaren'),(745,21,'Raider Double Cab'),(746,21,'Raider Extended Cab'),(747,53,'G6 (2009.5)'),(748,53,'Solstice'),(749,53,'G8'),(750,54,'Aura'),(751,51,'9-7X'),(752,53,'Torrent'),(753,53,'G5'),(754,54,'SKY'),(755,47,'XL7'),(756,30,'Rabbit'),(757,30,'Touareg 2'),(758,30,'GLI'),(759,1,'RS 4'),(760,5,'Z4 M'),(761,5,'Alpina B7'),(762,2,'Malibu (Classic)'),(763,2,'Uplander Cargo'),(764,6,'Crossfire'),(765,2,'Uplander Passenger'),(766,15,'Magnum'),(767,15,'Ram 1500 Mega Cab'),(768,12,'Entourage'),(769,55,'i-370 Extended Cab'),(770,12,'Tiburon'),(771,55,'i-290 Extended Cab'),(772,16,'S-Type'),(773,40,'Murcielago LP640'),(774,55,'Ascender'),(775,16,'X-Type'),(776,55,'i-370 Crew Cab'),(777,41,'Exige S'),(778,22,'Mark LT'),(779,25,'Cooper'),(780,53,'Grand Prix'),(781,54,'Astra'),(782,47,'Reno'),(783,29,'Solara'),(784,30,'R32'),(785,47,'Forenza'),(786,8,'Rendezvous'),(787,8,'Terraza'),(788,8,'Rainier'),(789,2,'Silverado (Classic) 3500 Extended Cab'),(790,2,'Silverado (Classic) 2500 HD Crew Cab'),(791,2,'Silverado (Classic) 1500 Crew Cab'),(792,2,'Silverado (Classic) 1500 Regular Cab'),(793,2,'Silverado (Classic) 1500 Extended Cab'),(794,2,'Silverado (Classic) 1500 HD Crew Cab'),(795,2,'Silverado (Classic) 3500 Crew Cab'),(796,2,'Monte Carlo'),(797,2,'Silverado (Classic) 3500 Regular Cab'),(798,2,'Silverado (Classic) 2500 HD Regular Cab'),(799,2,'Silverado (Classic) 2500 HD Extended Cab'),(800,15,'Caravan Passenger'),(801,15,'Caravan Cargo'),(802,15,'Dakota Quad Cab'),(803,15,'Dakota Club Cab'),(804,7,'E250 Super Duty Cargo'),(805,7,'E150 Super Duty Cargo'),(806,7,'Freestar Cargo'),(807,7,'Five Hundred'),(808,10,'Sierra (Classic) 1500 HD Crew Cab'),(809,7,'Freestar Passenger'),(810,10,'Sierra (Classic) 3500 Crew Cab'),(811,7,'Freestyle'),(812,10,'Sierra (Classic) 1500 Crew Cab'),(813,10,'Sierra (Classic) 1500 Extended Cab'),(814,10,'Sierra (Classic) 2500 HD Crew Cab'),(815,10,'Sierra (Classic) 1500 Regular Cab'),(816,10,'Sierra (Classic) 3500 Extended Cab'),(817,10,'Sierra (Classic) 3500 Regular Cab'),(818,10,'Sierra (Classic) 2500 HD Extended Cab'),(819,10,'Sierra (Classic) 2500 HD Regular Cab'),(820,50,'Montego'),(821,50,'Monterey'),(822,54,'Relay'),(823,54,'Ion'),(824,28,'B9 Tribeca'),(825,47,'Aerio'),(826,4,'RSX'),(827,2,'Avalanche 2500'),(828,2,'Avalanche 1500'),(829,2,'SSR'),(830,2,'Silverado 3500 Crew Cab'),(831,2,'Silverado 3500 Extended Cab'),(832,2,'Silverado 3500 Regular Cab'),(833,2,'Silverado 1500 HD Crew Cab'),(834,15,'Stratus'),(835,7,'GT'),(836,10,'Envoy XL'),(837,10,'Sierra 3500 Crew Cab'),(838,10,'Sierra 1500 HD Crew Cab'),(839,10,'Sierra 3500 Extended Cab'),(840,10,'Sierra 3500 Regular Cab'),(841,52,'H1'),(842,9,'Q'),(843,55,'i-350 Crew Cab'),(844,55,'i-280 Extended Cab'),(845,17,'Optima (2006.5)'),(846,35,'GranSport'),(847,22,'Zephyr'),(848,23,'MPV'),(849,21,'Montero'),(850,56,'Esperante'),(851,53,'GTO'),(852,53,'Montana SV6'),(853,28,'Baja'),(854,45,'xA'),(855,51,'9-2X'),(856,47,'XL-7'),(857,47,'Verona'),(858,29,'Tundra Access Cab'),(859,1,'A4 (2005.5)'),(860,30,'Phaeton'),(861,8,'Century'),(862,1,'S4 (2005.5)'),(863,8,'Park Avenue'),(864,2,'Astro Cargo'),(865,3,'DeVille'),(866,8,'LeSabre'),(867,2,'Classic'),(868,2,'Astro Passenger'),(869,2,'Cavalier'),(870,2,'Venture Passenger'),(871,2,'Venture Cargo'),(872,15,'Neon'),(873,7,'Excursion'),(874,10,'Envoy XUV'),(875,10,'Safari Cargo'),(876,7,'Thunderbird'),(877,10,'Safari Passenger'),(878,12,'XG350'),(879,18,'Freelander'),(880,53,'Bonneville'),(881,53,'Aztek'),(882,53,'Grand Am'),(883,53,'Montana'),(884,53,'Sunfire'),(885,26,'Carrera GT'),(886,54,'L-Series'),(887,29,'Celica'),(888,29,'Echo'),(889,29,'MR2'),(890,30,'Jetta (New)'),(891,3,'Seville'),(892,2,'Silverado 2500 Extended Cab'),(893,2,'S10 Crew Cab'),(894,2,'Silverado 2500 Crew Cab'),(895,2,'Silverado 2500 Regular Cab'),(896,6,'300M'),(897,6,'Concorde'),(898,2,'Tracker'),(899,15,'Dakota Regular Cab'),(900,15,'Intrepid'),(901,7,'F150 (Heritage) Super Cab'),(902,7,'F150 (Heritage) Regular Cab'),(903,10,'Sierra 2500 Regular Cab'),(904,10,'Sonoma Crew Cab'),(905,10,'Sierra 2500 Crew Cab'),(906,10,'Sierra 2500 Extended Cab'),(907,55,'Axiom'),(908,55,'Rodeo'),(909,9,'I'),(910,23,'B-Series Cab Plus'),(911,50,'Marauder'),(912,21,'Diamante'),(913,21,'Montero Sport'),(914,57,'Bravada'),(915,57,'Alero'),(916,24,'Pathfinder Armada'),(917,57,'Silhouette'),(918,47,'Vitara'),(919,31,'S40 (New)'),(920,29,'Tacoma Xtracab'),(921,31,'V40'),(922,4,'CL'),(923,5,'Z8'),(924,1,'RS 6'),(925,2,'S10 Extended Cab'),(926,2,'S10 Regular Cab'),(927,15,'Ram Van 1500'),(928,15,'Ram Van 2500'),(929,15,'Ram Van 3500'),(930,7,'Explorer Sport'),(931,7,'Windstar Cargo'),(932,7,'ZX2'),(933,7,'Windstar Passenger'),(934,10,'Sonoma Extended Cab'),(935,10,'Sonoma Regular Cab'),(936,55,'Rodeo Sport'),(937,23,'Protege5'),(938,23,'Protege'),(939,57,'Aurora'),(940,30,'Eurovan'),(941,5,'Z3'),(942,3,'Eldorado'),(943,2,'Prizm'),(944,6,'Prowler'),(945,58,'Nubira'),(946,58,'Leganza'),(947,58,'Lanos'),(948,7,'Econoline E250 Cargo'),(949,7,'Econoline E350 Super Duty Passenger'),(950,15,'Ram Wagon 2500'),(951,7,'Econoline E150 Cargo'),(952,7,'Econoline E150 Passenger'),(953,15,'Ram Wagon 1500'),(954,7,'Econoline E350 Super Duty Cargo'),(955,7,'Escort'),(956,15,'Ram Wagon 3500'),(957,55,'Trooper'),(958,18,'Discovery Series II'),(959,22,'Blackwood'),(960,23,'626'),(961,23,'Millenia'),(962,50,'Villager'),(963,50,'Cougar'),(964,57,'Intrigue'),(965,54,'S-Series'),(966,53,'Firebird'),(967,47,'Esteem'),(968,30,'Cabrio'),(969,4,'Integra'),(970,3,'Catera'),(971,2,'Metro'),(972,2,'Lumina'),(973,6,'LHS'),(974,15,'Ram 1500 Club Cab'),(975,10,'Jimmy'),(976,11,'Prelude'),(977,12,'XG300'),(978,6,'Cirrus'),(979,7,'Aerostar Passenger'),(980,15,'Ram 2500 Club Cab'),(981,7,'Aspire'),(982,15,'Ram 3500 Club Cab'),(983,7,'Aerostar Cargo'),(984,59,'Vision'),(985,7,'Econoline E350 Cargo'),(986,7,'F250 Super Cab'),(987,7,'Probe'),(988,7,'Contour'),(989,59,'Talon'),(990,7,'Club Wagon'),(991,7,'F350 Crew Cab'),(992,7,'F250 Regular Cab'),(993,7,'F350 Regular Cab'),(994,10,'1500 Club Coupe'),(995,7,'F250 Crew Cab'),(996,7,'F350 Super Cab'),(997,10,'3500 Club Coupe'),(998,10,'2500 Club Coupe'),(999,10,'2500 HD Club Coupe'),(1000,10,'Sonoma Club Coupe Cab'),(1001,11,'del Sol'),(1002,55,'Hombre Regular Cab'),(1003,9,'J'),(1004,55,'Oasis'),(1005,55,'Hombre Spacecab'),(1006,17,'Sephia'),(1007,18,'Defender 90'),(1008,50,'Mystique'),(1009,22,'Mark VIII'),(1010,23,'MX-6'),(1011,57,'Cutlass'),(1012,24,'240SX'),(1013,21,'3000GT'),(1014,50,'Tracer'),(1015,24,'200SX'),(1016,24,'Regular Cab'),(1017,57,'88'),(1018,24,'King Cab'),(1019,57,'Cutlass Supreme'),(1020,61,'Breeze'),(1021,57,'Regency'),(1022,57,'Achieva'),(1023,51,'900'),(1024,53,'Trans Sport'),(1025,61,'Grand Voyager'),(1026,47,'X-90'),(1027,51,'9000'),(1028,47,'Sidekick'),(1029,57,'LSS'),(1030,47,'Swift'),(1031,28,'SVX'),(1032,29,'T100 Regular Cab'),(1033,29,'T100 Xtracab'),(1034,29,'Paseo'),(1035,4,'SLX'),(1036,29,'Supra'),(1037,1,'Cabriolet'),(1038,29,'Previa'),(1039,31,'850'),(1040,29,'Tercel'),(1041,31,'960'),(1042,8,'Riviera'),(1043,8,'Roadmaster'),(1044,8,'Skylark'),(1045,2,'1500 Extended Cab'),(1046,3,'Fleetwood'),(1047,2,'3500 Extended Cab'),(1048,2,'G-Series 2500'),(1049,2,'2500 HD Extended Cab'),(1050,2,'Beretta'),(1051,2,'G-Series G30'),(1052,2,'G-Series 1500'),(1053,2,'2500 Extended Cab'),(1054,2,'Lumina Passenger'),(1055,2,'Sportvan G30'),(1056,2,'Corsica'),(1057,2,'Lumina Cargo'),(1058,2,'Caprice Classic'),(1059,6,'New Yorker'),(1060,15,'Stealth'),(1061,7,'Bronco'),(1062,59,'Summit'),(1063,10,'Rally Wagon G3500'),(1064,10,'Vandura G3500'),(1065,21,'Mighty Max Regular Cab'),(1066,24,'300ZX'),(1067,57,'Ciera'),(1068,57,'98'),(1069,32,'164'),(1070,1,'90'),(1071,4,'Legend'),(1072,2,'3500 HD Extended Cab'),(1073,2,'G-Series G20'),(1074,2,'G-Series G10'),(1075,2,'3500 HD Regular Cab'),(1076,6,'LeBaron'),(1077,2,'Sportvan G20'),(1078,15,'Spirit'),(1079,10,'Rally Wagon G2500'),(1080,10,'Vandura G2500'),(1081,10,'Vandura G1500'),(1082,12,'Scoupe'),(1083,23,'MX-3'),(1084,23,'929'),(1085,21,'Expo'),(1086,23,'RX-7'),(1087,61,'Acclaim'),(1088,57,'Cutlass Ciera'),(1089,47,'Samurai'),(1090,26,'968'),(1091,26,'928'),(1092,30,'Golf III'),(1093,1,'Quattro'),(1094,32,'Spider'),(1095,29,'Xtra Cab'),(1096,30,'Jetta III'),(1097,1,'100'),(1098,4,'Vigor'),(1099,31,'940'),(1100,2,'S10 Blazer'),(1101,15,'Ram Van B250'),(1102,15,'Ram Wagon B350'),(1103,15,'Colt'),(1104,15,'Ram Van B150'),(1105,15,'Ram Van B350'),(1106,15,'Ram Wagon B150'),(1107,15,'Shadow'),(1108,15,'Ram Wagon B250'),(1109,10,'Rally Wagon 2500'),(1110,7,'Tempo'),(1111,10,'Rally Wagon 3500'),(1112,10,'Vandura 1500'),(1113,10,'Vandura 3500'),(1114,10,'Vandura 2500'),(1115,55,'Amigo'),(1116,12,'Excel'),(1117,55,'Spacecab'),(1118,23,'323'),(1119,23,'Navajo'),(1120,50,'Capri'),(1121,21,'Mighty Max Macro Cab'),(1122,21,'Precis'),(1123,50,'Topaz'),(1124,61,'Laser'),(1125,57,'Cutlass Cruiser'),(1126,61,'Colt Vista'),(1127,53,'Sunbird'),(1128,28,'Loyale'),(1129,61,'Sundance'),(1130,28,'Justy'),(1131,30,'Corrado'),(1132,3,'Allante'),(1133,3,'Sixty Special'),(1134,2,'Lumina APV'),(1135,2,'Sportvan G10'),(1136,2,'APV Cargo'),(1137,15,'D350 Club Cab'),(1138,6,'Fifth Ave'),(1139,15,'D250 Club Cab'),(1140,15,'D150 Club Cab'),(1141,6,'Imperial'),(1142,15,'D350 Regular Cab'),(1143,15,'D150 Regular Cab'),(1144,15,'D250 Regular Cab'),(1145,15,'Dynasty'),(1146,15,'Ram 50 Regular Cab'),(1147,15,'Daytona'),(1148,15,'Ramcharger'),(1149,7,'Festiva'),(1150,60,'Storm'),(1151,10,'Rally Wagon 1500'),(1152,55,'Stylus'),(1153,18,'Defender 110'),(1154,20,'300 E'),(1155,20,'190 E'),(1156,20,'300 D'),(1157,20,'300 SD'),(1158,20,'300 CE'),(1159,20,'500 SEL'),(1160,20,'400 SEL'),(1161,20,'500 SL'),(1162,20,'500 E'),(1163,20,'300 SL'),(1164,20,'600 SEC'),(1165,20,'300 TE'),(1166,20,'400 E'),(1167,20,'300 SE'),(1168,20,'600 SL'),(1169,20,'600 SEL'),(1170,20,'500 SEC'),(1171,53,'LeMans'),(1172,30,'Fox'),(1173,31,'240'),(1174,1,'80'),(1175,3,'Brougham'),(1176,2,'Caprice'),(1177,62,'Rocky'),(1178,62,'Charade'),(1179,15,'Monaco'),(1180,59,'Premier'),(1181,10,'Sonoma Club Cab'),(1182,55,'Impulse'),(1183,13,'Comanche Regular Cab'),(1184,22,'Mark VII'),(1185,20,'400 SE'),(1186,24,'Stanza'),(1187,57,'Toronado'),(1188,57,'Custom Cruiser'),(1189,29,'Cressida'),(1190,31,'740'),(1191,1,'A6 allroad'),(1192,8,'Encore GX'),(1193,3,'CT4'),(1194,7,'Bronco Sport'),(1195,7,'Transit Connect Cargo Van'),(1196,14,'GV80'),(1197,11,'CR-V Hybrid'),(1198,13,'Grand Cherokee L'),(1199,17,'K5'),(1200,17,'Seltos'),(1201,20,'GLB'),(1202,63,'2'),(1203,26,'718 Spyder'),(1204,64,'R1S'),(1205,64,'R1T'),(1206,29,'RAV4 Prime'),(1207,30,'Atlas Cross Sport'),(1208,10,'Hummer EV'),(1209,13,'Grand Wagoneer');
/*!40000 ALTER TABLE `modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `annonce_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B784188805AB2F` (`annonce_id`),
  CONSTRAINT `FK_14B784188805AB2F` FOREIGN KEY (`annonce_id`) REFERENCES `annonce` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (32,62,'public/images/6116b8057d11d.jpeg','6116b8057d11d.jpeg'),(33,62,'public/images/6116b8057e148.jpeg','6116b8057e148.jpeg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professionnel`
--

DROP TABLE IF EXISTS `professionnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professionnel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7A28C10FF85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionnel`
--

LOCK TABLES `professionnel` WRITE;
/*!40000 ALTER TABLE `professionnel` DISABLE KEYS */;
INSERT INTO `professionnel` VALUES (1,'AdminLodevie','[\"ROLE_SUPER_ADMIN\"]','$2y$13$R.BtyNiu0vsGwhBhnyBhbeyeRLzqi4DlVr2Q7/ARa4vFrjuQLdqee','Patrick','Lodevie','patrick.lodevie@gmail.com','0102030405'),(2,'kokuga','[\"ROLE_ADMIN\"]','$2y$13$eYvreHtM858iFLa3EXMZhOIE9m/c1wa8SF5YXJkvE1d/48wolu32O','Damien','Mizzi','damien.mizzi@live.fr','0102030405'),(3,'user','[\"ROLE_USER\"]','$2y$13$eYvreHtM858iFLa3EXMZhOIE9m/c1wa8SF5YXJkvE1d/48wolu32O','usertest','user','user@user.com','1234567890');
/*!40000 ALTER TABLE `professionnel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-02 16:23:38
