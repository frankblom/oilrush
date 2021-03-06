# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18-0ubuntu0.16.04.1)
# Database: oil
# Generation Time: 2017-06-05 13:18:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name`, `flag`, `code`)
VALUES
	(1,'Iran','/img/flags/Iran.gif','N9TT-9G0A'),
	(2,'North-Korea','/img/flags/North_Korea.gif','QK6A-JI6S'),
	(3,'USA','/img/flags/United_States.gif','SXFP-CHYK'),
	(4,'Russia','/img/flags/Russia.gif','XNSS-HSJW'),
	(5,'Saudi-Arabia','/img/flags/Saudi_Arabia.gif','NHLE-L6MI');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(2,'2017_06_02_214513_create_tables',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oil
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oil`;

CREATE TABLE `oil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `lpm` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oil` WRITE;
/*!40000 ALTER TABLE `oil` DISABLE KEYS */;

INSERT INTO `oil` (`id`, `country_id`, `source_id`, `lpm`, `start`, `end`)
VALUES
	(34,3,4,5,'2017-06-05 11:33:48','2017-06-05 13:03:04'),
	(35,2,6,5,'2017-06-05 11:34:31','2017-06-05 12:35:46'),
	(36,4,3,15,'2017-06-05 11:34:46','2017-06-05 12:43:48'),
	(37,1,3,15,'2017-06-05 11:37:58','2017-06-05 12:58:39'),
	(38,5,2,10,'2017-06-05 11:38:10','2017-06-05 12:54:09'),
	(39,3,1,10,'2017-06-05 11:42:08','2017-06-05 12:43:46'),
	(40,4,4,5,'2017-06-05 11:42:40','2017-06-05 12:37:58'),
	(41,2,2,10,'2017-06-05 11:43:33','2017-06-05 12:33:57'),
	(42,3,3,15,'2017-06-05 11:43:47','2017-06-05 12:57:44'),
	(43,5,6,5,'2017-06-05 11:44:01','2017-06-05 13:07:56'),
	(44,2,3,15,'2017-06-05 11:47:10','2017-06-05 12:56:07'),
	(45,1,5,5,'2017-06-05 11:48:08','2017-06-05 12:29:47'),
	(46,5,4,5,'2017-06-05 11:48:51','2017-06-05 12:47:50'),
	(47,1,3,15,'2017-06-05 11:49:20','2017-06-05 11:58:18'),
	(48,3,6,5,'2017-06-05 11:51:02','2017-06-05 13:02:08'),
	(49,4,2,10,'2017-06-05 11:51:09','2017-06-05 13:11:10'),
	(50,5,3,15,'2017-06-05 11:54:15','2017-06-05 12:57:07'),
	(51,4,6,5,'2017-06-05 11:55:50','2017-06-05 13:10:18'),
	(52,3,2,10,'2017-06-05 11:56:36','2017-06-05 13:06:42'),
	(53,2,3,15,'2017-06-05 11:58:03',NULL),
	(54,1,1,10,'2017-06-05 11:58:18','2017-06-05 12:54:51'),
	(55,4,3,15,'2017-06-05 11:59:20',NULL),
	(56,3,6,5,'2017-06-05 11:59:27','2017-06-05 13:14:26'),
	(57,1,3,15,'2017-06-05 12:00:26','2017-06-05 12:05:18'),
	(58,5,5,5,'2017-06-05 12:01:12','2017-06-05 13:07:20'),
	(59,3,4,5,'2017-06-05 12:01:31',NULL),
	(60,5,3,15,'2017-06-05 12:04:16',NULL),
	(61,1,4,5,'2017-06-05 12:05:18','2017-06-05 12:09:32'),
	(62,3,3,15,'2017-06-05 12:05:25',NULL),
	(63,2,1,10,'2017-06-05 12:08:01','2017-06-05 12:21:32'),
	(64,1,3,15,'2017-06-05 12:08:33','2017-06-05 12:13:27'),
	(65,4,4,5,'2017-06-05 12:09:32','2017-06-05 13:13:22'),
	(66,2,3,15,'2017-06-05 12:11:15',NULL),
	(67,1,3,15,'2017-06-05 12:13:27',NULL),
	(68,4,6,5,'2017-06-05 12:14:32',NULL),
	(69,3,3,15,'2017-06-05 12:15:35',NULL),
	(70,2,4,5,'2017-06-05 12:17:41','2017-06-05 12:23:01'),
	(71,1,5,5,'2017-06-05 12:18:58',NULL),
	(72,1,3,15,'2017-06-05 12:20:06',NULL),
	(73,4,2,10,'2017-06-05 12:20:21',NULL),
	(74,3,6,5,'2017-06-05 12:20:34',NULL),
	(75,5,1,10,'2017-06-05 12:21:32','2017-06-05 12:29:11'),
	(76,4,6,5,'2017-06-05 12:22:32',NULL),
	(77,3,4,5,'2017-06-05 12:23:01',NULL),
	(78,2,2,10,'2017-06-05 12:24:54','2017-06-05 13:11:15'),
	(79,3,3,15,'2017-06-05 12:26:05',NULL),
	(80,4,4,5,'2017-06-05 12:26:35',NULL),
	(81,2,6,5,'2017-06-05 12:29:02',NULL),
	(82,1,1,10,'2017-06-05 12:29:11',NULL),
	(83,5,5,5,'2017-06-05 12:29:47',NULL),
	(84,1,3,15,'2017-06-05 12:30:59',NULL),
	(85,5,3,15,'2017-06-05 12:32:12',NULL),
	(86,4,2,10,'2017-06-05 12:33:57',NULL),
	(87,2,3,10,'2017-06-05 12:34:01',NULL),
	(88,1,3,10,'2017-06-05 12:35:03',NULL),
	(89,4,6,2,'2017-06-05 12:35:46',NULL),
	(90,3,1,15,'2017-06-05 12:36:43',NULL),
	(91,5,4,5,'2017-06-05 12:37:58','2017-06-05 13:11:29'),
	(92,3,3,10,'2017-06-05 12:39:02',NULL),
	(93,4,3,10,'2017-06-05 12:40:38',NULL),
	(94,3,6,2,'2017-06-05 12:41:46',NULL),
	(95,1,1,15,'2017-06-05 12:43:46',NULL),
	(96,3,3,10,'2017-06-05 12:43:48',NULL),
	(97,1,3,10,'2017-06-05 12:45:50',NULL),
	(98,5,2,10,'2017-06-05 12:46:08',NULL),
	(99,3,4,5,'2017-06-05 12:47:50',NULL),
	(100,2,5,10,'2017-06-05 12:49:17','2017-06-05 12:58:58'),
	(101,5,6,2,'2017-06-05 12:49:48',NULL),
	(102,2,3,10,'2017-06-05 12:52:09',NULL),
	(103,5,3,10,'2017-06-05 12:53:03',NULL),
	(104,3,2,10,'2017-06-05 12:54:09',NULL),
	(105,2,3,10,'2017-06-05 12:54:48',NULL),
	(106,4,1,15,'2017-06-05 12:54:51','2017-06-05 13:07:54'),
	(107,3,6,2,'2017-06-05 12:55:20',NULL),
	(108,5,3,10,'2017-06-05 12:56:07',NULL),
	(109,3,3,13,'2017-06-05 12:57:07',NULL),
	(110,1,3,13,'2017-06-05 12:57:44',NULL),
	(111,3,3,13,'2017-06-05 12:58:39',NULL),
	(112,5,5,12,'2017-06-05 12:58:58',NULL),
	(113,1,6,8,'2017-06-05 13:02:08','2017-06-05 13:05:15'),
	(114,5,4,5,'2017-06-05 13:03:04',NULL),
	(115,5,6,8,'2017-06-05 13:05:15',NULL),
	(116,4,2,25,'2017-06-05 13:06:42',NULL),
	(117,3,5,12,'2017-06-05 13:07:20',NULL),
	(118,2,1,10,'2017-06-05 13:07:54',NULL),
	(119,4,6,8,'2017-06-05 13:07:56',NULL),
	(120,3,6,8,'2017-06-05 13:10:18',NULL),
	(121,2,2,25,'2017-06-05 13:11:10',NULL),
	(122,1,2,25,'2017-06-05 13:11:15','2017-06-05 13:16:47'),
	(123,4,4,5,'2017-06-05 13:11:29',NULL),
	(124,3,4,5,'2017-06-05 13:13:22',NULL),
	(125,5,6,8,'2017-06-05 13:14:26',NULL),
	(126,5,2,0,'2017-06-05 13:16:47',NULL);

/*!40000 ALTER TABLE `oil` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(2) DEFAULT NULL,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `lpm` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;

INSERT INTO `sources` (`id`, `number`, `title`, `owner_id`, `lpm`, `code`)
VALUES
	(1,1,'Nairobi',2,0,'B7FQ-RANC'),
	(2,2,'Beijing',5,0,'7ETR-0A6C'),
	(3,3,'Tehran',3,0,'3NGU-8XTJ'),
	(4,4,'Yokohama',3,0,'4GE4-ETEV'),
	(5,5,'Casablanca',3,0,'33FI-XHV3'),
	(6,6,'Istanbul',5,0,'2YNV-3L4Y');

/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
