-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Neděle 05. října 2014, 15:05
-- Verze MySQL: 5.1.73
-- Verze PHP: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `kolomet`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `ApplicationPermission`
--

CREATE TABLE IF NOT EXISTS `ApplicationPermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `permissionName` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aj59t1wmmbpj6q6hid9vhe2wb` (`CREATED_ID`),
  KEY `FK_hyu5sbpoc1805axhych5v2tf7` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Vypisuji data pro tabulku `ApplicationPermission`
--

INSERT INTO `ApplicationPermission` (`id`, `version`, `permissionName`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, 0, 'per_applicationusers', '2014-03-31 00:00:00', '2014-03-31 00:00:00', 2, 2),
(4, 0, 'per_sellers', '2014-03-31 06:25:05', '2014-03-31 06:25:05', 2, 2),
(5, 0, 'per_sellerstatuses', '2014-03-31 06:25:30', '2014-03-31 06:25:30', 2, 2),
(6, 0, 'per_regions', '2014-03-31 06:25:41', '2014-03-31 06:25:41', 2, 2),
(7, 0, 'per_countrystates', '2014-03-31 06:25:52', '2014-03-31 06:25:52', 2, 2),
(8, 0, 'per_products', '2014-03-31 06:26:02', '2014-03-31 06:26:02', 2, 2),
(9, 0, 'per_productattributetypes', '2014-03-31 06:26:18', '2014-03-31 06:26:18', 2, 2),
(10, 0, 'per_producers', '2014-03-31 06:26:28', '2014-03-31 06:26:28', 2, 2),
(11, 0, 'per_categorys', '2014-03-31 06:26:40', '2014-03-31 06:26:40', 2, 2),
(12, 0, 'per_categorytypes', '2014-03-31 06:26:53', '2014-03-31 06:26:53', 2, 2),
(13, 0, 'per_newsitems', '2014-03-31 06:27:05', '2014-03-31 06:27:05', 2, 2),
(14, 0, 'per_figureheights', '2014-04-14 20:51:53', '2014-04-14 20:51:53', 5, 5),
(15, 1, 'per_bicyclecategories', '2014-04-14 20:52:11', '2014-05-11 00:04:08', 5, 2),
(16, 1, 'per_productusages', '2014-04-14 20:58:47', '2014-04-14 20:59:19', 5, 5),
(17, 0, 'per_products_all', '2014-04-21 18:38:25', '2014-04-21 18:38:25', 2, 2),
(18, 0, 'per_products_own', '2014-04-21 18:38:36', '2014-04-21 18:38:36', 2, 2),
(19, 0, 'per_sellers_all', '2014-04-21 18:39:31', '2014-04-21 18:39:31', 2, 2),
(20, 0, 'per_sellers_own', '2014-04-21 18:39:39', '2014-04-21 18:39:39', 2, 2),
(21, 1, 'per_registrationrequests', '2014-05-13 00:13:59', '2014-05-13 00:14:34', 2, 2),
(22, 0, 'per_productcolors', '2014-05-18 00:55:50', '2014-05-18 00:55:50', 2, 2),
(23, 0, 'per_test', '2014-05-21 01:45:44', '2014-05-21 01:45:44', 5, 5),
(24, 0, 'per_places', '2014-06-24 00:27:52', '2014-06-24 00:27:52', 2, 2),
(25, 0, 'per_places_all', '2014-06-24 00:28:01', '2014-06-24 00:28:01', 2, 2),
(26, 0, 'per_places_own', '2014-06-24 00:28:07', '2014-06-24 00:28:07', 2, 2),
(27, 1, 'per_placetypes', '2014-07-29 22:05:07', '2014-08-23 15:35:22', 2, 2),
(28, 0, 'per_applicationusers_all', '2014-08-23 15:33:01', '2014-08-23 15:33:01', 2, 2),
(29, 0, 'per_applicationusers_own', '2014-08-23 15:33:08', '2014-08-23 15:33:08', 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `ApplicationRole`
--

CREATE TABLE IF NOT EXISTS `ApplicationRole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ri1fp2mihsws88hrvy4792u5w` (`CREATED_ID`),
  KEY `FK_p2f4hra0190o9t3c3jvoqkj5w` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Vypisuji data pro tabulku `ApplicationRole`
--

INSERT INTO `ApplicationRole` (`id`, `version`, `roleName`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, 10, 'role_admin', '2014-03-31 00:00:00', '2014-08-23 15:36:24', 2, 2),
(4, 5, 'role_seller', '2014-03-31 06:24:02', '2014-08-23 15:36:37', 2, 2),
(5, 2, 'role_user', '2014-06-24 00:28:21', '2014-07-24 23:49:00', 2, 2),
(8, 1, 'role_placeown', '2014-07-25 07:21:49', '2014-07-29 22:05:54', 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `ApplicationUser`
--

CREATE TABLE IF NOT EXISTS `ApplicationUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `SELLER_ID` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `conditionAgreement` datetime DEFAULT NULL,
  `conditionVersion` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7A3BF51BF66C8014` (`SELLER_ID`),
  KEY `FK_p3ob54d2ugnrb0yvng71fa5ix` (`CREATED_ID`),
  KEY `FK_qwu3qu622eq8pjxtpljxfco1j` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Vypisuji data pro tabulku `ApplicationUser`
--

INSERT INTO `ApplicationUser` (`id`, `version`, `password`, `username`, `SELLER_ID`, `created`, `lastModified`, `enabled`, `CREATED_ID`, `LAST_MODIFIED_ID`, `conditionAgreement`, `conditionVersion`, `name`, `phone`, `surname`, `token`) VALUES
(2, 0, '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', 'jiri.slovak@gmail.com', NULL, '2014-03-31 00:00:00', '2014-03-31 00:00:00', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 'b39237b81c337166524f3adf2d94a7f5ad8bb2f5', 'jiri.slovak@generali.cz', 2, '2014-03-31 07:06:47', '2014-03-31 07:06:47', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, '313514ee4cd8eb5d583c0ea5a00dbb9d7d6c285b', 'kola@seznam.cz', 2, '2014-03-31 07:13:54', '2014-03-31 07:13:54', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 10, '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', 'ales.radomersky@gmail.com', NULL, '2014-03-31 07:14:20', '2014-07-13 18:45:21', b'1', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, '4f5c3486072cf152918f8c2d4d64be1b948fa794', 'vit.ratislav@gmail.com', 1, '2014-03-31 07:15:55', '2014-03-31 07:15:55', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, '2bc6038c3dfca09b2da23c8b6da8ba884dc2dcc2', 'tomas.radomersky@gmail.com', 4, '2014-05-18 22:19:21', '2014-05-18 22:19:21', b'1', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, '7ea91fc33cc7d0133a9e99c52dfc6bd6068991e0', 'jitka', 7, '2014-05-24 17:57:20', '2014-05-24 17:57:20', b'1', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'aac933bf0488a15cea45ef12df5322a3e12d7e85', '', 8, '2014-05-26 21:51:06', '2014-05-26 21:51:06', b'1', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 2, '14730548f0e111b267cad18b136a7f58c9523535', 'radomerska@seznam.cz', 9, '2014-06-02 21:08:19', '2014-06-03 20:13:29', b'1', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, '3a7c7c9b69c6b6b5841ad2c12150ad5b0e3bc7db', 'michaela.radomerska@gmail.com', 11, '2014-06-15 21:02:22', '2014-06-15 21:02:22', b'1', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 8, 'b39237b81c337166524f3adf2d94a7f5ad8bb2f5', 'jiri.kratonoha@gmail.com', NULL, '2014-07-25 00:13:18', '2014-07-30 20:33:28', b'1', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', 'slovi', NULL, '2014-09-08 04:58:58', '2014-09-08 04:58:58', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 'e24025da981ce83a66d30cd90d9a77925fbfcd22', 'Petr', NULL, '2014-09-20 17:43:11', '2014-09-20 17:43:11', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 3, 'e4e0c8b747716f72bb2775c01a81ebd79a9ab9c3', 'al_rad@post.cz', NULL, '2014-09-20 17:56:08', '2014-09-20 18:07:55', b'1', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, '59bd0a3ff43b32849b319e645d4798d8a5d1e889', 'info@kolomet.cz', NULL, '2014-09-27 11:24:31', '2014-09-27 11:24:31', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 0, '0b4311e4bd7b72b66cf685a07a9ac76f934ba8a7', 'vit.ratislav@seznam.cz', NULL, '2014-10-01 07:23:16', '2014-10-01 07:23:16', b'0', NULL, NULL, NULL, NULL, 'Vít', NULL, 'Ratislav', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `ApplicationUserPhoto`
--

CREATE TABLE IF NOT EXISTS `ApplicationUserPhoto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `APPLICATION_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9dp3nocvkl8jyu5dkm8h99498` (`CREATED_ID`),
  KEY `FK_61jd1cu7odjalqgmjx49222mj` (`LAST_MODIFIED_ID`),
  KEY `FK_ns0wq1pv85btiq58bsehm5qte` (`APPLICATION_USER_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `ApplicationUserPhoto`
--

INSERT INTO `ApplicationUserPhoto` (`id`, `created`, `lastModified`, `version`, `contentType`, `fileName`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
(1, '2014-09-08 04:58:58', '2014-09-08 04:58:58', 0, 'image/jpeg', 'Koala.jpg', NULL, NULL, 22),
(2, '2014-09-27 11:24:31', '2014-09-27 11:24:31', 0, 'image/jpeg', 'IMAG0507.jpg', NULL, NULL, 25);

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_ROLE_PERMISSION`
--

CREATE TABLE IF NOT EXISTS `APPLICATION_ROLE_PERMISSION` (
  `ROLE_ID` bigint(20) NOT NULL,
  `PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK_l467vw6jhwo522b3ef8ovgkor` (`PERMISSION_ID`),
  KEY `FK_msjrjy23nvkle00037evqd9ef` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `APPLICATION_ROLE_PERMISSION`
--

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

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_ROLE`
--

CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ROLE` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK_fvy2dr55uu61y45vcl97u336y` (`ROLE_ID`),
  KEY `FK_21d31gwey0t8tqpkt3jjsca74` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `APPLICATION_USER_ROLE`
--

INSERT INTO `APPLICATION_USER_ROLE` (`USER_ID`, `ROLE_ID`) VALUES
(2, 3),
(3, 4),
(4, 4),
(6, 3),
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
(26, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `BicycleCategory`
--

CREATE TABLE IF NOT EXISTS `BicycleCategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `codeKey` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_brf05tj5h9ftn90u36yrx2txn` (`CREATED_ID`),
  KEY `FK_80167rv3r0cnu565bu8ihkvum` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `BicycleCategory`
--

INSERT INTO `BicycleCategory` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, '2014-05-11 00:04:42', '2014-05-11 00:04:42', 0, 'Pánské', 'bcat_man', 2, 2, NULL),
(2, '2014-05-11 00:04:53', '2014-05-11 00:04:53', 0, 'Dámské', 'bcat_woman', 2, 2, NULL),
(3, '2014-05-11 00:05:02', '2014-05-11 00:05:02', 0, 'Dětské', 'bcat_child', 2, 2, NULL),
(4, '2014-05-24 13:52:01', '2014-05-24 13:57:44', 2, 'Pánské/Dámské', 'bcat_all', 5, 5, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `BicycleSize`
--

CREATE TABLE IF NOT EXISTS `BicycleSize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1yb8j43vb2q8gpqh0yenbqvje` (`CREATED_ID`),
  KEY `FK_urs0g13l1v973w1844qjvp5y` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Vypisuji data pro tabulku `BicycleSize`
--

INSERT INTO `BicycleSize` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-04-14 20:53:58', '2014-04-14 20:53:58', 0, '12''''', 'bsize_12', 5, 5),
(2, '2014-04-14 20:54:08', '2014-04-14 20:54:08', 0, '14''''', 'bsize_14', 5, 5),
(3, '2014-04-14 20:54:20', '2014-04-14 20:54:20', 0, '15''''', 'bsize_15', 5, 5),
(4, '2014-04-14 20:54:28', '2014-04-14 20:54:28', 0, '16''''', 'bsize_16', 5, 5),
(5, '2014-04-14 20:54:39', '2014-04-14 20:54:39', 0, '17''''', 'bsize_17', 5, 5),
(6, '2014-04-14 20:54:48', '2014-04-14 20:54:48', 0, '18''''', 'bsize_18', 5, 5),
(7, '2014-04-14 20:54:56', '2014-04-14 20:54:56', 0, '19''''', 'bsize_19', 5, 5),
(8, '2014-04-14 20:55:05', '2014-04-14 20:55:05', 0, '20''''', 'bsize_20', 5, 5),
(9, '2014-04-14 20:55:15', '2014-04-14 20:55:15', 0, '21''''', 'bsize_21', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `Category`
--

CREATE TABLE IF NOT EXISTS `Category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `categoryType_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DD211EFFD6B623` (`categoryType_id`),
  KEY `FK_3d8hx4aa4a5lntf8snevk0rd6` (`CREATED_ID`),
  KEY `FK_o03cyrgnf24ljknjpoyvi6eye` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Vypisuji data pro tabulku `Category`
--

INSERT INTO `Category` (`id`, `version`, `codeDescription`, `codeKey`, `categoryType_id`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(2, 0, 'Horská kola', 'cat_bike_mountain', 1, NULL, NULL, NULL, NULL),
(5, 0, 'Celoodpružená kola', 'cat_bike_freeride', 1, NULL, NULL, NULL, NULL),
(6, 1, 'Krosová a trekingová kola', 'cat_bike_cross', 1, NULL, '2014-05-06 18:15:23', NULL, 5),
(8, 0, 'Dětská kola a odrážedla', 'cat_bike_children', 1, NULL, NULL, NULL, NULL),
(9, 0, 'Koloběžky', 'cat_bike_scooter', 1, NULL, NULL, NULL, NULL),
(10, 0, 'Elektrokola', 'cat_bike_electric', 1, NULL, NULL, NULL, NULL),
(11, 0, 'Silniční kola', 'cat_bike_road', 1, NULL, NULL, NULL, NULL),
(12, 0, 'Cyklokrosová kola', 'cat_bike_cyclocross', 1, '2014-05-06 18:17:03', '2014-05-06 18:17:03', 5, 5),
(13, 0, 'Jednokolky', 'cat_bike_onecyclo', 1, '2014-05-06 18:17:41', '2014-05-06 18:17:41', 5, 5),
(14, 0, 'Sjezdová kola', 'cat_bike_downhill', 1, '2014-05-06 18:18:15', '2014-05-06 18:18:15', 5, 5),
(15, 0, 'Freeride-Dirt', 'cat_bike_reeride', 1, '2014-05-06 18:18:55', '2014-05-06 18:18:55', 5, 5),
(16, 0, 'Fitness kola', 'cat_bike_fitness', 1, '2014-05-06 18:19:18', '2014-05-06 18:19:18', 5, 5),
(17, 0, 'Tandemová kola', 'cat_bike_tandem', 1, '2014-05-06 18:19:51', '2014-05-06 18:19:51', 5, 5),
(18, 0, 'Městská kola', 'cat_bike_city', 1, '2014-05-06 18:20:18', '2014-05-06 18:20:18', 5, 5),
(19, 0, 'Skládací kola', 'cat_bike_folding', 1, '2014-05-06 18:20:49', '2014-05-06 18:20:49', 5, 5),
(20, 0, 'Testovací kola', 'cat_bike_testing', 1, '2014-05-06 18:21:09', '2014-05-06 18:21:09', 5, 5),
(21, 0, 'Tříkolky', 'cat_bike_tricycle', 1, '2014-05-06 18:21:57', '2014-05-06 18:21:57', 5, 5),
(22, 0, 'BMX kola', 'cat_bike_BMX', 1, '2014-05-06 18:22:22', '2014-05-06 18:22:22', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `CategoryType`
--

CREATE TABLE IF NOT EXISTS `CategoryType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_456t5n7et0rex63so04b66usp` (`CREATED_ID`),
  KEY `FK_8ifncjqmqrdxlg22p92rk3on1` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `CategoryType`
--

INSERT INTO `CategoryType` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, 0, 'Kola', 'cattype_bike', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Ostatní', 'cattype_other', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `CountryState`
--

CREATE TABLE IF NOT EXISTS `CountryState` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_flsod9r4ycg5lu7ji98bjvlgx` (`CREATED_ID`),
  KEY `FK_e9tq6dyk6rymojau42xcyw7x4` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `CountryState`
--

INSERT INTO `CountryState` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, 1, 'Česká republika', 'cs_cz', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `FigureHeight`
--

CREATE TABLE IF NOT EXISTS `FigureHeight` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hu8n4vvt6bi01vt4h48pnbrjb` (`CREATED_ID`),
  KEY `FK_88353pbg7saerfwe9ueu2axwm` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Vypisuji data pro tabulku `FigureHeight`
--

INSERT INTO `FigureHeight` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, '2014-04-14 20:55:40', '2014-04-14 20:55:40', 0, 'do 90 cm', 'fheight_90', 5, 5, NULL),
(2, '2014-04-14 20:55:56', '2014-04-14 20:55:56', 0, '91 - 100 cm', 'fheight_100', 5, 5, NULL),
(4, '2014-04-14 20:56:31', '2014-05-03 17:49:23', 1, '101 - 115 cm', 'fheight_115', 5, 5, NULL),
(6, '2014-04-14 20:57:12', '2014-05-03 17:49:37', 1, '116 - 130 cm', 'fheight_130', 5, 5, NULL),
(7, '2014-04-14 20:57:29', '2014-05-03 17:53:38', 2, '131 - 145 cm', 'fheight_145', 5, 5, NULL),
(8, '2014-05-03 17:43:12', '2014-05-03 17:54:01', 5, '146 - 160 cm', 'fheight_160', 5, 5, NULL),
(9, '2014-05-03 17:44:55', '2014-05-03 17:54:20', 3, '161 - 175 cm', 'fheight_175', 5, 5, NULL),
(10, '2014-05-03 17:46:37', '2014-05-03 17:54:38', 4, '176 - 190 cm', 'fheight_190', 5, 5, NULL),
(11, '2014-05-03 17:47:12', '2014-05-03 17:55:18', 3, '191 - 205 cm', 'fheight_205', 5, 5, NULL),
(12, '2014-05-03 17:55:41', '2014-05-03 17:55:41', 0, 'nad 205 cm', 'fheight_more205', 5, 5, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `NewsItem`
--

CREATE TABLE IF NOT EXISTS `NewsItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `newsItemDate` datetime DEFAULT NULL,
  `text` longtext NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `newsItemType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_52ppc8kwmk45bsfs5tibbam7u` (`CREATED_ID`),
  KEY `FK_hw29s7miud9olem8x8rxoocvv` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Vypisuji data pro tabulku `NewsItem`
--

INSERT INTO `NewsItem` (`id`, `version`, `enabled`, `newsItemDate`, `text`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `newsItemType`) VALUES
(1, 5, b'1', '2014-04-01 00:00:00', 'Spuštění webu kolomet. Web specializovaný na prodej kol od profesionálů na českém trhu.', NULL, '2014-05-30 01:25:27', NULL, 2, 0),
(2, 3, b'1', '2014-03-10 00:00:00', 'Zacal vyvoj na webu kolomet.cz', NULL, '2014-05-30 01:25:35', NULL, 2, 0),
(3, 5, b'1', '2014-03-27 00:00:00', 'Upraveny detail prodejce a produktu', NULL, '2014-05-30 01:25:45', NULL, 2, 0),
(4, 4, b'1', '2014-03-30 00:00:00', 'Tady je klientů :-)', NULL, '2014-03-31 07:09:38', NULL, 2, NULL),
(5, 1, b'1', '2014-03-31 00:00:00', 'Prvni verze zabezpeceni je hotova. Jeste chybi osetrit, ze prodejci vidi pouze sve inzeraty a informace.', '2014-03-31 07:10:21', '2014-05-30 01:25:16', 2, 2, 0),
(6, 1, b'1', '2014-05-04 09:35:00', ' Zapsání novinky ... bez baneru', '2014-05-04 09:36:00', '2014-05-30 01:25:05', 5, 2, 0),
(11, 10, b'1', '2014-04-01 00:00:00', '<div><img alt="" src="/kolomet/file/newsitem/11/IMG_9855_orig.jpg" /></div><div><br /></div>', '2014-05-19 03:33:49', '2014-06-02 22:46:26', 5, 5, 1),
(14, 10, b'1', '2014-05-30 07:12:00', '<div><br /></div><div><a href="http://www.maxbike.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/14/MaxByke177pix1_orig.jpg" /></a></div><div><br /></div>', '2014-05-30 07:13:44', '2014-06-16 05:57:56', 5, 5, 1),
(15, 2, b'0', '2014-05-30 07:17:00', '<br />', '2014-05-30 07:18:04', '2014-06-02 22:34:25', 5, 5, 1),
(16, 4, b'0', '2014-06-02 21:14:00', ' <img alt="" src="/kolomet/file/newsitem/16/IMG_6438_orig.jpg" />', '2014-06-02 21:14:42', '2014-06-15 13:43:17', 5, 5, 1),
(17, 0, b'1', '2014-06-02 22:32:00', 'Tak máme novou verzi aplikace a již jsme zase o pořádný kus cesty blíže k finálnímu vzhledu !!!!<div>Děkujeme za podporu.</div><div>Váš KOLOMET TEAM</div>', '2014-06-02 22:33:26', '2014-06-02 22:33:26', 5, 5, 0),
(19, 3, b'0', '2014-06-03 17:12:00', 'Klikací <div><a href="http://www.seznam.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/19/IMG_6438_orig.jpg" /></a></div>', '2014-06-03 17:13:33', '2014-06-15 13:43:54', 5, 5, 1),
(20, 1, b'1', '2014-06-15 11:56:00', 'Aktuálně je nasazena předfinální verze, kde je již jen nutné dodělat několik maličkostí. Nyní se zaměříme na zajímavá místa. ', '2014-06-15 11:57:40', '2014-06-16 06:02:22', 5, 5, 0),
(23, 25, b'1', '2014-06-15 12:17:00', ' <div><a href="http://buk02.vas-server.cz/kolomet/public/intro/index" target="_blank"><img alt="" src="/kolomet/file/newsitem/23/LOGOREKLAMA15mm1_orig.jpg" /></a></div>\r\n', '2014-06-15 12:17:53', '2014-06-16 05:25:45', 5, 5, 1),
(24, 7, b'1', '2014-06-15 08:18:00', '<div><a href="http://www.prodejkol.cz" target="_blank"><img alt="" src="/kolomet/file/newsitem/24/MegaBike177pix1_orig.jpg" /></a></div>', '2014-06-15 13:19:56', '2014-06-15 13:29:34', 5, 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `NewsItemPhotoUrl`
--

CREATE TABLE IF NOT EXISTS `NewsItemPhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(30) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `NEWSITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ibifb4exurkr3bibkxsug1jjp` (`CREATED_ID`),
  KEY `FK_bv4cc5qbl1usgr83jgq84okb0` (`LAST_MODIFIED_ID`),
  KEY `FK_nwosek9s1opwi0nig98f7ac78` (`NEWSITEM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Vypisuji data pro tabulku `NewsItemPhotoUrl`
--

INSERT INTO `NewsItemPhotoUrl` (`id`, `created`, `lastModified`, `version`, `contentType`, `fileName`, `CREATED_ID`, `LAST_MODIFIED_ID`, `NEWSITEM_ID`) VALUES
(5, '2014-05-19 03:33:49', '2014-05-19 03:33:49', 0, 'image/jpeg', 'img_6426-180pix.jpg', 5, 5, 11),
(8, '2014-06-02 21:18:33', '2014-06-02 21:18:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 16),
(9, '2014-06-02 22:45:59', '2014-06-02 22:45:59', 0, 'image/jpeg', 'IMG_9855.JPG', 5, 5, 11),
(11, '2014-06-03 17:13:33', '2014-06-03 17:13:33', 0, 'image/jpeg', 'IMG_6438.JPG', 5, 5, 19),
(26, '2014-06-15 12:47:48', '2014-06-15 12:47:48', 0, 'image/jpeg', 'LOGOREKLAMA15mm1.jpg', 5, 5, 23),
(29, '2014-06-15 13:26:58', '2014-06-15 13:26:58', 0, 'image/jpeg', 'MegaBike177pix1.jpg', 5, 5, 24),
(30, '2014-06-15 13:32:49', '2014-06-15 13:32:49', 0, 'image/jpeg', 'MaxByke177pix1.jpg', 5, 5, 14);

-- --------------------------------------------------------

--
-- Struktura tabulky `PhotoUrl`
--

CREATE TABLE IF NOT EXISTS `PhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(30) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB7E66DFDA4593BE0` (`PRODUCT_ID`),
  KEY `FK_nldug6mhiyl923yofdma0qpdd` (`CREATED_ID`),
  KEY `FK_39jtk2r3ppldnqd4rb6rdlrro` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Vypisuji data pro tabulku `PhotoUrl`
--

INSERT INTO `PhotoUrl` (`id`, `version`, `contentType`, `fileName`, `PRODUCT_ID`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(12, 0, 'image/jpeg', 'Penguins.jpg', 1, '2014-03-30 08:59:49', '2014-03-30 08:59:49', NULL, NULL),
(13, 0, 'image/jpeg', 'Chrysanthemum.jpg', 2, '2014-03-30 09:00:31', '2014-03-30 09:00:31', NULL, NULL),
(14, 0, 'image/jpeg', 'Tulips.jpg', 5, '2014-03-30 09:01:12', '2014-03-30 09:01:12', NULL, NULL),
(15, 0, 'image/jpeg', 'Hydrangeas.jpg', 6, '2014-03-30 09:01:38', '2014-03-30 09:01:38', NULL, NULL),
(16, 0, 'image/jpeg', 'Jellyfish.jpg', 3, '2014-03-30 09:02:10', '2014-03-30 09:02:10', NULL, NULL),
(17, 0, 'image/jpeg', 'Lighthouse.jpg', 4, '2014-03-30 09:02:53', '2014-03-30 09:02:53', NULL, NULL),
(18, 0, 'image/jpeg', 'Hydrangeas.jpg', 4, '2014-03-30 09:03:05', '2014-03-30 09:03:05', NULL, NULL),
(19, 0, 'image/jpeg', 'Koala.jpg', 7, '2014-03-30 09:03:36', '2014-03-30 09:03:36', NULL, NULL),
(25, 0, 'image/jpeg', 'IMG_7925.jpg', 10, '2014-03-31 16:05:18', '2014-03-31 16:05:18', 5, 5),
(26, 0, 'image/jpeg', 'IMG_7926.jpg', 10, '2014-03-31 16:07:17', '2014-03-31 16:07:17', 5, 5),
(33, 0, 'image/jpeg', 'Lighthouse.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(34, 0, 'image/jpeg', 'Penguins.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(35, 0, 'image/jpeg', 'Koala.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(36, 0, 'image/jpeg', 'Koala.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(37, 0, 'image/jpeg', 'Lighthouse.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(38, 0, 'image/jpeg', 'Penguins.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(39, 0, 'image/jpeg', 'img_6426.jpg', 5, '2014-05-06 18:44:41', '2014-05-06 18:44:41', 5, 5),
(40, 0, 'image/jpeg', 'img_6412.jpg', 5, '2014-05-06 18:48:13', '2014-05-06 18:48:13', 5, 5),
(41, 0, 'image/jpeg', 'img_6360.jpg', 10, '2014-05-06 18:50:38', '2014-05-06 18:50:38', 5, 5),
(44, 0, 'image/jpeg', 'img_6266.jpg', 11, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 5, 5),
(45, 0, 'image/jpeg', 'img_6412.jpg', 11, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 5, 5),
(46, 0, 'image/jpeg', 'img_6426.jpg', 11, '2014-05-11 10:40:33', '2014-05-11 10:40:33', 5, 5),
(47, 0, 'image/jpeg', 'img_9195.jpg', 11, '2014-05-11 10:44:53', '2014-05-11 10:44:53', 5, 5),
(48, 0, 'image/jpeg', 'img_9195.jpg', 3, '2014-05-11 12:21:34', '2014-05-11 12:21:34', 5, 5),
(51, 0, 'image/jpeg', 'IMAG0323.jpg', 12, '2014-05-18 08:21:17', '2014-05-18 08:21:17', 5, 5),
(59, 0, 'image/jpeg', 'OVOV.jpg', 12, '2014-05-24 13:47:19', '2014-05-24 13:47:19', 5, 5),
(60, 0, 'image/pjpeg', 'DSC05087.JPG', 17, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 14, 14),
(61, 0, 'image/pjpeg', 'DSC05088.JPG', 17, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 14, 14),
(62, 0, 'image/pjpeg', 'DSC05090.JPG', 17, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 14, 14),
(63, 0, 'image/pjpeg', 'DSC05091.JPG', 17, '2014-05-24 18:04:20', '2014-05-24 18:04:20', 14, 14),
(64, 0, 'image/jpeg', 'IMG_7926.jpg', 13, '2014-05-24 18:36:57', '2014-05-24 18:36:57', 5, 5),
(66, 0, 'image/png', 'enderman.png', 18, '2014-05-24 22:08:49', '2014-05-24 22:08:49', 7, 7),
(71, 0, 'image/jpeg', 'P1020167.JPG', 19, '2014-05-25 07:40:13', '2014-05-25 07:40:13', 7, 7),
(72, 0, 'image/jpeg', 'Víno.jpg', 19, '2014-05-25 18:25:34', '2014-05-25 18:25:34', 2, 2),
(73, 0, 'image/jpeg', 'IMG_7925.jpg', 20, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 5, 5),
(74, 0, 'image/jpeg', 'IMG_7926.jpg', 20, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 5, 5),
(75, 0, 'image/jpeg', 'img_6360.jpg', 20, '2014-06-14 20:10:10', '2014-06-14 20:10:10', 5, 5),
(79, 0, 'image/jpeg', 'Víno.jpg', 21, '2014-06-14 20:24:52', '2014-06-14 20:24:52', 2, 2),
(80, 0, 'image/jpeg', 'OVOV.jpeg', 22, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 2, 2),
(81, 0, 'image/jpeg', '19XX_jkvasil_bohemie_t3.jpg', 22, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 2, 2),
(82, 0, 'image/jpeg', 'P1020167.JPG', 22, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 2, 2),
(83, 0, 'image/jpeg', 'Víno.jpg', 22, '2014-06-14 20:32:16', '2014-06-14 20:32:16', 2, 2),
(84, 0, 'image/jpeg', 'IMG_7925.jpg', 23, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 2, 2),
(85, 0, 'image/jpeg', 'IMG_7926.jpg', 23, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 2, 2),
(86, 0, 'image/jpeg', 'img_6360.jpg', 23, '2014-06-14 20:39:53', '2014-06-14 20:39:53', 2, 2),
(87, 0, 'image/jpeg', 'img_6266.jpg', 24, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 2, 2),
(88, 0, 'image/jpeg', 'img_6412.jpg', 24, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 2, 2),
(89, 0, 'image/jpeg', 'img_6426.jpg', 24, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 2, 2),
(90, 0, 'image/jpeg', 'img_9195.jpg', 24, '2014-06-14 20:42:00', '2014-06-14 20:42:00', 2, 2),
(91, 0, 'image/pjpeg', 'DSC05087.JPG', 25, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 5, 5),
(92, 0, 'image/pjpeg', 'DSC05088.JPG', 25, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 5, 5),
(93, 0, 'image/pjpeg', 'DSC05090.JPG', 25, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 5, 5),
(94, 0, 'image/pjpeg', 'DSC05091.JPG', 25, '2014-06-14 20:42:33', '2014-06-14 20:42:33', 5, 5),
(95, 0, 'image/pjpeg', 'DSC05087.JPG', 26, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 5, 5),
(96, 0, 'image/pjpeg', 'DSC05088.JPG', 26, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 5, 5),
(97, 0, 'image/pjpeg', 'DSC05090.JPG', 26, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 5, 5),
(98, 0, 'image/pjpeg', 'DSC05091.JPG', 26, '2014-06-14 20:43:54', '2014-06-14 20:43:54', 5, 5),
(99, 0, 'image/pjpeg', 'DSC05087.JPG', 27, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 5, 5),
(100, 0, 'image/pjpeg', 'DSC05088.JPG', 27, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 5, 5),
(101, 0, 'image/pjpeg', 'DSC05090.JPG', 27, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 5, 5),
(102, 0, 'image/pjpeg', 'DSC05091.JPG', 27, '2014-06-14 20:47:32', '2014-06-14 20:47:32', 5, 5),
(107, 0, 'image/jpeg', 'Víno.jpg', 30, '2014-06-15 19:27:32', '2014-06-15 19:27:32', 2, 2),
(108, 0, 'image/jpeg', 'IMG_7925.jpg', 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5),
(109, 0, 'image/jpeg', 'IMG_7926.jpg', 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5),
(110, 0, 'image/jpeg', 'img_6360.jpg', 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5),
(114, 0, 'image/jpeg', 'img_9195.jpg', 32, '2014-06-15 20:37:06', '2014-06-15 20:37:06', 5, 5),
(117, 0, 'image/jpeg', 'Lighthouse.jpg', 30, '2014-07-08 20:50:13', '2014-07-08 20:50:13', 2, 2),
(122, 0, 'image/jpeg', 'IMG_8936.jpg', 32, '2014-08-16 06:30:04', '2014-08-16 06:30:04', 5, 5),
(129, 0, 'image/jpeg', 'IMG_9047.jpg', 34, '2014-09-20 10:02:14', '2014-09-20 10:02:14', 5, 5),
(132, 0, 'image/jpeg', 'IMAG0507.jpg', 34, '2014-09-27 11:18:32', '2014-09-27 11:18:32', 5, 5),
(133, 0, 'image/jpeg', 'Penguins.jpg', 33, '2014-09-27 18:36:31', '2014-09-27 18:36:31', 2, 2),
(134, 0, 'image/jpeg', 'DSC_0144b.jpg', 34, '2014-09-28 21:37:36', '2014-09-28 21:37:36', 5, 5),
(135, 0, 'image/jpeg', 'DSC_0144b.jpg', 29, '2014-09-28 22:35:28', '2014-09-28 22:35:28', 5, 5),
(136, 0, 'image/jpeg', 'IMG_9055.jpg', 28, '2014-09-29 21:57:43', '2014-09-29 21:57:43', 5, 5),
(137, 0, 'image/jpeg', 'logo.jpg', 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2),
(138, 0, 'image/png', 'glyphicons-halflings-white.png', 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `Place`
--

CREATE TABLE IF NOT EXISTS `Place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `houseNr` int(11) DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `zipCode` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `bikeRoadNr` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `north` double DEFAULT NULL,
  `west` double DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `placeType_id` bigint(20) NOT NULL,
  `qualityRanking` double DEFAULT NULL,
  `nrOfRankings` int(11) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `descriptionLink` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i8k4yy1davrnuoq088nv1qr8l` (`CREATED_ID`),
  KEY `FK_mif9prha7bawb4vnr45y2agbt` (`LAST_MODIFIED_ID`),
  KEY `FK_5lbhysoc2pgw3icerfltam5k8` (`placeType_id`),
  KEY `FK_b6wfbtobur72mfldomt3ni1c5` (`region_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=46 ;

--
-- Vypisuji data pro tabulku `Place`
--

INSERT INTO `Place` (`id`, `created`, `lastModified`, `version`, `CREATED_ID`, `LAST_MODIFIED_ID`, `city`, `houseNr`, `street`, `zipCode`, `bikeRoadNr`, `description`, `north`, `west`, `name`, `placeType_id`, `qualityRanking`, `nrOfRankings`, `region_id`, `descriptionLink`) VALUES
(1, '2014-06-24 00:51:40', '2014-06-24 00:52:08', 2, 2, 2, 'test', 23, 'test', 'test', '34', ' tesat', 50.5, 12.5, 'test', 1, NULL, NULL, NULL, NULL),
(2, '2014-06-24 00:53:38', '2014-06-24 01:05:23', 5, 2, 5, 'Praha', 23, 'vodickova', '15000', '45', ' test', 50, 14, 'restaurace v pze', 1, NULL, NULL, NULL, NULL),
(3, '2014-07-17 09:11:35', '2014-07-17 19:34:58', 2, 2, 5, NULL, NULL, NULL, NULL, '45', 'test', 50.2190946204475, 14.359130859375, 'test', 2, 4, 2, 8, NULL),
(4, '2014-07-17 18:31:00', '2014-07-23 23:45:43', 25, 5, 2, NULL, NULL, NULL, NULL, '1', 'Popis', 49.3537557183099, 16.083984375, 'Pokus MAC', 2, 4.52000000000001, 25, 8, NULL),
(5, '2014-07-18 07:39:37', '2014-07-18 07:39:37', 0, 5, 5, NULL, NULL, NULL, NULL, '123', 'Testuji zadání místa v druhém kroku', 49.4109731996958, 18.072509765625, 'Test CHROME', 1, 0, 0, 8, NULL),
(6, '2014-07-18 16:31:03', '2014-07-18 16:31:03', 0, 6, 6, NULL, NULL, NULL, NULL, '102', '', 48.7779456, 13.8675383, 'Plešné jezero', 2, 0, 0, 8, NULL),
(7, '2014-07-18 16:32:14', '2014-07-18 16:32:14', 0, 6, 6, NULL, NULL, NULL, NULL, '102', '', 48.7779456, 13.8675383, 'Plešné jezero', 2, 0, 0, 8, NULL),
(8, '2014-07-18 16:32:14', '2014-07-18 20:14:13', 21, 6, 5, NULL, NULL, NULL, NULL, '102', '', 48.7779456, 13.8675383, 'Plešné jezero', 2, 3, 21, 8, NULL),
(9, '2014-07-23 17:05:20', '2014-07-23 17:05:20', 0, 2, 2, NULL, NULL, NULL, NULL, '45', 'ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test ahoj test', 50.527396813293, 14.117431640625, 'test', 2, 0, 0, 8, NULL),
(10, '2014-07-23 17:05:57', '2014-07-23 17:05:57', 0, 2, 2, NULL, NULL, NULL, NULL, '56', 'test', 49.6249456465014, 13.304443359375, 'test', 2, 0, 0, 8, NULL),
(11, '2014-07-23 17:07:00', '2014-07-23 17:07:22', 11, 2, 2, NULL, NULL, NULL, NULL, '56', 'test', 49.6818468994013, 18.468017578125, 'test', 2, 4, 11, 8, NULL),
(12, '2014-07-23 19:18:25', '2014-07-24 12:54:33', 88, 5, 5, NULL, NULL, NULL, NULL, '123', 'Popis hospody u smrku', 49.0810623643207, 18.10546875, 'Hospoda u smrku', 1, 4.02272727272727, 88, 8, NULL),
(13, '2014-07-23 19:48:18', '2014-07-23 19:48:18', 0, 5, 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'aaa', 2, 0, 0, 8, NULL),
(14, '2014-07-24 12:42:09', '2014-07-24 13:53:58', 31, 5, 2, NULL, NULL, NULL, NULL, '123', 'Za dubem, před dubem .....', 49.2821401597599, 13.20556640625, 'Restaurace za dubem', 1, 4.93548387096772, 31, 6, 'www.idnes.cz'),
(15, '2014-07-24 12:45:26', '2014-07-24 13:53:13', 1, 5, 2, NULL, NULL, NULL, NULL, '123', 'Test funkčnosti, v chromu to spadlo', 49.6534045884379, 12.83203125, 'Test funkčnosti (v chromu to spadlo)', 1, 5, 1, 6, 'www.idnes.cz'),
(16, '2014-07-24 12:45:58', '2014-07-24 12:45:58', 0, 5, 5, NULL, NULL, NULL, NULL, '123', 'Test funkčnosti, v chromu to spadlo', 49.6534045884379, 12.83203125, 'Test funkčnosti (v chromu to spadlo)', 1, 0, 0, 6, 'www.idnes.cz'),
(17, '2014-07-24 12:48:26', '2014-07-25 07:17:30', 21, 5, 5, NULL, NULL, NULL, NULL, '123', 'Test funkčnosti, v chromu to spadlo', 50.1909677655856, 13.33740234375, 'TEST', 1, 4, 21, 4, ''),
(18, '2014-07-24 13:19:48', '2014-08-11 08:44:50', 16, 2, NULL, NULL, NULL, NULL, NULL, '45', 'test', 50.6250730634143, 14.776611328125, 'test', 2, 4, 16, 5, 'test'),
(19, '2014-07-24 14:09:20', '2014-09-14 17:36:54', 4, 2, 5, '', NULL, '', '', '45', 'test', 49.8592347177469, 18.0587768554688, 'test', 2, 5, 3, 15, 'test'),
(20, '2014-07-25 09:36:28', '2014-09-10 22:25:27', 2, 2, 5, NULL, NULL, NULL, NULL, 'test', 'test', 50.2752986114252, 13.0654907226562, 'test', 2, 5, 2, 7, 'test'),
(21, '2014-07-25 12:53:27', '2014-07-25 12:53:27', 0, 5, 5, NULL, NULL, NULL, NULL, 'D1 a D12345', 'Zadávám místo po obědě', 49.1960640007238, 16.3916015625, 'Po Obědě', 1, 0, 0, 12, 'www.idnes.cz'),
(22, '2014-07-25 13:20:13', '2014-07-25 13:20:13', 0, 5, 5, NULL, NULL, NULL, NULL, '', '', NULL, NULL, 'BBB', 2, 0, 0, 8, ''),
(23, '2014-07-25 13:27:06', '2014-07-25 13:27:06', 0, 5, 5, NULL, NULL, NULL, NULL, '111222333', 'Popis místa v CHROME', 49.6676278226219, 15.732421875, 'Zadávám v CHROME', 1, 0, 0, 9, 'www.novinky.cz'),
(24, '2014-07-29 02:43:02', '2014-07-29 02:43:02', 0, 5, 5, NULL, NULL, NULL, NULL, '111', 'Vložení fotky na výšku', 48.9116697569841, 16.0894775390625, 'Fotka na výšku', 1, 0, 0, 12, 'www.idnes.cz'),
(25, '2014-07-29 21:00:06', '2014-07-29 21:00:06', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test test test test test', 50.3314363308388, 13.634033203125, 'test', 2, 0, 0, 4, 'test'),
(26, '2014-07-29 21:03:26', '2014-07-29 21:03:26', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test v IE 8!!', 49.7528799341502, 18.1494140625, 'IE - 8 - test', 2, 0, 0, 15, 'test'),
(27, '2014-07-29 21:03:56', '2014-07-29 21:03:56', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test v IE 8!!', 49.7528799341502, 18.1494140625, 'IE - 8 - test', 2, 0, 0, 15, 'test'),
(28, '2014-07-29 21:03:59', '2014-07-29 21:03:59', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test v IE 8!!', 49.7528799341502, 18.1494140625, 'IE - 8 - test', 2, 0, 0, 15, 'test'),
(29, '2014-07-30 20:11:09', '2014-07-30 20:11:09', 0, 5, 5, NULL, NULL, NULL, NULL, '111', 'SSSSSSS', 50.0606653859367, 15.875244140625, 'AAA', 2, 0, 0, 11, 'AAAA'),
(30, '2014-07-30 20:16:44', '2014-07-30 20:16:44', 0, 5, 5, NULL, NULL, NULL, NULL, '22222222222', 'Požadavek č. 260', 49.9653559099131, 16.8310546875, 'Test pož.č.260', 2, 0, 0, 13, ''),
(31, '2014-08-16 00:46:52', '2014-09-21 12:16:59', 1, 2, NULL, NULL, NULL, NULL, NULL, 'test', 'test', 50.0641917366591, 12.952880859375, 'test', 2, 1, 1, 7, 'test'),
(32, '2014-08-16 00:47:37', '2014-08-16 00:47:37', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test', 50.1909677655856, 13.172607421875, 'test', 2, 0, 0, 7, 'test'),
(33, '2014-08-16 01:14:08', '2014-08-16 01:14:08', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', '', 49.4538425943307, 13.590087890625, 'test', 2, 0, 0, 6, 'test'),
(34, '2014-08-16 06:07:09', '2014-09-21 21:10:36', 51, 5, NULL, NULL, NULL, NULL, NULL, '', 'Krásné sochy u lanovky na Petřín', 50.0795063141682, 14.4049644470215, 'Sochy u lanovky na Petřín', 2, 5, 51, 1, ''),
(35, '2014-08-16 06:18:28', '2014-08-16 06:18:28', 0, 5, 5, NULL, NULL, NULL, NULL, 'Nevím', 'Nádherná strahovská knihovna', 50.0857195802319, 14.3893486261368, 'Strahovský klášter', 2, 0, 0, 1, 'http://www.strahovskyklaster.cz'),
(36, '2014-08-23 15:52:04', '2014-08-23 15:52:04', 0, 2, 2, NULL, NULL, NULL, NULL, 'cyklostezka 24', '', 50.4732389144097, 14.5507049560547, 'Kokořínkso', 2, 0, 0, 3, 'http://www.kokorinsko.net/'),
(37, '2014-08-23 18:02:53', '2014-08-23 18:02:53', 0, 5, 5, NULL, NULL, NULL, NULL, '111111', 'aaaaaaaaaaa\r\nbbbbbb\r\nccccccccc\r\ndddddddddd\r\nhhhhhh\r\nkkkkkkkkkk\r\ngggggggggg\r\nbbbbbbb\r\n\r\n\r\n\r\nhhhhh\r\nhhhhhhh\r\nkkkkkkkkkk\r\nůllllllllllll\r\niiiiiii\r\nooooooo\r\njjjjjj\r\n\r\njhnhnhnhnnh\r\n\r\n\r\nnnnnn', 49.4966745274704, 15.8203125, 'aaaa', 2, 0, 0, 9, 'www.idnes.cz'),
(38, '2014-08-23 18:08:31', '2014-08-23 18:08:31', 0, 5, 5, NULL, NULL, NULL, NULL, 'bbbb', 'test uložení vícekrát', 49.6391771965104, 15.44677734375, 'test počtu zápisů', 2, 0, 0, 9, ''),
(39, '2014-08-24 08:11:30', '2014-08-24 08:11:30', 0, 5, 5, NULL, NULL, NULL, NULL, 'aaaa', 'test zadání místa', 50.0837747940637, 14.3941068649292, 'Rozhledna Petřín', 1, 0, 0, 1, 'www.novinky.cz'),
(40, '2014-08-24 21:21:44', '2014-09-27 21:36:28', 2, 5, 5, '', NULL, '', '', 'A2', 'Cyklotrasa přímo podél Vltavy s překrásným výhledem na Pražský hrad a nejen to.', 50.0725933245085, 14.4137620925903, 'Náplavka - Praha', 2, 5, 1, 1, ''),
(41, '2014-09-08 05:00:35', '2014-09-28 12:00:54', 4, 22, 5, NULL, NULL, NULL, NULL, 'test', 'test\r\nTEST 2', 50.527396813293, 13.524169921875, 'test', 2, 5, 3, 4, 'test'),
(42, '2014-09-08 22:15:45', '2014-09-25 22:30:21', 49, 5, 5, NULL, NULL, NULL, NULL, 'BBBB', 'Překrásné výhledy na Prahu', 50.089116743035, 14.3983769416809, 'Pražský hrad', 2, 5, 47, 1, ''),
(43, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 5, 5, NULL, NULL, NULL, NULL, 'dddd', 'dddd', 48.9513664709477, 16.2158203125, 'ddd', 2, 0, 0, 12, ''),
(44, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 2, 2, NULL, NULL, NULL, NULL, 'test', 'test', 50.597186230587, 14.490966796875, 'test', 2, 0, 0, 5, 'test'),
(45, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 24, 24, NULL, NULL, NULL, NULL, '111', 'test místa pod speciálním uživatelem', 49.4395569589408, 14.556884765625, 'Testíček - Tomíček', 2, 0, 0, 8, 'www.idnes.cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `PlaceComment`
--

CREATE TABLE IF NOT EXISTS `PlaceComment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `place_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1jla8a2708hau09abtsmhs5rh` (`CREATED_ID`),
  KEY `FK_72qjgb8nueasb7m9n4blselyr` (`LAST_MODIFIED_ID`),
  KEY `FK_mgrudlkoww8o405ayqwst0etr` (`place_id`),
  KEY `FK_o0fpaaf6vredtrbmmkfpsyvto` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=33 ;

--
-- Vypisuji data pro tabulku `PlaceComment`
--

INSERT INTO `PlaceComment` (`id`, `created`, `lastModified`, `version`, `text`, `CREATED_ID`, `LAST_MODIFIED_ID`, `place_id`, `parent_id`) VALUES
(1, '2014-06-25 00:32:56', '2014-06-25 00:32:56', 0, ' testtest', NULL, NULL, 2, NULL),
(2, '2014-06-25 00:36:08', '2014-06-25 00:36:08', 0, ' testtest', NULL, NULL, 2, NULL),
(3, '2014-07-13 19:13:18', '2014-07-13 19:13:18', 0, ' tesbhjkjbkjblkhbk', 2, 2, 2, NULL),
(4, '2014-07-13 19:13:21', '2014-07-13 19:13:21', 0, ' blabla', 5, 5, 2, NULL),
(5, '2014-07-18 16:09:28', '2014-07-18 16:09:28', 0, 'tady chybí fotka', 6, 6, 5, NULL),
(6, '2014-07-18 16:10:12', '2014-07-18 16:10:12', 0, 'taky jsem si všimnuůl', 6, 6, 5, NULL),
(7, '2014-07-18 16:17:17', '2014-07-18 16:17:17', 0, 'mm', 6, 6, 4, NULL),
(8, '2014-07-18 20:13:29', '2014-07-18 20:13:29', 0, ' hahaha', 5, 5, 8, NULL),
(9, '2014-07-18 20:13:38', '2014-07-18 20:13:38', 0, ' hihihi', 5, 5, 8, NULL),
(10, '2014-07-23 19:31:42', '2014-07-23 19:31:42', 0, ' Tak jsem zkusil poprvé zadat místo s novým vkládáním fotografie a docela se mně to až na pár připomínek líbí :-)', 5, 5, 12, NULL),
(11, '2014-07-23 19:31:58', '2014-07-23 19:31:58', 0, ' HAHAHA', 5, 5, 12, NULL),
(12, '2014-07-29 21:00:21', '2014-07-29 21:00:21', 0, ' Penky pejsek', 2, 2, 25, NULL),
(13, '2014-07-29 21:00:37', '2014-07-29 21:00:37', 0, ' Zas tak moc ne hele', 2, 2, 25, NULL),
(14, '2014-07-29 21:00:44', '2014-07-29 21:00:44', 0, ' Ale jo', 2, 2, 25, NULL),
(15, '2014-07-29 21:01:01', '2014-07-29 21:01:01', 0, ' Ahoj, nehadejte se', 2, 2, 25, NULL),
(16, '2014-09-08 04:58:37', '2014-09-08 04:58:37', 0, ' test', NULL, NULL, 18, NULL),
(17, '2014-09-08 04:59:15', '2014-09-08 04:59:15', 0, ' test 2', NULL, NULL, 18, NULL),
(18, '2014-09-08 04:59:30', '2014-09-08 04:59:30', 0, ' test 2 2', 22, 22, 18, NULL),
(19, '2014-09-19 19:55:26', '2014-09-19 19:55:26', 0, ' hvbvhhvhv', NULL, NULL, 42, NULL),
(20, '2014-09-19 19:55:35', '2014-09-19 19:55:35', 0, ' hjhjhkjhkjkh', NULL, NULL, 42, NULL),
(21, '2014-09-19 19:55:47', '2014-09-19 19:55:47', 0, ' hbhjbjhkkhjhkujkhjhkkkkkj', NULL, NULL, 42, NULL),
(22, '2014-09-20 09:25:41', '2014-09-20 09:25:41', 0, '1 ddd<div>2dddd</div><div>3dddd</div><div>4dddd</div><div>5dddd</div><div>6dddd</div><div>7dddd</div><div>8</div><div>9</div><div>10</div><div>11</div><div>12</div><div>13</div><div>14</div>', 5, 5, 42, NULL),
(23, '2014-09-20 17:35:10', '2014-09-20 17:35:10', 0, ' jnjnnjjnjnjn', NULL, NULL, 38, NULL),
(24, '2014-09-20 17:35:19', '2014-09-20 17:35:19', 0, ' njjnajnnjanjajnjajnajna', NULL, NULL, 38, NULL),
(25, '2014-09-20 17:35:34', '2014-09-20 17:35:34', 0, ' njnjnjnj<b> nn n nnn</b>', NULL, NULL, 38, NULL),
(26, '2014-09-21 20:12:38', '2014-09-21 20:12:38', 0, ' dddddd', NULL, NULL, 42, NULL),
(27, '2014-09-27 21:36:39', '2014-09-27 21:36:39', 0, ' blablabla', 5, 5, 40, NULL),
(28, '2014-09-28 11:56:14', '2014-09-28 11:56:14', 0, '1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20', 5, 5, 42, NULL),
(29, '2014-09-28 22:32:40', '2014-09-28 22:32:40', 0, '1\r\n2\r\n3\r\n', NULL, NULL, 42, NULL),
(30, '2014-09-28 22:33:09', '2014-09-28 22:33:09', 0, 'a\r\nb\r\nc\r\nd\r\n', NULL, NULL, 42, NULL),
(31, '2014-10-04 16:06:14', '2014-10-04 16:06:14', 0, 'A1', 5, 5, 42, NULL),
(32, '2014-10-04 21:40:00', '2014-10-04 21:40:00', 0, 'Mohu potvrdit, že \r\n\r\ntam je \r\n\r\n\r\n\r\nnádherně...', NULL, NULL, 36, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `PlacePhotoUrl`
--

CREATE TABLE IF NOT EXISTS `PlacePhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  `fileName` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `PLACE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1le19tit1c6jy1ig7h8bcsqhs` (`CREATED_ID`),
  KEY `FK_nm7gvsf8usht5aluosax15osk` (`LAST_MODIFIED_ID`),
  KEY `FK_66bx7ka21jchbk0vp8ll20ksk` (`PLACE_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=48 ;

--
-- Vypisuji data pro tabulku `PlacePhotoUrl`
--

INSERT INTO `PlacePhotoUrl` (`id`, `created`, `lastModified`, `version`, `contentType`, `fileName`, `CREATED_ID`, `LAST_MODIFIED_ID`, `PLACE_ID`) VALUES
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
(45, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/jpeg', 'IMG_9167_HDR.jpg', 24, 24, 45),
(37, '2014-09-08 22:15:46', '2014-09-08 22:15:46', 0, 'image/jpeg', 'IMG_9182_HDR.jpg', 5, 5, 42),
(38, '2014-09-08 22:15:46', '2014-09-08 22:15:46', 0, 'image/jpeg', 'IMG_9185_HDR.jpg', 5, 5, 42),
(39, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 'image/jpeg', 'IMG_9158_HDR.jpg', 5, 5, 43),
(40, '2014-09-10 00:14:47', '2014-09-10 00:14:47', 0, 'image/jpeg', 'IMG_9085_HDR.jpg', 5, 5, 43),
(41, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 'image/jpeg', 'Desert.jpg', 2, 2, 44),
(42, '2014-09-14 16:46:51', '2014-09-14 16:46:51', 0, 'image/jpeg', 'Koala.jpg', 2, 2, 44),
(43, '2014-09-14 17:25:11', '2014-09-14 17:25:11', 0, 'image/jpeg', 'IMG_9194_HDR.jpg', 5, 5, 42),
(44, '2014-09-14 17:36:54', '2014-09-14 17:36:54', 0, 'image/jpeg', 'IMG_9158_HDR.jpg', 5, 5, 19),
(46, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/gif', 'logo_a.gif', 24, 24, 45),
(47, '2014-09-28 22:45:57', '2014-09-28 22:45:57', 0, 'image/jpeg', 'horske-kolo-leader-fox-maxim-2012-2-cervena.jpg', 24, 24, 45);

-- --------------------------------------------------------

--
-- Struktura tabulky `PlaceType`
--

CREATE TABLE IF NOT EXISTS `PlaceType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `codeKey` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `placeTypeColor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1c07f3f4r885jmphk5oq15prn` (`CREATED_ID`),
  KEY `FK_ffoa460ehyobdeixf9cl210gj` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `PlaceType`
--

INSERT INTO `PlaceType` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `sequenceNr`, `CREATED_ID`, `LAST_MODIFIED_ID`, `placeTypeColor`) VALUES
(1, '2014-06-24 00:30:36', '2014-08-23 17:42:48', 2, 'Restaurace', 'ptype_restaurant', 10, 2, 2, 2),
(2, '2014-06-24 00:31:44', '2014-09-20 17:38:20', 4, 'Příroda, památky', 'ptype_interest', 100, 2, 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `Producer`
--

CREATE TABLE IF NOT EXISTS `Producer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o4c7feesxwmj9n0orfkkh1q3r` (`CREATED_ID`),
  KEY `FK_osow3ocq54s30l86wsww2aaq3` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Vypisuji data pro tabulku `Producer`
--

INSERT INTO `Producer` (`id`, `version`, `codeDescription`, `codeKey`, `name`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(18, 0, '4EVER', 'prd_4ever', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(19, 0, '4freetime', 'prd_4free', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(20, 0, 'ACRA', 'prd_acra', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(21, 0, 'Acstar', 'prd_acsta', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(22, 0, 'Agogs', 'prd_agogs', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(23, 0, 'ALPINA', 'prd_alpin', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(24, 1, 'AMULET', 'prd_amule', NULL, '2014-05-07 00:00:00', '2014-06-15 02:03:43', 2, 2, 100000),
(25, 0, 'APACHE', 'prd_apach', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(26, 0, 'Azub', 'prd_azub', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(27, 0, 'BROTHER', 'prd_broth', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(28, 0, 'Cannondale', 'prd_canno', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(29, 0, 'Cosmic', 'prd_cosmi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(30, 0, 'COYOTE', 'prd_coyot', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(31, 0, 'DAHON', 'prd_dahon', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(32, 0, 'DEMA', 'prd_dema', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(33, 0, 'DHS', 'prd_dhs', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(34, 0, 'DINO', 'prd_dino', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(35, 0, 'DISNEY', 'prd_disne', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(36, 0, 'Donnay', 'prd_donna', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(37, 0, 'DUNLOP', 'prd_dunlo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(38, 0, 'ECO', 'prd_eco', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(39, 0, 'ELEKTROKOLO', 'prd_elekt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(40, 0, 'Everlast', 'prd_everl', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(41, 0, 'FELT', 'prd_felt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(42, 0, 'Focus', 'prd_focus', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(43, 0, 'Fondriest', 'prd_fondr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(44, 0, 'Galaxy', 'prd_galax', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(45, 0, 'GIANT', 'prd_giant', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(46, 0, 'GT', 'prd_gt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(47, 0, 'HaiBike', 'prd_haibi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(48, 0, 'HEAD', 'prd_head', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(49, 0, 'Heavy Tools', 'prd_heavy', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(50, 0, 'HERCULES', 'prd_hercu', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(51, 0, 'HOT WHEELS', 'prd_hot w', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(52, 0, 'INSPORTLINE', 'prd_inspo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(53, 0, 'Kalkhoff', 'prd_kalkh', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(54, 0, 'KELLYS', 'prd_kelly', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(55, 0, 'Kenzel', 'prd_kenze', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(56, 0, 'Kona', 'prd_kona', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(57, 0, 'KROSS', 'prd_kross', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(58, 0, 'Leader Fox', 'prd_leade', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(60, 0, 'MAKITA', 'prd_makit', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(61, 0, 'Maxima', 'prd_maxim', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(62, 0, 'MERIDA', 'prd_merid', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(63, 0, 'Mondraker', 'prd_mondr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(64, 0, 'MONGOOSE', 'prd_mongo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(65, 0, 'Muddyfox', 'prd_muddy', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(66, 0, 'Nerf', 'prd_nerf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(67, 0, 'NORCO', 'prd_norco', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(68, 0, 'OLPRAN', 'prd_olpra', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(69, 0, 'PELLS', 'prd_pells', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(70, 0, 'POWERSLIDE', 'prd_power', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(71, 1, 'Puky', 'prd_puky', NULL, '2014-05-07 00:00:00', '2014-06-15 02:03:22', 2, 2, 1000),
(72, 0, 'Rappa', 'prd_rappa', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(73, 0, 'RAVO', 'prd_ravo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(74, 0, 'REFLEX', 'prd_refle', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(75, 0, 'ROCKY MOUNTAIN', 'prd_rocky', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(76, 0, 'Schwinn', 'prd_schwi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(77, 1, 'SCOTT', 'prd_scott', NULL, '2014-05-07 00:00:00', '2014-06-15 08:07:14', 2, 5, 50),
(78, 0, 'Scott Cyklo', 'prd_scott', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(79, 0, 'Shimano', 'prd_shima', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(80, 0, 'Silverfox', 'prd_silve', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(81, 0, 'SPECIALIZED', 'prd_speci', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(82, 0, 'STR', 'prd_str', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(83, 0, 'STUF', 'prd_stuf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(84, 0, 'SUPERIOR', 'prd_super', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(85, 0, 'Superman', 'prd_super', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(86, 0, 'TERN', 'prd_tern', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(87, 0, 'TOPEAK', 'prd_topea', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(88, 0, 'Torpado', 'prd_torpa', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(89, 0, 'TREK', 'prd_trek', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(90, 0, 'UMF', 'prd_umf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(91, 0, 'universal', 'prd_unive', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(92, 0, 'VAUTRON', 'prd_vautr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(93, 0, 'Vetro-plus', 'prd_vetro', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(94, 0, 'Viking', 'prd_vikin', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(95, 0, 'WINORA', 'prd_winor', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(96, 0, 'Wisper', 'prd_wispe', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(97, 0, 'WORKER', 'prd_worke', NULL, '2014-05-07 00:00:00', NULL, 2, NULL, NULL),
(98, 2, 'Madison', 'prd_madis', NULL, '2014-06-14 21:52:54', '2014-06-15 01:22:26', 5, 2, 1000),
(99, 0, 'HEAD', 'prd_head', NULL, '2014-06-14 21:54:36', '2014-06-14 21:54:36', 5, 5, 20);

-- --------------------------------------------------------

--
-- Struktura tabulky `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `discount` decimal(19,2) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `producer_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `description` longtext,
  `created` datetime DEFAULT NULL,
  `validTo` datetime DEFAULT NULL,
  `canSendToAllCountry` bit(1) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `deliveryForFree` bit(1) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `bicycleSize_id` bigint(20) DEFAULT NULL,
  `figureHeight_id` bigint(20) DEFAULT NULL,
  `productUsage_id` bigint(20) DEFAULT NULL,
  `buyUrl` varchar(255) DEFAULT NULL,
  `bicycleCategory_id` bigint(20) DEFAULT NULL,
  `productColor_id` bigint(20) DEFAULT NULL,
  `finalPrice` decimal(19,2) DEFAULT NULL,
  `copiedFrom` bigint(20) DEFAULT NULL,
  `validFrom` datetime DEFAULT NULL,
  `productState` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50C664CFF66C8014` (`seller_id`),
  KEY `FK50C664CF6461F0C3` (`category_id`),
  KEY `FK50C664CF7033F843` (`producer_id`),
  KEY `FK_l85o5it5jd637mph0u6fg3hef` (`CREATED_ID`),
  KEY `FK_67q0uqmcax1tj14dlvb592tkc` (`LAST_MODIFIED_ID`),
  KEY `FK_n3v5evhdukpikrt4s5o5jlv9h` (`bicycleSize_id`),
  KEY `FK_e2h6iqj8nkleqlid35qrkv4hx` (`figureHeight_id`),
  KEY `FK_6ly8uo2nwqgemejqng3yoaqnt` (`productUsage_id`),
  KEY `producer_id` (`producer_id`),
  KEY `FK_ocfck118ejxmxm4xhdev5q87k` (`PRODUCT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Vypisuji data pro tabulku `Product`
--

INSERT INTO `Product` (`id`, `version`, `discount`, `price`, `productName`, `category_id`, `producer_id`, `seller_id`, `description`, `created`, `validTo`, `canSendToAllCountry`, `enabled`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `deliveryForFree`, `weight`, `bicycleSize_id`, `figureHeight_id`, `productUsage_id`, `buyUrl`, `bicycleCategory_id`, `productColor_id`, `finalPrice`, `copiedFrom`, `validFrom`, `productState`, `PRODUCT_ID`) VALUES
(1, 10, '-24001.00', '25999.00', 'Agang CULT 2.0 2012', 2, 30, 1, 'Model Cult prezentuje z pohledu značky AGang nejuniverzálnější kolo do horského terénu. Na konstrukci, funkci i designu modelu pracoval tvůrčí tým několik let. Získané zkušenosti umožnily vyladit jeho originální čtyř-čepový systém tak, aby poskytoval maximální komfort odpružení, ovladatelnost v náročnějších terénních pasážích či sjezdech, ale také minimální ztráty při šlapání. Schopnosti modelu Cult vycházejí především z použitých technologií, konstrukčních prvků a geometrie jeho celoodpruženého rámu. Ten disponuje zdvihem 150 mm a naším originálním čtyř-čepovým systémem odpružení zvaný Drive Link Pivot, jenž byl kompletně navržen našimi inženýry v Čechách. Tento systém byl optimalizován tak, aby nabídl jezdci aktivní zadní stavbu a zárověň maximálně omezil její pohupování při šlapání, a to hlavně při jízdě vsedě. Citlivost stavby pak ještě zvyšuje použití tlumiče o délce 200 mm se zdvihem 57 mm.', NULL, '2014-06-19 00:00:00', b'1', b'1', '2014-06-14 21:38:25', NULL, 5, b'0', 21, 1, 1, 1, 'http://www.carosello.cz', 1, 1, '50000.00', NULL, '2014-06-14 00:00:00', 1, NULL),
(2, 5, '0.00', '4590.00', 'A-Gang Capo 16" červená 2012', 8, 30, 1, 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.', NULL, '2014-06-19 00:00:00', b'1', b'1', '2014-06-15 20:47:59', NULL, 5, b'0', 20, 1, 1, 1, 'www.novinky.cz', 1, 1, '4590.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(3, 5, '10000.00', '30000.00', 'AUTHOR A 33 2013', 11, 30, 2, 'Chcete-li rychlost a efektivitu, pak je silniční kolo pro Vás. Díky aerodynamické konstrukci...', NULL, '2014-06-28 00:00:00', b'1', b'1', '2014-06-15 20:48:36', NULL, 5, b'0', 20, 1, 1, 1, 'www.idnes.cz', 1, 1, '20000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(4, 4, '7000.00', '53900.00', 'Merida Big Ninety-Nine CF Team', 11, 30, 2, 'Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:38', NULL, 2, b'1', 20, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, '5000.00', '50000.00', 'Kolo4', 2, 30, 1, 'Kolo4', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:52', NULL, 2, b'0', 15, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, '1000.00', '23000.00', 'Kolo 5', 2, 30, 1, 'Kolo 5', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:09:04', NULL, 2, b'0', 10, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, '2300.00', '42000.00', 'Kolo 6', 15, 30, 2, 'Kolo 6', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-12 12:06:45', NULL, 2, b'1', 6, 7, 7, 1, '', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 12, '0.00', '1111.00', 'Tryskové kolo', 8, 30, 1, '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', '2014-03-31 13:07:06', '2014-12-31 00:00:00', b'1', b'1', '2014-06-15 20:45:36', 5, 5, b'0', 30, 1, 1, 1, 'http://www.novinky.cz', 1, 1, '1111.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(11, 8, '0.00', '100000.00', 'Nové kolo', 2, 77, 1, ' Nové kolo je 30 let staré ale zcela nefunkční...', '2014-05-11 10:40:33', '2014-06-30 00:00:00', b'1', b'1', '2014-06-15 20:45:06', 5, 5, b'1', 3, NULL, 11, 1, 'http://union002.hys.cz', 1, 1, '100000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(12, 8, '50000.00', '500000.00', 'Kolo pro Michalku', 8, 23, 1, ' Kolo, které jezdí samo.<div>aaaaa</div><div>bbbbb</div><div>cccccc</div><div>dddddd</div><div>eeeeee</div><div>ffffffff</div><div>ggggggg</div><div>hhhhhhhh</div><div>iiiiiiiiiiiiiii</div><div>jjjjjjjjjj</div><div>kkkkkkk</div><div>lllllllllllll</div><div>mmmmmmmmm</div><div>nnnnnnnnnnnn</div><div>oooooooooo</div><div>pppppppppp</div><div>qqqqqqqqqqq</div><div>rrrrrrrrrrrrrrrr</div><div>sssssssss</div><div>ttttttttttttttt</div><div>uuuuuuuuu</div>', '2014-05-18 08:21:17', '9999-12-31 00:00:00', b'1', b'1', '2014-08-16 00:57:19', 5, 2, b'1', 11, NULL, 6, 3, 'http://union002.hys.cz', 4, 17, '450000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(13, 13, '99000.00', '100000.00', 'První kolo od prodejce Toma', 2, 37, 4, ' Zakládám tento inzerát, abych se ujistil, že prodejce může vkládat nové inzeráty. Když žádný inzerát nemá, tak nejsou u seznamu inzerátu žádné ovládací prvky na nový.<div><br /></div><div>Test odchodu ze stránky bez uložení</div>', '2014-05-21 01:26:07', '9999-12-31 00:00:00', b'1', b'1', '2014-06-15 20:43:56', 5, 5, b'1', 12, NULL, 12, 1, 'http://www.idnes.cz/#utm_source=idnes&utm_medium=text&utm_content=top-navigace', 1, 15, '1000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(17, 1, '0.00', '19000.00', 'Gary Fischer', 2, 89, 7, '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', '2014-05-24 18:04:20', '9999-12-31 00:00:00', b'1', b'1', '2014-06-15 20:43:29', 14, 5, b'0', 15, NULL, 9, 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', 1, 5, '19000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(18, 3, '0.00', '125000.00', 'kolo frantík', 2, 35, 4, ' Je to horské kolo, které je vysoce kvalitní.', '2014-05-24 22:08:49', '9999-12-12 00:00:00', b'0', b'1', '2014-06-15 20:42:57', 7, 5, b'0', 4, NULL, 8, 1, 'http://www.novinky.cz', 1, 1, '125000.00', NULL, '2014-06-15 00:00:00', 1, NULL),
(19, 15, '150000.00', '160000.00', 'Frantíkova 1. tříkolka III. verze', 21, 34, 4, 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', '2014-05-24 22:17:16', '2014-06-14 21:35:55', b'1', b'0', '2014-06-14 21:35:55', 7, 5, b'0', 1, NULL, 1, 2, 'http://www.novinky.cz', 3, 19, '10000.00', NULL, '2014-06-01 00:00:00', 2, NULL),
(20, 1, '1.00', '2001.00', 'Tryskové kolo', 8, 30, 1, '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', '2014-06-14 20:10:10', '2014-12-31 00:00:00', b'1', b'1', '2014-06-15 20:42:22', 5, 5, b'0', 30, NULL, 1, 1, 'http://www.novinky.cz', 1, 1, '2000.00', NULL, '2014-06-15 00:00:00', 1, 10),
(21, 3, '150000.00', '160000.00', 'Frantíkova 1. tříkolka II. verze', 21, 34, 4, 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', '2014-06-14 20:24:52', '2014-06-15 20:41:37', b'1', b'0', '2014-06-15 20:41:37', 2, 5, b'0', 1, NULL, 1, 2, 'http://www.novinky.cz', 3, 19, '10000.00', NULL, '2014-06-01 00:00:00', 2, 19),
(22, 3, '60000.00', '160000.00', 'Frantíkova 1. tříkolka', 21, 34, 4, 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', '2014-06-14 20:32:16', '9999-12-12 00:00:00', b'1', b'1', '2014-06-14 21:22:24', 2, 5, b'0', 1, NULL, 1, 2, 'http://www.novinky.cz', 3, 19, '100000.00', NULL, '2014-06-14 00:00:00', 1, 19),
(23, 2, '111.00', '1111.00', 'Tryskové kolo', 8, 30, 1, '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', '2014-06-14 20:39:53', '2014-12-31 00:00:00', b'1', b'1', '2014-06-14 20:45:25', 2, 2, b'0', 30, NULL, 1, 1, 'http://www.novinky.cz', 1, 1, '1000.00', NULL, '2014-06-14 00:00:00', 1, 20),
(24, 1, '90000.00', '100000.00', 'Nové kolo', 2, 77, 1, ' Nové kolo je 30 let staré ale zcela nefunkční...', '2014-06-14 20:42:00', '2014-06-29 00:00:00', b'1', b'1', '2014-06-14 20:42:30', 2, 2, b'1', 3, NULL, 11, 1, 'http://union002.hys.cz', 1, 1, '10000.00', NULL, '2014-06-15 00:00:00', 1, 11),
(25, 2, '1000.00', '20000.00', 'Gary Fischer III.verze', 2, 89, 7, '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', '2014-06-14 20:42:33', '9999-12-31 00:00:00', b'1', b'1', '2014-06-14 21:34:12', 5, 5, b'0', 15, NULL, 9, 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', 1, 5, '19000.00', NULL, '2014-06-14 00:00:00', 1, 17),
(26, 1, '0.00', '19000.00', 'Gary Fischer II.verze', 2, 89, 7, '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', '2014-06-14 20:43:54', '9999-12-31 00:00:00', b'1', b'1', '2014-06-14 21:30:16', 5, 5, b'0', 15, NULL, 9, 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', 1, 5, '19000.00', NULL, '2014-06-21 00:00:00', 1, 17),
(27, 3, '1000.00', '20000.00', 'Gary Fischer - ORIG', 2, 89, 7, '<p>horské kolo<br />hliníkový rám<br />29&quot;<br />sedlo Bontrager<br />pneumatiky Bontrager</p>', '2014-06-14 20:47:32', '9999-12-31 00:00:00', b'1', b'1', '2014-08-16 01:02:05', 5, 2, b'0', 15, NULL, 9, 1, 'http://www.trek-bikes.cz/fuel-ex-9-8-29/p-395', 1, 5, '19000.00', NULL, '2014-06-14 00:00:00', 1, 17),
(28, 4, '3590.00', '4590.00', 'A-Gang Capo 16" červená 2012', 8, 30, 1, 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.', '2014-06-15 17:36:24', '9999-12-31 00:00:00', b'1', b'1', '2014-09-29 21:59:33', 2, 5, b'0', 20, NULL, 1, 1, 'https://docs.google.com/spreadsheet/ccc?key=0AhT8_xYbtdUOdEgzZzRJak9yTEMyWWRvRUVWY1EwVFE&usp=drive_web#gid=0', 1, 1, '1000.00', NULL, '2014-06-15 00:00:00', 1, 2),
(29, 4, '150000.00', '160000.00', 'Frantíkova 1. tříkolka III. verze', 21, 34, 4, 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', '2014-06-15 17:54:46', '2014-06-16 00:00:00', b'1', b'1', '2014-09-28 22:35:28', 2, 5, b'0', 1, NULL, 1, 2, 'http://www.novinky.cz', 3, 19, '10000.00', NULL, '2014-06-15 00:00:00', 1, 19),
(30, 3, '150000.00', '160000.00', 'Frantíkova 1. tříkolka III. verze', 21, 34, 4, 'Frantík s ní byl velice spokojený!!!!!  :-P<div><br /></div><div>Snažím se udělat update ....</div>', '2014-06-15 19:27:32', '9999-12-31 00:00:00', b'1', b'1', '2014-08-16 00:57:59', 2, 2, b'0', 1, NULL, 1, 2, 'http://www.novinky.cz', 3, 19, '10000.00', NULL, '2014-06-15 00:00:00', 1, 19),
(31, 1, '97999.00', '99999.00', 'Tryskové kolo', 8, 30, 1, '<div>Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.</div><div><br /></div><div>Poznámka .... test</div><div><br /></div><div>...... test  teček</div>', '2014-06-15 20:35:58', '2014-12-31 00:00:00', b'1', b'1', '2014-06-15 20:35:58', 5, 5, b'0', 30, NULL, 1, 1, 'http://www.novinky.cz', 1, 1, '2000.00', NULL, '2014-06-15 00:00:00', 1, 20),
(32, 5, '50000.00', '100000.00', 'Nové kolo II.verze', 2, 77, 1, ' Nové kolo je 30 let staré ale zcela nefunkční...', '2014-06-15 20:37:06', '9999-12-31 00:00:00', b'1', b'1', '2014-08-16 06:36:17', 5, 5, b'1', 3, NULL, 11, 1, 'http://union002.hys.cz', 1, 1, '50000.00', NULL, '2014-06-15 00:00:00', 1, 11),
(33, 17, '0.00', '125000.00', 'kolo frantík II.verzeAAAA AAAAAAAAAAAAAAAAAAA12345', 2, 35, 4, ' Je to horské kolo, které je vysoce kvalitní.', '2014-06-16 06:10:59', '9999-12-12 00:00:00', b'0', b'1', '2014-09-27 18:36:31', 5, 2, b'0', 4, NULL, 8, 1, 'http://www.novinky.cz', 1, 1, '125000.00', NULL, '2014-06-16 00:00:00', 1, 18),
(34, 10, '99000.00', '100000.00', 'První kolo od prodejce Toma II.verze   abcdefg', 2, 37, 4, ' Zakládám tento inzerát, abych se ujistil, že prodejce může vkládat nové inzeráty. Když žádný inzerát nemá, tak nejsou u seznamu inzerátu žádné ovládací prvky na nový.<div><br /></div><div>Test odchodu ze stránky bez uložení</div>', '2014-06-28 07:44:37', '9999-12-31 00:00:00', b'1', b'1', '2014-09-28 21:37:36', 7, 5, b'1', 12, NULL, 12, 1, 'http://www.idnes.cz/#utm_source=idnes&utm_medium=text&utm_content=top-navigace', 1, 15, '1000.00', NULL, '2014-06-28 00:00:00', 1, 13),
(35, 0, '3090.00', '12990.00', 'Ukrajina', 18, 88, 3, 'Kolo stavěné pro nejhrubší zacházení. Ideální do půjčoven a pro jízdy do míst s rizikem krádeže. Tohle kolo je tak odporné, že i ti největší nenechavci nad ním ohrnou nos. <b>Buďte COOL a pořiďte si nezničitelné kolo, vyrobené na území bývalého SSSR</b>', '2014-10-02 21:06:03', '9999-12-31 00:00:00', b'1', b'1', '2014-10-02 21:06:03', 6, 6, b'0', 19, NULL, 10, 2, 'vit.ratislav@seznam.cz', 1, 5, '9900.00', NULL, '2014-10-02 00:00:00', 1, NULL),
(36, 0, '3000.00', '15000.00', 'zkouška jaká cena se objeví u prodejce', 2, 24, 2, 'zkouška', '2014-10-03 19:54:40', '9999-12-31 00:00:00', b'1', b'1', '2014-10-03 19:54:40', 6, 6, b'0', 10, NULL, 9, 2, 'vit.ratislav@seznam.cz', 4, 14, '12000.00', NULL, '2014-10-03 00:00:00', 1, NULL),
(37, 0, '18000.00', '20000.00', 'test', 2, 24, 1, ' test', '2014-10-04 16:45:14', '9999-12-31 00:00:00', b'1', b'1', '2014-10-04 16:45:14', 2, 2, b'1', 20, NULL, 4, 2, 'https://docs.jboss.org/hibernate/orm/3.3/reference/en/html/components.html', 2, 3, '2000.00', NULL, '2014-10-04 00:00:00', 1, NULL),
(38, 0, '500.00', '3500.00', 'Blesk', 8, 27, 2, 'jezdí tak jak se jmenuje', '2014-10-04 18:14:49', '9999-12-31 00:00:00', b'1', b'1', '2014-10-04 18:14:49', 6, 6, b'1', 8, NULL, 1, 2, 'http://eshop.kola-radotin.cz/detske-odrazedlo-specialized-hotwalk-int-pink/', 2, 1, '3000.00', NULL, '2014-10-04 00:00:00', 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `ProductAttribute`
--

CREATE TABLE IF NOT EXISTS `ProductAttribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `attributeValue` varchar(100) NOT NULL,
  `attributeType_id` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `test` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDDC65E8DB9148FB4` (`attributeType_id`),
  KEY `FKDDC65E8DA4593BE0` (`PRODUCT_ID`),
  KEY `FK_qepvu2lldhla75kgeswjrptop` (`CREATED_ID`),
  KEY `FK_5pfveqxc9487eoxj1g1im0ev0` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- Vypisuji data pro tabulku `ProductAttribute`
--

INSERT INTO `ProductAttribute` (`id`, `version`, `attributeValue`, `attributeType_id`, `PRODUCT_ID`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `test`) VALUES
(2, 0, '2 roky', 2, 1, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'tyrkysová', 4, 1, NULL, NULL, NULL, NULL, NULL),
(7, 0, 'červená', 4, 2, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'černá', 4, 5, NULL, NULL, NULL, NULL, NULL),
(13, 8, '2 roky', 2, 11, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 5, 5, NULL),
(14, 8, 'červená', 4, 11, '2014-05-11 10:40:33', '2014-06-15 20:45:06', 5, 5, NULL),
(15, 2, '2 roky', 2, 3, '2014-05-11 12:16:47', '2014-06-15 20:48:36', 5, 5, NULL),
(16, 2, '3 roky', 2, 3, '2014-05-11 12:17:33', '2014-06-15 20:48:36', 5, 5, NULL),
(17, 2, 'červená', 4, 3, '2014-05-11 12:21:58', '2014-06-15 20:48:36', 5, 5, NULL),
(18, 2, '4 roky', 2, 3, '2014-05-11 12:25:21', '2014-06-15 20:48:36', 5, 5, NULL),
(21, 8, '2 roky', 2, 12, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 5, 2, NULL),
(22, 8, '', 4, 12, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 5, 2, NULL),
(23, 8, '14"', 7, 12, '2014-05-18 08:21:17', '2014-08-16 00:57:19', 5, 2, NULL),
(24, 1, '27"', 7, 11, '2014-05-18 22:29:32', '2014-06-15 20:45:06', 5, 5, NULL),
(25, 13, '1,5 roku', 2, 13, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 5, 5, NULL),
(26, 13, 'Perleťová a hnědá a fialová', 4, 13, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 5, 5, NULL),
(27, 13, '', 7, 13, '2014-05-21 01:26:07', '2014-06-15 20:43:56', 5, 5, NULL),
(28, 10, '', 8, 13, '2014-05-21 02:09:23', '2014-06-15 20:43:56', 5, 5, NULL),
(41, 6, '', 8, 12, '2014-05-24 13:47:18', '2014-08-16 00:57:19', 5, 2, NULL),
(42, 1, '24 měsíců', 2, 17, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 14, 5, NULL),
(43, 1, 'bílá', 4, 17, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 14, 5, NULL),
(44, 1, '19"', 7, 17, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 14, 5, NULL),
(45, 1, '', 8, 17, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 14, 5, NULL),
(46, 3, '', 2, 18, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 7, 5, NULL),
(47, 3, 'červená', 4, 18, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 7, 5, NULL),
(48, 3, '1,3', 7, 18, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 7, 5, NULL),
(49, 3, '', 8, 18, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 7, 5, NULL),
(50, 14, '1', 2, 19, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 7, 5, NULL),
(51, 14, 'tyrkysova', 4, 19, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 7, 5, NULL),
(52, 14, '1', 7, 19, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 7, 5, NULL),
(53, 14, 'test', 8, 19, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 7, 5, NULL),
(54, 2, '1', 2, 21, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 5, NULL),
(55, 2, 'tyrkysova', 4, 21, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 5, NULL),
(56, 2, '1', 7, 21, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 5, NULL),
(57, 2, 'test', 8, 21, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 5, NULL),
(58, 3, '1', 2, 22, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 2, 5, NULL),
(59, 3, 'tyrkysova', 4, 22, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 2, 5, NULL),
(60, 3, '1', 7, 22, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 2, 5, NULL),
(61, 3, 'test', 8, 22, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 2, 5, NULL),
(62, 1, '', 4, 23, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 2, 2, NULL),
(63, 1, '', 2, 23, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 2, 2, NULL),
(64, 1, '', 7, 23, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 2, 2, NULL),
(65, 1, '', 8, 23, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 2, 2, NULL),
(66, 1, '2 roky', 2, 24, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 2, 2, NULL),
(67, 1, 'červená', 4, 24, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 2, 2, NULL),
(68, 1, '27"', 7, 24, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 2, 2, NULL),
(69, 0, '', 8, 24, '2014-06-14 20:42:30', '2014-06-14 20:42:30', 2, 2, NULL),
(70, 2, '24 měsíců', 2, 25, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 5, 5, NULL),
(71, 2, 'bílá', 4, 25, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 5, 5, NULL),
(72, 2, '19"', 7, 25, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 5, 5, NULL),
(73, 2, '', 8, 25, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 5, 5, NULL),
(74, 1, '24 měsíců', 2, 26, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 5, 5, NULL),
(75, 1, 'bílá', 4, 26, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 5, 5, NULL),
(76, 1, '19"', 7, 26, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 5, 5, NULL),
(77, 1, '', 8, 26, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 5, 5, NULL),
(78, 3, '24 měsíců', 2, 27, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 5, 2, NULL),
(79, 3, 'bílá', 4, 27, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 5, 2, NULL),
(80, 3, '19"', 7, 27, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 5, 2, NULL),
(81, 3, '', 8, 27, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 5, 2, NULL),
(82, 1, '', 7, 1, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 5, 5, NULL),
(83, 1, '', 8, 1, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 5, 5, NULL),
(84, 3, 'červená', 4, 28, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 2, 5, NULL),
(85, 3, '', 2, 28, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 2, 5, NULL),
(86, 3, '', 7, 28, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 2, 5, NULL),
(87, 3, '', 8, 28, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 2, 5, NULL),
(88, 2, '1', 2, 29, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 5, NULL),
(89, 2, 'tyrkysova', 4, 29, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 5, NULL),
(90, 2, '1', 7, 29, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 5, NULL),
(91, 2, 'test', 8, 29, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 5, NULL),
(92, 2, '1', 2, 30, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 2, NULL),
(93, 2, 'tyrkysova', 4, 30, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 2, NULL),
(94, 2, '1', 7, 30, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 2, NULL),
(95, 2, 'test', 8, 30, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 2, NULL),
(96, 0, '', 4, 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5, NULL),
(97, 0, '', 2, 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5, NULL),
(98, 0, '', 7, 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5, NULL),
(99, 0, '', 8, 31, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 5, 5, NULL),
(100, 4, '2 roky', 2, 32, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 5, 5, NULL),
(101, 4, 'červená', 4, 32, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 5, 5, NULL),
(102, 4, '27"', 7, 32, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 5, 5, NULL),
(103, 4, '', 8, 32, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 5, 5, NULL),
(104, 0, '', 4, 20, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 5, 5, NULL),
(105, 0, '', 2, 20, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 5, 5, NULL),
(106, 0, '', 7, 20, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 5, 5, NULL),
(107, 0, '', 8, 20, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 5, 5, NULL),
(108, 0, '', 8, 11, '2014-06-15 20:45:06', '2014-06-15 20:45:06', 5, 5, NULL),
(109, 0, '', 4, 10, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 5, 5, NULL),
(110, 0, '', 2, 10, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 5, 5, NULL),
(111, 0, '', 7, 10, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 5, 5, NULL),
(112, 0, '', 8, 10, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 5, 5, NULL),
(117, 0, '', 2, 2, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 5, 5, NULL),
(118, 0, '', 7, 2, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 5, 5, NULL),
(119, 0, '', 8, 2, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 5, 5, NULL),
(120, 0, '', 7, 3, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 5, 5, NULL),
(121, 0, '', 8, 3, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 5, 5, NULL),
(122, 16, '', 2, 33, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 5, 2, NULL),
(123, 16, '', 4, 33, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 5, 2, NULL),
(124, 16, '1,3', 7, 33, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 5, 2, NULL),
(125, 16, '', 8, 33, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 5, 2, NULL),
(126, 9, '1,5 roku', 2, 34, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 7, 5, NULL),
(127, 9, 'Perleťová a hnědá a fialová', 4, 34, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 7, 5, NULL),
(128, 9, '', 7, 34, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 7, 5, NULL),
(129, 9, '', 8, 34, '2014-06-28 07:44:37', '2014-09-28 21:37:36', 7, 5, NULL),
(130, 0, 'chromová', 4, 35, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 6, 6, NULL),
(131, 0, 'co je to testovací atribut?', 8, 35, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 6, 6, NULL),
(132, 0, '19"', 7, 35, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 6, 6, NULL),
(133, 0, 'bez záruky', 2, 35, '2014-10-02 21:06:03', '2014-10-02 21:06:03', 6, 6, NULL),
(134, 0, '', 4, 36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 6, 6, NULL),
(135, 0, '', 9, 36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 6, 6, NULL),
(136, 0, '', 8, 36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 6, 6, NULL),
(137, 0, '', 7, 36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 6, 6, NULL),
(138, 0, '', 2, 36, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 6, 6, NULL),
(139, 0, '', 4, 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2, NULL),
(140, 0, '', 9, 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2, NULL),
(141, 0, '', 8, 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2, NULL),
(142, 0, '', 7, 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2, NULL),
(143, 0, '', 2, 37, '2014-10-04 16:45:14', '2014-10-04 16:45:14', 2, 2, NULL),
(144, 0, 'růžová', 4, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL),
(145, 0, '', 9, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL),
(146, 0, '', 8, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL),
(147, 0, '', 7, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL),
(148, 0, '', 2, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL),
(149, 0, 'bbb', 11, 38, '2014-10-04 18:14:49', '2014-10-04 18:14:49', 6, 6, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `ProductAttributeType`
--

CREATE TABLE IF NOT EXISTS `ProductAttributeType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `categoryType_id` bigint(20) DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_78yn9egp7c0kl5ksq7yi3djht` (`CREATED_ID`),
  KEY `FK_g23gbhbyp1j052ckwwnhytowu` (`LAST_MODIFIED_ID`),
  KEY `FK_35jckbtrt6mopwn668vknwcq4` (`categoryType_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Vypisuji data pro tabulku `ProductAttributeType`
--

INSERT INTO `ProductAttributeType` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `categoryType_id`, `required`, `units`, `sequenceNr`) VALUES
(2, 1, 'Záruka', 'pat.bike.guarantee', NULL, '2014-06-12 01:22:54', NULL, 2, 1, b'0', '', 100),
(4, 3, 'Doplňující barva', 'pat.bike.color', NULL, '2014-06-14 19:52:52', NULL, 2, 1, b'0', '', 10000),
(7, 4, 'Velikost kola', 'pat.bike.bikesize', '2014-05-16 23:52:46', '2014-06-12 01:23:11', 2, 2, 1, b'0', '', 100),
(8, 1, 'Testovací atribut', 'pat.bike.test', '2014-05-21 02:07:59', '2014-06-12 01:22:44', 5, 2, 1, b'0', 'mm', 100),
(9, 0, 'Možnost koupit na úvěr', 'pat.bike.loan', '2014-10-03 07:38:01', '2014-10-03 07:38:01', 5, 5, 1, b'0', '', 100),
(11, 0, 'Test 2', 'pat.bike.test2', '2014-10-04 16:48:37', '2014-10-04 16:48:37', 2, 2, 1, b'1', 'cmm', 13);

-- --------------------------------------------------------

--
-- Struktura tabulky `ProductColor`
--

CREATE TABLE IF NOT EXISTS `ProductColor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `codeKey` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sfp8eheifl71epr1jguhkmesj` (`CREATED_ID`),
  KEY `FK_rgkh0px5lvhdtaj0awikiifjh` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=20 ;

--
-- Vypisuji data pro tabulku `ProductColor`
--

INSERT INTO `ProductColor` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, '2014-05-18 00:57:17', '2014-05-18 00:57:17', 0, 'Bílá', 'col_white', 2, 2, NULL),
(2, '2014-05-18 00:57:34', '2014-05-18 00:57:34', 0, 'Žlutá', 'col_yellow', 2, 2, NULL),
(3, '2014-05-18 00:57:57', '2014-05-18 00:57:57', 0, 'Purpurová', 'col_purple', 2, 2, NULL),
(4, '2014-05-18 00:58:19', '2014-05-18 00:58:19', 0, 'Azurová', 'col_azure', 2, 2, NULL),
(5, '2014-05-18 00:58:53', '2014-05-18 00:58:53', 0, 'Červená', 'col_red', 2, 2, NULL),
(6, '2014-05-18 00:59:12', '2014-05-18 00:59:12', 0, 'Světle zelená', 'col_lgreen', 2, 2, NULL),
(7, '2014-05-18 00:59:22', '2014-05-18 00:59:22', 0, 'Modrá', 'col_blue', 2, 2, NULL),
(8, '2014-05-18 00:59:41', '2014-05-18 00:59:41', 0, 'Černá', 'col_black', 2, 2, NULL),
(9, '2014-05-18 00:59:54', '2014-05-18 00:59:54', 0, 'Zelená', 'col_green', 2, 2, NULL),
(10, '2014-05-18 01:00:07', '2014-05-18 01:00:07', 0, 'Hnědá', 'col_brown', 2, 2, NULL),
(11, '2014-05-18 01:00:23', '2014-05-18 01:00:23', 0, 'Olivová', 'col_olive', 2, 2, NULL),
(12, '2014-05-18 01:00:44', '2014-05-18 01:00:44', 0, 'Fialová', 'col_violet', 2, 2, NULL),
(13, '2014-05-18 01:01:00', '2014-05-18 01:01:00', 0, 'Šedá', 'col_gray', 2, 2, NULL),
(14, '2014-05-18 01:01:24', '2014-05-18 01:01:24', 0, 'Tmavě šedá', 'col_dblue', 2, 2, NULL),
(15, '2014-05-18 01:01:48', '2014-05-18 01:01:48', 0, 'Modro-zelená', 'col_bluegreen', 2, 2, NULL),
(16, '2014-05-18 01:02:05', '2014-05-18 01:02:05', 0, 'Světle šedá', 'col_lgray', 2, 2, NULL),
(17, '2014-05-18 01:02:18', '2014-05-18 01:02:18', 0, 'Oranžová', 'col_orange', 2, 2, NULL),
(18, '2014-05-18 01:02:35', '2014-05-18 01:02:35', 0, 'Stříbrná', 'col_silver', 2, 2, NULL),
(19, '2014-05-18 22:01:13', '2014-05-18 22:01:13', 0, 'Růžová', 'col_pink', 5, 5, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `ProductComment`
--

CREATE TABLE IF NOT EXISTS `ProductComment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `commented` tinyblob NOT NULL,
  `date` datetime NOT NULL,
  `text` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g26ro0e84yav9s883oy7b3os8` (`CREATED_ID`),
  KEY `FK_he9tev1dkpeydlk6g174gtg6m` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `ProductComment`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `ProductUsage`
--

CREATE TABLE IF NOT EXISTS `ProductUsage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pxpmn20h3fop5d6j83185vvj2` (`CREATED_ID`),
  KEY `FK_t781f1fgejuby0axs58hjo7yb` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `ProductUsage`
--

INSERT INTO `ProductUsage` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, '2014-04-14 20:59:57', '2014-04-14 20:59:57', 0, 'Terénní', 'usage_terrain', 5, 5, NULL),
(2, '2014-05-03 17:37:27', '2014-05-03 17:37:27', 0, 'Asfalt', 'usage_asphalt', 5, 5, NULL),
(3, '2014-05-03 17:38:54', '2014-05-03 17:38:54', 0, 'Lehký terén', 'usage_easyterrain', 5, 5, NULL),
(4, '2014-05-03 17:39:55', '2014-05-03 17:39:55', 0, 'Sjezdová kola', 'usage_downhill', 5, 5, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `Rate`
--

CREATE TABLE IF NOT EXISTS `Rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `entityId` bigint(20) DEFAULT NULL,
  `ipAddress` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `rateType` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k607wd13qt3omylcbo5ufr2kd` (`CREATED_ID`),
  KEY `FK_4m3j1xhcl66tki1x180jf6gt7` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=325 ;

--
-- Vypisuji data pro tabulku `Rate`
--

INSERT INTO `Rate` (`id`, `created`, `lastModified`, `version`, `entityId`, `ipAddress`, `rateType`, `value`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
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

-- --------------------------------------------------------

--
-- Struktura tabulky `Region`
--

CREATE TABLE IF NOT EXISTS `Region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  `googleAlias` varchar(255) DEFAULT NULL,
  `north` double DEFAULT NULL,
  `west` double DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3tk2mr4j709894t9jd7f3tyto` (`CREATED_ID`),
  KEY `FK_gr1ee427bl95add3miglhj1gm` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Vypisuji data pro tabulku `Region`
--

INSERT INTO `Region` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`, `googleAlias`, `north`, `west`, `zoom`) VALUES
(1, 9, 'Praha', 'reg_pha', NULL, '2014-09-10 22:12:24', NULL, 5, NULL, 'Hlavní město Praha', 50.0641917366591, 14.4937133789062, 11),
(3, 3, 'Středočeský', 'reg_str', NULL, '2014-07-25 09:19:36', NULL, 2, NULL, 'Středočeský kraj', 50.0641917366591, 14.4937133789062, NULL),
(4, 1, 'Ústecký', 'reg_ust', NULL, '2014-07-23 23:24:19', NULL, 2, NULL, 'Ústecký kraj', 50.5343804061108, 13.9059448242188, NULL),
(5, 1, 'Liberecký', 'reg_lib', NULL, '2014-07-23 23:19:55', NULL, 2, NULL, 'Liberecký kraj', 50.7260242965947, 15.0210571289062, NULL),
(6, 6, 'Plzeňský', 'reg_plz', NULL, '2014-09-10 22:21:35', NULL, 5, NULL, 'Plzeňský kraj', 49.6473492, 13.3600746, 9),
(7, 1, 'Karlovarský', 'reg_klv', NULL, '2014-07-23 23:18:29', NULL, 2, NULL, 'Karlovarský kraj', 50.1487464006628, 12.9336547851562, NULL),
(8, 6, 'Jihočeský', 'reg_jhc', NULL, '2014-07-23 23:36:01', NULL, 2, NULL, 'Jihočeský kraj', 49.0810623643207, 14.4552612304688, NULL),
(9, 3, 'Vysočina', 'reg_vys', NULL, '2014-07-23 23:24:49', NULL, 2, NULL, 'Kraj Vysočina', 49.3716433382614, 15.5978393554688, NULL),
(10, 3, 'Královehradecký', 'reg_khr', NULL, '2014-07-25 09:17:38', NULL, 2, NULL, 'Královéhradecký kraj', 50.3840052763671, 15.9164428710938, NULL),
(11, 2, 'Pardubický', 'reg_par', NULL, '2014-07-23 23:22:12', NULL, 2, NULL, 'Pardubický kraj', 49.8450675795639, 16.1636352539062, NULL),
(12, 2, 'Jihomoravský', 'reg.jhm', NULL, '2014-07-23 23:17:28', NULL, 2, NULL, 'Jihomoravský kraj', 49.0378679453264, 16.600341796875, NULL),
(13, 2, 'Olomoucký', 'reg.olo', NULL, '2014-07-23 23:21:36', NULL, 2, NULL, 'Olomoucký kraj', 49.7209279267033, 17.1908569335938, NULL),
(14, 2, 'Zlínský', 'reg.zln', NULL, '2014-07-23 23:25:45', NULL, 2, NULL, 'Zlínský kraj', 49.2283601409013, 17.7841186523438, NULL),
(15, 2, 'Moravskoslezský', 'reg.msl', NULL, '2014-07-23 23:21:07', NULL, 2, NULL, 'Moravskoslezský kraj', 49.8733977031892, 17.9598999023438, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `RegistrationRequest`
--

CREATE TABLE IF NOT EXISTS `RegistrationRequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `captchaText` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `processed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4q6a42uj3un6vnr7qdcml5h1v` (`CREATED_ID`),
  KEY `FK_nqi8prpkgpu11dojbvn6yrvvy` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Vypisuji data pro tabulku `RegistrationRequest`
--

INSERT INTO `RegistrationRequest` (`id`, `created`, `lastModified`, `version`, `captchaText`, `email`, `phone`, `text`, `CREATED_ID`, `LAST_MODIFIED_ID`, `processed`) VALUES
(1, '2014-05-12 06:27:33', '2014-05-12 06:27:33', 0, NULL, 'vit.ratislav@seznam.cz', '602614027', 'Posílám požadavek', NULL, NULL, NULL),
(2, '2014-05-13 00:04:30', '2014-05-13 00:04:30', 0, NULL, 'jiri.slovak@gmail.com', '606034523', ' testovaci ... ahoj :)', NULL, NULL, NULL),
(3, '2014-05-13 00:11:53', '2014-05-13 00:11:53', 0, NULL, 'jiri.slovak@gmail.com', '606034444', ' test', NULL, NULL, NULL),
(6, '2014-05-19 02:37:17', '2014-05-19 02:37:17', 0, NULL, 'jiri.slovak@gmail.com', '606034523', ' Dobrý den,', 2, 2, NULL),
(7, '2014-05-23 06:54:56', '2014-06-02 22:07:23', 1, NULL, 'vit.ratislav@seznam.cz', '602614027', '<p>EKOP s.r.o.<br />Elektrokola Plzeň<br />Srázná 9<br />32600<br />Plzeň</p><p>chceme u vás inzerovat<br />Ratislav</p>', NULL, 5, b'1'),
(8, '2014-05-26 17:31:41', '2014-06-01 18:58:48', 2, NULL, 'vit.ratislav@seznam.cz', '602614027', 'zkouška, co mi přijde do mailu', NULL, 2, b'0');

-- --------------------------------------------------------

--
-- Struktura tabulky `Seller`
--

CREATE TABLE IF NOT EXISTS `Seller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `addressCity` varchar(30) DEFAULT NULL,
  `addressDegree` varchar(20) DEFAULT NULL,
  `addressEmail` varchar(50) DEFAULT NULL,
  `addressName` varchar(50) DEFAULT NULL,
  `addressPostCode` varchar(5) DEFAULT NULL,
  `addressSalutation` varchar(20) DEFAULT NULL,
  `addressStreet` varchar(50) DEFAULT NULL,
  `businessCity` varchar(30) DEFAULT NULL,
  `businessDegree` varchar(20) DEFAULT NULL,
  `businessEmail` varchar(50) DEFAULT NULL,
  `businessName` varchar(30) DEFAULT NULL,
  `businessPhoneNumber` varchar(30) DEFAULT NULL,
  `businessPostCode` varchar(30) DEFAULT NULL,
  `businessSalutation` varchar(20) DEFAULT NULL,
  `businessStreet` varchar(30) DEFAULT NULL,
  `mapUrl` varchar(255) DEFAULT NULL,
  `personDegree` varchar(20) DEFAULT NULL,
  `personName` varchar(20) DEFAULT NULL,
  `personSalutation` varchar(20) DEFAULT NULL,
  `personSurname` varchar(20) DEFAULT NULL,
  `saleType` varchar(255) DEFAULT NULL,
  `sellerDescription` longtext NOT NULL,
  `sellerName` varchar(20) NOT NULL,
  `web` varchar(255) DEFAULT NULL,
  `addressCountry_id` bigint(20) NOT NULL,
  `businessCountry_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `sellerStatus_id` bigint(20) NOT NULL,
  `sellerTitle` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93643B9F9AB44008` (`businessCountry_id`),
  KEY `FK93643B9F5719F83` (`sellerStatus_id`),
  KEY `FK93643B9F9C386B3C` (`addressCountry_id`),
  KEY `FK93643B9F78CE8343` (`region_id`),
  KEY `FK_k4ygr3jaymc95ahtw07crsvy7` (`CREATED_ID`),
  KEY `FK_rlw7mbokem8au67ww4d9iaana` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Vypisuji data pro tabulku `Seller`
--

INSERT INTO `Seller` (`id`, `version`, `addressCity`, `addressDegree`, `addressEmail`, `addressName`, `addressPostCode`, `addressSalutation`, `addressStreet`, `businessCity`, `businessDegree`, `businessEmail`, `businessName`, `businessPhoneNumber`, `businessPostCode`, `businessSalutation`, `businessStreet`, `mapUrl`, `personDegree`, `personName`, `personSalutation`, `personSurname`, `saleType`, `sellerDescription`, `sellerName`, `web`, `addressCountry_id`, `businessCountry_id`, `region_id`, `sellerStatus_id`, `sellerTitle`, `enabled`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 15, 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', 'Jiří Slovák', '40331', 'pan', 'Na Výšině 494\r\nHHHhh\r\nGGGgg', 'Ústí nad Labem', 'Ing.', 'jiri.slovak@gmail.com', 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', 'http://www.finebike.cz/', 'Ing.', 'Jiří', 'pan', 'Slovák', 's.r.o.', 'Specializovaný e-shop na cyklistiku a běžky... www.finebike.cz Zveme vás do naší prodejny na Praze 1 v ulici Skořepka 4. Najdete u nás rozsáhlý sortiment jak pro cyklistiku tak i pro běžecké lyžování, včetně oblečení a nezbytných doplňků. Nabízíme vám navíc kvalitní servis kol a také zázemí a kvalitu autorizovaného dealera renomovaných cyklistických a běžkařských značek, které držíme skladem, takže si jejich zboží můžete prohlédnout případně vyzkoušet a ihned koupit.', 'FineBike', 'http://www.finebike.cz/', 1, 1, 3, 1, 'Kvalitní prodejna kol', b'1', NULL, '2014-07-08 20:54:35', NULL, 2),
(2, 12, 'Praha', 'Bc.', 'frata.pod@kola.cz', 'František Podlaha', '15000', 'pan', 'Bělehradská', 'Praha', 'Bc.', 'frata.pod@kola.cz', 'František Podlaha', '606213456', '15000', 'pan', 'Bělehradská', 'http://cyklocentrum.cz', 'Bc.', 'František', 'pan', 'Podlaha', 's.r.o.', 'Prodáváme jízdní, horská, krosová, trekingová, cestovní, dětská a silniční kola Author a AGang, bike příslušenství a sportovní potřeby. Koloběžky Micro, Tempish a Yedoo, odrážedla Yedoo a Author. Naleznete u nás velký výběr cyklistického oblečení. Prodáváme přilby Author, Giro, Uvex, tretry Shimano a Northwave, oblečení Author, Silvini, Sensor, Craft, brýle Uvex, Tifosi a Relax, dětské sedačky Author a Hamax, výživa Enervit, Nutrend, Powerbar, cyklotrenažéry Tacx. Dále prodáváme značky Zéffal, Topeak, Schwalbe, Camelbak, Author, Panaracer, Shimano, Ritchey, Cateye, Abus, RST.', 'cyklocentrum.cz', 'http://cyklocentrum.cz', 1, 1, 1, 2, 'Kola za super ceny...', b'1', NULL, '2014-07-08 00:12:10', NULL, 2),
(3, 1, '', '', '', '', '', '', '', 'Rychlov', '', '', '', '', '99999', '', 'Rychlová 16', 'Položka odkaz na mapy', '', 'Richard', 'Pan', 'Rychlý', '', ' Zkouším založit prodejce a nastavit mu oprávnění', 'Testovací prodejce', '', 1, 1, 1, 2, '', b'1', '2014-05-04 09:25:38', '2014-07-08 00:12:26', 5, 2),
(4, 19, '', '', '', '', '', '', '', 'Prague', '', 'al_rad@post.cz', '', '', '33901', '', 'Černická 16', 'https://www.google.cz/maps/place/Pražská+5%2F15/@50.0519022,14.5227771,17z/data=!3m1!4b1!4m2!3m1!1s0x470b925c1b45f0f5:0x5820b96ccd869bb4', 'Bc.', 'Tomáš', 'Pan', 'Radoměřský', '', ' Pro uživatelské testy zakládám prodejce pro Toma. test<div>Dělám update</div>', 'Testovací - Tom', 'http://www.aktualne.cz', 1, 1, 6, 2, 'Testovací prodejce pro Toma', b'1', '2014-05-18 22:13:25', '2014-07-08 21:17:08', 5, 7),
(6, 1, 'Plzeň', 'ing.', 'dezo.kotlar@kolaplzen2.cz', 'Dežo Kotlár', '32600', 'pan', 'Nepomucká 8', 'Plzeň', '', 'info@kolaplzen.cz', 'Kola Plzeň 2', '222333111', '32600', '', 'Slovanská 3', '', 'Mgr.', 'Jiří', 'pan', 'Tolar', 'kamenná prodejna a e-shop', '<p>Tradiční prodejce kol se zaměřením na značky TREK a SPECIALIZED s kamennou prodejnou v Plzni<br />.<br />Otvírací doba<br />PO - PÁ 9.00 - 18.00h<br />SO         9.00 - 12.00h<br />.<br />Provádíme také opravy kol a jejich přípravu na sezonu</p>', 'KP2', 'http://www.kolaplzen2.cz', 1, 1, 6, 2, 'Kola Plzeň 2', b'1', '2014-05-24 09:35:31', '2014-07-08 21:14:31', 6, 2),
(7, 7, 'KAměsto', 'KAtitul', 'KAemail@email.cz', 'KAjméno', '22222', 'KAoslovení', 'KAulice', 'Pměsto', 'Ptitul', 'Pemail@email.cz', 'Pnázev', '111111111', '11115', 'Poslovení', 'Pulice', 'http://www.mapy.cz/#!x=13.391836&y=49.738026&z=15&d=addr_9066194_1&t=s&q=plze%25C5%2588%2520rady%25C5%2588sk%25C3%25A1%252016&qp=10.882384_48.320847_20.005679_51.133344_6', 'ZOtitul', 'ZOjméno', 'ZOoslovení', 'ZOpříjmení', 'Oformaprodeje', '<p>prodejce popis<br />druhý řádek</p><p>čtvrtý řádek<br /><b>pátý řádek tučným písmem</b><br /><b><u>šestý řádek tučným podtrženým písmem</u></b><br /><strike>sedmý řádek přeškrtnutým písmem</strike><br /><strike></strike><br /><i>devátý řádek kurzívou</i><br /><i></i><br />jedenáctý řádek zarovnaný vpravo<br />dvanáctý řádek zarovnaný vpravo</p><p>test</p>', 'prodejce název', 'http://www.Oweb.cz', 1, 1, 1, 2, 'prodejce název dlouhý', b'1', '2014-05-24 13:31:52', '2014-07-08 00:11:39', 6, 2),
(8, 8, 'KAměsto', 'KAtitul', 'KAemail@seznam.cz', 'KAjméno', '22222', 'KAoslovení', 'KAulice', 'Pměsto', 'Ptitul', 'Pemail@seznam.cz', 'Pnázev', '+420111111111', '111111', 'Poslovení', 'Pulice', 'https://www.google.cz/maps/place/Sr%C3%A1zn%C3%A1+272%2F9/@49.7266291,13.394243,17z/data=!3m1!4b1!4m2!3m1!1s0x470aee25445c1437:0x8e2cd94045eaa8d8', 'ZOtitul', 'ZOjméno', 'ZOoslovení', 'ZOpříjemní', 'Oformaprodeje', '<p>kkkk</p><p><b>hhhh</b><br /><i>rrrr</i><br /><u>uuuuuu</u><br /><strike>sssssssss</strike></p>', 'ZInazev', 'http://www.Oweb.cz', 1, 1, 6, 2, 'ZInazevdlouhy', b'1', '2014-05-26 21:51:06', '2014-06-01 18:59:12', 6, 2),
(9, 1, '', '', 'radomerska@seznam.cz', '', '', '', '', 'Praha 10', 'Ing.', 'al_rad@post.cz', 'CYKLO LENKA', '724216728', '10000', 'Paní', 'Černická 16', 'https://www.google.cz/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', 'Ing.', 'Lenka', 'Paní', 'Radoměřská', 'CO znamená forma prodeje ?', '', 'Prodejce LENKA', 'http://www.novinky.cz', 1, 1, 1, 2, 'Testovací Profil pro uživatelské testy', b'1', '2014-06-02 21:08:19', '2014-06-02 21:08:19', 5, 5),
(10, 3, 'Praha', '', 'michaela.radomerska@gmail.com', 'Míša cyclo', '11111', 'Slečna', 'Pražská', 'Praha', '', 'al_rad@post.cz', 'Misa cyclo', '111222333', '111111', 'Slečna', 'Pražská', 'https://www.google.com/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', '', 'Michaela', 'Slešna', 'Radoměřská', 'Korespondenční :-)', '', 'Prodejce Michalka', 'http://www.wincor-nixdorf.cz', 1, 1, 1, 2, 'Testovací prodejce Michalka', b'0', '2014-06-14 22:02:23', '2014-06-16 05:28:16', 5, 5),
(11, 1, 'Praha', '', 'michaela.radomerska@gmail.com', 'Miška jméno', '10000', 'Slečna', 'Černická 16', 'Praha', '', 'al_rad@post.cz', 'KOLO Myška', '222666222', '10000', 'Slečna', 'Černická 16', 'https://www.google.com/maps/place/Černická+1309%2F16/@50.0793632,14.50597,17z/data=!3m1!4b1!4m2!3m1!1s0x470b9318b7febf6d:0x3d6ad0db25218fd3', '', 'Michaela', 'Slečna', 'Radoměřská', 'Telefonická', '', 'Prodejce Míša', 'http://www.seznam.cz', 1, 1, 1, 2, 'Testovací prodejce Míša', b'1', '2014-06-15 21:02:22', '2014-06-15 21:02:22', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `SellerPhotoUrl`
--

CREATE TABLE IF NOT EXISTS `SellerPhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(30) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `SELLER_ID` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK83609A9CF66C8014` (`SELLER_ID`),
  KEY `FK_jg91bebjv9v12hfktbiombq5a` (`CREATED_ID`),
  KEY `FK_jfmladf1u9j6bak3igj2bfev1` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Vypisuji data pro tabulku `SellerPhotoUrl`
--

INSERT INTO `SellerPhotoUrl` (`id`, `version`, `contentType`, `fileName`, `SELLER_ID`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(9, 0, 'image/pjpeg', 'P5090892.JPG', 8, '2014-05-26 22:03:16', '2014-05-26 22:03:16', 6, 6),
(10, 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 9, '2014-06-02 21:08:19', '2014-06-02 21:08:19', 5, 5),
(12, 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 10, '2014-06-14 22:05:15', '2014-06-14 22:05:15', 5, 5),
(13, 0, 'image/jpeg', '81190588-a57d-46c9-b314-000caa39b205.jpg', 11, '2014-06-15 21:02:22', '2014-06-15 21:02:22', 5, 5),
(16, 0, 'image/jpeg', 'Hydrangeas.jpg', 7, '2014-07-08 00:11:39', '2014-07-08 00:11:39', 2, 2),
(17, 0, 'image/jpeg', 'Desert.jpg', 2, '2014-07-08 00:12:10', '2014-07-08 00:12:10', 2, 2),
(18, 0, 'image/jpeg', 'Jellyfish.jpg', 3, '2014-07-08 00:12:26', '2014-07-08 00:12:26', 2, 2),
(19, 0, 'image/jpeg', 'Koala.jpg', 1, '2014-07-08 20:54:22', '2014-07-08 20:54:22', 2, 2),
(20, 0, 'image/jpeg', 'Chrysanthemum.jpg', 6, '2014-07-08 21:14:31', '2014-07-08 21:14:31', 2, 2),
(22, 0, 'image/jpeg', '8c94a9d3-0ae9-4955-bc3c-23fb9159879a.jpg', 4, '2014-07-08 21:17:08', '2014-07-08 21:17:08', 7, 7);

-- --------------------------------------------------------

--
-- Struktura tabulky `SellerStatus`
--

CREATE TABLE IF NOT EXISTS `SellerStatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `sequenceNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qxh70nwap22dbi0dspkd36jm7` (`CREATED_ID`),
  KEY `FK_8w1ct97q2grkdqp8cqtdoafw4` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `SellerStatus`
--

INSERT INTO `SellerStatus` (`id`, `version`, `codeDescription`, `codeKey`, `priority`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `sequenceNr`) VALUES
(1, 0, 'VIP', 'sellst_vip', 100, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Běžný prodejce', 'sellst_ord', 100, NULL, '2014-05-24 13:01:12', NULL, 2, NULL);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `ApplicationPermission`
--
ALTER TABLE `ApplicationPermission`
  ADD CONSTRAINT `FK_aj59t1wmmbpj6q6hid9vhe2wb` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_hyu5sbpoc1805axhych5v2tf7` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `ApplicationRole`
--
ALTER TABLE `ApplicationRole`
  ADD CONSTRAINT `FK_p2f4hra0190o9t3c3jvoqkj5w` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_ri1fp2mihsws88hrvy4792u5w` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `ApplicationUser`
--
ALTER TABLE `ApplicationUser`
  ADD CONSTRAINT `FK7A3BF51BF66C8014` FOREIGN KEY (`SELLER_ID`) REFERENCES `Seller` (`id`),
  ADD CONSTRAINT `FK_p3ob54d2ugnrb0yvng71fa5ix` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_qwu3qu622eq8pjxtpljxfco1j` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `APPLICATION_ROLE_PERMISSION`
--
ALTER TABLE `APPLICATION_ROLE_PERMISSION`
  ADD CONSTRAINT `FK_l467vw6jhwo522b3ef8ovgkor` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `ApplicationPermission` (`id`),
  ADD CONSTRAINT `FK_msjrjy23nvkle00037evqd9ef` FOREIGN KEY (`ROLE_ID`) REFERENCES `ApplicationRole` (`id`);

--
-- Omezení pro tabulku `APPLICATION_USER_ROLE`
--
ALTER TABLE `APPLICATION_USER_ROLE`
  ADD CONSTRAINT `FK_21d31gwey0t8tqpkt3jjsca74` FOREIGN KEY (`USER_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_fvy2dr55uu61y45vcl97u336y` FOREIGN KEY (`ROLE_ID`) REFERENCES `ApplicationRole` (`id`);

--
-- Omezení pro tabulku `BicycleSize`
--
ALTER TABLE `BicycleSize`
  ADD CONSTRAINT `FK_1yb8j43vb2q8gpqh0yenbqvje` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_urs0g13l1v973w1844qjvp5y` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `Category`
--
ALTER TABLE `Category`
  ADD CONSTRAINT `FK6DD211EFFD6B623` FOREIGN KEY (`categoryType_id`) REFERENCES `CategoryType` (`id`),
  ADD CONSTRAINT `FK_3d8hx4aa4a5lntf8snevk0rd6` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_o03cyrgnf24ljknjpoyvi6eye` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `CategoryType`
--
ALTER TABLE `CategoryType`
  ADD CONSTRAINT `FK_456t5n7et0rex63so04b66usp` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_8ifncjqmqrdxlg22p92rk3on1` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `CountryState`
--
ALTER TABLE `CountryState`
  ADD CONSTRAINT `FK_e9tq6dyk6rymojau42xcyw7x4` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_flsod9r4ycg5lu7ji98bjvlgx` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `FigureHeight`
--
ALTER TABLE `FigureHeight`
  ADD CONSTRAINT `FK_88353pbg7saerfwe9ueu2axwm` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_hu8n4vvt6bi01vt4h48pnbrjb` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `NewsItem`
--
ALTER TABLE `NewsItem`
  ADD CONSTRAINT `FK_52ppc8kwmk45bsfs5tibbam7u` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_hw29s7miud9olem8x8rxoocvv` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `NewsItemPhotoUrl`
--
ALTER TABLE `NewsItemPhotoUrl`
  ADD CONSTRAINT `FK_bv4cc5qbl1usgr83jgq84okb0` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_ibifb4exurkr3bibkxsug1jjp` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_nwosek9s1opwi0nig98f7ac78` FOREIGN KEY (`NEWSITEM_ID`) REFERENCES `NewsItem` (`id`);

--
-- Omezení pro tabulku `PhotoUrl`
--
ALTER TABLE `PhotoUrl`
  ADD CONSTRAINT `FKB7E66DFDA4593BE0` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `FK_39jtk2r3ppldnqd4rb6rdlrro` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_nldug6mhiyl923yofdma0qpdd` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `Producer`
--
ALTER TABLE `Producer`
  ADD CONSTRAINT `FK_o4c7feesxwmj9n0orfkkh1q3r` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_osow3ocq54s30l86wsww2aaq3` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `FK_ocfck118ejxmxm4xhdev5q87k` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `FK50C664CF6461F0C3` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `FK50C664CF7033F843` FOREIGN KEY (`producer_id`) REFERENCES `Producer` (`id`),
  ADD CONSTRAINT `FK50C664CFF66C8014` FOREIGN KEY (`seller_id`) REFERENCES `Seller` (`id`),
  ADD CONSTRAINT `FK_67q0uqmcax1tj14dlvb592tkc` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_6ly8uo2nwqgemejqng3yoaqnt` FOREIGN KEY (`productUsage_id`) REFERENCES `ProductUsage` (`id`),
  ADD CONSTRAINT `FK_e2h6iqj8nkleqlid35qrkv4hx` FOREIGN KEY (`figureHeight_id`) REFERENCES `FigureHeight` (`id`),
  ADD CONSTRAINT `FK_l85o5it5jd637mph0u6fg3hef` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_n3v5evhdukpikrt4s5o5jlv9h` FOREIGN KEY (`bicycleSize_id`) REFERENCES `BicycleSize` (`id`);

--
-- Omezení pro tabulku `ProductAttribute`
--
ALTER TABLE `ProductAttribute`
  ADD CONSTRAINT `FKDDC65E8DA4593BE0` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `FKDDC65E8DB9148FB4` FOREIGN KEY (`attributeType_id`) REFERENCES `ProductAttributeType` (`id`),
  ADD CONSTRAINT `FK_5pfveqxc9487eoxj1g1im0ev0` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_qepvu2lldhla75kgeswjrptop` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `ProductAttributeType`
--
ALTER TABLE `ProductAttributeType`
  ADD CONSTRAINT `FK_35jckbtrt6mopwn668vknwcq4` FOREIGN KEY (`categoryType_id`) REFERENCES `CategoryType` (`id`),
  ADD CONSTRAINT `FK_78yn9egp7c0kl5ksq7yi3djht` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_g23gbhbyp1j052ckwwnhytowu` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `ProductUsage`
--
ALTER TABLE `ProductUsage`
  ADD CONSTRAINT `FK_pxpmn20h3fop5d6j83185vvj2` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_t781f1fgejuby0axs58hjo7yb` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `Region`
--
ALTER TABLE `Region`
  ADD CONSTRAINT `FK_3tk2mr4j709894t9jd7f3tyto` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_gr1ee427bl95add3miglhj1gm` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `RegistrationRequest`
--
ALTER TABLE `RegistrationRequest`
  ADD CONSTRAINT `FK_4q6a42uj3un6vnr7qdcml5h1v` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_nqi8prpkgpu11dojbvn6yrvvy` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `Seller`
--
ALTER TABLE `Seller`
  ADD CONSTRAINT `FK93643B9F5719F83` FOREIGN KEY (`sellerStatus_id`) REFERENCES `SellerStatus` (`id`),
  ADD CONSTRAINT `FK93643B9F78CE8343` FOREIGN KEY (`region_id`) REFERENCES `Region` (`id`),
  ADD CONSTRAINT `FK93643B9F9AB44008` FOREIGN KEY (`businessCountry_id`) REFERENCES `CountryState` (`id`),
  ADD CONSTRAINT `FK93643B9F9C386B3C` FOREIGN KEY (`addressCountry_id`) REFERENCES `CountryState` (`id`),
  ADD CONSTRAINT `FK_k4ygr3jaymc95ahtw07crsvy7` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_rlw7mbokem8au67ww4d9iaana` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `SellerPhotoUrl`
--
ALTER TABLE `SellerPhotoUrl`
  ADD CONSTRAINT `FK83609A9CF66C8014` FOREIGN KEY (`SELLER_ID`) REFERENCES `Seller` (`id`),
  ADD CONSTRAINT `FK_jfmladf1u9j6bak3igj2bfev1` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_jg91bebjv9v12hfktbiombq5a` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);

--
-- Omezení pro tabulku `SellerStatus`
--
ALTER TABLE `SellerStatus`
  ADD CONSTRAINT `FK_8w1ct97q2grkdqp8cqtdoafw4` FOREIGN KEY (`LAST_MODIFIED_ID`) REFERENCES `ApplicationUser` (`id`),
  ADD CONSTRAINT `FK_qxh70nwap22dbi0dspkd36jm7` FOREIGN KEY (`CREATED_ID`) REFERENCES `ApplicationUser` (`id`);
