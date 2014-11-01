-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Sobota 01. listopadu 2014, 18:12
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_ROLE`
--

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
  KEY `FK_apkcgpjmemvnsc1brda4et6cx` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_ROLE_PERMISSION`
--

CREATE TABLE IF NOT EXISTS `APPLICATION_ROLE_PERMISSION` (
  `ROLE_ID` bigint(20) NOT NULL,
  `PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK_l467vw6jhwo522b3ef8ovgkor` (`PERMISSION_ID`),
  KEY `FK_msjrjy23nvkle00037evqd9ef` (`ROLE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER`
--

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
  KEY `FK_ot68oi4hpc4jt6fkayj6f4qxc` (`CREATED_ID`),
  KEY `FK_48416r9emtcor7pdprhgg1w1d` (`LAST_MODIFIED_ID`),
  KEY `FK_k024d3p5mjfqhbu70g4t3thxy` (`SELLER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

ALTER TABLE  `APPLICATION_USER` ADD INDEX (  `USERNAME` );

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_ADDRESS`
--

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
  KEY `FK_tier8ryaokcxl0o9fgoh4p5wa` (`COUNTRY_STATE_ID`),
  KEY `FK_r7bbccy3owg6qmctbr03te1tb` (`CREATED_ID`),
  KEY `FK_kympp6yykvtws3v1k619bids4` (`LAST_MODIFIED_ID`),
  KEY `FK_1lkhdy5ej6aur9985jqfh8pxs` (`APPLICATION_USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_PHOTO`
--

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
  KEY `FK_ny675dekdd2rk8ujtc6nmqea8` (`APPLICATION_USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `APPLICATION_USER_ROLE`
--

CREATE TABLE IF NOT EXISTS `APPLICATION_USER_ROLE` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK_fvy2dr55uu61y45vcl97u336y` (`ROLE_ID`),
  KEY `FK_21d31gwey0t8tqpkt3jjsca74` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `BICYCLE_CATEGORY`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `CATEGORY`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `CATEGORY_TYPE`
--

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
  KEY `FK_g9f8yev3stq33vdfhjv62k1px` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `COUNTRY_STATE`
--

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
  KEY `FK_2pmgyopqb0clmuanf77vq4wke` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `FIGURE_HEIGHT`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `NEWS_ITEM`
--

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
  KEY `FK_htwlgse9e60unyni021stcgmw` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `NEWS_ITEM_PHOTO_URL`
--

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
  KEY `FK_dy4o2opondpbbob7q9u7idahy` (`NEWSITEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PHOTO_URL`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE`
--

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
  `DESCRIPTION` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
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
  KEY `FK_gd4td1k10n6v30tm3a2dr8lyg` (`CREATED_ID`),
  KEY `FK_p1hwtjuhnopvj2at3hf8fwbu3` (`LAST_MODIFIED_ID`),
  KEY `FK_ri7u7ytu03mt38ly2f54pa6nw` (`COUNTRY_STATE_ID`),
  KEY `FK_9to8pj3jys8vpckoefxd9bxrh` (`OWNER_ID`),
  KEY `FK_7e3xc9na32f4vtkcaeqe1wub` (`PLACE_TYPE_ID`),
  KEY `FK_mgst3mvw1k918de2tt6x9g0ch` (`REGION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_COMMENT`
--

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
  KEY `FK_my6q5esbvd72ji2f1ewe9wdch` (`PLACE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_PHOTO_URL`
--

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
  KEY `FK_m8mb87jyvlsu3ircc9ofqcga2` (`PLACE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PLACE_TYPE`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCER`
--

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
  KEY `FK_21juuudrqcggvhfpptvejayni` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT`
--

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
  KEY `FK_h1mudty2asxysiyi74ir30spv` (`CREATED_ID`),
  KEY `FK_dvx56wdl9qapvlfqumc05c4oe` (`LAST_MODIFIED_ID`),
  KEY `FK_oc5ooeca0l6gimle8uo979jwe` (`BICYCLE_CATEGORY_ID`),
  KEY `FK_6t6fwpoax5485lfta1ha89rlh` (`CATEGORY_ID`),
  KEY `FK_hqwmmht0gcdpnlrpbg7do7ir7` (`PRODUCT_ID`),
  KEY `FK_mat3d1nlrjhsdyq9eu9wplbsx` (`FIGURE_HEIGHT_ID`),
  KEY `FK_p4tbeci5384m88ypcrouapxtc` (`PRODUCER_ID`),
  KEY `FK_ikr28obncik165j8dlmkcocit` (`PRODUCT_COLOR_ID`),
  KEY `FK_ovmxhqqkejg87xt23y7pkn4t` (`PRODUCT_USAGE_ID`),
  KEY `FK_e7x61n614plid9vikljs1u5ut` (`SELLER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

ALTER TABLE  `PRODUCT` ADD INDEX (  `VALID_FROM` );
ALTER TABLE  `PRODUCT` ADD INDEX (  `VALID_TO` );
ALTER TABLE  `PRODUCT` ADD INDEX (  `ENABLED` );

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_ATTRIBUTE`
--

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
  KEY `FK_onscn5vlf8boou38pvxooqbmd` (`CREATED_ID`),
  KEY `FK_jigly7glwaisxgnvxjvilhak0` (`LAST_MODIFIED_ID`),
  KEY `FK_cdugk8tgii0svs97t787exkm8` (`ATTRIBUTE_TYPE_ID`),
  KEY `FK_6h8m6ocg2jhu3bfieqa0dupb1` (`PRODUCT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_ATTRIBUTE_TYPE`
--

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
  KEY `FK_c49l7fsj3jj00hr7w8tqk7peh` (`CATEGORY_TYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_COLOR`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_COMMENT`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `PRODUCT_USAGE`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `RATE`
--

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
  KEY `FK_acb1vjrdtxr36erwi3663x9pk` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

ALTER TABLE  `RATE` ADD INDEX (  `ENTITY_ID` );
ALTER TABLE  `RATE` ADD INDEX (  `RATE_TYPE` );

-- --------------------------------------------------------

--
-- Struktura tabulky `REGION`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `REGISTRATION_REQUEST`
--

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
  KEY `FK_qw090r8xfeko91802tdghs0qx` (`LAST_MODIFIED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER`
--

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
  KEY `FK_a1vaxq533fxecndx02tu30jpr` (`SELLER_STATUS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

ALTER TABLE  `SELLER` ADD INDEX (  `ENABLED` );

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_ADDRESS`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_PHOTO_URL`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `SELLER_STATUS`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `VISITOR_ACTIVITY_LOG`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;
