CREATE DATABASE  IF NOT EXISTS `crud_node` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crud_node`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: crud_node
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `instituicao` varchar(45) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `confirm` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (25,'Lorena Ipsum Dolores','lorenaispsum@lorem.com','Writter, Lorem co.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',1),(32,'\'Davi Gabriela\'','\'esdavi.gabrieltu@yahoo.com\'','\'FB1T\'','\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\'',0),(33,'Joana Doe','jhonedoe@doe.com','CEO, Doe-Corporation','Depoimentos são citações curtas das pessoas que curtem sua marca. É uma ótima forma de convencer os clientes a experimentar seus serviços.',1);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `materia` varchar(32) DEFAULT 'T.I',
  `modo` varchar(32) DEFAULT 'Online',
  `img` varchar(255) DEFAULT 'styles/imgs/curso-img.jpg',
  `link` varchar(255) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Trilha Crie um site simples','Se você estiver interessado em iniciar o desenvolvimento Web. Esta trilha reúne seis cursos que podem auxiliar você nesta tarefa.','Programação','Online','./styles/imgs/curso-img.jpg','https://www.ev.org.br/cursos/crie-um-site-simples-usando-html-css-e-javascript'),(2,'Big Data & Analytics','A arte de transformar dados em informação é desbloquear o valor dos dados. Juntos, Big Data e Analytics (BDA) prometem transformar a maneira com que as empresas fazem negócios.','Programação','Online','./styles/imgs/curso-img.jpg','https://eucapacito.com.br/curso-ec/big-data-analytics/'),(3,'Design Gráfico','Ao testar convenções de estrutura de páginas, diferentes arranjos em colunas e opções pictóricas, o designer chega a visão da conceitualização do conteúdo que ele deseja transmitir.','Design','Online','./styles/imgs/curso-img.jpg','https://eucapacito.com.br/curso-ec/design-grafico'),(4,'Python','A linguagem Python é considerada uma das melhores para iniciantes na programação, além de ser muito poderosa. Aprenda os principais recursos desta linguagem.','Programação','Online','./styles/imgs/curso-img.jpg','https://eucapacito.com.br/curso-ec/python'),(5,'Introdução a Redes de Computadores','Você aprenderá conceitos importantes sobre como as redes funcionam... tipos de redes, meios e formas de transmissão de dados, cabeamento estruturado, arquitetura de redes, protocolo TCP/IP, etc...','T.I','Online','./styles/imgs/curso-img.jpg','https://www.ev.org.br/cursos/introducao-a-redes-de-computadores'),(6,'Fundamentos de TI: Hardware e Software','O objetivo deste curso é apresentar os conceitos básicos da informática, os componentes dos computadores, os sistemas lógicos e as principais funções que envolvem o poder computacional.','T.I','Online','./styles/imgs/curso-img.jpg','https://www.ev.org.br/cursos/introducao-a-redes-de-computadores'),(7,'Cursos de Whatsapp','Whatsapp messenger é um aplicativo mobile de mensagens textuais entre seres humanos','Vida','Online','styles/imgs/curso-img.jpg','https://www.whatsappweb');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `img` varchar(100) NOT NULL,
  `link` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'\nMulheres na Tecnologia vol.1','A edição faz parte de uma série em que as mulheres são protagonistas em várias áreas do conhecimento.','mulheres_tecnologia_vol1_rgb.jpg',NULL),(2,'\nMulheres, raça e classe','É um livro de 1981 de Angela Davis sobre as relações entre as opressões de gênero, raça e classe social.','mulheres,raca e classe.jpg',NULL),(3,'Extraordinárias: Mulheres que revolucionaram o Brasil','Este volume, resultado de uma extensa pesquisa, chega para trazer o reconhecimento que elas merecem...','extraordinarias.jpg',NULL);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crud_node'
--

--
-- Dumping routines for database 'crud_node'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-30 20:10:22
