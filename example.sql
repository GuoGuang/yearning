-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (x86_64)
--
-- Host: 82.156.205.178    Database: yearning
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `core_accounts`
--

DROP TABLE IF EXISTS `core_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_accounts` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `username` varchar(50) NOT NULL,
                                 `password` varchar(150) NOT NULL,
                                 `department` varchar(50) DEFAULT NULL,
                                 `real_name` varchar(50) DEFAULT NULL,
                                 `email` varchar(50) DEFAULT NULL,
                                 `is_recorder` tinyint NOT NULL DEFAULT '2',
                                 `query_password` varchar(150) DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `user_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_accounts`
--

LOCK TABLES `core_accounts` WRITE;
/*!40000 ALTER TABLE `core_accounts` DISABLE KEYS */;
INSERT INTO `core_accounts` VALUES (1,'admin','pbkdf2_sha256$120000$ihXrzPvUlzjf$Znjevhqoc0w1hLng3rsyAO8yi1oLAA3vfbBb3QlpDaA=','DBA','超级管理员','',0,''),(2,'test','pbkdf2_sha256$120000$2K3WZ29LEcci$+0Cb0xtGOZo4KoaOjhX41ojJ69O6SYrtToi5SJn0VrU=','aaa','test','1413977480@qq.com',2,'');
/*!40000 ALTER TABLE `core_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_auto_tasks`
--

DROP TABLE IF EXISTS `core_auto_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_auto_tasks` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `name` varchar(50) NOT NULL,
                                   `source` varchar(50) NOT NULL,
                                   `source_id` varchar(200) NOT NULL,
                                   `data_base` varchar(50) NOT NULL,
                                   `table` varchar(50) NOT NULL,
                                   `tp` tinyint NOT NULL,
                                   `affectrow` int DEFAULT NULL,
                                   `status` tinyint DEFAULT NULL,
                                   `task_id` varchar(200) NOT NULL,
                                   `id_c` varchar(50) NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `source_idx` (`source_id`),
                                   KEY `task_idx` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_auto_tasks`
--

LOCK TABLES `core_auto_tasks` WRITE;
/*!40000 ALTER TABLE `core_auto_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_auto_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_data_sources`
--

DROP TABLE IF EXISTS `core_data_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_data_sources` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `id_c` varchar(50) NOT NULL,
                                     `source` varchar(50) NOT NULL,
                                     `ip` varchar(200) NOT NULL,
                                     `port` int NOT NULL,
                                     `username` varchar(50) NOT NULL,
                                     `password` varchar(150) NOT NULL,
                                     `is_query` tinyint NOT NULL,
                                     `flow_id` int NOT NULL,
                                     `source_id` varchar(200) NOT NULL,
                                     `exclude_db_list` varchar(200) NOT NULL,
                                     `insulate_word_list` varchar(200) NOT NULL,
                                     `principal` varchar(150) NOT NULL,
                                     `ca_file` longtext,
                                     `cert` longtext,
                                     `key_file` longtext,
                                     `db_type` int NOT NULL,
                                     `rule_id` int NOT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `source_idx` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_data_sources`
--

LOCK TABLES `core_data_sources` WRITE;
/*!40000 ALTER TABLE `core_data_sources` DISABLE KEYS */;
INSERT INTO `core_data_sources` VALUES (1,'Aliyun','82.156.205.178','82.156.205.178',3306,'root','/TdjoToqWzyEiw==',2,1,'0f939dc3-e441-471b-9e72-db0346abf4ab','','','admin','','','',0,0);
/*!40000 ALTER TABLE `core_data_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_global_configurations`
--

DROP TABLE IF EXISTS `core_global_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_global_configurations` (
                                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                              `authorization` varchar(50) NOT NULL,
                                              `ldap` json DEFAULT NULL,
                                              `message` json DEFAULT NULL,
                                              `other` json DEFAULT NULL,
                                              `stmt` tinyint NOT NULL DEFAULT '0',
                                              `audit_role` json DEFAULT NULL,
                                              `board` longtext,
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_global_configurations`
--

LOCK TABLES `core_global_configurations` WRITE;
/*!40000 ALTER TABLE `core_global_configurations` DISABLE KEYS */;
INSERT INTO `core_global_configurations` VALUES (1,'global','{\"sc\": \"\", \"map\": \"\", \"url\": \"\", \"type\": \"(&(objectClass=organizationalPerson)(sAMAccountName=%s))\", \"user\": \"\", \"ldaps\": false, \"password\": \"\", \"test_user\": \"\", \"test_password\": \"\"}','{\"key\": \"\", \"ssl\": false, \"ding\": false, \"host\": \"\", \"mail\": false, \"port\": 25, \"user\": \"\", \"to_user\": \"\", \"password\": \"\", \"web_hook\": \"\", \"push_type\": false}','{\"idc\": [\"Aliyun\", \"AWS\"], \"limit\": 1000, \"query\": false, \"domain\": \"\", \"export\": false, \"register\": false, \"ex_query_time\": 60}',0,'{\"IsOSC\": false, \"OSCExpr\": \"\", \"OscSize\": 0, \"DMLOrder\": false, \"DMLWhere\": false, \"DDLMaxKey\": 5, \"DMLSelect\": false, \"PRIRollBack\": false, \"MaxAffectRows\": 1000, \"DDLMaxKeyParts\": 5, \"DDLTablePrefix\": \"\", \"SupportCharset\": \"\", \"AllowCreateView\": false, \"CheckIdentifier\": false, \"MaxTableNameLen\": 10, \"MustHaveColumns\": \"\", \"AllowSpecialType\": false, \"DDLIndexNameSpec\": false, \"DDLMaxCharLength\": 10, \"DDLMultiToCommit\": false, \"DMLInsertColumns\": false, \"DMLMaxInsertRows\": 10, \"MaxDDLAffectRows\": 0, \"SupportCollation\": \"\", \"DDLAllowPRINotInt\": false, \"DDLPrimaryKeyMust\": false, \"DMLAllowLimitSTMT\": false, \"DDLAllowColumnType\": false, \"DDLAllowMultiAlter\": false, \"DDLEnableDropTable\": false, \"DMLAllowInsertNull\": false, \"DDLCheckFloatDouble\": false, \"DDLEnableForeignKey\": false, \"DDLEnablePrimaryKey\": false, \"AllowCreatePartition\": false, \"DDLCheckTableComment\": false, \"DDLCheckColumnDefault\": false, \"DDLEnableDropDatabase\": false, \"DDlCheckColumnComment\": false, \"DDLCheckColumnNullable\": false, \"DDLEnableAutoIncrement\": false, \"DDLEnableNullIndexName\": false, \"DDLColumnsMustHaveIndex\": \"\", \"DDLEnableAcrossDBRename\": false, \"DMLInsertMustExplicitly\": false, \"DDLImplicitTypeConversion\": false, \"DDLEnableAutoincrementInit\": false, \"AllowCrateViewWithSelectStar\": false, \"DDLAllowChangeColumnPosition\": false, \"DDLEnableAutoincrementUnsigned\": false}','');
/*!40000 ALTER TABLE `core_global_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_graineds`
--

DROP TABLE IF EXISTS `core_graineds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_graineds` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `username` varchar(50) NOT NULL,
                                 `group` json DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `user_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_graineds`
--

LOCK TABLES `core_graineds` WRITE;
/*!40000 ALTER TABLE `core_graineds` DISABLE KEYS */;
INSERT INTO `core_graineds` VALUES (1,'admin','[\"baa567a1-a911-4529-8950-fbce5595c3a7\"]'),(2,'test','[\"e8af3fde-3a9b-4a75-8035-2e95579a0f71\"]');
/*!40000 ALTER TABLE `core_graineds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_order_comments`
--

DROP TABLE IF EXISTS `core_order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_order_comments` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `work_id` varchar(50) NOT NULL,
                                       `username` varchar(50) NOT NULL,
                                       `content` longtext,
                                       `time` varchar(50) NOT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `workId_idx` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_order_comments`
--

LOCK TABLES `core_order_comments` WRITE;
/*!40000 ALTER TABLE `core_order_comments` DISABLE KEYS */;
INSERT INTO `core_order_comments` VALUES (1,'20230903230542784','admin','驳回理由: ll','2023-09-03 23:08');
/*!40000 ALTER TABLE `core_order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_query_orders`
--

DROP TABLE IF EXISTS `core_query_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_query_orders` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `work_id` varchar(50) NOT NULL,
                                     `username` varchar(50) NOT NULL,
                                     `date` varchar(50) NOT NULL,
                                     `approval_time` varchar(50) NOT NULL,
                                     `text` longtext NOT NULL,
                                     `assigned` varchar(50) NOT NULL,
                                     `real_name` varchar(50) NOT NULL,
                                     `export` tinyint NOT NULL,
                                     `source_id` varchar(200) NOT NULL,
                                     `status` tinyint NOT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `workId_idx` (`work_id`),
                                     KEY `source_idx` (`source_id`),
                                     KEY `status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_query_orders`
--

LOCK TABLES `core_query_orders` WRITE;
/*!40000 ALTER TABLE `core_query_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_query_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_query_records`
--

DROP TABLE IF EXISTS `core_query_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_query_records` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `work_id` varchar(50) NOT NULL,
                                      `sql` longtext NOT NULL,
                                      `ex_time` int NOT NULL,
                                      `time` varchar(50) NOT NULL,
                                      `source` varchar(50) NOT NULL,
                                      `schema` varchar(50) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `workId_idx` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_query_records`
--

LOCK TABLES `core_query_records` WRITE;
/*!40000 ALTER TABLE `core_query_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_query_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role_groups`
--

DROP TABLE IF EXISTS `core_role_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_role_groups` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `name` varchar(50) NOT NULL,
                                    `permissions` json DEFAULT NULL,
                                    `group_id` varchar(200) NOT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `group_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role_groups`
--

LOCK TABLES `core_role_groups` WRITE;
/*!40000 ALTER TABLE `core_role_groups` DISABLE KEYS */;
INSERT INTO `core_role_groups` VALUES (1,'admin','{\"ddl_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"], \"dml_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"], \"query_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"]}','baa567a1-a911-4529-8950-fbce5595c3a7'),(2,'用户','{\"ddl_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"], \"dml_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"], \"query_source\": [\"0f939dc3-e441-471b-9e72-db0346abf4ab\"]}','e8af3fde-3a9b-4a75-8035-2e95579a0f71');
/*!40000 ALTER TABLE `core_role_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_rollbacks`
--

DROP TABLE IF EXISTS `core_rollbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_rollbacks` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `work_id` varchar(50) NOT NULL,
                                  `sql` longtext NOT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `workId_idx` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_rollbacks`
--

LOCK TABLES `core_rollbacks` WRITE;
/*!40000 ALTER TABLE `core_rollbacks` DISABLE KEYS */;
INSERT INTO `core_rollbacks` VALUES (1,'20230903231309342','ALTER TABLE `incacloud`.`bms_oms_auto_print` CHANGE COLUMN `1111` `neworder_status` tinyint;');
/*!40000 ALTER TABLE `core_rollbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_rules`
--

DROP TABLE IF EXISTS `core_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_rules` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `desc` longtext NOT NULL,
                              `audit_role` json DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_rules`
--

LOCK TABLES `core_rules` WRITE;
/*!40000 ALTER TABLE `core_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sql_orders`
--

DROP TABLE IF EXISTS `core_sql_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_sql_orders` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `work_id` varchar(50) NOT NULL,
                                   `username` varchar(50) NOT NULL,
                                   `status` tinyint NOT NULL,
                                   `type` tinyint NOT NULL,
                                   `backup` tinyint NOT NULL,
                                   `id_c` varchar(50) NOT NULL,
                                   `source` varchar(50) NOT NULL,
                                   `source_id` varchar(200) NOT NULL,
                                   `data_base` varchar(50) NOT NULL,
                                   `table` varchar(50) NOT NULL,
                                   `date` varchar(50) NOT NULL,
                                   `sql` longtext NOT NULL,
                                   `text` longtext NOT NULL,
                                   `assigned` varchar(550) NOT NULL,
                                   `delay` varchar(50) NOT NULL DEFAULT 'none',
                                   `real_name` varchar(50) NOT NULL,
                                   `execute_time` varchar(50) DEFAULT NULL,
                                   `time` varchar(50) NOT NULL,
                                   `current_step` int DEFAULT NULL,
                                   `relevant` json DEFAULT NULL,
                                   `osc_info` longtext,
                                   `file` varchar(200) NOT NULL,
                                   `tag` varchar(200) NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `workId_idx` (`work_id`),
                                   KEY `query_idx` (`username`),
                                   KEY `source_idx` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sql_orders`
--

LOCK TABLES `core_sql_orders` WRITE;
/*!40000 ALTER TABLE `core_sql_orders` DISABLE KEYS */;
INSERT INTO `core_sql_orders` VALUES (1,'20230903230542784','admin',0,0,1,'Aliyun','82.156.205.178','0f939dc3-e441-471b-9e72-db0346abf4ab','incacloud','bms_oms_auto_print','2023-09-03 23:05','ALTER TABLE\n  `bms_oms_auto_print` change neworder_status `1111` tinyint null;','11','admin','none','超级管理员','','2023-09-03',1,'[\"提交人\", \"admin\"]','','',''),(2,'20230903231309342','test',1,0,1,'Aliyun','82.156.205.178','0f939dc3-e441-471b-9e72-db0346abf4ab','incacloud','bms_oms_auto_print','2023-09-03 23:13','alter table\n  bms_oms_auto_print change neworder_status `1111` tinyint null;','1111','admin','none','test','2023-09-03 23:14','2023-09-03',3,'[\"提交人\", \"admin\", \"admin\"]','','','aaa');
/*!40000 ALTER TABLE `core_sql_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sql_records`
--

DROP TABLE IF EXISTS `core_sql_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_sql_records` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `work_id` varchar(50) NOT NULL,
                                    `sql` longtext NOT NULL,
                                    `state` varchar(50) NOT NULL,
                                    `affectrow` int NOT NULL,
                                    `time` varchar(50) NOT NULL,
                                    `error` longtext,
                                    PRIMARY KEY (`id`),
                                    KEY `workId_idx` (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sql_records`
--

LOCK TABLES `core_sql_records` WRITE;
/*!40000 ALTER TABLE `core_sql_records` DISABLE KEYS */;
INSERT INTO `core_sql_records` VALUES (1,'20230903231309342','alter table\n  bms_oms_auto_print change neworder_status `1111` tinyint null;','',0,'51.181749ms','');
/*!40000 ALTER TABLE `core_sql_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_total_tickets`
--

DROP TABLE IF EXISTS `core_total_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_total_tickets` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `date` varchar(50) NOT NULL,
                                      `total_order` int NOT NULL,
                                      `total_query` int NOT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `date_idx` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_total_tickets`
--

LOCK TABLES `core_total_tickets` WRITE;
/*!40000 ALTER TABLE `core_total_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_total_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_workflow_details`
--

DROP TABLE IF EXISTS `core_workflow_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_workflow_details` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `work_id` varchar(50) NOT NULL,
                                         `username` varchar(50) NOT NULL,
                                         `time` varchar(50) NOT NULL,
                                         `action` varchar(550) NOT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `workId_idx` (`work_id`),
                                         KEY `query_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_workflow_details`
--

LOCK TABLES `core_workflow_details` WRITE;
/*!40000 ALTER TABLE `core_workflow_details` DISABLE KEYS */;
INSERT INTO `core_workflow_details` VALUES (1,'20230903230542784','admin','2023-09-03 23:05','已提交'),(2,'20230903230542784','admin','2023-09-03 23:08','已驳回'),(3,'20230903231309342','test','2023-09-03 23:13','已提交'),(4,'20230903231309342','admin','2023-09-03 23:14','审核通过,并已转交至 admin'),(5,'20230903231309342','admin','2023-09-03 23:14','审核通过并执行！');
/*!40000 ALTER TABLE `core_workflow_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_workflow_tpls`
--

DROP TABLE IF EXISTS `core_workflow_tpls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_workflow_tpls` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `source` varchar(50) NOT NULL,
                                      `steps` json DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `source_idx` (`source`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_workflow_tpls`
--

LOCK TABLES `core_workflow_tpls` WRITE;
/*!40000 ALTER TABLE `core_workflow_tpls` DISABLE KEYS */;
INSERT INTO `core_workflow_tpls` VALUES (1,'bbb','[{\"desc\": \"提交阶段\", \"type\": -1, \"auditor\": [\"提交人\"]}, {\"desc\": \"aa\", \"type\": 0, \"auditor\": [\"admin\"]}, {\"desc\": \"bbb\", \"type\": 1, \"auditor\": [\"admin\"]}]');
/*!40000 ALTER TABLE `core_workflow_tpls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-03 23:22:48
