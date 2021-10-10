-- MySQL dump 10.19  Distrib 10.3.30-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.3.30-MariaDB-1:10.3.30+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `explicit_allowdeny` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagetypes_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_modify` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `subgroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `category_perms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `availableWidgets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mfa_providers` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(190) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` longblob DEFAULT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usergroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` smallint(5) unsigned NOT NULL DEFAULT 0,
  `realName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `workspace_id` int(11) NOT NULL DEFAULT 0,
  `category_perms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_news_categorymounts` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mfa` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1590184354,1590184354,0,0,0,0,0,NULL,'admin',0,'$argon2i$v=19$m=65536,t=16,p=1$TlgzSC9wNFJISU1NaHEuWg$EMG+sApnSvhQ7NQIAi63SdoYXes6o7tw97CCMzhKOqY',1,'','default','',NULL,0,'',NULL,'','a:13:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:3:{s:10:\"web_layout\";a:3:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";s:19:\"constant_editor_cat\";N;}s:10:\"FormEngine\";a:2:{i:0;a:1:{s:32:\"c312013d83c1a6ad7fec8b36a37ba3c8\";a:4:{i:0;s:934:\"At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias&amp;nbsp;excepturi&amp;nbsp;sint, obcaecati&amp;nbsp;cupiditate&amp;nbsp;non provident, similique&amp;nbsp;sunt in culpa,&amp;nbsp;qui officia deserunt mollitia&amp;nbsp;animi,&amp;nbsp;id est laborum&amp;nbsp;et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\";i:1;a:5:{s:4:\"edit\";a:1:{s:10:\"tt_content\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:33:\"&edit%5Btt_content%5D%5B1%5D=edit\";i:3;a:5:{s:5:\"table\";s:10:\"tt_content\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"c312013d83c1a6ad7fec8b36a37ba3c8\";}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:7:\"default\";s:19:\"firstLoginTimeStamp\";i:1633895213;s:15:\"moduleSessionID\";a:3:{s:10:\"web_layout\";s:40:\"be333dcf7f9951c60fb0bc412516c7e589c4ebbd\";s:10:\"FormEngine\";s:40:\"be333dcf7f9951c60fb0bc412516c7e589c4ebbd\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:40:\"be333dcf7f9951c60fb0bc412516c7e589c4ebbd\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:4:{s:3:\"0_1\";s:1:\"1\";s:3:\"0_2\";s:1:\"1\";s:3:\"0_5\";s:1:\"0\";s:3:\"0_6\";s:1:\"0\";}}}}s:10:\"modulemenu\";s:14:\"{\"tools\":true}\";s:10:\"navigation\";a:1:{s:5:\"width\";s:3:\"300\";}}',NULL,NULL,1,NULL,1633891365,0,NULL,'','',NULL),(2,0,1590355443,1590355443,0,0,0,0,0,NULL,'_cli_',0,'$argon2i$v=19$m=65536,t=16,p=1$RnNKQ0hGZFdFY0FwbFhObg$1xu3q16PpyUCL01MnPdAoigzhe00NuBQYM1fKwwhIk0',1,'','default','',NULL,0,'',NULL,'','',NULL,NULL,1,NULL,0,0,NULL,'','',NULL);
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_adminpanel_requestcache`
--

DROP TABLE IF EXISTS `cache_adminpanel_requestcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adminpanel_requestcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adminpanel_requestcache`
--

LOCK TABLES `cache_adminpanel_requestcache` WRITE;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_adminpanel_requestcache_tags`
--

DROP TABLE IF EXISTS `cache_adminpanel_requestcache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adminpanel_requestcache_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adminpanel_requestcache_tags`
--

LOCK TABLES `cache_adminpanel_requestcache_tags` WRITE;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_adminpanel_requestcache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_news_category`
--

DROP TABLE IF EXISTS `cache_news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_news_category`
--

LOCK TABLES `cache_news_category` WRITE;
/*!40000 ALTER TABLE `cache_news_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_news_category_tags`
--

DROP TABLE IF EXISTS `cache_news_category_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_news_category_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_news_category_tags`
--

LOCK TABLES `cache_news_category_tags` WRITE;
/*!40000 ALTER TABLE `cache_news_category_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_news_category_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `treelist` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_vhs_main`
--

DROP TABLE IF EXISTS `cache_vhs_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_vhs_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_vhs_main`
--

LOCK TABLES `cache_vhs_main` WRITE;
/*!40000 ALTER TABLE `cache_vhs_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_vhs_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_vhs_main_tags`
--

DROP TABLE IF EXISTS `cache_vhs_main_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_vhs_main_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_vhs_main_tags`
--

LOCK TABLES `cache_vhs_main_tags` WRITE;
/*!40000 ALTER TABLE `cache_vhs_main_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_vhs_main_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_vhs_markdown`
--

DROP TABLE IF EXISTS `cache_vhs_markdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_vhs_markdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_vhs_markdown`
--

LOCK TABLES `cache_vhs_markdown` WRITE;
/*!40000 ALTER TABLE `cache_vhs_markdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_vhs_markdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_vhs_markdown_tags`
--

DROP TABLE IF EXISTS `cache_vhs_markdown_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_vhs_markdown_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_vhs_markdown_tags`
--

LOCK TABLES `cache_vhs_markdown_tags` WRITE;
/*!40000 ALTER TABLE `cache_vhs_markdown_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_vhs_markdown_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(190) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` mediumblob DEFAULT NULL,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` blob DEFAULT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `is_online` int(10) unsigned NOT NULL DEFAULT 0,
  `mfa` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT 0,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_siteroot` smallint(6) NOT NULL DEFAULT 0,
  `php_tree_stop` smallint(6) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `target` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT 0,
  `keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `cache_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
  `abstract` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT 0,
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
  `l18n_cfg` smallint(6) NOT NULL DEFAULT 0,
  `fe_login_mode` smallint(6) NOT NULL DEFAULT 0,
  `backend_layout` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1609536364,1590184366,1,0,0,0,0,'',0,NULL,0,0,0,0,NULL,0,'a:37:{s:7:\"doktype\";N;s:5:\"title\";N;s:4:\"slug\";N;s:9:\"nav_title\";N;s:8:\"subtitle\";N;s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:11:\"lastUpdated\";N;s:6:\"layout\";N;s:8:\"newUntil\";N;s:14:\"backend_layout\";N;s:25:\"backend_layout_next_level\";N;s:16:\"content_from_pid\";N;s:6:\"target\";N;s:13:\"cache_timeout\";N;s:10:\"cache_tags\";N;s:11:\"is_siteroot\";N;s:9:\"no_search\";N;s:13:\"php_tree_stop\";N;s:6:\"module\";N;s:5:\"media\";N;s:17:\"tsconfig_includes\";N;s:8:\"TSconfig\";N;s:8:\"l18n_cfg\";N;s:6:\"hidden\";N;s:8:\"nav_hide\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:16:\"extendToSubpages\";N;s:8:\"fe_group\";N;s:13:\"fe_login_mode\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,1,1,31,31,1,'Home','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1609692487,NULL,'',0,'','','',0,0,0,0,0,0,'pagets__Main','pagets__Main',NULL,0),(2,1,1609692714,1590185724,1,0,0,0,0,'',256,'',0,0,0,0,NULL,0,'a:37:{s:7:\"doktype\";N;s:5:\"title\";N;s:4:\"slug\";N;s:9:\"nav_title\";N;s:8:\"subtitle\";N;s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:11:\"lastUpdated\";N;s:6:\"layout\";N;s:8:\"newUntil\";N;s:14:\"backend_layout\";N;s:25:\"backend_layout_next_level\";N;s:16:\"content_from_pid\";N;s:6:\"target\";N;s:13:\"cache_timeout\";N;s:10:\"cache_tags\";N;s:11:\"is_siteroot\";N;s:9:\"no_search\";N;s:13:\"php_tree_stop\";N;s:6:\"module\";N;s:5:\"media\";N;s:17:\"tsconfig_includes\";N;s:8:\"TSconfig\";N;s:8:\"l18n_cfg\";N;s:6:\"hidden\";N;s:8:\"nav_hide\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:16:\"extendToSubpages\";N;s:8:\"fe_group\";N;s:13:\"fe_login_mode\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,1,0,31,27,0,'News','/news',1,'',0,0,'',0,0,'',0,'',0,0,'',0,'',0,'',0,1610564753,'','',0,'','','',0,0,0,0,0,0,'','','',0),(3,1,1590836027,1590250003,1,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,0,'a:1:{s:5:\"title\";N;}',0,0,0,0,1,0,31,27,0,'News A','/sys-folder/news',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0),(4,1,1609692724,1590705030,1,0,0,0,0,'',384,NULL,0,0,0,0,NULL,0,'a:37:{s:7:\"doktype\";N;s:5:\"title\";N;s:4:\"slug\";N;s:9:\"nav_title\";N;s:8:\"subtitle\";N;s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:11:\"lastUpdated\";N;s:6:\"layout\";N;s:8:\"newUntil\";N;s:14:\"backend_layout\";N;s:25:\"backend_layout_next_level\";N;s:16:\"content_from_pid\";N;s:6:\"target\";N;s:13:\"cache_timeout\";N;s:10:\"cache_tags\";N;s:11:\"is_siteroot\";N;s:9:\"no_search\";N;s:13:\"php_tree_stop\";N;s:6:\"module\";N;s:5:\"media\";N;s:17:\"tsconfig_includes\";N;s:8:\"TSconfig\";N;s:8:\"l18n_cfg\";N;s:6:\"hidden\";N;s:8:\"nav_hide\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:16:\"extendToSubpages\";N;s:8:\"fe_group\";N;s:13:\"fe_login_mode\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,1,0,31,27,0,'Login','/login',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1609692724,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0),(5,2,1610567628,1610567542,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,0,31,27,0,'Details','/news/details',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,1610567832,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0),(6,1,1590836092,1590836046,1,0,0,0,0,'',768,NULL,0,0,0,0,NULL,3,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,0,31,27,0,'News B','/sys-folder/news-1',254,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','','',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sc_group` smallint(6) NOT NULL DEFAULT 0,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arguments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  `items` int(11) NOT NULL DEFAULT 0,
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `images` int(10) unsigned DEFAULT 0,
  `single_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut` int(11) NOT NULL DEFAULT 0,
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
INSERT INTO `sys_category` VALUES (1,3,1590836114,1590700984,1,0,0,0,0,256,'',0,0,NULL,0,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 1A',0,1,'0',0,0,0,'','','','','','','category-1a'),(2,3,1590836129,1590700995,1,0,0,0,0,512,'',0,0,NULL,0,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 2A',0,2,'0',0,0,0,'','','','','','','category-2a'),(3,3,1590836141,1590701005,1,0,0,0,0,768,'',0,0,NULL,0,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 3A',0,1,'0',0,0,0,'','','','','','','category-3a'),(4,3,1590836162,1590701015,1,0,0,0,0,1024,'',0,0,NULL,0,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 4A',0,1,'0',0,0,0,'','','','','','','category-4a'),(5,6,1590836289,1590836046,1,0,0,0,0,1024,'',0,0,NULL,4,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 4B',0,0,'0',0,0,0,'','','','','','','category-4b'),(6,6,1590836299,1590836046,1,0,0,0,0,768,'',0,0,NULL,3,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 3B',0,0,'0',0,0,0,'','','','','','','category-3b'),(7,6,1590836257,1590836046,1,0,0,0,0,512,'',0,0,NULL,2,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 2B',0,2,'0',0,0,0,'','','','','','','category-2b'),(8,6,1590836244,1590836046,1,0,0,0,0,256,'',0,0,NULL,1,'a:16:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"parent\";N;s:5:\"items\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:6:\"images\";N;s:11:\"description\";N;s:10:\"single_pid\";N;s:8:\"shortcut\";N;}',0,0,0,0,'Category 1B',0,1,'0',0,0,0,'','','','','','','category-1b');
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(10) unsigned NOT NULL DEFAULT 0,
  `uid_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
INSERT INTO `sys_category_record_mm` VALUES (1,1,'tx_news_domain_model_news','categories',1,1),(2,1,'tx_news_domain_model_news','categories',1,2),(2,2,'tx_news_domain_model_news','categories',2,1),(3,3,'tx_news_domain_model_news','categories',1,1),(4,3,'tx_news_domain_model_news','categories',1,2),(11,10,'tx_news_domain_model_news','categories',0,1);
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `last_indexed` int(11) NOT NULL DEFAULT 0,
  `missing` smallint(6) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT 0,
  `identifier` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creation_date` int(11) NOT NULL DEFAULT 0,
  `modification_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1590700944,0,0,1,'2',0,'/user_upload/test1.jpg','984f1c74213b29590ed270a4cae8d2cfd422cf12','19669f1e02c2f16705ec7587044c66443be70725','jpg','image/jpeg','test1.jpg','c7254f44aa10b6f89e328731672eda5082fd4976',42520,1590700944,1590700944),(2,0,1633894798,0,0,1,'5',0,'/user_upload/index.html','c25533f303185517ca3e1e24b215d53aa74076d2','19669f1e02c2f16705ec7587044c66443be70725','html','application/x-empty','index.html','da39a3ee5e6b4b0d3255bfef95601890afd80709',0,1609708410,1609708410),(3,0,1633894888,0,0,1,'5',0,'/user_upload/_temp_/index.html','a3ef597b554ed2a28c720b3e90e51edc9ec642b1','4e0743c93934dd9a02564d8e654d714bd2dc3d20','html','application/x-empty','index.html','da39a3ee5e6b4b0d3255bfef95601890afd80709',0,1609708410,1609708410);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `folder` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recursive` smallint(6) NOT NULL DEFAULT 0,
  `category` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `file` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1590700944,1590700944,1,0,0,NULL,0,'',0,0,0,0,1,NULL,720,449,NULL,NULL,0),(2,0,1633894798,1633894798,1,0,0,NULL,0,'',0,0,0,0,2,NULL,0,0,NULL,NULL,0),(3,0,1633894888,1633894888,1,0,0,NULL,0,'',0,0,0,0,3,NULL,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` blob DEFAULT NULL,
  `configurationsha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  `processing_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `table_local` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT 0,
  `showinpreview` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
INSERT INTO `sys_file_reference` VALUES (1,3,1590836228,1590700955,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,1,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(2,3,1599335757,1590704324,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,2,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(3,3,1599335757,1590704381,1,0,0,0,0,NULL,'a:9:{s:13:\"showinpreview\";N;s:11:\"alternative\";N;s:11:\"description\";N;s:4:\"link\";N;s:5:\"title\";N;s:4:\"crop\";N;s:9:\"uid_local\";N;s:6:\"hidden\";N;s:16:\"sys_language_uid\";N;}',0,0,0,0,1,2,'tx_news_domain_model_news','fal_media',2,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(4,3,1590836196,1590704857,1,0,0,0,0,NULL,'a:9:{s:13:\"showinpreview\";N;s:11:\"alternative\";N;s:11:\"description\";N;s:4:\"link\";N;s:5:\"title\";N;s:4:\"crop\";N;s:9:\"uid_local\";N;s:6:\"hidden\";N;s:16:\"sys_language_uid\";N;}',0,0,0,0,1,3,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(6,6,1590836349,1590836046,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,5,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(7,6,1590836334,1590836046,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,6,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(8,6,1590836334,1590836046,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,6,'tx_news_domain_model_news','fal_media',2,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0),(9,6,1590836321,1590836046,1,0,0,0,0,NULL,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,1,7,'tx_news_domain_model_news','fal_media',1,'sys_file',NULL,NULL,NULL,'','{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',0,0);
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `is_browsable` smallint(6) NOT NULL DEFAULT 0,
  `is_public` smallint(6) NOT NULL DEFAULT 0,
  `is_writable` smallint(6) NOT NULL DEFAULT 0,
  `is_online` smallint(6) NOT NULL DEFAULT 1,
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT 1,
  `processingfolder` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1590185411,1590185411,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin/ (auto-created)','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT 0,
  `read_only` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontype` smallint(6) NOT NULL DEFAULT 0,
  `usertype` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace` int(11) DEFAULT 0,
  `correlation_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `record_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `action` smallint(5) unsigned NOT NULL DEFAULT 0,
  `recuid` int(10) unsigned NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT 0,
  `error` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details_nr` smallint(6) NOT NULL DEFAULT 0,
  `IP` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_pid` int(11) NOT NULL DEFAULT -1,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `NEWid` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `parent` (`pid`),
  KEY `errorcount` (`tstamp`,`error`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT 0,
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT 0,
  `ref_string` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
INSERT INTO `sys_refindex` VALUES ('1c9b8784c1518ef7b22704c4fc698ca9','sys_file',2,'storage','','','',0,0,'sys_file_storage',1,''),('24d47b29aa969cf4db8635e76dd1c386','sys_file',3,'storage','','','',0,0,'sys_file_storage',1,''),('4ea5d838c9f757020bf8be571951fbc8','sys_file_reference',2,'uid_local','','','',0,0,'sys_file',1,''),('9f14da3b8f5fe576df03d50d8f328b1b','sys_file_reference',3,'uid_local','','','',0,0,'sys_file',1,''),('ae47a88be477a428abf3e63a3c701c79','tx_news_domain_model_news',2,'tags','','','',0,0,'tx_news_domain_model_tag',1,''),('b22f3a8c049af29fb7841753c6f60486','tx_news_domain_model_news',2,'tags','','','',1,0,'tx_news_domain_model_tag',2,''),('cb946a83a0eccfa5437e99e43ec1148f','tx_news_domain_model_news',2,'fal_media','','','',0,0,'sys_file_reference',2,''),('d35766891c8c856f5ad8fadf452344c9','tx_news_domain_model_news',2,'fal_media','','','',1,0,'sys_file_reference',3,'');
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Form\\Hooks\\FormFileExtensionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ExtensionManagerTables','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\WizardDoneToRegistry','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\StartModuleUpdate','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FrontendUserImageUpdateWizard','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\DatabaseRowsUpdateWizard','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CommandLineBackendUserRemovalUpdate','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FillTranslationSourceField','i:1;'),(9,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SectionFrameToFrameClassUpdate','i:1;'),(10,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SplitMenusUpdate','i:1;'),(11,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BulletContentElementUpdate','i:1;'),(12,'installUpdate','TYPO3\\CMS\\Install\\Updates\\UploadContentElementUpdate','i:1;'),(13,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateFscStaticTemplateUpdate','i:1;'),(14,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FileReferenceUpdate','i:1;'),(15,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateFeSessionDataUpdate','i:1;'),(16,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Compatibility7ExtractionUpdate','i:1;'),(17,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FormLegacyExtractionUpdate','i:1;'),(18,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RteHtmlAreaExtractionUpdate','i:1;'),(19,'installUpdate','TYPO3\\CMS\\Install\\Updates\\LanguageSortingUpdate','i:1;'),(20,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Typo3DbExtractionUpdate','i:1;'),(21,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FuncExtractionUpdate','i:1;'),(22,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigrateUrlTypesInPagesUpdate','i:1;'),(23,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SeparateSysHistoryFromSysLogUpdate','i:1;'),(24,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectExtractionUpdate','i:1;'),(25,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserStartModuleUpdate','i:1;'),(26,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayUpdate','i:1;'),(27,'installUpdate','TYPO3\\CMS\\Install\\Updates\\MigratePagesLanguageOverlayBeGroupsAccessRights','i:1;'),(28,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendLayoutIconUpdateWizard','i:1;'),(29,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RedirectsExtensionUpdate','i:1;'),(30,'installUpdate','TYPO3\\CMS\\Install\\Updates\\AdminPanelInstall','i:1;'),(31,'installUpdate','TYPO3\\CMS\\Install\\Updates\\PopulatePageSlugs','i:1;'),(32,'installUpdate','TYPO3\\CMS\\Install\\Updates\\Argon2iPasswordHashes','i:1;'),(33,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserConfigurationUpdate','i:1;'),(34,'core','formProtectionSessionToken:1','s:64:\"85e3e1364b7b292b6f2444687c247324ae07a69d3cb73af57fa7bcf5e95eaa02\";'),(35,'tx_reports','status.highestSeverity','i:2;'),(36,'extensionDataImport','typo3/sysext/core/ext_tables_static+adt.sql','s:0:\"\";'),(37,'extensionDataImport','typo3/sysext/extbase/ext_tables_static+adt.sql','s:0:\"\";'),(38,'extensionDataImport','typo3/sysext/fluid/ext_tables_static+adt.sql','s:0:\"\";'),(39,'extensionDataImport','typo3/sysext/install/ext_tables_static+adt.sql','s:0:\"\";'),(40,'extensionDataImport','typo3/sysext/recordlist/ext_tables_static+adt.sql','s:0:\"\";'),(41,'extensionDataImport','typo3/sysext/backend/ext_tables_static+adt.sql','s:0:\"\";'),(42,'extensionDataImport','typo3/sysext/setup/ext_tables_static+adt.sql','s:0:\"\";'),(43,'extensionDataImport','typo3/sysext/rte_ckeditor/ext_tables_static+adt.sql','s:0:\"\";'),(44,'extensionDataImport','typo3/sysext/about/ext_tables_static+adt.sql','s:0:\"\";'),(45,'extensionDataImport','typo3/sysext/adminpanel/ext_tables_static+adt.sql','s:0:\"\";'),(46,'extensionDataImport','typo3/sysext/belog/ext_tables_static+adt.sql','s:0:\"\";'),(47,'extensionDataImport','typo3/sysext/extensionmanager/ext_tables_static+adt.sql','s:32:\"9beb0be917f14fdde2c9cb940a47d38e\";'),(48,'extensionDataImport','typo3/sysext/filelist/ext_tables_static+adt.sql','s:0:\"\";'),(49,'extensionDataImport','typo3/sysext/frontend/ext_tables_static+adt.sql','s:0:\"\";'),(50,'extensionDataImport','typo3/sysext/info/ext_tables_static+adt.sql','s:0:\"\";'),(51,'extensionDataImport','typo3/sysext/recycler/ext_tables_static+adt.sql','s:0:\"\";'),(52,'extensionDataImport','typo3/sysext/reports/ext_tables_static+adt.sql','s:0:\"\";'),(53,'extensionDataImport','typo3/sysext/t3editor/ext_tables_static+adt.sql','s:0:\"\";'),(54,'extensionDataImport','typo3/sysext/tstemplate/ext_tables_static+adt.sql','s:0:\"\";'),(55,'extensionDataImport','typo3conf/ext/news/ext_tables_static+adt.sql','s:0:\"\";'),(56,'extensionDataImport','typo3conf/ext/t3api/ext_tables_static+adt.sql','s:0:\"\";'),(57,'extensionDataImport','typo3conf/ext/t3apinews/ext_tables_static+adt.sql','s:0:\"\";'),(58,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RsaauthExtractionUpdate','i:1;'),(59,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(60,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(61,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(62,'installUpdate','TYPO3\\CMS\\Install\\Updates\\BackendUserLanguageMigration','i:1;'),(63,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysLogChannel','i:1;'),(64,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SvgFilesSanitization','i:1;'),(65,'extensionScannerNotAffected','782a296528be3f95640e8fb1ca72b61b','s:32:\"782a296528be3f95640e8fb1ca72b61b\";'),(66,'extensionScannerNotAffected','8e57538a6b4eb5977b710dda86c19a79','s:32:\"8e57538a6b4eb5977b710dda86c19a79\";'),(67,'extensionScannerNotAffected','94935c6e14d0aff251bb66552a78774e','s:32:\"94935c6e14d0aff251bb66552a78774e\";'),(68,'extensionScannerNotAffected','d8ddb8d308daf783e702d6ff4197b630','s:32:\"d8ddb8d308daf783e702d6ff4197b630\";'),(69,'extensionScannerNotAffected','db580c43603bc85dce820925c0391148','s:32:\"db580c43603bc85dce820925c0391148\";'),(70,'extensionScannerNotAffected','d544bdbde714a2ec968cb3270273fc18','s:32:\"d544bdbde714a2ec968cb3270273fc18\";'),(71,'extensionScannerNotAffected','65d3c5339cf7b511f4f892427a5a294f','s:32:\"65d3c5339cf7b511f4f892427a5a294f\";'),(72,'extensionScannerNotAffected','ba01e41c82b0218933f2c05542aec142','s:32:\"ba01e41c82b0218933f2c05542aec142\";'),(73,'extensionScannerNotAffected','8e787af732d7f3edea4492626092bfb4','s:32:\"8e787af732d7f3edea4492626092bfb4\";'),(74,'extensionScannerNotAffected','8bcdcb5cb360544051b268949bfe5793','s:32:\"8bcdcb5cb360544051b268949bfe5793\";'),(75,'extensionScannerNotAffected','7bf45c02a5c39c6babccb5ea80a820ac','s:32:\"7bf45c02a5c39c6babccb5ea80a820ac\";'),(76,'extensionScannerNotAffected','07be8a5d35d670955b5edd1cf6fb177e','s:32:\"07be8a5d35d670955b5edd1cf6fb177e\";'),(77,'extensionScannerNotAffected','2b495b045a49a5002f033f663268e460','s:32:\"2b495b045a49a5002f033f663268e460\";'),(78,'extensionScannerNotAffected','97f1cb270f7c6ce7261e229007892f53','s:32:\"97f1cb270f7c6ce7261e229007892f53\";'),(79,'extensionScannerNotAffected','329a78b9a0cb7a8fce549d1f99750626','s:32:\"329a78b9a0cb7a8fce549d1f99750626\";'),(80,'extensionScannerNotAffected','c7d2136d519fa26627008c5c7ef0b7b8','s:32:\"c7d2136d519fa26627008c5c7ef0b7b8\";'),(81,'extensionScannerNotAffected','9522a14ae76b26966c6383c435872cf2','s:32:\"9522a14ae76b26966c6383c435872cf2\";'),(82,'extensionScannerNotAffected','f55d0a8bf02260a90d0dfd562fd3011f','s:32:\"f55d0a8bf02260a90d0dfd562fd3011f\";'),(83,'extensionScannerNotAffected','da20688d2c914dfbb71b99797a2b5231','s:32:\"da20688d2c914dfbb71b99797a2b5231\";'),(84,'extensionScannerNotAffected','91ea87d2b06ea4f647e043148d951c52','s:32:\"91ea87d2b06ea4f647e043148d951c52\";'),(85,'extensionScannerNotAffected','dfaf4db240d3f4883278b2f285c5607e','s:32:\"dfaf4db240d3f4883278b2f285c5607e\";'),(86,'extensionScannerNotAffected','747e64fff64dd7432e84a08fe738067a','s:32:\"747e64fff64dd7432e84a08fe738067a\";'),(87,'extensionScannerNotAffected','8d99ace37d1d1b36fbab3a9d6304e918','s:32:\"8d99ace37d1d1b36fbab3a9d6304e918\";'),(88,'extensionScannerNotAffected','c526c9a91d824901b33106452ac6e8ed','s:32:\"c526c9a91d824901b33106452ac6e8ed\";'),(89,'extensionScannerNotAffected','033478cb9a9fad54909d24c48f2fbee8','s:32:\"033478cb9a9fad54909d24c48f2fbee8\";'),(90,'extensionScannerNotAffected','515ba3726a1dfded6ef6b83d1581ec83','s:32:\"515ba3726a1dfded6ef6b83d1581ec83\";'),(91,'extensionScannerNotAffected','a2da539b9ee347a8e042edfaf888d512','s:32:\"a2da539b9ee347a8e042edfaf888d512\";'),(92,'extensionScannerNotAffected','66917c534366520df96a319aa595aadf','s:32:\"66917c534366520df96a319aa595aadf\";'),(93,'extensionScannerNotAffected','84958529cec39361876616e3725c4f9b','s:32:\"84958529cec39361876616e3725c4f9b\";'),(94,'extensionScannerNotAffected','407bdf75e994d5e754cd62fe949c9e9b','s:32:\"407bdf75e994d5e754cd62fe949c9e9b\";'),(95,'extensionScannerNotAffected','e872218b822e4a3de6e5ae039fdd2f60','s:32:\"e872218b822e4a3de6e5ae039fdd2f60\";'),(96,'extensionScannerNotAffected','eace7e4de80cf7847b30899b5c647e01','s:32:\"eace7e4de80cf7847b30899b5c647e01\";'),(97,'extensionScannerNotAffected','3ea2e88429bdcbbd9cfe70d1705d0823','s:32:\"3ea2e88429bdcbbd9cfe70d1705d0823\";'),(98,'extensionScannerNotAffected','3f8faefc1fe5b54d8903efdfee5ac291','s:32:\"3f8faefc1fe5b54d8903efdfee5ac291\";'),(99,'extensionScannerNotAffected','1c5a05a66768940687520074a52c2d99','s:32:\"1c5a05a66768940687520074a52c2d99\";'),(100,'extensionScannerNotAffected','27cb6bf0a45fb36cd7ac73a2c0a572ef','s:32:\"27cb6bf0a45fb36cd7ac73a2c0a572ef\";'),(101,'extensionScannerNotAffected','c406c1b4bb1a5dfd9c08d4559bb8e8ee','s:32:\"c406c1b4bb1a5dfd9c08d4559bb8e8ee\";'),(102,'extensionScannerNotAffected','c5dd6f8903c59d422e06f980e5b36552','s:32:\"c5dd6f8903c59d422e06f980e5b36552\";'),(103,'extensionScannerNotAffected','b6058a0dc990a2c719ebaf093f5fc02f','s:32:\"b6058a0dc990a2c719ebaf093f5fc02f\";'),(104,'extensionScannerNotAffected','09d630c80626c1b76089fcc5c01a6ebb','s:32:\"09d630c80626c1b76089fcc5c01a6ebb\";'),(105,'extensionScannerNotAffected','aeba5d0706fd347bdc5272f996118fea','s:32:\"aeba5d0706fd347bdc5272f996118fea\";'),(106,'extensionScannerNotAffected','67442386f8c3115084d1214937e3b4a8','s:32:\"67442386f8c3115084d1214937e3b4a8\";'),(107,'extensionScannerNotAffected','256574d860279e77e16ec42976515826','s:32:\"256574d860279e77e16ec42976515826\";'),(108,'extensionScannerNotAffected','f7ffff32fb53be1a4f44895e1468fef1','s:32:\"f7ffff32fb53be1a4f44895e1468fef1\";'),(109,'extensionScannerNotAffected','10a393838d816503c8ce35d6d0d30ed1','s:32:\"10a393838d816503c8ce35d6d0d30ed1\";'),(110,'extensionScannerNotAffected','4255b4e13f24dca784d7ae424348d85d','s:32:\"4255b4e13f24dca784d7ae424348d85d\";'),(111,'extensionScannerNotAffected','26866dae2f3ba38dfd3487eec1012dce','s:32:\"26866dae2f3ba38dfd3487eec1012dce\";'),(112,'extensionScannerNotAffected','05f060662b83bd28d7aa26c2f64386ac','s:32:\"05f060662b83bd28d7aa26c2f64386ac\";'),(113,'extensionScannerNotAffected','790028fa75f9039383e9d0ebb280e53e','s:32:\"790028fa75f9039383e9d0ebb280e53e\";'),(114,'extensionScannerNotAffected','3af67f0226440b92916c9ac47ecc0f45','s:32:\"3af67f0226440b92916c9ac47ecc0f45\";'),(115,'extensionScannerNotAffected','6e37d32633631b068e06299c8acffee3','s:32:\"6e37d32633631b068e06299c8acffee3\";'),(116,'extensionScannerNotAffected','53f2e9f92611d61893d2d1b9d2131d15','s:32:\"53f2e9f92611d61893d2d1b9d2131d15\";'),(117,'extensionScannerNotAffected','dd4f137389ebdeacaae2a4dec7d17993','s:32:\"dd4f137389ebdeacaae2a4dec7d17993\";'),(118,'extensionScannerNotAffected','606a1ff02c65e772c51feaa1ea681234','s:32:\"606a1ff02c65e772c51feaa1ea681234\";'),(119,'extensionScannerNotAffected','27ab68dff32c68264a8f5052ce2bfa39','s:32:\"27ab68dff32c68264a8f5052ce2bfa39\";'),(120,'extensionScannerNotAffected','6539b2eef11f6335580d5c96f1ba17de','s:32:\"6539b2eef11f6335580d5c96f1ba17de\";'),(121,'extensionScannerNotAffected','1476ca2c06acc6b6cb8bac78b0633bf6','s:32:\"1476ca2c06acc6b6cb8bac78b0633bf6\";'),(122,'extensionScannerNotAffected','ad00c9bfc110d595723c667ef024d8e9','s:32:\"ad00c9bfc110d595723c667ef024d8e9\";'),(123,'extensionScannerNotAffected','0a6f2835e55a235c905a1705df41cee7','s:32:\"0a6f2835e55a235c905a1705df41cee7\";'),(124,'extensionScannerNotAffected','96c7a3f1fc0fe11bcdc7115a31b16f93','s:32:\"96c7a3f1fc0fe11bcdc7115a31b16f93\";'),(125,'extensionScannerNotAffected','b53560dfb6ad7c0d067ec228b9d158d6','s:32:\"b53560dfb6ad7c0d067ec228b9d158d6\";'),(126,'extensionScannerNotAffected','d209ef32995636ed8252c304366460f0','s:32:\"d209ef32995636ed8252c304366460f0\";'),(127,'extensionScannerNotAffected','388a9b5cf2dc024abce1ccda0c00666b','s:32:\"388a9b5cf2dc024abce1ccda0c00666b\";'),(128,'extensionScannerNotAffected','f8089f0f8d3e9e2f1dd88d3908eb6e75','s:32:\"f8089f0f8d3e9e2f1dd88d3908eb6e75\";'),(129,'extensionScannerNotAffected','181fece53aa7b13396193738a08ab7a5','s:32:\"181fece53aa7b13396193738a08ab7a5\";'),(130,'extensionScannerNotAffected','a767d6a06ae489ffffd6c26bc25fb38a','s:32:\"a767d6a06ae489ffffd6c26bc25fb38a\";'),(131,'extensionScannerNotAffected','f9d942cb02be7865d4818bda14172e5e','s:32:\"f9d942cb02be7865d4818bda14172e5e\";'),(132,'extensionScannerNotAffected','aea1390a84313285af1f87cb50d8213e','s:32:\"aea1390a84313285af1f87cb50d8213e\";'),(133,'extensionScannerNotAffected','7ca777fd910da99f301f8d6791dd8477','s:32:\"7ca777fd910da99f301f8d6791dd8477\";'),(134,'extensionScannerNotAffected','fd1adc61cb6d986a3e7a4dd65609fcba','s:32:\"fd1adc61cb6d986a3e7a4dd65609fcba\";'),(135,'extensionScannerNotAffected','c2cb531b3769bfe93d36c2d6a43a436a','s:32:\"c2cb531b3769bfe93d36c2d6a43a436a\";'),(136,'extensionScannerNotAffected','39927fae0bdc126decd803df9975697b','s:32:\"39927fae0bdc126decd803df9975697b\";'),(137,'extensionScannerNotAffected','ff0771e45e03394ed17c8783e5e083d6','s:32:\"ff0771e45e03394ed17c8783e5e083d6\";'),(138,'extensionScannerNotAffected','83d762e1a46c1363d7f5fabf77da2db4','s:32:\"83d762e1a46c1363d7f5fabf77da2db4\";'),(139,'extensionScannerNotAffected','40e5025c405909578400ab83e7761b74','s:32:\"40e5025c405909578400ab83e7761b74\";'),(140,'extensionScannerNotAffected','bf64fd0e3399cba335ba6da86212a590','s:32:\"bf64fd0e3399cba335ba6da86212a590\";'),(141,'extensionScannerNotAffected','0401d8602099bcafdbdffb88a96a7a3c','s:32:\"0401d8602099bcafdbdffb88a96a7a3c\";'),(142,'extensionScannerNotAffected','8181fb86d49358beab7d215f40f9b9d0','s:32:\"8181fb86d49358beab7d215f40f9b9d0\";'),(143,'extensionScannerNotAffected','cbd21e7f03086cafbdc9e29aca0d7de9','s:32:\"cbd21e7f03086cafbdc9e29aca0d7de9\";'),(144,'extensionScannerNotAffected','d70cecc33fb1c59414665bc6865b8684','s:32:\"d70cecc33fb1c59414665bc6865b8684\";'),(145,'extensionScannerNotAffected','9be17234d688f35a777c9476d9f3c71b','s:32:\"9be17234d688f35a777c9476d9f3c71b\";'),(146,'extensionScannerNotAffected','95a788a9e8bdf766bb7b24c46f66589b','s:32:\"95a788a9e8bdf766bb7b24c46f66589b\";'),(147,'extensionScannerNotAffected','e76d8583899c660d9b8f059f1e70b398','s:32:\"e76d8583899c660d9b8f059f1e70b398\";'),(148,'extensionScannerNotAffected','97d8364d14683e5c99cf3d61d245757b','s:32:\"97d8364d14683e5c99cf3d61d245757b\";'),(149,'extensionScannerNotAffected','2de6f2010831b2dbebe1c566382968d9','s:32:\"2de6f2010831b2dbebe1c566382968d9\";'),(150,'extensionScannerNotAffected','2d7e49260d1feaedd48d810213ffb538','s:32:\"2d7e49260d1feaedd48d810213ffb538\";'),(151,'extensionScannerNotAffected','da4784251913511a4be69adb66dc6248','s:32:\"da4784251913511a4be69adb66dc6248\";'),(152,'extensionScannerNotAffected','e145f6079b7f9d0ec06e99a2b076c0a8','s:32:\"e145f6079b7f9d0ec06e99a2b076c0a8\";'),(153,'extensionScannerNotAffected','72dcabf4098f87f91ffbd0680358d214','s:32:\"72dcabf4098f87f91ffbd0680358d214\";'),(154,'extensionScannerNotAffected','bd3841546ff3c306e782b477cda497f0','s:32:\"bd3841546ff3c306e782b477cda497f0\";'),(155,'extensionScannerNotAffected','e64f98e82453cb5e4ddcea3fbb6ea1f8','s:32:\"e64f98e82453cb5e4ddcea3fbb6ea1f8\";'),(156,'extensionScannerNotAffected','144cc46f4036b271da85fa68c7e31ec6','s:32:\"144cc46f4036b271da85fa68c7e31ec6\";'),(157,'extensionScannerNotAffected','b86bf8233a9c62ebca0cacff2f89d5e3','s:32:\"b86bf8233a9c62ebca0cacff2f89d5e3\";'),(158,'extensionScannerNotAffected','986062b4896ff2cd9eece3eef4ded45b','s:32:\"986062b4896ff2cd9eece3eef4ded45b\";'),(159,'extensionScannerNotAffected','a59be9db96adc138df8439284a35f1b1','s:32:\"a59be9db96adc138df8439284a35f1b1\";'),(160,'extensionScannerNotAffected','6b28fe44430f57ad36119ad15d1aed79','s:32:\"6b28fe44430f57ad36119ad15d1aed79\";'),(161,'extensionScannerNotAffected','9db18807754661411e84d91946f6c47b','s:32:\"9db18807754661411e84d91946f6c47b\";'),(162,'extensionScannerNotAffected','dd717b8dee96d5b999879b4de8d35ec5','s:32:\"dd717b8dee96d5b999879b4de8d35ec5\";'),(163,'extensionScannerNotAffected','543adcda9a07c1be6be6863f4fc3de89','s:32:\"543adcda9a07c1be6be6863f4fc3de89\";'),(164,'extensionScannerNotAffected','08f23e8308e19cd3b730c99b5724f918','s:32:\"08f23e8308e19cd3b730c99b5724f918\";'),(165,'extensionScannerNotAffected','858a87554a870c3f8cba49b81e5fc3a3','s:32:\"858a87554a870c3f8cba49b81e5fc3a3\";'),(166,'extensionScannerNotAffected','66ed9c10913b6a895e8f53f17d242d2a','s:32:\"66ed9c10913b6a895e8f53f17d242d2a\";'),(167,'extensionScannerNotAffected','a2541c8ae57e07e86192ed8cc132718a','s:32:\"a2541c8ae57e07e86192ed8cc132718a\";'),(168,'extensionScannerNotAffected','aa6461369e97e50946dea8895a936e6b','s:32:\"aa6461369e97e50946dea8895a936e6b\";'),(169,'extensionScannerNotAffected','d2e37295e705a04ec5552b73d9fd1144','s:32:\"d2e37295e705a04ec5552b73d9fd1144\";'),(170,'extensionScannerNotAffected','6915d0c4aa697f1bf4c04d07cf7127ea','s:32:\"6915d0c4aa697f1bf4c04d07cf7127ea\";'),(171,'extensionScannerNotAffected','7c974bbbddbbf9dbe53828a4384f66b9','s:32:\"7c974bbbddbbf9dbe53828a4384f66b9\";'),(172,'extensionScannerNotAffected','a5c2cdb2cd2fc53da686d0d78655d3e7','s:32:\"a5c2cdb2cd2fc53da686d0d78655d3e7\";'),(173,'extensionScannerNotAffected','eeda1bbe08c87302ed0941978da20996','s:32:\"eeda1bbe08c87302ed0941978da20996\";'),(174,'extensionScannerNotAffected','b84e1757b180d280f905f6472e439299','s:32:\"b84e1757b180d280f905f6472e439299\";'),(175,'extensionScannerNotAffected','86d34aa088fd12f96ba93d7e9510060a','s:32:\"86d34aa088fd12f96ba93d7e9510060a\";'),(176,'extensionScannerNotAffected','9a88d83c62379079c860e7c3b474af45','s:32:\"9a88d83c62379079c860e7c3b474af45\";'),(177,'extensionScannerNotAffected','fba3f5a542bd7b9591b55574c2ef9c6a','s:32:\"fba3f5a542bd7b9591b55574c2ef9c6a\";'),(178,'extensionScannerNotAffected','e29d1140016b6e1b77c568dc6594746d','s:32:\"e29d1140016b6e1b77c568dc6594746d\";'),(179,'extensionScannerNotAffected','ff5e28aa4ac849a3b1de2225626cadbd','s:32:\"ff5e28aa4ac849a3b1de2225626cadbd\";'),(180,'extensionScannerNotAffected','eb9460c6d1a003d9527ce9cf48729e14','s:32:\"eb9460c6d1a003d9527ce9cf48729e14\";'),(181,'extensionScannerNotAffected','306a11d301aef636a577b043a9bc10fa','s:32:\"306a11d301aef636a577b043a9bc10fa\";'),(182,'extensionScannerNotAffected','5eba200f09bc23b1b2a0a12bd87926bd','s:32:\"5eba200f09bc23b1b2a0a12bd87926bd\";'),(183,'extensionScannerNotAffected','f8debb461bd74853fed5bb2961457fa6','s:32:\"f8debb461bd74853fed5bb2961457fa6\";'),(184,'extensionScannerNotAffected','bca64e0231d1758d70893cc3e2457290','s:32:\"bca64e0231d1758d70893cc3e2457290\";'),(185,'extensionScannerNotAffected','1ec7fc989b025a9c8356317485bde146','s:32:\"1ec7fc989b025a9c8356317485bde146\";'),(186,'extensionScannerNotAffected','44dacc3b01548666f4f58735c461e0a3','s:32:\"44dacc3b01548666f4f58735c461e0a3\";'),(187,'extensionScannerNotAffected','1daea1177e884f3ea576383e5dac4774','s:32:\"1daea1177e884f3ea576383e5dac4774\";'),(188,'extensionScannerNotAffected','77f867e32a06e84b4c1cd0edfe595ce7','s:32:\"77f867e32a06e84b4c1cd0edfe595ce7\";'),(189,'extensionScannerNotAffected','ff5567f61828e66dcdd45a7e864014db','s:32:\"ff5567f61828e66dcdd45a7e864014db\";'),(190,'extensionScannerNotAffected','0334dc151fef8bb6bcaac48afc7044c6','s:32:\"0334dc151fef8bb6bcaac48afc7044c6\";'),(191,'extensionScannerNotAffected','2bf671b90e2eb5e6c6b5f9c021354e14','s:32:\"2bf671b90e2eb5e6c6b5f9c021354e14\";'),(192,'extensionScannerNotAffected','36da4a1ba33eb2b96ed2c0a9e9a51ed7','s:32:\"36da4a1ba33eb2b96ed2c0a9e9a51ed7\";'),(193,'extensionScannerNotAffected','cddb0fb7e5108ed5d6bb3c3952e19af4','s:32:\"cddb0fb7e5108ed5d6bb3c3952e19af4\";'),(194,'extensionScannerNotAffected','590492426cf773b2afbc30e44c7cb9a8','s:32:\"590492426cf773b2afbc30e44c7cb9a8\";'),(195,'extensionScannerNotAffected','c9198802f9c124c1cb1a1cc0f9b21331','s:32:\"c9198802f9c124c1cb1a1cc0f9b21331\";'),(196,'extensionScannerNotAffected','dd5c4bc99a64380b59f54e297e6b0251','s:32:\"dd5c4bc99a64380b59f54e297e6b0251\";'),(197,'extensionScannerNotAffected','d3a2b981266c7afc2a62a0706ccd7cc2','s:32:\"d3a2b981266c7afc2a62a0706ccd7cc2\";'),(198,'extensionScannerNotAffected','117f225b4a34c1f605917cb1164b4711','s:32:\"117f225b4a34c1f605917cb1164b4711\";'),(199,'extensionScannerNotAffected','9843224e8057c4b0a75986f2b1b0d7de','s:32:\"9843224e8057c4b0a75986f2b1b0d7de\";'),(200,'extensionScannerNotAffected','679b3f7a5f265e78afa52568a7af81ea','s:32:\"679b3f7a5f265e78afa52568a7af81ea\";'),(201,'extensionScannerNotAffected','f746fe14df28161312ff6481b765fe6b','s:32:\"f746fe14df28161312ff6481b765fe6b\";'),(202,'extensionScannerNotAffected','72e9f7b477e14d237e47b6e91ebc552a','s:32:\"72e9f7b477e14d237e47b6e91ebc552a\";'),(203,'extensionScannerNotAffected','c59521640be26ce42b563af41dc55133','s:32:\"c59521640be26ce42b563af41dc55133\";'),(204,'extensionScannerNotAffected','a60dfede9467734cd91d13a581ff993d','s:32:\"a60dfede9467734cd91d13a581ff993d\";'),(205,'extensionScannerNotAffected','d94828488045a36bc40849c6f8b195a0','s:32:\"d94828488045a36bc40849c6f8b195a0\";'),(206,'extensionScannerNotAffected','10470ebd96c5d1be6ed052c35e88a572','s:32:\"10470ebd96c5d1be6ed052c35e88a572\";'),(207,'extensionScannerNotAffected','c7f481de96f5f6eb495f42a328b653f7','s:32:\"c7f481de96f5f6eb495f42a328b653f7\";'),(208,'extensionScannerNotAffected','713ce9cb95953fd15278aad8008700d0','s:32:\"713ce9cb95953fd15278aad8008700d0\";'),(209,'extensionScannerNotAffected','ae91c66cc4e4c53b3ebd277f63618ff3','s:32:\"ae91c66cc4e4c53b3ebd277f63618ff3\";'),(210,'extensionScannerNotAffected','3800d667a81ea56b0691a0c42e4aa735','s:32:\"3800d667a81ea56b0691a0c42e4aa735\";'),(211,'extensionScannerNotAffected','74d00dbf61e6cf5a5f7db8c5c49e8730','s:32:\"74d00dbf61e6cf5a5f7db8c5c49e8730\";'),(212,'extensionScannerNotAffected','6afcbbc7b716e87880a5467cf09fbd64','s:32:\"6afcbbc7b716e87880a5467cf09fbd64\";'),(213,'extensionScannerNotAffected','77e5ec218f56f98dfa21beabdfb470aa','s:32:\"77e5ec218f56f98dfa21beabdfb470aa\";'),(214,'extensionScannerNotAffected','bfea06cd79d77e5837f13f835af83116','s:32:\"bfea06cd79d77e5837f13f835af83116\";'),(215,'extensionScannerNotAffected','aaa9710768df7d8203beffd77d3b3556','s:32:\"aaa9710768df7d8203beffd77d3b3556\";'),(216,'extensionScannerNotAffected','0b69b592c0282cff9221984287598585','s:32:\"0b69b592c0282cff9221984287598585\";'),(217,'extensionScannerNotAffected','b0a2e8285534a393b573a86b00d1a17a','s:32:\"b0a2e8285534a393b573a86b00d1a17a\";'),(218,'extensionScannerNotAffected','e5e622341da70adf63f6d8b8c8e49152','s:32:\"e5e622341da70adf63f6d8b8c8e49152\";'),(219,'extensionScannerNotAffected','26b5e7549263d71700669da39f1c3851','s:32:\"26b5e7549263d71700669da39f1c3851\";'),(220,'extensionScannerNotAffected','3626e71eeb0b2fe58bd17a3d40d70146','s:32:\"3626e71eeb0b2fe58bd17a3d40d70146\";'),(221,'extensionScannerNotAffected','ae00f83373c84a92cce51bdbb8a3a2bf','s:32:\"ae00f83373c84a92cce51bdbb8a3a2bf\";'),(222,'extensionScannerNotAffected','64b0cd3ff63903a920568bb29c508000','s:32:\"64b0cd3ff63903a920568bb29c508000\";'),(223,'extensionScannerNotAffected','06a51a2aa4be45eec011cd81a4332372','s:32:\"06a51a2aa4be45eec011cd81a4332372\";'),(224,'extensionScannerNotAffected','182c32d6906768ad4ef2a16f74f70023','s:32:\"182c32d6906768ad4ef2a16f74f70023\";'),(225,'extensionScannerNotAffected','a3c5b3e219a3984e904f55d77a8422c8','s:32:\"a3c5b3e219a3984e904f55d77a8422c8\";'),(226,'extensionScannerNotAffected','257726deb2f304a6427f767263758867','s:32:\"257726deb2f304a6427f767263758867\";'),(227,'extensionScannerNotAffected','ca2e3cf42bdcb5d4cdb0aef446ad71f8','s:32:\"ca2e3cf42bdcb5d4cdb0aef446ad71f8\";'),(228,'extensionScannerNotAffected','bb3e2af26470d562ae8d1ce31ab5a93c','s:32:\"bb3e2af26470d562ae8d1ce31ab5a93c\";'),(229,'extensionScannerNotAffected','97459c0367812d1fb78d00f024ff20aa','s:32:\"97459c0367812d1fb78d00f024ff20aa\";'),(230,'extensionScannerNotAffected','846385e26abb209c7484fae2f0e714a4','s:32:\"846385e26abb209c7484fae2f0e714a4\";'),(231,'extensionScannerNotAffected','ec85f46288965aa648ce9a1e37f2b58a','s:32:\"ec85f46288965aa648ce9a1e37f2b58a\";'),(232,'extensionScannerNotAffected','f7cc244676b74f17ca6bdb46707637f4','s:32:\"f7cc244676b74f17ca6bdb46707637f4\";'),(233,'extensionScannerNotAffected','1d36af555ac8264786c3e72a2c251e38','s:32:\"1d36af555ac8264786c3e72a2c251e38\";'),(234,'extensionScannerNotAffected','58464adfa2c4d03a24ae35dc3f25801c','s:32:\"58464adfa2c4d03a24ae35dc3f25801c\";'),(235,'extensionScannerNotAffected','eb370d58d94c52c8d3a4ee663f37568a','s:32:\"eb370d58d94c52c8d3a4ee663f37568a\";'),(236,'extensionScannerNotAffected','e39682b901051ec48ee60fa6cfe12c48','s:32:\"e39682b901051ec48ee60fa6cfe12c48\";'),(237,'extensionScannerNotAffected','2727a4091391f76e063b467ebc7f6d86','s:32:\"2727a4091391f76e063b467ebc7f6d86\";'),(238,'extensionScannerNotAffected','9b7bb233dfb418012c40d31c3fb9752b','s:32:\"9b7bb233dfb418012c40d31c3fb9752b\";'),(239,'extensionScannerNotAffected','84f262f2ce5a5cb8a542f63ad2ce3fcb','s:32:\"84f262f2ce5a5cb8a542f63ad2ce3fcb\";'),(240,'extensionScannerNotAffected','80677c372836769941f6fe4cc8cf554c','s:32:\"80677c372836769941f6fe4cc8cf554c\";'),(241,'extensionScannerNotAffected','e6e5a12d005bcf5f4fcaf9f35f9c2d08','s:32:\"e6e5a12d005bcf5f4fcaf9f35f9c2d08\";'),(242,'extensionScannerNotAffected','c73513ce6cc7b05f5f974ec5ac7db2b8','s:32:\"c73513ce6cc7b05f5f974ec5ac7db2b8\";'),(243,'extensionScannerNotAffected','68cfb0f136fc4bab6fc4f32f6f9e4e19','s:32:\"68cfb0f136fc4bab6fc4f32f6f9e4e19\";'),(244,'extensionScannerNotAffected','e8a0a81627cc1e29b13fb1b399b7fc5a','s:32:\"e8a0a81627cc1e29b13fb1b399b7fc5a\";'),(245,'extensionScannerNotAffected','41837364762215c27702443fc8677a0f','s:32:\"41837364762215c27702443fc8677a0f\";'),(246,'extensionScannerNotAffected','a9bcc41cecdc8a3d418c5157f3d8c1c8','s:32:\"a9bcc41cecdc8a3d418c5157f3d8c1c8\";'),(247,'extensionScannerNotAffected','b980ee9d6fdb49656575c04ff504e230','s:32:\"b980ee9d6fdb49656575c04ff504e230\";'),(248,'extensionScannerNotAffected','c370cc5d12fa92fcd247ab3553de379c','s:32:\"c370cc5d12fa92fcd247ab3553de379c\";'),(249,'extensionScannerNotAffected','0897daaaafc60afd22d5f1f9456f987a','s:32:\"0897daaaafc60afd22d5f1f9456f987a\";'),(250,'extensionScannerNotAffected','da9b2e614af61de52e226a2f179a8576','s:32:\"da9b2e614af61de52e226a2f179a8576\";'),(251,'extensionScannerNotAffected','cf0b990851344cc9018db394c8f1db6f','s:32:\"cf0b990851344cc9018db394c8f1db6f\";'),(252,'extensionScannerNotAffected','27f6ecf31f646963b634d18be5cf07b4','s:32:\"27f6ecf31f646963b634d18be5cf07b4\";'),(253,'extensionScannerNotAffected','b1a4df2deb0dd99bdcfc8b0e4f338c8f','s:32:\"b1a4df2deb0dd99bdcfc8b0e4f338c8f\";'),(254,'extensionScannerNotAffected','360d8fa2e0c2aab7d73aec7ca408d9f5','s:32:\"360d8fa2e0c2aab7d73aec7ca408d9f5\";'),(255,'extensionScannerNotAffected','483cee376fc652bfc57bc957d99b686e','s:32:\"483cee376fc652bfc57bc957d99b686e\";'),(256,'extensionScannerNotAffected','303e553850a33ed2e16b6975483cf374','s:32:\"303e553850a33ed2e16b6975483cf374\";'),(257,'extensionScannerNotAffected','d4bf975e0aa5189efd53651569e2a085','s:32:\"d4bf975e0aa5189efd53651569e2a085\";'),(258,'extensionScannerNotAffected','e080865a9399de7a3500299202e70f43','s:32:\"e080865a9399de7a3500299202e70f43\";'),(259,'extensionScannerNotAffected','3a27b5cac2b5d1cd9ce5f532bad2ee77','s:32:\"3a27b5cac2b5d1cd9ce5f532bad2ee77\";'),(260,'extensionScannerNotAffected','b04ca896a608920cbe9aba9abe38abb7','s:32:\"b04ca896a608920cbe9aba9abe38abb7\";'),(261,'extensionScannerNotAffected','d3652ebf8b407accdb9566c7513a762b','s:32:\"d3652ebf8b407accdb9566c7513a762b\";'),(262,'extensionScannerNotAffected','27142fdfd985e8081350ba177844c02a','s:32:\"27142fdfd985e8081350ba177844c02a\";'),(263,'extensionScannerNotAffected','1fd0a972753bd3d0e5d7809bf941e043','s:32:\"1fd0a972753bd3d0e5d7809bf941e043\";'),(264,'extensionScannerNotAffected','93cc296d5cfe16782b1d332508e88865','s:32:\"93cc296d5cfe16782b1d332508e88865\";'),(265,'extensionScannerNotAffected','800643eebd3e969ce41750a59463d0cc','s:32:\"800643eebd3e969ce41750a59463d0cc\";'),(266,'extensionScannerNotAffected','1b0b9abf819f119d5ec20a47cac09ddb','s:32:\"1b0b9abf819f119d5ec20a47cac09ddb\";'),(267,'extensionScannerNotAffected','8a439767769a896f3dbd24b73e210469','s:32:\"8a439767769a896f3dbd24b73e210469\";'),(268,'extensionScannerNotAffected','980ccbd48f24e9c0b84d992e87705bfa','s:32:\"980ccbd48f24e9c0b84d992e87705bfa\";'),(269,'extensionScannerNotAffected','9fc4eeac0663a438100f2fd124418d26','s:32:\"9fc4eeac0663a438100f2fd124418d26\";'),(270,'extensionScannerNotAffected','0f9ed53e3e38c419d6a2b523a5bdfcd7','s:32:\"0f9ed53e3e38c419d6a2b523a5bdfcd7\";'),(271,'extensionScannerNotAffected','434a6ccdbb5c697dc1152f97fcc80099','s:32:\"434a6ccdbb5c697dc1152f97fcc80099\";'),(272,'extensionScannerNotAffected','cb99528e0576a8f79c3e406dbdbde15d','s:32:\"cb99528e0576a8f79c3e406dbdbde15d\";'),(273,'extensionScannerNotAffected','b57d5713a983b38b4d1a99d72148dcb5','s:32:\"b57d5713a983b38b4d1a99d72148dcb5\";'),(274,'extensionScannerNotAffected','d345ff8531f4c50d83d31f824fdeb7df','s:32:\"d345ff8531f4c50d83d31f824fdeb7df\";'),(275,'extensionScannerNotAffected','1c67b19730aa0e4a88aca6085e2fefe6','s:32:\"1c67b19730aa0e4a88aca6085e2fefe6\";'),(276,'extensionScannerNotAffected','91fa84783b7998be84f2ef9a135b3930','s:32:\"91fa84783b7998be84f2ef9a135b3930\";'),(277,'extensionScannerNotAffected','51e7b5cfb13385843bcf4db3f3d80824','s:32:\"51e7b5cfb13385843bcf4db3f3d80824\";'),(278,'extensionScannerNotAffected','5d6acfcf63df912878a53dfb4f88f66c','s:32:\"5d6acfcf63df912878a53dfb4f88f66c\";'),(279,'extensionScannerNotAffected','00d7d3a7bb4187e3a130a8207ce29332','s:32:\"00d7d3a7bb4187e3a130a8207ce29332\";'),(280,'extensionScannerNotAffected','7053139b178834fc4832de6ef3bb35e4','s:32:\"7053139b178834fc4832de6ef3bb35e4\";'),(281,'extensionScannerNotAffected','e1d1b139beff6b083fab80e2e6604a86','s:32:\"e1d1b139beff6b083fab80e2e6604a86\";'),(282,'extensionScannerNotAffected','244de3e3bf16bd6ecc7abdd9f5134baa','s:32:\"244de3e3bf16bd6ecc7abdd9f5134baa\";'),(283,'extensionScannerNotAffected','6325e8f1bf6ee47776eec4aa896ae498','s:32:\"6325e8f1bf6ee47776eec4aa896ae498\";'),(284,'extensionScannerNotAffected','4446e163f2527d13cef9b690a59d41a0','s:32:\"4446e163f2527d13cef9b690a59d41a0\";'),(285,'extensionScannerNotAffected','7f24f3339010d86836d49812532da677','s:32:\"7f24f3339010d86836d49812532da677\";'),(286,'extensionScannerNotAffected','3eae74ce8bf1dda88a3956580f0ee095','s:32:\"3eae74ce8bf1dda88a3956580f0ee095\";'),(287,'extensionScannerNotAffected','3b082c2f15d19c95a2274f2f9cf67936','s:32:\"3b082c2f15d19c95a2274f2f9cf67936\";'),(288,'extensionScannerNotAffected','e644b224460392561dd815bddc13e280','s:32:\"e644b224460392561dd815bddc13e280\";'),(289,'extensionScannerNotAffected','8c0a471eb1e62a9df7e2a0ab710144ab','s:32:\"8c0a471eb1e62a9df7e2a0ab710144ab\";'),(290,'extensionScannerNotAffected','cc57748e8798b0147782cf3a9e868015','s:32:\"cc57748e8798b0147782cf3a9e868015\";'),(291,'extensionScannerNotAffected','aab92a3622f423c5bf6364e4b3720433','s:32:\"aab92a3622f423c5bf6364e4b3720433\";'),(292,'extensionScannerNotAffected','0f72ecbde01e66ab8de6cda9f6ff6031','s:32:\"0f72ecbde01e66ab8de6cda9f6ff6031\";'),(293,'extensionScannerNotAffected','dc4027985e6fc1e36977379ef3f9dcf3','s:32:\"dc4027985e6fc1e36977379ef3f9dcf3\";'),(294,'extensionScannerNotAffected','7591886b875efd00b894eb60256ac0e9','s:32:\"7591886b875efd00b894eb60256ac0e9\";'),(295,'extensionScannerNotAffected','c310acb623b8c522450745fddb89a18b','s:32:\"c310acb623b8c522450745fddb89a18b\";'),(296,'extensionScannerNotAffected','0bee48ca87fa9b61a2a7047f53e638d9','s:32:\"0bee48ca87fa9b61a2a7047f53e638d9\";'),(297,'extensionScannerNotAffected','4579e1fbe7c94b5510b7796b672c2d80','s:32:\"4579e1fbe7c94b5510b7796b672c2d80\";'),(298,'extensionScannerNotAffected','f4592d107f1f59a157f6c116814480fe','s:32:\"f4592d107f1f59a157f6c116814480fe\";'),(299,'extensionScannerNotAffected','c0a7d44f061cb4c2deca56a6ce548669','s:32:\"c0a7d44f061cb4c2deca56a6ce548669\";'),(300,'extensionScannerNotAffected','31eabeee23cfbd2e810ec7163f298fe2','s:32:\"31eabeee23cfbd2e810ec7163f298fe2\";'),(301,'extensionScannerNotAffected','3a288da8230d042aa0fefe3c9d010fc9','s:32:\"3a288da8230d042aa0fefe3c9d010fc9\";'),(302,'extensionScannerNotAffected','7f95a3579a446aecec1217a456433f0f','s:32:\"7f95a3579a446aecec1217a456433f0f\";'),(303,'extensionScannerNotAffected','491537cef95923e1e1df8619a5bd9924','s:32:\"491537cef95923e1e1df8619a5bd9924\";'),(304,'extensionScannerNotAffected','bd1929903ae77d7a33efa0feb711cfb6','s:32:\"bd1929903ae77d7a33efa0feb711cfb6\";'),(305,'extensionScannerNotAffected','13d6f701b41fb36f0e0083a22bb85002','s:32:\"13d6f701b41fb36f0e0083a22bb85002\";'),(306,'extensionScannerNotAffected','71ebec4960c1b84c199c5a33277b084d','s:32:\"71ebec4960c1b84c199c5a33277b084d\";'),(307,'extensionScannerNotAffected','397c9a4bcca973b3b451be07aae2d85d','s:32:\"397c9a4bcca973b3b451be07aae2d85d\";'),(308,'extensionScannerNotAffected','b4310ab842bd0c4c910ee09f20037987','s:32:\"b4310ab842bd0c4c910ee09f20037987\";'),(309,'extensionScannerNotAffected','0d9fbf4a461435c9eeedb3cc130dace5','s:32:\"0d9fbf4a461435c9eeedb3cc130dace5\";'),(310,'extensionScannerNotAffected','b75fd56db65b57134ee3a392333164e6','s:32:\"b75fd56db65b57134ee3a392333164e6\";'),(311,'extensionScannerNotAffected','5dfdf6cf1184deae70be20b67437408a','s:32:\"5dfdf6cf1184deae70be20b67437408a\";'),(312,'extensionScannerNotAffected','e41e345fdcabb5d16cf9cbcaf5f6770c','s:32:\"e41e345fdcabb5d16cf9cbcaf5f6770c\";'),(313,'extensionScannerNotAffected','0de71175cd69f6922e46015ac1646084','s:32:\"0de71175cd69f6922e46015ac1646084\";'),(314,'extensionScannerNotAffected','a8b76974d80653cd9d3e19cf8fbbc54d','s:32:\"a8b76974d80653cd9d3e19cf8fbbc54d\";'),(315,'extensionScannerNotAffected','2c3b83bfc1f271ba9a860c00e99d9b6f','s:32:\"2c3b83bfc1f271ba9a860c00e99d9b6f\";'),(316,'extensionScannerNotAffected','37263679ea002b67d6c926e96199e0cb','s:32:\"37263679ea002b67d6c926e96199e0cb\";'),(317,'extensionScannerNotAffected','23bb7c19b079c8fe437d78e2e66364e8','s:32:\"23bb7c19b079c8fe437d78e2e66364e8\";'),(318,'extensionScannerNotAffected','150c7c72278375a02383fdf867b9a14e','s:32:\"150c7c72278375a02383fdf867b9a14e\";'),(319,'extensionScannerNotAffected','5e3556a907f7c423702aafe5bd21283b','s:32:\"5e3556a907f7c423702aafe5bd21283b\";'),(320,'extensionScannerNotAffected','e5fefe9c0e303befc6e3587e6015bd5f','s:32:\"e5fefe9c0e303befc6e3587e6015bd5f\";'),(321,'extensionScannerNotAffected','b6955ff14a49b23c4b55a16ceda2f53f','s:32:\"b6955ff14a49b23c4b55a16ceda2f53f\";'),(322,'extensionScannerNotAffected','e164383a65972e81d1d4ceed1b787c5c','s:32:\"e164383a65972e81d1d4ceed1b787c5c\";'),(323,'extensionScannerNotAffected','c7bfdc48f32344ba1d1ae63f65de7271','s:32:\"c7bfdc48f32344ba1d1ae63f65de7271\";'),(324,'extensionScannerNotAffected','e307efdd6ecb8c3fd0bea412d0a0db1c','s:32:\"e307efdd6ecb8c3fd0bea412d0a0db1c\";'),(325,'extensionScannerNotAffected','54278669581b9b9898c259be1c1d0e91','s:32:\"54278669581b9b9898c259be1c1d0e91\";'),(326,'extensionScannerNotAffected','16aab8758e3be9a5eae25ab0ffc9ac50','s:32:\"16aab8758e3be9a5eae25ab0ffc9ac50\";'),(327,'extensionScannerNotAffected','0aaa78219033da9093ecded3a045d686','s:32:\"0aaa78219033da9093ecded3a045d686\";'),(328,'extensionScannerNotAffected','d1e1110b267f6c82aac369fe44d1026f','s:32:\"d1e1110b267f6c82aac369fe44d1026f\";'),(329,'extensionScannerNotAffected','63052e9b8451752e184e2d932bc7dd62','s:32:\"63052e9b8451752e184e2d932bc7dd62\";'),(330,'extensionScannerNotAffected','0d60eaef00c478199d475ca60d7340c7','s:32:\"0d60eaef00c478199d475ca60d7340c7\";'),(331,'extensionScannerNotAffected','09e682d75e634e3ceb0f7f98527b1505','s:32:\"09e682d75e634e3ceb0f7f98527b1505\";'),(332,'extensionScannerNotAffected','bf0cb1ebffe995bc39723cb13738ea6a','s:32:\"bf0cb1ebffe995bc39723cb13738ea6a\";'),(333,'extensionScannerNotAffected','19376586fba8888a27efd8af6a4583cf','s:32:\"19376586fba8888a27efd8af6a4583cf\";'),(334,'extensionScannerNotAffected','4fb09912c38414756af594202cb2f690','s:32:\"4fb09912c38414756af594202cb2f690\";'),(335,'extensionScannerNotAffected','e1a09d1fd8685d6062cf3e7799e126f9','s:32:\"e1a09d1fd8685d6062cf3e7799e126f9\";'),(336,'extensionScannerNotAffected','ded4b923244fe03a0ba7a483e8000813','s:32:\"ded4b923244fe03a0ba7a483e8000813\";'),(337,'extensionScannerNotAffected','6366dd14c672aa71ebf03205723f68a2','s:32:\"6366dd14c672aa71ebf03205723f68a2\";'),(338,'extensionScannerNotAffected','02a805a392483b732732f93901406ceb','s:32:\"02a805a392483b732732f93901406ceb\";'),(339,'extensionScannerNotAffected','c49774a98e502c63371b9dbae60df966','s:32:\"c49774a98e502c63371b9dbae60df966\";'),(340,'extensionScannerNotAffected','806af308144dba75bb0c127bf1d8781e','s:32:\"806af308144dba75bb0c127bf1d8781e\";'),(341,'extensionScannerNotAffected','172d7c38641424198c9559588d4e01a1','s:32:\"172d7c38641424198c9559588d4e01a1\";'),(342,'extensionScannerNotAffected','0df1ef1e7bebc20c28a3a0a400e8597e','s:32:\"0df1ef1e7bebc20c28a3a0a400e8597e\";'),(343,'extensionScannerNotAffected','779d9fa8a98a67241e707aa362daa7b6','s:32:\"779d9fa8a98a67241e707aa362daa7b6\";'),(344,'extensionScannerNotAffected','99306b51a83544a01ca97be54e915285','s:32:\"99306b51a83544a01ca97be54e915285\";'),(345,'extensionScannerNotAffected','88e824ed66b9f6714d5eff2569834b80','s:32:\"88e824ed66b9f6714d5eff2569834b80\";'),(346,'extensionScannerNotAffected','0672ed523b013d931262c39097f74a7d','s:32:\"0672ed523b013d931262c39097f74a7d\";'),(347,'extensionScannerNotAffected','1af882375dd310f3d027031142ea2dce','s:32:\"1af882375dd310f3d027031142ea2dce\";'),(348,'extensionScannerNotAffected','ee9efd7e557b189b3ee30d6e8481ef77','s:32:\"ee9efd7e557b189b3ee30d6e8481ef77\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT 0,
  `clear` smallint(5) unsigned NOT NULL DEFAULT 0,
  `include_static_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `constants` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedOn` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,1,1610565519,1590184366,1,0,0,0,0,0,'',0,0,0,0,0,'Main TypoScript Rendering',1,1,'EXT:news/Configuration/TypoScript,EXT:t3api/Configuration/TypoScript,EXT:t3apinews/Configuration/TypoScript','<INCLUDE_TYPOSCRIPT: source=\"DIR:typo3conf/ext/local/Configuration/TypoScript/Constants/\" extensions=\"typoscript\">','<INCLUDE_TYPOSCRIPT: source=\"DIR:typo3conf/ext/local/Configuration/TypoScript/Setup/\" extensions=\"typoscript\">',NULL,0,0);
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l18n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `CType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assets` int(10) unsigned NOT NULL DEFAULT 0,
  `image` int(10) unsigned NOT NULL DEFAULT 0,
  `imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `frame_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT 0,
  `space_before_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `colPos` int(10) unsigned NOT NULL DEFAULT 0,
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `header_layout` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
  `file_collections` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
  `filelink_sorting` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `recursive` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageheight` int(10) unsigned NOT NULL DEFAULT 0,
  `pi_flexform` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessibility_title` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT 0,
  `accessibility_bypass_text` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `selected_categories` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
  `categories` int(10) unsigned NOT NULL DEFAULT 0,
  `tx_news_related_news` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`),
  KEY `index_newscontent` (`tx_news_related_news`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
INSERT INTO `tt_content` VALUES (1,'',1,1609692487,1609692482,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'a:23:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:8:\"bodytext\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,'text','','','<p>At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias&nbsp;<strong>exceptur</strong>i&nbsp;<strong>sint, obcaecat</strong>i&nbsp;<strong>cupiditat</strong>e&nbsp;<strong>non pro</strong>v<strong>ident</strong>, similique&nbsp;<strong>sunt in culpa</strong>,&nbsp;<strong>qui officia deserunt mollit</strong>ia&nbsp;<strong>anim</strong>i,&nbsp;<strong>id est laborum</strong>&nbsp;et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>',0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,0),(2,'',2,1610564753,1609692494,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'a:24:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','local_plugin',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">News-&gt;list</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"configuration\">\n            <language index=\"lDEF\">\n                <field index=\"settings.newsList.itemsPerPage\">\n                    <value index=\"vDEF\">15</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,0),(3,'',2,1610564693,1609692517,1,1,0,0,0,'',512,0,0,0,0,NULL,0,'a:18:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:8:\"bodytext\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,'html','','','<div id=\"app-news-list\">\r\n  VUE app here\r\n</div>',0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','',1,0,NULL,0,'','','',0,0,0,NULL,'',0,'',NULL,'','',NULL,124,0,0,0,0,0),(4,'',4,1609692710,1609692699,1,0,0,0,0,'',256,0,0,0,0,NULL,2,'a:1:{s:6:\"hidden\";N;}',0,0,0,0,'header','Login','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','','','',0,'','',0,'0','',1,0,'',0,'','','',0,0,0,NULL,'',0,'','','','',NULL,124,0,0,0,0,0),(5,'',5,1610567832,1610567815,1,0,0,0,0,'',256,0,0,0,0,NULL,0,'a:24:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:9:\"list_type\";N;s:11:\"pi_flexform\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;}',0,0,0,0,'list','','',NULL,0,0,0,0,0,0,0,2,0,0,0,'default',0,'','',NULL,NULL,0,'','',0,'0','news_pi1',1,0,NULL,0,'','','',0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"settings.orderBy\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.orderDirection\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categoryConjunction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.categories\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.includeSubCategories\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.archiveRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.timeRestrictionHigh\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsRestriction\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.startingpoint\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.recursive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.selectedList\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"switchableControllerActions\">\n                    <value index=\"vDEF\">News-&gt;detail</value>\n                </field>\n                <field index=\"settings.singleNews\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.previewHiddenRecords\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"additional\">\n            <language index=\"lDEF\">\n                <field index=\"settings.detailPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.listPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.backPid\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.limit\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.offset\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.tags\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.hidePagination\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.list.paginate.itemsPerPage\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.topNewsFirst\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.excludeAlreadyDisplayedNews\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"settings.disableOverrideDemand\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"template\">\n            <language index=\"lDEF\">\n                <field index=\"settings.media.maxWidth\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.media.maxHeight\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.cropMaxCharacters\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"settings.templateLayout\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','',0,'',NULL,'','',NULL,124,0,0,0,0,0);
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `extension_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT 1,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `review_state` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `serialized_dependencies` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorcompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) NOT NULL DEFAULT 0,
  `lastreviewedversion` int(11) NOT NULL DEFAULT 0,
  `documentation_link` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ter',
  `distribution_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distribution_welcome_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_link`
--

DROP TABLE IF EXISTS `tx_news_domain_model_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `cruser_id` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_source` int(11) NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `deleted` smallint(6) NOT NULL DEFAULT 0,
  `hidden` smallint(6) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_link`
--

LOCK TABLES `tx_news_domain_model_link` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_news_domain_model_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_news`
--

DROP TABLE IF EXISTS `tx_news_domain_model_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_news` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `cruser_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(6) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_source` int(11) NOT NULL DEFAULT 0,
  `deleted` smallint(6) NOT NULL DEFAULT 0,
  `hidden` smallint(6) NOT NULL DEFAULT 0,
  `starttime` int(11) NOT NULL DEFAULT 0,
  `endtime` int(11) NOT NULL DEFAULT 0,
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `teaser` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodytext` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` bigint(20) NOT NULL DEFAULT 0,
  `archive` bigint(20) NOT NULL DEFAULT 0,
  `author` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_email` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(11) NOT NULL DEFAULT 0,
  `related` int(11) NOT NULL DEFAULT 0,
  `related_from` int(11) NOT NULL DEFAULT 0,
  `related_files` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `fal_related_files` int(10) unsigned DEFAULT 0,
  `related_links` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` int(11) NOT NULL DEFAULT 0,
  `media` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fal_media` int(10) unsigned DEFAULT 0,
  `internalurl` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `externalurl` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `istopnews` int(11) NOT NULL DEFAULT 0,
  `content_elements` int(11) NOT NULL DEFAULT 0,
  `path_segment` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_changefreq` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `sys_language_uid_l10n_parent` (`sys_language_uid`,`l10n_parent`),
  KEY `import` (`import_id`,`import_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `path_segment` (`path_segment`(185),`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_news`
--

LOCK TABLES `tx_news_domain_model_news` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news` DISABLE KEYS */;
INSERT INTO `tx_news_domain_model_news` VALUES (1,3,1590836228,1590700955,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem folder A','','<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1590693600,0,'','',2,0,0,NULL,0,'0','0','','',2,NULL,1,NULL,NULL,0,0,'sed-ut-perspiciatis-unde-omnis-iste-natus-error-sit-voluptatem-folder-a','','','','',0.5),(2,3,1599335757,1590704324,1,0,0,0,'',0,0,0,0,0,1,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Natus error sit voluptatem folder A','','<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas.</p>',1590695100,0,'','',1,0,0,NULL,0,'0','0','','',2,NULL,2,NULL,NULL,1,0,'natus-error-sit-voluptatem-folder-a','','','','',0.5),(3,3,1590836196,1590704475,1,0,0,0,'',0,0,0,0,0,0,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur folder A','','<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>',1590783000,0,'','',2,0,0,NULL,0,'0','0','','',1,NULL,1,NULL,NULL,0,0,'ut-enim-ad-minima-veniam-quis-nostrum-exercitationem-ullam-corporis-suscipit-laboriosam-nisi-ut-aliquid-ex-ea-commodi-consequatur-folder-a','','','','',0.5),(5,6,1590836349,1590836046,1,0,0,0,'',0,0,0,0,0,1,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem folder B','','<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1590693600,0,'','',0,0,0,NULL,0,'0','0','','',2,NULL,1,NULL,NULL,0,0,'sed-ut-perspiciatis-unde-omnis-iste-natus-error-sit-voluptatem-folder-b','','','','',0.5),(6,6,1590836334,1590836046,1,0,0,0,'',0,0,0,0,0,2,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Natus error sit voluptatem folder B','','<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas.</p>',1590695100,0,'','',0,0,0,NULL,0,'0','0','','',2,NULL,2,NULL,NULL,0,0,'natus-error-sit-voluptatem-folder-b','','','','',0.5),(7,6,1590836321,1590836046,1,0,0,0,'',0,0,0,0,0,3,0,0,0,'a:27:{s:4:\"type\";N;s:9:\"istopnews\";N;s:5:\"title\";N;s:12:\"path_segment\";N;s:6:\"teaser\";N;s:8:\"datetime\";N;s:7:\"archive\";N;s:8:\"bodytext\";N;s:16:\"content_elements\";N;s:9:\"fal_media\";N;s:17:\"fal_related_files\";N;s:10:\"categories\";N;s:7:\"related\";N;s:13:\"related_links\";N;s:4:\"tags\";N;s:6:\"author\";N;s:12:\"author_email\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:17:\"alternative_title\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:5:\"notes\";N;}',0,0,0,0,0,'','',NULL,0,'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur folder B','','<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>',1590783000,0,'','',0,0,0,NULL,0,'0','0','','',1,NULL,1,NULL,NULL,0,0,'ut-enim-ad-minima-veniam-quis-nostrum-exercitationem-ullam-corporis-suscipit-laboriosam-nisi-ut-aliquid-ex-ea-commodi-consequatur-folder-b','','','','',0.5);
/*!40000 ALTER TABLE `tx_news_domain_model_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_news_related_mm`
--

DROP TABLE IF EXISTS `tx_news_domain_model_news_related_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_news_related_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_news_related_mm`
--

LOCK TABLES `tx_news_domain_model_news_related_mm` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news_related_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_news_domain_model_news_related_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_news_tag_mm`
--

DROP TABLE IF EXISTS `tx_news_domain_model_news_tag_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_news_tag_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sorting_foreign` int(10) unsigned NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_news_tag_mm`
--

LOCK TABLES `tx_news_domain_model_news_tag_mm` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news_tag_mm` DISABLE KEYS */;
INSERT INTO `tx_news_domain_model_news_tag_mm` VALUES (1,1,1,0),(1,4,2,0),(2,1,1,0),(2,2,2,0),(3,4,1,0),(4,4,1,0),(5,6,1,0),(5,9,2,0),(6,6,1,0),(6,7,2,0),(7,9,1,0);
/*!40000 ALTER TABLE `tx_news_domain_model_news_tag_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_news_ttcontent_mm`
--

DROP TABLE IF EXISTS `tx_news_domain_model_news_ttcontent_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_news_ttcontent_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_news_ttcontent_mm`
--

LOCK TABLES `tx_news_domain_model_news_ttcontent_mm` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_news_ttcontent_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_news_domain_model_news_ttcontent_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_news_domain_model_tag`
--

DROP TABLE IF EXISTS `tx_news_domain_model_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_news_domain_model_tag` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `cruser_id` int(11) NOT NULL DEFAULT 0,
  `deleted` smallint(6) NOT NULL DEFAULT 0,
  `hidden` smallint(6) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(11) NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_source` int(11) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `t3ver_oid` int(11) NOT NULL DEFAULT 0,
  `t3ver_id` int(11) NOT NULL DEFAULT 0,
  `t3_origuid` int(11) NOT NULL DEFAULT 0,
  `t3ver_wsid` int(11) NOT NULL DEFAULT 0,
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_count` int(11) NOT NULL DEFAULT 0,
  `t3ver_tstamp` int(11) NOT NULL DEFAULT 0,
  `t3ver_move_id` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_news_domain_model_tag`
--

LOCK TABLES `tx_news_domain_model_tag` WRITE;
/*!40000 ALTER TABLE `tx_news_domain_model_tag` DISABLE KEYS */;
INSERT INTO `tx_news_domain_model_tag` VALUES (1,3,1590701033,1590701033,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 1','tag-1','','','',''),(2,3,1590701041,1590701041,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 2','tag-2','','','',''),(3,3,1590701064,1590701048,1,0,0,0,0,'a:9:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"hidden\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:5:\"notes\";N;s:16:\"sys_language_uid\";N;}',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 3','tag-3','','','',''),(4,3,1590701072,1590701072,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 4','tag-4','','','',''),(6,6,1590836046,1590836046,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 10','tag-1-1','','','',''),(7,6,1590836046,1590836046,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 20','tag-2-1','','','',''),(8,6,1590836046,1590836046,1,0,0,0,0,'a:9:{s:5:\"title\";N;s:4:\"slug\";N;s:6:\"hidden\";N;s:9:\"seo_title\";N;s:15:\"seo_description\";N;s:12:\"seo_headline\";N;s:8:\"seo_text\";N;s:5:\"notes\";N;s:16:\"sys_language_uid\";N;}',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 30','tag-3-1','','','',''),(9,6,1590836046,1590836046,1,0,0,0,0,'',0,'',NULL,0,0,0,0,0,'',0,0,0,0,0,'Tag 40','tag-4-1','','','','');
/*!40000 ALTER TABLE `tx_news_domain_model_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10 22:27:03
