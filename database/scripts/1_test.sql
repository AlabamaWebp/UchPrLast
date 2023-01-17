-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: trade
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `order1`
--

DROP TABLE IF EXISTS `order1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order1` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderStatus` text NOT NULL,
  `OrderDeliveryDate` datetime NOT NULL,
  `OrderPickupPoint` text NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order1`
--

LOCK TABLES `order1` WRITE;
/*!40000 ALTER TABLE `order1` DISABLE KEYS */;
INSERT INTO `order1` VALUES (1,'Завершен','2021-05-20 22:00:00','625590, г. Сыктывкар, ул. Коммунистическая, 20'),(2,'Новый ','2022-05-20 22:00:00','603002, г. Сыктывкар, ул. Дзержинского, 28'),(3,'Завершен','2023-05-20 22:00:00','410542, г. Сыктывкар, ул. Светлая, 46'),(4,'Новый ','2023-05-20 22:00:00','410542, г. Сыктывкар, ул. Светлая, 46'),(5,'Завершен','2025-05-20 22:00:00','603721, г. Сыктывкар, ул. Гоголя, 41'),(6,'Новый ','2026-05-20 22:00:00','420151, г. Сыктывкар, ул. Вишневая, 32'),(7,'Завершен','2028-05-20 22:00:00','420151, г. Сыктывкар, ул. Вишневая, 32'),(8,'Новый ','2028-05-20 22:00:00','426030, г. Сыктывкар, ул. Маяковского, 44'),(9,'Завершен','2029-05-20 22:00:00','190949, г. Сыктывкар, ул. Мичурина, 26'),(10,'Завершен','2030-05-20 22:00:00','190949, г. Сыктывкар, ул. Мичурина, 26');
/*!40000 ALTER TABLE `order1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Quantity` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `orderproduct_ibfk_1` (`OrderID`),
  KEY `orderproduct_ibfk_2` (`ProductArticleNumber`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order1` (`OrderID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `product` (`ProductArticleNumber`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (1,1,'PMEZMH','2'),(2,2,'JVL42J','15'),(3,3,'3XBOTN','13'),(4,4,'2G3280','40'),(5,5,'UER2QD','100'),(6,6,'LPDDM4','20'),(7,7,'O43COU','50'),(8,8,'K0YACK','40'),(9,9,'4WZEOT','10'),(10,10,'QHNOKR','1'),(11,1,'BPV4MM','2'),(12,2,'F895RB','15'),(13,3,'3L7RCZ','17'),(14,4,'MIO8YV','100'),(15,5,'ZR70B4','100'),(16,6,'LQ48MW','20'),(17,7,'M26EXW','50'),(18,8,'ASPXSG','40'),(19,9,'4JR1HN','10'),(20,10,'EQ6RKO','1');
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ProductName` text NOT NULL,
  `ProductDescription` text NOT NULL,
  `ProductCategory` text NOT NULL,
  `ProductPhoto` varchar(100) NOT NULL,
  `ProductManufacturer` text NOT NULL,
  `ProductCost` decimal(19,4) NOT NULL,
  `ProductDiscountAmount` tinyint DEFAULT NULL,
  `ProductQuantityInStock` int NOT NULL,
  `ProductStatus` text,
  PRIMARY KEY (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0YGHZ7','Очки защитные ','Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами','Защита лица, глаз, головы','','Husqvarna',700.0000,9,36,NULL),('2G3280','Угол наружный','Угол наружный Vinylon 3050 мм серо-голубой','Стеновые и фасадные материалы','2G3280.jpg','Vinylon',795.0000,9,20,NULL),('3L7RCZ','Газобетон','Газобетон ЛСР 100х250х625 мм D400','Стеновые и фасадные материалы','3L7RCZ.jpg','ЛСР',7400.0000,2,20,NULL),('3XBOTN','Керамзит фракция','Керамзит фракция 10-20 мм 0,05 куб.м','Общестроительные материалы','3XBOTN.jpg','MixMaster',110.0000,5,21,NULL),('4JR1HN','Шпатель','Шпатель малярный 100 мм с пластиковой ручкой','Ручной инструмент','','Hesler',26.0000,6,7,NULL),('4WZEOT','Лезвие для ножа ','Лезвие для ножа Armero 18 мм прямое (10 шт.)','Ручной инструмент','','Armero',110.0000,6,17,NULL),('61PGH3','Очки защитные','Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами','Защита лица, глаз, головы','','KILIMGRIN',184.0000,6,25,NULL),('81F1WG','Каска защитная','Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая','Защита лица, глаз, головы','','Delta',1500.0000,2,13,NULL),('83M5ME','Кисть','Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе','Ручной инструмент','','Armero',122.0000,9,26,NULL),('ASPXSG','Ровнитель','Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг','Сухие строительные смеси и гидроизоляция','','Weber',711.0000,10,20,NULL),('BPV4MM','Пленка техническая','Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м','Общестроительные материалы','BPV4MM.jpg','Изостронг',8.0000,8,2,NULL),('EQ6RKO','Подшлемник','Подшлемник для каски одноразовый','Защита лица, глаз, головы','','Husqvarna',36.0000,3,22,NULL),('F895RB','Песок строительный','Песок строительный 50 кг','Общестроительные материалы','F895RB.jpg','Knauf',102.0000,6,7,NULL),('GN6ICZ','Каска защитная ','Каска защитная Исток (КАС001О) оранжевая','Защита лица, глаз, головы','','Исток',154.0000,6,8,NULL),('I6MH89','Валик','Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой','Ручной инструмент','','Wenzo Roma',326.0000,6,3,NULL),('JVL42J','Пленка техническая','Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м','Общестроительные материалы','JVL42J.jpg','Изостронг',13.0000,4,34,NULL),('K0YACK','Смесь цементно-песчаная','Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг','Сухие строительные смеси и гидроизоляция','','MixMaster',160.0000,8,19,NULL),('LPDDM4','Штукатурка гипсовая','Штукатурка гипсовая Knauf Ротбанд 30 кг','Сухие строительные смеси и гидроизоляция','','Knauf',500.0000,6,38,NULL),('LQ48MW','Штукатурка гипсовая','Штукатурка гипсовая Knauf МП-75 машинная 30 кг','Сухие строительные смеси и гидроизоляция','','Weber',462.0000,6,33,NULL),('M26EXW','Клей для плитки, керамогранита и камня','Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг','Сухие строительные смеси и гидроизоляция','','Knauf',340.0000,8,2,NULL),('MIO8YV','Кирпич','Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF','Стеновые и фасадные материалы','MIO8YV.jpg','ВОЛМА',30.0000,9,31,NULL),('O43COU','Шпаклевка','Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг','Сухие строительные смеси и гидроизоляция','','ВОЛМА',750.0000,1,16,NULL),('PMEZMH','Цемент','Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг','Общестроительные материалы','PMEZMH.jpg','М500',440.0000,8,34,NULL),('QHNOKR','Маска защитная','Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая','Защита лица, глаз, головы','','Исток',251.0000,2,22,NULL),('S72AM3','Пазогребневая плита ','Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая','Стеновые и фасадные материалы','S72AM3.jpg','ВОЛМА',500.0000,5,35,NULL),('UER2QD','Скоба для пазогребневой плиты','Скоба для пазогребневой плиты Knauf С1 120х100 мм','Стеновые и фасадные материалы','UER2QD.jpg','Knauf',25.0000,8,27,NULL),('Z3LO0U','Очки защитные ','Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами','Защита лица, глаз, головы','','RUIZ',228.0000,9,11,NULL),('Z3XFSP','Нож строительный ','Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус','Ручной инструмент','','Hesler',63.0000,8,5,NULL),('ZKQ5FF','Лезвие для ножа ','Лезвие для ножа Hesler 18 мм прямое (10 шт.)','Ручной инструмент','','Hesler',65.0000,6,6,NULL),('ZR70B4','Кирпич','Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF','Стеновые и фасадные материалы','','Павловский завод ',16.0000,3,26,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Клиент');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserSurname` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserPatronymic` varchar(100) NOT NULL,
  `UserLogin` text NOT NULL,
  `UserPassword` text NOT NULL,
  `UserRole` int NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Басова','Амина','Кирилловна','klh7pi4rcbtz@gmail.com','2L6KZG',1),(2,'Михайлов','Андрей','Денисович','gn0354mbiork@outlook.com','uzWC67',1),(3,'Сидоров','Егор','Александрович','1o4l05k8dwpv@yahoo.com','8ntwUp',1),(4,'Аксенова','Ульяна','Ивановна','hsqixl2vebuz@mail.com','YOyhfR',2),(5,'Васильева','Камила','Ивановна','towkse0hf26b@outlook.com','RSbvHv',2),(6,'Ильин','Артём','Родионович','khx0ncdwz4uj@gmail.com','rwVDh9',2),(7,'Васильева','Василиса','Фёдоровна','01zji3wfuq7h@outlook.com','LdNyos',3),(8,'Кудрявцева','Василиса','Матвеевна','am65k18q7bwp@mail.com','gynQMT',3),(9,'Кириллова','Николь','Святославовна','wt9q8i6ypx47@outlook.com','AtnDjr',3),(10,'Андреева','Полина','Артёмовна','4o72gufv3xlz@tutanota.com','JlFRCZ',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-16 22:23:35
