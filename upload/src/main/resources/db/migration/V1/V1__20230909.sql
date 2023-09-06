-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: uploadccee
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `agente`
--

DROP TABLE IF EXISTS `agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `codigo` varchar(255) DEFAULT NULL,
                          `data` datetime(6) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente`
--

LOCK TABLES `agente` WRITE;
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `valor` decimal(19,2) DEFAULT NULL,
                          `agente_id` bigint DEFAULT NULL,
                          `regiao_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKsr3ekt7texvx6b3q3jopo4xml` (`agente_id`),
                          KEY `FKhhogltjq0reggjwk1oua3qjj9` (`regiao_id`),
                          CONSTRAINT `FKhhogltjq0reggjwk1oua3qjj9` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`),
                          CONSTRAINT `FKsr3ekt7texvx6b3q3jopo4xml` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geracao`
--

DROP TABLE IF EXISTS `geracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geracao` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `valor` decimal(19,2) DEFAULT NULL,
                           `agente_id` bigint DEFAULT NULL,
                           `regiao_id` bigint DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKt6401i1sd5cvlettnv6sdf663` (`agente_id`),
                           KEY `FKb8eb84s11veleyj3e8n4il3k8` (`regiao_id`),
                           CONSTRAINT `FKb8eb84s11veleyj3e8n4il3k8` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`),
                           CONSTRAINT `FKt6401i1sd5cvlettnv6sdf663` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geracao`
--

LOCK TABLES `geracao` WRITE;
/*!40000 ALTER TABLE `geracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `geracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preco_medio`
--

DROP TABLE IF EXISTS `preco_medio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preco_medio` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `valor` decimal(19,2) DEFAULT NULL,
                               `agente_id` bigint DEFAULT NULL,
                               `regiao_id` bigint DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FKow4gryw4irgwv7wequn07p8ul` (`agente_id`),
                               KEY `FK13wocr87tb3y5ix88k5u6vf8p` (`regiao_id`),
                               CONSTRAINT `FK13wocr87tb3y5ix88k5u6vf8p` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`),
                               CONSTRAINT `FKow4gryw4irgwv7wequn07p8ul` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco_medio`
--

LOCK TABLES `preco_medio` WRITE;
/*!40000 ALTER TABLE `preco_medio` DISABLE KEYS */;
/*!40000 ALTER TABLE `preco_medio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiao`
--

DROP TABLE IF EXISTS `regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiao` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `sigla` varchar(255) DEFAULT NULL,
                          `agente_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKpypv8bjti4uapkgrmlm6o8983` (`agente_id`),
                          CONSTRAINT `FKpypv8bjti4uapkgrmlm6o8983` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiao`
--

LOCK TABLES `regiao` WRITE;
/*!40000 ALTER TABLE `regiao` DISABLE KEYS */;
/*!40000 ALTER TABLE `regiao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-06 17:02:02
