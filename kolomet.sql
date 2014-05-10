-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Pátek 09. května 2014, 00:52
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

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
(15, 0, 'per_bicyclesizes', '2014-04-14 20:52:11', '2014-04-14 20:52:11', 5, 5),
(16, 1, 'per_productusages', '2014-04-14 20:58:47', '2014-04-14 20:59:19', 5, 5),
(17, 0, 'per_products_all', '2014-04-21 18:38:25', '2014-04-21 18:38:25', 2, 2),
(18, 0, 'per_products_own', '2014-04-21 18:38:36', '2014-04-21 18:38:36', 2, 2),
(19, 0, 'per_sellers_all', '2014-04-21 18:39:31', '2014-04-21 18:39:31', 2, 2),
(20, 0, 'per_sellers_own', '2014-04-21 18:39:39', '2014-04-21 18:39:39', 2, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `ApplicationRole`
--

INSERT INTO `ApplicationRole` (`id`, `version`, `roleName`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, 5, 'role_admin', '2014-03-31 00:00:00', '2014-04-21 18:40:03', 2, 2),
(4, 2, 'role_seller', '2014-03-31 06:24:02', '2014-04-21 18:40:35', 2, 2);

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
  PRIMARY KEY (`id`),
  KEY `FK7A3BF51BF66C8014` (`SELLER_ID`),
  KEY `FK_p3ob54d2ugnrb0yvng71fa5ix` (`CREATED_ID`),
  KEY `FK_qwu3qu622eq8pjxtpljxfco1j` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `ApplicationUser`
--

INSERT INTO `ApplicationUser` (`id`, `version`, `password`, `username`, `SELLER_ID`, `created`, `lastModified`, `enabled`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(2, 0, '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', 'jiri.slovak@gmail.com', NULL, '2014-03-31 00:00:00', '2014-03-31 00:00:00', b'1', NULL, NULL),
(3, 0, 'b39237b81c337166524f3adf2d94a7f5ad8bb2f5', 'jiri.slovak@generali.cz', 2, '2014-03-31 07:06:47', '2014-03-31 07:06:47', b'1', NULL, NULL),
(4, 0, '313514ee4cd8eb5d583c0ea5a00dbb9d7d6c285b', 'kola@seznam.cz', 2, '2014-03-31 07:13:54', '2014-03-31 07:13:54', b'1', NULL, NULL),
(5, 0, '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', 'ales.radomersky@gmail.com', 1, '2014-03-31 07:14:20', '2014-03-31 07:14:20', b'1', NULL, NULL),
(6, 0, '4f5c3486072cf152918f8c2d4d64be1b948fa794', 'vit.ratislav@gmail.com', 1, '2014-03-31 07:15:55', '2014-03-31 07:15:55', b'1', NULL, NULL);

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
(4, 4),
(4, 8),
(4, 18),
(4, 20);

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
(5, 3),
(6, 3);

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
(1, 1, ' Všechna kola', 'cat_bike_all', 1, NULL, '2014-05-06 18:23:11', NULL, 5),
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
  PRIMARY KEY (`id`),
  KEY `FK_456t5n7et0rex63so04b66usp` (`CREATED_ID`),
  KEY `FK_8ifncjqmqrdxlg22p92rk3on1` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `CategoryType`
--

INSERT INTO `CategoryType` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 0, 'Kola', 'cattype_bike', NULL, NULL, NULL, NULL),
(2, 1, 'Ostatní', 'cattype_other', NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `FK_flsod9r4ycg5lu7ji98bjvlgx` (`CREATED_ID`),
  KEY `FK_e9tq6dyk6rymojau42xcyw7x4` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `CountryState`
--

INSERT INTO `CountryState` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 1, 'Česká republika', 'cs_cz', NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `FK_hu8n4vvt6bi01vt4h48pnbrjb` (`CREATED_ID`),
  KEY `FK_88353pbg7saerfwe9ueu2axwm` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Vypisuji data pro tabulku `FigureHeight`
--

INSERT INTO `FigureHeight` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-04-14 20:55:40', '2014-04-14 20:55:40', 0, 'do 90 cm', 'fheight_90', 5, 5),
(2, '2014-04-14 20:55:56', '2014-04-14 20:55:56', 0, '91 - 100 cm', 'fheight_100', 5, 5),
(4, '2014-04-14 20:56:31', '2014-05-03 17:49:23', 1, '101 - 115 cm', 'fheight_115', 5, 5),
(6, '2014-04-14 20:57:12', '2014-05-03 17:49:37', 1, '116 - 130 cm', 'fheight_130', 5, 5),
(7, '2014-04-14 20:57:29', '2014-05-03 17:53:38', 2, '131 - 145 cm', 'fheight_145', 5, 5),
(8, '2014-05-03 17:43:12', '2014-05-03 17:54:01', 5, '146 - 160 cm', 'fheight_160', 5, 5),
(9, '2014-05-03 17:44:55', '2014-05-03 17:54:20', 3, '161 - 175 cm', 'fheight_175', 5, 5),
(10, '2014-05-03 17:46:37', '2014-05-03 17:54:38', 4, '176 - 190 cm', 'fheight_190', 5, 5),
(11, '2014-05-03 17:47:12', '2014-05-03 17:55:18', 3, '191 - 205 cm', 'fheight_205', 5, 5),
(12, '2014-05-03 17:55:41', '2014-05-03 17:55:41', 0, 'nad 205 cm', 'fheight_more205', 5, 5);

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
  PRIMARY KEY (`id`),
  KEY `FK_52ppc8kwmk45bsfs5tibbam7u` (`CREATED_ID`),
  KEY `FK_hw29s7miud9olem8x8rxoocvv` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `NewsItem`
--

INSERT INTO `NewsItem` (`id`, `version`, `enabled`, `newsItemDate`, `text`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 4, b'1', '2014-04-01 00:00:00', 'Spuštění webu kolomet. Web specializovaný na prodej kol od profesionálů na českém trhu.', NULL, '2014-04-01 07:49:50', NULL, 2),
(2, 2, b'1', '2014-03-10 00:00:00', 'Zacal vyvoj na webu kolomet.cz', NULL, '2014-03-30 09:15:08', NULL, NULL),
(3, 4, b'1', '2014-03-27 00:00:00', 'Upraveny detail prodejce a produktu', NULL, '2014-03-30 09:14:47', NULL, NULL),
(4, 4, b'1', '2014-03-30 00:00:00', 'Tady je klientů :-)', NULL, '2014-03-31 07:09:38', NULL, 2),
(5, 0, b'1', '2014-03-31 00:00:00', 'Prvni verze zabezpeceni je hotova. Jeste chybi osetrit, ze prodejci vidi pouze sve inzeraty a informace.', '2014-03-31 07:10:21', '2014-03-31 07:10:21', 2, 2),
(6, 0, b'1', '2014-05-04 09:35:00', ' Zapsání novinky ... bez baneru', '2014-05-04 09:36:00', '2014-05-04 09:36:00', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `NewsItemPhotoUrl`
--

CREATE TABLE IF NOT EXISTS `NewsItemPhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(20) DEFAULT NULL,
  `fileName` varchar(20) DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  `NEWSITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ibifb4exurkr3bibkxsug1jjp` (`CREATED_ID`),
  KEY `FK_bv4cc5qbl1usgr83jgq84okb0` (`LAST_MODIFIED_ID`),
  KEY `FK_nwosek9s1opwi0nig98f7ac78` (`NEWSITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `NewsItemPhotoUrl`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `PhotoUrl`
--

CREATE TABLE IF NOT EXISTS `PhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(20) DEFAULT NULL,
  `fileName` varchar(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB7E66DFDA4593BE0` (`PRODUCT_ID`),
  KEY `FK_nldug6mhiyl923yofdma0qpdd` (`CREATED_ID`),
  KEY `FK_39jtk2r3ppldnqd4rb6rdlrro` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

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
(20, 0, 'image/jpeg', 'Koala.jpg', 9, '2014-03-31 11:15:48', '2014-03-31 11:15:48', 2, 2),
(21, 0, 'image/jpeg', 'Penguins.jpg', 9, '2014-03-31 12:24:30', '2014-03-31 12:24:30', 2, 2),
(25, 0, 'image/jpeg', 'IMG_7925.jpg', 10, '2014-03-31 16:05:18', '2014-03-31 16:05:18', 5, 5),
(26, 0, 'image/jpeg', 'IMG_7926.jpg', 10, '2014-03-31 16:07:17', '2014-03-31 16:07:17', 5, 5),
(28, 0, 'image/jpeg', 'IMG_6634.JPG', 8, '2014-05-03 18:49:25', '2014-05-03 18:49:25', 5, 5),
(29, 0, 'image/jpeg', 'IMG_6634.JPG', 8, '2014-05-04 11:51:14', '2014-05-04 11:51:14', 5, 5),
(30, 0, 'image/jpeg', 'IMG_9855.JPG', 8, '2014-05-04 11:51:14', '2014-05-04 11:51:14', 5, 5),
(31, 0, 'image/jpeg', 'IMG_0585.JPG', 8, '2014-05-04 11:51:15', '2014-05-04 11:51:15', 5, 5),
(32, 0, 'image/jpeg', 'IMG_7813.jpg', 8, '2014-05-04 11:51:15', '2014-05-04 11:51:15', 5, 5),
(33, 0, 'image/jpeg', 'Lighthouse.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(34, 0, 'image/jpeg', 'Penguins.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(35, 0, 'image/jpeg', 'Koala.jpg', 7, '2014-05-06 14:30:25', '2014-05-06 14:30:25', 2, 2),
(36, 0, 'image/jpeg', 'Koala.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(37, 0, 'image/jpeg', 'Lighthouse.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(38, 0, 'image/jpeg', 'Penguins.jpg', 7, '2014-05-06 14:31:10', '2014-05-06 14:31:10', 2, 2),
(39, 0, 'image/jpeg', 'img_6426.jpg', 5, '2014-05-06 18:44:41', '2014-05-06 18:44:41', 5, 5),
(40, 0, 'image/jpeg', 'img_6412.jpg', 5, '2014-05-06 18:48:13', '2014-05-06 18:48:13', 5, 5),
(41, 0, 'image/jpeg', 'img_6360.jpg', 10, '2014-05-06 18:50:38', '2014-05-06 18:50:38', 5, 5),
(42, 0, 'image/jpeg', 'img_6412.jpg', 9, '2014-05-06 19:39:44', '2014-05-06 19:39:44', 5, 5);

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
  PRIMARY KEY (`id`),
  KEY `FK_o4c7feesxwmj9n0orfkkh1q3r` (`CREATED_ID`),
  KEY `FK_osow3ocq54s30l86wsww2aaq3` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- Vypisuji data pro tabulku `Producer`
--

INSERT INTO `Producer` (`id`, `version`, `codeDescription`, `codeKey`, `name`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(18, NULL, '4EVER', 'prd_4ever', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(19, NULL, '4freetime', 'prd_4free', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(20, NULL, 'ACRA', 'prd_acra', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(21, NULL, 'Acstar', 'prd_acsta', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(22, NULL, 'Agogs', 'prd_agogs', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(23, NULL, 'ALPINA', 'prd_alpin', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(24, NULL, 'AMULET', 'prd_amule', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(25, NULL, 'APACHE', 'prd_apach', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(26, NULL, 'Azub', 'prd_azub', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(27, NULL, 'BROTHER', 'prd_broth', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(28, NULL, 'Cannondale', 'prd_canno', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(29, NULL, 'Cosmic', 'prd_cosmi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(30, NULL, 'COYOTE', 'prd_coyot', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(31, NULL, 'DAHON', 'prd_dahon', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(32, NULL, 'DEMA', 'prd_dema', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(33, NULL, 'DHS', 'prd_dhs', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(34, NULL, 'DINO', 'prd_dino', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(35, NULL, 'DISNEY', 'prd_disne', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(36, NULL, 'Donnay', 'prd_donna', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(37, NULL, 'DUNLOP', 'prd_dunlo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(38, NULL, 'ECO', 'prd_eco', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(39, NULL, 'ELEKTROKOLO', 'prd_elekt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(40, NULL, 'Everlast', 'prd_everl', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(41, NULL, 'FELT', 'prd_felt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(42, NULL, 'Focus', 'prd_focus', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(43, NULL, 'Fondriest', 'prd_fondr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(44, NULL, 'Galaxy', 'prd_galax', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(45, NULL, 'GIANT', 'prd_giant', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(46, NULL, 'GT', 'prd_gt', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(47, NULL, 'HaiBike', 'prd_haibi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(48, NULL, 'HEAD', 'prd_head', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(49, NULL, 'Heavy Tools', 'prd_heavy', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(50, NULL, 'HERCULES', 'prd_hercu', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(51, NULL, 'HOT WHEELS', 'prd_hot w', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(52, NULL, 'INSPORTLINE', 'prd_inspo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(53, NULL, 'Kalkhoff', 'prd_kalkh', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(54, NULL, 'KELLYS', 'prd_kelly', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(55, NULL, 'Kenzel', 'prd_kenze', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(56, NULL, 'Kona', 'prd_kona', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(57, NULL, 'KROSS', 'prd_kross', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(58, NULL, 'Leader Fox', 'prd_leade', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(59, NULL, 'Madison', 'prd_madis', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(60, NULL, 'MAKITA', 'prd_makit', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(61, NULL, 'Maxima', 'prd_maxim', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(62, NULL, 'MERIDA', 'prd_merid', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(63, NULL, 'Mondraker', 'prd_mondr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(64, NULL, 'MONGOOSE', 'prd_mongo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(65, NULL, 'Muddyfox', 'prd_muddy', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(66, NULL, 'Nerf', 'prd_nerf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(67, NULL, 'NORCO', 'prd_norco', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(68, NULL, 'OLPRAN', 'prd_olpra', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(69, NULL, 'PELLS', 'prd_pells', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(70, NULL, 'POWERSLIDE', 'prd_power', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(71, NULL, 'Puky', 'prd_puky', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(72, NULL, 'Rappa', 'prd_rappa', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(73, NULL, 'RAVO', 'prd_ravo', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(74, NULL, 'REFLEX', 'prd_refle', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(75, NULL, 'ROCKY MOUNTAIN', 'prd_rocky', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(76, NULL, 'Schwinn', 'prd_schwi', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(77, NULL, 'SCOTT', 'prd_scott', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(78, NULL, 'Scott Cyklo', 'prd_scott', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(79, NULL, 'Shimano', 'prd_shima', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(80, NULL, 'Silverfox', 'prd_silve', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(81, NULL, 'SPECIALIZED', 'prd_speci', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(82, NULL, 'STR', 'prd_str', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(83, NULL, 'STUF', 'prd_stuf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(84, NULL, 'SUPERIOR', 'prd_super', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(85, NULL, 'Superman', 'prd_super', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(86, NULL, 'TERN', 'prd_tern', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(87, NULL, 'TOPEAK', 'prd_topea', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(88, NULL, 'Torpado', 'prd_torpa', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(89, NULL, 'TREK', 'prd_trek', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(90, NULL, 'UMF', 'prd_umf', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(91, NULL, 'universal', 'prd_unive', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(92, NULL, 'VAUTRON', 'prd_vautr', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(93, NULL, 'Vetro-plus', 'prd_vetro', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(94, NULL, 'Viking', 'prd_vikin', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(95, NULL, 'WINORA', 'prd_winor', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(96, NULL, 'Wisper', 'prd_wispe', NULL, '2014-05-07 00:00:00', NULL, 2, NULL),
(97, NULL, 'WORKER', 'prd_worke', NULL, '2014-05-07 00:00:00', NULL, 2, NULL);

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
  `weight` int(11) DEFAULT NULL,
  `bicycleSize_id` bigint(20) DEFAULT NULL,
  `figureHeight_id` bigint(20) DEFAULT NULL,
  `productUsage_id` bigint(20) DEFAULT NULL,
  `buyUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50C664CFF66C8014` (`seller_id`),
  KEY `FK50C664CF6461F0C3` (`category_id`),
  KEY `FK50C664CF7033F843` (`producer_id`),
  KEY `FK_l85o5it5jd637mph0u6fg3hef` (`CREATED_ID`),
  KEY `FK_67q0uqmcax1tj14dlvb592tkc` (`LAST_MODIFIED_ID`),
  KEY `FK_n3v5evhdukpikrt4s5o5jlv9h` (`bicycleSize_id`),
  KEY `FK_e2h6iqj8nkleqlid35qrkv4hx` (`figureHeight_id`),
  KEY `FK_6ly8uo2nwqgemejqng3yoaqnt` (`productUsage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `Product`
--

INSERT INTO `Product` (`id`, `version`, `discount`, `price`, `productName`, `category_id`, `producer_id`, `seller_id`, `description`, `created`, `validTo`, `canSendToAllCountry`, `enabled`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `deliveryForFree`, `weight`, `bicycleSize_id`, `figureHeight_id`, `productUsage_id`, `buyUrl`) VALUES
(1, 7, '5000.00', '25999.00', 'Agang CULT 2.0 2012', 2, 30, 1, 'Model Cult prezentuje z pohledu značky AGang nejuniverzálnější kolo do horského terénu. Na konstrukci, funkci i designu modelu pracoval tvůrčí tým několik let. Získané zkušenosti umožnily vyladit jeho originální čtyř-čepový systém tak, aby poskytoval maximální komfort odpružení, ovladatelnost v náročnějších terénních pasážích či sjezdech, ale také minimální ztráty při šlapání. Schopnosti modelu Cult vycházejí především z použitých technologií, konstrukčních prvků a geometrie jeho celoodpruženého rámu. Ten disponuje zdvihem 150 mm a naším originálním čtyř-čepovým systémem odpružení zvaný Drive Link Pivot, jenž byl kompletně navržen našimi inženýry v Čechách. Tento systém byl optimalizován tak, aby nabídl jezdci aktivní zadní stavbu a zárověň maximálně omezil její pohupování při šlapání, a to hlavně při jízdě vsedě. Citlivost stavby pak ještě zvyšuje použití tlumiče o délce 200 mm se zdvihem 57 mm.', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-05 00:38:27', NULL, 2, b'0', 21, 1, 1, 1, ''),
(2, 4, '500.00', '4590.00', 'A-Gang Capo 16" červená 2012', 8, 30, 1, 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:11', NULL, 2, b'0', 20, 1, 1, 1, NULL),
(3, 3, '5000.00', '30000.00', 'AUTHOR A 33 2013', 11, 30, 2, 'Chcete-li rychlost a efektivitu, pak je silniční kolo pro Vás. Díky aerodynamické konstrukci...', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:24', NULL, 2, b'0', 20, 1, 1, 1, NULL),
(4, 4, '7000.00', '53900.00', 'Merida Big Ninety-Nine CF Team', 11, 30, 2, 'Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:38', NULL, 2, b'1', 20, 1, 1, 1, NULL),
(5, 3, '5000.00', '50000.00', 'Kolo4', 2, 30, 1, 'Kolo4', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:08:52', NULL, 2, b'0', 15, 1, 1, 1, NULL),
(6, 2, '1000.00', '23000.00', 'Kolo 5', 2, 30, 1, 'Kolo 5', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:09:04', NULL, 2, b'0', 10, 1, 1, 1, NULL),
(7, 3, '2300.00', '42000.00', 'Kolo 6', 1, 30, 2, 'Kolo 6', NULL, '2014-05-11 00:00:00', b'1', b'1', '2014-05-03 17:09:16', NULL, 2, b'1', 6, 7, 7, 1, NULL),
(8, 4, NULL, '99999.00', 'Kolo pro babičku', 1, 30, 1, 'Kolo, jaké svět neviděl. ', '2014-03-31 08:57:32', '2014-05-11 00:00:00', b'1', b'1', '2014-05-06 02:33:23', 5, 2, b'0', 30, 1, 1, 1, ''),
(9, 3, '1000.00', '15000.00', 'Kolo5', 1, 30, 1, 'Kolo5', '2014-03-31 10:26:27', '2014-05-11 00:00:00', b'0', b'1', '2014-05-06 19:43:09', 2, 2, b'0', 20, 1, 1, 1, ''),
(10, 4, '99.00', '1111.00', 'Tryskové kolo', 8, 30, 1, 'Kolo na tryskový pohon. Nikdy nikdo nebyl pomalejší než je toto kolo.<div><br /></div><div>Poznámka .... test</div>', '2014-03-31 13:07:06', '2014-12-31 00:00:00', b'1', b'1', '2014-05-06 19:37:14', 5, 2, b'0', 30, 1, 1, 1, '');

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
  PRIMARY KEY (`id`),
  KEY `FKDDC65E8DB9148FB4` (`attributeType_id`),
  KEY `FKDDC65E8DA4593BE0` (`PRODUCT_ID`),
  KEY `FK_qepvu2lldhla75kgeswjrptop` (`CREATED_ID`),
  KEY `FK_5pfveqxc9487eoxj1g1im0ev0` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Vypisuji data pro tabulku `ProductAttribute`
--

INSERT INTO `ProductAttribute` (`id`, `version`, `attributeValue`, `attributeType_id`, `PRODUCT_ID`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(2, 0, '2 roky', 2, 1, NULL, NULL, NULL, NULL),
(4, 0, 'tyrkysová', 4, 1, NULL, NULL, NULL, NULL),
(7, 0, 'červená', 4, 2, NULL, NULL, NULL, NULL),
(8, 0, 'černá', 4, 5, NULL, NULL, NULL, NULL),
(10, 3, 'černá', 4, 9, '2014-03-31 12:24:55', '2014-05-06 19:43:09', 2, 2);

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
  PRIMARY KEY (`id`),
  KEY `FK_78yn9egp7c0kl5ksq7yi3djht` (`CREATED_ID`),
  KEY `FK_g23gbhbyp1j052ckwwnhytowu` (`LAST_MODIFIED_ID`),
  KEY `FK_35jckbtrt6mopwn668vknwcq4` (`categoryType_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `ProductAttributeType`
--

INSERT INTO `ProductAttributeType` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`, `categoryType_id`, `required`, `units`) VALUES
(2, 0, 'Záruka', 'pat.bike.guarantee', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'Barva', 'pat.bike.color', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `FK_pxpmn20h3fop5d6j83185vvj2` (`CREATED_ID`),
  KEY `FK_t781f1fgejuby0axs58hjo7yb` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `ProductUsage`
--

INSERT INTO `ProductUsage` (`id`, `created`, `lastModified`, `version`, `codeDescription`, `codeKey`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-04-14 20:59:57', '2014-04-14 20:59:57', 0, 'Terénní', 'usage_terrain', 5, 5),
(2, '2014-05-03 17:37:27', '2014-05-03 17:37:27', 0, 'Asfalt', 'usage_asphalt', 5, 5),
(3, '2014-05-03 17:38:54', '2014-05-03 17:38:54', 0, 'Lehký terén', 'usage_easyterrain', 5, 5),
(4, '2014-05-03 17:39:55', '2014-05-03 17:39:55', 0, 'Sjezdová kola', 'usage_downhill', 5, 5);

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
  PRIMARY KEY (`id`),
  KEY `FK_3tk2mr4j709894t9jd7f3tyto` (`CREATED_ID`),
  KEY `FK_gr1ee427bl95add3miglhj1gm` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Vypisuji data pro tabulku `Region`
--

INSERT INTO `Region` (`id`, `version`, `codeDescription`, `codeKey`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 0, 'Praha', 'reg_pha', NULL, NULL, NULL, NULL),
(3, 1, 'Stredočeský', 'reg_str', NULL, NULL, NULL, NULL),
(4, 0, 'Ústecký', 'reg_ust', NULL, NULL, NULL, NULL),
(5, 0, 'Liberecký', 'reg_lib', NULL, NULL, NULL, NULL),
(6, 2, 'Plzeňský', 'reg_plz', NULL, NULL, NULL, NULL),
(7, 0, 'Karlovarský', 'reg_klv', NULL, NULL, NULL, NULL),
(8, 2, 'Jihočeský', 'reg_jhc', NULL, NULL, NULL, NULL),
(9, 2, 'Vysočina', 'reg_vys', NULL, NULL, NULL, NULL),
(10, 1, 'Královehradecký', 'reg_khr', NULL, NULL, NULL, NULL),
(11, 1, 'Pardubický', 'reg_par', NULL, NULL, NULL, NULL),
(12, 1, 'Jihomoravský', 'reg.jhm', NULL, NULL, NULL, NULL),
(13, 1, 'Olomoucký', 'reg.olo', NULL, NULL, NULL, NULL),
(14, 1, 'Zlínský', 'reg.zln', NULL, NULL, NULL, NULL),
(15, 1, 'Moravskoslezský', 'reg.msl', NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `FK_4q6a42uj3un6vnr7qdcml5h1v` (`CREATED_ID`),
  KEY `FK_nqi8prpkgpu11dojbvn6yrvvy` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `RegistrationRequest`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `Seller`
--

INSERT INTO `Seller` (`id`, `version`, `addressCity`, `addressDegree`, `addressEmail`, `addressName`, `addressPostCode`, `addressSalutation`, `addressStreet`, `businessCity`, `businessDegree`, `businessEmail`, `businessName`, `businessPhoneNumber`, `businessPostCode`, `businessSalutation`, `businessStreet`, `mapUrl`, `personDegree`, `personName`, `personSalutation`, `personSurname`, `saleType`, `sellerDescription`, `sellerName`, `web`, `addressCountry_id`, `businessCountry_id`, `region_id`, `sellerStatus_id`, `sellerTitle`, `enabled`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 6, 'UNL', 'Ing.', 'jiri.slovak@gmail.com', 'Jiří Slovák', '40331', 'pan', 'Na Výšině 494', 'UNL', 'Ing.', 'jiri.slovak@gmail.com', 'Jiří Slovák', '606034523', '40331', 'pan', 'Na Výšině 494', 'http://www.finebike.cz/', 'Ing.', 'Jiří', 'pan', 'Slovák', 's.r.o.', 'Specializovaný e-shop na cyklistiku a běžky... www.finebike.cz Zveme vás do naší prodejny na Praze 1 v ulici Skořepka 4. Najdete u nás rozsáhlý sortiment jak pro cyklistiku tak i pro běžecké lyžování, včetně oblečení a nezbytných doplňků. Nabízíme vám navíc kvalitní servis kol a také zázemí a kvalitu autorizovaného dealera renomovaných cyklistických a běžkařských značek, které držíme skladem, takže si jejich zboží můžete prohlédnout případně vyzkoušet a ihned koupit.', 'FineBike', 'http://www.finebike.cz/', 1, 1, 3, 1, 'Kvalitní prodejna kol', b'1', NULL, '2014-03-30 09:04:16', NULL, NULL),
(2, 6, 'Praha', 'Bc.', 'frata.pod@kola.cz', 'František Podlaha', '15000', 'pan', 'Bělehradská', 'Praha', 'Bc.', 'frata.pod@kola.cz', 'František Podlaha', '606213456', '15000', 'pan', 'Bělehradská', 'http://cyklocentrum.cz', 'Bc.', 'František', 'pan', 'Podlaha', 's.r.o.', 'Prodáváme jízdní, horská, krosová, trekingová, cestovní, dětská a silniční kola Author a AGang, bike příslušenství a sportovní potřeby. Koloběžky Micro, Tempish a Yedoo, odrážedla Yedoo a Author. Naleznete u nás velký výběr cyklistického oblečení. Prodáváme přilby Author, Giro, Uvex, tretry Shimano a Northwave, oblečení Author, Silvini, Sensor, Craft, brýle Uvex, Tifosi a Relax, dětské sedačky Author a Hamax, výživa Enervit, Nutrend, Powerbar, cyklotrenažéry Tacx. Dále prodáváme značky Zéffal, Topeak, Schwalbe, Camelbak, Author, Panaracer, Shimano, Ritchey, Cateye, Abus, RST.', 'cyklocentrum.cz', 'http://cyklocentrum.cz', 1, 1, 1, 2, 'Kola za super ceny...', b'1', NULL, '2014-03-30 09:16:48', NULL, NULL),
(3, 0, '', '', '', '', '', '', '', 'Rychlov', '', '', '', '', '99999', '', 'Rychlová 16', 'Položka odkaz na mapy', '', 'Richard', 'Pan', 'Rychlý', '', ' Zkouším založit prodejce a nastavit mu oprávnění', 'Testovací prodejce', '', 1, 1, 1, 2, '', b'1', '2014-05-04 09:25:38', '2014-05-04 09:25:38', 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `SellerPhotoUrl`
--

CREATE TABLE IF NOT EXISTS `SellerPhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `contentType` varchar(20) DEFAULT NULL,
  `fileName` varchar(20) DEFAULT NULL,
  `SELLER_ID` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `CREATED_ID` bigint(20) DEFAULT NULL,
  `LAST_MODIFIED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK83609A9CF66C8014` (`SELLER_ID`),
  KEY `FK_jg91bebjv9v12hfktbiombq5a` (`CREATED_ID`),
  KEY `FK_jfmladf1u9j6bak3igj2bfev1` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `SellerPhotoUrl`
--

INSERT INTO `SellerPhotoUrl` (`id`, `version`, `contentType`, `fileName`, `SELLER_ID`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, 0, 'image/jpeg', 'Lighthouse.jpg', 1, '2014-03-30 09:04:27', '2014-03-30 09:04:27', NULL, NULL),
(4, 0, 'image/jpeg', 'Desert.jpg', 2, '2014-03-30 09:05:07', '2014-03-30 09:05:07', NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `FK_qxh70nwap22dbi0dspkd36jm7` (`CREATED_ID`),
  KEY `FK_8w1ct97q2grkdqp8cqtdoafw4` (`LAST_MODIFIED_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `SellerStatus`
--

INSERT INTO `SellerStatus` (`id`, `version`, `codeDescription`, `codeKey`, `priority`, `created`, `lastModified`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, 0, 'VIP', 'sellst_vip', 100, NULL, NULL, NULL, NULL),
(2, 1, 'Běžný prodejce', 'sellst_ord', 20, NULL, NULL, NULL, NULL);

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
