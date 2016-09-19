-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: aspnet_eoffice
-- ------------------------------------------------------
-- Server version	5.5.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `m_config`
--

DROP TABLE IF EXISTS `m_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_timer` int(11) DEFAULT NULL,
  `email_sending` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_config`
--

LOCK TABLES `m_config` WRITE;
/*!40000 ALTER TABLE `m_config` DISABLE KEYS */;
INSERT INTO `m_config` VALUES (1,100000,'yudi@ptpn13.com','2015-04-17 06:55:11');
/*!40000 ALTER TABLE `m_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_jenis_disposisi`
--

DROP TABLE IF EXISTS `m_jenis_disposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_jenis_disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pesan` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `updby` varchar(45) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `prioritas` int(11) DEFAULT NULL,
  `JenisDisposisi_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_jenis_disposisi`
--

LOCK TABLES `m_jenis_disposisi` WRITE;
/*!40000 ALTER TABLE `m_jenis_disposisi` DISABLE KEYS */;
INSERT INTO `m_jenis_disposisi` VALUES (3,'Harap segera ditindaklanjuti','2015-03-30 23:44:26','sekre',1,NULL,NULL),(4,'Mohon dibahas kembali','2015-03-30 23:44:39','sekre',1,NULL,NULL),(5,'Di agendakan rapat besok hari','2015-03-30 23:44:53','sekre',1,NULL,NULL),(6,'Segera ditindaklanjuti','2015-05-22 10:31:16','yudi',1,NULL,NULL),(7,'Mohon diterima','2015-05-22 10:32:57','yudi',1,NULL,NULL),(8,'Setuju / pedomani','2015-05-22 10:33:20','yudi',1,NULL,NULL),(9,'Teliti / Pelajari','2015-05-22 10:33:32','yudi',1,NULL,NULL),(10,'Proses sesuai ketentuan','2015-05-22 10:33:45','yudi',1,NULL,NULL),(11,'Proses sesuai petunjuk pimpinan','2015-05-22 10:33:58','yudi',1,NULL,NULL),(12,'Proses sesuai anggaran / DPA','2015-05-22 10:34:10','yudi',1,NULL,NULL),(13,'Buatkan Materi / Sambutan / Jawaban','2015-05-22 10:34:35','yudi',1,NULL,NULL),(14,'Arsipkan / Berkaskan','2015-05-22 10:34:52','yudi',1,NULL,NULL),(15,'Wakili Karo / Hadiri Acara ini','2015-05-22 10:35:13','yudi',1,NULL,NULL),(16,'Cek ke Lokasi / Tempat / Selesaikan','2015-05-22 10:35:29','yudi',1,NULL,NULL),(17,'Buatkan Telaahan / Nota Dinas / Jawaban','2015-05-22 10:35:49','yudi',1,NULL,NULL),(18,'Untuk perhatian / Diketahui','2015-05-22 10:36:02','yudi',1,NULL,NULL),(19,'Bicarakan / Laporkan / Menghadap Karo','2015-05-22 10:36:20','yudi',1,NULL,NULL),(20,'Fasilitasi Sesuai Ketentuan /  Arahan Pimpinan','2015-05-22 10:36:43','yudi',1,NULL,NULL),(21,'Edarkan / Perbanyak','2015-05-22 10:36:54','yudi',1,NULL,NULL),(22,'Copy Untuk Arsip Karo','2015-05-22 10:37:07','yudi',1,NULL,NULL),(23,'Copy Untuk Arsip Karo','2015-05-22 10:37:09','yudi',1,NULL,NULL),(24,'Koordinasikan dengan ....','2015-05-22 10:37:22','yudi',1,NULL,NULL),(25,'Teruskan ke .....','2015-05-22 10:37:32','yudi',1,NULL,NULL);
/*!40000 ALTER TABLE `m_jenis_disposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_unit_set_ka`
--

DROP TABLE IF EXISTS `m_unit_set_ka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_unit_set_ka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `IsSet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_unit_set_ka`
--

LOCK TABLES `m_unit_set_ka` WRITE;
/*!40000 ALTER TABLE `m_unit_set_ka` DISABLE KEYS */;
INSERT INTO `m_unit_set_ka` VALUES (3,144,1),(4,145,1),(5,129,1),(6,130,1),(7,131,1),(8,134,1),(9,135,1),(10,187,0),(11,137,1),(12,138,1),(13,139,1),(14,151,1),(15,203,1),(16,153,1),(17,155,1),(18,207,1),(19,157,1),(20,206,1),(21,200,1);
/*!40000 ALTER TABLE `m_unit_set_ka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_set_plt`
--

DROP TABLE IF EXISTS `m_user_set_plt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_user_set_plt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `IsPLT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_set_plt`
--

LOCK TABLES `m_user_set_plt` WRITE;
/*!40000 ALTER TABLE `m_user_set_plt` DISABLE KEYS */;
INSERT INTO `m_user_set_plt` VALUES (2,189,210,'thesecret.resti@gmail.com',1);
/*!40000 ALTER TABLE `m_user_set_plt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_catatan`
--

DROP TABLE IF EXISTS `o_catatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_catatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catatan` text,
  `user_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `no_agenda` varchar(45) DEFAULT NULL,
  `connect_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`no_agenda`),
  KEY `connect` (`connect_id`,`user_id`,`unit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_catatan`
--

LOCK TABLES `o_catatan` WRITE;
/*!40000 ALTER TABLE `o_catatan` DISABLE KEYS */;
INSERT INTO `o_catatan` VALUES (60,'',184,132,'2015-09-04 14:36:20','00006','1d1738fa-534d-11e5-83b0-00163e141161'),(61,'',184,132,'2015-09-04 14:37:43','00007','34668db2-534d-11e5-83b0-00163e141161'),(62,'',184,132,'2015-09-04 14:39:00','00008','61079c72-534d-11e5-83b0-00163e141161'),(63,'<p>\n	test</p>\n',205,139,'2015-10-10 18:26:47','00009','61ff0d89-6fb7-11e5-83b0-00163e141161'),(64,'<p>\n	test2</p>\n',205,139,'2015-10-10 18:27:30','000010','8cb2b786-6fb7-11e5-83b0-00163e141161'),(65,'<p>\n	aa</p>\n',205,139,'2015-10-12 08:37:12','000011','980c1e66-7081-11e5-922f-c44619bdfc3e'),(66,'',184,132,'2015-10-12 09:06:12','000012','ac91b2c7-7085-11e5-922f-c44619bdfc3e'),(67,'',184,132,'2015-10-12 09:09:48','000013','2c5887d7-7086-11e5-922f-c44619bdfc3e'),(68,'',184,132,'2015-10-12 09:19:28','000014','828994a2-7087-11e5-922f-c44619bdfc3e'),(69,'',205,139,'2015-10-12 09:21:53','000015','e498d9e8-7087-11e5-922f-c44619bdfc3e'),(70,'',205,139,'2015-10-12 09:22:51','000016','0c4960b6-7088-11e5-922f-c44619bdfc3e'),(71,'',184,132,'2015-10-12 09:26:10','000017','7a294c4c-7088-11e5-922f-c44619bdfc3e'),(72,'',184,132,'2015-10-12 09:28:02','000018','a0637b0f-7088-11e5-922f-c44619bdfc3e'),(73,'',184,132,'2015-10-12 09:28:58','000019','e2c7cfb3-7088-11e5-922f-c44619bdfc3e'),(75,'<p>\n	a</p>\n',184,132,'2015-10-24 05:31:33','000020','c1580c3e-79d5-11e5-87e4-c44619bdfc3e'),(76,'test',184,132,'2015-10-24 22:44:26','000020','06dcc0db-7a66-11e5-87e4-c44619bdfc3e'),(77,'',189,129,'2015-10-24 23:21:50','000022','20bd722c-7a6b-11e5-87e4-c44619bdfc3e'),(78,'',184,132,'2015-11-01 02:28:58','000023','96b468c3-8005-11e5-b2a5-c44619bdfc3e'),(79,'<p>\n	test</p>\n',184,132,'2015-11-04 15:56:38','000024','d70846ef-82d1-11e5-ad00-c44619bdfc3e'),(80,'',184,132,'2015-11-04 16:15:50','000025','95ccf2c2-82d4-11e5-ad00-c44619bdfc3e'),(81,'',184,132,'2015-11-04 16:21:07','000026','4cff53ec-82d5-11e5-ad00-c44619bdfc3e'),(82,'',184,132,'2015-11-04 16:35:10','000027','42aa64d0-82d7-11e5-ad00-c44619bdfc3e'),(83,'',184,132,'2015-11-04 16:53:25','000028','d8ca86a2-82d9-11e5-ad00-c44619bdfc3e'),(84,'',184,132,'2015-11-05 10:36:35','000029','5810e7bb-836e-11e5-ad00-c44619bdfc3e'),(85,'',184,132,'2015-11-05 10:38:41','000030','54983543-836e-11e5-ad00-c44619bdfc3e'),(87,'',184,132,'2015-11-05 00:02:03','000031','e26f6eb5-8393-11e5-83b0-00163e141161'),(88,'test',210,129,'2015-11-05 00:11:55','000031','63d3cbc0-8395-11e5-83b0-00163e141161'),(89,'',195,144,'2015-11-05 00:13:53','000031','a65d379d-8395-11e5-83b0-00163e141161'),(90,'test',195,144,'2015-11-05 00:26:23','000031','6eff3138-8397-11e5-83b0-00163e141161'),(91,'Ketua Asosiasi Pemerintahan Kabupaten Seluruh Indonesia (APKASI) Isran Noor mengatakan selama ini koperasi petani sawit yang ada masih berskala kecil, sehingga membuat usaha kebun sawit tidak dapat menikmati manfaat skala atau economic scale yang seharusnya.\n \n“Agar bisa berkembang maka pengembangan koperasi sebagai organisasi ekonomi kolektif para petani sawit perlu dipercepat pengembangannya kedepan,” katanya dalam seminar Penguatan Ekonomi Petani Sawit Melalui Pengembangan Koperasi Agribisnis Perkebunan Kelapa Sawit, di Jakarta, (21/10/2014).\n \nIsran yang juga Bupati Kutai Timur tersebut memaparkan bahwa 44% dari 10 juta ha luas perkebunan kelapa sawit di Indonesia saat ini merupakan perkebunan kelapa sawit rakyat.\n \nOleh karena itu, lanjutnya, economic scale yang dapat dinikmati petani sawit harusnya sejumlah dengan 44% dari 27 juta ton produksi CPO itu.\n \n“Apalagi pangsa perkebunan kelapa sawit rakyat pada 2020 akan meningkat menjadi 50%, namun lahan sehamparan yang luas makin terbatas. Sehingga perkebunan rakyat lah yang dapat menopang itu,” jelasnya.',184,132,'2015-12-15 11:14:09','000030','39c15737-a2e2-11e5-994b-005056c00001'),(92,'<h2 style=\"margin: 2em 0px 0.5em; font-size: 1.1em; line-height: 1.4; text-transform: uppercase; color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\n	FEATURED CATEGORY: ECOMMERCE</h2>\n<div class=\"clearfix\" style=\"color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;\">\n	<p style=\"margin: 0px 0px 1.2em;\">\n		This chart shows the global market share of&nbsp;<a href=\"https://wappalyzer.com/categories/ecommerce\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">eCommerce</a>&nbsp;platforms.&nbsp;<a href=\"https://wappalyzer.com/website-lists/#cat:232\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">Create a list</a>&nbsp;of&nbsp;<strong>982,000</strong>&nbsp;eCommerce websites or look up&nbsp;<a href=\"https://wappalyzer.com/categories\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">other platforms</a>.</p>\n</div>\n<p>\n	&nbsp;</p>\n',184,132,'2015-12-15 14:40:24','000033','0204ec9d-a2ff-11e5-994b-005056c00001'),(93,'<h2 style=\"margin: 2em 0px 0.5em; font-size: 1.1em; line-height: 1.4; text-transform: uppercase; color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\n	FEATURED CATEGORY: ECOMMERCE</h2>\n<div class=\"clearfix\" style=\"color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;\">\n	<p style=\"margin: 0px 0px 1.2em;\">\n		This chart shows the global market share of&nbsp;<a href=\"https://wappalyzer.com/categories/ecommerce\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">eCommerce</a>&nbsp;platforms.&nbsp;<a href=\"https://wappalyzer.com/website-lists/#cat:232\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">Create a list</a>&nbsp;of&nbsp;<strong>982,000</strong>&nbsp;eCommerce websites or look up&nbsp;<a href=\"https://wappalyzer.com/categories\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">other platforms</a>.</p>\n	<div>\n		&nbsp;</div>\n	<div>\n		<table style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; border-collapse: collapse; border-spacing: 0px; color: rgb(34, 36, 38); font-family: Arial, \'Helvetica Neue\', Helvetica, sans-serif; line-height: 16.9px;\">\n			<tbody style=\"margin: 0px; padding: 0px; border: 0px;\">\n				<tr style=\"margin: 0px; padding: 0px; border: 0px;\">\n					<td class=\"answercell\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\">\n						<div class=\"post-text\" itemprop=\"text\" style=\"margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; width: 660px; word-wrap: break-word; line-height: 1.3;\">\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								<em style=\"margin: 0px; padding: 0px; border: 0px;\">The following examples are Java, but the regex will be similar -- if not identical -- for other languages.</em></p>\n							<hr style=\"border: 0px; color: rgb(221, 221, 221); height: 1px; margin-bottom: 20px; background-color: rgb(221, 221, 221);\" />\n							<pre class=\"default prettyprint prettyprinted\" style=\"margin-top: 0px; margin-bottom: 1em; padding: 5px; border: 0px; font-size: 13px; overflow: auto; width: auto; max-height: 600px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; color: rgb(57, 51, 24); word-wrap: normal; background-color: rgb(238, 238, 238);\">\n<code style=\"margin: 0px; padding: 0px; border: 0px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: inherit;\"><span class=\"typ\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(43, 145, 175);\">String</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> target </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> someString</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">replaceAll</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;&lt;[^&gt;]*&gt;&quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">,</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> </span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;&quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">);</span></code></pre>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								Assuming your non-html does not contain any &lt; or &gt; and that your input string is correctly structured.</p>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								If you know they&#39;re a specific tag -- for example you know the text contains only&nbsp;<code style=\"margin: 0px; padding: 1px 5px; border: 0px; font-size: 13px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: pre-wrap; background-color: rgb(238, 238, 238);\">&lt;td&gt;</code>&nbsp;tags, you could do something like this:</p>\n							<pre class=\"default prettyprint prettyprinted\" style=\"margin-top: 0px; margin-bottom: 1em; padding: 5px; border: 0px; font-size: 13px; overflow: auto; width: auto; max-height: 600px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; color: rgb(57, 51, 24); word-wrap: normal; background-color: rgb(238, 238, 238);\">\n<code style=\"margin: 0px; padding: 0px; border: 0px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: inherit;\"><span class=\"typ\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(43, 145, 175);\">String</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> target </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> someString</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">replaceAll</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;(?i)&lt;td[^&gt;]*&gt;&quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">,</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> </span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;&quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">);</span></code></pre>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								Edit: &Omega;mega brought up a good point in a comment on another post that this would result in multiple results all being squished together if there were multiple tags.</p>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								For example, if the input string were&nbsp;<code style=\"margin: 0px; padding: 1px 5px; border: 0px; font-size: 13px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: pre-wrap; background-color: rgb(238, 238, 238);\">&lt;td&gt;Something&lt;/td&gt;&lt;td&gt;Another Thing&lt;/td&gt;</code>, then the above would result in&nbsp;<code style=\"margin: 0px; padding: 1px 5px; border: 0px; font-size: 13px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: pre-wrap; background-color: rgb(238, 238, 238);\">SomethingAnother Thing</code>.</p>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								In a situation where multiple tags are expected, we could do something like:</p>\n							<pre class=\"default prettyprint prettyprinted\" style=\"margin-top: 0px; margin-bottom: 1em; padding: 5px; border: 0px; font-size: 13px; overflow: auto; width: auto; max-height: 600px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; color: rgb(57, 51, 24); word-wrap: normal; background-color: rgb(238, 238, 238);\">\n<code style=\"margin: 0px; padding: 0px; border: 0px; font-family: Consolas, Menlo, Monaco, \'Lucida Console\', \'Liberation Mono\', \'DejaVu Sans Mono\', \'Bitstream Vera Sans Mono\', \'Courier New\', monospace, sans-serif; white-space: inherit;\"><span class=\"typ\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(43, 145, 175);\">String</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> target </span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">=</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> someString</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">.</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">replaceAll</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;(?i)&lt;td[^&gt;]*&gt;&quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">,</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> </span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot; &quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">).</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">replaceAll</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">(</span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot;\\\\s &quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">,</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\"> </span><span class=\"str\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(128, 0, 0);\">&quot; &quot;</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">).</span><span class=\"pln\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">trim</span><span class=\"pun\" style=\"margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);\">();</span></code></pre>\n							<p style=\"margin: 0px 0px 1em; padding: 0px; border: 0px; clear: both;\">\n								This replaces the HTML with a single space, then collapses whitespace, and then trims any on the&nbsp;</p>\n						</div>\n					</td>\n				</tr>\n			</tbody>\n		</table>\n	</div>\n</div>\n<hr />\n',184,132,'2015-12-16 02:31:18','000033','53c557f4-a362-11e5-994b-005056c00001');
/*!40000 ALTER TABLE `o_catatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_images`
--

DROP TABLE IF EXISTS `o_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images_id` varchar(45) NOT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `file_tipe` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_images`
--

LOCK TABLES `o_images` WRITE;
/*!40000 ALTER TABLE `o_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_informasi`
--

DROP TABLE IF EXISTS `o_informasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_informasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isi` text,
  `unit_name` varchar(100) DEFAULT NULL,
  `updby` varchar(20) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `images_id` varchar(45) DEFAULT NULL,
  `tipe` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_informasi`
--

LOCK TABLES `o_informasi` WRITE;
/*!40000 ALTER TABLE `o_informasi` DISABLE KEYS */;
INSERT INTO `o_informasi` VALUES (2,'Musda-Ke-III-DWP-Kalbar,-Ny-Ratna-Yuniar-Terpilih-Jadi-Ketua','Musda Ke III DWP Kalbar, Ny Ratna Yuniar Terpilih Jadi Ketua','<p>\n	PONTIANAK - Ketua Dharma Wanita Persatuan Sekretariat Daerah (DWP Setda) Kalbar Ratna Yuniar M Zeet terpilih secara aklamasi dalam Musyawarah Daerah (Musda) Ke III DWP Kalbar sebagai Ketua DWP Kalbar di Aula Politekni Negeri, Selasa (31/3), Pekan lalu.&nbsp;<br />\n	<br />\n	Dalam Pemilihan Ketua DPW Kalbar Periode 2014-2019 ini, Ratna Yuniar M. Zeet mengungguli Anna Riana Ridwan, dan terpilihnya Ratna Yuniar M. Zeet akan menggantikan Saminah Ngatman yang sudah berakhirnya masa Kepengurusannya.&nbsp;<br />\n	<br />\n	Penasihat DWP Kalbar Karyanti Sanjaya berharap, Kepemimpinan Ketua DWP Kalbar mendatang haruslah mampu mendorong lebih banyak lagi Istri para PNS untuk lebih aktif dalam kegiatan organisasi DWP ini.&nbsp;<br />\n	<br />\n	&ldquo;Sebagai Mitra Pemerintah, DWP Kalbar harus senantiasa berperan aktif menyukseskan berbagai program dan kebijakan pemerintaj,&rdquo; pinta Karyanti Sanjaya kepada Ratna Yuniar M. Zeet yang terpilih sebagai Ketua DWP Kalbar.&nbsp;<br />\n	<br />\n	Dikatakannya, peran DWP Kalbar sangatlah besar, selain menjadi ibu dari anak-anak, maupun istri para PNS, maka sudah seharusnya anggota DWP Kalbar juga berperan aktif mendorong ekonomi masyarakat dan mensosiasialisasikan hidup sehat kepada masyarakat.&nbsp;<br />\n	<br />\n	&ldquo;Anggota DWP Kalbar juga memliki peran menangkal bahaya penyalahgunaan narkoba, seks bebas serta pemahaman radikalisme yang kian berkembang. Ini sesuai dengan visi misi Gubernur Kalbar mewujudkan Generasi emas Kalbar,&rdquo; jelasnya.&nbsp;<br />\n	<br />\n	Sementara itu, Ketua DWP Kalbar Periode 2014-2019, Ratna Yuniar M. Zeet menyampaikan dibawah kepemimpinannya, akan mengakomodir berbagai kepentingan dari DWP Kabupaten/Kota Se Kalbar.&nbsp;<br />\n	<br />\n	&ldquo;Ada beberapa DWP di Kabupaten/Kota yang belum terbentuk Kepengurusannya. Saya akan lebih meningkatkan pembinaan kepada kepada para Pengurus DWP Kabupaten/Kota,&rdquo; kata Ratna Yuniar M Zeet, Kamis (2/4), saat ditemui.&nbsp;<br />\n	<br />\n	Disisi lain, Saminah Ngatman, mengatakan, berbagai program maupun kegiatan sosial kemasyarakatan telah dilaksanakan DWP Kalbar yang meliputi Bhakti Sosial, Sosialisasi kesehatan masyarakat hingga aksi nyata yang terus dilakukan DWP Kalbar.&nbsp;<br />\n	<br />\n	&ldquo;Saya juga berharap, Ketua DWP Kalbar terpilih juga mampu mendorong lagi Ibu-Ibu dari istri PNS/TNI-Polri/BUMN untuk berpartisipasi dalam berbagai kegiatan yang telah dilaksanakan DWP Kalbar, maupun Kabupaten/Kota,&rdquo; kata Saminah Ngatman. (Rinto Humas Prov).&nbsp;</p>\n','biro-umum','umum','2015-04-11','9337326a-dfbb-11e4-9af8-c44619bdfc3e',1),(3,'Sekda-Kalbar-Buka-Bimtek-Pelatihan-SPSE','Sekda Kalbar Buka Bimtek Pelatihan SPSE','<p>\n	PONTIANAK - Pegawai pengelola Layanan Pengadaan Secara Elektronik (LPSE) Pemprov Kalbar, Selasa (7/4) mengikuti Bimbingan Teknis (Bimtek) Standarisasi dan Pelatihan Sistem Pengadaan Secara Elektronik (SPSE).&nbsp;<br />\n	<br />\n	Bimtek Standarisasi dan Pelatihan SPSE dilaksanakan di Ruang Audiovisual Kantor Gubernur Kalbar dan dibuka secara resmi oleh Sekda Kalbar DR. M. Zeet Hamdy Assovie, MTM.&nbsp;<br />\n	<br />\n	Menurut Sekda Kalbar DR. M. Zeet Hamdy Assovie, MTM, penggunaan Teknologi informasi berperan penting dalam mengakselerasi percepatan pengandaan barang/jasa pemerintah. Terlaksananya LPSE memperlihatkan adanya semangat reformasi pengandaan, khususnya di Pemerintah Daerah, yang seiring dengan gelombang reformasi birokrasi untuk menciptakan pengandaan yang lebih baik.&nbsp;<br />\n	<br />\n	&ldquo;Penyelenggaraan LPSE tidak hanya berhenti pada penyediaan layanan pengandaan secara elektronik, baik kepada pemilik pekerjaan, maupun penyedia barang/jasa, tapi juga terhadap peningkatan kualitas layanan, keamanan informasi, dan kapasitas LPSE. Peningkatan kualitas pelaksanaan LPSE dirangkum dalam penerapan standarisasi LPSE,&rdquo; kata DR . M Zeet Hamdy Assovie, MTM, saat membuka Bimteks Standarisasi dan Pelatihan SPSE.&nbsp;<br />\n	<br />\n	Dikatakannya, Bimtek ini merupakan pelaksanaan salah satu fungsi Lembaga Kebijakan Pengadaan Barang/Jasa Pemerintah (LKPP), khususnya Sub Direktorat Pengelolaan dan Pembinaan LPSE. &ldquo;Gubernur diperankan sebagai fasilitator untuk menyukseskan penyelenggaraanya, sebagaimana amanat Surat LKPP,&rdquo; jelasnya.&nbsp;<br />\n	<br />\n	Berkaitan dengan implementasi SPSE, masih menurutnya, hingga akhir tahun 2014, jumlah paket pengandaan yang dilayani LPSE Provinsi Kalbar berjumlah 3.694 paket dengan nilai total pengandaan lebih dari Rp 3,4 triliun. Sementara, jumlah penyedia yang diverifikasi adalah sebanyak 1.156 penyedia.&nbsp;<br />\n	<br />\n	&ldquo;Ini telah mengindikasikan bahwa LPSE telah mendapatkan tanggapan positif dari pemerintah selaku pemilik pekerjaan maupun penyedia barang atau jasa, walaupun pada masa/periode sebelumnya belum diwajibkan 100 persen e-tendering,&rdquo; ujarnya.&nbsp;<br />\n	<br />\n	Dijelaskannya, respon yang cukup baik ini tentu saja akan berimplikasi pada tuntutan terhadap optimalisasi penggunaan SPSE yang kemudian akan bermuara pada ketersediaan sumber daya manusia yang handal, khususnya tenaga teknis sebagai ujung tombak pelaksanaan SPSE.&nbsp;<br />\n	<br />\n	&ldquo;Saya harap, Bimtek Standarisasi dan Pelatihan SPSE dapat meningkatkan kapasitas dan keterampilan personil LPSE,&rdquo; harapnya. (Rinto Humas Prov).&nbsp;</p>\n','biro-umum','umum','2015-04-11','4ff6bb22-dfc1-11e4-9af8-c44619bdfc3e',1),(4,'M.-Zeet-Harapkan-BUMdes-Harus-Segera-Di-Bangun','M. Zeet Harapkan BUMdes Harus Segera Di Bangun','<p>\n	DEMAK - Keberhasilan yang telah dibangun oleh 2 desa di Kabuapten Demak desa Pilangrejo dan Mlatiharjo patut untuk menjadi contoh, kekompakan antara masyarakat dalam membagun sebuah Desa sangat terlihat, ini semua tidak terlepas dari peranan dari Kepala desa yang mampu menciptakan semangat gotong royong, kebersamaan tanpa membeda - beda antara satu sama lainya.</p>\n<p>\n	dengan melihat apa yang telah dilakukan oleh 2 desa ini, diharapkan bagi kepala Desa yang terpilih dalam kunjungan ini dapat segera melakukan perubahan, mulai lah merancang suatu perencanaan dengan matang, potensi yang menonjol di desanya masing - masing harus segera digali sebagai modal utama untuk mendirikan Badan Usaha Milik Desa (BUMdes). hal tersebut di sampaikan Sekretaris daerah Provinsi kalimantan Barat, DR. M. Zeet Hamdy Assovie, MTM ketika melakukan kunjungan kerja bersama Badan Pemberdayaan Masyarakat dan Pemerintah Desa Prov kalbar beserta 7 (tujuh) kepala desa terpilih di Kabupaten Demak Provinsi Jawa tengah. (8 s/d 9/04).&nbsp;</p>\n','biro-umum','umum','2015-04-11','eafb5cae-dfeb-11e4-9af8-c44619bdfc3e',1),(6,'Evaluasi-Bencana-Asap-BPBD-Gelar-Rakor-Regional-Se-Kalimantan','Evaluasi Bencana Asap BPBD Gelar Rakor Regional Se-Kalimantan','<p>\n	PONTIANAK - Wakil Gubernur Kalimantan Barat mengatakan bahwa dalam beberapa tahun terakhir frekuensi kejadian bencana semakin meningkat, hal ini diperburuk dengan adanya perubahan iklim yang berdampak terhadap kehidupan dan penghidupan masyarakat. menurutnya salah satu dampak nyata dari perubahan iklim tersebut adalah terjadinya pergeseran dan perubahan musim dimana daerah tertentu musim kemarau menjadi lebih panjang dan musim penghujan menjadi lebih singkat atau sebaliknya sehingga mengakibatkan pada musim hujan terjadi bencana banjir dan pada musim kemarau terjadi kebakaran hutan dan lahan yang mengkibatkan bencana asap. Kondisi tersebut menurut Wagub menjadi perhatian bapak Presiden RI pada saat berkunjung di Pontianak pada tanggal 20 Januari 2015 lalu, yang dalam arahannya menekankan agar hotspot di Kalimantan pada tahun 2015 dapat ditekan dan dikendalikan, untuk itu dalam rangka menindaklanjuti arahan Presiden RI dimaksud, melalui Instruksi Presiden RI Nomor 16 tahun 2011 tetntang peningkatan pengendalian kebakaran hutan dan lahan maka perlu dilaksanakan Rapat Koordinasi Regional se-Kalimantan dalam rangka evaluasi bencana asap akibat kebakaran hutan dan lahan tahun 2014 dan upaya penaggulangan Tahun 2015.&nbsp;<br />\n	<br />\n	Hal itu dikemukakan Wakil Gubernur Kalbar dalam sambutannya pada acara pembukaan Rapat Koordinasi Regional Penanggulangan Bencana Asap akibat kebakaran Hutan dan Lahan se-Kalimantan tahun 2015, yang berlangsung di hotel kini Pontianak, kamis (16/4).&nbsp;<br />\n	<br />\n	Ditambahkan Wagub bahwa khusus untuk Provinsi Kalimantan Barat beberapa kejadian bencana (berdasarkan survei geospasial BNPB) Indeks Rawan Bencana (IRB) Provinsi Kalimantan Barat menempati urutan 24 dari 34 Provinsi di Indonesia, dan keadaan bencana ini sebagian besar tersebar di Kabupaten Ketapang, Kabupaten Kubu Raya, Kabupaten Sambas dan Kabupaten Mempawah, dan informasi tentang sebaran hotspot yang terdeteksi di Kalbar tahun 2014 sebanyak 5.031 titik. Wagub mengingatkan, bahwa untuk sampai pada zero bencana asap akibat kebakaran hutan dan lahan di Kalimantan perlu kerja keras aparatur terkait, oleh sebab itu perlu dipersiapkan personalia, pembiayaan, dan dokumentasi (P3D) masing-masing Provinsi dan Kabupaten/Kota secara optimal, imbuhnya.&nbsp;<br />\n	<br />\n	Sementara itu, kepala Pelaksana BNPB Badan Penanggulangan Bencana Daerah Provinsi Kalimantan Barat, TTA Nyarong, selaku ketua panitia penyelenggara Rakor dalam laporannya menyampaikan bahwa pelaksanaan kegiatan Rakor dilaksanakan selama 3 hari yakni dimulai tanggal 16 hingga 18 april 2015, dimana kegiatan tersebut disampaikan beberapa materi yang diberikan oleh beberapa narasumber diantaranya dari kementerian Dalam Negeri, dari Badan Nasional Penanggulangan Bencana, dari BMKG, dan Kementerian Lingkungan Hidup. Dalam rangkaian acara pembukaan tersebut diserahkan pompa Pemadam Kebakaran dan peralatan lainnya kepada beberapa Kabupaten dan Kelompok Pemadam Kebakaran didaerah.&nbsp;<br />\n	<br />\n	Hadir dalam kesempatan tersebut para pimpinan Daerah se-Kalimantan, Pangdam, Kapolda se-Kalimantan, para Kajati se-Kalimantan, Ketua DPRD Kalbar dan Ketua Komisi V beserta Anggota, Anggota Forkorpimda Prov Kalbar, Para Bu[ati/Walikota se-Kalbar, Pimpinan SKPD terkait, kepala BPBD se-Kalimantan, serta pimpinan BKSDA Prov Kalbar beserta staf (ruslanhumasprov)</p>\n','Staff-Tata-usaha-umum','admi','2015-04-20','3834e9b0-e71e-11e4-8924-c44619bdfc3e',1),(7,'Lima-Gubernur-Kalimantan-Desak-Jokowi-Percepat-Pembangunan-Di-Kalimantan','Lima Gubernur Kalimantan Desak Jokowi Percepat Pembangunan Di Kalimantan','<p>\n	JAKARTA - Gubernur Kalimantan Barat Drs. Cornelis, MH., bersama Para Gubernur yang tergabung dalam Forum Kerjasama Revitalisasi dan Percepatan Pembangunan Regional Kalimantan (FKRP2RK). Rabu (15/4) sekitar pukul 09.30 WIB bertemu dengan Presiden Ir. Joko Widodo di Istana Negara Jakarta. Keanggotaan FKRP2RK terdiri dari pemerintah provinsi Kalimantan Selatan, Kalimantan Timur, Kalimantan Barat, Kalimantan Tengah dan Kalimantan Utara.&nbsp;<br />\n	<br />\n	Menurut Gubernur Kalimantan tengah Agustin Teras Narang, pertemuan tersebut terkait percepatan pembangunan Kalimantan yang secara prinsip sudah tertuang dalam Musyawarah Rencana Pembangunan Nasional,&rdquo; &quot;Kami berlima sampaikan kepada bapak Presiden perihal percepatan pembangunan regional di Kalimantan. Secara prinsip sudah tertuang di Musrenbangnas Kalimantan,&quot; ucap Gubernur Kalimantan Tengah Agustin Teras Narang di Kantor Presiden, Jakarta&nbsp;<br />\n	Teras Narang menjelaskan, walaupun pembangunan Kalimantan sudah ada di dalam Musyawarah Rencana Pembangunan Nasional (Musrenbangnas), namun para gubernur se-Kalimantan meminta kepastian dalam pembangunan infrastruktur di daerahnya.&nbsp;<br />\n	<br />\n	&quot;Kami ingin ada percepatan terutama infrastruktur dan menyangkut konektivitas antara satu provinsi dengan provinsi lain,&quot; tegas Teras Narang.&nbsp;<br />\n	<br />\n	Masalah lainnya yang dilaporkan ke Jokowi adalah proses lelang pengadaan proyek. Mereka menginginkan agar tidak ada keterlambatan yang dikarenakan hanya proses administrasi yang berlarut-larut, sehingga APBN di daerah pun akan terlambat.&nbsp;<br />\n	&quot;Pak Presiden sudah jelaskan beberapa langkah yang ditempuh. Dan kita harapkan bulan April sudah bisa sebagaimana yang diharapkan,&quot; tegasnya. Teras Narang juga menjelaskan, Presiden Joko Widodo akan mengunjungi provinsi-provinsi di Kalimantan untuk melihat secara langsung kondisi infrastruktur dan rencana pembangunan yang tengah dijalankan.&nbsp;<br />\n	<br />\n	Sementara itu Gubernur Kalimantan barat Drs. Cornelis MH., menyampaikan permasalahan yang terkait dengan pembangunan daerah perbatasan antara Kalimantan dengan Malaysia. Menurutnya, hal tersebut sangatlah penting, sehingga daerah perbatasan harus dianggap bukan lagi terbelakangan, tetapi terdepan. Presiden sudah komitmen akan membangun perbatasan, karena presiden sudah melihat langsung ketika berkunjung ke Entikong Kalbar. (Rinto Humas Prov Kalbar).&nbsp;</p>\n','Staff-Tata-usaha-umum','admi','2015-04-20','44581370-e71e-11e4-8924-c44619bdfc3e',1),(8,'Kunjungan-Kerja-Menteri-Pendayagunaan-Aparatur-Negara-Dan-Reformasi-Birokrasi-Ke-BPMPTSP-Prov.-Kalbar','Kunjungan Kerja Menteri Pendayagunaan Aparatur Negara Dan Reformasi Birokrasi Ke BPMPTSP Prov. Kalbar','<p>\n	Dalam rangkaian kunjungan kerja MenPAN-RB DR. H. Yuddy Crisnandi MM di Kalimantan Barat tanggal 14 April 2015 juga mengunjungi Badan Penanaman Modal dan Pelayanan Terpadu Satu Pintu (BPMPTSP) dan diterima langsung oleh Kepala Badan didampingi Kepala Bidang Pelayanan Perizinan Terpadu (Drs. Zulkarnain.MT, MM).&nbsp;<br />\n	<br />\n	Berbagai pertanyaan dilontarkan MenPAN-RB terkait dengan pelayanan satu pintu di Provinsi Kalimantan Barat, khususnya berkenaan dengan pemberian layanan kepada masyarakat, dan dijelaskan Kepala BPMPTSP Prov. Kalbar Dra. Sri Jumiadatin MS.i antara lain menyangkut Pelayanan Perizinan yang telah ditangani, diantaranya Pelayanan Perizinan Penanaman Modal untuk seluruh sektor kegiatan usaha, Pemasukan dan Pengeluaran Hewan dari Sektor Peternakan, IUIPHHK dari Sektor Kehutanan dan Izin Usaha Ekspedisi Muatan Pesawat Udara serta SP2BKS dari sektor Perkebunan, sementara izin-izin lain yang telah didelegasikan kepada Kepala BPMPTSP Prov. Kalbar dengan Peraturan Gubernur Kalimantan Barat Nomor 80 Tahun 2013 ada yang belum dapat ditangani karena masih menunggu revisi Peraturan Daerah No. 11 Tahun 2011 tentang Retribusi Perizinan Tertentu yaitu Perizinan untuk kegiatan usaha di Bidang Perikanan dan Perhubungan.&nbsp;</p>\n<p>\n	Menteri Yuddy pun berpesan agar BPMPTSP Prov. Kalbar mengkaji kembali Perizinan yang ditangani dengan mengacu kepada kewenangan Provinsi sesuai dengan Undang-undang 23 Tahun 2014 tentang Pemerintahan Daerah dan agar selalu meningkatkan layanan agar menjadi lebih baik dan lebih cepat. (Uray Iswan - BPMPTSP)&nbsp;</p>\n','Staff-Tata-usaha-umum','admi','2015-04-20','53f710b2-e71e-11e4-8924-c44619bdfc3e',1),(9,'Sekda-Buka-Arowana-Internasional-Contest-And-Expo-–-Equator-Gemstone-Contes-And-Expo-2015','Sekda Buka Arowana Internasional Contest And Expo – Equator Gemstone Contes And Expo 2015','<p>\n	PONTIANAK - Sekretaris Daerah Provinsi Kalimantan Barat, DR. M. Zeet Hamdy Assovie, MTM buka Arowana Internasional Contest and Expo &ndash; Equator Gemstone Contes and Expo 2015. Di Pontianak Convention Centre, (14 / 4) .&nbsp;<br />\n	<br />\n	Kegiatan yang dilaksanakan dalam rangka gebyar HUT TNI AU ke 69 bersama Pemprov kalbar kontes ikan arwana super red &amp; kontes batu kecubung unggu Kalimantan (Amethyst Borneo) yang memperebutkan Piala Gubernur Kalbar &amp; Piala Danlanud Supadio.&nbsp;<br />\n	<br />\n	Pemerintah Provinsi Kalbar sangat mendukung apa yang telah dilakukan TNI AU, selain sebagai promosi akan sumber daya alam yang beragam juga di iringi dengan tingginya kualitas, kegiatan ini sangatlah mendukung salah satu bidang perekonomian di Provinsi Kalbar. Arowana dan batu Mulia (Batu Kecubung) merupakan dua komoditi yang memiliki kesamaan pada nilai ekonomi yang tinggi. Pameran ini sebagai bukti kecintaan dan kepedulian terhadap potensi Sumber daya alam di Provinsi Kalbar, &ldquo;Tutur&rdquo; M. Zeet Hamdy Assovie.&nbsp;<br />\n	<br />\n	M. Zeet Hamdy Assovie mengharapkan para pelaku usaha dan masyarakat kalbar untuk selalu memperhatikan dan menjaga kelestarian alam, jaga dan pelihara kelestarian alam untuk kita wariskan kepada generasi penerus agar salah satu sumber mata pencarian ini dapat terus berjalan dan berkesinambung. Selain itu, pameran ini sebagai ajang pertemuan di antara sesama pecinta/penghobi dan pelaku budidaya, sekaligus untuk mengakat citra komoditi lokal Kalbar. Selain untuk menjamin kepastian nilai ekonomi komoditi masing-masing.&nbsp;<br />\n	<br />\n	Sementara itu, Komandan Lanud Supadio Kol Pnb Palito Sitorus, S.IP MM mengatakan kegiatan yang dilaksanakan ini sebagai bentuk silaturahmi antara sesama, di harapkan para peserta yang ikut dalam kontes dapat menjujung tinggi semangat sportifitas dalam pertandingan. (Rinto Humas Prov).&nbsp;</p>\n','Staff-Tata-usaha-umum','admi','2015-04-20','7b6b552c-e71e-11e4-8924-c44619bdfc3e',1),(10,'M.Zeet,-Perlu-Manajemen-Modern-Mengelola-Zakat-','M.Zeet, Perlu Manajemen Modern Mengelola Zakat ','<p>\n	Pontianak- Pengelolaan zakat sebagaimana yang didefinisikan dalam Undang-Undang No.23 Tahun 2011, tentang pengelolaan Zakat, adalah kegiatan perencanaan, pelaksanaan dan pengkoordinasikan dalam pengumpulan, pendistribusian serta pendayagunaan zakat, oleh sebab itu dalam pengumpulan zakat diperlukan penerapan manejemen yang modern, dengan tujuan agar zakat sebagai potensi umat dapat dikelola secara melembaga sesuai dengan syariat Islam, amanah kemanfaatan, keadilan, kepastian hukum, terintegrasi dan akuntabilitas sehingga dapat meningkatkan efektifitas dan efesiensi pelayanan dalam pengelolaan zakat. Terkoordinasi adalah salah satu unsur penting yang dapat menjembatani peran mereka yang terlibat dan menjadi pelaku dalam kegiatan pengelolaan zakat, &ldquo;ungkap sekretaris Daerah Prov Kalbar Drs.M.Zeet Hamdy Assovie,MTM saat membuka Rapat Koordinasi Pengurus Baznas dengan UPZ BAZNAS Prov Kalbar yang berlangsung di Aula Kanwil Kementerian Agama Kalbar, Rabu ( 15 / 4).&nbsp;<br />\n	<br />\n	Lanjut M Zeet, Pemerintah Prov Kalbar sesuai dengan kapasitas yang dimiliki telah melakukan berbagai langkah untuk memberikan dukungan yang sungguh-sungguh dalam pengelolaan Zakat di Provinsi Kalimantan Barat, salah satunya adalah melalui Surat Edaran Guberrnur No. 451/3612.1/Kenssos-B tentang Optimalisasi Pengumpulan Zakat tanggal 28 November 2014, yang ditujukan kepada seluruh Pimpinan Instansi vertikal dan daerah dilingkungan Provinsi Kalbar yang diharapkan dapat mendorong karyawan/watinya yang beragam Islam untuk melaksanakan kewajibannya dalam menunaikan zakat pada masing-masing UPZ yang dibentuk BAZNAS Prov Kalbar, untuk itu dalam penangannya sangat diperlukan suatu manajemen yang profesional dan modern, sehingga hasil Zakat dapat menjadi transparan yang bisa dipertanggung jawabkan baik dalam penggunaan maupun dalam penyalurannya. Untuk ditingkat Pemerintah Kabupaten /Kota. Edaran Gubernur tersebut ada yang sudah ditindaklanjuti dalam bentuk edaran Bupati / Walikota dengan semangat dan tujuan yang sama dengan edaran Gubernur. Kebijakan ini tentunya masih perlu dikaji dari berbagai dimensi khususnya dari dimensi kesesuaian dengan ketentuan peraturan perundang-ndangan yang berlaku, &ldquo;Jelas M.Zeet.&nbsp;<br />\n	<br />\n	Berdasarkan dari laporan Bidang pengumpulan zakat melaporkan, bahwa hasil yang diterima pada zakat mall masih sangat kecil, dibanding dengan potensi zakat yang ada di instansi vertikal maupun daerah dilingkungan Pemerintah Provinsi Kalimantan Barat. Kondisi ini perlu mendapat perhatian kita bersama khususnya pada pengurus UPZ yang ada di Instansi-instansi, agar kedepan potensi zakat umat yang cukup besar yang berada di Instansi-instansi dapat kita himpun secara optimal, sehinga apa yang kita harapkan dari dana umat islam ini dapat dimanfaatkan secara maksimal dalam rangka membangun umat islam yang cerdas, berwatak dan ahlakulkarimah, paparnya.&nbsp;<br />\n	<br />\n	Ditambahkan M.Zeet, berkaitanh dengan akan berakhirnya masa jabatan kepengurusan BAZNAS Prov Kalbar Periode 2010-2015, telah dibentuk Tim Seleksi Calon Pimpinan BAZNAS Prov Kalbar Periode 2015-2020 melalui keputusan Gubernur No 129/Kessos/2015, himbauan tersebut mulai tanggal 3 Februari sampai dengan batas waktu aklhir pendaftaran hingga 8 April 2015. Namun demikian diharapkan agar Pimpinan BAZNAS yang akan berakhir jabatannya tetap melaksanakan tugas sesuai dengan ketentuan yang berlaku. Hingga terpilihnya Pimpinan BAZNAS Periode 2015-2020 yang akan ditetapkan oleh BAZNAS Pusat.&nbsp;<br />\n	Diharapkan nantinya yang terpilih dari proses seleksi ini adalah figur-figur yang dapat membawa BAZNASA Prov Kalbar yang mampu berkiprah untuk membangun dan membesarkan BAZNAS Prov Kalbar menjadi lembaga yang amanah, profesional dan membawa manfaat yang sebesar-besarnya bagi umat.&nbsp;<br />\n	<br />\n	M.Zeet menilai pertemuan koordinasi ini sebagai forum yang penting dan strategis yang dapat membuka ruang bagi Pengurus BAZNAS Prov Kalbar dan UPZ untuk saling bekerjasama dan menjalin komunikasi yang baik dalam upaya membangun sinergi dan strategis meningkatkan kesadaran berzakat di Instansi-instansi. Rapat Koordinasi diikuti seluruh Pimpinan BAZNAS dan UPZ se-Kalbar. ( Nasir Humas)&nbsp;</p>\n','Staff-Tata-usaha-umum','admin-umum','2015-04-20','87813b8f-e71e-11e4-8924-c44619bdfc3e',1);
/*!40000 ALTER TABLE `o_informasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_jenis_disposisi`
--

DROP TABLE IF EXISTS `o_jenis_disposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_jenis_disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_disposisi_id` int(11) DEFAULT NULL,
  `no_agenda` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `connect_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx` (`jenis_disposisi_id`,`no_agenda`,`connect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_jenis_disposisi`
--

LOCK TABLES `o_jenis_disposisi` WRITE;
/*!40000 ALTER TABLE `o_jenis_disposisi` DISABLE KEYS */;
INSERT INTO `o_jenis_disposisi` VALUES (48,14,'00007','2015-09-04 14:37:43','34668db2-534d-11e5-83b0-00163e141161'),(49,14,'00009','2015-10-10 18:26:47','61ff0d89-6fb7-11e5-83b0-00163e141161'),(50,14,'000010','2015-10-10 18:27:29','8cb2b786-6fb7-11e5-83b0-00163e141161'),(51,19,'000010','2015-10-10 18:27:29','8cb2b786-6fb7-11e5-83b0-00163e141161'),(52,13,'000010','2015-10-10 18:27:29','8cb2b786-6fb7-11e5-83b0-00163e141161'),(53,14,'000011','2015-10-12 08:37:12','980c1e66-7081-11e5-922f-c44619bdfc3e'),(54,13,'000011','2015-10-12 08:37:12','980c1e66-7081-11e5-922f-c44619bdfc3e'),(55,14,'000014','2015-10-12 09:19:25','828994a2-7087-11e5-922f-c44619bdfc3e'),(56,19,'000014','2015-10-12 09:19:26','828994a2-7087-11e5-922f-c44619bdfc3e'),(57,14,'000015','2015-10-12 09:21:53','e498d9e8-7087-11e5-922f-c44619bdfc3e'),(58,19,'000015','2015-10-12 09:21:53','e498d9e8-7087-11e5-922f-c44619bdfc3e'),(59,14,'000016','2015-10-12 09:22:49','0c4960b6-7088-11e5-922f-c44619bdfc3e'),(60,14,'000018','2015-10-12 09:28:02','a0637b0f-7088-11e5-922f-c44619bdfc3e'),(61,19,'000018','2015-10-12 09:28:02','a0637b0f-7088-11e5-922f-c44619bdfc3e'),(62,14,'000020','2015-10-24 05:31:31','c1580c3e-79d5-11e5-87e4-c44619bdfc3e'),(63,14,'000020','2015-10-24 22:44:26','06dcc0db-7a66-11e5-87e4-c44619bdfc3e'),(64,13,'000020','2015-10-24 22:44:26','06dcc0db-7a66-11e5-87e4-c44619bdfc3e'),(65,14,'000022','2015-10-24 23:21:48','20bd722c-7a6b-11e5-87e4-c44619bdfc3e'),(66,14,'000031','2015-11-05 00:11:55','63d3cbc0-8395-11e5-83b0-00163e141161'),(67,19,'000031','2015-11-05 00:11:55','63d3cbc0-8395-11e5-83b0-00163e141161'),(68,14,'000031','2015-11-05 00:13:53','a65d379d-8395-11e5-83b0-00163e141161'),(69,19,'000031','2015-11-05 00:13:53','a65d379d-8395-11e5-83b0-00163e141161'),(70,14,'000031','2015-11-05 00:26:23','6eff3138-8397-11e5-83b0-00163e141161'),(71,13,'000031','2015-11-05 00:26:23','6eff3138-8397-11e5-83b0-00163e141161'),(72,16,'000031','2015-11-05 00:26:23','6eff3138-8397-11e5-83b0-00163e141161'),(73,22,'000031','2015-11-05 00:26:23','6eff3138-8397-11e5-83b0-00163e141161'),(74,14,'000030','2015-12-15 11:14:09','39c15737-a2e2-11e5-994b-005056c00001'),(75,19,'000030','2015-12-15 11:14:09','39c15737-a2e2-11e5-994b-005056c00001'),(76,14,'000033','2015-12-16 02:31:18','53c557f4-a362-11e5-994b-005056c00001');
/*!40000 ALTER TABLE `o_jenis_disposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_lampiran`
--

DROP TABLE IF EXISTS `o_lampiran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_lampiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lampiran_id` varchar(45) NOT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `file_tipe` varchar(5) DEFAULT NULL,
  `connect_id` varchar(45) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx` (`lampiran_id`,`connect_id`,`unit_id`,`file_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_lampiran`
--

LOCK TABLES `o_lampiran` WRITE;
/*!40000 ALTER TABLE `o_lampiran` DISABLE KEYS */;
INSERT INTO `o_lampiran` VALUES (36,'21b73300-4258-11e5-83b0-00163e141161','00003_14_08_2015_Pedoman_LapKeu_Lampiran_13-Perkebunan.pdf','~/Assets/Lampiran/2015/08/00003_14_08_2015_Pedoman_LapKeu_Lampiran_13-Perkebunan.pdf','2015-08-14 00:54:51','.pdf',NULL,154),(37,'b35bf233-425f-11e5-83b0-00163e141161','00004_14_08_2015_screencapture-how-old-net-1430579226853.png','~/Assets/Lampiran/2015/08/00004_14_08_2015_screencapture-how-old-net-1430579226853.png','2015-08-14 01:46:00','.png',NULL,197),(40,'984ed2fc-7081-11e5-922f-c44619bdfc3e','000011_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000011_12_10_2015_screen.jpg','2015-10-12 08:36:21','.jpg',NULL,139),(57,'acd33298-7085-11e5-922f-c44619bdfc3e','000012_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000012_12_10_2015_screen.jpg','2015-10-12 09:05:56','.jpg',NULL,132),(59,'708635c4-7086-11e5-922f-c44619bdfc3e','000014_12_10_2015_screen3.jpg','~/Assets/Lampiran/2015/10/000014_12_10_2015_screen3.jpg','2015-10-12 09:10:54','.jpg',NULL,132),(60,'a38ce3dd-7086-11e5-922f-c44619bdfc3e','000014_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000014_12_10_2015_screen.jpg','2015-10-12 09:12:21','.jpg',NULL,132),(64,'82c99a92-7087-11e5-922f-c44619bdfc3e','000014_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000014_12_10_2015_screen.jpg','2015-10-12 09:18:46','.jpg',NULL,132),(65,'e4f2ea83-7087-11e5-922f-c44619bdfc3e','000015_12_10_2015_screen2.jpg','~/Assets/Lampiran/2015/10/000015_12_10_2015_screen2.jpg','2015-10-12 09:21:27','.jpg',NULL,139),(66,'0ca652ca-7088-11e5-922f-c44619bdfc3e','000016_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000016_12_10_2015_screen.jpg','2015-10-12 09:22:28','.jpg',NULL,139),(68,'79f3c718-7088-11e5-922f-c44619bdfc3e','000017_12_10_2015_screen.jpg','~/Assets/Lampiran/2015/10/000017_12_10_2015_screen.jpg','2015-10-12 09:25:42','.jpg',NULL,132),(69,'a0a2c85a-7088-11e5-922f-c44619bdfc3e','000018_12_10_2015_screen2.jpg','~/Assets/Lampiran/2015/10/000018_12_10_2015_screen2.jpg','2015-10-12 09:26:40','.jpg',NULL,132),(70,'e30d9c08-7088-11e5-922f-c44619bdfc3e','000019_12_10_2015_screen2.jpg','~/Assets/Lampiran/2015/10/000019_12_10_2015_screen2.jpg','2015-10-12 09:28:36','.jpg',NULL,132),(72,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e','000020_24_10_2015_20150526_Sewa_rumah_Ferry.docx','~/Assets/Lampiran/2015/10/000020_24_10_2015_20150526_Sewa_rumah_Ferry.docx','2015-10-24 05:31:19','.docx',NULL,132),(73,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e','Update_000020_24_10_2015_CATATAN_SIM_RS_PARINDU.txt','~/Assets/Lampiran/2015/10/Update_000020_24_10_2015_CATATAN_SIM_RS_PARINDU.txt','2015-10-24 22:44:09','.txt','06dcc0db-7a66-11e5-87e4-c44619bdfc3e',132),(74,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e','Update__24_10_2015_email_dr.anto.txt','~/Assets/Lampiran/2015/10/Update__24_10_2015_email_dr.anto.txt','2015-10-24 22:44:50','.txt','dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(75,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e','000022_24_10_2015_CATATAN_SIM_RS_PARINDU-oct3-2014.txt','~/Assets/Lampiran/2015/10/000022_24_10_2015_CATATAN_SIM_RS_PARINDU-oct3-2014.txt','2015-10-24 23:21:10','.txt',NULL,129),(76,'e233438d-8393-11e5-83b0-00163e141161','000031_05_11_2015_Getting_Started.pdf','~/Assets/Lampiran/2015/11/000031_05_11_2015_Getting_Started.pdf','2015-11-05 00:01:39','.pdf',NULL,132);
/*!40000 ALTER TABLE `o_lampiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_no_agenda`
--

DROP TABLE IF EXISTS `o_no_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_no_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_agenda` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`id`,`no_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_no_agenda`
--

LOCK TABLES `o_no_agenda` WRITE;
/*!40000 ALTER TABLE `o_no_agenda` DISABLE KEYS */;
INSERT INTO `o_no_agenda` VALUES (6,'00006','2015-09-04 14:36:20'),(7,'00007','2015-09-04 14:37:43'),(8,'00008','2015-09-04 14:39:00'),(9,'00009','2015-10-10 18:26:47'),(10,'000010','2015-10-10 18:27:30'),(11,'000011','2015-10-12 08:37:13'),(12,'000012','2015-10-12 09:06:13'),(13,'000013','2015-10-12 09:09:49'),(14,'000014','2015-10-12 09:19:29'),(15,'000015','2015-10-12 09:21:53'),(16,'000016','2015-10-12 09:22:52'),(17,'000017','2015-10-12 09:26:10'),(18,'000018','2015-10-12 09:28:02'),(19,'000019','2015-10-12 09:28:58'),(21,'000020','2015-10-24 05:31:34'),(22,'000022','2015-10-24 23:21:51'),(23,'000023','2015-11-01 02:29:00'),(24,'000024','2015-11-04 15:56:38'),(25,'000025','2015-11-04 16:15:50'),(26,'000026','2015-11-04 16:21:08'),(27,'000027','2015-11-04 16:35:11'),(28,'000028','2015-11-04 16:53:25'),(29,'000029','2015-11-05 10:36:35'),(30,'000030','2015-11-05 10:38:41'),(32,'000031','2015-11-05 00:02:03'),(33,'000033','2015-12-15 14:40:24');
/*!40000 ALTER TABLE `o_no_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_profile`
--

DROP TABLE IF EXISTS `o_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `golongan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_profile`
--

LOCK TABLES `o_profile` WRITE;
/*!40000 ALTER TABLE `o_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_riwayat`
--

DROP TABLE IF EXISTS `o_riwayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_riwayat` (
  `id` int(11) NOT NULL,
  `surat_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_riwayat`
--

LOCK TABLES `o_riwayat` WRITE;
/*!40000 ALTER TABLE `o_riwayat` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_riwayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_set_sending_access`
--

DROP TABLE IF EXISTS `o_set_sending_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_set_sending_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_id` int(11) NOT NULL,
  `pointer_pri_id` int(11) NOT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`pri_id`,`pointer_pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_set_sending_access`
--

LOCK TABLES `o_set_sending_access` WRITE;
/*!40000 ALTER TABLE `o_set_sending_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_set_sending_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_surat`
--

DROP TABLE IF EXISTS `o_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `no_agenda` varchar(150) DEFAULT NULL,
  `no_surat` varchar(150) DEFAULT NULL,
  `pengirim` varchar(255) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `jenis_surat` int(11) DEFAULT NULL,
  `alamat_pengirim` varchar(255) DEFAULT NULL,
  `tujuan_surat` varchar(255) DEFAULT NULL,
  `alamat_tujuan` varchar(255) DEFAULT NULL,
  `isi` text,
  `unit_tujuan_id` int(11) DEFAULT NULL,
  `lampiran_id` varchar(45) DEFAULT NULL,
  `unit_dari_id` int(11) DEFAULT NULL,
  `prioritas` int(11) DEFAULT NULL,
  `kualifikasi` int(11) DEFAULT NULL,
  `tanggal_surat` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `jenis_disposisi_id` int(11) DEFAULT NULL,
  `baca` bit(1) DEFAULT NULL,
  `jenis_disposisi` varchar(255) DEFAULT NULL,
  `parent_id` varchar(45) DEFAULT NULL,
  `child_id` varchar(45) DEFAULT NULL,
  `surat_dari_id` int(11) DEFAULT NULL COMMENT 'surat dari instansi lainnya',
  `jenis_surat_baru` varchar(2) DEFAULT NULL COMMENT 'jenis surat baru yaitu : SM are "surat masuk dari instansi lainnya", SK = SURAT KELUAR dari instansi terkait , ND = NOTA DINAS',
  `terima_tanggal` datetime DEFAULT NULL,
  `Surat_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`no_surat`,`no_agenda`,`perihal`,`pengirim`),
  KEY `idx` (`surat_dari_id`,`user_id`,`unit_tujuan_id`,`unit_dari_id`,`lampiran_id`,`tanggal_surat`,`jenis_disposisi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_surat`
--

LOCK TABLES `o_surat` WRITE;
/*!40000 ALTER TABLE `o_surat` DISABLE KEYS */;
INSERT INTO `o_surat` VALUES (23,187,'00007','test','test','test',1,'-','-','-','',137,'41864f43-52b8-11e5-83b0-00163e141161',132,1,1,'2015-09-04 10:51:22','2015-09-03 20:51:23','SE',NULL,'\0',NULL,'4da8b5fb-52b8-11e5-83b0-00163e141161','41864f43-52b8-11e5-83b0-00163e141161',4,'SM',NULL,NULL),(37,184,'00006','SK/05/09/2015/00006','Staff Tata Usaha Umum','adf',1,'adf','daf','adf','',132,'1d9a3524-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:36:19','2015-09-04 14:36:20','DE',NULL,'\0',NULL,'1d9a3524-534d-11e5-83b0-00163e141161','',4,'SK',NULL,NULL),(38,184,'00007','SK/05/09/2015/00007','Staff Tata Usaha Umum','adf',1,'adf','daf','adf','',132,'34d9adff-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:37:02','2015-09-04 14:37:03','DE',NULL,'',NULL,'34d9adff-534d-11e5-83b0-00163e141161','',0,'SK',NULL,NULL),(39,189,'00007','SK/05/09/2015/00007','Staff Tata Usaha Umum','adf',1,'adf','daf','adf','',129,'34d9adff-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:37:02','2015-09-04 14:37:03','SE',NULL,'',NULL,'3fa6b71a-534d-11e5-83b0-00163e141161','34d9adff-534d-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(40,191,'00007','SK/05/09/2015/00007','Staff Tata Usaha Umum','adf',1,'adf','daf','adf','',134,'34d9adff-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:37:02','2015-09-04 14:37:23','SE',NULL,'\0',NULL,'4bd3cc3a-534d-11e5-83b0-00163e141161','34d9adff-534d-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(41,184,'00008','adfadf','adfadf','adf',1,'-','-','-','',132,'60bfea0a-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:38:12','2015-09-04 14:38:12','DE',NULL,'',NULL,'60bfea0a-534d-11e5-83b0-00163e141161','',4,'SM',NULL,NULL),(42,189,'00008','adfadf','adfadf','adf',1,'-','-','-','',129,'60bfea0a-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:38:12','2015-09-04 14:38:12','SE',NULL,'\0',NULL,'69ed0277-534d-11e5-83b0-00163e141161','60bfea0a-534d-11e5-83b0-00163e141161',4,'SM',NULL,NULL),(43,191,'00008','adfadf','adfadf','adf',1,'-','-','-','',134,'60bfea0a-534d-11e5-83b0-00163e141161',132,1,1,'2015-09-05 04:38:12','2015-09-04 14:38:36','SE',NULL,'\0',NULL,'787dd845-534d-11e5-83b0-00163e141161','60bfea0a-534d-11e5-83b0-00163e141161',4,'SM',NULL,NULL),(44,205,'00009','SK/11/10/2015/00009','Kepala Sub Bagian Kerjasama Media','test',1,'','','','<p>\n	test</p>\n',139,'62ec72aa-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:26:37','2015-10-10 18:26:38','DE',NULL,'\0',NULL,'62ec72aa-6fb7-11e5-83b0-00163e141161','',0,'SK',NULL,NULL),(45,207,'00009','SK/11/10/2015/00009','Kepala Sub Bagian Kerjasama Media','test',1,'','','','<p>\n	test</p>\n',203,'62ec72aa-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:26:37','2015-10-10 18:26:38','SE',NULL,'\0',NULL,'80a0eeb0-6fb7-11e5-83b0-00163e141161','62ec72aa-6fb7-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(46,206,'00009','SK/11/10/2015/00009','Kepala Sub Bagian Kerjasama Media','test',1,'','','','<p>\n	test</p>\n',131,'62ec72aa-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:26:37','2015-10-10 18:26:43','SE',NULL,'\0',NULL,'83c08f12-6fb7-11e5-83b0-00163e141161','62ec72aa-6fb7-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(47,205,'000010','SK/11/10/2015/000010','Kepala Sub Bagian Kerjasama Media','test2',1,'','','','<p>\n	test2</p>\n',139,'8da33d1a-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:27:12','2015-10-10 18:27:12','DE',NULL,'',NULL,'8da33d1a-6fb7-11e5-83b0-00163e141161','',0,'SK',NULL,NULL),(48,207,'000010','SK/11/10/2015/000010','Kepala Sub Bagian Kerjasama Media','test2',1,'','','','<p>\n	test2</p>\n',203,'8da33d1a-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:27:12','2015-10-10 18:27:12','SE',NULL,'\0',NULL,'95ad27af-6fb7-11e5-83b0-00163e141161','8da33d1a-6fb7-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(49,206,'000010','SK/11/10/2015/000010','Kepala Sub Bagian Kerjasama Media','test2',1,'','','','<p>\n	test2</p>\n',131,'8da33d1a-6fb7-11e5-83b0-00163e141161',139,1,1,'2015-10-11 08:27:12','2015-10-10 18:27:21','SE',NULL,'\0',NULL,'9aabe5c0-6fb7-11e5-83b0-00163e141161','8da33d1a-6fb7-11e5-83b0-00163e141161',0,'SK',NULL,NULL),(50,205,'000011','SK/12/10/2015/000011','Kepala Sub Bagian Kerjasama Media','testt',1,'','','','<p>\n	aa</p>\n',139,'984ed2fc-7081-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 08:36:46','2015-10-12 08:36:47','DE',NULL,'\0',NULL,'984ed2fc-7081-11e5-922f-c44619bdfc3e','',0,'SK',NULL,NULL),(51,189,'000011','SK/12/10/2015/000011','Kepala Sub Bagian Kerjasama Media','testt',1,'','','','<p>\n	aa</p>\n',129,'984ed2fc-7081-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 08:36:46','2015-10-12 08:36:51','SE',NULL,'\0',NULL,'b139d344-7081-11e5-922f-c44619bdfc3e','984ed2fc-7081-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(52,207,'000011','SK/12/10/2015/000011','Kepala Sub Bagian Kerjasama Media','testt',1,'','','','<p>\n	aa</p>\n',203,'984ed2fc-7081-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 08:36:46','2015-10-12 08:37:07','SE',NULL,'\0',NULL,'baf8854a-7081-11e5-922f-c44619bdfc3e','984ed2fc-7081-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(53,184,'000012','SK/12/10/2015/000012','Staff Tata Usaha Umum','nn',1,'nn','nn','nn','',132,'acd33298-7085-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:06:07','2015-10-12 09:06:11','DE',NULL,'\0',NULL,'acd33298-7085-11e5-922f-c44619bdfc3e','',4,'SK',NULL,NULL),(54,184,'000013','SK/12/10/2015/000013','Staff Tata Usaha Umum','da',1,'ad','ad','ad','',132,'2cb1a8ae-7086-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:09:47','2015-10-12 09:09:47','DE',NULL,'\0',NULL,'2cb1a8ae-7086-11e5-922f-c44619bdfc3e','',1,'SK',NULL,NULL),(55,184,'000014','SK/12/10/2015/000014','Staff Tata Usaha Umum','AA',1,'','','','',132,'82c99a92-7087-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:19:13','2015-10-12 09:19:19','DE',NULL,'\0',NULL,'82c99a92-7087-11e5-922f-c44619bdfc3e','',0,'SK',NULL,NULL),(56,189,'000014','SK/12/10/2015/000014','Staff Tata Usaha Umum','AA',1,'','','','',129,'82c99a92-7087-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:19:13','2015-10-12 09:19:20','SE',NULL,'\0',NULL,'a0954fbe-7087-11e5-922f-c44619bdfc3e','82c99a92-7087-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(57,205,'000015','SK/12/10/2015/000015','Kepala Sub Bagian Kerjasama Media','aa',1,'','','','',139,'e4f2ea83-7087-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 09:21:47','2015-10-12 09:21:47','DE',NULL,'',NULL,'e4f2ea83-7087-11e5-922f-c44619bdfc3e','',0,'SK',NULL,NULL),(58,189,'000015','SK/12/10/2015/000015','Kepala Sub Bagian Kerjasama Media','aa',1,'','','','',129,'e4f2ea83-7087-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 09:21:47','2015-10-12 09:21:47','SE',NULL,'\0',NULL,'f894bfd3-7087-11e5-922f-c44619bdfc3e','e4f2ea83-7087-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(59,205,'000016','SK/12/10/2015/000016','Kepala Sub Bagian Kerjasama Media','xx',1,'','','','',139,'0ca652ca-7088-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 09:22:39','2015-10-12 09:22:39','DE',NULL,'\0',NULL,'0ca652ca-7088-11e5-922f-c44619bdfc3e','',0,'SK',NULL,NULL),(60,189,'000016','SK/12/10/2015/000016','Kepala Sub Bagian Kerjasama Media','xx',1,'','','','',129,'0ca652ca-7088-11e5-922f-c44619bdfc3e',139,1,1,'2015-10-12 09:22:39','2015-10-12 09:22:39','SE',NULL,'\0',NULL,'17797586-7088-11e5-922f-c44619bdfc3e','0ca652ca-7088-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(61,184,'000017','980808','nn','nn',1,'nn','nn','nn','',132,'79f3c718-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:25:56','2015-10-12 09:25:56','DE',NULL,'\0',NULL,'79f3c718-7088-11e5-922f-c44619bdfc3e','',7,'SM',NULL,NULL),(62,189,'000017','980808','nn','nn',1,'nn','nn','nn','',129,'79f3c718-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:25:56','2015-10-12 09:25:59','SE',NULL,'\0',NULL,'8ee6babc-7088-11e5-922f-c44619bdfc3e','79f3c718-7088-11e5-922f-c44619bdfc3e',7,'SM',NULL,NULL),(63,184,'000018','SK/12/10/2015/000018','Staff Tata Usaha Umum','nn',1,'','','','',132,'a0a2c85a-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:27:57','2015-10-12 09:27:57','DE',NULL,'\0',NULL,'a0a2c85a-7088-11e5-922f-c44619bdfc3e','',0,'SK',NULL,NULL),(64,189,'000018','SK/12/10/2015/000018','Staff Tata Usaha Umum','nn',1,'','','','',129,'a0a2c85a-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:27:57','2015-10-12 09:27:57','SE',NULL,'\0',NULL,'d50e33d6-7088-11e5-922f-c44619bdfc3e','a0a2c85a-7088-11e5-922f-c44619bdfc3e',0,'SK',NULL,NULL),(65,184,'000019','SK/12/10/2015/000019','Staff Tata Usaha Umum','mnn',1,'nn','nn','nn','',132,'e30d9c08-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:28:45','2015-10-12 09:28:46','DE',NULL,'',NULL,'e30d9c08-7088-11e5-922f-c44619bdfc3e','',3,'SK',NULL,NULL),(66,189,'000019','SK/12/10/2015/000019','Staff Tata Usaha Umum','mnn',1,'nn','nn','nn','',129,'e30d9c08-7088-11e5-922f-c44619bdfc3e',132,1,1,'2015-10-12 09:28:45','2015-10-12 09:28:46','SE',NULL,'\0',NULL,'f1f01f45-7088-11e5-922f-c44619bdfc3e','e30d9c08-7088-11e5-922f-c44619bdfc3e',3,'SK',NULL,NULL),(70,184,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',132,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:31:30','DE',NULL,'',NULL,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e','',8,'SK',NULL,NULL),(71,189,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',129,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:31:30','SE',NULL,'\0',NULL,'ce555c45-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(72,197,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',192,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:04','SE',NULL,'\0',NULL,'e2e79914-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(73,199,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',196,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:07','SE',NULL,'\0',NULL,'e4d1435d-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(74,196,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',154,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:07','SE',NULL,'\0',NULL,'e4dadcab-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(75,201,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',193,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:13','SE',NULL,'\0',NULL,'e7ecfb58-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(76,202,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',202,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:16','SE',NULL,'\0',NULL,'e9d0e656-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(77,198,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',197,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:16','SE',NULL,'\0',NULL,'e9dae317-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(78,200,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',194,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 05:32:19','SE',NULL,'\0',NULL,'ebb4ea60-79d5-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(79,201,'000020','SK/24/10/2015/000020','Staff Tata Usaha Umum','aa',1,'','','','<p>\n	a</p>\n',193,'c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',132,1,1,'2015-10-24 05:31:30','2015-10-24 22:44:26','SE',NULL,'\0',NULL,'1b3d1c77-7a66-11e5-87e4-c44619bdfc3e','c1a30f7b-79d5-11e5-87e4-c44619bdfc3e',8,'SK',NULL,NULL),(80,189,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',129,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:33','DE',NULL,'',NULL,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e','',0,'SK',NULL,NULL),(81,197,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',192,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:36','SE',NULL,'\0',NULL,'4c4084b9-7a6b-11e5-87e4-c44619bdfc3e','212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',0,'SK',NULL,NULL),(82,196,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',154,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:38','SE',NULL,'\0',NULL,'4d8acc4b-7a6b-11e5-87e4-c44619bdfc3e','212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',0,'SK',NULL,NULL),(83,201,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',193,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:42','SE',NULL,'\0',NULL,'501226cf-7a6b-11e5-87e4-c44619bdfc3e','212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',0,'SK',NULL,NULL),(84,202,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',202,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:43','SE',NULL,'',NULL,'50c6fb0d-7a6b-11e5-87e4-c44619bdfc3e','212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',0,'SK',NULL,NULL),(85,200,'000022','SK/24/10/2015/000022','Kepala Biro','test',1,'','','','',194,'212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',129,1,1,'2015-10-24 23:21:32','2015-10-24 23:21:45','SE',NULL,'\0',NULL,'516bf2ce-7a6b-11e5-87e4-c44619bdfc3e','212ff5c2-7a6b-11e5-87e4-c44619bdfc3e',0,'SK',NULL,NULL),(86,184,'000023','test','test','test',1,'test','test','test','',132,'967d8efc-8005-11e5-b2a5-c44619bdfc3e',132,1,1,'2015-11-01 02:28:55','2015-11-01 02:28:56','DE',NULL,'\0',NULL,'967d8efc-8005-11e5-b2a5-c44619bdfc3e','',4,'SM',NULL,NULL),(87,189,'000023','test','test','test',1,'test','test','test','',129,'967d8efc-8005-11e5-b2a5-c44619bdfc3e',132,1,1,'2015-11-01 02:28:55','2015-11-01 02:28:56','SE',NULL,'\0',NULL,'a0f6b89f-8005-11e5-b2a5-c44619bdfc3e','967d8efc-8005-11e5-b2a5-c44619bdfc3e',4,'SM',NULL,NULL),(88,184,'000024','tese','test','test',1,'-','-','-','<p>\n	test</p>\n',132,'d6d49293-82d1-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 15:56:05','2015-11-04 15:56:05','DE',NULL,'\0',NULL,'d6d49293-82d1-11e5-ad00-c44619bdfc3e','',6,'SM',NULL,NULL),(89,189,'000024','tese','test','test',1,'-','-','-','<p>\n	test</p>\n',129,'d6d49293-82d1-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 15:56:05','2015-11-04 15:56:07','SE',NULL,'\0',NULL,'e32f4043-82d1-11e5-ad00-c44619bdfc3e','d6d49293-82d1-11e5-ad00-c44619bdfc3e',6,'SM',NULL,NULL),(90,184,'000025','test','test','test',1,'-','-','-','',132,'95998460-82d4-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:15:38','2015-11-04 16:15:38','DE',NULL,'\0',NULL,'95998460-82d4-11e5-ad00-c44619bdfc3e','',4,'SM',NULL,NULL),(91,189,'000025','test','test','test',1,'-','-','-','',129,'95998460-82d4-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:15:38','2015-11-04 16:15:39','SE',NULL,'\0',NULL,'9d66ed5f-82d4-11e5-ad00-c44619bdfc3e','95998460-82d4-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(92,184,'000026','test','test','test',1,'-','-','-','',132,'4ccbd5fb-82d5-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:20:52','2015-11-04 16:20:52','DE',NULL,'\0',NULL,'4ccbd5fb-82d5-11e5-ad00-c44619bdfc3e','',4,'SM',NULL,NULL),(93,189,'000026','test','test','test',1,'-','-','-','',129,'4ccbd5fb-82d5-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:20:52','2015-11-04 16:20:53','SE',NULL,'',NULL,'58c69aec-82d5-11e5-ad00-c44619bdfc3e','4ccbd5fb-82d5-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(94,184,'000027','test','test','test',1,'-','-','-','',132,'425063fa-82d7-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:34:52','2015-11-04 16:34:52','DE',NULL,'\0',NULL,'425063fa-82d7-11e5-ad00-c44619bdfc3e','',4,'SM',NULL,NULL),(95,215,'000027','test','test','test',1,'-','-','-','',129,'425063fa-82d7-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:34:52','2015-11-04 16:34:52','SE',NULL,'',NULL,'4cf30236-82d7-11e5-ad00-c44619bdfc3e','425063fa-82d7-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(96,189,'000027','test','test','test',1,'-','-','-','',129,'425063fa-82d7-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:34:52','2015-11-04 16:52:11','SE',NULL,'\0',NULL,'b8399b65-82d9-11e5-ad00-c44619bdfc3e','425063fa-82d7-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(97,184,'000028','xxx','xxx','xx',1,'-','-','-','',132,'d8935eef-82d9-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:53:21','2015-11-04 16:53:21','DE',NULL,'',NULL,'d8935eef-82d9-11e5-ad00-c44619bdfc3e','',4,'SM',NULL,NULL),(98,189,'000028','xxx','xxx','xx',1,'-','-','-','',129,'d8935eef-82d9-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-04 16:53:21','2015-11-04 16:53:21','SE',NULL,'\0',NULL,'e21dfa6b-82d9-11e5-ad00-c44619bdfc3e','d8935eef-82d9-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(99,184,'000029','bbb','bb','bb',1,'-','-','-','',132,'57d6fee4-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:36:21','2015-11-05 10:36:21','DE',NULL,'',NULL,'57d6fee4-836e-11e5-ad00-c44619bdfc3e','',7,'SM',NULL,NULL),(100,189,'000029','bbb','bb','bb',1,'-','-','-','',129,'57d6fee4-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:36:21','2015-11-05 10:36:21','SE',NULL,'\0',NULL,'620a0b0a-836e-11e5-ad00-c44619bdfc3e','57d6fee4-836e-11e5-ad00-c44619bdfc3e',7,'SM',NULL,NULL),(101,184,'000030','xxxx','xxx','xxx',1,'xxx','-','-','',132,'535a45be-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:38:28','2015-11-05 10:38:28','DE',NULL,'',NULL,'535a45be-836e-11e5-ad00-c44619bdfc3e','',4,'SM',NULL,NULL),(102,189,'000030','xxxx','xxx','xxx',1,'xxx','-','-','',129,'535a45be-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:38:28','2015-11-05 10:38:28','SE',NULL,'',NULL,'ad98ff0d-836e-11e5-ad00-c44619bdfc3e','535a45be-836e-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(106,184,'000031','test','est','test',1,'-','-','-','',132,'e233438d-8393-11e5-83b0-00163e141161',132,1,1,'2015-11-05 15:01:54','2015-11-05 00:01:55','DE',NULL,'',NULL,'e233438d-8393-11e5-83b0-00163e141161','',6,'SM',NULL,NULL),(107,210,'000031','test','est','test',1,'-','-','-','',129,'e233438d-8393-11e5-83b0-00163e141161',132,1,1,'2015-11-05 15:01:54','2015-11-05 00:01:55','SE',NULL,'',NULL,'fe94e699-8393-11e5-83b0-00163e141161','e233438d-8393-11e5-83b0-00163e141161',6,'SM',NULL,NULL),(108,195,'000031','test','est','test',1,'-','-','-','',129,'e233438d-8393-11e5-83b0-00163e141161',129,1,1,'2015-11-05 15:01:54','2015-11-05 00:11:51','SE',NULL,'',NULL,'6b43da42-8395-11e5-83b0-00163e141161','e233438d-8393-11e5-83b0-00163e141161',6,'SM',NULL,NULL),(109,188,'000031','test','est','test',1,'-','-','-','',129,'e233438d-8393-11e5-83b0-00163e141161',144,1,1,'2015-11-05 15:01:54','2015-11-05 00:13:49','SE',NULL,'\0',NULL,'b322254a-8395-11e5-83b0-00163e141161','e233438d-8393-11e5-83b0-00163e141161',6,'SM',NULL,NULL),(110,188,'000031','test','est','test',1,'-','-','-','',129,'e233438d-8393-11e5-83b0-00163e141161',144,1,1,'2015-11-05 15:01:54','2015-11-05 00:26:15','SE',NULL,'',NULL,'7b48415d-8397-11e5-83b0-00163e141161','e233438d-8393-11e5-83b0-00163e141161',6,'SM',NULL,NULL),(111,210,'000030','xxxx','xxx','xxx',1,'xxx','-','-','',129,'535a45be-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:38:28','2015-12-15 11:14:01','SE',NULL,'\0',NULL,'457284da-a2e2-11e5-994b-005056c00001','535a45be-836e-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(112,210,'000030','xxxx','xxx','xxx',1,'xxx','-','-','',129,'535a45be-836e-11e5-ad00-c44619bdfc3e',132,1,1,'2015-11-05 10:38:28','2015-12-15 14:37:02','SE',NULL,'\0',NULL,'a1b82b97-a2fe-11e5-994b-005056c00001','535a45be-836e-11e5-ad00-c44619bdfc3e',4,'SM',NULL,NULL),(113,184,'000033','test','test','test',1,'-','-','-','<h2 style=\"margin: 2em 0px 0.5em; font-size: 1.1em; line-height: 1.4; text-transform: uppercase; color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\n	FEATURED CATEGORY: ECOMMERCE</h2>\n<div class=\"clearfix\" style=\"color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;\">\n	<p style=\"margin: 0px 0px 1.2em;\">\n		This chart shows the global market share of&nbsp;<a href=\"https://wappalyzer.com/categories/ecommerce\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">eCommerce</a>&nbsp;platforms.&nbsp;<a href=\"https://wappalyzer.com/website-lists/#cat:232\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">Create a list</a>&nbsp;of&nbsp;<strong>982,000</strong>&nbsp;eCommerce websites or look up&nbsp;<a href=\"https://wappalyzer.com/categories\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">other platforms</a>.</p>\n</div>\n<p>\n	&nbsp;</p>\n',132,'01dce960-a2ff-11e5-994b-005056c00001',132,1,1,'2015-12-15 14:40:11','2015-12-15 14:40:11','DE',NULL,'',NULL,'01dce960-a2ff-11e5-994b-005056c00001','',4,'SM',NULL,NULL),(114,210,'000033','test','test','test',1,'-','-','-','<h2 style=\"margin: 2em 0px 0.5em; font-size: 1.1em; line-height: 1.4; text-transform: uppercase; color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\n	FEATURED CATEGORY: ECOMMERCE</h2>\n<div class=\"clearfix\" style=\"color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;\">\n	<p style=\"margin: 0px 0px 1.2em;\">\n		This chart shows the global market share of&nbsp;<a href=\"https://wappalyzer.com/categories/ecommerce\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">eCommerce</a>&nbsp;platforms.&nbsp;<a href=\"https://wappalyzer.com/website-lists/#cat:232\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">Create a list</a>&nbsp;of&nbsp;<strong>982,000</strong>&nbsp;eCommerce websites or look up&nbsp;<a href=\"https://wappalyzer.com/categories\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">other platforms</a>.</p>\n</div>\n<p>\n	&nbsp;</p>\n',129,'01dce960-a2ff-11e5-994b-005056c00001',132,1,1,'2015-12-15 14:40:11','2015-12-15 14:40:11','SE',NULL,'\0',NULL,'12b3d7c7-a2ff-11e5-994b-005056c00001','01dce960-a2ff-11e5-994b-005056c00001',4,'SM',NULL,NULL),(115,210,'000033','test','test','test',1,'-','-','-','<h2 style=\"margin: 2em 0px 0.5em; font-size: 1.1em; line-height: 1.4; text-transform: uppercase; color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">\n	FEATURED CATEGORY: ECOMMERCE</h2>\n<div class=\"clearfix\" style=\"color: rgb(59, 59, 59); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;\">\n	<p style=\"margin: 0px 0px 1.2em;\">\n		This chart shows the global market share of&nbsp;<a href=\"https://wappalyzer.com/categories/ecommerce\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">eCommerce</a>&nbsp;platforms.&nbsp;<a href=\"https://wappalyzer.com/website-lists/#cat:232\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">Create a list</a>&nbsp;of&nbsp;<strong>982,000</strong>&nbsp;eCommerce websites or look up&nbsp;<a href=\"https://wappalyzer.com/categories\" style=\"color: rgb(0, 114, 182); text-decoration: none;\">other platforms</a>.</p>\n</div>\n<p>\n	&nbsp;</p>\n',129,'01dce960-a2ff-11e5-994b-005056c00001',132,1,1,'2015-12-15 14:40:11','2015-12-16 02:31:04','SE',NULL,'\0',NULL,'6c729230-a362-11e5-994b-005056c00001','01dce960-a2ff-11e5-994b-005056c00001',4,'SM',NULL,NULL);
/*!40000 ALTER TABLE `o_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_surat_dari`
--

DROP TABLE IF EXISTS `o_surat_dari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_surat_dari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_surat_dari`
--

LOCK TABLES `o_surat_dari` WRITE;
/*!40000 ALTER TABLE `o_surat_dari` DISABLE KEYS */;
INSERT INTO `o_surat_dari` VALUES (1,'Pemerintah pusat','2015-04-18 08:51:07',1),(2,'Organisasi','2015-04-18 08:51:23',1),(3,'Masyarakat','2015-04-18 08:51:30',1),(4,'Badan Usaha','2015-04-18 08:51:38',1),(5,'SKPD di lingkungan pemerintah','2015-04-18 08:52:14',1),(6,'Kabupaten Kota','2015-04-18 08:52:29',1),(7,'Kementerian','2015-04-18 08:52:36',1),(8,'Intern','2015-05-26 08:44:09',1),(9,'KPU','2015-06-04 14:32:25',1);
/*!40000 ALTER TABLE `o_surat_dari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_surat_to_unit`
--

DROP TABLE IF EXISTS `o_surat_to_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_surat_to_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_unit_id` int(11) NOT NULL,
  `to_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_o_surat_to_unit_id_from_unit_id_to_unit_id` (`id`,`from_unit_id`,`to_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_surat_to_unit`
--

LOCK TABLES `o_surat_to_unit` WRITE;
/*!40000 ALTER TABLE `o_surat_to_unit` DISABLE KEYS */;
INSERT INTO `o_surat_to_unit` VALUES (7,128,128),(8,128,133),(9,128,136),(10,128,143),(11,128,147),(12,143,129),(13,143,130),(14,143,131),(20,145,131),(21,145,134),(28,132,129),(29,132,130),(30,132,131),(31,132,132),(32,132,134),(33,132,135),(34,132,137),(35,132,138),(36,132,139),(37,132,144),(38,132,145),(39,132,146),(40,132,151),(41,132,152),(48,144,129),(49,144,130),(50,144,131),(51,144,132),(52,144,134),(53,144,135),(54,144,137),(55,144,138),(56,144,139),(57,144,144),(58,144,145),(59,144,146),(60,144,151),(61,144,152),(62,144,153),(63,144,154),(64,144,155),(65,144,156),(66,144,157),(67,144,158),(68,144,159),(69,144,161),(70,144,162),(71,144,163),(72,144,164),(73,144,165),(74,144,166),(75,144,167),(76,144,168),(77,144,169),(78,144,170),(79,144,171),(80,144,172),(81,144,173),(82,144,174),(83,144,175),(84,144,176),(85,144,177),(86,144,178),(87,144,179),(88,144,180),(89,144,181),(90,144,182),(91,144,183),(92,144,184),(93,144,185),(94,144,186),(95,144,187),(96,144,188),(97,144,189),(98,144,190),(99,144,191),(100,144,192),(101,144,193),(102,144,194),(103,144,195),(104,144,196),(105,144,197),(106,144,200),(107,144,201),(108,144,202),(109,144,203),(110,144,205),(111,144,206),(112,144,207),(116,129,132),(117,129,144),(118,129,145);
/*!40000 ALTER TABLE `o_surat_to_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_surat_tujuan_disposisi`
--

DROP TABLE IF EXISTS `o_surat_tujuan_disposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_surat_tujuan_disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surat_id` varchar(45) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `set_awal` int(1) DEFAULT '0',
  `connect_id` varchar(45) DEFAULT NULL,
  `dari_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`surat_id`,`unit_id`,`user_id`,`connect_id`,`dari_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_surat_tujuan_disposisi`
--

LOCK TABLES `o_surat_tujuan_disposisi` WRITE;
/*!40000 ALTER TABLE `o_surat_tujuan_disposisi` DISABLE KEYS */;
INSERT INTO `o_surat_tujuan_disposisi` VALUES (83,'00007',129,2,'2015-09-04 14:37:03',189,1,'34668db2-534d-11e5-83b0-00163e141161',132),(84,'00007',134,2,'2015-09-04 14:37:23',191,1,'34668db2-534d-11e5-83b0-00163e141161',132),(85,'00008',129,2,'2015-09-04 14:38:13',189,1,'61079c72-534d-11e5-83b0-00163e141161',132),(86,'00008',134,2,'2015-09-04 14:38:36',191,1,'61079c72-534d-11e5-83b0-00163e141161',132),(87,'00009',203,2,'2015-10-10 18:26:38',207,1,'61ff0d89-6fb7-11e5-83b0-00163e141161',139),(88,'00009',131,2,'2015-10-10 18:26:43',206,1,'61ff0d89-6fb7-11e5-83b0-00163e141161',139),(89,'000010',203,2,'2015-10-10 18:27:12',207,1,'8cb2b786-6fb7-11e5-83b0-00163e141161',139),(90,'000010',131,2,'2015-10-10 18:27:21',206,1,'8cb2b786-6fb7-11e5-83b0-00163e141161',139),(91,'000011',129,2,'2015-10-12 08:36:54',189,1,'980c1e66-7081-11e5-922f-c44619bdfc3e',139),(92,'000011',203,2,'2015-10-12 08:37:07',207,1,'980c1e66-7081-11e5-922f-c44619bdfc3e',139),(93,'000014',129,2,'2015-10-12 09:19:20',189,1,'828994a2-7087-11e5-922f-c44619bdfc3e',132),(94,'000015',129,2,'2015-10-12 09:21:48',189,1,'e498d9e8-7087-11e5-922f-c44619bdfc3e',139),(95,'000016',129,2,'2015-10-12 09:22:41',189,1,'0c4960b6-7088-11e5-922f-c44619bdfc3e',139),(96,'000017',129,2,'2015-10-12 09:26:02',189,1,'7a294c4c-7088-11e5-922f-c44619bdfc3e',132),(97,'000018',129,2,'2015-10-12 09:27:58',189,1,'a0637b0f-7088-11e5-922f-c44619bdfc3e',132),(98,'000019',129,2,'2015-10-12 09:28:47',189,1,'e2c7cfb3-7088-11e5-922f-c44619bdfc3e',132),(101,'000020',129,2,'2015-10-24 05:31:31',189,1,'c1580c3e-79d5-11e5-87e4-c44619bdfc3e',132),(102,'000020',192,2,'2015-10-24 05:32:05',197,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(103,'000020',196,2,'2015-10-24 05:32:07',199,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(104,'000020',154,2,'2015-10-24 05:32:07',196,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(105,'000020',193,2,'2015-10-24 05:32:16',201,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(106,'000020',202,2,'2015-10-24 05:32:16',202,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(107,'000020',197,2,'2015-10-24 05:32:16',198,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(108,'000020',194,2,'2015-10-24 05:32:22',200,1,'dcf60ef0-79d5-11e5-87e4-c44619bdfc3e',132),(109,'000020',193,2,'2015-10-24 22:44:26',201,0,'06dcc0db-7a66-11e5-87e4-c44619bdfc3e',132),(110,'000022',192,2,'2015-10-24 23:21:38',197,1,'20bd722c-7a6b-11e5-87e4-c44619bdfc3e',129),(111,'000022',154,2,'2015-10-24 23:21:39',196,1,'20bd722c-7a6b-11e5-87e4-c44619bdfc3e',129),(112,'000022',193,2,'2015-10-24 23:21:43',201,1,'20bd722c-7a6b-11e5-87e4-c44619bdfc3e',129),(113,'000022',202,2,'2015-10-24 23:21:44',202,1,'20bd722c-7a6b-11e5-87e4-c44619bdfc3e',129),(114,'000022',194,2,'2015-10-24 23:21:48',200,1,'20bd722c-7a6b-11e5-87e4-c44619bdfc3e',129),(115,'000023',129,2,'2015-11-01 02:28:56',189,1,'96b468c3-8005-11e5-b2a5-c44619bdfc3e',132),(116,'000024',129,2,'2015-11-04 15:56:08',189,1,'d70846ef-82d1-11e5-ad00-c44619bdfc3e',132),(117,'000025',129,2,'2015-11-04 16:15:39',189,1,'95ccf2c2-82d4-11e5-ad00-c44619bdfc3e',132),(118,'000026',129,2,'2015-11-04 16:20:53',189,1,'4cff53ec-82d5-11e5-ad00-c44619bdfc3e',132),(119,'000027',129,2,'2015-11-04 16:34:53',215,1,'42aa64d0-82d7-11e5-ad00-c44619bdfc3e',132),(120,'000027',129,2,'2015-11-04 16:52:13',189,1,'b45a47ac-82d9-11e5-ad00-c44619bdfc3e',132),(121,'000028',129,2,'2015-11-04 16:53:21',189,1,'d8ca86a2-82d9-11e5-ad00-c44619bdfc3e',132),(122,'000029',129,2,'2015-11-05 10:36:22',189,1,'5810e7bb-836e-11e5-ad00-c44619bdfc3e',132),(123,'000030',129,2,'2015-11-05 10:38:28',189,1,'54983543-836e-11e5-ad00-c44619bdfc3e',132),(126,'000031',129,2,'2015-11-05 00:01:56',210,1,'e26f6eb5-8393-11e5-83b0-00163e141161',132),(127,'000031',129,2,'2015-11-05 00:11:51',195,0,'63d3cbc0-8395-11e5-83b0-00163e141161',129),(128,'000031',129,2,'2015-11-05 00:13:49',188,0,'a65d379d-8395-11e5-83b0-00163e141161',144),(129,'000031',129,2,'2015-11-05 00:26:15',188,0,'6eff3138-8397-11e5-83b0-00163e141161',144),(130,'000030',129,2,'2015-12-15 11:14:01',210,0,'39c15737-a2e2-11e5-994b-005056c00001',132),(131,'000030',129,2,'2015-12-15 14:37:02',210,0,'57a61a7f-a2fe-11e5-994b-005056c00001',132),(132,'000033',129,2,'2015-12-15 14:40:12',210,0,'0204ec9d-a2ff-11e5-994b-005056c00001',132),(133,'000033',129,2,'2015-12-16 02:31:04',210,0,'53c557f4-a362-11e5-994b-005056c00001',132);
/*!40000 ALTER TABLE `o_surat_tujuan_disposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_catatan`
--

DROP TABLE IF EXISTS `view_catatan`;
/*!50001 DROP VIEW IF EXISTS `view_catatan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_catatan` AS SELECT 
 1 AS `nama`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_cetak_kartu`
--

DROP TABLE IF EXISTS `view_cetak_kartu`;
/*!50001 DROP VIEW IF EXISTS `view_cetak_kartu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_cetak_kartu` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `no_agenda`,
 1 AS `no_surat`,
 1 AS `pengirim`,
 1 AS `perihal`,
 1 AS `jenis_surat`,
 1 AS `alamat_pengirim`,
 1 AS `tujuan_surat`,
 1 AS `alamat_tujuan`,
 1 AS `isi`,
 1 AS `unit_tujuan_id`,
 1 AS `lampiran_id`,
 1 AS `unit_dari_id`,
 1 AS `prioritas`,
 1 AS `kualifikasi`,
 1 AS `tanggal_surat`,
 1 AS `date_created`,
 1 AS `status`,
 1 AS `jenis_disposisi_id`,
 1 AS `baca`,
 1 AS `jenis_disposisi`,
 1 AS `lampiran`,
 1 AS `nama_unit_dari`,
 1 AS `disposisi_ke`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_jenis_disposisi`
--

DROP TABLE IF EXISTS `view_jenis_disposisi`;
/*!50001 DROP VIEW IF EXISTS `view_jenis_disposisi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_jenis_disposisi` AS SELECT 
 1 AS `pesan`,
 1 AS `no_agenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tujuan_disposisi`
--

DROP TABLE IF EXISTS `view_tujuan_disposisi`;
/*!50001 DROP VIEW IF EXISTS `view_tujuan_disposisi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_tujuan_disposisi` AS SELECT 
 1 AS `surat_id`,
 1 AS `nama_unit`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'aspnet_eoffice'
--
/*!50003 DROP FUNCTION IF EXISTS `func_get_lampiran_surat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_lampiran_surat`(lampiran_id varchar(45)) RETURNS varchar(255) CHARSET utf8
BEGIN
DECLARE output VARCHAR(255);
SET output = (SELECT REPLACE(GROUP_CONCAT(DISTINCT CONCAT('<a target="_blank" href="',REPLACE(a.path,'~/','../../../'),'">','- ',a.nama_file,'</a>')),',','<br>') as lampiran FROM aspnet_eoffice.o_lampiran a where a.lampiran_id = lampiran_id limit 1);
RETURN output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_get_unit_disposisi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_unit_disposisi`(no_agenda char(10)) RETURNS varchar(255) CHARSET utf8
BEGIN
DECLARE nama_unit varchar(255);
SET nama_unit = (select REPLACE(GROUP_CONCAT(distinct CONCAT('- ',aspnet_eoffice.func_get_unit_name(unit_id))),',','<br>') as unit_id from aspnet_eoffice.o_surat_tujuan_disposisi where surat_id = no_agenda and set_awal = 1);
RETURN nama_unit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_get_unit_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_unit_name`(id char(10)) RETURNS varchar(100) CHARSET utf8
BEGIN
DECLARE nama_unit varchar(100);
SET nama_unit = (SELECT REPLACE(A.nama_unit,'-',' ') as nama_unit FROM aspnet_membership.app_unit A WHERE A.id = id limit 1);
RETURN nama_unit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_catatan`
--

/*!50001 DROP VIEW IF EXISTS `view_catatan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_catatan` AS select concat(`aspnet_eoffice`.`o_catatan`.`catatan`,'<br>','<small><i>',`aspnet_eoffice`.`func_get_unit_name`(`aspnet_eoffice`.`o_catatan`.`unit_id`),' - ',`aspnet_membership`.`func_get_username`(`aspnet_eoffice`.`o_catatan`.`user_id`),'</i></small>') AS `nama` from `aspnet_eoffice`.`o_catatan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_cetak_kartu`
--

/*!50001 DROP VIEW IF EXISTS `view_cetak_kartu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cetak_kartu` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`no_agenda` AS `no_agenda`,`a`.`no_surat` AS `no_surat`,`a`.`pengirim` AS `pengirim`,`a`.`perihal` AS `perihal`,`a`.`jenis_surat` AS `jenis_surat`,`a`.`alamat_pengirim` AS `alamat_pengirim`,`a`.`tujuan_surat` AS `tujuan_surat`,`a`.`alamat_tujuan` AS `alamat_tujuan`,`a`.`isi` AS `isi`,`a`.`unit_tujuan_id` AS `unit_tujuan_id`,`a`.`lampiran_id` AS `lampiran_id`,`a`.`unit_dari_id` AS `unit_dari_id`,`a`.`prioritas` AS `prioritas`,`a`.`kualifikasi` AS `kualifikasi`,`a`.`tanggal_surat` AS `tanggal_surat`,`a`.`date_created` AS `date_created`,`a`.`status` AS `status`,`a`.`jenis_disposisi_id` AS `jenis_disposisi_id`,`a`.`baca` AS `baca`,`a`.`jenis_disposisi` AS `jenis_disposisi`,`aspnet_eoffice`.`func_get_lampiran_surat`(`a`.`lampiran_id`) AS `lampiran`,`aspnet_eoffice`.`func_get_unit_name`(`a`.`unit_dari_id`) AS `nama_unit_dari`,`aspnet_eoffice`.`func_get_unit_disposisi`(`a`.`no_agenda`) AS `disposisi_ke` from `aspnet_eoffice`.`o_surat` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_jenis_disposisi`
--

/*!50001 DROP VIEW IF EXISTS `view_jenis_disposisi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_jenis_disposisi` AS select distinct `b`.`pesan` AS `pesan`,`a`.`no_agenda` AS `no_agenda` from (`o_jenis_disposisi` `a` left join `m_jenis_disposisi` `b` on((`a`.`jenis_disposisi_id` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tujuan_disposisi`
--

/*!50001 DROP VIEW IF EXISTS `view_tujuan_disposisi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tujuan_disposisi` AS select `aspnet_eoffice`.`o_surat_tujuan_disposisi`.`surat_id` AS `surat_id`,`aspnet_eoffice`.`func_get_unit_name`(`aspnet_eoffice`.`o_surat_tujuan_disposisi`.`unit_id`) AS `nama_unit` from `aspnet_eoffice`.`o_surat_tujuan_disposisi` */;
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

-- Dump completed on 2016-04-15 20:04:56
