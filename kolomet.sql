-- --------------------------------------------------------
-- Hostitel:                     localhost
-- Verze serveru:                5.5.29 - MySQL Community Server (GPL)
-- OS serveru:                   Win64
-- HeidiSQL Verze:               8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportování struktury pro tabulka kolomet.application_permission
DROP TABLE IF EXISTS `APPLICATION_PERMISSION`;
CREATE TABLE IF NOT EXISTS `APPLICATION_PERMISSION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `PERMISSION_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_6mmupjr60urw0ywlj79mhc9dy` (`CREATED_ID`),
  KEY `FK_c5dwvyeqbenhloc2eptj10lok` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_6mmupjr60urw0ywlj79mhc9dy` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_c5dwvyeqbenhloc2eptj10lok` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_permission: ~27 rows (přibližně)
DELETE FROM `APPLICATION_PERMISSION`;
/*!40000 ALTER TABLE `APPLICATION_PERMISSION` DISABLE KEYS */;
INSERT INTO `APPLICATION_PERMISSION` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `PERMISSION_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(3, '2014-03-31 00:00:00', '2014-03-31 00:00:00', 0, 'per_applicationusers', 2, 2),
	(4, '2014-03-31 06:25:05', '2014-03-31 06:25:05', 0, 'per_sellers', 2, 2),
	(5, '2014-03-31 06:25:30', '2014-03-31 06:25:30', 0, 'per_sellerstatuses', 2, 2),
	(6, '2014-03-31 06:25:41', '2014-03-31 06:25:41', 0, 'per_regions', 2, 2),
	(7, '2014-03-31 06:25:52', '2014-03-31 06:25:52', 0, 'per_countrystates', 2, 2),
	(8, '2014-03-31 06:26:02', '2014-03-31 06:26:02', 0, 'per_products', 2, 2),
	(9, '2014-03-31 06:26:18', '2014-03-31 06:26:18', 0, 'per_productattributetypes', 2, 2),
	(10, '2014-03-31 06:26:28', '2014-03-31 06:26:28', 0, 'per_producers', 2, 2),
	(11, '2014-03-31 06:26:40', '2014-03-31 06:26:40', 0, 'per_categorys', 2, 2),
	(12, '2014-03-31 06:26:53', '2014-03-31 06:26:53', 0, 'per_categorytypes', 2, 2),
	(13, '2014-03-31 06:27:05', '2014-03-31 06:27:05', 0, 'per_newsitems', 2, 2),
	(14, '2014-04-14 20:51:53', '2014-04-14 20:51:53', 0, 'per_figureheights', 5, 5),
	(15, '2014-04-14 20:52:11', '2014-05-11 00:04:08', 1, 'per_bicyclecategories', 5, 2),
	(16, '2014-04-14 20:58:47', '2014-04-14 20:59:19', 1, 'per_productusages', 5, 5),
	(17, '2014-04-21 18:38:25', '2014-04-21 18:38:25', 0, 'per_products_all', 2, 2),
	(18, '2014-04-21 18:38:36', '2014-04-21 18:38:36', 0, 'per_products_own', 2, 2),
	(19, '2014-04-21 18:39:31', '2014-04-21 18:39:31', 0, 'per_sellers_all', 2, 2),
	(20, '2014-04-21 18:39:39', '2014-04-21 18:39:39', 0, 'per_sellers_own', 2, 2),
	(21, '2014-05-13 00:13:59', '2014-05-13 00:14:34', 1, 'per_registrationrequests', 2, 2),
	(22, '2014-05-18 00:55:50', '2014-05-18 00:55:50', 0, 'per_productcolors', 2, 2),
	(23, '2014-05-21 01:45:44', '2014-05-21 01:45:44', 0, 'per_test', 5, 5),
	(24, '2014-06-24 00:27:52', '2014-06-24 00:27:52', 0, 'per_places', 2, 2),
	(25, '2014-06-24 00:28:01', '2014-06-24 00:28:01', 0, 'per_places_all', 2, 2),
	(26, '2014-06-24 00:28:07', '2014-06-24 00:28:07', 0, 'per_places_own', 2, 2),
	(27, '2014-07-29 22:05:07', '2014-08-23 15:35:22', 1, 'per_placetypes', 2, 2),
	(28, '2014-08-23 15:33:01', '2014-08-23 15:33:01', 0, 'per_applicationusers_all', 2, 2),
	(29, '2014-08-23 15:33:08', '2014-08-23 15:33:08', 0, 'per_applicationusers_own', 2, 2);
/*!40000 ALTER TABLE `APPLICATION_PERMISSION` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_role
DROP TABLE IF EXISTS `APPLICATION_ROLE`;
CREATE TABLE IF NOT EXISTS `APPLICATION_ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ROLE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_kyavgp495u0hx0ccnfdxra6oe` (`CREATED_ID`),
  KEY `FK_apkcgpjmemvnsc1brda4et6cx` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_apkcgpjmemvnsc1brda4et6cx` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_kyavgp495u0hx0ccnfdxra6oe` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_role: ~4 rows (přibližně)
DELETE FROM `APPLICATION_ROLE`;
/*!40000 ALTER TABLE `APPLICATION_ROLE` DISABLE KEYS */;
INSERT INTO `APPLICATION_ROLE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ROLE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(3, '2014-03-31 00:00:00', '2014-08-23 15:36:24', 10, 'role_admin', 2, 2),
	(4, '2014-03-31 06:24:02', '2014-08-23 15:36:37', 5, 'role_seller', 2, 2),
	(5, '2014-06-24 00:28:21', '2014-07-24 23:49:00', 2, 'role_user', 2, 2),
	(8, '2014-07-25 07:21:49', '2014-07-29 22:05:54', 1, 'role_placeown', 5, 2);
/*!40000 ALTER TABLE `APPLICATION_ROLE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_role_permission
DROP TABLE IF EXISTS `APPLICATION_ROLE_PERMISSION`;
CREATE TABLE IF NOT EXISTS `APPLICATION_ROLE_PERMISSION` (
  `ROLE_ID` bigint(20) NOT NULL,
  `PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK_l467vw6jhwo522b3ef8ovgkor` (`PERMISSION_ID`),
  KEY `FK_msjrjy23nvkle00037evqd9ef` (`ROLE_ID`),
  CONSTRAINT `FK_l467vw6jhwo522b3ef8ovgkor` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `APPLICATION_PERMISSION` (`ID`),
  CONSTRAINT `FK_msjrjy23nvkle00037evqd9ef` FOREIGN KEY (`ROLE_ID`) REFERENCES `APPLICATION_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_role_permission: ~31 rows (přibližně)
DELETE FROM `APPLICATION_ROLE_PERMISSION`;
/*!40000 ALTER TABLE `APPLICATION_ROLE_PERMISSION` DISABLE KEYS */;
INSERT INTO `APPLICATION_ROLE_PERMISSION` (`ROLE_ID`, `PERMISSION_ID`) VALUES
	(5, 24),
	(5, 26),
	(8, 24),
	(8, 26),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(3, 15),
	(3, 16),
	(3, 17),
	(3, 19),
	(3, 21),
	(3, 22),
	(3, 24),
	(3, 25),
	(3, 27),
	(3, 28),
	(4, 4),
	(4, 8),
	(4, 18),
	(4, 20),
	(4, 29);
/*!40000 ALTER TABLE `APPLICATION_ROLE_PERMISSION` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_user
DROP TABLE IF EXISTS `APPLICATION_USER`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONDITION_AGREEMENT` datetime DEFAULT NULL,
  `CONDITION_VERSION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `ENABLED` bit(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PHONE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SURNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `NICKNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ot68oi4hpc4jt6fkayj6f4qxc` (`CREATED_ID`),
  KEY `FK_48416r9emtcor7pdprhgg1w1d` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_48416r9emtcor7pdprhgg1w1d` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_ot68oi4hpc4jt6fkayj6f4qxc` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_user: ~19 rows (přibližně)
DELETE FROM `APPLICATION_USER`;
/*!40000 ALTER TABLE `APPLICATION_USER` DISABLE KEYS */;
INSERT INTO `APPLICATION_USER` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONDITION_AGREEMENT`, `CONDITION_VERSION`, `ENABLED`, `NAME`, `PASSWORD`, `PHONE`, `SURNAME`, `TOKEN`, `USERNAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `NICKNAME`) VALUES
	(2, '2014-03-31 00:00:00', '2014-10-05 13:09:34', 2, NULL, NULL, b'1', 'Jiří', '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, 'Slovák', NULL, 'jiri.slovak@gmail.com', NULL, 2, 'slovi'),
	(3, '2014-03-31 07:06:47', '2014-03-31 07:06:47', 0, NULL, NULL, b'1', NULL, 'b39237b81c337166524f3adf2d94a7f5ad8bb2f5', NULL, NULL, NULL, 'jiri.slovak@generali.cz', NULL, NULL, NULL),
	(4, '2014-03-31 07:13:54', '2014-03-31 07:13:54', 0, NULL, NULL, b'1', NULL, '313514ee4cd8eb5d583c0ea5a00dbb9d7d6c285b', NULL, NULL, NULL, 'kola@seznam.cz', NULL, NULL, NULL),
	(5, '2014-03-31 07:14:20', '2014-07-13 18:45:21', 10, NULL, NULL, b'1', NULL, '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', NULL, NULL, NULL, 'ales.radomersky@gmail.com', NULL, 2, NULL),
	(6, '2014-03-31 07:15:55', '2014-10-05 12:12:59', 3, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL),
	(7, '2014-05-18 22:19:21', '2014-05-18 22:19:21', 0, NULL, NULL, b'1', NULL, '2bc6038c3dfca09b2da23c8b6da8ba884dc2dcc2', NULL, NULL, NULL, 'tomas.radomersky@gmail.com', 5, 5, NULL),
	(14, '2014-05-24 17:57:20', '2014-05-24 17:57:20', 0, NULL, NULL, b'1', NULL, '7ea91fc33cc7d0133a9e99c52dfc6bd6068991e0', NULL, NULL, NULL, 'jitka', 6, 6, NULL),
	(15, '2014-05-26 21:51:06', '2014-05-26 21:51:06', 1, NULL, NULL, b'1', NULL, 'aac933bf0488a15cea45ef12df5322a3e12d7e85', NULL, NULL, NULL, '', 6, 6, NULL),
	(16, '2014-06-02 21:08:19', '2014-06-03 20:13:29', 2, NULL, NULL, b'1', NULL, '14730548f0e111b267cad18b136a7f58c9523535', NULL, NULL, NULL, 'radomerska@seznam.cz', 5, 5, NULL),
	(18, '2014-06-15 21:02:22', '2014-06-15 21:02:22', 1, NULL, NULL, b'1', NULL, '3a7c7c9b69c6b6b5841ad2c12150ad5b0e3bc7db', NULL, NULL, NULL, 'michaela.radomerska@gmail.com', 5, 5, NULL),
	(21, '2014-07-25 00:13:18', '2014-07-30 20:33:28', 8, NULL, NULL, b'1', NULL, 'b39237b81c337166524f3adf2d94a7f5ad8bb2f5', NULL, NULL, NULL, 'jiri.kratonoha@gmail.com', 2, 2, NULL),
	(22, '2014-09-08 04:58:58', '2014-09-08 04:58:58', 0, NULL, NULL, b'1', NULL, '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, NULL, NULL, 'slovi', NULL, NULL, NULL),
	(23, '2014-09-20 17:43:11', '2014-09-20 17:43:11', 0, NULL, NULL, b'1', NULL, 'e24025da981ce83a66d30cd90d9a77925fbfcd22', NULL, NULL, NULL, 'Petr', NULL, NULL, NULL),
	(24, '2014-09-20 17:56:08', '2014-09-20 18:07:55', 3, NULL, NULL, b'1', NULL, 'e4e0c8b747716f72bb2775c01a81ebd79a9ab9c3', NULL, NULL, NULL, 'al_rad@post.cz', 5, 5, NULL),
	(25, '2014-09-27 11:24:31', '2014-09-27 11:24:31', 0, NULL, NULL, b'1', NULL, '59bd0a3ff43b32849b319e645d4798d8a5d1e889', NULL, NULL, NULL, 'info@kolomet.cz', NULL, NULL, NULL),
	(26, '2014-10-01 07:23:16', '2014-10-01 07:23:16', 0, NULL, NULL, b'0', 'Vít', '0b4311e4bd7b72b66cf685a07a9ac76f934ba8a7', NULL, 'Ratislav', NULL, 'vit.ratislav@seznam.cz', NULL, NULL, NULL),
	(27, '2014-10-04 22:36:41', '2014-10-04 22:36:41', 0, NULL, NULL, b'0', 'Jiří', '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, 'Slovák', NULL, 'jiri.slovak@cli.cz', NULL, NULL, 'slovi'),
	(32, '2014-10-05 02:10:35', '2014-10-05 02:10:35', 0, NULL, NULL, b'1', NULL, '2679522dc982fb82440d9d7c3f588437a8723a11', NULL, NULL, NULL, 'test', 2, 2, NULL),
	(33, '2014-10-05 02:13:52', '2014-10-05 02:13:52', 0, NULL, NULL, b'1', NULL, 'c04382d04fb2a5f5a64dc6f99858ee5ec7c64163', NULL, NULL, NULL, 'jiri.slovak@gmail.czc', 2, 2, NULL),
	(34, '2014-10-05 12:50:56', '2014-10-05 12:50:56', 0, NULL, NULL, b'1', 'test', '6f3494baf7ff1be44d2fea02ed14960f164b0db0', NULL, 'test', NULL, 'test@test.cz', 2, 2, 'test');
/*!40000 ALTER TABLE `APPLICATION_USER` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_user_address
DROP TABLE IF EXISTS `APPLICATION_USER_ADDRESS`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ADDRESS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ADDRESS_TYPE` int(11) DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `DEGREE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `HOUSE_NR` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `POST_CODE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SALUTATION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `STREET` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `APPLICATION_USER_ID` bigint(20) DEFAULT NULL,
  `COUNTRY_STATE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_r7bbccy3owg6qmctbr03te1tb` (`CREATED_ID`),
  KEY `FK_kympp6yykvtws3v1k619bids4` (`LAST_MODIFIED_ID`),
  KEY `FK_1lkhdy5ej6aur9985jqfh8pxs` (`APPLICATION_USER_ID`),
  KEY `FK_tier8ryaokcxl0o9fgoh4p5wa` (`COUNTRY_STATE_ID`),
  CONSTRAINT `FK_1lkhdy5ej6aur9985jqfh8pxs` FOREIGN KEY (`APPLICATION_USER_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_kympp6yykvtws3v1k619bids4` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_r7bbccy3owg6qmctbr03te1tb` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_tier8ryaokcxl0o9fgoh4p5wa` FOREIGN KEY (`COUNTRY_STATE_ID`) REFERENCES `COUNTRY_STATE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_user_address: ~25 rows (přibližně)
DELETE FROM `APPLICATION_USER_ADDRESS`;
/*!40000 ALTER TABLE `APPLICATION_USER_ADDRESS` DISABLE KEYS */;
INSERT INTO `APPLICATION_USER_ADDRESS` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ADDRESS_TYPE`, `CITY`, `DEGREE`, `EMAIL`, `HOUSE_NR`, `NAME`, `PHONE_NUMBER`, `POST_CODE`, `SALUTATION`, `STREET`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`, `COUNTRY_STATE_ID`) VALUES
	(41, NULL, NULL, NULL, 1, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', '', '40331', 'pan', 'Na Výšině 494\r\nHHHhh\r\nGGGgg', NULL, NULL, NULL, 1),
	(42, NULL, NULL, NULL, 2, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', NULL, NULL, NULL, 1),
	(43, NULL, NULL, NULL, 1, 'Praha', 'Bc.', 'frata.pod@kola.cz', NULL, 'František Podlaha', '', '15000', 'pan', 'Bělehradská', NULL, NULL, 4, 1),
	(44, NULL, NULL, NULL, 2, 'Praha', 'Bc.', 'frata.pod@kola.cz', NULL, 'František Podlaha', '606213456', '15000', 'pan', 'Bělehradská', NULL, NULL, 4, 1),
	(45, NULL, NULL, NULL, 1, '', '', '', NULL, '', '', '', '', '', NULL, NULL, 5, 1),
	(46, NULL, NULL, NULL, 2, 'Rychlov', '', '', NULL, '', '', '99999', '', 'Rychlová 16', NULL, NULL, 5, 1),
	(47, NULL, NULL, NULL, 1, '', '', '', NULL, '', '', '', '', '', NULL, NULL, 7, 1),
	(48, NULL, NULL, NULL, 2, 'Prague', '', 'al_rad@post.cz', NULL, '', '', '33901', '', 'Černická 16', NULL, NULL, 7, 1),
	(49, NULL, NULL, NULL, 1, 'Plzeň', 'ing.', 'dezo.kotlar@kolaplzen2.cz', NULL, 'Dežo Kotlár', '', '32600', 'pan', 'Nepomucká 8', NULL, NULL, 26, 1),
	(50, NULL, NULL, NULL, 2, 'Plzeň', '', 'info@kolaplzen.cz', NULL, 'Kola Plzeň 2', '222333111', '32600', '', 'Slovanská 3', NULL, NULL, 26, 1),
	(51, NULL, NULL, NULL, 1, 'KAměsto', 'KAtitul', 'KAemail@email.cz', NULL, 'KAjméno', '', '22222', 'KAoslovení', 'KAulice', NULL, NULL, 14, 1),
	(52, NULL, NULL, NULL, 2, 'Pměsto', 'Ptitul', 'Pemail@email.cz', NULL, 'Pnázev', '111111111', '11115', 'Poslovení', 'Pulice', NULL, NULL, 14, 1),
	(53, NULL, NULL, NULL, 1, 'KAměsto', 'KAtitul', 'KAemail@seznam.cz', NULL, 'KAjméno', '', '22222', 'KAoslovení', 'KAulice', NULL, NULL, 15, 1),
	(54, NULL, NULL, NULL, 2, 'Pměsto', 'Ptitul', 'Pemail@seznam.cz', NULL, 'Pnázev', '+420111111111', '111111', 'Poslovení', 'Pulice', NULL, NULL, 15, 1),
	(55, NULL, NULL, NULL, 1, '', '', 'radomerska@seznam.cz', NULL, '', '', '', '', '', NULL, NULL, 16, 1),
	(56, NULL, NULL, NULL, 2, 'Praha 10', 'Ing.', 'al_rad@post.cz', NULL, 'CYKLO LENKA', '724216728', '10000', 'Paní', 'Černická 16', NULL, NULL, 16, 1),
	(57, NULL, NULL, NULL, 1, 'Praha', '', 'michaela.radomerska@gmail.com', NULL, 'Míša cyclo', '', '11111', 'Slečna', 'Pražská', NULL, NULL, 3, 1),
	(58, NULL, NULL, NULL, 2, 'Praha', '', 'al_rad@post.cz', NULL, 'Misa cyclo', '111222333', '111111', 'Slečna', 'Pražská', NULL, NULL, 3, 1),
	(59, NULL, NULL, NULL, 1, 'Praha', '', 'michaela.radomerska@gmail.com', NULL, 'Miška jméno', '', '10000', 'Slečna', 'Černická 16', NULL, NULL, 18, 1),
	(60, NULL, NULL, NULL, 2, 'Praha', '', 'al_rad@post.cz', NULL, 'KOLO Myška', '222666222', '10000', 'Slečna', 'Černická 16', NULL, NULL, 18, 1),
	(61, NULL, NULL, 0, 0, 'Ústí nad Labem', NULL, NULL, 494, NULL, NULL, '50002', NULL, 'Na Výšině', NULL, NULL, 27, 1),
	(64, NULL, NULL, 0, 1, 'test', 'test', 'test', NULL, 'tes', NULL, 'test', 'test', 'test', NULL, NULL, 32, 1),
	(65, NULL, NULL, 0, 2, 'test', 'test', 'test', NULL, 'test', '606034523', 'test', 'test', 'test', NULL, NULL, 32, 1),
	(66, NULL, NULL, 0, 1, '', '', 'jiri.slovak@gmail.czc', NULL, 'tes', NULL, '', '', 'test', NULL, NULL, 33, 1),
	(67, NULL, NULL, 0, 2, '', '', 'test', NULL, '', '', '', '', 'test', NULL, NULL, 33, 1),
	(68, NULL, NULL, 0, 1, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', NULL, '40331', 'pan', 'Na Výšině 494\r\nHHHhh\r\nGGGgg', NULL, NULL, NULL, 1),
	(69, NULL, NULL, 0, 2, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', NULL, NULL, NULL, 1),
	(70, NULL, NULL, 0, 1, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', NULL, '40331', 'pan', 'Na Výšině 494\r\nHHHhh\r\nGGGgg', NULL, NULL, NULL, 1),
	(71, NULL, NULL, 0, 2, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', NULL, NULL, NULL, 1),
	(72, NULL, NULL, 0, 1, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', NULL, '40331', 'pan', 'Na Výšině 494\r\nHHHhh\r\nGGGgg', NULL, NULL, 6, 1),
	(73, NULL, NULL, 0, 2, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', NULL, 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', NULL, NULL, 6, 1);
/*!40000 ALTER TABLE `APPLICATION_USER_ADDRESS` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_user_photo
DROP TABLE IF EXISTS `APPLICATION_USER_PHOTO`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER_PHOTO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT_TYPE` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `APPLICATION_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oftbtl900i2xutpnneehx2h5d` (`CREATED_ID`),
  KEY `FK_srjii7bqdp9emnug5c7043d4x` (`LAST_MODIFIED_ID`),
  KEY `FK_ny675dekdd2rk8ujtc6nmqea8` (`APPLICATION_USER_ID`),
  CONSTRAINT `FK_ny675dekdd2rk8ujtc6nmqea8` FOREIGN KEY (`APPLICATION_USER_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_oftbtl900i2xutpnneehx2h5d` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_srjii7bqdp9emnug5c7043d4x` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_user_photo: ~3 rows (přibližně)
DELETE FROM `APPLICATION_USER_PHOTO`;
/*!40000 ALTER TABLE `APPLICATION_USER_PHOTO` DISABLE KEYS */;
INSERT INTO `APPLICATION_USER_PHOTO` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
	(1, '2014-09-08 04:58:58', '2014-09-08 04:58:58', 0, 'image/jpeg', 'Koala.jpg', NULL, NULL, 22),
	(2, '2014-09-27 11:24:31', '2014-09-27 11:24:31', 0, 'image/jpeg', 'IMAG0507.jpg', NULL, NULL, 25),
	(3, '2014-10-04 22:36:41', '2014-10-04 22:36:41', 0, 'image/jpeg', 'logo.jpg', NULL, NULL, 27),
	(4, '2014-10-05 12:50:56', '2014-10-05 12:50:56', 0, 'image/jpeg', 'logo.jpg', 2, 2, 34),
	(5, '2014-10-05 13:01:59', '2014-10-05 13:01:59', 0, 'image/jpeg', 'logo.jpg', 2, 2, 2);
/*!40000 ALTER TABLE `APPLICATION_USER_PHOTO` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.application_user_role
DROP TABLE IF EXISTS `APPLICATION_USER_ROLE`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ROLE` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK_fvy2dr55uu61y45vcl97u336y` (`ROLE_ID`),
  KEY `FK_21d31gwey0t8tqpkt3jjsca74` (`USER_ID`),
  CONSTRAINT `FK_21d31gwey0t8tqpkt3jjsca74` FOREIGN KEY (`USER_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_fvy2dr55uu61y45vcl97u336y` FOREIGN KEY (`ROLE_ID`) REFERENCES `APPLICATION_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.application_user_role: ~19 rows (přibližně)
DELETE FROM `APPLICATION_USER_ROLE`;
/*!40000 ALTER TABLE `APPLICATION_USER_ROLE` DISABLE KEYS */;
INSERT INTO `APPLICATION_USER_ROLE` (`USER_ID`, `ROLE_ID`) VALUES
	(3, 4),
	(4, 4),
	(7, 4),
	(14, 4),
	(15, 4),
	(16, 4),
	(18, 4),
	(5, 3),
	(21, 5),
	(22, 5),
	(23, 5),
	(24, 8),
	(25, 5),
	(26, 5),
	(27, 5),
	(32, 4),
	(33, 4),
	(34, 3),
	(2, 3);
/*!40000 ALTER TABLE `APPLICATION_USER_ROLE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.bicycle_category
DROP TABLE IF EXISTS `BICYCLE_CATEGORY`;
CREATE TABLE IF NOT EXISTS `BICYCLE_CATEGORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_hp1u6dy2x0gyohvkmgnfe1lub` (`CREATED_ID`),
  KEY `FK_q34d2355sptbvsiehbbhotfb6` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_hp1u6dy2x0gyohvkmgnfe1lub` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_q34d2355sptbvsiehbbhotfb6` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.bicycle_category: ~4 rows (přibližně)
DELETE FROM `BICYCLE_CATEGORY`;
/*!40000 ALTER TABLE `BICYCLE_CATEGORY` DISABLE KEYS */;
INSERT INTO `BICYCLE_CATEGORY` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-05-11 00:04:42', '2014-05-11 00:04:42', 0, 'Pánské', 'bcat_man', NULL, 2, 2),
	(2, '2014-05-11 00:04:53', '2014-05-11 00:04:53', 0, 'Dámské', 'bcat_woman', NULL, 2, 2),
	(3, '2014-05-11 00:05:02', '2014-05-11 00:05:02', 0, 'Dětské', 'bcat_child', NULL, 2, 2),
	(4, '2014-05-24 13:52:01', '2014-05-24 13:57:44', 2, 'Pánské/Dámské', 'bcat_all', NULL, 5, 5);
/*!40000 ALTER TABLE `BICYCLE_CATEGORY` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.category
DROP TABLE IF EXISTS `CATEGORY`;
CREATE TABLE IF NOT EXISTS `CATEGORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_TYPE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_23xgluwltibdgxigv1vcqsxm7` (`CREATED_ID`),
  KEY `FK_btpmok2rj7ti0a2rj9bk4ie3d` (`LAST_MODIFIED_ID`),
  KEY `FK_hybvs6iml7t18iq3u4hc0ui8s` (`CATEGORY_TYPE_ID`),
  CONSTRAINT `FK_23xgluwltibdgxigv1vcqsxm7` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_btpmok2rj7ti0a2rj9bk4ie3d` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_hybvs6iml7t18iq3u4hc0ui8s` FOREIGN KEY (`CATEGORY_TYPE_ID`) REFERENCES `CATEGORY_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.category: ~18 rows (přibližně)
DELETE FROM `CATEGORY`;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `CREATED_ID`, `LAST_MODIFIED_ID`, `CATEGORY_TYPE_ID`) VALUES
	(2, NULL, NULL, 0, 'Horská kola', 'cat_bike_mountain', NULL, NULL, 1),
	(5, NULL, NULL, 0, 'Celoodpružená kola', 'cat_bike_freeride', NULL, NULL, 1),
	(6, NULL, '2014-05-06 18:15:23', 1, 'Krosová a trekingová kola', 'cat_bike_cross', NULL, 5, 1),
	(8, NULL, NULL, 0, 'Dětská kola a odrážedla', 'cat_bike_children', NULL, NULL, 1),
	(9, NULL, NULL, 0, 'Koloběžky', 'cat_bike_scooter', NULL, NULL, 1),
	(10, NULL, NULL, 0, 'Elektrokola', 'cat_bike_electric', NULL, NULL, 1),
	(11, NULL, NULL, 0, 'Silniční kola', 'cat_bike_road', NULL, NULL, 1),
	(12, '2014-05-06 18:17:03', '2014-05-06 18:17:03', 0, 'Cyklokrosová kola', 'cat_bike_cyclocross', 5, 5, 1),
	(13, '2014-05-06 18:17:41', '2014-05-06 18:17:41', 0, 'Jednokolky', 'cat_bike_onecyclo', 5, 5, 1),
	(14, '2014-05-06 18:18:15', '2014-05-06 18:18:15', 0, 'Sjezdová kola', 'cat_bike_downhill', 5, 5, 1),
	(15, '2014-05-06 18:18:55', '2014-05-06 18:18:55', 0, 'Freeride-Dirt', 'cat_bike_reeride', 5, 5, 1),
	(16, '2014-05-06 18:19:18', '2014-05-06 18:19:18', 0, 'Fitness kola', 'cat_bike_fitness', 5, 5, 1),
	(17, '2014-05-06 18:19:51', '2014-05-06 18:19:51', 0, 'Tandemová kola', 'cat_bike_tandem', 5, 5, 1),
	(18, '2014-05-06 18:20:18', '2014-05-06 18:20:18', 0, 'Městská kola', 'cat_bike_city', 5, 5, 1),
	(19, '2014-05-06 18:20:49', '2014-05-06 18:20:49', 0, 'Skládací kola', 'cat_bike_folding', 5, 5, 1),
	(20, '2014-05-06 18:21:09', '2014-05-06 18:21:09', 0, 'Testovací kola', 'cat_bike_testing', 5, 5, 1),
	(21, '2014-05-06 18:21:57', '2014-05-06 18:21:57', 0, 'Tříkolky', 'cat_bike_tricycle', 5, 5, 1),
	(22, '2014-05-06 18:22:22', '2014-05-06 18:22:22', 0, 'BMX kola', 'cat_bike_BMX', 5, 5, 1);
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.category_type
DROP TABLE IF EXISTS `CATEGORY_TYPE`;
CREATE TABLE IF NOT EXISTS `CATEGORY_TYPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tcg900co137gb1ojjnsq0kqgk` (`CREATED_ID`),
  KEY `FK_g9f8yev3stq33vdfhjv62k1px` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_g9f8yev3stq33vdfhjv62k1px` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_tcg900co137gb1ojjnsq0kqgk` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.category_type: ~2 rows (přibližně)
DELETE FROM `CATEGORY_TYPE`;
/*!40000 ALTER TABLE `CATEGORY_TYPE` DISABLE KEYS */;
INSERT INTO `CATEGORY_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, NULL, NULL, 0, 'Kola', 'cattype_bike', NULL, NULL, NULL),
	(2, NULL, NULL, 1, 'Ostatní', 'cattype_other', NULL, NULL, NULL);
/*!40000 ALTER TABLE `CATEGORY_TYPE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.country_state
DROP TABLE IF EXISTS `COUNTRY_STATE`;
CREATE TABLE IF NOT EXISTS `COUNTRY_STATE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_t2jxuvyhrbg179egfqgoloigr` (`CREATED_ID`),
  KEY `FK_2pmgyopqb0clmuanf77vq4wke` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_2pmgyopqb0clmuanf77vq4wke` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_t2jxuvyhrbg179egfqgoloigr` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.country_state: ~1 rows (přibližně)
DELETE FROM `COUNTRY_STATE`;
/*!40000 ALTER TABLE `COUNTRY_STATE` DISABLE KEYS */;
INSERT INTO `COUNTRY_STATE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, NULL, NULL, 1, 'Česká republika', 'cs_cz', NULL, NULL, NULL);
/*!40000 ALTER TABLE `COUNTRY_STATE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.figure_height
DROP TABLE IF EXISTS `FIGURE_HEIGHT`;
CREATE TABLE IF NOT EXISTS `FIGURE_HEIGHT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_am3bpj3iq9bekg17r0twhfjrk` (`CREATED_ID`),
  KEY `FK_b1o7nvqwlnfv7nlhk3s9ow62d` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_am3bpj3iq9bekg17r0twhfjrk` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_b1o7nvqwlnfv7nlhk3s9ow62d` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.figure_height: ~10 rows (přibližně)
DELETE FROM `FIGURE_HEIGHT`;
/*!40000 ALTER TABLE `FIGURE_HEIGHT` DISABLE KEYS */;
INSERT INTO `FIGURE_HEIGHT` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-04-14 20:55:40', '2014-04-14 20:55:40', 0, 'do 90 cm', 'fheight_90', NULL, 5, 5),
	(2, '2014-04-14 20:55:56', '2014-04-14 20:55:56', 0, '91 - 100 cm', 'fheight_100', NULL, 5, 5),
	(4, '2014-04-14 20:56:31', '2014-05-03 17:49:23', 1, '101 - 115 cm', 'fheight_115', NULL, 5, 5),
	(6, '2014-04-14 20:57:12', '2014-05-03 17:49:37', 1, '116 - 130 cm', 'fheight_130', NULL, 5, 5),
	(7, '2014-04-14 20:57:29', '2014-05-03 17:53:38', 2, '131 - 145 cm', 'fheight_145', NULL, 5, 5),
	(8, '2014-05-03 17:43:12', '2014-05-03 17:54:01', 5, '146 - 160 cm', 'fheight_160', NULL, 5, 5),
	(9, '2014-05-03 17:44:55', '2014-05-03 17:54:20', 3, '161 - 175 cm', 'fheight_175', NULL, 5, 5),
	(10, '2014-05-03 17:46:37', '2014-05-03 17:54:38', 4, '176 - 190 cm', 'fheight_190', NULL, 5, 5),
	(11, '2014-05-03 17:47:12', '2014-05-03 17:55:18', 3, '191 - 205 cm', 'fheight_205', NULL, 5, 5),
	(12, '2014-05-03 17:55:41', '2014-05-03 17:55:41', 0, 'nad 205 cm', 'fheight_more205', NULL, 5, 5);
/*!40000 ALTER TABLE `FIGURE_HEIGHT` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.news_item
DROP TABLE IF EXISTS `NEWS_ITEM`;
CREATE TABLE IF NOT EXISTS `NEWS_ITEM` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL,
  `NEWS_ITEM_DATE` datetime DEFAULT NULL,
  `NEWS_ITEM_TYPE` int(11) DEFAULT NULL,
  `TEXT` longtext COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_loc6p9w7owyae6emyuaakrvbu` (`CREATED_ID`),
  KEY `FK_htwlgse9e60unyni021stcgmw` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_htwlgse9e60unyni021stcgmw` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_loc6p9w7owyae6emyuaakrvbu` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.news_item: ~15 rows (přibližně)
DELETE FROM `NEWS_ITEM`;
/*!40000 ALTER TABLE `NEWS_ITEM` DISABLE KEYS */;
INSERT INTO `NEWS_ITEM` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ENABLED`, `NEWS_ITEM_DATE`, `NEWS_ITEM_TYPE`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-07-23 23:21:07', '2014-05-30 01:25:27', 5, b'1', '2014-04-01 00:00:00', 0, 'Spuštění webu kolomet. Web specializovaný na prodej kol od profesionálů na českém trhu.', 2, 2),
	(2, '2014-07-23 23:21:07', '2014-05-30 01:25:35', 3, b'1', '2014-03-10 00:00:00', 0, 'Zacal vyvoj na webu kolomet.cz', 2, 2),
	(3, '2014-07-23 23:21:07', '2014-05-30 01:25:45', 5, b'1', '2014-03-27 00:00:00', 0, 'Upraveny detail prodejce a produktu', 2, 2),
	(4, '2014-07-23 23:21:07', '2014-03-31 07:09:38', 4, b'1', '2014-03-30 00:00:00', 1, 'Tady je klientů :-)', 2, 2),
	(5, '2014-03-31 07:10:21', '2014-05-30 01:25:16', 1, b'1', '2014-03-31 00:00:00', 0, 'Prvni verze zabezpeceni je hotova. Jeste chybi osetrit, ze prodejci vidi pouze sve inzeraty a informace.', 2, 2),
	(6, '2014-05-04 09:36:00', '2014-05-30 01:25:05', 1, b'1', '2014-05-04 09:35:00', 0, ' Zapsání novinky ... bez baneru', 5, 2),
	(11, '2014-05-19 03:33:49', '2014-06-02 22:46:26', 10, b'1', '2014-04-01 00:00:00', 1, '<div><img alt="" src="/kolomet/file/newsitem/11/IMG_9855_orig.jpg" /></div><div><br /></div>', 5, 5),
	(14, '2014-05-30 07:13:44', '2014-06-16 05:57:56', 10, b'1', '2014-05-30 07:12:00', 1, '<div><br /></div><div><a href="http://www.maxbike.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/14/MaxByke177pix1_orig.jpg" /></a></div><div><br /></div>', 5, 5),
	(15, '2014-05-30 07:18:04', '2014-06-02 22:34:25', 2, b'0', '2014-05-30 07:17:00', 1, '<br />', 5, 5),
	(16, '2014-06-02 21:14:42', '2014-06-15 13:43:17', 4, b'0', '2014-06-02 21:14:00', 1, ' <img alt="" src="/kolomet/file/newsitem/16/IMG_6438_orig.jpg" />', 5, 5),
	(17, '2014-06-02 22:33:26', '2014-06-02 22:33:26', 0, b'1', '2014-06-02 22:32:00', 0, 'Tak máme novou verzi aplikace a již jsme zase o pořádný kus cesty blíže k finálnímu vzhledu !!!!<div>Děkujeme za podporu.</div><div>Váš KOLOMET TEAM</div>', 5, 5),
	(19, '2014-06-03 17:13:33', '2014-06-15 13:43:54', 3, b'0', '2014-06-03 17:12:00', 1, 'Klikací <div><a href="http://www.seznam.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/19/IMG_6438_orig.jpg" /></a></div>', 5, 5),
	(20, '2014-06-15 11:57:40', '2014-06-16 06:02:22', 1, b'1', '2014-06-15 11:56:00', 0, 'Aktuálně je nasazena předfinální verze, kde je již jen nutné dodělat několik maličkostí. Nyní se zaměříme na zajímavá místa. ', 5, 5),
	(23, '2014-06-15 12:17:53', '2014-06-16 05:25:45', 25, b'1', '2014-06-15 12:17:00', 1, ' <div><a href="http://buk02.vas-server.cz/kolomet/public/intro/index" target="_blank"><img alt="" src="/kolomet/file/newsitem/23/LOGOREKLAMA15mm1_orig.jpg" /></a></div>\r\n', 5, 5),
	(24, '2014-06-15 13:19:56', '2014-06-15 13:29:34', 7, b'1', '2014-06-15 08:18:00', 1, '<div><a href="http://www.prodejkol.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/24/MegaBike177pix1_orig.jpg" /></a></div>', 5, 5),
	(25, '2014-10-05 13:47:12', '2014-10-05 13:47:12', 0, b'1', '2014-10-05 13:47:00', 0, ' test', 2, 2);
/*!40000 ALTER TABLE `NEWS_ITEM` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.news_item_photo_url
DROP TABLE IF EXISTS `NEWS_ITEM_PHOTO_URL`;
CREATE TABLE IF NOT EXISTS `NEWS_ITEM_PHOTO_URL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT_TYPE` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `NEWSITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_71vu9u8rai1wj1vfoi0lfci0y` (`CREATED_ID`),
  KEY `FK_242mmqq0ni1cu3fvkvnc5ev2a` (`LAST_MODIFIED_ID`),
  KEY `FK_dy4o2opondpbbob7q9u7idahy` (`NEWSITEM_ID`),
  CONSTRAINT `FK_242mmqq0ni1cu3fvkvnc5ev2a` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_71vu9u8rai1wj1vfoi0lfci0y` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_dy4o2opondpbbob7q9u7idahy` FOREIGN KEY (`NEWSITEM_ID`) REFERENCES `NEWS_ITEM` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.news_item_photo_url: ~7 rows (přibližně)
DELETE FROM `NEWS_ITEM_PHOTO_URL`;
/*!40000 ALTER TABLE `NEWS_ITEM_PHOTO_URL` DISABLE KEYS */;
INSERT INTO `NEWS_ITEM_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `NEWSITEM_ID`) VALUES
	(5, '2014-05-19 03:33:49', '2014-05-19 03:33:49', 0, 'image/jpeg', 'img_6426-180pix.jpg', 5, 5, 11),
	(8, '2014-06-02 21:18:33', '2014-06-02 21:18:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 16),
	(9, '2014-06-02 22:45:59', '2014-06-02 22:45:59', 0, 'image/jpeg', 'IMG_9855.JPG', 5, 5, 11),
	(11, '2014-06-03 17:13:33', '2014-06-03 17:13:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 19),
	(26, '2014-06-15 12:47:48', '2014-06-15 12:47:48', 0, 'image/jpeg', 'LOGOREKLAMA15mm1.jpg', 5, 5, 23),
	(29, '2014-06-15 13:26:58', '2014-06-15 13:26:58', 0, 'image/jpeg', 'MegaBike177pix1.jpg', 5, 5, 24),
	(30, '2014-06-15 13:32:49', '2014-06-15 13:32:49', 0, 'image/jpeg', 'MaxByke177pix1.jpg', 5, 5, 14);
/*!40000 ALTER TABLE `NEWS_ITEM_PHOTO_URL` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.photo_url
DROP TABLE IF EXISTS `PHOTO_URL`;
CREATE TABLE IF NOT EXISTS `PHOTO_URL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT_TYPE` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_2m4wackfms2acxts0brutm99d` (`CREATED_ID`),
  KEY `FK_hh74m0gl9w0ex7ct4f8jpvorh` (`LAST_MODIFIED_ID`),
  KEY `FK_ok94liy1e5n1xxxr58f4t14fv` (`PRODUCT_ID`),
  CONSTRAINT `FK_2m4wackfms2acxts0brutm99d` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_hh74m0gl9w0ex7ct4f8jpvorh` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_ok94liy1e5n1xxxr58f4t14fv` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.photo_url: ~78 rows (přibližně)
DELETE FROM `PHOTO_URL`;
/*!40000 ALTER TABLE `PHOTO_URL` DISABLE KEYS */;
INSERT INTO `PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PRODUCT_ID`) VALUES
	(12, '2014-03-30 08:59:49', '2014-03-30 08:59:49', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 1),
	(13, '2014-03-30 09:00:31', '2014-03-30 09:00:31', 0, 'image/jpeg', 'Chrysanthemum.jpg', 2, 2, 2),
	(14, '2014-03-30 09:01:12', '2014-03-30 09:01:12', 0, 'image/jpeg', 'Tulips.jpg', 2, 2, 5),
	(15, '2014-03-30 09:01:38', '2014-03-30 09:01:38', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 6),
	(16, '2014-03-30 09:02:10', '2014-03-30 09:02:10', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 3),
	(17, '2014-03-30 09:02:53', '2014-03-30 09:02:53', 0, 'image/jpeg', 'Lighthouse.jpg', 2, 2, 4),
	(18, '2014-03-30 09:03:05', '2014-03-30 09:03:05', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 4),
	(19, '2014-03-30 09:03:36', '2014-03-30 09:03:36', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 7),
	(25, '2014-03-31 16:05:18', '2014-03-31 16:05:18', 0, 'image/jpeg', 'IMG_7925.jpg', 5, 5, 10),
	(26, '2014-03-31 16:07:17', '2014-03-31 16:07:17', 0, 'image/jpeg', 'IMG_7926.jpg', 5, 5, 10),
	(33, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 0, 'image/jpeg', 'Lighthouse.jpg', 2, 2, 7),
	(34, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 7),
	(35, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 7),
	(36, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 7),
	(37, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 0, 'image/jpeg', 'Lighthouse.jpg', 2, 2, 7),
	(38, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 7),
	(39, '2014-05-06 18:44:41', '2014-05-06 18:44:41', 0, 'image/jpeg', 'img_6426.jpg', 5, 5, 5),
	(40, '2014-05-06 18:48:13', '2014-05-06 18:48:13', 0, 'image/jpeg', 'img_6412.jpg', 5, 5, 5),
	(41, '2014-05-06 18:50:38', '2014-05-06 18:50:38', 0, 'image/jpeg', 'img_6360.jpg', 5, 5, 10),
	(44, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 0, 'image/jpeg', 'img_6266.jpg', 5, 5, 11),
	(45, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 0, 'image/jpeg', 'img_6412.jpg', 5, 5, 11),
	(46, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 0, 'image/jpeg', 'img_6426.jpg', 5, 5, 11),
	(47, '2014-05-11 10:44:53', '2014-05-11 10:44:53', 0, 'image/jpeg', 'img_9195.jpg', 5, 5, 11),
	(48, '2014-05-11 12:21:34', '2014-05-11 12:21:34', 0, 'image/jpeg', 'img_9195.jpg', 5, 5, 3),
	(51, '2014-05-18 08:21:17', '2014-05-18 08:21:17', 0, 'image/jpeg', 'IMAG0323.jpg', 5, 5, 12),
	(59, '2014-05-24 13:47:19', '2014-05-24 13:47:19', 0, 'image/jpeg', 'OVOV.jpg', 5, 5, 12),
	(60, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 0, 'image/jpeg', 'DSC05087.JPG', 14, 14, 17),
	(61, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 0, 'image/jpeg', 'DSC05088.JPG', 14, 14, 17),
	(62, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 0, 'image/jpeg', 'DSC05090.JPG', 14, 14, 17),
	(63, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 0, 'image/jpeg', 'DSC05091.JPG', 14, 14, 17),
	(64, '2014-05-24 18:36:57', '2014-05-24 18:36:57', 0, 'image/jpeg', 'IMG_7926.jpg', 5, 5, 13),
	(66, '2014-05-24 22:08:49', '2014-05-24 22:08:49', 0, 'image/png', 'enderman.png', 7, 7, 18),
	(71, '2014-05-25 07:40:13', '2014-05-25 07:40:13', 0, 'image/jpeg', 'P1020167.JPG', 7, 7, 19),
	(72, '2014-05-25 18:25:34', '2014-05-25 18:25:34', 0, 'image/jpeg', 'Víno.jpg', 2, 2, 19),
	(73, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 0, 'image/jpeg', 'IMG_7925.jpg', 5, 5, 20),
	(74, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 0, 'image/jpeg', 'IMG_7926.jpg', 5, 5, 20),
	(75, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 0, 'image/jpeg', 'img_6360.jpg', 5, 5, 20),
	(79, '2014-06-14 20:24:52', '2014-06-14 20:24:52', 0, 'image/jpeg', 'Víno.jpg', 2, 2, 21),
	(80, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 0, 'image/jpeg', 'OVOV.jpeg', 2, 2, 22),
	(81, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 0, 'image/jpeg', '19XX_jkvasil_bohemie_t3.jpg', 2, 2, 22),
	(82, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 0, 'image/jpeg', 'P1020167.JPG', 2, 2, 22),
	(83, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 0, 'image/jpeg', 'Víno.jpg', 2, 2, 22),
	(84, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 0, 'image/jpeg', 'IMG_7925.jpg', 2, 2, 23),
	(85, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 0, 'image/jpeg', 'IMG_7926.jpg', 2, 2, 23),
	(86, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 0, 'image/jpeg', 'img_6360.jpg', 2, 2, 23),
	(87, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 0, 'image/jpeg', 'img_6266.jpg', 2, 2, 24),
	(88, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 0, 'image/jpeg', 'img_6412.jpg', 2, 2, 24),
	(89, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 0, 'image/jpeg', 'img_6426.jpg', 2, 2, 24),
	(90, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 0, 'image/jpeg', 'img_9195.jpg', 2, 2, 24),
	(91, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 0, 'image/jpeg', 'DSC05087.JPG', 5, 5, 25),
	(92, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 0, 'image/jpeg', 'DSC05088.JPG', 5, 5, 25),
	(93, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 0, 'image/jpeg', 'DSC05090.JPG', 5, 5, 25),
	(94, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 0, 'image/jpeg', 'DSC05091.JPG', 5, 5, 25),
	(95, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 0, 'image/jpeg', 'DSC05087.JPG', 5, 5, 26),
	(96, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 0, 'image/jpeg', 'DSC05088.JPG', 5, 5, 26),
	(97, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 0, 'image/jpeg', 'DSC05090.JPG', 5, 5, 26),
	(98, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 0, 'image/jpeg', 'DSC05091.JPG', 5, 5, 26),
	(99, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 0, 'image/jpeg', 'DSC05087.JPG', 5, 5, 27),
	(100, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 0, 'image/jpeg', 'DSC05088.JPG', 5, 5, 27),
	(101, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 0, 'image/jpeg', 'DSC05090.JPG', 5, 5, 27),
	(102, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 0, 'image/jpeg', 'DSC05091.JPG', 5, 5, 27),
	(107, '2014-06-15 19:27:32', '2014-06-15 19:27:32', 0, 'image/jpeg', 'Víno.jpg', 2, 2, 30),
	(108, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, 'image/jpeg', 'IMG_7925.jpg', 5, 5, 31),
	(109, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, 'image/jpeg', 'IMG_7926.jpg', 5, 5, 31),
	(110, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, 'image/jpeg', 'img_6360.jpg', 5, 5, 31),
	(114, '2014-06-15 20:37:06', '2014-06-15 20:37:06', 0, 'image/jpeg', 'img_9195.jpg', 5, 5, 32),
	(117, '2014-07-08 20:50:13', '2014-07-08 20:50:13', 0, 'image/jpeg', 'Lighthouse.jpg', 2, 2, 30),
	(122, '2014-08-16 06:30:04', '2014-08-16 06:30:04', 0, 'image/jpeg', 'IMG_8936.jpg', 5, 5, 32),
	(129, '2014-09-20 10:02:14', '2014-09-20 10:02:14', 0, 'image/jpeg', 'IMG_9047.jpg', 5, 5, 34),
	(132, '2014-09-27 11:18:32', '2014-09-27 11:18:32', 0, 'image/jpeg', 'IMAG0507.jpg', 5, 5, 34),
	(133, '2014-09-27 18:36:31', '2014-09-27 18:36:31', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 33),
	(134, '2014-09-28 21:37:36', '2014-09-28 21:37:36', 0, 'image/jpeg', 'DSC_0144b.jpg', 5, 5, 34),
	(135, '2014-09-28 22:35:28', '2014-09-28 22:35:28', 0, 'image/jpeg', 'DSC_0144b.jpg', 5, 5, 29),
	(136, '2014-09-29 21:57:43', '2014-09-29 21:57:43', 0, 'image/jpeg', 'IMG_9055.jpg', 5, 5, 28),
	(138, '2014-10-04 16:42:18', '2014-10-04 16:42:18', 0, 'image/jpeg', 'logo.jpg', 2, 2, 37),
	(140, '2014-10-04 16:43:33', '2014-10-04 16:43:33', 0, 'image/png', 'glyphicons-halflings.png', 2, 2, 37),
	(141, '2014-10-04 16:44:09', '2014-10-04 16:44:09', 0, 'image/png', 'glyphicons-halflings-white.png', 2, 2, 37),
	(142, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, 'image/jpeg', 'logo.jpg', 2, 2, 38),
	(143, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, 'undefined', 'Jellyfish.jpg', 2, 2, 39),
	(144, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, 'undefined', 'Koala.jpg', 2, 2, 39);
/*!40000 ALTER TABLE `PHOTO_URL` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.place
DROP TABLE IF EXISTS `PLACE`;
CREATE TABLE IF NOT EXISTS `PLACE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `BIKE_ROAD_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `DESCRIPTION_LINK` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `NR_OF_RANKINGS` int(11) DEFAULT NULL,
  `QUALITY_RANKING` double DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PLACE_TYPE_ID` bigint(20) NOT NULL,
  `REGION_ID` bigint(20) NOT NULL,
  `CITY` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `HOUSE_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `POST_CODE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `STREET` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `NORTH` double DEFAULT NULL,
  `WEST` double DEFAULT NULL,
  `COUNTRY_STATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_gd4td1k10n6v30tm3a2dr8lyg` (`CREATED_ID`),
  KEY `FK_p1hwtjuhnopvj2at3hf8fwbu3` (`LAST_MODIFIED_ID`),
  KEY `FK_7e3xc9na32f4vtkcaeqe1wub` (`PLACE_TYPE_ID`),
  KEY `FK_mgst3mvw1k918de2tt6x9g0ch` (`REGION_ID`),
  KEY `FK_ri7u7ytu03mt38ly2f54pa6nw` (`COUNTRY_STATE_ID`),
  CONSTRAINT `FK_7e3xc9na32f4vtkcaeqe1wub` FOREIGN KEY (`PLACE_TYPE_ID`) REFERENCES `PLACE_TYPE` (`ID`),
  CONSTRAINT `FK_gd4td1k10n6v30tm3a2dr8lyg` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_mgst3mvw1k918de2tt6x9g0ch` FOREIGN KEY (`REGION_ID`) REFERENCES `REGION` (`ID`),
  CONSTRAINT `FK_p1hwtjuhnopvj2at3hf8fwbu3` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_ri7u7ytu03mt38ly2f54pa6nw` FOREIGN KEY (`COUNTRY_STATE_ID`) REFERENCES `COUNTRY_STATE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.place: ~45 rows (přibližně)
DELETE FROM `PLACE`;
/*!40000 ALTER TABLE `PLACE` DISABLE KEYS */;
INSERT INTO `PLACE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `BIKE_ROAD_NR`, `DESCRIPTION`, `DESCRIPTION_LINK`, `NAME`, `NR_OF_RANKINGS`, `QUALITY_RANKING`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PLACE_TYPE_ID`, `REGION_ID`, `CITY`, `HOUSE_NR`, `POST_CODE`, `STREET`, `NORTH`, `WEST`, `COUNTRY_STATE_ID`) VALUES
	(1, '2014-06-24 00:51:40', '2014-06-24 00:52:08', 2, '34', ' tesat', NULL, 'test', NULL, NULL, 2, 2, 1, 8, 'test', '23', 'test', 'test', 50.5, 12.5, NULL),
	(2, '2014-06-24 00:53:38', '2014-06-24 01:05:23', 5, '45', ' test', NULL, 'restaurace v pze', NULL, NULL, 2, 5, 1, 8, 'Praha', '23', '15000', 'vodickova', 50, 14, NULL),
	(3, '2014-07-17 09:11:35', '2014-07-17 19:34:58', 2, '45', 'test', NULL, 'test', 2, 4, 2, 5, 2, 8, NULL, NULL, NULL, NULL, 50.2190946204475, 14.359130859375, NULL),
	(4, '2014-07-17 18:31:00', '2014-07-23 23:45:43', 25, '1', 'Popis', NULL, 'Pokus MAC', 25, 4.52000000000001, 5, 2, 2, 8, NULL, NULL, NULL, NULL, 49.3537557183099, 16.083984375, NULL),
	(5, '2014-07-18 07:39:37', '2014-07-18 07:39:37', 0, '123', 'Testuji zadání místa v druhém kroku', NULL, 'Test CHROME', 0, 0, 5, 5, 1, 8, NULL, NULL, NULL, NULL, 49.4109731996958, 18.072509765625, NULL),
	(6, '2014-07-18 16:31:03', '2014-07-18 16:31:03', 0, '102', '', NULL, 'Plešné jezero', 0, 0, 6, 6, 2, 8, NULL, NULL, NULL, NULL, 48.7779456, 13.8675383, NULL),
	(7, '2014-07-18 16:32:14', '2014-07-18 16:32:14', 0, '102', '', NULL, 'Plešné jezero', 0, 0, 6, 6, 2, 8, NULL, NULL, NULL, NULL, 48.7779456, 13.8675383, NULL),
	(8, '2014-07-18 16:32:14', '2014-07-18 20:14:13', 21, '102', '', NULL, 'Plešné jezero', 21, 3, 6, 5, 2, 8, NULL, NULL, NULL, NULL, 48.7779456, 13.8675383, NULL),
	(9, '2014-07-23 17:05:20', '2014-07-23 17:05:20', 0, '45', 'ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test', NULL, 'test', 0, 0, 2, 2, 2, 8, NULL, NULL, NULL, NULL, 50.527396813293, 14.117431640625, NULL),
	(10, '2014-07-23 17:05:57', '2014-07-23 17:05:57', 0, '56', 'test', NULL, 'test', 0, 0, 2, 2, 2, 8, NULL, NULL, NULL, NULL, 49.6249456465014, 13.304443359375, NULL),
	(11, '2014-07-23 17:07:00', '2014-07-23 17:07:22', 11, '56', 'test', NULL, 'test', 11, 4, 2, 2, 2, 8, NULL, NULL, NULL, NULL, 49.6818468994013, 18.468017578125, NULL),
	(12, '2014-07-23 19:18:25', '2014-07-24 12:54:33', 88, '123', 'Popis hospody u smrku', NULL, 'Hospoda u smrku', 88, 4.02272727272727, 5, 5, 1, 8, NULL, NULL, NULL, NULL, 49.0810623643207, 18.10546875, NULL),
	(13, '2014-07-23 19:48:18', '2014-07-23 19:48:18', 0, NULL, '', NULL, 'aaa', 0, 0, 5, 5, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, '2014-07-24 12:42:09', '2014-07-24 13:53:58', 31, '123', 'Za dubem, před dubem .....', 'www.idnes.cz', 'Restaurace za dubem', 31, 4.93548387096772, 5, 2, 1, 6, NULL, NULL, NULL, NULL, 49.2821401597599, 13.20556640625, NULL),
	(15, '2014-07-24 12:45:26', '2014-07-24 13:53:13', 1, '123', 'Test funkčnosti, v chromu to spadlo', 'www.idnes.cz', 'Test funkčnosti (v chromu to spadlo)', 1, 5, 5, 2, 1, 6, NULL, NULL, NULL, NULL, 49.6534045884379, 12.83203125, NULL),
	(16, '2014-07-24 12:45:58', '2014-07-24 12:45:58', 0, '123', 'Test funkčnosti, v chromu to spadlo', 'www.idnes.cz', 'Test funkčnosti (v chromu to spadlo)', 0, 0, 5, 5, 1, 6, NULL, NULL, NULL, NULL, 49.6534045884379, 12.83203125, NULL),
	(17, '2014-07-24 12:48:26', '2014-07-25 07:17:30', 21, '123', 'Test funkčnosti, v chromu to spadlo', '', 'TEST', 21, 4, 5, 5, 1, 4, NULL, NULL, NULL, NULL, 50.1909677655856, 13.33740234375, NULL),
	(18, '2014-07-24 13:19:48', '2014-08-11 08:44:50', 16, '45', 'test', 'test', 'test', 16, 4, 2, NULL, 2, 5, NULL, NULL, NULL, NULL, 50.6250730634143, 14.776611328125, NULL),
	(19, '2014-07-24 14:09:20', '2014-09-14 17:36:54', 4, '45', 'test', 'test', 'test', 3, 5, 2, 5, 2, 15, '', NULL, '', '', 49.8592347177469, 18.0587768554688, NULL),
	(20, '2014-07-25 09:36:28', '2014-09-10 22:25:27', 2, 'test', 'test', 'test', 'test', 2, 5, 2, 5, 2, 7, NULL, NULL, NULL, NULL, 50.2752986114252, 13.0654907226562, NULL),
	(21, '2014-07-25 12:53:27', '2014-07-25 12:53:27', 0, 'D1 a D12345', 'Zadávám místo po obědě', 'www.idnes.cz', 'Po Obědě', 0, 0, 5, 5, 1, 12, NULL, NULL, NULL, NULL, 49.1960640007238, 16.3916015625, NULL),
	(22, '2014-07-25 13:20:13', '2014-07-25 13:20:13', 0, '', '', '', 'BBB', 0, 0, 5, 5, 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, '2014-07-25 13:27:06', '2014-07-25 13:27:06', 0, '111222333', 'Popis místa v CHROME', 'www.novinky.cz', 'Zadávám v CHROME', 0, 0, 5, 5, 1, 9, NULL, NULL, NULL, NULL, 49.6676278226219, 15.732421875, NULL),
	(24, '2014-07-29 02:43:02', '2014-07-29 02:43:02', 0, '111', 'Vložení fotky na výšku', 'www.idnes.cz', 'Fotka na výšku', 0, 0, 5, 5, 1, 12, NULL, NULL, NULL, NULL, 48.9116697569841, 16.0894775390625, NULL),
	(25, '2014-07-29 21:00:06', '2014-07-29 21:00:06', 0, 'test', 'test test test test test', 'test', 'test', 0, 0, 2, 2, 2, 4, NULL, NULL, NULL, NULL, 50.3314363308388, 13.634033203125, NULL),
	(26, '2014-07-29 21:03:26', '2014-07-29 21:03:26', 0, 'test', 'test v IE 8!!', 'test', 'IE - 8 - test', 0, 0, 2, 2, 2, 15, NULL, NULL, NULL, NULL, 49.7528799341502, 18.1494140625, NULL),
	(27, '2014-07-29 21:03:56', '2014-07-29 21:03:56', 0, 'test', 'test v IE 8!!', 'test', 'IE - 8 - test', 0, 0, 2, 2, 2, 15, NULL, NULL, NULL, NULL, 49.7528799341502, 18.1494140625, NULL),
	(28, '2014-07-29 21:03:59', '2014-07-29 21:03:59', 0, 'test', 'test v IE 8!!', 'test', 'IE - 8 - test', 0, 0, 2, 2, 2, 15, NULL, NULL, NULL, NULL, 49.7528799341502, 18.1494140625, NULL),
	(29, '2014-07-30 20:11:09', '2014-07-30 20:11:09', 0, '111', 'SSSSSSS', 'AAAA', 'AAA', 0, 0, 5, 5, 2, 11, NULL, NULL, NULL, NULL, 50.0606653859367, 15.875244140625, NULL),
	(30, '2014-07-30 20:16:44', '2014-07-30 20:16:44', 0, '22222222222', 'Požadavek č. 260', '', 'Test pož.č.260', 0, 0, 5, 5, 2, 13, NULL, NULL, NULL, NULL, 49.9653559099131, 16.8310546875, NULL),
	(31, '2014-08-16 00:46:52', '2014-09-21 12:16:59', 1, 'test', 'test', 'test', 'test', 1, 1, 2, NULL, 2, 7, NULL, NULL, NULL, NULL, 50.0641917366591, 12.952880859375, NULL),
	(32, '2014-08-16 00:47:37', '2014-08-16 00:47:37', 0, 'test', 'test', 'test', 'test', 0, 0, 2, 2, 2, 7, NULL, NULL, NULL, NULL, 50.1909677655856, 13.172607421875, NULL),
	(33, '2014-08-16 01:14:08', '2014-08-16 01:14:08', 0, 'test', '', 'test', 'test', 0, 0, 2, 2, 2, 6, NULL, NULL, NULL, NULL, 49.4538425943307, 13.590087890625, NULL),
	(34, '2014-08-16 06:07:09', '2014-09-21 21:10:36', 51, '', 'Krásné sochy u lanovky na Petřín', '', 'Sochy u lanovky na Petřín', 51, 5, 5, NULL, 2, 1, NULL, NULL, NULL, NULL, 50.0795063141682, 14.4049644470215, NULL),
	(35, '2014-08-16 06:18:28', '2014-08-16 06:18:28', 0, 'Nevím', 'Nádherná strahovská knihovna', 'http://www.strahovskyklaster.cz', 'Strahovský klášter', 0, 0, 5, 5, 2, 1, NULL, NULL, NULL, NULL, 50.0857195802319, 14.3893486261368, NULL),
	(36, '2014-08-23 15:52:04', '2014-08-23 15:52:04', 0, 'cyklostezka 24', '', 'http://www.kokorinsko.net/', 'Kokořínkso', 0, 0, 2, 2, 2, 3, NULL, NULL, NULL, NULL, 50.4732389144097, 14.5507049560547, NULL),
	(37, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, '111111', 'aaaaaaaaaaa\r\nbbbbbb\r\nccccccccc\r\ndddddddddd\r\nhhhhhh\r\nkkkkkkkkkk\r\ngggggggggg\r\nbbbbbbb\r\n\r\n\r\n\r\nhhhhh\r\nhhhhhhh\r\nkkkkkkkkkk\r\nůllllllllllll\r\niiiiiii\r\nooooooo\r\njjjjjj\r\n\r\njhnhnhnhnnh\r\n\r\n\r\nnnnnn', 'www.idnes.cz', 'aaaa', 0, 0, 5, 5, 2, 9, NULL, NULL, NULL, NULL, 49.4966745274704, 15.8203125, NULL),
	(38, '2014-08-23 18:08:31', '2014-08-23 18:08:31', 0, 'bbbb', 'test uložení vícekrát', '', 'test počtu zápisů', 0, 0, 5, 5, 2, 9, NULL, NULL, NULL, NULL, 49.6391771965104, 15.44677734375, NULL),
	(39, '2014-08-24 08:11:30', '2014-08-24 08:11:30', 0, 'aaaa', 'test zadání místa', 'www.novinky.cz', 'Rozhledna Petřín', 0, 0, 5, 5, 1, 1, NULL, NULL, NULL, NULL, 50.0837747940637, 14.3941068649292, NULL),
	(40, '2014-08-24 21:21:44', '2014-09-27 21:36:28', 2, 'A2', 'Cyklotrasa přímo podél Vltavy s překrásným výhledem na Pražský hrad a nejen to.', '', 'Náplavka - Praha', 1, 5, 5, 5, 2, 1, '', NULL, '', '', 50.0725933245085, 14.4137620925903, NULL),
	(41, '2014-09-08 05:00:35', '2014-09-28 12:00:54', 4, 'test', 'test\r\nTEST 2', 'test', 'test', 3, 5, 22, 5, 2, 4, NULL, NULL, NULL, NULL, 50.527396813293, 13.524169921875, NULL),
	(42, '2014-09-08 22:15:45', '2014-09-25 22:30:21', 49, 'BBBB', 'Překrásné výhledy na Prahu', '', 'Pražský hrad', 47, 5, 5, 5, 2, 1, NULL, NULL, NULL, NULL, 50.089116743035, 14.3983769416809, NULL),
	(43, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 'dddd', 'dddd', '', 'ddd', 0, 0, 5, 5, 2, 12, NULL, NULL, NULL, NULL, 48.9513664709477, 16.2158203125, NULL),
	(44, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 'test', 'test', 'test', 'test', 0, 0, 2, 2, 2, 5, NULL, NULL, NULL, NULL, 50.597186230587, 14.490966796875, NULL),
	(45, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, '111', 'test místa pod speciálním uživatelem', 'www.idnes.cz', 'Testíček - Tomíček', 0, 0, 24, 24, 2, 8, NULL, NULL, NULL, NULL, 49.4395569589408, 14.556884765625, NULL),
	(46, '2014-10-05 12:07:51', '2014-10-05 12:08:06', 1, 'test', 'test', 'test', 'test', 0, 0, 2, 2, 2, 4, NULL, NULL, NULL, NULL, 50.62507306341435, 14.315185546875, NULL);
/*!40000 ALTER TABLE `PLACE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.place_comment
DROP TABLE IF EXISTS `PLACE_COMMENT`;
CREATE TABLE IF NOT EXISTS `PLACE_COMMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `PLACE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_hbquro7jljerfp8lulkte1yey` (`CREATED_ID`),
  KEY `FK_ajrabpp2wf6nsd1b2vdo84ors` (`LAST_MODIFIED_ID`),
  KEY `FK_7iefirxym9bgarret3lkksknf` (`PARENT_ID`),
  KEY `FK_my6q5esbvd72ji2f1ewe9wdch` (`PLACE_ID`),
  CONSTRAINT `FK_7iefirxym9bgarret3lkksknf` FOREIGN KEY (`PARENT_ID`) REFERENCES `place_comment` (`ID`),
  CONSTRAINT `FK_ajrabpp2wf6nsd1b2vdo84ors` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_hbquro7jljerfp8lulkte1yey` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_my6q5esbvd72ji2f1ewe9wdch` FOREIGN KEY (`PLACE_ID`) REFERENCES `PLACE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.place_comment: ~30 rows (přibližně)
DELETE FROM `PLACE_COMMENT`;
/*!40000 ALTER TABLE `PLACE_COMMENT` DISABLE KEYS */;
INSERT INTO `PLACE_COMMENT` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PARENT_ID`, `PLACE_ID`) VALUES
	(1, '2014-06-25 00:32:56', '2014-06-25 00:32:56', 0, ' testtest', NULL, NULL, NULL, 2),
	(2, '2014-06-25 00:36:08', '2014-06-25 00:36:08', 0, ' testtest', NULL, NULL, NULL, 2),
	(3, '2014-07-13 19:13:18', '2014-07-13 19:13:18', 0, ' tesbhjkjbkjblkhbk', 2, 2, NULL, 2),
	(4, '2014-07-13 19:13:21', '2014-07-13 19:13:21', 0, ' blabla', 5, 5, NULL, 2),
	(5, '2014-07-18 16:09:28', '2014-07-18 16:09:28', 0, 'tady chybí fotka', 6, 6, NULL, 5),
	(6, '2014-07-18 16:10:12', '2014-07-18 16:10:12', 0, 'taky jsem si všimnuůl', 6, 6, NULL, 5),
	(7, '2014-07-18 16:17:17', '2014-07-18 16:17:17', 0, 'mm', 6, 6, NULL, 4),
	(8, '2014-07-18 20:13:29', '2014-07-18 20:13:29', 0, ' hahaha', 5, 5, NULL, 8),
	(9, '2014-07-18 20:13:38', '2014-07-18 20:13:38', 0, ' hihihi', 5, 5, NULL, 8),
	(10, '2014-07-23 19:31:42', '2014-07-23 19:31:42', 0, ' Tak jsem zkusil poprvé zadat místo s novým vkládáním fotografie a docela se mně to až na pár připomínek líbí :-)', 5, 5, NULL, 12),
	(11, '2014-07-23 19:31:58', '2014-07-23 19:31:58', 0, ' HAHAHA', 5, 5, NULL, 12),
	(12, '2014-07-29 21:00:21', '2014-07-29 21:00:21', 0, ' Penky pejsek', 2, 2, NULL, 25),
	(13, '2014-07-29 21:00:37', '2014-07-29 21:00:37', 0, ' Zas tak moc ne hele', 2, 2, NULL, 25),
	(14, '2014-07-29 21:00:44', '2014-07-29 21:00:44', 0, ' Ale jo', 2, 2, NULL, 25),
	(15, '2014-07-29 21:01:01', '2014-07-29 21:01:01', 0, ' Ahoj, nehadejte se', 2, 2, NULL, 25),
	(16, '2014-09-08 04:58:37', '2014-09-08 04:58:37', 0, ' test', NULL, NULL, NULL, 18),
	(17, '2014-09-08 04:59:15', '2014-09-08 04:59:15', 0, ' test 2', NULL, NULL, NULL, 18),
	(18, '2014-09-08 04:59:30', '2014-09-08 04:59:30', 0, ' test 2 2', 22, 22, NULL, 18),
	(19, '2014-09-19 19:55:26', '2014-09-19 19:55:26', 0, ' hvbvhhvhv', NULL, NULL, NULL, 42),
	(20, '2014-09-19 19:55:35', '2014-09-19 19:55:35', 0, ' hjhjhkjhkjkh', NULL, NULL, NULL, 42),
	(21, '2014-09-19 19:55:47', '2014-09-19 19:55:47', 0, ' hbhjbjhkkhjhkujkhjhkkkkkj', NULL, NULL, NULL, 42),
	(22, '2014-09-20 09:25:41', '2014-09-20 09:25:41', 0, '1 ddd<div>2dddd</div><div>3dddd</div><div>4dddd</div><div>5dddd</div><div>6dddd</div><div>7dddd</div><div>8</div><div>9</div><div>10</div><div>11</div><div>12</div><div>13</div><div>14</div>', 5, 5, NULL, 42),
	(23, '2014-09-20 17:35:10', '2014-09-20 17:35:10', 0, ' jnjnnjjnjnjn', NULL, NULL, NULL, 38),
	(24, '2014-09-20 17:35:19', '2014-09-20 17:35:19', 0, ' njjnajnnjanjajnjajnajna', NULL, NULL, NULL, 38),
	(25, '2014-09-20 17:35:34', '2014-09-20 17:35:34', 0, ' njnjnjnj<b> nn n nnn</b>', NULL, NULL, NULL, 38),
	(26, '2014-09-21 20:12:38', '2014-09-21 20:12:38', 0, ' dddddd', NULL, NULL, NULL, 42),
	(27, '2014-09-27 21:36:39', '2014-09-27 21:36:39', 0, ' blablabla', 5, 5, NULL, 40),
	(28, '2014-09-28 11:56:14', '2014-09-28 11:56:14', 0, '1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20', 5, 5, NULL, 42),
	(29, '2014-09-28 22:32:40', '2014-09-28 22:32:40', 0, '1\r\n2\r\n3\r\n', NULL, NULL, NULL, 42),
	(30, '2014-09-28 22:33:09', '2014-09-28 22:33:09', 0, 'a\r\nb\r\nc\r\nd\r\n', NULL, NULL, NULL, 42);
/*!40000 ALTER TABLE `PLACE_COMMENT` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.place_photo_url
DROP TABLE IF EXISTS `PLACE_PHOTO_URL`;
CREATE TABLE IF NOT EXISTS `PLACE_PHOTO_URL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT_TYPE` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PLACE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_dkptru7v2fl68ktapm0kv4ste` (`CREATED_ID`),
  KEY `FK_bo5cgle90q88rgyayct5sxu45` (`LAST_MODIFIED_ID`),
  KEY `FK_m8mb87jyvlsu3ircc9ofqcga2` (`PLACE_ID`),
  CONSTRAINT `FK_bo5cgle90q88rgyayct5sxu45` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_dkptru7v2fl68ktapm0kv4ste` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_m8mb87jyvlsu3ircc9ofqcga2` FOREIGN KEY (`PLACE_ID`) REFERENCES `PLACE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.place_photo_url: ~46 rows (přibližně)
DELETE FROM `PLACE_PHOTO_URL`;
/*!40000 ALTER TABLE `PLACE_PHOTO_URL` DISABLE KEYS */;
INSERT INTO `PLACE_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PLACE_ID`) VALUES
	(1, '2014-06-24 00:51:40', '2014-06-24 00:51:40', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 1),
	(2, '2014-06-24 00:53:38', '2014-06-24 00:53:38', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 2),
	(3, '2014-07-17 09:11:35', '2014-07-17 09:11:35', 0, 'image/png', 'adresy_sokolovska.png', 2, 2, 3),
	(4, '2014-07-17 18:31:00', '2014-07-17 18:31:00', 0, 'image/jpeg', 'IMG_0585.JPG', 5, 5, 4),
	(5, '2014-07-23 17:07:00', '2014-07-23 17:07:00', 0, 'image/jpeg', 'Lighthouse.jpg', 2, 2, 11),
	(6, '2014-07-23 19:18:25', '2014-07-23 19:18:25', 0, 'image/jpeg', 'P7200144.JPG', 5, 5, 12),
	(7, '2014-07-23 19:18:25', '2014-07-23 19:18:25', 0, 'image/jpeg', 'P7200145.JPG', 5, 5, 12),
	(8, '2014-07-23 19:18:25', '2014-07-23 19:18:25', 0, 'image/jpeg', 'P7200264.JPG', 5, 5, 12),
	(9, '2014-07-23 19:18:25', '2014-07-23 19:18:25', 0, 'image/jpeg', 'P7200139.JPG', 5, 5, 12),
	(10, '2014-07-24 13:19:48', '2014-07-24 13:19:48', 0, 'image/jpeg', 'Penguins.jpg', 2, 2, 18),
	(11, '2014-07-25 09:36:28', '2014-07-25 09:36:28', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 20),
	(12, '2014-07-29 21:00:06', '2014-07-29 21:00:06', 0, 'image/jpeg', '-obrazky.4ever.sk--pes--mafian-2524496.jpg', 2, 2, 25),
	(13, '2014-08-16 00:46:53', '2014-08-16 00:46:53', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 31),
	(14, '2014-08-16 00:46:53', '2014-08-16 00:46:53', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 31),
	(15, '2014-08-16 00:47:37', '2014-08-16 00:47:37', 0, 'image/jpeg', 'P7200165.JPG', 2, 2, 32),
	(16, '2014-08-16 01:14:08', '2014-08-16 01:14:08', 0, 'image/jpeg', 'Tulips.jpg', 2, 2, 33),
	(17, '2014-08-16 01:14:08', '2014-08-16 01:14:08', 0, 'image/jpeg', 'Desert.jpg', 2, 2, 33),
	(18, '2014-08-16 06:07:09', '2014-08-16 06:07:09', 0, 'image/jpeg', 'IMG_8885.jpg', 5, 5, 34),
	(19, '2014-08-16 06:18:28', '2014-08-16 06:18:28', 0, 'image/jpeg', 'IMG_8913.jpg', 5, 5, 35),
	(20, '2014-08-16 06:18:28', '2014-08-16 06:18:28', 0, 'image/jpeg', 'IMG_8926.jpg', 5, 5, 35),
	(21, '2014-08-16 06:18:28', '2014-08-16 06:18:28', 0, 'image/jpeg', 'IMG_8938.jpg', 5, 5, 35),
	(22, '2014-08-23 15:52:04', '2014-08-23 15:52:04', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 36),
	(23, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, 'image/jpeg', 'IMG_8908.jpg', 5, 5, 37),
	(24, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, 'image/jpeg', 'IMG_8892.jpg', 5, 5, 37),
	(25, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, 'image/jpeg', 'IMG_9004.jpg', 5, 5, 37),
	(26, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, 'image/jpeg', 'IMG_8909.jpg', 5, 5, 37),
	(27, '2014-08-23 18:08:31', '2014-08-23 18:08:31', 0, 'image/jpeg', 'IMG_8948.jpg', 5, 5, 38),
	(28, '2014-08-24 08:11:30', '2014-08-24 08:11:30', 0, 'image/jpeg', 'IMG_8895.jpg', 5, 5, 39),
	(29, '2014-08-24 08:11:30', '2014-08-24 08:11:30', 0, 'image/jpeg', 'IMG_8894.jpg', 5, 5, 39),
	(30, '2014-08-24 08:11:30', '2014-08-24 08:11:30', 0, 'image/jpeg', 'IMG_8892.jpg', 5, 5, 39),
	(31, '2014-08-24 21:21:44', '2014-08-24 21:21:44', 0, 'image/jpeg', 'IMG_9012.jpg', 5, 5, 40),
	(32, '2014-08-24 21:21:44', '2014-08-24 21:21:44', 0, 'image/jpeg', 'IMG_9016.jpg', 5, 5, 40),
	(33, '2014-09-08 05:00:35', '2014-09-08 05:00:35', 0, 'image/jpeg', 'Chrysanthemum.jpg', 22, 22, 41),
	(34, '2014-09-08 05:00:36', '2014-09-08 05:00:36', 0, 'image/jpeg', 'Jellyfish.jpg', 22, 22, 41),
	(35, '2014-09-08 05:00:36', '2014-09-08 05:00:36', 0, 'image/jpeg', 'Koala.jpg', 22, 22, 41),
	(37, '2014-09-08 22:15:46', '2014-09-08 22:15:46', 0, 'image/jpeg', 'IMG_9182_HDR.jpg', 5, 5, 42),
	(38, '2014-09-08 22:15:46', '2014-09-08 22:15:46', 0, 'image/jpeg', 'IMG_9185_HDR.jpg', 5, 5, 42),
	(39, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 'image/jpeg', 'IMG_9158_HDR.jpg', 5, 5, 43),
	(40, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 'image/jpeg', 'IMG_9085_HDR.jpg', 5, 5, 43),
	(41, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 'image/jpeg', 'Desert.jpg', 2, 2, 44),
	(42, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 44),
	(43, '2014-09-14 17:25:11', '2014-09-14 17:25:11', 0, 'image/jpeg', 'IMG_9194_HDR.jpg', 5, 5, 42),
	(44, '2014-09-14 17:36:54', '2014-09-14 17:36:54', 0, 'image/jpeg', 'IMG_9158_HDR.jpg', 5, 5, 19),
	(45, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/jpeg', 'IMG_9167_HDR.jpg', 24, 24, 45),
	(46, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/gif', 'logo_a.gif', 24, 24, 45),
	(47, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/jpeg', 'horske-kolo-leader-fox-maxim-2012-2-cervena.jpg', 24, 24, 45),
	(48, '2014-10-05 12:07:51', '2014-10-05 12:07:51', 0, 'image/png', 'glyphicons-halflings-white.png', 2, 2, 46),
	(49, '2014-10-05 12:08:06', '2014-10-05 12:08:06', 0, 'image/jpeg', 'logo.jpg', 2, 2, 46);
/*!40000 ALTER TABLE `PLACE_PHOTO_URL` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.place_type
DROP TABLE IF EXISTS `PLACE_TYPE`;
CREATE TABLE IF NOT EXISTS `PLACE_TYPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `PLACE_TYPE_COLOR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_i4c0mvdcuo72pjefac6sg2sou` (`CREATED_ID`),
  KEY `FK_mh1fy92k29vil9c8mpaad8rkd` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_i4c0mvdcuo72pjefac6sg2sou` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_mh1fy92k29vil9c8mpaad8rkd` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.place_type: ~2 rows (přibližně)
DELETE FROM `PLACE_TYPE`;
/*!40000 ALTER TABLE `PLACE_TYPE` DISABLE KEYS */;
INSERT INTO `PLACE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PLACE_TYPE_COLOR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-06-24 00:30:36', '2014-08-23 17:42:48', 2, 'Restaurace', 'ptype_restaurant', 10, 2, 2, 2),
	(2, '2014-06-24 00:31:44', '2014-09-20 17:38:20', 4, 'Příroda, památky', 'ptype_interest', 100, 1, 2, 5);
/*!40000 ALTER TABLE `PLACE_TYPE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.producer
DROP TABLE IF EXISTS `PRODUCER`;
CREATE TABLE IF NOT EXISTS `PRODUCER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tm7ly8b339h4u325qhv0hdh8w` (`CREATED_ID`),
  KEY `FK_21juuudrqcggvhfpptvejayni` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_21juuudrqcggvhfpptvejayni` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_tm7ly8b339h4u325qhv0hdh8w` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.producer: ~81 rows (přibližně)
DELETE FROM `PRODUCER`;
/*!40000 ALTER TABLE `PRODUCER` DISABLE KEYS */;
INSERT INTO `PRODUCER` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(18, '2014-05-07 00:00:00', NULL, 0, '4EVER', 'prd_4ever', NULL, 2, NULL),
	(19, '2014-05-07 00:00:00', NULL, 0, '4freetime', 'prd_4free', NULL, 2, NULL),
	(20, '2014-05-07 00:00:00', NULL, 0, 'ACRA', 'prd_acra', NULL, 2, NULL),
	(21, '2014-05-07 00:00:00', NULL, 0, 'Acstar', 'prd_acsta', NULL, 2, NULL),
	(22, '2014-05-07 00:00:00', NULL, 0, 'Agogs', 'prd_agogs', NULL, 2, NULL),
	(23, '2014-05-07 00:00:00', NULL, 0, 'ALPINA', 'prd_alpin', NULL, 2, NULL),
	(24, '2014-05-07 00:00:00', '2014-06-15 02:03:43', 1, 'AMULET', 'prd_amule', 100000, 2, 2),
	(25, '2014-05-07 00:00:00', NULL, 0, 'APACHE', 'prd_apach', NULL, 2, NULL),
	(26, '2014-05-07 00:00:00', NULL, 0, 'Azub', 'prd_azub', NULL, 2, NULL),
	(27, '2014-05-07 00:00:00', NULL, 0, 'BROTHER', 'prd_broth', NULL, 2, NULL),
	(28, '2014-05-07 00:00:00', NULL, 0, 'Cannondale', 'prd_canno', NULL, 2, NULL),
	(29, '2014-05-07 00:00:00', NULL, 0, 'Cosmic', 'prd_cosmi', NULL, 2, NULL),
	(30, '2014-05-07 00:00:00', NULL, 0, 'COYOTE', 'prd_coyot', NULL, 2, NULL),
	(31, '2014-05-07 00:00:00', NULL, 0, 'DAHON', 'prd_dahon', NULL, 2, NULL),
	(32, '2014-05-07 00:00:00', NULL, 0, 'DEMA', 'prd_dema', NULL, 2, NULL),
	(33, '2014-05-07 00:00:00', NULL, 0, 'DHS', 'prd_dhs', NULL, 2, NULL),
	(34, '2014-05-07 00:00:00', NULL, 0, 'DINO', 'prd_dino', NULL, 2, NULL),
	(35, '2014-05-07 00:00:00', NULL, 0, 'DISNEY', 'prd_disne', NULL, 2, NULL),
	(36, '2014-05-07 00:00:00', NULL, 0, 'Donnay', 'prd_donna', NULL, 2, NULL),
	(37, '2014-05-07 00:00:00', NULL, 0, 'DUNLOP', 'prd_dunlo', NULL, 2, NULL),
	(38, '2014-05-07 00:00:00', NULL, 0, 'ECO', 'prd_eco', NULL, 2, NULL),
	(39, '2014-05-07 00:00:00', NULL, 0, 'ELEKTROKOLO', 'prd_elekt', NULL, 2, NULL),
	(40, '2014-05-07 00:00:00', NULL, 0, 'Everlast', 'prd_everl', NULL, 2, NULL),
	(41, '2014-05-07 00:00:00', NULL, 0, 'FELT', 'prd_felt', NULL, 2, NULL),
	(42, '2014-05-07 00:00:00', NULL, 0, 'Focus', 'prd_focus', NULL, 2, NULL),
	(43, '2014-05-07 00:00:00', NULL, 0, 'Fondriest', 'prd_fondr', NULL, 2, NULL),
	(44, '2014-05-07 00:00:00', NULL, 0, 'Galaxy', 'prd_galax', NULL, 2, NULL),
	(45, '2014-05-07 00:00:00', NULL, 0, 'GIANT', 'prd_giant', NULL, 2, NULL),
	(46, '2014-05-07 00:00:00', NULL, 0, 'GT', 'prd_gt', NULL, 2, NULL),
	(47, '2014-05-07 00:00:00', NULL, 0, 'HaiBike', 'prd_haibi', NULL, 2, NULL),
	(48, '2014-05-07 00:00:00', NULL, 0, 'HEAD', 'prd_head', NULL, 2, NULL),
	(49, '2014-05-07 00:00:00', NULL, 0, 'Heavy Tools', 'prd_heavy', NULL, 2, NULL),
	(50, '2014-05-07 00:00:00', NULL, 0, 'HERCULES', 'prd_hercu', NULL, 2, NULL),
	(51, '2014-05-07 00:00:00', NULL, 0, 'HOT WHEELS', 'prd_hot w', NULL, 2, NULL),
	(52, '2014-05-07 00:00:00', NULL, 0, 'INSPORTLINE', 'prd_inspo', NULL, 2, NULL),
	(53, '2014-05-07 00:00:00', NULL, 0, 'Kalkhoff', 'prd_kalkh', NULL, 2, NULL),
	(54, '2014-05-07 00:00:00', NULL, 0, 'KELLYS', 'prd_kelly', NULL, 2, NULL),
	(55, '2014-05-07 00:00:00', NULL, 0, 'Kenzel', 'prd_kenze', NULL, 2, NULL),
	(56, '2014-05-07 00:00:00', NULL, 0, 'Kona', 'prd_kona', NULL, 2, NULL),
	(57, '2014-05-07 00:00:00', NULL, 0, 'KROSS', 'prd_kross', NULL, 2, NULL),
	(58, '2014-05-07 00:00:00', NULL, 0, 'Leader Fox', 'prd_leade', NULL, 2, NULL),
	(60, '2014-05-07 00:00:00', NULL, 0, 'MAKITA', 'prd_makit', NULL, 2, NULL),
	(61, '2014-05-07 00:00:00', NULL, 0, 'Maxima', 'prd_maxim', NULL, 2, NULL),
	(62, '2014-05-07 00:00:00', NULL, 0, 'MERIDA', 'prd_merid', NULL, 2, NULL),
	(63, '2014-05-07 00:00:00', NULL, 0, 'Mondraker', 'prd_mondr', NULL, 2, NULL),
	(64, '2014-05-07 00:00:00', NULL, 0, 'MONGOOSE', 'prd_mongo', NULL, 2, NULL),
	(65, '2014-05-07 00:00:00', NULL, 0, 'Muddyfox', 'prd_muddy', NULL, 2, NULL),
	(66, '2014-05-07 00:00:00', NULL, 0, 'Nerf', 'prd_nerf', NULL, 2, NULL),
	(67, '2014-05-07 00:00:00', NULL, 0, 'NORCO', 'prd_norco', NULL, 2, NULL),
	(68, '2014-05-07 00:00:00', NULL, 0, 'OLPRAN', 'prd_olpra', NULL, 2, NULL),
	(69, '2014-05-07 00:00:00', NULL, 0, 'PELLS', 'prd_pells', NULL, 2, NULL),
	(70, '2014-05-07 00:00:00', NULL, 0, 'POWERSLIDE', 'prd_power', NULL, 2, NULL),
	(71, '2014-05-07 00:00:00', '2014-06-15 02:03:22', 1, 'Puky', 'prd_puky', 1000, 2, 2),
	(72, '2014-05-07 00:00:00', NULL, 0, 'Rappa', 'prd_rappa', NULL, 2, NULL),
	(73, '2014-05-07 00:00:00', NULL, 0, 'RAVO', 'prd_ravo', NULL, 2, NULL),
	(74, '2014-05-07 00:00:00', NULL, 0, 'REFLEX', 'prd_refle', NULL, 2, NULL),
	(75, '2014-05-07 00:00:00', NULL, 0, 'ROCKY MOUNTAIN', 'prd_rocky', NULL, 2, NULL),
	(76, '2014-05-07 00:00:00', NULL, 0, 'Schwinn', 'prd_schwi', NULL, 2, NULL),
	(77, '2014-05-07 00:00:00', '2014-06-15 08:07:14', 1, 'SCOTT', 'prd_scott', 50, 2, 5),
	(78, '2014-05-07 00:00:00', NULL, 0, 'Scott Cyklo', 'prd_scott', NULL, 2, NULL),
	(79, '2014-05-07 00:00:00', NULL, 0, 'Shimano', 'prd_shima', NULL, 2, NULL),
	(80, '2014-05-07 00:00:00', NULL, 0, 'Silverfox', 'prd_silve', NULL, 2, NULL),
	(81, '2014-05-07 00:00:00', NULL, 0, 'SPECIALIZED', 'prd_speci', NULL, 2, NULL),
	(82, '2014-05-07 00:00:00', NULL, 0, 'STR', 'prd_str', NULL, 2, NULL),
	(83, '2014-05-07 00:00:00', NULL, 0, 'STUF', 'prd_stuf', NULL, 2, NULL),
	(84, '2014-05-07 00:00:00', NULL, 0, 'SUPERIOR', 'prd_super', NULL, 2, NULL),
	(85, '2014-05-07 00:00:00', NULL, 0, 'Superman', 'prd_super', NULL, 2, NULL),
	(86, '2014-05-07 00:00:00', NULL, 0, 'TERN', 'prd_tern', NULL, 2, NULL),
	(87, '2014-05-07 00:00:00', NULL, 0, 'TOPEAK', 'prd_topea', NULL, 2, NULL),
	(88, '2014-05-07 00:00:00', NULL, 0, 'Torpado', 'prd_torpa', NULL, 2, NULL),
	(89, '2014-05-07 00:00:00', NULL, 0, 'TREK', 'prd_trek', NULL, 2, NULL),
	(90, '2014-05-07 00:00:00', NULL, 0, 'UMF', 'prd_umf', NULL, 2, NULL),
	(91, '2014-05-07 00:00:00', NULL, 0, 'universal', 'prd_unive', NULL, 2, NULL),
	(92, '2014-05-07 00:00:00', NULL, 0, 'VAUTRON', 'prd_vautr', NULL, 2, NULL),
	(93, '2014-05-07 00:00:00', NULL, 0, 'Vetro-plus', 'prd_vetro', NULL, 2, NULL),
	(94, '2014-05-07 00:00:00', NULL, 0, 'Viking', 'prd_vikin', NULL, 2, NULL),
	(95, '2014-05-07 00:00:00', NULL, 0, 'WINORA', 'prd_winor', NULL, 2, NULL),
	(96, '2014-05-07 00:00:00', NULL, 0, 'Wisper', 'prd_wispe', NULL, 2, NULL),
	(97, '2014-05-07 00:00:00', NULL, 0, 'WORKER', 'prd_worke', NULL, 2, NULL),
	(98, '2014-06-14 21:52:54', '2014-06-15 01:22:26', 2, 'Madison', 'prd_madis', 1000, 5, 2),
	(99, '2014-06-14 21:54:36', '2014-06-14 21:54:36', 0, 'HEAD', 'prd_head', 20, 5, 5);
/*!40000 ALTER TABLE `PRODUCER` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product
DROP TABLE IF EXISTS `PRODUCT`;
CREATE TABLE IF NOT EXISTS `PRODUCT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `BUY_URL` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CAN_SEND_TO_ALL_COUNTRY` bit(1) DEFAULT NULL,
  `DELIVERY_FOR_FREE` bit(1) DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8_czech_ci,
  `DISCOUNT` decimal(19,2) DEFAULT NULL,
  `ENABLED` bit(1) DEFAULT NULL,
  `FINAL_PRICE` decimal(19,2) NOT NULL,
  `PRICE` decimal(19,2) DEFAULT NULL,
  `PRODUCT_NAME` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `PRODUCT_STATE` int(11) DEFAULT NULL,
  `VALID_FROM` datetime DEFAULT NULL,
  `VALID_TO` datetime DEFAULT NULL,
  `WEIGHT` double NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `BICYCLE_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `FIGURE_HEIGHT_ID` bigint(20) DEFAULT NULL,
  `PRODUCER_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_COLOR_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_USAGE_ID` bigint(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_h1mudty2asxysiyi74ir30spv` (`CREATED_ID`),
  KEY `FK_dvx56wdl9qapvlfqumc05c4oe` (`LAST_MODIFIED_ID`),
  KEY `FK_hqwmmht0gcdpnlrpbg7do7ir7` (`PRODUCT_ID`),
  KEY `FK_oc5ooeca0l6gimle8uo979jwe` (`BICYCLE_CATEGORY_ID`),
  KEY `FK_6t6fwpoax5485lfta1ha89rlh` (`CATEGORY_ID`),
  KEY `FK_mat3d1nlrjhsdyq9eu9wplbsx` (`FIGURE_HEIGHT_ID`),
  KEY `FK_p4tbeci5384m88ypcrouapxtc` (`PRODUCER_ID`),
  KEY `FK_ikr28obncik165j8dlmkcocit` (`PRODUCT_COLOR_ID`),
  KEY `FK_ovmxhqqkejg87xt23y7pkn4t` (`PRODUCT_USAGE_ID`),
  KEY `FK_e7x61n614plid9vikljs1u5ut` (`SELLER_ID`),
  CONSTRAINT `FK_6t6fwpoax5485lfta1ha89rlh` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`ID`),
  CONSTRAINT `FK_dvx56wdl9qapvlfqumc05c4oe` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_e7x61n614plid9vikljs1u5ut` FOREIGN KEY (`SELLER_ID`) REFERENCES `SELLER` (`ID_ID`),
  CONSTRAINT `FK_h1mudty2asxysiyi74ir30spv` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_hqwmmht0gcdpnlrpbg7do7ir7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_ikr28obncik165j8dlmkcocit` FOREIGN KEY (`PRODUCT_COLOR_ID`) REFERENCES `PRODUCT_COLOR` (`ID`),
  CONSTRAINT `FK_mat3d1nlrjhsdyq9eu9wplbsx` FOREIGN KEY (`FIGURE_HEIGHT_ID`) REFERENCES `FIGURE_HEIGHT` (`ID`),
  CONSTRAINT `FK_oc5ooeca0l6gimle8uo979jwe` FOREIGN KEY (`BICYCLE_CATEGORY_ID`) REFERENCES `BICYCLE_CATEGORY` (`ID`),
  CONSTRAINT `FK_ovmxhqqkejg87xt23y7pkn4t` FOREIGN KEY (`PRODUCT_USAGE_ID`) REFERENCES `PRODUCT_USAGE` (`ID`),
  CONSTRAINT `FK_p4tbeci5384m88ypcrouapxtc` FOREIGN KEY (`PRODUCER_ID`) REFERENCES `PRODUCER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product: ~33 rows (přibližně)
DELETE FROM `PRODUCT`;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `BUY_URL`, `CAN_SEND_TO_ALL_COUNTRY`, `DELIVERY_FOR_FREE`, `DESCRIPTION`, `DISCOUNT`, `ENABLED`, `FINAL_PRICE`, `PRICE`, `PRODUCT_NAME`, `PRODUCT_STATE`, `VALID_FROM`, `VALID_TO`, `WEIGHT`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PRODUCT_ID`, `BICYCLE_CATEGORY_ID`, `CATEGORY_ID`, `FIGURE_HEIGHT_ID`, `PRODUCER_ID`, `PRODUCT_COLOR_ID`, `PRODUCT_USAGE_ID`, `SELLER_ID`) VALUES
	(1, '2014-07-23 23:21:07', '2014-06-14 21:38:25', 10, 'http://www.carosello.cz', b'1', b'0', 'Model Cult prezentuje z pohledu značky AGang nejuniverzálnější kolo do horského terénu. Na konstrukci, funkci i designu modelu pracoval tvůrčí tým několik let. Získané zkušenosti umožnily vyladit jeho originální čtyř-čepový systém tak, aby poskytoval maximální komfort odpružení, ovladatelnost v náročnějších terénních pasážích či sjezdech, ale také minimální ztráty při šlapání. Schopnosti modelu Cult vycházejí především z použitých technologií, konstrukčních prvků a geometrie jeho celoodpruženého rámu. Ten disponuje zdvihem 150 mm a naším originálním čtyř-čepovým systémem odpružení zvaný Drive Link Pivot, jenž byl kompletně navržen našimi inženýry v Čechách. Tento systém byl optimalizován tak, aby nabídl jezdci aktivní zadní stavbu a zárověň maximálně omezil její pohupování při šlapání, a to hlavně při jízdě vsedě. Citlivost stavby pak ještě zvyšuje použití tlumiče o délce 200 mm se zdvihem 57 mm.', -24001.00, b'1', 50000.00, 25999.00, 'Agang CULT 2.0 2012', 1, '2014-06-14 00:00:00', '2014-06-19 00:00:00', 21, 2, 5, NULL, 1, 2, 1, 30, 1, 1, 6),
	(2, '2014-07-23 23:21:07', '2014-06-15 20:47:59', 5, 'www.novinky.cz', b'1', b'0', 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.', 0.00, b'1', 4590.00, 4590.00, 'A-Gang Capo 16" červená 2012', 1, '2014-06-15 00:00:00', '2014-06-19 00:00:00', 20, 2, 5, NULL, 1, 8, 1, 30, 1, 1, 6),
	(3, '2014-07-23 23:21:07', '2014-06-15 20:48:36', 5, 'www.idnes.cz', b'1', b'0', 'Chcete-li rychlost a efektivitu, pak je silniční kolo pro Vás. Díky aerodynamické konstrukci...', 10000.00, b'1', 20000.00, 30000.00, 'AUTHOR A 33 2013', 1, '2014-06-15 00:00:00', '2014-06-28 00:00:00', 20, 2, 5, NULL, 1, 11, 1, 30, 1, 1, 4),
	(4, '2014-07-23 23:21:07', '2014-05-03 17:08:38', 4, 'http://www.novinky.cz', b'1', b'1', 'Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...', 7000.00, b'1', 0.00, 53900.00, 'Merida Big Ninety-Nine CF Team', 1, '2014-06-15 00:00:00', '2014-05-11 00:00:00', 20, 2, 2, NULL, 1, 11, 1, 30, 1, 1, 4),
	(5, '2014-07-23 23:21:07', '2014-05-03 17:08:52', 3, 'http://www.novinky.cz', b'1', b'0', 'Kolo4', 5000.00, b'1', 0.00, 50000.00, 'Kolo4', 1, '2014-06-15 00:00:00', '2014-05-11 00:00:00', 15, 2, 2, NULL, 1, 2, 1, 30, 1, 1, 6),
	(6, '2014-07-23 23:21:07', '2014-05-03 17:09:04', 2, 'http://www.novinky.cz', b'1', b'0', 'Kolo 5', 1000.00, b'1', 0.00, 23000.00, 'Kolo 5', 1, '2014-06-15 00:00:00', '2014-05-11 00:00:00', 10, 2, 2, NULL, 1, 2, 1, 30, 1, 1, 6),
	(7, '2014-07-23 23:21:07', '2014-05-12 12:06:45', 4, 'http://www.novinky.cz', b'1', b'1', 'Kolo 6', 2300.00, b'1', 0.00, 42000.00, 'Kolo 6', 1, '2014-06-15 00:00:00', '2014-05-11 00:00:00', 6, 2, 2, NULL, 1, 15, 7, 30, 1, 1, 4),
	(10, '2014-03-31 13:07:06', '2014-06-15 20:45:36', 12, 'http://www.novinky.cz', b'1', b'0', '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', 0.00, b'1', 1111.00, 1111.00, 'Tryskové kolo', 1, '2014-06-15 00:00:00', '2014-12-31 00:00:00', 30, 5, 5, NULL, 1, 8, 1, 30, 1, 1, 6),
	(11, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 8, 'http://union002.hys.cz', b'1', b'1', ' Nové kolo je 30 let staré ale zcela nefunkční...', 0.00, b'1', 100000.00, 100000.00, 'Nové kolo', 1, '2014-06-15 00:00:00', '2014-06-30 00:00:00', 0, 5, 5, NULL, 1, 2, 11, 77, 1, 1, 6),
	(12, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, 'http://union002.hys.cz', b'1', b'1', ' Kolo, které jezdí samo.<div>aaaaa</div><div>bbbbb</div><div>cccccc</div><div>dddddd</div><div>eeeeee</div><div>ffffffff</div><div>ggggggg</div><div>hhhhhhhh</div><div>iiiiiiiiiiiiiii</div><div>jjjjjjjjjj</div><div>kkkkkkk</div><div>lllllllllllll</div><div>mmmmmmmmm</div><div>nnnnnnnnnnnn</div><div>oooooooooo</div><div>pppppppppp</div><div>qqqqqqqqqqq</div><div>rrrrrrrrrrrrrrrr</div><div>sssssssss</div><div>ttttttttttttttt</div><div>uuuuuuuuu</div>', 50000.00, b'1', 450000.00, 500000.00, 'Kolo pro Michalku', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 0, 5, 2, NULL, 4, 8, 6, 23, 17, 3, 6),
	(13, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, 'http://www.idnes.cz/#utm_source=idnes&utm_medium=text&utm_content=top-navigace', b'1', b'1', ' Zakládám tento inzerát, abych se ujistil, že prodejce může vkládat nové inzeráty. Když žádný inzerát nemá, tak nejsou u seznamu inzerátu žádné ovládací prvky na nový.<div><br /></div><div>Test odchodu ze stránky bez uložení</div>', 99000.00, b'1', 1000.00, 100000.00, 'První kolo od prodejce Toma', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 0, 5, 5, NULL, 1, 2, 12, 37, 15, 1, 4),
	(17, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', b'1', b'0', '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', 0.00, b'1', 19000.00, 19000.00, 'Gary Fischer', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 0, 14, 5, NULL, 1, 2, 9, 89, 5, 1, 14),
	(18, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, 'http://www.novinky.cz', b'0', b'0', ' Je to horské kolo, které je vysoce kvalitní.', 0.00, b'1', 125000.00, 125000.00, 'kolo frantík', 1, '2014-06-15 00:00:00', '9999-12-12 00:00:00', 0, 7, 5, NULL, 1, 2, 8, 35, 1, 1, 4),
	(19, '2014-05-24 22:17:16', '2014-06-14 21:35:55', 15, 'http://www.novinky.cz', b'1', b'0', 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', 150000.00, b'0', 10000.00, 160000.00, 'Frantíkova 1. tříkolka III. verze', 2, '2014-06-01 00:00:00', '2014-06-14 21:35:55', 0, 7, 5, NULL, 3, 21, 1, 34, 19, 2, 4),
	(20, '2014-06-14 20:10:10', '2014-06-15 20:42:22', 1, 'http://www.novinky.cz', b'1', b'0', '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', 1.00, b'1', 2000.00, 2001.00, 'Tryskové kolo', 1, '2014-06-15 00:00:00', '2014-12-31 00:00:00', 30, 5, 5, 10, 1, 8, 1, 30, 1, 1, 6),
	(21, '2014-06-14 20:24:52', '2014-06-15 20:41:37', 3, 'http://www.novinky.cz', b'1', b'0', 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', 150000.00, b'0', 10000.00, 160000.00, 'Frantíkova 1. tříkolka II. verze', 2, '2014-06-01 00:00:00', '2014-06-15 20:41:37', 1, 2, 5, 19, 3, 21, 1, 34, 19, 2, 4),
	(22, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, 'http://www.novinky.cz', b'1', b'0', 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', 60000.00, b'1', 100000.00, 160000.00, 'Frantíkova 1. tříkolka', 1, '2014-06-14 00:00:00', '9999-12-12 00:00:00', 1, 2, 5, 19, 3, 21, 1, 34, 19, 2, 4),
	(23, '2014-06-14 20:39:53', '2014-06-14 20:45:25', 2, 'http://www.novinky.cz', b'1', b'0', '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', 111.00, b'1', 1000.00, 1111.00, 'Tryskové kolo', 1, '2014-06-14 00:00:00', '2014-12-31 00:00:00', 30, 2, 2, 20, 1, 8, 1, 30, 1, 1, 6),
	(24, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, 'http://union002.hys.cz', b'1', b'1', ' Nové kolo je 30 let staré ale zcela nefunkční...', 90000.00, b'1', 10000.00, 100000.00, 'Nové kolo', 1, '2014-06-15 00:00:00', '2014-06-29 00:00:00', 3, 2, 2, 11, 1, 2, 11, 77, 1, 1, 6),
	(25, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', b'1', b'0', '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', 1000.00, b'1', 19000.00, 20000.00, 'Gary Fischer III.verze', 1, '2014-06-14 00:00:00', '9999-12-31 00:00:00', 15, 5, 5, 17, 1, 2, 9, 89, 5, 1, 14),
	(26, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', b'1', b'0', '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', 0.00, b'1', 19000.00, 19000.00, 'Gary Fischer II.verze', 1, '2014-06-21 00:00:00', '9999-12-31 00:00:00', 15, 5, 5, 17, 1, 2, 9, 89, 5, 1, 14),
	(27, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', b'1', b'0', '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', 1000.00, b'1', 19000.00, 20000.00, 'Gary Fischer - ORIG', 1, '2014-06-14 00:00:00', '9999-12-31 00:00:00', 15, 5, 2, 17, 1, 2, 9, 89, 5, 1, 14),
	(28, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 4, 'https://docs.google.com/spreadsheet/ccc?key=0AhT8_xYbtdUOdEgzZzRJak9yTEMyWWRvRUVWY1EwVFE&usp=drive_web#gid=0', b'1', b'0', 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.', 3590.00, b'1', 1000.00, 4590.00, 'A-Gang Capo 16" červená 2012', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 20, 2, 5, 2, 1, 8, 1, 30, 1, 1, 6),
	(29, '2014-06-15 17:54:46', '2014-09-28 22:35:28', 4, 'http://www.novinky.cz', b'1', b'0', 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', 150000.00, b'1', 10000.00, 160000.00, 'Frantíkova 1. tříkolka III. verze', 1, '2014-06-15 00:00:00', '2014-06-16 00:00:00', 1, 2, 5, 19, 3, 21, 1, 34, 19, 2, 4),
	(30, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 3, 'http://www.novinky.cz', b'1', b'0', 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', 150000.00, b'1', 10000.00, 160000.00, 'Frantíkova 1. tříkolka III. verze', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 1, 2, 2, 19, 3, 21, 1, 34, 19, 2, 4),
	(31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 1, 'http://www.novinky.cz', b'1', b'0', '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', 97999.00, b'1', 2000.00, 99999.00, 'Tryskové kolo', 1, '2014-06-15 00:00:00', '2014-12-31 00:00:00', 30, 5, 5, 20, 1, 8, 1, 30, 1, 1, 6),
	(32, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 5, 'http://union002.hys.cz', b'1', b'1', ' Nové kolo je 30 let staré ale zcela nefunkční...', 50000.00, b'1', 50000.00, 100000.00, 'Nové kolo II.verze', 1, '2014-06-15 00:00:00', '9999-12-31 00:00:00', 3, 5, 5, 11, 1, 2, 11, 77, 1, 1, 6),
	(33, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 17, 'http://www.novinky.cz', b'0', b'0', ' Je to horské kolo, které je vysoce kvalitní.', 0.00, b'1', 125000.00, 125000.00, 'kolo frantík II.verzeAAAA AAAAAAAAAAAAAAAAAAA12345', 1, '2014-06-16 00:00:00', '9999-12-12 00:00:00', 4, 5, 2, 18, 1, 2, 8, 35, 1, 1, 4),
	(34, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 10, 'http://www.idnes.cz/#utm_source=idnes&utm_medium=text&utm_content=top-navigace', b'1', b'1', ' Zakládám tento inzerát, abych se ujistil, že prodejce může vkládat nové inzeráty. Když žádný inzerát nemá, tak nejsou u seznamu inzerátu žádné ovládací prvky na nový.<div><br /></div><div>Test odchodu ze stránky bez uložení</div>', 99000.00, b'1', 1000.00, 100000.00, 'První kolo od prodejce Toma II.verze   abcdefg', 1, '2014-06-28 00:00:00', '9999-12-31 00:00:00', 12, 7, 5, 13, 1, 2, 12, 37, 15, 1, 4),
	(35, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 0, 'vit.ratislav@seznam.cz', b'1', b'0', 'Kolo stavěné pro nejhrubší zacházení. Ideální do půjčoven a pro jízdy do míst s rizikem krádeže. Tohle kolo je tak odporné, že i ti největší nenechavci nad ním ohrnou nos. <b>Buďte COOL a pořiďte si nezničitelné kolo, vyrobené na území bývalého SSSR</b>', 3090.00, b'1', 9900.00, 12990.00, 'Ukrajina', 1, '2014-10-02 00:00:00', '9999-12-31 00:00:00', 19, 6, 6, NULL, 1, 18, 10, 88, 5, 2, 5),
	(36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, 'vit.ratislav@seznam.cz', b'1', b'0', 'zkouška', 3000.00, b'1', 12000.00, 15000.00, 'zkouška jaká cena se objeví u prodejce', 1, '2014-10-03 00:00:00', '9999-12-31 00:00:00', 10, 6, 6, NULL, 4, 2, 9, 24, 14, 2, 4),
	(37, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, 'https://docs.jboss.org/hibernate/orm/3.3/reference/en/html/components.html', b'1', b'1', ' test', 177000.00, b'1', 23000.00, 200000.00, 'test', 1, '2014-10-04 00:00:00', '9999-12-31 00:00:00', 45, 2, 2, NULL, 2, 2, 4, 24, 11, 2, 4),
	(38, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, 'http://ahoj', b'1', b'1', ' test', 27000.00, b'1', 3000.00, 30000.00, 'test', 1, '2014-10-05 00:00:00', '9999-12-31 00:00:00', 30, 2, 2, NULL, 2, 2, 4, 24, NULL, 2, 4),
	(39, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, 'http://test', b'0', b'0', '', 27000.00, b'1', 3000.00, 30000.00, 'test', 1, '2014-10-05 00:00:00', '9999-12-31 00:00:00', 40, 2, 2, NULL, 2, 2, 4, 24, NULL, 2, 4);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product_attribute
DROP TABLE IF EXISTS `PRODUCT_ATTRIBUTE`;
CREATE TABLE IF NOT EXISTS `PRODUCT_ATTRIBUTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ATTRIBUTE_VALUE` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_TYPE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_onscn5vlf8boou38pvxooqbmd` (`CREATED_ID`),
  KEY `FK_jigly7glwaisxgnvxjvilhak0` (`LAST_MODIFIED_ID`),
  KEY `FK_6h8m6ocg2jhu3bfieqa0dupb1` (`PRODUCT_ID`),
  KEY `FK_cdugk8tgii0svs97t787exkm8` (`ATTRIBUTE_TYPE_ID`),
  CONSTRAINT `FK_6h8m6ocg2jhu3bfieqa0dupb1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_cdugk8tgii0svs97t787exkm8` FOREIGN KEY (`ATTRIBUTE_TYPE_ID`) REFERENCES `product_attribute_type` (`ID`),
  CONSTRAINT `FK_jigly7glwaisxgnvxjvilhak0` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_onscn5vlf8boou38pvxooqbmd` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product_attribute: ~122 rows (přibližně)
DELETE FROM `PRODUCT_ATTRIBUTE`;
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `PRODUCT_ATTRIBUTE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ATTRIBUTE_VALUE`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PRODUCT_ID`, `ATTRIBUTE_TYPE_ID`) VALUES
	(2, NULL, NULL, 0, '2 roky', NULL, NULL, 1, 2),
	(4, NULL, NULL, 0, 'tyrkysová', NULL, NULL, 1, 4),
	(7, NULL, NULL, 0, 'červená', NULL, NULL, 2, 4),
	(8, NULL, NULL, 0, 'černá', NULL, NULL, 5, 4),
	(13, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 8, '2 roky', 5, 5, 11, 2),
	(14, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 8, 'červená', 5, 5, 11, 4),
	(15, '2014-05-11 12:16:47', '2014-06-15 20:48:36', 2, '2 roky', 5, 5, 3, 2),
	(16, '2014-05-11 12:17:33', '2014-06-15 20:48:36', 2, '3 roky', 5, 5, 3, 2),
	(17, '2014-05-11 12:21:58', '2014-06-15 20:48:36', 2, 'červená', 5, 5, 3, 4),
	(18, '2014-05-11 12:25:21', '2014-06-15 20:48:36', 2, '4 roky', 5, 5, 3, 2),
	(21, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '2 roky', 5, 2, 12, 2),
	(22, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '', 5, 2, 12, 4),
	(23, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '14"', 5, 2, 12, 7),
	(24, '2014-05-18 22:29:32', '2014-06-15 20:45:06', 1, '27"', 5, 5, 11, 7),
	(25, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, '1,5 roku', 5, 5, 13, 2),
	(26, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, 'Perleťová a hnědá a fialová', 5, 5, 13, 4),
	(27, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, '', 5, 5, 13, 7),
	(28, '2014-05-21 02:09:23', '2014-06-15 20:43:56', 10, '', 5, 5, 13, 8),
	(41, '2014-05-24 13:47:18', '2014-08-16 00:57:19', 6, '', 5, 2, 12, 8),
	(42, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '24 měsíců', 14, 5, 17, 2),
	(43, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, 'bílá', 14, 5, 17, 4),
	(44, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '19"', 14, 5, 17, 7),
	(45, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '', 14, 5, 17, 8),
	(46, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '', 7, 5, 18, 2),
	(47, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, 'červená', 7, 5, 18, 4),
	(48, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '1,3', 7, 5, 18, 7),
	(49, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '', 7, 5, 18, 8),
	(50, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 19, 2),
	(51, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, 'tyrkysova', 7, 5, 19, 4),
	(52, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 19, 7),
	(53, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, 'test', 7, 5, 19, 8),
	(54, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 21, 2),
	(55, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 'tyrkysova', 2, 5, 21, 4),
	(56, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 21, 7),
	(57, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 'test', 2, 5, 21, 8),
	(58, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 22, 2),
	(59, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, 'tyrkysova', 2, 5, 22, 4),
	(60, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 22, 7),
	(61, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, 'test', 2, 5, 22, 8),
	(62, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 4),
	(63, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 2),
	(64, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 7),
	(65, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 8),
	(66, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '2 roky', 2, 2, 24, 2),
	(67, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, 'červená', 2, 2, 24, 4),
	(68, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '27"', 2, 2, 24, 7),
	(69, '2014-06-14 20:42:30', '2014-06-14 20:42:30', 0, '', 2, 2, 24, 8),
	(70, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '24 měsíců', 5, 5, 25, 2),
	(71, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, 'bílá', 5, 5, 25, 4),
	(72, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '19"', 5, 5, 25, 7),
	(73, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '', 5, 5, 25, 8),
	(74, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '24 měsíců', 5, 5, 26, 2),
	(75, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, 'bílá', 5, 5, 26, 4),
	(76, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '19"', 5, 5, 26, 7),
	(77, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '', 5, 5, 26, 8),
	(78, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '24 měsíců', 5, 2, 27, 2),
	(79, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, 'bílá', 5, 2, 27, 4),
	(80, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '19"', 5, 2, 27, 7),
	(81, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '', 5, 2, 27, 8),
	(82, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 1, '', 5, 5, 1, 7),
	(83, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 1, '', 5, 5, 1, 8),
	(84, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, 'červená', 2, 5, 28, 4),
	(85, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 28, 2),
	(86, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 28, 7),
	(87, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 28, 8),
	(88, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 29, 2),
	(89, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 'tyrkysova', 2, 5, 29, 4),
	(90, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 29, 7),
	(91, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 'test', 2, 5, 29, 8),
	(92, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 30, 2),
	(93, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 'tyrkysova', 2, 2, 30, 4),
	(94, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 30, 7),
	(95, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 'test', 2, 2, 30, 8),
	(96, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 4),
	(97, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 2),
	(98, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 7),
	(99, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 8),
	(100, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '2 roky', 5, 5, 32, 2),
	(101, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, 'červená', 5, 5, 32, 4),
	(102, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '27"', 5, 5, 32, 7),
	(103, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '', 5, 5, 32, 8),
	(104, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 4),
	(105, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 2),
	(106, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 7),
	(107, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 8),
	(108, '2014-06-15 20:45:06', '2014-06-15 20:45:06', 0, '', 5, 5, 11, 8),
	(109, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 4),
	(110, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 2),
	(111, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 7),
	(112, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 8),
	(117, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 2),
	(118, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 7),
	(119, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 8),
	(120, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 0, '', 5, 5, 3, 7),
	(121, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 0, '', 5, 5, 3, 8),
	(122, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 33, 2),
	(123, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 33, 4),
	(124, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '1,3', 5, 2, 33, 7),
	(125, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 33, 8),
	(126, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 9, '1,5 roku', 7, 5, 34, 2),
	(127, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 9, 'Perleťová a hnědá a fialová', 7, 5, 34, 4),
	(128, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 9, '', 7, 5, 34, 7),
	(129, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 9, '', 7, 5, 34, 8),
	(130, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 0, 'chromová', 6, 6, 35, 4),
	(131, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 0, 'co je to testovací atribut?', 6, 6, 35, 8),
	(132, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 0, '19"', 6, 6, 35, 7),
	(133, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 0, 'bez záruky', 6, 6, 35, 2),
	(134, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 4),
	(135, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 9),
	(136, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 8),
	(137, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 7),
	(138, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 2),
	(139, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 4),
	(140, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 9),
	(141, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, 'Testik', 2, 2, 37, 8),
	(142, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 7),
	(143, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, 'Testcccc', 2, 2, 37, 2),
	(144, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, 'test', 2, 2, 38, 4),
	(145, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, 'test', 2, 2, 38, 9),
	(146, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, '', 2, 2, 38, 8),
	(147, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, '', 2, 2, 38, 7),
	(148, '2014-10-05 11:23:48', '2014-10-05 11:23:48', 0, '', 2, 2, 38, 2),
	(149, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 4),
	(150, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 9),
	(151, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 8),
	(152, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 7),
	(153, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 2);
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product_attribute_type
DROP TABLE IF EXISTS `PRODUCT_ATTRIBUTE_TYPE`;
CREATE TABLE IF NOT EXISTS `PRODUCT_ATTRIBUTE_TYPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  `UNITS` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_mbl5lgsvkudd9o5ibjpop0blb` (`CREATED_ID`),
  KEY `FK_l1smb5oyq0svfltyt4c0qvv3m` (`LAST_MODIFIED_ID`),
  KEY `FK_c49l7fsj3jj00hr7w8tqk7peh` (`CATEGORY_TYPE_ID`),
  CONSTRAINT `FK_c49l7fsj3jj00hr7w8tqk7peh` FOREIGN KEY (`CATEGORY_TYPE_ID`) REFERENCES `CATEGORY_TYPE` (`ID`),
  CONSTRAINT `FK_l1smb5oyq0svfltyt4c0qvv3m` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_mbl5lgsvkudd9o5ibjpop0blb` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product_attribute_type: ~5 rows (přibližně)
DELETE FROM `PRODUCT_ATTRIBUTE_TYPE`;
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE_TYPE` DISABLE KEYS */;
INSERT INTO `PRODUCT_ATTRIBUTE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `REQUIRED`, `UNITS`, `CREATED_ID`, `LAST_MODIFIED_ID`, `CATEGORY_TYPE_ID`) VALUES
	(2, NULL, '2014-06-12 01:22:54', 1, 'Záruka', 'pat.bike.guarantee', 100, b'0', '', NULL, 2, 1),
	(4, NULL, '2014-06-14 19:52:52', 3, 'Doplňující barva', 'pat.bike.color', 10000, b'0', '', NULL, 2, 1),
	(7, '2014-05-16 23:52:46', '2014-06-12 01:23:11', 4, 'Velikost kola', 'pat.bike.bikesize', 100, b'0', '', 2, 2, 1),
	(8, '2014-05-21 02:07:59', '2014-06-12 01:22:44', 1, 'Testovací atribut', 'pat.bike.test', 100, b'0', 'mm', 5, 2, 1),
	(9, '2014-10-03 07:38:01', '2014-10-03 07:38:01', 0, 'Možnost koupit na úvěr', 'pat.bike.loan', 100, b'0', '', 5, 5, 1);
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE_TYPE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product_color
DROP TABLE IF EXISTS `PRODUCT_COLOR`;
CREATE TABLE IF NOT EXISTS `PRODUCT_COLOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fhbbt4a4ivx4gghpu8uocgbv` (`CREATED_ID`),
  KEY `FK_hpcmjjdvptxf0xy952m5tqep8` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_fhbbt4a4ivx4gghpu8uocgbv` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_hpcmjjdvptxf0xy952m5tqep8` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product_color: ~19 rows (přibližně)
DELETE FROM `PRODUCT_COLOR`;
/*!40000 ALTER TABLE `PRODUCT_COLOR` DISABLE KEYS */;
INSERT INTO `PRODUCT_COLOR` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-05-18 00:57:17', '2014-05-18 00:57:17', 0, 'Bílá', 'col_white', NULL, 2, 2),
	(2, '2014-05-18 00:57:34', '2014-05-18 00:57:34', 0, 'Žlutá', 'col_yellow', NULL, 2, 2),
	(3, '2014-05-18 00:57:57', '2014-05-18 00:57:57', 0, 'Purpurová', 'col_purple', NULL, 2, 2),
	(4, '2014-05-18 00:58:19', '2014-05-18 00:58:19', 0, 'Azurová', 'col_azure', NULL, 2, 2),
	(5, '2014-05-18 00:58:53', '2014-05-18 00:58:53', 0, 'Červená', 'col_red', NULL, 2, 2),
	(6, '2014-05-18 00:59:12', '2014-05-18 00:59:12', 0, 'Světle zelená', 'col_lgreen', NULL, 2, 2),
	(7, '2014-05-18 00:59:22', '2014-05-18 00:59:22', 0, 'Modrá', 'col_blue', NULL, 2, 2),
	(8, '2014-05-18 00:59:41', '2014-05-18 00:59:41', 0, 'Černá', 'col_black', NULL, 2, 2),
	(9, '2014-05-18 00:59:54', '2014-05-18 00:59:54', 0, 'Zelená', 'col_green', NULL, 2, 2),
	(10, '2014-05-18 01:00:07', '2014-05-18 01:00:07', 0, 'Hnědá', 'col_brown', NULL, 2, 2),
	(11, '2014-05-18 01:00:23', '2014-05-18 01:00:23', 0, 'Olivová', 'col_olive', NULL, 2, 2),
	(12, '2014-05-18 01:00:44', '2014-05-18 01:00:44', 0, 'Fialová', 'col_violet', NULL, 2, 2),
	(13, '2014-05-18 01:01:00', '2014-05-18 01:01:00', 0, 'Šedá', 'col_gray', NULL, 2, 2),
	(14, '2014-05-18 01:01:24', '2014-05-18 01:01:24', 0, 'Tmavě šedá', 'col_dblue', NULL, 2, 2),
	(15, '2014-05-18 01:01:48', '2014-05-18 01:01:48', 0, 'Modro-zelená', 'col_bluegreen', NULL, 2, 2),
	(16, '2014-05-18 01:02:05', '2014-05-18 01:02:05', 0, 'Světle šedá', 'col_lgray', NULL, 2, 2),
	(17, '2014-05-18 01:02:18', '2014-05-18 01:02:18', 0, 'Oranžová', 'col_orange', NULL, 2, 2),
	(18, '2014-05-18 01:02:35', '2014-05-18 01:02:35', 0, 'Stříbrná', 'col_silver', NULL, 2, 2),
	(19, '2014-05-18 22:01:13', '2014-05-18 22:01:13', 0, 'Růžová', 'col_pink', NULL, 5, 5);
/*!40000 ALTER TABLE `PRODUCT_COLOR` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product_comment
DROP TABLE IF EXISTS `PRODUCT_COMMENT`;
CREATE TABLE IF NOT EXISTS `PRODUCT_COMMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_jpt7usvsn3h869cret1uba2hr` (`CREATED_ID`),
  KEY `FK_lq7ng0nthdvxqjbefd1sfig74` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_jpt7usvsn3h869cret1uba2hr` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_lq7ng0nthdvxqjbefd1sfig74` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product_comment: ~0 rows (přibližně)
DELETE FROM `PRODUCT_COMMENT`;
/*!40000 ALTER TABLE `PRODUCT_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_COMMENT` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.product_usage
DROP TABLE IF EXISTS `PRODUCT_USAGE`;
CREATE TABLE IF NOT EXISTS `PRODUCT_USAGE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_7jc95wc5783ojo2xbmk31cyv8` (`CREATED_ID`),
  KEY `FK_n7fjcq4k3mo7140gd70ql7x3` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_7jc95wc5783ojo2xbmk31cyv8` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_n7fjcq4k3mo7140gd70ql7x3` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.product_usage: ~4 rows (přibližně)
DELETE FROM `PRODUCT_USAGE`;
/*!40000 ALTER TABLE `PRODUCT_USAGE` DISABLE KEYS */;
INSERT INTO `PRODUCT_USAGE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-04-14 20:59:57', '2014-04-14 20:59:57', 0, 'Terénní', 'usage_terrain', NULL, 5, 5),
	(2, '2014-05-03 17:37:27', '2014-05-03 17:37:27', 0, 'Asfalt', 'usage_asphalt', NULL, 5, 5),
	(3, '2014-05-03 17:38:54', '2014-05-03 17:38:54', 0, 'Lehký terén', 'usage_easyterrain', NULL, 5, 5),
	(4, '2014-05-03 17:39:55', '2014-05-03 17:39:55', 0, 'Sjezdová kola', 'usage_downhill', NULL, 5, 5);
/*!40000 ALTER TABLE `PRODUCT_USAGE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.rate
DROP TABLE IF EXISTS `RATE`;
CREATE TABLE IF NOT EXISTS `RATE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ENTITY_ID` bigint(20) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `RATE_TYPE` int(11) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_r8tq3l1asnnegemgqb74io4i7` (`CREATED_ID`),
  KEY `FK_acb1vjrdtxr36erwi3663x9pk` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_acb1vjrdtxr36erwi3663x9pk` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_r8tq3l1asnnegemgqb74io4i7` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.rate: ~427 rows (přibližně)
DELETE FROM `RATE`;
/*!40000 ALTER TABLE `RATE` DISABLE KEYS */;
INSERT INTO `RATE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ENTITY_ID`, `IP_ADDRESS`, `RATE_TYPE`, `VALUE`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-07-17 18:37:03', '2014-07-17 18:37:03', 0, 4, NULL, 0, 3, 5, 5),
	(2, '2014-07-17 18:37:03', '2014-07-17 18:37:03', 0, 4, NULL, 0, 3, 5, 5),
	(3, '2014-07-17 18:37:06', '2014-07-17 18:37:06', 0, 4, NULL, 0, 4, 5, 5),
	(4, '2014-07-17 18:37:45', '2014-07-17 18:37:45', 0, 4, NULL, 0, 5, 5, 5),
	(5, '2014-07-17 18:37:50', '2014-07-17 18:37:50', 0, 4, NULL, 0, 2, 5, 5),
	(6, '2014-07-17 18:37:52', '2014-07-17 18:37:52', 0, 4, NULL, 0, 1, 5, 5),
	(7, '2014-07-17 18:38:15', '2014-07-17 18:38:15', 0, 4, NULL, 0, 3, 5, 5),
	(8, '2014-07-17 18:38:18', '2014-07-17 18:38:18', 0, 4, NULL, 0, 4, 5, 5),
	(9, '2014-07-17 18:40:33', '2014-07-17 18:40:33', 0, 4, NULL, 0, 4, 5, 5),
	(10, '2014-07-17 19:04:14', '2014-07-17 19:04:14', 0, 4, NULL, 0, 2, 5, 5),
	(11, '2014-07-17 19:04:16', '2014-07-17 19:04:16', 0, 4, NULL, 0, 3, 5, 5),
	(12, '2014-07-17 19:04:18', '2014-07-17 19:04:18', 0, 4, NULL, 0, 1, 5, 5),
	(13, '2014-07-17 19:34:55', '2014-07-17 19:34:55', 0, 3, NULL, 0, 3, 5, 5),
	(14, '2014-07-17 19:34:58', '2014-07-17 19:34:58', 0, 3, NULL, 0, 5, 5, 5),
	(15, '2014-07-18 20:13:52', '2014-07-18 20:13:52', 0, 8, NULL, 0, 3, 5, 5),
	(16, '2014-07-18 20:13:55', '2014-07-18 20:13:55', 0, 8, NULL, 0, 5, 5, 5),
	(17, '2014-07-18 20:13:57', '2014-07-18 20:13:57', 0, 8, NULL, 0, 1, 5, 5),
	(18, '2014-07-18 20:13:58', '2014-07-18 20:13:58', 0, 8, NULL, 0, 1, 5, 5),
	(19, '2014-07-18 20:14:01', '2014-07-18 20:14:01', 0, 8, NULL, 0, 1, 5, 5),
	(20, '2014-07-18 20:14:03', '2014-07-18 20:14:03', 0, 8, NULL, 0, 1, 5, 5),
	(21, '2014-07-18 20:14:03', '2014-07-18 20:14:03', 0, 8, NULL, 0, 1, 5, 5),
	(22, '2014-07-18 20:14:05', '2014-07-18 20:14:05', 0, 8, NULL, 0, 1, 5, 5),
	(23, '2014-07-18 20:14:05', '2014-07-18 20:14:05', 0, 8, NULL, 0, 1, 5, 5),
	(24, '2014-07-18 20:14:06', '2014-07-18 20:14:06', 0, 8, NULL, 0, 1, 5, 5),
	(25, '2014-07-18 20:14:06', '2014-07-18 20:14:06', 0, 8, NULL, 0, 1, 5, 5),
	(26, '2014-07-18 20:14:06', '2014-07-18 20:14:06', 0, 8, NULL, 0, 1, 5, 5),
	(27, '2014-07-18 20:14:07', '2014-07-18 20:14:07', 0, 8, NULL, 0, 1, 5, 5),
	(28, '2014-07-18 20:14:07', '2014-07-18 20:14:07', 0, 8, NULL, 0, 1, 5, 5),
	(29, '2014-07-18 20:14:07', '2014-07-18 20:14:07', 0, 8, NULL, 0, 1, 5, 5),
	(30, '2014-07-18 20:14:07', '2014-07-18 20:14:07', 0, 8, NULL, 0, 1, 5, 5),
	(31, '2014-07-18 20:14:08', '2014-07-18 20:14:08', 0, 8, NULL, 0, 1, 5, 5),
	(32, '2014-07-18 20:14:10', '2014-07-18 20:14:10', 0, 8, NULL, 0, 1, 5, 5),
	(33, '2014-07-18 20:14:11', '2014-07-18 20:14:11', 0, 8, NULL, 0, 1, 5, 5),
	(34, '2014-07-18 20:14:13', '2014-07-18 20:14:13', 0, 8, NULL, 0, 1, 5, 5),
	(35, '2014-07-18 20:14:13', '2014-07-18 20:14:13', 0, 8, NULL, 0, 1, 5, 5),
	(36, '2014-07-23 17:07:09', '2014-07-23 17:07:09', 0, 11, NULL, 0, 5, 2, 2),
	(37, '2014-07-23 17:07:11', '2014-07-23 17:07:11', 0, 11, NULL, 0, 3, 2, 2),
	(38, '2014-07-23 17:07:13', '2014-07-23 17:07:13', 0, 11, NULL, 0, 1, 2, 2),
	(39, '2014-07-23 17:07:15', '2014-07-23 17:07:15', 0, 11, NULL, 0, 5, 2, 2),
	(40, '2014-07-23 17:07:17', '2014-07-23 17:07:17', 0, 11, NULL, 0, 5, 2, 2),
	(41, '2014-07-23 17:07:19', '2014-07-23 17:07:19', 0, 11, NULL, 0, 5, 2, 2),
	(42, '2014-07-23 17:07:20', '2014-07-23 17:07:20', 0, 11, NULL, 0, 5, 2, 2),
	(43, '2014-07-23 17:07:21', '2014-07-23 17:07:21', 0, 11, NULL, 0, 5, 2, 2),
	(44, '2014-07-23 17:07:21', '2014-07-23 17:07:21', 0, 11, NULL, 0, 5, 2, 2),
	(45, '2014-07-23 17:07:22', '2014-07-23 17:07:22', 0, 11, NULL, 0, 5, 2, 2),
	(46, '2014-07-23 17:07:22', '2014-07-23 17:07:22', 0, 11, NULL, 0, 5, 2, 2),
	(47, '2014-07-23 19:30:56', '2014-07-23 19:30:56', 0, 12, NULL, 0, 4, 5, 5),
	(48, '2014-07-23 19:30:58', '2014-07-23 19:30:58', 0, 12, NULL, 0, 2, 5, 5),
	(49, '2014-07-23 19:31:01', '2014-07-23 19:31:01', 0, 12, NULL, 0, 1, 5, 5),
	(50, '2014-07-23 19:57:01', '2014-07-23 19:57:01', 0, 12, NULL, 0, 4, 5, 5),
	(51, '2014-07-23 19:57:03', '2014-07-23 19:57:03', 0, 12, NULL, 0, 5, 5, 5),
	(52, '2014-07-23 19:57:05', '2014-07-23 19:57:05', 0, 12, NULL, 0, 5, 5, 5),
	(53, '2014-07-23 19:57:06', '2014-07-23 19:57:06', 0, 12, NULL, 0, 5, 5, 5),
	(54, '2014-07-23 19:57:07', '2014-07-23 19:57:07', 0, 12, NULL, 0, 2, 5, 5),
	(55, '2014-07-23 19:57:09', '2014-07-23 19:57:09', 0, 12, NULL, 0, 5, 5, 5),
	(56, '2014-07-23 19:57:11', '2014-07-23 19:57:11', 0, 12, NULL, 0, 5, 5, 5),
	(57, '2014-07-23 19:57:12', '2014-07-23 19:57:12', 0, 12, NULL, 0, 5, 5, 5),
	(58, '2014-07-23 19:57:13', '2014-07-23 19:57:13', 0, 12, NULL, 0, 5, 5, 5),
	(59, '2014-07-23 19:57:14', '2014-07-23 19:57:14', 0, 12, NULL, 0, 5, 5, 5),
	(60, '2014-07-23 19:57:17', '2014-07-23 19:57:17', 0, 12, NULL, 0, 5, 5, 5),
	(61, '2014-07-23 19:57:18', '2014-07-23 19:57:18', 0, 12, NULL, 0, 5, 5, 5),
	(62, '2014-07-23 19:57:18', '2014-07-23 19:57:18', 0, 12, NULL, 0, 5, 5, 5),
	(63, '2014-07-23 19:57:20', '2014-07-23 19:57:20', 0, 12, NULL, 0, 5, 5, 5),
	(64, '2014-07-23 19:57:21', '2014-07-23 19:57:21', 0, 12, NULL, 0, 5, 5, 5),
	(65, '2014-07-23 19:57:22', '2014-07-23 19:57:22', 0, 12, NULL, 0, 5, 5, 5),
	(66, '2014-07-23 19:57:23', '2014-07-23 19:57:23', 0, 12, NULL, 0, 5, 5, 5),
	(67, '2014-07-23 19:57:24', '2014-07-23 19:57:24', 0, 12, NULL, 0, 5, 5, 5),
	(68, '2014-07-23 19:57:25', '2014-07-23 19:57:25', 0, 12, NULL, 0, 5, 5, 5),
	(69, '2014-07-23 19:57:27', '2014-07-23 19:57:27', 0, 12, NULL, 0, 5, 5, 5),
	(70, '2014-07-23 19:57:28', '2014-07-23 19:57:28', 0, 12, NULL, 0, 5, 5, 5),
	(71, '2014-07-23 19:57:53', '2014-07-23 19:57:53', 0, 12, NULL, 0, 5, 5, 5),
	(72, '2014-07-23 19:57:53', '2014-07-23 19:57:53', 0, 12, NULL, 0, 5, 5, 5),
	(73, '2014-07-23 19:57:53', '2014-07-23 19:57:53', 0, 12, NULL, 0, 5, 5, 5),
	(74, '2014-07-23 19:57:54', '2014-07-23 19:57:54', 0, 12, NULL, 0, 5, 5, 5),
	(75, '2014-07-23 19:57:54', '2014-07-23 19:57:54', 0, 12, NULL, 0, 5, 5, 5),
	(76, '2014-07-23 19:57:55', '2014-07-23 19:57:55', 0, 12, NULL, 0, 5, 5, 5),
	(77, '2014-07-23 19:57:55', '2014-07-23 19:57:55', 0, 12, NULL, 0, 5, 5, 5),
	(78, '2014-07-23 19:57:55', '2014-07-23 19:57:55', 0, 12, NULL, 0, 5, 5, 5),
	(79, '2014-07-23 19:57:55', '2014-07-23 19:57:55', 0, 12, NULL, 0, 5, 5, 5),
	(80, '2014-07-23 19:57:56', '2014-07-23 19:57:56', 0, 12, NULL, 0, 5, 5, 5),
	(81, '2014-07-23 19:57:56', '2014-07-23 19:57:56', 0, 12, NULL, 0, 5, 5, 5),
	(82, '2014-07-23 19:57:56', '2014-07-23 19:57:56', 0, 12, NULL, 0, 5, 5, 5),
	(83, '2014-07-23 19:57:57', '2014-07-23 19:57:57', 0, 12, NULL, 0, 5, 5, 5),
	(84, '2014-07-23 19:57:57', '2014-07-23 19:57:57', 0, 12, NULL, 0, 5, 5, 5),
	(85, '2014-07-23 19:57:57', '2014-07-23 19:57:57', 0, 12, NULL, 0, 5, 5, 5),
	(86, '2014-07-23 19:57:58', '2014-07-23 19:57:58', 0, 12, NULL, 0, 5, 5, 5),
	(87, '2014-07-23 19:57:58', '2014-07-23 19:57:58', 0, 12, NULL, 0, 5, 5, 5),
	(88, '2014-07-23 20:09:08', '2014-07-23 20:09:08', 0, 12, NULL, 0, 5, 5, 5),
	(89, '2014-07-23 20:09:10', '2014-07-23 20:09:10', 0, 12, NULL, 0, 5, 5, 5),
	(90, '2014-07-23 23:45:30', '2014-07-23 23:45:30', 0, 4, NULL, 0, 5, 2, 2),
	(91, '2014-07-23 23:45:32', '2014-07-23 23:45:32', 0, 4, NULL, 0, 5, 2, 2),
	(92, '2014-07-23 23:45:33', '2014-07-23 23:45:33', 0, 4, NULL, 0, 5, 2, 2),
	(93, '2014-07-23 23:45:34', '2014-07-23 23:45:34', 0, 4, NULL, 0, 5, 2, 2),
	(94, '2014-07-23 23:45:35', '2014-07-23 23:45:35', 0, 4, NULL, 0, 5, 2, 2),
	(95, '2014-07-23 23:45:36', '2014-07-23 23:45:36', 0, 4, NULL, 0, 5, 2, 2),
	(96, '2014-07-23 23:45:37', '2014-07-23 23:45:37', 0, 4, NULL, 0, 5, 2, 2),
	(97, '2014-07-23 23:45:38', '2014-07-23 23:45:38', 0, 4, NULL, 0, 5, 2, 2),
	(98, '2014-07-23 23:45:39', '2014-07-23 23:45:39', 0, 4, NULL, 0, 5, 2, 2),
	(99, '2014-07-23 23:45:40', '2014-07-23 23:45:40', 0, 4, NULL, 0, 5, 2, 2),
	(100, '2014-07-23 23:45:41', '2014-07-23 23:45:41', 0, 4, NULL, 0, 5, 2, 2),
	(101, '2014-07-23 23:45:42', '2014-07-23 23:45:42', 0, 4, NULL, 0, 5, 2, 2),
	(102, '2014-07-23 23:45:43', '2014-07-23 23:45:43', 0, 4, NULL, 0, 5, 2, 2),
	(103, '2014-07-24 12:51:15', '2014-07-24 12:51:15', 0, 12, NULL, 0, 5, 5, 5),
	(104, '2014-07-24 12:51:16', '2014-07-24 12:51:16', 0, 12, NULL, 0, 5, 5, 5),
	(105, '2014-07-24 12:51:17', '2014-07-24 12:51:17', 0, 12, NULL, 0, 5, 5, 5),
	(106, '2014-07-24 12:51:18', '2014-07-24 12:51:18', 0, 12, NULL, 0, 5, 5, 5),
	(107, '2014-07-24 12:51:20', '2014-07-24 12:51:20', 0, 12, NULL, 0, 5, 5, 5),
	(108, '2014-07-24 12:51:21', '2014-07-24 12:51:21', 0, 12, NULL, 0, 5, 5, 5),
	(109, '2014-07-24 12:51:24', '2014-07-24 12:51:24', 0, 12, NULL, 0, 5, 5, 5),
	(110, '2014-07-24 12:51:25', '2014-07-24 12:51:25', 0, 12, NULL, 0, 5, 5, 5),
	(111, '2014-07-24 12:53:39', '2014-07-24 12:53:39', 0, 12, NULL, 0, 5, 5, 5),
	(112, '2014-07-24 12:53:40', '2014-07-24 12:53:40', 0, 12, NULL, 0, 5, 5, 5),
	(113, '2014-07-24 12:53:42', '2014-07-24 12:53:42', 0, 12, NULL, 0, 5, 5, 5),
	(114, '2014-07-24 12:53:47', '2014-07-24 12:53:47', 0, 12, NULL, 0, 5, 5, 5),
	(115, '2014-07-24 12:53:48', '2014-07-24 12:53:48', 0, 12, NULL, 0, 5, 5, 5),
	(116, '2014-07-24 12:53:49', '2014-07-24 12:53:49', 0, 12, NULL, 0, 5, 5, 5),
	(117, '2014-07-24 12:53:52', '2014-07-24 12:53:52', 0, 12, NULL, 0, 5, 5, 5),
	(118, '2014-07-24 12:53:53', '2014-07-24 12:53:53', 0, 12, NULL, 0, 5, 5, 5),
	(119, '2014-07-24 12:53:54', '2014-07-24 12:53:54', 0, 12, NULL, 0, 5, 5, 5),
	(120, '2014-07-24 12:53:55', '2014-07-24 12:53:55', 0, 12, NULL, 0, 5, 5, 5),
	(121, '2014-07-24 12:53:56', '2014-07-24 12:53:56', 0, 12, NULL, 0, 5, 5, 5),
	(122, '2014-07-24 12:53:57', '2014-07-24 12:53:57', 0, 12, NULL, 0, 5, 5, 5),
	(123, '2014-07-24 12:53:59', '2014-07-24 12:53:59', 0, 12, NULL, 0, 5, 5, 5),
	(124, '2014-07-24 12:54:00', '2014-07-24 12:54:00', 0, 12, NULL, 0, 5, 5, 5),
	(125, '2014-07-24 12:54:02', '2014-07-24 12:54:02', 0, 12, NULL, 0, 5, 5, 5),
	(126, '2014-07-24 12:54:03', '2014-07-24 12:54:03', 0, 12, NULL, 0, 5, 5, 5),
	(127, '2014-07-24 12:54:04', '2014-07-24 12:54:04', 0, 12, NULL, 0, 5, 5, 5),
	(128, '2014-07-24 12:54:06', '2014-07-24 12:54:06', 0, 12, NULL, 0, 5, 5, 5),
	(129, '2014-07-24 12:54:07', '2014-07-24 12:54:07', 0, 12, NULL, 0, 5, 5, 5),
	(130, '2014-07-24 12:54:09', '2014-07-24 12:54:09', 0, 12, NULL, 0, 5, 5, 5),
	(131, '2014-07-24 12:54:16', '2014-07-24 12:54:16', 0, 12, NULL, 0, 5, 5, 5),
	(132, '2014-07-24 12:54:19', '2014-07-24 12:54:19', 0, 12, NULL, 0, 5, 5, 5),
	(133, '2014-07-24 12:54:20', '2014-07-24 12:54:20', 0, 12, NULL, 0, 5, 5, 5),
	(134, '2014-07-24 12:54:21', '2014-07-24 12:54:21', 0, 12, NULL, 0, 5, 5, 5),
	(135, '2014-07-24 12:54:21', '2014-07-24 12:54:21', 0, 12, NULL, 0, 5, 5, 5),
	(136, '2014-07-24 12:54:21', '2014-07-24 12:54:21', 0, 12, NULL, 0, 5, 5, 5),
	(137, '2014-07-24 12:54:22', '2014-07-24 12:54:22', 0, 12, NULL, 0, 5, 5, 5),
	(138, '2014-07-24 12:54:22', '2014-07-24 12:54:22', 0, 12, NULL, 0, 5, 5, 5),
	(139, '2014-07-24 12:54:22', '2014-07-24 12:54:22', 0, 12, NULL, 0, 5, 5, 5),
	(140, '2014-07-24 12:54:23', '2014-07-24 12:54:23', 0, 12, NULL, 0, 5, 5, 5),
	(141, '2014-07-24 12:54:23', '2014-07-24 12:54:23', 0, 12, NULL, 0, 5, 5, 5),
	(142, '2014-07-24 12:54:24', '2014-07-24 12:54:24', 0, 12, NULL, 0, 5, 5, 5),
	(143, '2014-07-24 12:54:24', '2014-07-24 12:54:24', 0, 12, NULL, 0, 5, 5, 5),
	(144, '2014-07-24 12:54:24', '2014-07-24 12:54:24', 0, 12, NULL, 0, 5, 5, 5),
	(145, '2014-07-24 12:54:25', '2014-07-24 12:54:25', 0, 12, NULL, 0, 5, 5, 5),
	(146, '2014-07-24 12:54:28', '2014-07-24 12:54:28', 0, 12, NULL, 0, 5, 5, 5),
	(147, '2014-07-24 12:54:33', '2014-07-24 12:54:33', 0, 12, NULL, 0, 5, 5, 5),
	(148, '2014-07-24 13:19:55', '2014-07-24 13:19:55', 0, 18, NULL, 0, 5, 2, 2),
	(149, '2014-07-24 13:19:56', '2014-07-24 13:19:56', 0, 18, NULL, 0, 4, 2, 2),
	(150, '2014-07-24 13:19:59', '2014-07-24 13:19:59', 0, 18, NULL, 0, 3, 2, 2),
	(151, '2014-07-24 13:20:01', '2014-07-24 13:20:01', 0, 18, NULL, 0, 5, 2, 2),
	(152, '2014-07-24 13:20:02', '2014-07-24 13:20:02', 0, 18, NULL, 0, 5, 2, 2),
	(153, '2014-07-24 13:20:04', '2014-07-24 13:20:04', 0, 18, NULL, 0, 5, 2, 2),
	(154, '2014-07-24 13:20:12', '2014-07-24 13:20:12', 0, 18, NULL, 0, 3, 2, 2),
	(155, '2014-07-24 13:20:14', '2014-07-24 13:20:14', 0, 18, NULL, 0, 5, 2, 2),
	(156, '2014-07-24 13:20:15', '2014-07-24 13:20:15', 0, 18, NULL, 0, 5, 2, 2),
	(157, '2014-07-24 13:20:16', '2014-07-24 13:20:16', 0, 18, NULL, 0, 5, 2, 2),
	(158, '2014-07-24 13:20:18', '2014-07-24 13:20:18', 0, 18, NULL, 0, 5, 2, 2),
	(159, '2014-07-24 13:53:13', '2014-07-24 13:53:13', 0, 15, NULL, 0, 5, 2, 2),
	(160, '2014-07-24 13:53:31', '2014-07-24 13:53:31', 0, 14, NULL, 0, 3, 2, 2),
	(161, '2014-07-24 13:53:34', '2014-07-24 13:53:34', 0, 14, NULL, 0, 5, 2, 2),
	(162, '2014-07-24 13:53:36', '2014-07-24 13:53:36', 0, 14, NULL, 0, 5, 2, 2),
	(163, '2014-07-24 13:53:38', '2014-07-24 13:53:38', 0, 14, NULL, 0, 5, 2, 2),
	(164, '2014-07-24 13:53:39', '2014-07-24 13:53:39', 0, 14, NULL, 0, 5, 2, 2),
	(165, '2014-07-24 13:53:40', '2014-07-24 13:53:40', 0, 14, NULL, 0, 5, 2, 2),
	(166, '2014-07-24 13:53:41', '2014-07-24 13:53:41', 0, 14, NULL, 0, 5, 2, 2),
	(167, '2014-07-24 13:53:42', '2014-07-24 13:53:42', 0, 14, NULL, 0, 5, 2, 2),
	(168, '2014-07-24 13:53:43', '2014-07-24 13:53:43', 0, 14, NULL, 0, 5, 2, 2),
	(169, '2014-07-24 13:53:44', '2014-07-24 13:53:44', 0, 14, NULL, 0, 5, 2, 2),
	(170, '2014-07-24 13:53:45', '2014-07-24 13:53:45', 0, 14, NULL, 0, 5, 2, 2),
	(171, '2014-07-24 13:53:46', '2014-07-24 13:53:46', 0, 14, NULL, 0, 5, 2, 2),
	(172, '2014-07-24 13:53:46', '2014-07-24 13:53:46', 0, 14, NULL, 0, 5, 2, 2),
	(173, '2014-07-24 13:53:47', '2014-07-24 13:53:47', 0, 14, NULL, 0, 5, 2, 2),
	(174, '2014-07-24 13:53:48', '2014-07-24 13:53:48', 0, 14, NULL, 0, 5, 2, 2),
	(175, '2014-07-24 13:53:49', '2014-07-24 13:53:49', 0, 14, NULL, 0, 5, 2, 2),
	(176, '2014-07-24 13:53:50', '2014-07-24 13:53:50', 0, 14, NULL, 0, 5, 2, 2),
	(177, '2014-07-24 13:53:51', '2014-07-24 13:53:51', 0, 14, NULL, 0, 5, 2, 2),
	(178, '2014-07-24 13:53:51', '2014-07-24 13:53:51', 0, 14, NULL, 0, 5, 2, 2),
	(179, '2014-07-24 13:53:52', '2014-07-24 13:53:52', 0, 14, NULL, 0, 5, 2, 2),
	(180, '2014-07-24 13:53:53', '2014-07-24 13:53:53', 0, 14, NULL, 0, 5, 2, 2),
	(181, '2014-07-24 13:53:54', '2014-07-24 13:53:54', 0, 14, NULL, 0, 5, 2, 2),
	(182, '2014-07-24 13:53:55', '2014-07-24 13:53:55', 0, 14, NULL, 0, 5, 2, 2),
	(183, '2014-07-24 13:53:56', '2014-07-24 13:53:56', 0, 14, NULL, 0, 5, 2, 2),
	(184, '2014-07-24 13:53:57', '2014-07-24 13:53:57', 0, 14, NULL, 0, 5, 2, 2),
	(185, '2014-07-24 13:53:57', '2014-07-24 13:53:57', 0, 14, NULL, 0, 5, 2, 2),
	(186, '2014-07-24 13:53:58', '2014-07-24 13:53:58', 0, 14, NULL, 0, 5, 2, 2),
	(187, '2014-07-24 13:53:58', '2014-07-24 13:53:58', 0, 14, NULL, 0, 5, 2, 2),
	(188, '2014-07-24 13:53:58', '2014-07-24 13:53:58', 0, 14, NULL, 0, 5, 2, 2),
	(189, '2014-07-24 13:53:58', '2014-07-24 13:53:58', 0, 14, NULL, 0, 5, 2, 2),
	(190, '2014-07-24 13:53:58', '2014-07-24 13:53:58', 0, 14, NULL, 0, 5, 2, 2),
	(191, '2014-07-25 07:16:19', '2014-07-25 07:16:19', 0, 17, NULL, 0, 2, 5, 5),
	(192, '2014-07-25 07:16:24', '2014-07-25 07:16:24', 0, 17, NULL, 0, 2, 5, 5),
	(193, '2014-07-25 07:16:29', '2014-07-25 07:16:29', 0, 17, NULL, 0, 2, 5, 5),
	(194, '2014-07-25 07:16:38', '2014-07-25 07:16:38', 0, 17, NULL, 0, 5, 5, 5),
	(195, '2014-07-25 07:16:46', '2014-07-25 07:16:46', 0, 17, NULL, 0, 5, 5, 5),
	(196, '2014-07-25 07:16:49', '2014-07-25 07:16:49', 0, 17, NULL, 0, 5, 5, 5),
	(197, '2014-07-25 07:16:57', '2014-07-25 07:16:57', 0, 17, NULL, 0, 1, 5, 5),
	(198, '2014-07-25 07:16:59', '2014-07-25 07:16:59', 0, 17, NULL, 0, 1, 5, 5),
	(199, '2014-07-25 07:17:00', '2014-07-25 07:17:00', 0, 17, NULL, 0, 1, 5, 5),
	(200, '2014-07-25 07:17:03', '2014-07-25 07:17:03', 0, 17, NULL, 0, 5, 5, 5),
	(201, '2014-07-25 07:17:05', '2014-07-25 07:17:05', 0, 17, NULL, 0, 5, 5, 5),
	(202, '2014-07-25 07:17:06', '2014-07-25 07:17:06', 0, 17, NULL, 0, 5, 5, 5),
	(203, '2014-07-25 07:17:08', '2014-07-25 07:17:08', 0, 17, NULL, 0, 5, 5, 5),
	(204, '2014-07-25 07:17:12', '2014-07-25 07:17:12', 0, 17, NULL, 0, 5, 5, 5),
	(205, '2014-07-25 07:17:15', '2014-07-25 07:17:15', 0, 17, NULL, 0, 5, 5, 5),
	(206, '2014-07-25 07:17:21', '2014-07-25 07:17:21', 0, 17, NULL, 0, 5, 5, 5),
	(207, '2014-07-25 07:17:23', '2014-07-25 07:17:23', 0, 17, NULL, 0, 5, 5, 5),
	(208, '2014-07-25 07:17:24', '2014-07-25 07:17:24', 0, 17, NULL, 0, 5, 5, 5),
	(209, '2014-07-25 07:17:26', '2014-07-25 07:17:26', 0, 17, NULL, 0, 5, 5, 5),
	(210, '2014-07-25 07:17:28', '2014-07-25 07:17:28', 0, 17, NULL, 0, 5, 5, 5),
	(211, '2014-07-25 07:17:30', '2014-07-25 07:17:30', 0, 17, NULL, 0, 5, 5, 5),
	(212, '2014-07-25 08:01:19', '2014-07-25 08:01:19', 0, 19, NULL, 0, 5, 5, 5),
	(213, '2014-07-25 08:01:24', '2014-07-25 08:01:24', 0, 19, NULL, 0, 5, 5, 5),
	(214, '2014-07-25 08:01:27', '2014-07-25 08:01:27', 0, 19, NULL, 0, 5, 5, 5),
	(215, '2014-07-25 09:36:36', '2014-07-25 09:36:36', 0, 20, NULL, 0, 5, 2, 2),
	(216, '2014-08-11 08:44:43', '2014-08-11 08:44:43', 0, 18, NULL, 0, 4, NULL, NULL),
	(217, '2014-08-11 08:44:44', '2014-08-11 08:44:44', 0, 18, NULL, 0, 4, NULL, NULL),
	(218, '2014-08-11 08:44:46', '2014-08-11 08:44:46', 0, 18, NULL, 0, 3, NULL, NULL),
	(219, '2014-08-11 08:44:48', '2014-08-11 08:44:48', 0, 18, NULL, 0, 2, NULL, NULL),
	(220, '2014-08-11 08:44:50', '2014-08-11 08:44:50', 0, 18, NULL, 0, 1, NULL, NULL),
	(221, '2014-08-16 06:09:52', '2014-08-16 06:09:52', 0, 34, NULL, 0, 5, 5, 5),
	(222, '2014-08-16 06:09:56', '2014-08-16 06:09:56', 0, 34, NULL, 0, 5, 5, 5),
	(223, '2014-08-16 06:09:56', '2014-08-16 06:09:56', 0, 34, NULL, 0, 5, 5, 5),
	(224, '2014-08-16 06:09:57', '2014-08-16 06:09:57', 0, 34, NULL, 0, 5, 5, 5),
	(225, '2014-08-16 06:09:57', '2014-08-16 06:09:57', 0, 34, NULL, 0, 5, 5, 5),
	(226, '2014-08-16 06:09:57', '2014-08-16 06:09:57', 0, 34, NULL, 0, 5, 5, 5),
	(227, '2014-08-16 06:09:58', '2014-08-16 06:09:58', 0, 34, NULL, 0, 5, 5, 5),
	(228, '2014-08-16 06:09:58', '2014-08-16 06:09:58', 0, 34, NULL, 0, 5, 5, 5),
	(229, '2014-08-16 06:09:59', '2014-08-16 06:09:59', 0, 34, NULL, 0, 5, 5, 5),
	(230, '2014-08-16 06:09:59', '2014-08-16 06:09:59', 0, 34, NULL, 0, 5, 5, 5),
	(231, '2014-08-16 06:09:59', '2014-08-16 06:09:59', 0, 34, NULL, 0, 5, 5, 5),
	(232, '2014-08-16 06:09:59', '2014-08-16 06:09:59', 0, 34, NULL, 0, 5, 5, 5),
	(233, '2014-08-16 06:10:00', '2014-08-16 06:10:00', 0, 34, NULL, 0, 5, 5, 5),
	(234, '2014-08-16 06:10:00', '2014-08-16 06:10:00', 0, 34, NULL, 0, 5, 5, 5),
	(235, '2014-08-16 06:10:00', '2014-08-16 06:10:00', 0, 34, NULL, 0, 5, 5, 5),
	(236, '2014-08-16 06:10:02', '2014-08-16 06:10:02', 0, 34, NULL, 0, 5, 5, 5),
	(237, '2014-08-16 06:10:03', '2014-08-16 06:10:03', 0, 34, NULL, 0, 5, 5, 5),
	(238, '2014-08-16 06:10:03', '2014-08-16 06:10:03', 0, 34, NULL, 0, 5, 5, 5),
	(239, '2014-08-16 06:10:03', '2014-08-16 06:10:03', 0, 34, NULL, 0, 5, 5, 5),
	(240, '2014-08-16 06:10:04', '2014-08-16 06:10:04', 0, 34, NULL, 0, 5, 5, 5),
	(241, '2014-08-16 06:10:04', '2014-08-16 06:10:04', 0, 34, NULL, 0, 5, 5, 5),
	(242, '2014-08-16 06:10:05', '2014-08-16 06:10:05', 0, 34, NULL, 0, 5, 5, 5),
	(243, '2014-08-16 06:10:05', '2014-08-16 06:10:05', 0, 34, NULL, 0, 5, 5, 5),
	(244, '2014-08-16 06:10:05', '2014-08-16 06:10:05', 0, 34, NULL, 0, 5, 5, 5),
	(245, '2014-08-16 06:10:05', '2014-08-16 06:10:05', 0, 34, NULL, 0, 5, 5, 5),
	(246, '2014-08-16 06:10:05', '2014-08-16 06:10:05', 0, 34, NULL, 0, 5, 5, 5),
	(247, '2014-08-16 06:10:06', '2014-08-16 06:10:06', 0, 34, NULL, 0, 5, 5, 5),
	(248, '2014-08-16 06:10:06', '2014-08-16 06:10:06', 0, 34, NULL, 0, 5, 5, 5),
	(249, '2014-08-16 06:10:07', '2014-08-16 06:10:07', 0, 34, NULL, 0, 5, 5, 5),
	(250, '2014-08-16 06:10:07', '2014-08-16 06:10:07', 0, 34, NULL, 0, 5, 5, 5),
	(251, '2014-08-16 06:10:07', '2014-08-16 06:10:07', 0, 34, NULL, 0, 5, 5, 5),
	(252, '2014-08-16 06:10:07', '2014-08-16 06:10:07', 0, 34, NULL, 0, 5, 5, 5),
	(253, '2014-08-16 06:10:08', '2014-08-16 06:10:08', 0, 34, NULL, 0, 5, 5, 5),
	(254, '2014-08-16 06:10:08', '2014-08-16 06:10:08', 0, 34, NULL, 0, 5, 5, 5),
	(255, '2014-08-16 06:10:08', '2014-08-16 06:10:08', 0, 34, NULL, 0, 5, 5, 5),
	(256, '2014-08-16 06:10:08', '2014-08-16 06:10:08', 0, 34, NULL, 0, 5, 5, 5),
	(257, '2014-08-16 06:10:09', '2014-08-16 06:10:09', 0, 34, NULL, 0, 5, 5, 5),
	(258, '2014-08-16 06:10:09', '2014-08-16 06:10:09', 0, 34, NULL, 0, 5, 5, 5),
	(259, '2014-08-16 06:10:09', '2014-08-16 06:10:09', 0, 34, NULL, 0, 5, 5, 5),
	(260, '2014-08-16 06:10:10', '2014-08-16 06:10:10', 0, 34, NULL, 0, 5, 5, 5),
	(261, '2014-08-16 06:10:10', '2014-08-16 06:10:10', 0, 34, NULL, 0, 5, 5, 5),
	(262, '2014-08-16 06:10:10', '2014-08-16 06:10:10', 0, 34, NULL, 0, 5, 5, 5),
	(263, '2014-08-16 06:10:10', '2014-08-16 06:10:10', 0, 34, NULL, 0, 5, 5, 5),
	(264, '2014-08-16 06:10:11', '2014-08-16 06:10:11', 0, 34, NULL, 0, 5, 5, 5),
	(265, '2014-08-16 06:10:11', '2014-08-16 06:10:11', 0, 34, NULL, 0, 5, 5, 5),
	(266, '2014-08-16 06:10:11', '2014-08-16 06:10:11', 0, 34, NULL, 0, 5, 5, 5),
	(267, '2014-08-16 06:10:11', '2014-08-16 06:10:11', 0, 34, NULL, 0, 5, 5, 5),
	(268, '2014-08-16 06:10:13', '2014-08-16 06:10:13', 0, 34, NULL, 0, 5, 5, 5),
	(269, '2014-08-16 06:10:14', '2014-08-16 06:10:14', 0, 34, NULL, 0, 5, 5, 5),
	(270, '2014-08-16 06:10:14', '2014-08-16 06:10:14', 0, 34, NULL, 0, 5, 5, 5),
	(271, '2014-09-08 05:00:40', '2014-09-08 05:00:40', 0, 41, NULL, 0, 5, 22, 22),
	(272, '2014-09-08 05:00:42', '2014-09-08 05:00:42', 0, 41, NULL, 0, 5, 22, 22),
	(273, '2014-09-08 05:00:44', '2014-09-08 05:00:44', 0, 41, NULL, 0, 5, 22, 22),
	(274, '2014-09-08 22:15:50', '2014-09-08 22:15:50', 0, 42, NULL, 0, 5, 5, 5),
	(275, '2014-09-08 22:15:50', '2014-09-08 22:15:50', 0, 42, NULL, 0, 5, 5, 5),
	(276, '2014-09-08 22:15:51', '2014-09-08 22:15:51', 0, 42, NULL, 0, 5, 5, 5),
	(277, '2014-09-08 22:15:51', '2014-09-08 22:15:51', 0, 42, NULL, 0, 5, 5, 5),
	(278, '2014-09-08 22:15:51', '2014-09-08 22:15:51', 0, 42, NULL, 0, 5, 5, 5),
	(279, '2014-09-08 22:15:51', '2014-09-08 22:15:51', 0, 42, NULL, 0, 5, 5, 5),
	(280, '2014-09-08 22:15:51', '2014-09-08 22:15:51', 0, 42, NULL, 0, 5, 5, 5),
	(281, '2014-09-08 22:15:52', '2014-09-08 22:15:52', 0, 42, NULL, 0, 5, 5, 5),
	(282, '2014-09-08 22:15:52', '2014-09-08 22:15:52', 0, 42, NULL, 0, 5, 5, 5),
	(283, '2014-09-08 22:15:52', '2014-09-08 22:15:52', 0, 42, NULL, 0, 5, 5, 5),
	(284, '2014-09-08 22:15:52', '2014-09-08 22:15:52', 0, 42, NULL, 0, 5, 5, 5),
	(285, '2014-09-08 22:15:53', '2014-09-08 22:15:53', 0, 42, NULL, 0, 5, 5, 5),
	(286, '2014-09-08 22:15:53', '2014-09-08 22:15:53', 0, 42, NULL, 0, 5, 5, 5),
	(287, '2014-09-08 22:15:53', '2014-09-08 22:15:53', 0, 42, NULL, 0, 5, 5, 5),
	(288, '2014-09-08 22:15:53', '2014-09-08 22:15:53', 0, 42, NULL, 0, 5, 5, 5),
	(289, '2014-09-08 22:15:54', '2014-09-08 22:15:54', 0, 42, NULL, 0, 5, 5, 5),
	(290, '2014-09-08 22:15:54', '2014-09-08 22:15:54', 0, 42, NULL, 0, 5, 5, 5),
	(291, '2014-09-08 22:15:54', '2014-09-08 22:15:54', 0, 42, NULL, 0, 5, 5, 5),
	(292, '2014-09-08 22:15:54', '2014-09-08 22:15:54', 0, 42, NULL, 0, 5, 5, 5),
	(293, '2014-09-08 22:15:55', '2014-09-08 22:15:55', 0, 42, NULL, 0, 5, 5, 5),
	(294, '2014-09-08 22:15:55', '2014-09-08 22:15:55', 0, 42, NULL, 0, 5, 5, 5),
	(295, '2014-09-08 22:15:55', '2014-09-08 22:15:55', 0, 42, NULL, 0, 5, 5, 5),
	(296, '2014-09-08 22:15:55', '2014-09-08 22:15:55', 0, 42, NULL, 0, 5, 5, 5),
	(297, '2014-09-08 22:15:56', '2014-09-08 22:15:56', 0, 42, NULL, 0, 5, 5, 5),
	(298, '2014-09-08 22:15:56', '2014-09-08 22:15:56', 0, 42, NULL, 0, 5, 5, 5),
	(299, '2014-09-08 22:15:56', '2014-09-08 22:15:56', 0, 42, NULL, 0, 5, 5, 5),
	(300, '2014-09-08 22:15:56', '2014-09-08 22:15:56', 0, 42, NULL, 0, 5, 5, 5),
	(301, '2014-09-08 22:15:59', '2014-09-08 22:15:59', 0, 42, NULL, 0, 5, 5, 5),
	(302, '2014-09-08 22:16:00', '2014-09-08 22:16:00', 0, 42, NULL, 0, 5, 5, 5),
	(303, '2014-09-08 22:16:01', '2014-09-08 22:16:01', 0, 42, NULL, 0, 5, 5, 5),
	(304, '2014-09-08 22:16:01', '2014-09-08 22:16:01', 0, 42, NULL, 0, 5, 5, 5),
	(305, '2014-09-08 22:16:01', '2014-09-08 22:16:01', 0, 42, NULL, 0, 5, 5, 5),
	(306, '2014-09-08 22:16:02', '2014-09-08 22:16:02', 0, 42, NULL, 0, 5, 5, 5),
	(307, '2014-09-08 22:16:02', '2014-09-08 22:16:02', 0, 42, NULL, 0, 5, 5, 5),
	(308, '2014-09-08 22:16:02', '2014-09-08 22:16:02', 0, 42, NULL, 0, 5, 5, 5),
	(309, '2014-09-08 22:16:02', '2014-09-08 22:16:02', 0, 42, NULL, 0, 5, 5, 5),
	(310, '2014-09-08 22:16:05', '2014-09-08 22:16:05', 0, 42, NULL, 0, 5, 5, 5),
	(311, '2014-09-08 22:16:05', '2014-09-08 22:16:05', 0, 42, NULL, 0, 5, 5, 5),
	(312, '2014-09-08 22:16:05', '2014-09-08 22:16:05', 0, 42, NULL, 0, 5, 5, 5),
	(313, '2014-09-08 22:16:06', '2014-09-08 22:16:06', 0, 42, NULL, 0, 5, 5, 5),
	(314, '2014-09-08 22:16:06', '2014-09-08 22:16:06', 0, 42, NULL, 0, 5, 5, 5),
	(315, '2014-09-08 22:16:07', '2014-09-08 22:16:07', 0, 42, NULL, 0, 5, 5, 5),
	(316, '2014-09-08 22:16:07', '2014-09-08 22:16:07', 0, 42, NULL, 0, 5, 5, 5),
	(317, '2014-09-08 22:16:07', '2014-09-08 22:16:07', 0, 42, NULL, 0, 5, 5, 5),
	(318, '2014-09-08 22:16:07', '2014-09-08 22:16:07', 0, 42, NULL, 0, 5, 5, 5),
	(319, '2014-09-08 22:16:08', '2014-09-08 22:16:08', 0, 42, NULL, 0, 5, 5, 5),
	(320, '2014-09-10 22:25:27', '2014-09-10 22:25:27', 0, 20, '78.102.194.152', 0, 5, 5, 5),
	(321, '2014-09-20 17:53:05', '2014-09-20 17:53:05', 0, 42, '78.102.194.152', 0, 5, NULL, NULL),
	(322, '2014-09-21 12:16:59', '2014-09-21 12:16:59', 0, 31, '90.177.225.57', 0, 1, NULL, NULL),
	(323, '2014-09-21 21:10:36', '2014-09-21 21:10:36', 0, 34, '78.102.194.152', 0, 5, NULL, NULL),
	(324, '2014-09-27 21:36:28', '2014-09-27 21:36:28', 0, 40, '78.102.194.152', 0, 5, 5, 5);
/*!40000 ALTER TABLE `RATE` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.region
DROP TABLE IF EXISTS `REGION`;
CREATE TABLE IF NOT EXISTS `REGION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `GOOGLE_ALIAS` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `NORTH` double DEFAULT NULL,
  `WEST` double DEFAULT NULL,
  `ZOOM` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_iacpokgk2trq8d5ti0cakkn3t` (`CREATED_ID`),
  KEY `FK_ldyl6246ebdhl6xujw00sgoq3` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_iacpokgk2trq8d5ti0cakkn3t` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_ldyl6246ebdhl6xujw00sgoq3` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.region: ~14 rows (přibližně)
DELETE FROM `REGION`;
/*!40000 ALTER TABLE `REGION` DISABLE KEYS */;
INSERT INTO `REGION` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `GOOGLE_ALIAS`, `NORTH`, `WEST`, `ZOOM`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-07-23 23:21:07', '2014-10-05 13:17:45', 10, 'Prahak', 'reg_pha', NULL, 'Hlavní město Praha', 50.0641917366591, 14.4937133789062, 11, 2, 2),
	(3, '2014-07-23 23:21:07', '2014-07-25 09:19:36', 3, 'Středočeský', 'reg_str', NULL, 'Středočeský kraj', 50.0641917366591, 14.4937133789062, NULL, 2, 2),
	(4, '2014-07-23 23:21:07', '2014-07-23 23:24:19', 1, 'Ústecký', 'reg_ust', NULL, 'Ústecký kraj', 50.5343804061108, 13.9059448242188, NULL, 2, 2),
	(5, '2014-07-23 23:21:07', '2014-07-23 23:19:55', 1, 'Liberecký', 'reg_lib', NULL, 'Liberecký kraj', 50.7260242965947, 15.0210571289062, NULL, 2, 2),
	(6, '2014-07-23 23:21:07', '2014-09-10 22:21:35', 6, 'Plzeňský', 'reg_plz', NULL, 'Plzeňský kraj', 49.6473492, 13.3600746, 9, 2, 5),
	(7, '2014-07-23 23:21:07', '2014-07-23 23:18:29', 1, 'Karlovarský', 'reg_klv', NULL, 'Karlovarský kraj', 50.1487464006628, 12.9336547851562, NULL, 2, 2),
	(8, '2014-07-23 23:21:07', '2014-07-23 23:36:01', 6, 'Jihočeský', 'reg_jhc', NULL, 'Jihočeský kraj', 49.0810623643207, 14.4552612304688, NULL, 2, 2),
	(9, '2014-07-23 23:21:07', '2014-07-23 23:24:49', 3, 'Vysočina', 'reg_vys', NULL, 'Kraj Vysočina', 49.3716433382614, 15.5978393554688, NULL, 2, 2),
	(10, '2014-07-23 23:21:07', '2014-07-25 09:17:38', 3, 'Královehradecký', 'reg_khr', NULL, 'Královéhradecký kraj', 50.3840052763671, 15.9164428710938, NULL, 2, 2),
	(11, '2014-07-23 23:21:07', '2014-07-23 23:22:12', 2, 'Pardubický', 'reg_par', NULL, 'Pardubický kraj', 49.8450675795639, 16.1636352539062, NULL, 2, 2),
	(12, '2014-07-23 23:21:07', '2014-07-23 23:17:28', 2, 'Jihomoravský', 'reg.jhm', NULL, 'Jihomoravský kraj', 49.0378679453264, 16.600341796875, NULL, 2, 2),
	(13, '2014-07-23 23:21:07', '2014-07-23 23:21:36', 2, 'Olomoucký', 'reg.olo', NULL, 'Olomoucký kraj', 49.7209279267033, 17.1908569335938, NULL, 2, 2),
	(14, '2014-07-23 23:21:07', '2014-07-23 23:25:45', 2, 'Zlínský', 'reg.zln', NULL, 'Zlínský kraj', 49.2283601409013, 17.7841186523438, NULL, 2, 2),
	(15, '2014-07-23 23:21:07', '2014-07-23 23:21:07', 2, 'Moravskoslezský', 'reg.msl', NULL, 'Moravskoslezský kraj', 49.8733977031892, 17.9598999023438, NULL, 2, 2);
/*!40000 ALTER TABLE `REGION` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.registration_request
DROP TABLE IF EXISTS `REGISTRATION_REQUEST`;
CREATE TABLE IF NOT EXISTS `REGISTRATION_REQUEST` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CAPTCHA_TEXT` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `PHONE` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `PROCESSED` bit(1) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_4lt98qpyqkbtb5kwjhbnq2gsi` (`CREATED_ID`),
  KEY `FK_qw090r8xfeko91802tdghs0qx` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_4lt98qpyqkbtb5kwjhbnq2gsi` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_qw090r8xfeko91802tdghs0qx` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.registration_request: ~6 rows (přibližně)
DELETE FROM `REGISTRATION_REQUEST`;
/*!40000 ALTER TABLE `REGISTRATION_REQUEST` DISABLE KEYS */;
INSERT INTO `REGISTRATION_REQUEST` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CAPTCHA_TEXT`, `EMAIL`, `PHONE`, `PROCESSED`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, '2014-05-12 06:27:33', '2014-05-12 06:27:33', 0, NULL, 'vit.ratislav@seznam.cz', '602614027', NULL, 'Posílám požadavek', NULL, NULL),
	(2, '2014-05-13 00:04:30', '2014-05-13 00:04:30', 0, NULL, 'jiri.slovak@gmail.com', '606034523', NULL, ' testovaci ... ahoj :)', NULL, NULL),
	(3, '2014-05-13 00:11:53', '2014-05-13 00:11:53', 0, NULL, 'jiri.slovak@gmail.com', '606034444', NULL, ' test', NULL, NULL),
	(6, '2014-05-19 02:37:17', '2014-05-19 02:37:17', 0, NULL, 'jiri.slovak@gmail.com', '606034523', NULL, ' Dobrý den,', 2, 2),
	(7, '2014-05-23 06:54:56', '2014-06-02 22:07:23', 1, NULL, 'vit.ratislav@seznam.cz', '602614027', b'1', '<p>EKOP s.r.o.<br />Elektrokola Plzeň<br />Srázná 9<br />32600<br />Plzeň</p><p>chceme u vás inzerovat<br />Ratislav</p>', NULL, 5),
	(8, '2014-05-26 17:31:41', '2014-06-01 18:58:48', 2, NULL, 'vit.ratislav@seznam.cz', '602614027', b'0', 'zkouška, co mi přijde do mailu', NULL, 2);
/*!40000 ALTER TABLE `REGISTRATION_REQUEST` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.seller
DROP TABLE IF EXISTS `SELLER`;
CREATE TABLE IF NOT EXISTS `SELLER` (
  `MAP_URL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_DEGREE` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_NAME` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_SALUTATION` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_SURNAME` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `SALE_TYPE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SELLER_DESCRIPTION` longtext COLLATE utf8_czech_ci NOT NULL,
  `SELLER_NAME` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SELLER_TITLE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `WEB` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REGION_ID` bigint(20) NOT NULL,
  `SELLER_STATUS_ID` bigint(20) DEFAULT NULL,
  `ID_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_jbfv0uw21rhbem1ky6xt4a62e` (`REGION_ID`),
  KEY `FK_a1vaxq533fxecndx02tu30jpr` (`SELLER_STATUS_ID`),
  KEY `FK_lcjr7ts5qxohcfxwju4cj7a2j` (`ID_ID`),
  CONSTRAINT `FK_a1vaxq533fxecndx02tu30jpr` FOREIGN KEY (`SELLER_STATUS_ID`) REFERENCES `SELLER_STATUS` (`ID`),
  CONSTRAINT `FK_jbfv0uw21rhbem1ky6xt4a62e` FOREIGN KEY (`REGION_ID`) REFERENCES `REGION` (`ID`),
  CONSTRAINT `FK_lcjr7ts5qxohcfxwju4cj7a2j` FOREIGN KEY (`ID_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.seller: ~12 rows (přibližně)
DELETE FROM `SELLER`;
/*!40000 ALTER TABLE `SELLER` DISABLE KEYS */;
INSERT INTO `SELLER` (`MAP_URL`, `PERSON_DEGREE`, `PERSON_NAME`, `PERSON_SALUTATION`, `PERSON_SURNAME`, `SALE_TYPE`, `SELLER_DESCRIPTION`, `SELLER_NAME`, `SELLER_TITLE`, `WEB`, `ID`, `REGION_ID`, `SELLER_STATUS_ID`, `ID_ID`) VALUES
	('https://www.google.com/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', '', 'Michaela', 'Slešna', 'Radoměřská', 'Korespondenční :-)', '', 'Prodejce Michalka', 'Testovací prodejce Michalka', 'http://www.wincor-nixdorf.cz', 3, 1, 2, 3),
	('http://cyklocentrum.cz', 'Bc.', 'František', 'pan', 'Podlaha', 's.r.o.', 'Prodáváme jízdní, horská, krosová, trekingová, cestovní, dětská a silniční kola Author a AGang, bike příslušenství a sportovní potřeby. Koloběžky Micro, Tempish a Yedoo, odrážedla Yedoo a Author. Naleznete u nás velký výběr cyklistického oblečení. Prodáváme přilby Author, Giro, Uvex, tretry Shimano a Northwave, oblečení Author, Silvini, Sensor, Craft, brýle Uvex, Tifosi a Relax, dětské sedačky Author a Hamax, výživa Enervit, Nutrend, Powerbar, cyklotrenažéry Tacx. Dále prodáváme značky Zéffal, Topeak, Schwalbe, Camelbak, Author, Panaracer, Shimano, Ritchey, Cateye, Abus, RST.', 'cyklocentrum.cz', 'Kola za super ceny...', 'http://cyklocentrum.cz', 4, 1, 2, 4),
	('Položka odkaz na mapy', '', 'Richard', 'Pan', 'Rychlý', '', ' Zkouším založit prodejce a nastavit mu oprávnění', 'Testovací prodejce', '', '', 5, 1, 2, 5),
	('http://www.finebike.cz/', 'Ing.', 'Jiří', 'pan', 'Slovák', 's.r.o.', 'Specializovaný e-shop na cyklistiku a běžky... www.finebike.cz Zveme vás do naší prodejny na Praze 1 v ulici Skořepka 4. Najdete u nás rozsáhlý sortiment jak pro cyklistiku tak i pro běžecké lyžování, včetně oblečení a nezbytných doplňků. Nabízíme vám navíc kvalitní servis kol a také zázemí a kvalitu autorizovaného dealera renomovaných cyklistických a běžkařských značek, které držíme skladem, takže si jejich zboží můžete prohlédnout případně vyzkoušet a ihned koupit. HEHEHE', 'FineBike', 'Kvalitní prodejna kol', 'http://www.finebike.cz/', 6, 3, 1, 6),
	('https://www.google.cz/maps/place/Pražská+5%2F15/@50.0519022,14.5227771,17z/data=!3m1!4b1!4m2!3m1!1s0x470b925c1b45f0f5:0x5820b96ccd869bb4', 'Bc.', 'Tomáš', 'Pan', 'Radoměřský', '', ' Pro uživatelské testy zakládám prodejce pro Toma. test<div>Dělám update</div>', 'Testovací - Tom', 'Testovací prodejce pro Toma', 'http://www.aktualne.cz', 7, 6, 2, 7),
	('http://www.mapy.cz/#!x=13.391836&y=49.738026&z=15&d=addr_9066194_1&t=s&q=plze%25C5%2588%2520rady%25C5%2588sk%25C3%25A1%252016&qp=10.882384_48.320847_20.005679_51.133344_6', 'ZOtitul', 'ZOjméno', 'ZOoslovení', 'ZOpříjmení', 'Oformaprodeje', '<p>prodejce popis<br />druhý řádek</p><p>čtvrtý řádek<br /><b>pátý řádek tučným písmem</b><br /><b><u>šestý řádek tučným podtrženým písmem</u></b><br /><strike>sedmý řádek přeškrtnutým písmem</strike><br /><strike></strike><br /><i>devátý řádek kurzívou</i><br /><i></i><br />jedenáctý řádek zarovnaný vpravo<br />dvanáctý řádek zarovnaný vpravo</p><p>test</p>', 'prodejce název', 'prodejce název dlouhý', 'http://www.Oweb.cz', 14, 1, 2, 14),
	('https://www.google.cz/maps/place/Sr%C3%A1zn%C3%A1+272%2F9/@49.7266291,13.394243,17z/data=!3m1!4b1!4m2!3m1!1s0x470aee25445c1437:0x8e2cd94045eaa8d8', 'ZOtitul', 'ZOjméno', 'ZOoslovení', 'ZOpříjemní', 'Oformaprodeje', '<p>kkkk</p><p><b>hhhh</b><br /><i>rrrr</i><br /><u>uuuuuu</u><br /><strike>sssssssss</strike></p>', 'ZInazev', 'ZInazevdlouhy', 'http://www.Oweb.cz', 15, 6, 2, 15),
	('https://www.google.cz/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', 'Ing.', 'Lenka', 'Paní', 'Radoměřská', 'CO znamená forma prodeje ?', '', 'Prodejce LENKA', 'Testovací Profil pro uživatelské testy', 'http://www.novinky.cz', 16, 1, 2, 16),
	('https://www.google.com/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', '', 'Michaela', 'Slečna', 'Radoměřská', 'Telefonická', '', 'Prodejce Míša', 'Testovací prodejce Míša', 'http://www.seznam.cz', 18, 1, 2, 18),
	('', 'Mgr.', 'Jiří', 'pan', 'Tolar', 'kamenná prodejna a e-shop', '<p>Tradiční prodejce kol se zaměřením na značky TREK a SPECIALIZED s kamennou prodejnou v Plzni<br />.<br />Otvírací doba<br />PO - PÁ 9.00 - 18.00h<br />SO         9.00 - 12.00h<br />.<br />Provádíme také opravy kol a jejich přípravu na sezonu</p>', 'KP2', 'Kola Plzeň 2', 'http://www.kolaplzen2.cz', 26, 6, 2, 26),
	('test', 'test', 'test', 'test', 'test', '', ' test', 'test', 'test', '', 30, 8, 2, 32),
	('test', 'test', 'test', 'test', 'test', 'test', ' testtest', 'test', 'test', 'http://test', 31, 8, 2, 33);
/*!40000 ALTER TABLE `SELLER` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.seller_photo_url
DROP TABLE IF EXISTS `SELLER_PHOTO_URL`;
CREATE TABLE IF NOT EXISTS `SELLER_PHOTO_URL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT_TYPE` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_qjrytu6qwkcf00et9f7837xqb` (`CREATED_ID`),
  KEY `FK_doi8kqdv6p8k4bfhav3oo4g1d` (`LAST_MODIFIED_ID`),
  KEY `FK_SELLER_ID` (`SELLER_ID`),
  CONSTRAINT `FK_doi8kqdv6p8k4bfhav3oo4g1d` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_qjrytu6qwkcf00et9f7837xqb` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_SELLER_ID` FOREIGN KEY (`SELLER_ID`) REFERENCES `SELLER` (`ID_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.seller_photo_url: ~11 rows (přibližně)
DELETE FROM `SELLER_PHOTO_URL`;
/*!40000 ALTER TABLE `SELLER_PHOTO_URL` DISABLE KEYS */;
INSERT INTO `SELLER_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `SELLER_ID`) VALUES
	(9, '2014-05-26 22:03:16', '2014-05-26 22:03:16', 0, 'image/pjpeg', 'P5090892.JPG', 6, 6, 26),
	(10, '2014-06-02 21:08:19', '2014-06-02 21:08:19', 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 5, 5, 16),
	(12, '2014-06-14 22:05:15', '2014-06-14 22:05:15', 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 5, 5, 3),
	(13, '2014-06-15 21:02:22', '2014-06-15 21:02:22', 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 5, 5, 18),
	(16, '2014-07-08 00:11:39', '2014-07-08 00:11:39', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 14),
	(17, '2014-07-08 00:12:10', '2014-07-08 00:12:10', 0, 'image/jpeg', 'Desert.jpg', 2, 2, 5),
	(18, '2014-07-08 00:12:26', '2014-07-08 00:12:26', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 5),
	(19, '2014-07-08 20:54:22', '2014-07-08 20:54:22', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 6),
	(20, '2014-07-08 21:14:31', '2014-07-08 21:14:31', 0, 'image/jpeg', 'Chrysanthemum.jpg', 2, 2, 26),
	(22, '2014-07-08 21:17:08', '2014-07-08 21:17:08', 0, 'image/jpeg', '8c94a9d3-0ae9-4955-bc3c-23fb9159879a.jpg', 7, 7, 7),
	(24, '2014-10-05 02:14:05', '2014-10-05 02:14:05', 0, 'image/jpeg', 'logo.jpg', 2, 2, 33),
	(25, '2014-10-05 12:12:49', '2014-10-05 12:12:49', 0, 'image/jpeg', 'logo.jpg', 2, 2, 6);
/*!40000 ALTER TABLE `SELLER_PHOTO_URL` ENABLE KEYS */;


-- Exportování struktury pro tabulka kolomet.seller_status
DROP TABLE IF EXISTS `SELLER_STATUS`;
CREATE TABLE IF NOT EXISTS `SELLER_STATUS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE_DESCRIPTION` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SEQUENCE_NR` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_6ktqmrnmcfnodcb38f442s2j` (`CREATED_ID`),
  KEY `FK_k332y8traiqa44kwmbu26wqtb` (`LAST_MODIFIED_ID`),
  CONSTRAINT `FK_6ktqmrnmcfnodcb38f442s2j` FOREIGN KEY (`CREATED_ID`) REFERENCES `APPLICATION_USER` (`ID`),
  CONSTRAINT `FK_k332y8traiqa44kwmbu26wqtb` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `APPLICATION_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- Exportování dat pro tabulku kolomet.seller_status: ~2 rows (přibližně)
DELETE FROM `SELLER_STATUS`;
/*!40000 ALTER TABLE `SELLER_STATUS` DISABLE KEYS */;
INSERT INTO `SELLER_STATUS` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PRIORITY`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
	(1, NULL, NULL, 0, 'VIP', 'sellst_vip', NULL, 100, NULL, NULL),
	(2, NULL, '2014-05-24 13:01:12', 2, 'Běžný prodejce', 'sellst_ord', NULL, 100, NULL, 2);
/*!40000 ALTER TABLE `SELLER_STATUS` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
