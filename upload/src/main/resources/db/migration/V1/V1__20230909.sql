-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: uploadcce
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
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente`
--


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
                          `regiao_sigla` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKsr3ekt7texvx6b3q3jopo4xml` (`agente_id`),
                          KEY `FKq3y63vfwpkwcvqpmsmir7o6x0` (`regiao_sigla`),
                          CONSTRAINT `FKq3y63vfwpkwcvqpmsmir7o6x0` FOREIGN KEY (`regiao_sigla`) REFERENCES `regiao` (`sigla`),
                          CONSTRAINT `FKsr3ekt7texvx6b3q3jopo4xml` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--


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
                           `regiao_sigla` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKt6401i1sd5cvlettnv6sdf663` (`agente_id`),
                           KEY `FKrmchvttskn1e4fx2si57vyeev` (`regiao_sigla`),
                           CONSTRAINT `FKrmchvttskn1e4fx2si57vyeev` FOREIGN KEY (`regiao_sigla`) REFERENCES `regiao` (`sigla`),
                           CONSTRAINT `FKt6401i1sd5cvlettnv6sdf663` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geracao`
--


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
                               `regiao_sigla` varchar(255) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FKow4gryw4irgwv7wequn07p8ul` (`agente_id`),
                               KEY `FK2aia50yu6dlkib2pgpexj7jwq` (`regiao_sigla`),
                               CONSTRAINT `FK2aia50yu6dlkib2pgpexj7jwq` FOREIGN KEY (`regiao_sigla`) REFERENCES `regiao` (`sigla`),
                               CONSTRAINT `FKow4gryw4irgwv7wequn07p8ul` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco_medio`
--


--
-- Table structure for table `regiao`
--

DROP TABLE IF EXISTS `regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiao` (
                          `sigla` varchar(255) NOT NULL,
                          `agente_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`sigla`),
                          KEY `FKpypv8bjti4uapkgrmlm6o8983` (`agente_id`),
                          CONSTRAINT `FKpypv8bjti4uapkgrmlm6o8983` FOREIGN KEY (`agente_id`) REFERENCES `agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiao`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-06 10:29:36
