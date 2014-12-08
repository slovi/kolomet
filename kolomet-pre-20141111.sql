-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Úterý 11. listopadu 2014, 22:14
-- Verze MySQL: 5.1.73
-- Verze PHP: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `kolomet-pre`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_PERMISSION`
--

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
  KEY `FK_c5dwvyeqbenhloc2eptj10lok` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=30 ;

--
-- Vypisuji data pro tabulku `APPLICATION_PERMISSION`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_ROLE`
--

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
  KEY `FK_apkcgpjmemvnsc1brda4et6cx` (`LAST_MODIFIED_ID`),
  KEY `FK_kyavgp495u0hx0ccnfdxra6oe` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=9 ;

--
-- Vypisuji data pro tabulku `APPLICATION_ROLE`
--

INSERT INTO `APPLICATION_ROLE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ROLE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, '2014-03-31 00:00:00', '2014-08-23 15:36:24', 10, 'role_admin', 2, 2),
(4, '2014-03-31 06:24:02', '2014-11-01 21:44:22', 7, 'role_seller', 2, 2),
(5, '2014-06-24 00:28:21', '2014-10-11 02:32:33', 3, 'role_user', 2, 2),
(8, '2014-07-25 07:21:49', '2014-07-29 22:05:54', 1, 'role_placeown', 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_ROLE_PERMISSION`
--

DROP TABLE IF EXISTS `APPLICATION_ROLE_PERMISSION`;
CREATE TABLE IF NOT EXISTS `APPLICATION_ROLE_PERMISSION` (
  `ROLE_ID` bigint(20) NOT NULL,
  `PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK_l467vw6jhwo522b3ef8ovgkor` (`PERMISSION_ID`),
  KEY `FK_msjrjy23nvkle00037evqd9ef` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `APPLICATION_ROLE_PERMISSION`
--

INSERT INTO `APPLICATION_ROLE_PERMISSION` (`ROLE_ID`, `PERMISSION_ID`) VALUES
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
(4, 24),
(4, 20),
(4, 18),
(4, 8),
(4, 4),
(4, 3),
(5, 3),
(5, 24),
(5, 26),
(5, 29),
(4, 26),
(4, 29);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER`
--

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
  `NICKNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PHONE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SURNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_k024d3p5mjfqhbu70g4t3thxy` (`SELLER_ID`),
  KEY `USERNAME` (`USERNAME`),
  KEY `FK_48416r9emtcor7pdprhgg1w1d` (`LAST_MODIFIED_ID`),
  KEY `FK_ot68oi4hpc4jt6fkayj6f4qxc` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=53 ;

--
-- Vypisuji data pro tabulku `APPLICATION_USER`
--

INSERT INTO `APPLICATION_USER` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONDITION_AGREEMENT`, `CONDITION_VERSION`, `ENABLED`, `NAME`, `NICKNAME`, `PASSWORD`, `PHONE`, `SURNAME`, `TOKEN`, `USERNAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `SELLER_ID`) VALUES
(2, '2014-03-31 00:00:00', '2014-10-13 22:11:01', 5, NULL, NULL, b'1', 'Jiří', 'slovi', '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, 'Slovák', NULL, 'jiri.slovak@gmail.com', NULL, 2, NULL),
(5, '2014-03-31 07:14:20', '2014-10-26 21:36:22', 11, NULL, NULL, b'1', NULL, NULL, '2806e0bbe0f4441a8429ce1523578da104173b82', NULL, NULL, NULL, 'ales.radomersky@gmail.com', NULL, 5, NULL),
(39, '2014-10-11 08:37:00', '2014-10-14 20:48:20', 4, NULL, NULL, b'1', 'Vít', '', '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', NULL, 'Ratislav', NULL, 'vit.ratislav@gmail.com', NULL, 5, NULL),
(40, '2014-11-01 18:27:10', '2014-11-04 23:07:29', 1, NULL, NULL, b'0', 'Jiří', 'slovi2', '32d17df399ea23f0e39786961936276d87c62bfd', NULL, 'Slovák', NULL, 'jiri.slovak@generali.cz', 2, 2, NULL),
(42, '2014-11-01 19:26:24', '2014-11-01 19:26:24', 0, NULL, NULL, b'1', NULL, NULL, '59c8299e69bd19c41b9c3845463c096860526c0d', NULL, NULL, NULL, 'jiri.slovak@generali.czz', 2, 2, 2),
(43, '2014-11-01 19:31:58', '2014-11-03 08:35:11', 3, NULL, NULL, b'1', 'AL', 'ARA', 'e4e0c8b747716f72bb2775c01a81ebd79a9ab9c3', NULL, 'RAD', NULL, 'al_rad@post.cz', 5, 43, 3),
(44, '2014-11-01 22:29:55', '2014-11-01 22:29:55', 0, NULL, NULL, b'1', NULL, NULL, 'e46c52101e0095e3d62b9029e6d4ac68e47684d3', NULL, NULL, NULL, 'tomas.radomersky@gmail.com', 5, 5, 4),
(45, '2014-11-01 23:25:16', '2014-11-01 23:25:16', 0, NULL, NULL, b'0', 'MISTA - Aleš', 'ARA', '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', NULL, 'MISTA - Radoměřský', NULL, 'ales.radomersky@seznam.cz', NULL, NULL, NULL),
(46, '2014-11-02 00:03:20', '2014-11-02 00:03:20', 0, NULL, NULL, b'1', NULL, NULL, '155c8926fc3fb52dceb65e9d025ef1bb1a573c3f', NULL, NULL, NULL, 'radomerska@seznam.cz', 5, 5, 5),
(47, '2014-11-03 07:03:11', '2014-11-03 07:03:11', 0, '2014-11-03 07:03:11', 'PODM_20140901_01', b'0', 'rus', 'kat', 'b6ea6747576f51a8d3bb542e4b12d51481212604', NULL, 'vladimir', '鱽䄬陡蘢͈㌾뀠୯§켟絆虑헖쌵톾큾頷ꕏ顡ᘰ椰着䐨ధ긏꩹∍㢦퇒嶧⚒氞瘦ᨏ鬥囮鮾', 'rus@email.cz', NULL, NULL, NULL),
(48, '2014-11-03 19:17:57', '2014-11-03 19:17:57', 0, '2014-11-03 19:17:57', 'PODM_20140901_01', b'0', 'Matyáš', 'maty', '758a39d38713eb13da8aae3b2ae37987c8e7b307', NULL, 'Ratislav', '캓袍竊숒徉凮씍ꆬ咖샿倛晰躕꽸ቇ垱ⶸ㽨⦫肼䝟䎉ᖆﬂ槱셸᪙埚㉱볇ྫڜ痄ꊀ', 'matyas.ra@gmail.com', NULL, NULL, NULL),
(49, '2014-11-05 00:39:18', '2014-11-05 00:39:18', 0, '2014-11-05 00:39:18', 'PODM_20140901_01', b'0', 'test', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', NULL, 'test', 'ik9z49r9rcC8ZmUqWNRmTFPZKyqvrzvdPvNQwG6D', 'jiri.slovak@generali.cz', NULL, NULL, NULL),
(50, '2014-11-05 00:40:33', '2014-11-10 00:36:17', 3, '2014-11-05 00:40:33', 'PODM_20140901_01', b'1', 'test', 'test', '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, 'test', 'HQyVED6x6C8TlD6pkMSBu4zYrUBUvGmgXNettfGE', 'jiri.slovak@generali.cz', NULL, 2, NULL),
(51, '2014-11-05 23:57:47', '2014-11-08 07:37:40', 2, '2014-11-05 23:57:47', 'PODM_20140901_01', b'0', 'Aleš ', 'ARA_MISTA', '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', NULL, 'Radoměřský - místa', 'JUSxyCG0t0gBGThBiU7ZNaQR9OsO95dq1SQ8vQhk', 'ales.radomersky@seznam.cz', NULL, 5, NULL),
(52, '2014-11-08 07:40:19', '2014-11-08 07:41:02', 1, '2014-11-08 07:40:19', 'PODM_20140901_01', b'1', 'MIST_Aleš', 'MIST_ARA', '2806e0bbe0f4441a8429ce1523578da104173b82', NULL, 'MIST_Radoměřský', '24rI8m7WppRjvd9wbsJwnGlgaIcdq91fMeOKrd1e', 'ales.radomersky@seznam.cz', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_ADDRESS`
--

DROP TABLE IF EXISTS `APPLICATION_USER_ADDRESS`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ADDRESS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `HOUSE_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `POST_CODE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `STREET` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `ADDRESS_TYPE` int(11) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `DEGREE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SALUTATION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `COUNTRY_STATE_ID` bigint(20) NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `APPLICATION_USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1lkhdy5ej6aur9985jqfh8pxs` (`APPLICATION_USER_ID`),
  KEY `FK_kympp6yykvtws3v1k619bids4` (`LAST_MODIFIED_ID`),
  KEY `FK_r7bbccy3owg6qmctbr03te1tb` (`CREATED_ID`),
  KEY `FK_tier8ryaokcxl0o9fgoh4p5wa` (`COUNTRY_STATE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=8 ;

--
-- Vypisuji data pro tabulku `APPLICATION_USER_ADDRESS`
--

INSERT INTO `APPLICATION_USER_ADDRESS` (`ID`, `CITY`, `HOUSE_NR`, `POST_CODE`, `STREET`, `ADDRESS_TYPE`, `CREATED`, `DEGREE`, `EMAIL`, `LAST_MODIFIED`, `NAME`, `PHONE_NUMBER`, `SALUTATION`, `VERSION`, `COUNTRY_STATE_ID`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
(1, 'Praha 10', '16', '10000', 'Černická', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 45),
(2, 'Plzeň', '7', '32600', 'Olegova', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 47),
(3, 'Plzeň', '34', '32600', 'K Starým valům', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 48),
(4, 'test', 'test', '40004', 'test', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 49),
(5, 'test', 'test', '50003', 'test', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 50),
(6, 'PRAHA_MISTA', '1111', '10000', 'Ulice ARA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 51),
(7, 'mesto', '1', '10000', 'ulice', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 52);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_PHOTO`
--

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
  KEY `FK_ny675dekdd2rk8ujtc6nmqea8` (`APPLICATION_USER_ID`),
  KEY `FK_oftbtl900i2xutpnneehx2h5d` (`CREATED_ID`),
  KEY `FK_srjii7bqdp9emnug5c7043d4x` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `APPLICATION_USER_PHOTO`
--

INSERT INTO `APPLICATION_USER_PHOTO` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
(2, '2014-09-27 11:24:31', '2014-09-27 11:24:31', 0, 'image/jpeg', 'IMAG0507.jpg', NULL, NULL, 25),
(3, '2014-11-01 23:25:16', '2014-11-01 23:25:16', 0, 'image/jpeg', 'Zloděj 20140910_2300_3.jpg', NULL, NULL, 45),
(4, '2014-11-02 07:19:53', '2014-11-02 07:19:53', 0, 'image/jpeg', 'IMG_7813.jpg', 43, 43, 43),
(5, '2014-11-03 07:03:13', '2014-11-03 07:03:13', 0, 'image/jpeg', '26102013012.jpg', NULL, NULL, 47),
(6, '2014-11-03 19:17:58', '2014-11-03 19:17:58', 0, 'image/jpeg', 'Green Sea Turtle.jpg', NULL, NULL, 48),
(7, '2014-11-05 00:39:20', '2014-11-05 00:39:20', 0, 'image/jpeg', 'Koala.jpg', NULL, NULL, 49),
(8, '2014-11-05 00:40:35', '2014-11-05 00:40:35', 0, 'image/jpeg', 'Jellyfish.jpg', NULL, NULL, 50),
(9, '2014-11-05 23:57:49', '2014-11-05 23:57:49', 0, 'image/jpeg', 'IMAG0384.jpg', NULL, NULL, 51),
(10, '2014-11-08 07:40:24', '2014-11-08 07:40:24', 0, 'image/jpeg', 'IMG_9383.jpg', NULL, NULL, 52);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_ROLE`
--

DROP TABLE IF EXISTS `APPLICATION_USER_ROLE`;
CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ROLE` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK_21d31gwey0t8tqpkt3jjsca74` (`USER_ID`),
  KEY `FK_fvy2dr55uu61y45vcl97u336y` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `APPLICATION_USER_ROLE`
--

INSERT INTO `APPLICATION_USER_ROLE` (`USER_ID`, `ROLE_ID`) VALUES
(5, 3),
(2, 3),
(39, 3),
(40, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 5),
(46, 4),
(47, 5),
(48, 5),
(49, 5),
(51, 5),
(52, 5),
(50, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `BICYCLE_CATEGORY`
--

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
  KEY `FK_q34d2355sptbvsiehbbhotfb6` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `BICYCLE_CATEGORY`
--

INSERT INTO `BICYCLE_CATEGORY` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-05-11 00:04:42', '2014-05-11 00:04:42', 0, 'Pánské', 'bcat_man', NULL, 2, 2),
(2, '2014-05-11 00:04:53', '2014-05-11 00:04:53', 0, 'Dámské', 'bcat_woman', NULL, 2, 2),
(3, '2014-05-11 00:05:02', '2014-05-11 00:05:02', 0, 'Dětské', 'bcat_child', NULL, 2, 2),
(4, '2014-05-24 13:52:01', '2014-05-24 13:57:44', 2, 'Pánské/Dámské', 'bcat_all', NULL, 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `CATEGORY`
--

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
  KEY `FK_hybvs6iml7t18iq3u4hc0ui8s` (`CATEGORY_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=23 ;

--
-- Vypisuji data pro tabulku `CATEGORY`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `CATEGORY_TYPE`
--

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
  KEY `FK_g9f8yev3stq33vdfhjv62k1px` (`LAST_MODIFIED_ID`),
  KEY `FK_tcg900co137gb1ojjnsq0kqgk` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `CATEGORY_TYPE`
--

INSERT INTO `CATEGORY_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 0, 'Kola', 'cattype_bike', NULL, NULL, NULL),
(2, NULL, NULL, 1, 'Ostatní', 'cattype_other', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `COUNTRY_STATE`
--

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
  KEY `FK_2pmgyopqb0clmuanf77vq4wke` (`LAST_MODIFIED_ID`),
  KEY `FK_t2jxuvyhrbg179egfqgoloigr` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `COUNTRY_STATE`
--

INSERT INTO `COUNTRY_STATE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 1, 'Česká republika', 'cs_cz', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `FIGURE_HEIGHT`
--

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
  KEY `FK_b1o7nvqwlnfv7nlhk3s9ow62d` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=13 ;

--
-- Vypisuji data pro tabulku `FIGURE_HEIGHT`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `NEWS_ITEM`
--

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
  KEY `FK_htwlgse9e60unyni021stcgmw` (`LAST_MODIFIED_ID`),
  KEY `FK_loc6p9w7owyae6emyuaakrvbu` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=30 ;

--
-- Vypisuji data pro tabulku `NEWS_ITEM`
--

INSERT INTO `NEWS_ITEM` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ENABLED`, `NEWS_ITEM_DATE`, `NEWS_ITEM_TYPE`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-07-23 23:21:07', '2014-05-30 01:25:27', 5, b'1', '2014-04-01 00:00:00', 0, 'Spuštění webu kolomet. Web specializovaný na prodej kol od profesionálů na českém trhu.', 2, 2),
(2, '2014-07-23 23:21:07', '2014-05-30 01:25:35', 3, b'1', '2014-03-10 00:00:00', 0, 'Zacal vyvoj na webu kolomet.cz', 2, 2),
(3, '2014-07-23 23:21:07', '2014-05-30 01:25:45', 5, b'1', '2014-03-27 00:00:00', 0, 'Upraveny detail prodejce a produktu', 2, 2),
(4, '2014-07-23 23:21:07', '2014-10-11 12:11:09', 5, b'0', '2014-03-30 00:00:00', 1, 'Tady je klientů :-)', 2, 5),
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
(25, '2014-10-05 13:47:12', '2014-10-05 13:47:12', 0, b'1', '2014-10-05 13:47:00', 0, ' test', 2, 2),
(26, '2014-10-05 16:43:12', '2014-10-05 16:43:12', 0, b'1', '2014-10-05 16:43:00', 0, ' testtest', 2, 2),
(27, '2014-10-11 12:11:49', '2014-10-11 12:11:49', 0, b'1', '2014-10-11 12:11:00', 1, ' Test reklamy', 5, 5),
(29, '2014-10-12 20:00:54', '2014-10-12 20:01:16', 1, b'1', '2014-10-12 20:00:00', 1, ' <img alt="" src="/kolomet/file/newsitem/29/logo_a_orig.gif" />', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `NEWS_ITEM_PHOTO_URL`
--

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
  KEY `FK_242mmqq0ni1cu3fvkvnc5ev2a` (`LAST_MODIFIED_ID`),
  KEY `FK_71vu9u8rai1wj1vfoi0lfci0y` (`CREATED_ID`),
  KEY `FK_dy4o2opondpbbob7q9u7idahy` (`NEWSITEM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=35 ;

--
-- Vypisuji data pro tabulku `NEWS_ITEM_PHOTO_URL`
--

INSERT INTO `NEWS_ITEM_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `NEWSITEM_ID`) VALUES
(5, '2014-05-19 03:33:49', '2014-05-19 03:33:49', 0, 'image/jpeg', 'img_6426-180pix.jpg', 5, 5, 11),
(8, '2014-06-02 21:18:33', '2014-06-02 21:18:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 16),
(9, '2014-06-02 22:45:59', '2014-06-02 22:45:59', 0, 'image/jpeg', 'IMG_9855.JPG', 5, 5, 11),
(11, '2014-06-03 17:13:33', '2014-06-03 17:13:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 19),
(26, '2014-06-15 12:47:48', '2014-06-15 12:47:48', 0, 'image/jpeg', 'LOGOREKLAMA15mm1.jpg', 5, 5, 23),
(29, '2014-06-15 13:26:58', '2014-06-15 13:26:58', 0, 'image/jpeg', 'MegaBike177pix1.jpg', 5, 5, 24),
(30, '2014-06-15 13:32:49', '2014-06-15 13:32:49', 0, 'image/jpeg', 'MaxByke177pix1.jpg', 5, 5, 14),
(31, '2014-10-05 16:43:12', '2014-10-05 16:43:12', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 26),
(32, '2014-10-11 12:11:49', '2014-10-11 12:11:49', 0, 'image/jpeg', 'IMG_9047.jpg', 5, 5, 27),
(34, '2014-10-12 20:00:54', '2014-10-12 20:00:54', 0, 'image/gif', 'logo_a.gif', 5, 5, 29);

-- --------------------------------------------------------

--
-- Struktura tabulky `PHOTO_URL`
--

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
  KEY `FK_ok94liy1e5n1xxxr58f4t14fv` (`PRODUCT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=57 ;

--
-- Vypisuji data pro tabulku `PHOTO_URL`
--

INSERT INTO `PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PRODUCT_ID`) VALUES
(1, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, 'image/jpeg', 'IMG_9406.jpg', 5, 5, 1),
(2, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, 'image/jpeg', 'IMG_9417.jpg', 5, 5, 1),
(3, '2014-11-01 19:46:35', '2014-11-01 19:46:35', 0, 'image/jpeg', 'IMG_9408.jpg', 5, 5, 1),
(4, '2014-11-01 21:07:50', '2014-11-01 21:07:50', 0, 'image/jpeg', 'IMG_9370.jpg', 43, 43, 2),
(5, '2014-11-01 21:07:59', '2014-11-01 21:07:59', 0, 'image/jpeg', 'IMG_9383.jpg', 43, 43, 2),
(6, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, 'image/jpeg', 'image.jpg', 44, 44, 3),
(7, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, 'image/jpeg', 'Screenshot_2014-11-02-00-18-14.jpg', 46, 46, 4),
(16, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, 'image/jpeg', 'image.jpg', 2, 2, 7),
(17, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, 'image/jpeg', 'P1050634.JPG', 2, 2, 7),
(18, '2014-11-02 22:48:00', '2014-11-02 22:48:00', 0, 'image/jpeg', 'image.jpg', 2, 2, 8),
(19, '2014-11-02 22:48:00', '2014-11-02 22:48:00', 0, 'image/jpeg', 'P1050634.JPG', 2, 2, 8),
(20, '2014-11-02 23:01:26', '2014-11-02 23:01:26', 0, 'image/jpeg', 'IMG_0919.JPG', 2, 2, 8),
(21, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'image/jpeg', 'IMG_9406.jpg', 5, 5, 10),
(22, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'image/jpeg', 'IMG_9417.jpg', 5, 5, 10),
(23, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'image/jpeg', 'IMG_9408.jpg', 5, 5, 10),
(24, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'image/jpeg', 'IMG_9406.jpg', 5, 5, 12),
(25, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'image/jpeg', 'IMG_9380.jpg', 5, 5, 12),
(26, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'image/jpeg', 'IMG_9406.jpg', 5, 5, 13),
(27, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'image/jpeg', 'IMG_9403.jpg', 5, 5, 13),
(28, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'image/png', 'j0149014_1d0f2660.png', 5, 5, 13),
(29, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'image/jpeg', 'IMG_9406.jpg', 43, 43, 14),
(30, '2014-11-03 21:52:12', '2014-11-03 21:52:12', 0, 'image/jpeg', 'P1020295.JPG', 43, 43, 14),
(31, '2014-11-04 23:00:38', '2014-11-04 23:00:38', 0, 'image/jpeg', 'IMG_9370.jpg', 2, 2, 15),
(32, '2014-11-04 23:00:38', '2014-11-04 23:00:38', 0, 'image/jpeg', 'IMG_9383.jpg', 2, 2, 15),
(33, '2014-11-04 23:01:48', '2014-11-04 23:01:48', 0, 'image/jpeg', 'IMG_0909.JPG', 2, 2, 5),
(34, '2014-11-04 23:02:50', '2014-11-04 23:02:50', 0, 'image/jpeg', 'P1050461.JPG', 2, 2, 6),
(35, '2014-11-04 23:02:50', '2014-11-04 23:02:50', 0, 'image/jpeg', 'P1050467.JPG', 2, 2, 6),
(36, '2014-11-04 23:02:50', '2014-11-04 23:02:50', 0, 'image/jpeg', 'P1050468.JPG', 2, 2, 6),
(37, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, 'image/jpeg', 'IMG_9370.jpg', 2, 2, 16),
(38, '2014-11-04 23:04:56', '2014-11-04 23:04:56', 0, 'image/jpeg', 'IMG_9383.jpg', 2, 2, 16),
(39, '2014-11-04 23:04:56', '2014-11-04 23:04:56', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 16),
(40, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'image/jpeg', 'image.jpg', 2, 2, 17),
(41, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'image/jpeg', 'P1050634.JPG', 2, 2, 17),
(42, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'image/jpeg', 'IMG_0919.JPG', 2, 2, 17),
(43, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'image/jpeg', 'IMG_9406.jpg', 2, 2, 18),
(44, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'image/jpeg', 'IMG_9417.jpg', 2, 2, 18),
(45, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'image/jpeg', 'IMG_9408.jpg', 2, 2, 18),
(46, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 18),
(47, '2014-11-05 00:42:48', '2014-11-05 00:42:48', 0, 'image/jpeg', 'Hydrangeas.jpg', 2, 2, 19),
(48, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, 'image/jpeg', 'Jellyfish.jpg', 2, 2, 20),
(49, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 21),
(50, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, 'image/jpeg', 'IMG_9381.jpg', 5, 5, 22),
(51, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, 'image/jpeg', 'IMG_9387.jpg', 5, 5, 22),
(52, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, 'image/jpeg', 'IMG_9381.jpg', 5, 5, 23),
(53, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, 'image/jpeg', 'IMG_9403.jpg', 5, 5, 23),
(54, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, 'image/jpeg', 'IMG_9370.jpg', 5, 5, 23),
(55, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, 'image/jpeg', 'IMG_9381.jpg', 5, 5, 24),
(56, '2014-11-10 21:35:14', '2014-11-10 21:35:14', 0, 'image/jpeg', 'DSC_0377b.jpg', 5, 5, 24);

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE`
--

DROP TABLE IF EXISTS `PLACE`;
CREATE TABLE IF NOT EXISTS `PLACE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `HOUSE_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `POST_CODE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `STREET` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `BIKE_ROAD_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `DESCRIPTION` TEXT COLLATE utf8_czech_ci DEFAULT NULL,
  `DESCRIPTION_LINK` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `NORTH` double DEFAULT NULL,
  `WEST` double DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `NR_OF_RANKINGS` int(11) DEFAULT NULL,
  `QUALITY_RANKING` double DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `COUNTRY_STATE_ID` bigint(20) DEFAULT NULL,
  `OWNER_ID` bigint(20) DEFAULT NULL,
  `PLACE_TYPE_ID` bigint(20) NOT NULL,
  `REGION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_9to8pj3jys8vpckoefxd9bxrh` (`OWNER_ID`),
  KEY `FK_7e3xc9na32f4vtkcaeqe1wub` (`PLACE_TYPE_ID`),
  KEY `FK_gd4td1k10n6v30tm3a2dr8lyg` (`CREATED_ID`),
  KEY `FK_mgst3mvw1k918de2tt6x9g0ch` (`REGION_ID`),
  KEY `FK_p1hwtjuhnopvj2at3hf8fwbu3` (`LAST_MODIFIED_ID`),
  KEY `FK_ri7u7ytu03mt38ly2f54pa6nw` (`COUNTRY_STATE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `PLACE`
--

INSERT INTO `PLACE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CITY`, `HOUSE_NR`, `POST_CODE`, `STREET`, `BIKE_ROAD_NR`, `DESCRIPTION`, `DESCRIPTION_LINK`, `NORTH`, `WEST`, `NAME`, `NR_OF_RANKINGS`, `QUALITY_RANKING`, `CREATED_ID`, `LAST_MODIFIED_ID`, `COUNTRY_STATE_ID`, `OWNER_ID`, `PLACE_TYPE_ID`, `REGION_ID`) VALUES
(1, '2014-11-01 23:10:30', '2014-11-01 23:10:47', 1, NULL, NULL, NULL, NULL, '111', 'Pohled na Hradčany', '', 50.0830863552717, 14.4133758544922, 'Hradčany', 1, 4, 43, 43, NULL, 43, 2, 1),
(2, '2014-11-02 07:27:35', '2014-11-02 07:27:35', 0, NULL, NULL, NULL, NULL, 'D1', 'Testuji zadání restaurace', 'není odkaz', 49.8379824530848, 16.083984375, 'Pod dubem', 0, 0, 43, 43, NULL, 43, 1, 11),
(3, '2014-11-03 09:41:56', '2014-11-03 09:41:56', 0, NULL, NULL, NULL, NULL, 'test', '', 'test', 50.516919485758, 13.7109375, 'test', 0, 0, 2, 2, NULL, 2, 2, 4),
(4, '2014-11-05 00:41:50', '2014-11-05 00:41:50', 0, NULL, NULL, NULL, NULL, 'test', 'test', 'test', 50.2050332649433, 15.64453125, 'test', 0, 0, 50, 50, NULL, 50, 2, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_COMMENT`
--

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
  KEY `FK_7iefirxym9bgarret3lkksknf` (`PARENT_ID`),
  KEY `FK_ajrabpp2wf6nsd1b2vdo84ors` (`LAST_MODIFIED_ID`),
  KEY `FK_hbquro7jljerfp8lulkte1yey` (`CREATED_ID`),
  KEY `FK_my6q5esbvd72ji2f1ewe9wdch` (`PLACE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `PLACE_COMMENT`
--

INSERT INTO `PLACE_COMMENT` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PARENT_ID`, `PLACE_ID`) VALUES
(1, '2014-11-02 07:23:43', '2014-11-02 07:23:43', 0, 'Testuji zadání komentáře\r\na nyní druhá řádka \r\na nyní třetí', 43, 43, NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_PHOTO_URL`
--

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
  KEY `FK_bo5cgle90q88rgyayct5sxu45` (`LAST_MODIFIED_ID`),
  KEY `FK_dkptru7v2fl68ktapm0kv4ste` (`CREATED_ID`),
  KEY `FK_m8mb87jyvlsu3ircc9ofqcga2` (`PLACE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `PLACE_PHOTO_URL`
--

INSERT INTO `PLACE_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PLACE_ID`) VALUES
(1, '2014-11-01 23:10:30', '2014-11-01 23:10:30', 0, 'image/jpeg', 'Hradčany.jpg', 43, 43, 1),
(2, '2014-11-02 07:27:35', '2014-11-02 07:27:35', 0, 'image/jpeg', 'IMG_9082_HDR.jpg', 43, 43, 2),
(3, '2014-11-02 07:27:35', '2014-11-02 07:27:35', 0, 'image/jpeg', 'IMG_9097_HDR.jpg', 43, 43, 2),
(4, '2014-11-03 09:41:56', '2014-11-03 09:41:56', 0, 'image/jpeg', 'P1050461.JPG', 2, 2, 3),
(5, '2014-11-05 00:41:50', '2014-11-05 00:41:50', 0, 'image/jpeg', 'Desert.jpg', 50, 50, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_TYPE`
--

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
  KEY `FK_mh1fy92k29vil9c8mpaad8rkd` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `PLACE_TYPE`
--

INSERT INTO `PLACE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PLACE_TYPE_COLOR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-06-24 00:30:36', '2014-08-23 17:42:48', 2, 'Restaurace', 'ptype_restaurant', 10, 2, 2, 2),
(2, '2014-06-24 00:31:44', '2014-09-20 17:38:20', 4, 'Příroda, památky', 'ptype_interest', 100, 1, 2, 5),
(3, '2014-10-25 13:27:38', '2014-11-01 07:46:16', 2, 'Zábava nejen pro děti', 'Zábava', 0, 4, 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCER`
--

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
  KEY `FK_21juuudrqcggvhfpptvejayni` (`LAST_MODIFIED_ID`),
  KEY `FK_tm7ly8b339h4u325qhv0hdh8w` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=100 ;

--
-- Vypisuji data pro tabulku `PRODUCER`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT`
--

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
  `BICYCLE_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `FIGURE_HEIGHT_ID` bigint(20) DEFAULT NULL,
  `PRODUCER_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_COLOR_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_USAGE_ID` bigint(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `VALID_FROM` (`VALID_FROM`),
  KEY `VALID_TO` (`VALID_TO`),
  KEY `ENABLED` (`ENABLED`),
  KEY `FK_6t6fwpoax5485lfta1ha89rlh` (`CATEGORY_ID`),
  KEY `FK_dvx56wdl9qapvlfqumc05c4oe` (`LAST_MODIFIED_ID`),
  KEY `FK_e7x61n614plid9vikljs1u5ut` (`SELLER_ID`),
  KEY `FK_h1mudty2asxysiyi74ir30spv` (`CREATED_ID`),
  KEY `FK_hqwmmht0gcdpnlrpbg7do7ir7` (`PRODUCT_ID`),
  KEY `FK_ikr28obncik165j8dlmkcocit` (`PRODUCT_COLOR_ID`),
  KEY `FK_mat3d1nlrjhsdyq9eu9wplbsx` (`FIGURE_HEIGHT_ID`),
  KEY `FK_oc5ooeca0l6gimle8uo979jwe` (`BICYCLE_CATEGORY_ID`),
  KEY `FK_ovmxhqqkejg87xt23y7pkn4t` (`PRODUCT_USAGE_ID`),
  KEY `FK_p4tbeci5384m88ypcrouapxtc` (`PRODUCER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=25 ;

--
-- Vypisuji data pro tabulku `PRODUCT`
--

INSERT INTO `PRODUCT` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `BUY_URL`, `CAN_SEND_TO_ALL_COUNTRY`, `DELIVERY_FOR_FREE`, `DESCRIPTION`, `DISCOUNT`, `ENABLED`, `FINAL_PRICE`, `PRICE`, `PRODUCT_NAME`, `PRODUCT_STATE`, `VALID_FROM`, `VALID_TO`, `WEIGHT`, `CREATED_ID`, `LAST_MODIFIED_ID`, `BICYCLE_CATEGORY_ID`, `CATEGORY_ID`, `PRODUCT_ID`, `FIGURE_HEIGHT_ID`, `PRODUCER_ID`, `PRODUCT_COLOR_ID`, `PRODUCT_USAGE_ID`, `SELLER_ID`) VALUES
(1, '2014-11-01 19:46:24', '2014-11-01 19:46:24', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I', 1, '2014-11-01 00:00:00', '9999-12-31 00:00:00', 5.9, 5, 5, 1, 2, NULL, 10, 98, 17, 1, 3),
(2, '2014-11-01 21:07:49', '2014-11-01 21:07:49', 0, 'www.wincor-nixdorf.cz', b'1', b'1', ' Vkládám kolo uživatele al_rad@post.cz', '11111.00', b'1', '66666.00', '77777.00', 'AL_RAD Testovací kolo', 1, '2014-11-01 00:00:00', '9999-12-31 00:00:00', 12.5, 43, 43, 4, 2, NULL, 12, 24, 9, 4, 3),
(3, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, 'www.seznam.cz', b'1', b'1', '', '5000.00', b'1', '50000.00', '55000.00', 'Merida', 1, '2014-11-01 00:00:00', '2020-11-01 00:00:00', 9, 44, 44, 1, 11, NULL, 10, 62, 8, 2, 4),
(4, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, 'www.nevim.cz', b'1', b'1', ' 2 kola a brzdy', '2000.00', b'1', '13000.00', '15000.00', 'modre', 1, '2014-11-02 00:00:00', '2014-12-31 00:00:00', 10, 46, 46, 4, 6, NULL, 10, 98, 4, 1, 5),
(5, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 2, 'www.wincor-nixdorf.cz', b'1', b'1', ' Vkládám kolo uživatele al_rad@post.cz - jako kopie z již existujícího', '11111.00', b'1', '33333.00', '44444.00', 'AL_RAD Testovací kolo KOPIE', 1, '2014-11-02 00:00:00', '9999-12-31 00:00:00', 12, 43, 2, 3, 2, 2, 6, 25, 3, 3, 3),
(6, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 2, 'www.wincor-nixdorf.cz', b'1', b'1', ' Vkládám kolo uživatele al_rad@post.cz - jako kopie z již existujícího', '11111.00', b'1', '33333.00', '44444.00', 'AL_RAD Testovací kolo KOPIE', 1, '2014-11-02 00:00:00', '9999-12-31 00:00:00', 12, 43, 2, 3, 2, 2, 6, 25, 3, 3, 3),
(7, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, 'www.seznam.cz', b'1', b'1', '', '5000.00', b'1', '50000.00', '55000.00', 'Merida', 1, '2014-11-02 00:00:00', '2020-11-01 00:00:00', 9, 2, 2, 1, 11, 3, 10, 62, 8, 2, 4),
(8, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, 'www.seznam.cz', b'1', b'1', '', '5000.00', b'1', '50000.00', '55000.00', 'Merida', 1, '2014-11-02 00:00:00', '2020-11-01 00:00:00', 9, 2, 2, 1, 11, 3, 10, 62, 8, 2, 4),
(9, '2014-11-03 08:21:47', '2014-11-03 08:21:47', 0, 'www.idnes.cz', b'1', b'1', ' Testuji zápis data vytvoření a případně změny', '10000.00', b'1', '20000.00', '30000.00', 'Kolo KOLOMET', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 16.6, 5, 5, 1, 2, NULL, 10, 30, 7, 3, 4),
(10, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA<div>Dělám kopii </div>', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I_KOPIE', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 6, 5, 5, 1, 2, 1, 6, 98, 17, 1, 3),
(11, '2014-11-03 09:45:26', '2014-11-03 09:45:26', 0, 'test', b'1', b'1', ' test', '80000.00', b'1', '20000.00', '100000.00', 'test', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 10, 2, 2, 2, 2, NULL, 4, 24, NULL, 2, 3),
(12, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA<div>Kopie II</div>', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I_KOPIE II', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 6, 5, 5, 1, 2, 1, 10, 98, 17, 1, 3),
(13, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA<div>Kopie II0</div>', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I_KOPIE III', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 6, 5, 5, 1, 2, 12, 10, 98, 17, 1, 3),
(14, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA<div>Kopie II</div><div>Kopise pod uživatelem al_rad</div>', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I_KOPIE IIV', 1, '2014-11-03 00:00:00', '9999-12-31 00:00:00', 6, 43, 43, 1, 2, 13, 10, 98, 17, 1, 3),
(15, '2014-11-04 23:00:36', '2014-11-04 23:00:36', 0, 'www.wincor-nixdorf.cz', b'1', b'1', ' Vkládám kolo uživatele al_rad@post.cz', '11111.00', b'1', '66666.00', '77777.00', 'AL_RAD Testovací kolo', 1, '2014-11-04 00:00:00', '9999-12-31 00:00:00', 12, 2, 2, 4, 2, 2, 12, 24, 9, 4, 3),
(16, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, 'www.wincor-nixdorf.cz', b'1', b'1', ' Vkládám kolo uživatele al_rad@post.cz', '11111.00', b'1', '66666.00', '77777.00', 'AL_RAD Testovací kolo', 1, '2014-11-04 00:00:00', '9999-12-31 00:00:00', 12, 2, 2, 4, 2, 2, 12, 24, 9, 4, 3),
(17, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'www.seznam.cz', b'1', b'1', ' tes test', '5000.00', b'1', '50000.00', '55000.00', 'Merida', 1, '2014-11-05 00:00:00', '2020-11-01 00:00:00', 9, 2, 2, 1, 11, 8, 10, 62, 8, 2, 4),
(18, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'www.idnes.cz', b'1', b'0', ' První kolo pod adminem ARA<div>Dělám kopii </div>', '10000.00', b'1', '50000.00', '60000.00', 'ARA_I_KOPIE', 1, '2014-11-05 00:00:00', '9999-12-31 00:00:00', 6, 2, 2, 1, 2, 10, 6, 98, 17, 1, 3),
(19, '2014-11-05 00:42:47', '2014-11-05 00:42:47', 0, 'test', b'1', b'1', ' test', '180000.00', b'1', '20000.00', '200000.00', 'test', 1, '2014-11-05 00:00:00', '9999-12-31 00:00:00', 10, 2, 2, 2, 2, NULL, 4, 24, NULL, 2, 3),
(20, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, 'test', b'1', b'1', ' test', '18000.00', b'1', '2000.00', '20000.00', 'test', 1, '2014-11-05 00:00:00', '9999-12-31 00:00:00', 20, 2, 2, 2, 2, NULL, 4, 24, NULL, 2, 3),
(21, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, 'test', b'1', b'1', ' test', '18000.00', b'1', '2000.00', '20000.00', 'test', 1, '2014-11-05 00:00:00', '9999-12-31 00:00:00', 20, 2, 2, 2, 2, 20, 4, 24, NULL, 2, 3),
(22, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, 'www.idnes.cz', b'1', b'1', ' Zadávám inzerát pro otestování verze 1.0.48', '50.00', b'1', '65300.00', '65350.00', 'Test kol', 1, '2014-11-06 00:00:00', '9999-12-31 00:00:00', 11.4, 5, 5, 1, 2, NULL, 1, 39, 9, 1, 3),
(23, '2014-11-06 00:18:04', '2014-11-06 00:18:04', 0, 'www.idnes.cz', b'1', b'1', ' Zadávám inzerát pro otestování verze 1.0.48<div>Provádím klonování </div>', '50.00', b'1', '65300.00', '65350.00', 'Test kol_Kopie 1', 1, '2014-11-06 00:00:00', '9999-12-31 00:00:00', 11, 5, 5, 1, 2, 22, 12, 39, 19, 1, 3),
(24, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, 'www.idnes.cz', b'1', b'1', ' Zadávám inzerát pro otestování verze 1.0.48<div>Zkouším koppie č.3</div>', '50.00', b'1', '65300.00', '65350.00', 'Test kol_Kopie 3', 1, '2014-11-10 00:00:00', '9999-12-31 00:00:00', 11, 5, 5, 1, 2, 22, 7, 39, 11, 1, 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_ATTRIBUTE`
--

DROP TABLE IF EXISTS `PRODUCT_ATTRIBUTE`;
CREATE TABLE IF NOT EXISTS `PRODUCT_ATTRIBUTE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ATTRIBUTE_VALUE` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `ATTRIBUTE_TYPE_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_cdugk8tgii0svs97t787exkm8` (`ATTRIBUTE_TYPE_ID`),
  KEY `FK_6h8m6ocg2jhu3bfieqa0dupb1` (`PRODUCT_ID`),
  KEY `FK_jigly7glwaisxgnvxjvilhak0` (`LAST_MODIFIED_ID`),
  KEY `FK_onscn5vlf8boou38pvxooqbmd` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=342 ;

--
-- Vypisuji data pro tabulku `PRODUCT_ATTRIBUTE`
--

INSERT INTO `PRODUCT_ATTRIBUTE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ATTRIBUTE_VALUE`, `CREATED_ID`, `LAST_MODIFIED_ID`, `ATTRIBUTE_TYPE_ID`, `PRODUCT_ID`) VALUES
(2, NULL, NULL, 0, '2 roky', NULL, NULL, 2, 1),
(4, NULL, NULL, 0, 'tyrkysová', NULL, NULL, 4, 1),
(7, NULL, NULL, 0, 'červená', NULL, NULL, 4, 2),
(8, NULL, NULL, 0, 'černá', NULL, NULL, 4, 5),
(13, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 8, '2 roky', 5, 5, 2, 11),
(14, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 8, 'červená', 5, 5, 4, 11),
(15, '2014-05-11 12:16:47', '2014-06-15 20:48:36', 2, '2 roky', 5, 5, 2, 3),
(16, '2014-05-11 12:17:33', '2014-06-15 20:48:36', 2, '3 roky', 5, 5, 2, 3),
(17, '2014-05-11 12:21:58', '2014-06-15 20:48:36', 2, 'červená', 5, 5, 4, 3),
(18, '2014-05-11 12:25:21', '2014-06-15 20:48:36', 2, '4 roky', 5, 5, 2, 3),
(21, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '2 roky', 5, 2, 2, 12),
(22, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '', 5, 2, 4, 12),
(23, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 8, '14"', 5, 2, 7, 12),
(24, '2014-05-18 22:29:32', '2014-06-15 20:45:06', 1, '27"', 5, 5, 7, 11),
(25, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, '1,5 roku', 5, 5, 2, 13),
(26, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, 'Perleťová a hnědá a fialová', 5, 5, 4, 13),
(27, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 13, '', 5, 5, 7, 13),
(42, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '24 měsíců', 14, 5, 2, 17),
(43, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, 'bílá', 14, 5, 4, 17),
(44, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '19"', 14, 5, 7, 17),
(46, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '', 7, 5, 2, 18),
(47, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, 'červená', 7, 5, 4, 18),
(48, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '1,3', 7, 5, 7, 18),
(50, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 2, 19),
(51, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, 'tyrkysova', 7, 5, 4, 19),
(52, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 7, 19),
(54, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 2, 21),
(55, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 'tyrkysova', 2, 5, 4, 21),
(56, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 7, 21),
(58, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 2, 22),
(59, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, 'tyrkysova', 2, 5, 4, 22),
(60, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 7, 22),
(62, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 4, 23),
(63, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 2, 23),
(64, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 7, 23),
(66, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '2 roky', 2, 2, 2, 24),
(67, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, 'červená', 2, 2, 4, 24),
(68, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '27"', 2, 2, 7, 24),
(70, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '24 měsíců', 5, 5, 2, 25),
(71, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, 'bílá', 5, 5, 4, 25),
(72, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '19"', 5, 5, 7, 25),
(74, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '24 měsíců', 5, 5, 2, 26),
(75, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, 'bílá', 5, 5, 4, 26),
(76, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '19"', 5, 5, 7, 26),
(78, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '24 měsíců', 5, 2, 2, 27),
(79, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, 'bílá', 5, 2, 4, 27),
(80, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '19"', 5, 2, 7, 27),
(82, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 1, '', 5, 5, 7, 1),
(84, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, 'červená', 2, 5, 4, 28),
(85, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 2, 28),
(86, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 7, 28),
(88, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 2, 29),
(89, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 'tyrkysova', 2, 5, 4, 29),
(90, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 7, 29),
(92, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 2, 30),
(93, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 'tyrkysova', 2, 2, 4, 30),
(94, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 7, 30),
(96, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 4, 31),
(97, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 2, 31),
(98, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 7, 31),
(100, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '2 roky', 5, 5, 2, 32),
(101, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, 'červená', 5, 5, 4, 32),
(102, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '27"', 5, 5, 7, 32),
(104, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 4, 20),
(105, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 2, 20),
(106, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 7, 20),
(109, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 4, 10),
(110, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 2, 10),
(111, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 7, 10),
(117, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 2),
(118, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 7, 2),
(120, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 0, '', 5, 5, 7, 3),
(122, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 2, 33),
(123, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 4, 33),
(124, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '1,3', 5, 2, 7, 33),
(126, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, '1,5 roku', 7, 5, 2, 34),
(127, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, 'Perleťová a hnědá a fialová', 7, 5, 4, 34),
(128, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, '', 7, 5, 7, 34),
(130, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, 'chromová', 6, 2, 4, 35),
(132, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, '19"', 6, 2, 7, 35),
(133, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, 'bez záruky', 6, 2, 2, 35),
(134, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 4, 36),
(135, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 9, 36),
(137, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 7, 36),
(138, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 2, 36),
(139, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 4, 37),
(140, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 9, 37),
(142, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 7, 37),
(143, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, 'Testcccc', 2, 2, 2, 37),
(144, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, 'test', 2, 5, 4, 38),
(145, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, 'test', 2, 5, 9, 38),
(147, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, '', 2, 5, 7, 38),
(148, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, '', 2, 5, 2, 38),
(149, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 4, 39),
(150, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 9, 39),
(152, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 7, 39),
(153, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 2, 39),
(156, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 4, 42),
(157, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 9, 42),
(159, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'testtes', 2, 2, 7, 42),
(160, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 2, 42),
(161, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 4, 43),
(162, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 9, 43),
(164, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 7, 43),
(165, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 2, 43),
(166, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'žluté pruhy', 5, 5, 4, 44),
(167, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'Ano', 5, 5, 9, 44),
(168, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'aa', 5, 5, 7, 44),
(169, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, '2 roky', 5, 5, 2, 44),
(170, '2014-10-05 17:26:07', '2014-10-05 17:26:07', 0, '', 5, 5, 9, 22),
(171, '2014-10-11 07:11:03', '2014-10-11 07:12:05', 2, '', 5, 5, 9, 34),
(172, '2014-10-11 07:12:20', '2014-10-12 02:25:50', 9, '', 5, 2, 9, 35),
(173, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, 'zlaté hvězdičky', 5, 5, 4, 1),
(174, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, 'ano ... jaký svět neviděl', 5, 5, 9, 1),
(175, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, '16"', 5, 5, 7, 1),
(176, '2014-11-01 19:46:25', '2014-11-01 19:46:25', 0, '5 let', 5, 5, 2, 1),
(177, '2014-11-01 21:07:50', '2014-11-01 21:07:50', 0, 'hnědá', 43, 43, 4, 2),
(178, '2014-11-01 21:07:50', '2014-11-01 21:07:50', 0, 'ano', 43, 43, 9, 2),
(179, '2014-11-01 21:07:50', '2014-11-01 21:07:50', 0, '', 43, 43, 7, 2),
(180, '2014-11-01 21:07:50', '2014-11-01 21:07:50', 0, '10 let', 43, 43, 2, 2),
(181, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, 'Červená', 44, 44, 4, 3),
(182, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, '', 44, 44, 9, 3),
(183, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, '', 44, 44, 7, 3),
(184, '2014-11-01 22:49:27', '2014-11-01 22:49:27', 0, '1 rok', 44, 44, 2, 3),
(185, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, '', 46, 46, 4, 4),
(186, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, '', 46, 46, 9, 4),
(187, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, '', 46, 46, 7, 4),
(188, '2014-11-02 00:36:16', '2014-11-02 00:36:16', 0, '', 46, 46, 2, 4),
(189, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, 'červená', 43, 2, 4, 5),
(190, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 2, 5),
(191, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 7, 5),
(192, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, 'hnědá', 43, 2, 4, 5),
(193, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, 'ano', 43, 2, 9, 5),
(194, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 7, 5),
(195, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '10 let', 43, 2, 2, 5),
(196, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 4, 5),
(197, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 9, 5),
(198, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 7, 5),
(199, '2014-11-02 07:08:34', '2014-11-04 23:01:48', 1, '', 43, 2, 2, 5),
(200, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, 'červená', 43, 2, 4, 6),
(201, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 2, 6),
(202, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 7, 6),
(203, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, 'hnědá', 43, 2, 4, 6),
(204, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, 'ano', 43, 2, 9, 6),
(205, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 7, 6),
(206, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '10 let', 43, 2, 2, 6),
(207, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 4, 6),
(208, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 9, 6),
(209, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 7, 6),
(210, '2014-11-02 07:10:05', '2014-11-04 23:02:50', 1, '', 43, 2, 2, 6),
(211, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '2 roky', 2, 2, 2, 7),
(212, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '3 roky', 2, 2, 2, 7),
(213, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, 'červená', 2, 2, 4, 7),
(214, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '4 roky', 2, 2, 2, 7),
(215, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '', 2, 2, 7, 7),
(216, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, 'Červená', 2, 2, 4, 7),
(217, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '', 2, 2, 9, 7),
(218, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '', 2, 2, 7, 7),
(219, '2014-11-02 21:59:15', '2014-11-02 21:59:15', 0, '1 rok', 2, 2, 2, 7),
(220, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '2 roky', 2, 2, 2, 8),
(221, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '3 roky', 2, 2, 2, 8),
(222, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, 'červená', 2, 2, 4, 8),
(223, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '4 roky', 2, 2, 2, 8),
(224, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '', 2, 2, 7, 8),
(225, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, 'Červená', 2, 2, 4, 8),
(226, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '', 2, 2, 9, 8),
(227, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '', 2, 2, 7, 8),
(228, '2014-11-02 22:47:59', '2014-11-02 23:01:26', 1, '1 rok', 2, 2, 2, 8),
(229, '2014-11-03 08:21:47', '2014-11-03 08:21:47', 0, 'hvězdičky', 5, 5, 4, 9),
(230, '2014-11-03 08:21:47', '2014-11-03 08:21:47', 0, 'ano 1+10', 5, 5, 9, 9),
(231, '2014-11-03 08:21:47', '2014-11-03 08:21:47', 0, '', 5, 5, 7, 9),
(232, '2014-11-03 08:21:47', '2014-11-03 08:21:47', 0, '10 let', 5, 5, 2, 9),
(233, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, '2 roky', 5, 5, 2, 10),
(234, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'tyrkysová', 5, 5, 4, 10),
(235, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, '', 5, 5, 7, 10),
(236, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'zlaté hvězdičky', 5, 5, 4, 10),
(237, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, 'ano ... jaký svět neviděl', 5, 5, 9, 10),
(238, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, '16"', 5, 5, 7, 10),
(239, '2014-11-03 08:25:47', '2014-11-03 08:25:47', 0, '5 let', 5, 5, 2, 10),
(240, '2014-11-03 09:45:26', '2014-11-03 09:45:26', 0, 'test', 2, 2, 4, 11),
(241, '2014-11-03 09:45:26', '2014-11-03 09:45:26', 0, 'test', 2, 2, 9, 11),
(242, '2014-11-03 09:45:26', '2014-11-03 09:45:26', 0, 'test', 2, 2, 7, 11),
(243, '2014-11-03 09:45:26', '2014-11-03 09:45:26', 0, 'test', 2, 2, 2, 11),
(244, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, '2 roky', 5, 5, 2, 12),
(245, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'tyrkysová', 5, 5, 4, 12),
(246, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, '', 5, 5, 7, 12),
(247, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'zlaté hvězdičky', 5, 5, 4, 12),
(248, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, 'ano ... jaký svět neviděl', 5, 5, 9, 12),
(249, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, '16"', 5, 5, 7, 12),
(250, '2014-11-03 21:38:42', '2014-11-03 21:38:42', 0, '5 let', 5, 5, 2, 12),
(251, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '2 roky', 5, 5, 2, 13),
(252, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '', 5, 5, 4, 13),
(253, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '14"', 5, 5, 7, 13),
(254, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '2 roky', 5, 5, 2, 13),
(255, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'tyrkysová', 5, 5, 4, 13),
(256, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '', 5, 5, 7, 13),
(257, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'zlaté hvězdičky', 5, 5, 4, 13),
(258, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, 'ano ... jaký svět neviděl', 5, 5, 9, 13),
(259, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '16"', 5, 5, 7, 13),
(260, '2014-11-03 21:42:43', '2014-11-03 21:42:43', 0, '5 let', 5, 5, 2, 13),
(261, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '1,5 roku', 43, 43, 2, 14),
(262, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'Perleťová a hnědá a fialová', 43, 43, 4, 14),
(263, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '', 43, 43, 7, 14),
(264, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '2 roky', 43, 43, 2, 14),
(265, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '', 43, 43, 4, 14),
(266, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '14"', 43, 43, 7, 14),
(267, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '2 roky', 43, 43, 2, 14),
(268, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'tyrkysová', 43, 43, 4, 14),
(269, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '', 43, 43, 7, 14),
(270, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'zlaté hvězdičky', 43, 43, 4, 14),
(271, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, 'ano ... jaký svět neviděl', 43, 43, 9, 14),
(272, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '16"', 43, 43, 7, 14),
(273, '2014-11-03 21:52:11', '2014-11-03 21:52:11', 0, '5 let', 43, 43, 2, 14),
(274, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, 'červená', 2, 2, 4, 15),
(275, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, '', 2, 2, 2, 15),
(276, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, '', 2, 2, 7, 15),
(277, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, 'hnědá', 2, 2, 4, 15),
(278, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, 'ano', 2, 2, 9, 15),
(279, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, '', 2, 2, 7, 15),
(280, '2014-11-04 23:00:37', '2014-11-04 23:00:37', 0, '10 let', 2, 2, 2, 15),
(281, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, 'červená', 2, 2, 4, 16),
(282, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, '', 2, 2, 2, 16),
(283, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, '', 2, 2, 7, 16),
(284, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, 'hnědá', 2, 2, 4, 16),
(285, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, 'ano', 2, 2, 9, 16),
(286, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, '', 2, 2, 7, 16),
(287, '2014-11-04 23:04:55', '2014-11-04 23:04:55', 0, '10 let', 2, 2, 2, 16),
(288, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '2 roky', 2, 2, 2, 17),
(289, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '3 roky', 2, 2, 2, 17),
(290, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'červená', 2, 2, 4, 17),
(291, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '4 roky', 2, 2, 2, 17),
(292, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '', 2, 2, 7, 17),
(293, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, 'Červená', 2, 2, 4, 17),
(294, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '', 2, 2, 9, 17),
(295, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '', 2, 2, 7, 17),
(296, '2014-11-05 00:18:51', '2014-11-05 00:18:51', 0, '1 rok', 2, 2, 2, 17),
(297, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '', 2, 2, 4, 18),
(298, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '', 2, 2, 2, 18),
(299, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '', 2, 2, 7, 18),
(300, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '2 roky', 2, 2, 2, 18),
(301, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'tyrkysová', 2, 2, 4, 18),
(302, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '', 2, 2, 7, 18),
(303, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'zlaté hvězdičky', 2, 2, 4, 18),
(304, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, 'ano ... jaký svět neviděl', 2, 2, 9, 18),
(305, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '16"', 2, 2, 7, 18),
(306, '2014-11-05 00:42:23', '2014-11-05 00:42:23', 0, '5 let', 2, 2, 2, 18),
(307, '2014-11-05 00:42:47', '2014-11-05 00:42:47', 0, '', 2, 2, 4, 19),
(308, '2014-11-05 00:42:47', '2014-11-05 00:42:47', 0, '', 2, 2, 9, 19),
(309, '2014-11-05 00:42:47', '2014-11-05 00:42:47', 0, '', 2, 2, 7, 19),
(310, '2014-11-05 00:42:47', '2014-11-05 00:42:47', 0, '', 2, 2, 2, 19),
(311, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, '', 2, 2, 4, 20),
(312, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, '', 2, 2, 9, 20),
(313, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, '', 2, 2, 7, 20),
(314, '2014-11-05 00:56:15', '2014-11-05 00:56:15', 0, '', 2, 2, 2, 20),
(315, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 4, 21),
(316, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 2, 21),
(317, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 7, 21),
(318, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 4, 21),
(319, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 9, 21),
(320, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 7, 21),
(321, '2014-11-05 00:56:28', '2014-11-05 00:56:28', 0, '', 2, 2, 2, 21),
(322, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, 'green', 5, 5, 4, 22),
(323, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, '1+10', 5, 5, 9, 22),
(324, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, 'Hooodně', 5, 5, 7, 22),
(325, '2014-11-06 00:09:02', '2014-11-06 00:09:02', 0, '100 let', 5, 5, 2, 22),
(326, '2014-11-06 00:18:04', '2014-11-06 00:18:04', 0, '1', 5, 5, 2, 23),
(327, '2014-11-06 00:18:04', '2014-11-06 00:18:04', 0, 'tyrkysova', 5, 5, 4, 23),
(328, '2014-11-06 00:18:04', '2014-11-06 00:18:04', 0, '1', 5, 5, 7, 23),
(329, '2014-11-06 00:18:04', '2014-11-06 00:18:04', 0, '', 5, 5, 9, 23),
(330, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, 'green', 5, 5, 4, 23),
(331, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, '1+10', 5, 5, 9, 23),
(332, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, 'Hooodně', 5, 5, 7, 23),
(333, '2014-11-06 00:18:05', '2014-11-06 00:18:05', 0, '100 let', 5, 5, 2, 23),
(334, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, '1', 5, 5, 2, 24),
(335, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, 'tyrkysova', 5, 5, 4, 24),
(336, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, '1', 5, 5, 7, 24),
(337, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, '', 5, 5, 9, 24),
(338, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, 'green', 5, 5, 4, 24),
(339, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, '1+10', 5, 5, 9, 24),
(340, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, 'Hooodně', 5, 5, 7, 24),
(341, '2014-11-10 21:35:13', '2014-11-10 21:35:13', 0, '100 let', 5, 5, 2, 24);

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_ATTRIBUTE_TYPE`
--

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
  KEY `FK_c49l7fsj3jj00hr7w8tqk7peh` (`CATEGORY_TYPE_ID`),
  KEY `FK_l1smb5oyq0svfltyt4c0qvv3m` (`LAST_MODIFIED_ID`),
  KEY `FK_mbl5lgsvkudd9o5ibjpop0blb` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=10 ;

--
-- Vypisuji data pro tabulku `PRODUCT_ATTRIBUTE_TYPE`
--

INSERT INTO `PRODUCT_ATTRIBUTE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `REQUIRED`, `UNITS`, `CREATED_ID`, `LAST_MODIFIED_ID`, `CATEGORY_TYPE_ID`) VALUES
(2, NULL, '2014-06-12 01:22:54', 1, 'Záruka', 'pat.bike.guarantee', 100, b'0', '', NULL, 2, 1),
(4, NULL, '2014-06-14 19:52:52', 3, 'Doplňující barva', 'pat.bike.color', 10000, b'0', '', NULL, 2, 1),
(7, '2014-05-16 23:52:46', '2014-06-12 01:23:11', 4, 'Velikost kola', 'pat.bike.bikesize', 100, b'0', '', 2, 2, 1),
(9, '2014-10-03 07:38:01', '2014-10-03 07:38:01', 0, 'Možnost koupit na úvěr', 'pat.bike.loan', 100, b'0', '', 5, 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_COLOR`
--

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
  KEY `FK_hpcmjjdvptxf0xy952m5tqep8` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=20 ;

--
-- Vypisuji data pro tabulku `PRODUCT_COLOR`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_COMMENT`
--

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
  KEY `FK_lq7ng0nthdvxqjbefd1sfig74` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `PRODUCT_COMMENT`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_USAGE`
--

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
  KEY `FK_n7fjcq4k3mo7140gd70ql7x3` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `PRODUCT_USAGE`
--

INSERT INTO `PRODUCT_USAGE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-04-14 20:59:57', '2014-04-14 20:59:57', 0, 'Terénní', 'usage_terrain', NULL, 5, 5),
(2, '2014-05-03 17:37:27', '2014-05-03 17:37:27', 0, 'Asfalt', 'usage_asphalt', NULL, 5, 5),
(3, '2014-05-03 17:38:54', '2014-05-03 17:38:54', 0, 'Lehký terén', 'usage_easyterrain', NULL, 5, 5),
(4, '2014-05-03 17:39:55', '2014-05-03 17:39:55', 0, 'Sjezdová kola', 'usage_downhill', NULL, 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `RATE`
--

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
  KEY `ENTITY_ID` (`ENTITY_ID`),
  KEY `RATE_TYPE` (`RATE_TYPE`),
  KEY `FK_acb1vjrdtxr36erwi3663x9pk` (`LAST_MODIFIED_ID`),
  KEY `FK_r8tq3l1asnnegemgqb74io4i7` (`CREATED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `RATE`
--

INSERT INTO `RATE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ENTITY_ID`, `IP_ADDRESS`, `RATE_TYPE`, `VALUE`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-11-01 23:10:47', '2014-11-01 23:10:47', 0, 1, '78.102.194.152', 0, 4, 43, 43);

-- --------------------------------------------------------

--
-- Struktura tabulky `REGION`
--

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
  KEY `FK_ldyl6246ebdhl6xujw00sgoq3` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=16 ;

--
-- Vypisuji data pro tabulku `REGION`
--

INSERT INTO `REGION` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `GOOGLE_ALIAS`, `NORTH`, `WEST`, `ZOOM`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-07-23 23:21:07', '2014-10-05 19:17:21', 11, 'Praha', 'reg_pha', NULL, 'Hlavní město Praha', 50.0641917366591, 14.4937133789062, 11, 2, 5),
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

-- --------------------------------------------------------

--
-- Struktura tabulky `REGISTRATION_REQUEST`
--

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
  `TEXT` text COLLATE utf8_czech_ci,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_4lt98qpyqkbtb5kwjhbnq2gsi` (`CREATED_ID`),
  KEY `FK_qw090r8xfeko91802tdghs0qx` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `REGISTRATION_REQUEST`
--

INSERT INTO `REGISTRATION_REQUEST` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CAPTCHA_TEXT`, `EMAIL`, `PHONE`, `PROCESSED`, `TEXT`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-11-01 21:50:21', '2014-11-01 22:43:50', 1, NULL, 'jiri.slovak@generali.cz', '606034523', b'1', '<div><br /></div><div>Název firmy (dle rejstříku, ŽL):</div><div>IČ:</div><div>DIČ:</div><div>Sídlo</div><div>     ulice:              č.p./or. </div><div>     PSČ:</div><div>     město:</div><div>     země:</div><div><br /></div><div>Jméno a příjmení osoby, oprávněné za firmu ve věcech inzerce jednat:</div><div>E-mail:</div><div>Telefon:</div><div>Web:    http//</div><div><br /></div><div>Vzkaz pro pracovníky, kteří budou zpracovávat Vaši registraci (např. doba, kdy Vás můžeme telefonicky zastihnout):</div>\r\n', NULL, 2),
(2, '2014-11-01 21:59:30', '2014-11-01 21:59:30', 0, NULL, 'ales.radomersky@seznam.cz', '+420724216728', b'0', '<div><br /></div><div>Název firmy (dle rejstříku, ŽL): Aaaaaaaaaa<b>aaaaaaaa</b></div><div>IČ:  aaaaaaaaaa<i>aaa</i>aaaa</div><div>DIČ:+++++++</div><div>Sídlo</div><div>     ulice:              č.p./or. </div><div>     PSČ:</div><div>     město:</div><div>     země:</div><div><br /></div><div>Jméno a příjmení osoby, oprávněné za firmu ve věcech inzerce jednat:</div><div>E-mail:</div><div>Telefon:</div><div>Web:    http//</div><div><br /></div><div>Vzkaz pro pracovníky, kteří budou zpracovávat Vaši registraci (např. doba, kdy Vás můžeme telefonicky zastihnout):</div><div>prosím rychle</div>\r\n', 43, 43),
(3, '2014-11-01 22:22:58', '2014-11-02 14:56:42', 4, NULL, 'tomas.radomersky@gmail.com', '560230513', b'1', '<div><br /></div><div>Název firmy (dle rejstříku, ŽL):</div><div>IČ:</div><div>DIČ:</div><div>Sídlo</div><div>     ulice:              č.p./or. </div><div>     PSČ:</div><div>     město:praha</div><div>     země:Česká republika </div><div><br /></div><div>Jméno a příjmení osoby, oprávněné za firmu ve věcech inzerce jednat:</div><div>E-mail:</div><div>Telefon:</div><div>Web:    http//</div><div><br /></div><div>Vzkaz pro pracovníky, kteří budou zpracovávat Vaši registraci (např. doba, kdy Vás můžeme telefonicky zastihnout):</div>\r\n', NULL, 5),
(4, '2014-11-03 06:58:50', '2014-11-03 06:58:50', 0, NULL, 'trying@email.cz', '602614027', b'0', '<div><br /></div><div>Název firmy (dle rejstříku, ŽL): Trying<br /></div><div>IČ:1231123123</div><div>DIČ: CZ 1231123123</div><div>Sídlo<br /></div><div>     ulice:              č.p./or.K Valům 34<br /></div><div>     PSČ: 32600<br /></div><div>     město: Plzeň<br /></div><div>     země: CZ<br /></div><div><br /></div><div>Jméno a příjmení osoby, oprávněné za firmu ve věcech inzerce jednat:</div><div>E-mail: trying@email.cz<br /></div><div>Telefon: 602614027<br /></div><div>Web:    http//</div><div><br /></div><div>Vzkaz pro pracovníky, kteří budou zpracovávat Vaši registraci (např. doba, kdy Vás můžeme telefonicky zastihnout): večer<br /></div>\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER`
--

DROP TABLE IF EXISTS `SELLER`;
CREATE TABLE IF NOT EXISTS `SELLER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ENABLED` bit(1) DEFAULT NULL,
  `MAP_URL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_DEGREE` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_EMAIL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_NAME` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_SALUTATION` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `PERSON_SURNAME` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `SALE_TYPE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SELLER_DESCRIPTION` longtext COLLATE utf8_czech_ci NOT NULL,
  `SELLER_NAME` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `SELLER_TITLE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `WEB` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `REGION_ID` bigint(20) DEFAULT NULL,
  `SELLER_STATUS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_6ncfsiinfn7myojrb7q18xmk7` (`CREATED_ID`),
  KEY `FK_gn39yi5ym6am63eh4359rx06l` (`LAST_MODIFIED_ID`),
  KEY `FK_jbfv0uw21rhbem1ky6xt4a62e` (`REGION_ID`),
  KEY `FK_a1vaxq533fxecndx02tu30jpr` (`SELLER_STATUS_ID`),
  KEY `ENABLED` (`ENABLED`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `SELLER`
--

INSERT INTO `SELLER` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ENABLED`, `MAP_URL`, `PERSON_DEGREE`, `PERSON_EMAIL`, `PERSON_NAME`, `PERSON_SALUTATION`, `PERSON_SURNAME`, `SALE_TYPE`, `SELLER_DESCRIPTION`, `SELLER_NAME`, `SELLER_TITLE`, `WEB`, `CREATED_ID`, `LAST_MODIFIED_ID`, `REGION_ID`, `SELLER_STATUS_ID`) VALUES
(1, '2014-11-01 18:40:11', '2014-11-01 18:40:11', 0, b'1', 'TEST', 'test', NULL, 'test', 'test', 'test', 'test', ' test', 'test', 'test', 'http://test', 2, 2, 8, 2),
(2, '2014-11-01 19:26:24', '2014-11-01 19:26:24', 0, b'1', 'test', 'test', 'jiri.slovak@generali.czz', 'test', 'test', 'test', 'test', ' test', 'test', 'test', 'http://test', 2, 2, 8, 2),
(3, '2014-11-01 19:31:58', '2014-11-01 19:31:58', 0, b'1', 'http://www.mapy.cz/zakladni?x=14.5059575&y=50.0796186&z=15&source=addr&id=9105818&q=černická%2016', 'ZOD_Ing.', 'al_rad@post.cz', 'ZOD_Aleš', 'ZOD_Pan', 'ZOD_Radoměřský', 'obchod', ' Vytvoření prodejce pod adminem pro první kolo testů', 'ARA Cyklo', 'ARA Cyclo dlouhý', 'http://www.kolomet.cz', 5, 5, 1, 2),
(4, '2014-11-01 22:29:55', '2014-11-01 22:29:55', 0, b'1', 'http://www.mapy.cz/zakladni?x=13.3041195&y=49.3915603&z=15&source=addr&id=10995999&q=Lipová%20454%20Klatovy', '', 'tomas.radomersky@gmail.com', 'Tomáš', 'Pan', 'Radoměřský', 'po telefonu :-)', ' Zakládám žádost prodejce T.Radoměřského ', 'TOM Cyklo', 'Cyklo prodejna Tomáše Radoměřského', 'http://www.seznam.cz', 5, 5, 6, 2),
(5, '2014-11-02 00:03:20', '2014-11-02 00:03:20', 0, b'1', 'http://www.mapy.cz/zakladni?x=14.5059575&y=50.0796186&z=15&source=addr&id=9105818', 'Ing.', 'radomerska@seznam.cz', 'Lenka', 'Paní', 'Radoměřská', 'jakákoliv', ' Testovací prodejce Lenka', 'LEN Cyklo', 'Cyklo prodejna Lenka', 'http://www.novinky.cz', 5, 5, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_ADDRESS`
--

DROP TABLE IF EXISTS `SELLER_ADDRESS`;
CREATE TABLE IF NOT EXISTS `SELLER_ADDRESS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `HOUSE_NR` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `POST_CODE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `STREET` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `ADDRESS_TYPE` int(11) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `DEGREE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `SALUTATION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `COUNTRY_STATE_ID` bigint(20) NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `APPLICATION_USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_15filb5iluxyivox0pvoufua4` (`COUNTRY_STATE_ID`),
  KEY `FK_2esdu2jfoxwyugk04trqgmcb6` (`CREATED_ID`),
  KEY `FK_lnk56vbft5mo92n1lbm0dlxx7` (`LAST_MODIFIED_ID`),
  KEY `FK_ferfx5bvoyhgtvrtjrq7ha5yp` (`APPLICATION_USER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `SELLER_ADDRESS`
--

INSERT INTO `SELLER_ADDRESS` (`ID`, `CITY`, `HOUSE_NR`, `POST_CODE`, `STREET`, `ADDRESS_TYPE`, `CREATED`, `DEGREE`, `EMAIL`, `LAST_MODIFIED`, `NAME`, `PHONE_NUMBER`, `SALUTATION`, `VERSION`, `COUNTRY_STATE_ID`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
(1, 'test', NULL, '50002', 'test', 1, NULL, 'test', 'jiri.slovak@test.cz', NULL, 'test', NULL, 'testtes', 0, 1, NULL, NULL, NULL),
(2, 'test', NULL, '50002', 'test', 2, NULL, 'test', 'test', NULL, 'test', '606034523', 'test', 0, 1, NULL, NULL, NULL),
(3, 'test', NULL, '', 'test', 1, NULL, 'test', NULL, NULL, 'test', NULL, 'test', 0, 1, NULL, NULL, 2),
(4, 'test', NULL, '', 'test', 2, NULL, 'test', '', NULL, 'test', '', 'test', 0, 1, NULL, NULL, 2),
(5, 'KOR_Praha', NULL, '10000', 'KOR_Černiská 16', 1, NULL, 'KOR_Ing.', NULL, NULL, 'KOR_Aleš Radoměřský', NULL, 'KOR_Pan', 0, 1, NULL, NULL, 3),
(6, 'PRO_Praha 10', NULL, '10000', 'PRO_Černická 16', 2, NULL, 'PRO_Ing.', 'al_rad@post.cz', NULL, 'PRO_ARA provozovna', '+420724216728', 'PRO_Pan', 0, 1, NULL, NULL, 3),
(7, 'Klatovy IV', NULL, '33901', 'Lipová 454', 1, NULL, '', NULL, NULL, 'Tomášek', NULL, 'Pan', 0, 1, NULL, NULL, 4),
(8, 'Klatovy IV', NULL, '33901', 'Lipová 454', 2, NULL, '', 'tomas.radomersky@gmail.com', NULL, 'TOM Cyklo', '111111111', 'Pan', 0, 1, NULL, NULL, 4),
(9, 'Praha 10', NULL, '10000', 'Černická 16', 1, NULL, 'Ing.', NULL, NULL, 'Lenka Radoměřská', NULL, 'Paní', 0, 1, NULL, NULL, 5),
(10, 'Praha 10', NULL, '10000', 'Černická 16', 2, NULL, 'Ing.', 'radomerska@seznam.cz', NULL, 'Provozovna LEN Cyklo', '222222222', 'Paní', 0, 1, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_PHOTO_URL`
--

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
  KEY `FK_l5mq9ni0xb7iui6iy0jtlvdbn` (`SELLER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `SELLER_PHOTO_URL`
--

INSERT INTO `SELLER_PHOTO_URL` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `SELLER_ID`) VALUES
(1, '2014-11-01 19:26:25', '2014-11-01 19:26:25', 0, 'image/jpeg', 'Chrysanthemum.jpg', 2, 2, 2),
(2, '2014-11-01 19:31:59', '2014-11-01 19:31:59', 0, 'image/jpeg', 'Hradčany.jpg', 5, 5, 3),
(4, '2014-11-01 23:18:11', '2014-11-01 23:18:11', 0, 'image/jpeg', 'IMAG0507.jpg', 5, 5, 4),
(5, '2014-11-02 00:03:21', '2014-11-02 00:03:21', 0, 'image/jpeg', 'P1020167.JPG', 5, 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_STATUS`
--

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
  KEY `FK_k332y8traiqa44kwmbu26wqtb` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `SELLER_STATUS`
--

INSERT INTO `SELLER_STATUS` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PRIORITY`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 0, 'VIP', 'sellst_vip', NULL, 100, NULL, NULL),
(2, NULL, '2014-05-24 13:01:12', 2, 'Běžný prodejce', 'sellst_ord', NULL, 100, NULL, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `VISITOR_ACTIVITY_LOG`
--

DROP TABLE IF EXISTS `VISITOR_ACTIVITY_LOG`;
CREATE TABLE IF NOT EXISTS `VISITOR_ACTIVITY_LOG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_TYPE` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ndoj59gttf986dbcb9p174jxn` (`PRODUCT_ID`),
  KEY `FK_8eid5i8irew7vtrgdqisoo5py` (`SELLER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=154 ;

--
-- Vypisuji data pro tabulku `VISITOR_ACTIVITY_LOG`
--

INSERT INTO `VISITOR_ACTIVITY_LOG` (`ID`, `ACTIVITY_TYPE`, `CREATED`, `IP_ADDRESS`, `PRODUCT_ID`, `SELLER_ID`) VALUES
(1, 'SELLER_VISIT', '2014-11-01 19:26:25', '79.127.138.93', NULL, 2),
(2, 'SELLER_VISIT', '2014-11-01 19:32:09', '78.102.194.152', NULL, 3),
(3, 'PRODUCT_VISIT', '2014-11-01 19:46:39', '78.102.194.152', 1, 3),
(4, 'PRODUCT_VISIT', '2014-11-01 21:08:03', '78.102.194.152', 2, 3),
(5, 'SELLER_VISIT', '2014-11-01 22:29:58', '78.102.194.152', NULL, 4),
(6, 'PRODUCT_VISIT', '2014-11-01 22:49:27', '78.102.194.152', 3, 4),
(7, 'PRODUCT_VISIT', '2014-11-01 22:50:28', '78.102.194.152', 3, 4),
(8, 'PRODUCT_VISIT', '2014-11-01 22:58:04', '79.127.138.93', 3, 4),
(9, 'PRODUCT_VISIT', '2014-11-01 23:02:12', '78.102.194.152', 3, 4),
(10, 'PRODUCT_VISIT', '2014-11-01 23:02:36', '78.102.194.152', 3, 4),
(11, 'PRODUCT_VISIT', '2014-11-01 23:02:42', '78.102.194.152', 2, 3),
(12, 'SELLER_VISIT', '2014-11-01 23:16:11', '78.102.194.152', NULL, 4),
(13, 'SELLER_VISIT', '2014-11-01 23:17:02', '78.102.194.152', NULL, 4),
(14, 'SELLER_VISIT', '2014-11-01 23:18:11', '78.102.194.152', NULL, 4),
(15, 'SELLER_VISIT', '2014-11-02 00:03:22', '78.102.194.152', NULL, 5),
(16, 'PRODUCT_VISIT', '2014-11-02 00:36:16', '78.102.194.152', 4, 5),
(17, 'PRODUCT_VISIT', '2014-11-02 00:36:17', '78.102.194.152', 4, 5),
(18, 'PRODUCT_VISIT', '2014-11-02 00:37:31', '78.102.194.152', 4, 5),
(19, 'PRODUCT_VISIT', '2014-11-02 06:59:00', '78.102.194.152', 4, 5),
(20, 'PRODUCT_VISIT', '2014-11-02 07:03:39', '78.102.194.152', 2, 3),
(21, 'PRODUCT_VISIT', '2014-11-02 07:11:27', '78.102.194.152', 6, 3),
(22, 'PRODUCT_VISIT', '2014-11-02 07:18:00', '78.102.194.152', 6, 3),
(23, 'PRODUCT_VISIT', '2014-11-02 07:18:07', '78.102.194.152', 5, 3),
(24, 'SELLER_VISIT', '2014-11-02 07:32:35', '78.102.194.152', NULL, 5),
(25, 'SELLER_VISIT', '2014-11-02 07:32:49', '78.102.194.152', NULL, 3),
(26, 'PRODUCT_VISIT', '2014-11-02 09:02:05', '78.102.194.152', 4, 5),
(27, 'PRODUCT_VISIT', '2014-11-02 09:02:09', '78.102.194.152', 4, 5),
(28, 'PRODUCT_VISIT', '2014-11-02 10:19:40', '78.102.194.152', 4, 5),
(29, 'PRODUCT_VISIT', '2014-11-02 12:34:53', '79.127.138.93', 5, 3),
(30, 'PRODUCT_VISIT', '2014-11-02 12:35:14', '79.127.138.93', 5, 3),
(31, 'PRODUCT_VISIT', '2014-11-02 13:11:40', '79.127.138.93', 4, 5),
(32, 'PRODUCT_VISIT', '2014-11-02 21:42:49', '79.127.138.93', 5, 3),
(33, 'PRODUCT_VISIT', '2014-11-02 21:43:16', '79.127.138.93', 2, 3),
(34, 'PRODUCT_VISIT', '2014-11-02 21:43:18', '79.127.138.93', 4, 5),
(35, 'PRODUCT_VISIT', '2014-11-02 21:43:21', '79.127.138.93', 6, 3),
(36, 'PRODUCT_VISIT', '2014-11-02 21:43:25', '79.127.138.93', 2, 3),
(37, 'PRODUCT_VISIT', '2014-11-02 21:58:51', '79.127.138.93', 5, 3),
(38, 'PRODUCT_VISIT', '2014-11-02 21:58:58', '79.127.138.93', 3, 4),
(39, 'PRODUCT_VISIT', '2014-11-02 21:59:15', '79.127.138.93', 7, 4),
(40, 'PRODUCT_VISIT', '2014-11-02 22:47:22', '79.127.138.93', 3, 4),
(41, 'PRODUCT_VISIT', '2014-11-02 22:47:31', '79.127.138.93', 3, 4),
(42, 'PRODUCT_VISIT', '2014-11-02 22:48:00', '79.127.138.93', 8, 4),
(43, 'PRODUCT_VISIT', '2014-11-02 22:48:15', '79.127.138.93', 8, 4),
(44, 'PRODUCT_VISIT', '2014-11-02 22:48:20', '79.127.138.93', 8, 4),
(45, 'PRODUCT_VISIT', '2014-11-02 22:48:24', '79.127.138.93', 8, 4),
(46, 'PRODUCT_VISIT', '2014-11-02 23:01:26', '79.127.138.93', 8, 4),
(47, 'PRODUCT_VISIT', '2014-11-02 23:21:12', '79.127.138.93', 8, 4),
(48, 'PRODUCT_VISIT', '2014-11-02 23:27:43', '79.127.138.93', 8, 4),
(49, 'PRODUCT_VISIT', '2014-11-02 23:28:05', '79.127.138.93', 8, 4),
(50, 'PRODUCT_VISIT', '2014-11-02 23:28:23', '79.127.138.93', 8, 4),
(51, 'PRODUCT_VISIT', '2014-11-02 23:28:32', '79.127.138.93', 8, 4),
(52, 'PRODUCT_VISIT', '2014-11-02 23:29:48', '79.127.138.93', 8, 4),
(53, 'PRODUCT_VISIT', '2014-11-03 08:22:45', '212.24.138.12', 6, 3),
(54, 'PRODUCT_VISIT', '2014-11-03 08:25:06', '212.24.138.12', 1, 3),
(55, 'PRODUCT_VISIT', '2014-11-03 08:25:47', '212.24.138.12', 10, 3),
(56, 'PRODUCT_VISIT', '2014-11-03 08:26:34', '212.24.138.12', 9, 4),
(57, 'PRODUCT_VISIT', '2014-11-03 08:27:11', '212.24.138.12', 10, 3),
(58, 'PRODUCT_VISIT', '2014-11-03 08:27:35', '212.24.138.12', 1, 3),
(59, 'PRODUCT_VISIT', '2014-11-03 08:27:41', '212.24.138.12', 2, 3),
(60, 'PRODUCT_VISIT', '2014-11-03 08:27:46', '212.24.138.12', 3, 4),
(61, 'PRODUCT_VISIT', '2014-11-03 08:27:52', '212.24.138.12', 5, 3),
(62, 'PRODUCT_VISIT', '2014-11-03 08:27:55', '212.24.138.12', 5, 3),
(63, 'PRODUCT_VISIT', '2014-11-03 08:29:12', '212.24.138.12', 10, 3),
(64, 'PRODUCT_VISIT', '2014-11-03 08:30:21', '212.24.138.12', 1, 3),
(65, 'PRODUCT_VISIT', '2014-11-03 09:19:35', '212.67.67.2', 5, 3),
(66, 'PRODUCT_VISIT', '2014-11-03 10:30:35', '212.67.67.2', 8, 4),
(67, 'SELLER_VISIT', '2014-11-03 10:31:39', '212.67.67.2', NULL, 3),
(68, 'SELLER_VISIT', '2014-11-03 10:31:43', '212.67.67.2', NULL, 5),
(69, 'PRODUCT_VISIT', '2014-11-03 11:13:43', '212.67.67.2', 11, 3),
(70, 'PRODUCT_VISIT', '2014-11-03 19:38:08', '212.67.67.2', 11, 3),
(71, 'PRODUCT_VISIT', '2014-11-03 21:37:44', '78.102.194.152', 1, 3),
(72, 'PRODUCT_VISIT', '2014-11-03 21:38:42', '78.102.194.152', 12, 3),
(73, 'PRODUCT_VISIT', '2014-11-03 21:42:44', '78.102.194.152', 13, 3),
(74, 'PRODUCT_VISIT', '2014-11-03 21:45:33', '78.102.194.152', 13, 3),
(75, 'PRODUCT_VISIT', '2014-11-03 21:52:14', '78.102.194.152', 14, 3),
(76, 'PRODUCT_VISIT', '2014-11-03 21:52:42', '78.102.194.152', 14, 3),
(77, 'PRODUCT_VISIT', '2014-11-03 21:53:15', '78.102.194.152', 14, 3),
(78, 'PRODUCT_VISIT', '2014-11-03 21:53:24', '78.102.194.152', 11, 3),
(79, 'PRODUCT_VISIT', '2014-11-03 21:57:46', '78.102.194.152', 9, 4),
(80, 'PRODUCT_VISIT', '2014-11-04 22:56:53', '79.127.138.93', 6, 3),
(81, 'PRODUCT_VISIT', '2014-11-04 23:00:13', '79.127.138.93', 2, 3),
(82, 'PRODUCT_VISIT', '2014-11-04 23:00:38', '79.127.138.93', 15, 3),
(83, 'PRODUCT_VISIT', '2014-11-04 23:01:00', '79.127.138.93', 6, 3),
(84, 'PRODUCT_VISIT', '2014-11-04 23:01:07', '79.127.138.93', 5, 3),
(85, 'PRODUCT_VISIT', '2014-11-04 23:01:49', '79.127.138.93', 5, 3),
(86, 'PRODUCT_VISIT', '2014-11-04 23:02:12', '79.127.138.93', 6, 3),
(87, 'PRODUCT_VISIT', '2014-11-04 23:02:50', '79.127.138.93', 6, 3),
(88, 'PRODUCT_VISIT', '2014-11-04 23:03:05', '79.127.138.93', 6, 3),
(89, 'PRODUCT_VISIT', '2014-11-04 23:03:34', '79.127.138.93', 6, 3),
(90, 'PRODUCT_VISIT', '2014-11-04 23:04:38', '79.127.138.93', 2, 3),
(91, 'PRODUCT_VISIT', '2014-11-04 23:04:56', '79.127.138.93', 16, 3),
(92, 'PRODUCT_VISIT', '2014-11-04 23:06:00', '79.127.138.93', 15, 3),
(93, 'PRODUCT_VISIT', '2014-11-05 00:18:39', '79.127.138.93', 8, 4),
(94, 'PRODUCT_VISIT', '2014-11-05 00:18:52', '79.127.138.93', 17, 4),
(95, 'PRODUCT_VISIT', '2014-11-05 00:42:11', '79.127.138.93', 10, 3),
(96, 'PRODUCT_VISIT', '2014-11-05 00:42:23', '79.127.138.93', 18, 3),
(97, 'PRODUCT_VISIT', '2014-11-05 00:42:48', '79.127.138.93', 19, 3),
(98, 'PRODUCT_VISIT', '2014-11-05 00:48:49', '79.127.138.93', 18, 3),
(99, 'PRODUCT_VISIT', '2014-11-05 00:48:55', '79.127.138.93', 18, 3),
(100, 'PRODUCT_VISIT', '2014-11-05 00:48:55', '79.127.138.93', 18, 3),
(101, 'PRODUCT_VISIT', '2014-11-05 00:49:00', '79.127.138.93', 18, 3),
(102, 'PRODUCT_VISIT', '2014-11-05 00:54:05', '79.127.138.93', 18, 3),
(103, 'PRODUCT_VISIT', '2014-11-05 00:54:26', '79.127.138.93', 18, 3),
(104, 'PRODUCT_VISIT', '2014-11-05 00:54:49', '79.127.138.93', 14, 3),
(105, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(106, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(107, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(108, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(109, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(110, 'PRODUCT_VISIT', '2014-11-05 00:55:33', '79.127.138.93', 14, 3),
(111, 'PRODUCT_VISIT', '2014-11-05 00:55:35', '79.127.138.93', 14, 3),
(112, 'PRODUCT_VISIT', '2014-11-05 00:56:16', '79.127.138.93', 20, 3),
(113, 'PRODUCT_VISIT', '2014-11-05 00:56:28', '79.127.138.93', 21, 3),
(114, 'PRODUCT_VISIT', '2014-11-06 00:09:04', '78.102.194.152', 22, 3),
(115, 'PRODUCT_VISIT', '2014-11-06 00:18:06', '78.102.194.152', 23, 3),
(116, 'PRODUCT_VISIT', '2014-11-06 00:19:26', '78.102.194.152', 23, 3),
(117, 'PRODUCT_VISIT', '2014-11-06 00:20:33', '78.102.194.152', 16, 3),
(118, 'PRODUCT_VISIT', '2014-11-06 00:20:58', '78.102.194.152', 15, 3),
(119, 'PRODUCT_VISIT', '2014-11-06 00:20:58', '78.102.194.152', 1, 3),
(120, 'PRODUCT_VISIT', '2014-11-06 00:21:15', '78.102.194.152', 15, 3),
(121, 'PRODUCT_VISIT', '2014-11-06 09:30:30', '90.181.163.84', 4, 5),
(122, 'PRODUCT_VISIT', '2014-11-06 09:30:38', '90.181.163.84', 4, 5),
(123, 'PRODUCT_VISIT', '2014-11-06 16:04:24', '78.102.194.152', 4, 5),
(124, 'PRODUCT_VISIT', '2014-11-06 16:04:43', '78.102.194.152', 4, 5),
(125, 'PRODUCT_VISIT', '2014-11-07 21:11:49', '78.102.194.152', 4, 5),
(126, 'PRODUCT_VISIT', '2014-11-07 21:12:09', '78.102.194.152', 4, 5),
(127, 'PRODUCT_VISIT', '2014-11-08 01:43:52', '79.127.138.93', 23, 3),
(128, 'PRODUCT_VISIT', '2014-11-08 01:44:04', '79.127.138.93', 17, 4),
(129, 'PRODUCT_VISIT', '2014-11-08 22:16:43', '78.102.194.152', 4, 5),
(130, 'PRODUCT_VISIT', '2014-11-08 22:17:14', '78.102.194.152', 4, 5),
(131, 'PRODUCT_VISIT', '2014-11-09 09:58:39', '78.102.194.152', 4, 5),
(132, 'PRODUCT_VISIT', '2014-11-09 09:59:03', '78.102.194.152', 4, 5),
(133, 'PRODUCT_VISIT', '2014-11-10 00:32:30', '79.127.138.93', 21, 3),
(134, 'PRODUCT_VISIT', '2014-11-10 00:32:36', '79.127.138.93', 17, 4),
(135, 'PRODUCT_VISIT', '2014-11-10 14:40:05', '78.102.194.152', 4, 5),
(136, 'PRODUCT_VISIT', '2014-11-10 14:40:42', '78.102.194.152', 4, 5),
(137, 'PRODUCT_VISIT', '2014-11-10 15:01:08', '78.102.194.152', 4, 5),
(138, 'PRODUCT_VISIT', '2014-11-10 15:01:55', '78.102.194.152', 4, 5),
(139, 'PRODUCT_VISIT', '2014-11-10 15:02:41', '78.102.194.152', 4, 5),
(140, 'PRODUCT_VISIT', '2014-11-10 16:13:46', '78.102.194.152', 4, 5),
(141, 'PRODUCT_VISIT', '2014-11-10 16:14:15', '78.102.194.152', 4, 5),
(142, 'PRODUCT_VISIT', '2014-11-10 19:39:12', '78.102.194.152', 4, 5),
(143, 'PRODUCT_VISIT', '2014-11-10 19:39:39', '78.102.194.152', 4, 5),
(144, 'PRODUCT_VISIT', '2014-11-10 21:33:49', '78.102.194.152', 22, 3),
(145, 'PRODUCT_VISIT', '2014-11-10 21:35:14', '78.102.194.152', 24, 3),
(146, 'PRODUCT_VISIT', '2014-11-10 21:37:08', '78.102.194.152', 4, 5),
(147, 'PRODUCT_VISIT', '2014-11-10 21:37:25', '78.102.194.152', 4, 5),
(148, 'PRODUCT_VISIT', '2014-11-10 21:37:32', '78.102.194.152', 4, 5),
(149, 'PRODUCT_VISIT', '2014-11-10 21:37:39', '78.102.194.152', 4, 5),
(150, 'PRODUCT_VISIT', '2014-11-10 21:37:55', '78.102.194.152', 4, 5),
(151, 'PRODUCT_VISIT', '2014-11-10 21:38:22', '78.102.194.152', 4, 5),
(152, 'PRODUCT_VISIT', '2014-11-11 18:52:41', '78.102.194.152', 4, 5),
(153, 'PRODUCT_VISIT', '2014-11-11 18:53:09', '78.102.194.152', 4, 5);
