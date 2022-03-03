CREATE DATABASE  IF NOT EXISTS `db_clinica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_clinica`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_clinica
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Temporary view structure for view `fatura_mes`
--

DROP TABLE IF EXISTS `fatura_mes`;
/*!50001 DROP VIEW IF EXISTS `fatura_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fatura_mes` AS SELECT 
 1 AS `mes`,
 1 AS `fatura_mes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_consulta`
--

DROP TABLE IF EXISTS `tb_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_consulta` (
  `cd_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `cd_exame` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `cd_convenio` int(11) DEFAULT NULL,
  `data_exame` date DEFAULT NULL,
  PRIMARY KEY (`cd_consulta`),
  KEY `fk_convenio` (`cd_convenio`),
  KEY `fk_paciente` (`id_paciente`),
  KEY `fk_exame` (`cd_exame`),
  KEY `fk_medico` (`id_medico`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta`
--

LOCK TABLES `tb_consulta` WRITE;
/*!40000 ALTER TABLE `tb_consulta` DISABLE KEYS */;
INSERT INTO `tb_consulta` VALUES (1,1,2,5,2,'2021-09-10'),(2,2,9,1,4,'2021-05-20'),(3,3,8,2,3,'2021-06-18'),(4,4,6,3,1,'2020-06-18'),(5,1,7,5,2,'2021-05-20'),(6,2,6,6,1,'2021-01-01'),(7,3,1,6,3,'2021-03-14'),(8,4,2,6,1,'2021-03-17'),(9,1,6,2,2,'2021-06-22'),(10,1,2,3,4,'2021-06-22'),(11,2,2,3,4,'2021-06-22'),(12,1,2,3,4,'2021-06-22'),(13,1,2,3,4,'2021-06-22'),(14,5,2,3,4,'2021-06-01');
/*!40000 ALTER TABLE `tb_consulta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_log_tb_consulta AFTER INSERT
ON tb_consulta FOR EACH ROW
BEGIN

    INSERT INTO tb_consulta_log
	(cd_log, Dt_atualizacao, Operacao, cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
	values 
	(null, now(), "Insert", new.cd_consulta, new.id_paciente, new.cd_exame, new.id_medico, new.cd_convenio, new.data_exame);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_consulta AFTER INSERT
ON tb_consulta FOR EACH ROW 
BEGIN

    INSERT INTO tb_consulta_log
	(cd_log, Dt_atualizacao, Operacao, cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
	values 
	(null, now(), "Insert", new.cd_consulta, new.id_paciente, new.cd_exame, new.id_medico, new.cd_convenio, new.data_exame);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_consulta AFTER UPDATE
ON tb_consulta FOR EACH ROW 
BEGIN
	INSERT INTO tb_consulta_log
	(cd_log, Dt_atualizacao, Operacao, cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
	values 
	(null, now(), "Antes.Update", old.cd_consulta, old.id_paciente, old.cd_exame, old.id_medico, old.cd_convenio, old.data_exame);
	
    INSERT INTO tb_consulta_log
	(cd_log, Dt_atualizacao, Operacao, cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
	values 
	(null, now(), "Depois.Update", new.cd_consulta, new.id_paciente, new.cd_exame, new.id_medico, new.cd_convenio, new.data_exame);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_consulta BEFORE DELETE
ON tb_consulta FOR EACH ROW 
BEGIN

    INSERT INTO tb_consulta_log
	(cd_log, Dt_atualizacao, Operacao, cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
	values 
	(null, now(), "Delete", old.cd_consulta, old.id_paciente, old.cd_exame, old.id_medico, old.cd_convenio, old.data_exame);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_consulta_log`
--

DROP TABLE IF EXISTS `tb_consulta_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_consulta_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_consulta` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `cd_exame` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `cd_convenio` int(11) DEFAULT NULL,
  `data_exame` date DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_log`
--

LOCK TABLES `tb_consulta_log` WRITE;
/*!40000 ALTER TABLE `tb_consulta_log` DISABLE KEYS */;
INSERT INTO `tb_consulta_log` VALUES (1,'2021-06-22 15:19:37.000','Insert',13,1,2,3,4,'2021-06-22'),(2,'2021-06-28 18:38:07.000','Insert',14,5,2,3,4,'2021-06-22'),(3,'2021-06-28 18:38:07.000','Insert',14,5,2,3,4,'2021-06-22'),(4,'2021-06-28 19:01:53.000','Antes.Update',14,5,2,3,4,'2021-06-22'),(5,'2021-06-28 19:01:53.000','Depois.Update',14,5,2,3,4,'2021-06-28'),(6,'2021-06-28 19:19:34.000','Antes.Update',14,5,2,3,4,'2021-06-28'),(7,'2021-06-28 19:19:34.000','Depois.Update',14,5,2,3,4,'2021-06-01');
/*!40000 ALTER TABLE `tb_consulta_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_convenio`
--

DROP TABLE IF EXISTS `tb_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_convenio` (
  `cd_convenio` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `taxa` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cd_convenio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_convenio`
--

LOCK TABLES `tb_convenio` WRITE;
/*!40000 ALTER TABLE `tb_convenio` DISABLE KEYS */;
INSERT INTO `tb_convenio` VALUES (1,'Amil',215.00),(2,'Unimed',165.00),(3,'Bradesco',195.00),(4,'Sulamerica',280.00);
/*!40000 ALTER TABLE `tb_convenio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_convenio AFTER INSERT
ON tb_convenio FOR EACH ROW 
BEGIN

    INSERT INTO tb_convenio_log
	(cd_log, Dt_atualizacao, Operacao, cd_convenio, nome, taxa)
	values 
	(null, now(), "Insert", Operacao, new.cd_convenio, new.nome, new.taxa);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_convenio AFTER UPDATE
ON tb_convenio FOR EACH ROW 
BEGIN
	INSERT INTO tb_convenio_log
	(cd_log, Dt_atualizacao, Operacao, Operacao, cd_convenio, nome, taxa)
	values 
	(null, now(), "Antes.Update", old.cd_convenio, old.nome, old.taxa);
	
    INSERT INTO tb_convenio_log
	(cd_log, Dt_atualizacao, Operacao, Operacao, cd_convenio, nome, taxa)
	values 
	(null, now(), "Depois.Update", new.cd_convenio, new.nome, new.taxa);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_convenio BEFORE DELETE
ON tb_convenio FOR EACH ROW 
BEGIN

    INSERT INTO tb_x_log
	(cd_log, Dt_atualizacao, Operacao, Operacao, cd_convenio, nome, taxa)
	values 
	(null, now(), "Delete", old.cd_convenio, old.nome, old.taxa);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_convenio_log`
--

DROP TABLE IF EXISTS `tb_convenio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_convenio_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_convenio` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `taxa` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_convenio_log`
--

LOCK TABLES `tb_convenio_log` WRITE;
/*!40000 ALTER TABLE `tb_convenio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_convenio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_email`
--

DROP TABLE IF EXISTS `tb_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_email` (
  `cd_email` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `email_paciente` varchar(50) DEFAULT NULL,
  `email_medico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cd_email`),
  KEY `fk_email_med` (`id_medico`),
  KEY `fk_email_pac` (`id_paciente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_email`
--

LOCK TABLES `tb_email` WRITE;
/*!40000 ALTER TABLE `tb_email` DISABLE KEYS */;
INSERT INTO `tb_email` VALUES (1,1,1,'gabriel.carlete@gmail.com','medico1@gmail.com'),(2,2,2,'luis.santana@gmail.com','medico2@gmail.com'),(3,3,3,'raissa.abate@gmail.com','medico3@gmail.com'),(4,4,4,'sabrina.berno@gmail.com','medico4@gmail.com');
/*!40000 ALTER TABLE `tb_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_email_log`
--

DROP TABLE IF EXISTS `tb_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_email_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_email` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `email_paciente` varchar(50) DEFAULT NULL,
  `email_medico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_email_log`
--

LOCK TABLES `tb_email_log` WRITE;
/*!40000 ALTER TABLE `tb_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_especialidade`
--

DROP TABLE IF EXISTS `tb_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_especialidade` (
  `cd_especialidade` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cd_especialidade`),
  KEY `fk_especialidade` (`id_medico`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_especialidade`
--

LOCK TABLES `tb_especialidade` WRITE;
/*!40000 ALTER TABLE `tb_especialidade` DISABLE KEYS */;
INSERT INTO `tb_especialidade` VALUES (1,1,'Neurologia'),(2,1,'Endocrinologia'),(3,2,'Oncologia'),(4,3,'Urologia'),(5,4,'Ortopedia'),(6,5,'Dentista'),(7,5,'Cirurgião-Dentista'),(8,6,'Clinico Geral'),(9,6,'Cardiologista');
/*!40000 ALTER TABLE `tb_especialidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_especialidade AFTER INSERT
ON tb_especialidade FOR EACH ROW 
BEGIN

    INSERT INTO tb_especialidade_log
	(cd_log, Dt_atualizacao, Operacao, cd_especialidade, id_medico, especialidade)
	values  
	(null, now(), "Insert", new.cd_especialidade, new.id_medico, new.especialidade);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_especialidade AFTER UPDATE
ON tb_especialidade FOR EACH ROW 
BEGIN
	INSERT INTO tb_especialidade_log
	(cd_log, Dt_atualizacao, Operacao, cd_especialidade, id_medico, especialidade)
	values 
	(null, now(), "Antes.Update", old.cd_especialidade, old.id_medico, old.especialidade);
	
    INSERT INTO tb_especialidade_log
	(cd_log, Dt_atualizacao, Operacao, cd_especialidade, id_medico, especialidade)
	values 
	(null, now(), "Depois.Update", new.cd_especialidade, new.id_medico, new.especialidade);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_especialidade BEFORE DELETE
ON tb_especialidade FOR EACH ROW 
BEGIN

    INSERT INTO tb_especialidade_log
	(cd_log, Dt_atualizacao, Operacao,cd_especialidade, id_medico, especialidade)
	values 
	(null, now(), "Delete", old.cd_especialidade, old.id_medico, old.especialidade);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_especialidade_log`
--

DROP TABLE IF EXISTS `tb_especialidade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_especialidade_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_especialidade` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_especialidade_log`
--

LOCK TABLES `tb_especialidade_log` WRITE;
/*!40000 ALTER TABLE `tb_especialidade_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_especialidade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exame`
--

DROP TABLE IF EXISTS `tb_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_exame` (
  `cd_exame` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `valor` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cd_exame`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exame`
--

LOCK TABLES `tb_exame` WRITE;
/*!40000 ALTER TABLE `tb_exame` DISABLE KEYS */;
INSERT INTO `tb_exame` VALUES (1,'Hemograma','Informa sobre os tipos e quantidades de componentes no sangue',70.00),(2,'Glicemia em jejum','Mede o nível de glicose no sangue',10.00),(3,'Colesterol e Triglicerídeos','Mede o nível de gordura no sangue',40.00),(4,'Ureaia e creatinina','Avalia o funcionamento dos rins',30.00),(5,'TGO e TGP','Quantifica as enzimas TGO e TGP e avalia o funcionamento do fígado',25.00),(6,'TSH e T4 livre','Avalia o funcionamento da glândula tireóide',20.00),(7,'Eletrocardiograma','Mede a atividade elétrica do coração',170.00),(8,'Teste ergonométrico','Avalia o funcionamento do sistema cardiovascular sob estímulo físico gradual em uma esteira rolante ou bicicleta',300.00),(9,'Ecocardiograma','Ultrassonografia do coração que avalia o tipo de fluxo sanguíneo dentro das câmaras cardíacas',350.00);
/*!40000 ALTER TABLE `tb_exame` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_exame AFTER INSERT
ON tb_exame FOR EACH ROW 
BEGIN

    INSERT INTO tb_exame_log
	(cd_log, Dt_atualizacao, Operacao, cd_exame, nome, descricao, valor)
	values 
	(null, now(), "Insert", new.cd_exame, new.nome, new.descricao, new.valor);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_exame AFTER UPDATE
ON tb_exame FOR EACH ROW 
BEGIN
	INSERT INTO tb_exame_log
	(cd_log, Dt_atualizacao, Operacao, cd_exame, nome, descricao, valor)
	values 
	(null, now(), "Antes.Update", old.cd_exame, old.nome, old.descricao, old.valor);
	
    INSERT INTO tb_exame_log
	(cd_log, Dt_atualizacao, Operacao, cd_exame, nome, descricao, valor)
	values 
	(null, now(), "Depois.Update", new.cd_exame, new.nome, new.descricao, new.valor);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_exame BEFORE DELETE
ON tb_exame FOR EACH ROW 
BEGIN

    INSERT INTO tb_exame_log
	(cd_log, Dt_atualizacao, Operacao, cd_exame, nome, descricao, valor)
	values 
	(null, now(), "Delete", old.cd_exame, old.nome, old.descricao, old.valor);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_exame_log`
--

DROP TABLE IF EXISTS `tb_exame_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_exame_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_exame` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exame_log`
--

LOCK TABLES `tb_exame_log` WRITE;
/*!40000 ALTER TABLE `tb_exame_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_exame_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico`
--

DROP TABLE IF EXISTS `tb_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medico` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `crm` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico`
--

LOCK TABLES `tb_medico` WRITE;
/*!40000 ALTER TABLE `tb_medico` DISABLE KEYS */;
INSERT INTO `tb_medico` VALUES (1,'Yan Silva',3457),(2,'Gustavo Pryjmak',6754),(3,'Lucca Ribeiro',9870),(4,'Pedro Fonseca',4567),(5,'Icaro Peixoto',6661),(6,'Luisa Carpete',2339);
/*!40000 ALTER TABLE `tb_medico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_medico AFTER INSERT
ON tb_medico FOR EACH ROW 
BEGIN

    INSERT INTO tb_medico_log
	(cd_log, Dt_atualizacao, Operacao, id_medico, nome, crm)
	values 
	(null, now(), "Insert", new.id_medico, new.nome, new.crm);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_medico AFTER UPDATE
ON tb_medico FOR EACH ROW 
BEGIN
	INSERT INTO tb_medico_log
	(cd_log, Dt_atualizacao, Operacao, id_medico, nome, crm)
	values 
	(null, now(), "Antes.Update", old.id_medico, old.nome, old.crm);
	
    INSERT INTO tb_medico_log
	(cd_log, Dt_atualizacao, Operacao, id_medico, nome, crm)
	values 
	(null, now(), "Depois.Update", new.id_medico, new.nome, new.crm);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_medico BEFORE DELETE
ON tb_medico FOR EACH ROW 
BEGIN

    INSERT INTO tb_medico_log
	(cd_log, Dt_atualizacao, Operacao, id_medico, nome, crm)
	values 
	(null, now(), "Delete", old.id_medico, old.nome, old.crm);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_medico_log`
--

DROP TABLE IF EXISTS `tb_medico_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medico_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `id_medico` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `crm` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico_log`
--

LOCK TABLES `tb_medico_log` WRITE;
/*!40000 ALTER TABLE `tb_medico_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medico_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente`
--

DROP TABLE IF EXISTS `tb_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` decimal(11,0) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
INSERT INTO `tb_paciente` VALUES (1,'Gabriel Carlete de Amorim',12345678900,'2001-11-12'),(2,'Luis Eduardo Dalle Molle Bacelar Carvalho Santana',45678912311,'1999-10-11'),(3,'Raíssa Abate Britto',78912345622,'1998-09-02'),(4,'Sabrina Caldas Berno',32165498700,'2002-02-15');
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_ins_log_tb_paciente AFTER INSERT
ON tb_paciente FOR EACH ROW 
BEGIN

    INSERT INTO tb_paciente_log
	(cd_log, Dt_atualizacao, Operacao, id_paciente, nome, cpf, data_nascimento)
	values 
	(null, now(), "Insert", new.id_paciente, new.nome, new.cpf, new.data_nascimento);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_upd_log_tb_paciente AFTER UPDATE
ON tb_paciente FOR EACH ROW 
BEGIN
	INSERT INTO tb_paciente_log
	(cd_log, Dt_atualizacao, Operacao, id_paciente, nome, cpf, data_nascimento)
	values 
	(null, now(), "Antes.Update", old.id_paciente, old.nome, old.cpf, old.data_nascimento);
	
    INSERT INTO tb_paciente_log
	(cd_log, Dt_atualizacao, Operacao, id_paciente, nome, cpf, data_nascimento)
	values 
	(null, now(), "Depois.Update", new.id_paciente, new.nome, new.cpf, new.data_nascimento);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_del_log_tb_paciente BEFORE DELETE
ON tb_paciente FOR EACH ROW 
BEGIN

    INSERT INTO tb_paciente_log
	(cd_log, Dt_atualizacao, Operacao, id_paciente, nome, cpf, data_nascimento)
	values 
	(null, now(), "Delete", old.id_paciente, old.nome, old.cpf, old.data_nascimento);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_paciente_log`
--

DROP TABLE IF EXISTS `tb_paciente_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_paciente_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` decimal(11,0) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_log`
--

LOCK TABLES `tb_paciente_log` WRITE;
/*!40000 ALTER TABLE `tb_paciente_log` DISABLE KEYS */;
INSERT INTO `tb_paciente_log` VALUES (1,'2021-06-28 19:30:16.000','Insert',5,'Raphael',12345678998,'2021-08-26'),(2,'2021-06-28 19:33:01.000','Delete',5,'Raphael',12345678998,'2021-08-26');
/*!40000 ALTER TABLE `tb_paciente_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone`
--

DROP TABLE IF EXISTS `tb_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_telefone` (
  `cd_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `tel_paciente` varchar(20) DEFAULT NULL,
  `tel_medico` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_telefone`),
  KEY `fk_telefone_med` (`id_medico`),
  KEY `fk_telefone_pac` (`id_paciente`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone`
--

LOCK TABLES `tb_telefone` WRITE;
/*!40000 ALTER TABLE `tb_telefone` DISABLE KEYS */;
INSERT INTO `tb_telefone` VALUES (1,1,1,'61998457723','62997564320'),(2,1,1,'61987321099','61988764536'),(3,2,2,'61996728712','61997684653'),(4,2,2,'62987554789','61980786345'),(5,3,3,'61999584763','61988456320'),(6,3,3,'61980763455','61984563342'),(7,4,4,'61989675633','61980775743'),(8,4,4,'61999789643','61982104320');
/*!40000 ALTER TABLE `tb_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_log`
--

DROP TABLE IF EXISTS `tb_telefone_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_telefone_log` (
  `cd_log` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Atualizacao` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `Operacao` varchar(20) DEFAULT NULL,
  `cd_telefone` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `tel_paciente` varchar(20) DEFAULT NULL,
  `tel_medico` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cd_log`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_log`
--

LOCK TABLES `tb_telefone_log` WRITE;
/*!40000 ALTER TABLE `tb_telefone_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_clinica'
--

--
-- Dumping routines for database 'db_clinica'
--
/*!50003 DROP PROCEDURE IF EXISTS `del_Exame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_Exame`(IN vcd_exame integer)
BEGIN
    DELETE FROM tb_exame
    WHERE cd_exame = vcd_exame;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_Medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_Medico`(IN vid_medico integer)
BEGIN
    DELETE FROM tb_medico
    WHERE id_medico = vid_medico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_Paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_Paciente`(IN vid_paciente integer)
BEGIN
    DELETE FROM tb_paciente
    WHERE id_paciente = vid_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Consulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Consulta`(IN cd_consulta integer, id_paciente integer, cd_exame integer, id_medico integer, cd_convenio integer, data_exame date)
BEGIN
    INSERT INTO tb_consulta (cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame)
    VALUES (cd_consulta, id_paciente, cd_exame, id_medico, cd_convenio, data_exame);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Convenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Convenio`(IN cd_convenio integer, nome varchar(50), taxa decimal(11,2))
BEGIN
    INSERT INTO tb_convenio (cd_convenio, nome, taxa)
    VALUES (cd_convenio, nome, taxa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Email`(IN cd_email integer, id_paciente integer, id_medico integer, email_paciente varchar(50), email_medico varchar(50))
BEGIN
    INSERT INTO tb_email (cd_email, id_paciente, id_medico, email_paciente, email_medico)
    VALUES (cd_email, id_paciente, id_medico, email_paciente, email_medico);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Especialidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Especialidade`(IN cd_especialidade integer, id_medico integer, especialidade varchar(50))
BEGIN
    INSERT INTO tb_especialidade (cd_especialidade, id_medico, especialidade)
    VALUES (cd_especialidade, id_medico, especialidade);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Exame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Exame`(IN cd_exame integer, nome varchar(50), descricao varchar(200), valor decimal(11,2))
BEGIN
    INSERT INTO tb_exame (cd_exame, nome, descricao, valor)
    VALUES (cd_exame, nome, descricao, valor);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Medico`(IN id_medico integer, nome varchar(50), crm decimal(10,0))
BEGIN
    INSERT INTO tb_medico (id_medico, nome, crm)
    VALUES (id_medico, nome, crm);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_paciente`(IN id_paciente integer, nome varchar(50), cpf decimal(11,0),  data_nascimento date)
BEGIN
    INSERT INTO tb_paciente (id_paciente, nome, cpf, data_nascimento)
    VALUES (id_paciente, nome, cpf, data_nascimento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_Telefone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_Telefone`(IN cd_telefone integer, id_paciente integer, id_medico integer, tel_paciente varchar(50), tel_medico varchar(50))
BEGIN
    INSERT INTO tb_telefone (cd_telefone, id_paciente, id_medico, tel_paciente, tel_medico)
    VALUES (cd_telefone, id_paciente, id_medico, tel_paciente, tel_medico);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_Convenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_Convenio`(IN vcd_convenio integer, vtaxa decimal(11,2))
BEGIN
    UPDATE tb_convenio
    SET taxa = vtaxa
    WHERE cd_convenio = vcd_convenio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_DataConsulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_DataConsulta`(IN vcd_consulta integer, vdata_exame date)
BEGIN
    UPDATE tb_consulta 
    SET data_exame = vdata_exame
    WHERE cd_consulta = vcd_consulta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_Exame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_Exame`(IN vcd_exame integer, vvalor decimal(11,2))
BEGIN
    UPDATE tb_exame
    SET valor = vvalor
    WHERE cd_exame = vcd_exame;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `fatura_mes`
--

/*!50001 DROP VIEW IF EXISTS `fatura_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fatura_mes` AS select month(`c`.`data_exame`) AS `mes`,sum(`e`.`valor`) AS `fatura_mes` from (`tb_consulta` `c` join `tb_exame` `e` on((`c`.`cd_exame` = `e`.`cd_exame`))) group by month(`c`.`data_exame`) */;
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

-- Dump completed on 2021-06-28 19:39:48
