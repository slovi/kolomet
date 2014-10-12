-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Neděle 05. října 2014, 15:51
-- Verze MySQL: 5.1.73
-- Verze PHP: 5.3.3-7+squeeze19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: 'kolomet'
--

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_permission'
--

DROP TABLE IF EXISTS application_permission;
CREATE TABLE application_permission (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  PERMISSION_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_6mmupjr60urw0ywlj79mhc9dy (CREATED_ID),
  KEY FK_c5dwvyeqbenhloc2eptj10lok (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_PERMISSION'
--

DROP TABLE IF EXISTS APPLICATION_PERMISSION;
CREATE TABLE APPLICATION_PERMISSION (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  PERMISSION_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_6mmupjr60urw0ywlj79mhc9dy (CREATED_ID),
  KEY FK_c5dwvyeqbenhloc2eptj10lok (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_role'
--

DROP TABLE IF EXISTS application_role;
CREATE TABLE application_role (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ROLE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_kyavgp495u0hx0ccnfdxra6oe (CREATED_ID),
  KEY FK_apkcgpjmemvnsc1brda4et6cx (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_ROLE'
--

DROP TABLE IF EXISTS APPLICATION_ROLE;
CREATE TABLE APPLICATION_ROLE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ROLE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_kyavgp495u0hx0ccnfdxra6oe (CREATED_ID),
  KEY FK_apkcgpjmemvnsc1brda4et6cx (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_ROLE_PERMISSION'
--

DROP TABLE IF EXISTS APPLICATION_ROLE_PERMISSION;
CREATE TABLE APPLICATION_ROLE_PERMISSION (
  ROLE_ID bigint(20) NOT NULL,
  PERMISSION_ID bigint(20) NOT NULL,
  KEY FK_l467vw6jhwo522b3ef8ovgkor (PERMISSION_ID),
  KEY FK_msjrjy23nvkle00037evqd9ef (ROLE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_role_permission'
--

DROP TABLE IF EXISTS application_role_permission;
CREATE TABLE application_role_permission (
  ROLE_ID bigint(20) NOT NULL,
  PERMISSION_ID bigint(20) NOT NULL,
  KEY FK_l467vw6jhwo522b3ef8ovgkor (PERMISSION_ID),
  KEY FK_msjrjy23nvkle00037evqd9ef (ROLE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_user'
--

DROP TABLE IF EXISTS application_user;
CREATE TABLE application_user (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONDITION_AGREEMENT datetime DEFAULT NULL,
  CONDITION_VERSION varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  ENABLED bit(1) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PHONE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  SURNAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  TOKEN varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  USERNAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  NICKNAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_ot68oi4hpc4jt6fkayj6f4qxc (CREATED_ID),
  KEY FK_48416r9emtcor7pdprhgg1w1d (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_USER'
--

DROP TABLE IF EXISTS APPLICATION_USER;
CREATE TABLE APPLICATION_USER (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONDITION_AGREEMENT datetime DEFAULT NULL,
  CONDITION_VERSION varchar(255) DEFAULT NULL,
  ENABLED bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  NICKNAME varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PHONE varchar(255) DEFAULT NULL,
  SURNAME varchar(255) DEFAULT NULL,
  TOKEN varchar(255) DEFAULT NULL,
  USERNAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_ot68oi4hpc4jt6fkayj6f4qxc (CREATED_ID),
  KEY FK_48416r9emtcor7pdprhgg1w1d (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_USER_ADDRESS'
--

DROP TABLE IF EXISTS APPLICATION_USER_ADDRESS;
CREATE TABLE APPLICATION_USER_ADDRESS (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CITY varchar(255) DEFAULT NULL,
  HOUSE_NR varchar(255) DEFAULT NULL,
  POST_CODE varchar(255) DEFAULT NULL,
  STREET varchar(255) DEFAULT NULL,
  ADDRESS_TYPE int(11) DEFAULT NULL,
  CREATED datetime DEFAULT NULL,
  DEGREE varchar(255) DEFAULT NULL,
  EMAIL varchar(255) DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PHONE_NUMBER varchar(255) DEFAULT NULL,
  SALUTATION varchar(255) DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  COUNTRY_STATE_ID bigint(20) NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  APPLICATION_USER_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_tier8ryaokcxl0o9fgoh4p5wa (COUNTRY_STATE_ID),
  KEY FK_r7bbccy3owg6qmctbr03te1tb (CREATED_ID),
  KEY FK_kympp6yykvtws3v1k619bids4 (LAST_MODIFIED_ID),
  KEY FK_1lkhdy5ej6aur9985jqfh8pxs (APPLICATION_USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_user_address'
--

DROP TABLE IF EXISTS application_user_address;
CREATE TABLE application_user_address (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ADDRESS_TYPE int(11) DEFAULT NULL,
  CITY varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  DEGREE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  EMAIL varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  HOUSE_NR int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PHONE_NUMBER varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  POST_CODE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  SALUTATION varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  STREET varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  APPLICATION_USER_ID bigint(20) DEFAULT NULL,
  COUNTRY_STATE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_r7bbccy3owg6qmctbr03te1tb (CREATED_ID),
  KEY FK_kympp6yykvtws3v1k619bids4 (LAST_MODIFIED_ID),
  KEY FK_1lkhdy5ej6aur9985jqfh8pxs (APPLICATION_USER_ID),
  KEY FK_tier8ryaokcxl0o9fgoh4p5wa (COUNTRY_STATE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_user_photo'
--

DROP TABLE IF EXISTS application_user_photo;
CREATE TABLE application_user_photo (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  FILE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  APPLICATION_USER_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_oftbtl900i2xutpnneehx2h5d (CREATED_ID),
  KEY FK_srjii7bqdp9emnug5c7043d4x (LAST_MODIFIED_ID),
  KEY FK_ny675dekdd2rk8ujtc6nmqea8 (APPLICATION_USER_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_USER_PHOTO'
--

DROP TABLE IF EXISTS APPLICATION_USER_PHOTO;
CREATE TABLE APPLICATION_USER_PHOTO (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) DEFAULT NULL,
  FILE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  APPLICATION_USER_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_oftbtl900i2xutpnneehx2h5d (CREATED_ID),
  KEY FK_srjii7bqdp9emnug5c7043d4x (LAST_MODIFIED_ID),
  KEY FK_ny675dekdd2rk8ujtc6nmqea8 (APPLICATION_USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'application_user_role'
--

DROP TABLE IF EXISTS application_user_role;
CREATE TABLE application_user_role (
  USER_ID bigint(20) NOT NULL,
  ROLE_ID bigint(20) NOT NULL,
  KEY FK_fvy2dr55uu61y45vcl97u336y (ROLE_ID),
  KEY FK_21d31gwey0t8tqpkt3jjsca74 (USER_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'APPLICATION_USER_ROLE'
--

DROP TABLE IF EXISTS APPLICATION_USER_ROLE;
CREATE TABLE APPLICATION_USER_ROLE (
  USER_ID bigint(20) NOT NULL,
  ROLE_ID bigint(20) NOT NULL,
  KEY FK_fvy2dr55uu61y45vcl97u336y (ROLE_ID),
  KEY FK_21d31gwey0t8tqpkt3jjsca74 (USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'BICYCLE_CATEGORY'
--

DROP TABLE IF EXISTS BICYCLE_CATEGORY;
CREATE TABLE BICYCLE_CATEGORY (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_hp1u6dy2x0gyohvkmgnfe1lub (CREATED_ID),
  KEY FK_q34d2355sptbvsiehbbhotfb6 (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'bicycle_category'
--

DROP TABLE IF EXISTS bicycle_category;
CREATE TABLE bicycle_category (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_hp1u6dy2x0gyohvkmgnfe1lub (CREATED_ID),
  KEY FK_q34d2355sptbvsiehbbhotfb6 (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'category'
--

DROP TABLE IF EXISTS category;
CREATE TABLE category (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  CATEGORY_TYPE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_23xgluwltibdgxigv1vcqsxm7 (CREATED_ID),
  KEY FK_btpmok2rj7ti0a2rj9bk4ie3d (LAST_MODIFIED_ID),
  KEY FK_hybvs6iml7t18iq3u4hc0ui8s (CATEGORY_TYPE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'CATEGORY'
--

DROP TABLE IF EXISTS CATEGORY;
CREATE TABLE CATEGORY (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  CATEGORY_TYPE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_23xgluwltibdgxigv1vcqsxm7 (CREATED_ID),
  KEY FK_btpmok2rj7ti0a2rj9bk4ie3d (LAST_MODIFIED_ID),
  KEY FK_hybvs6iml7t18iq3u4hc0ui8s (CATEGORY_TYPE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'category_type'
--

DROP TABLE IF EXISTS category_type;
CREATE TABLE category_type (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_tcg900co137gb1ojjnsq0kqgk (CREATED_ID),
  KEY FK_g9f8yev3stq33vdfhjv62k1px (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'CATEGORY_TYPE'
--

DROP TABLE IF EXISTS CATEGORY_TYPE;
CREATE TABLE CATEGORY_TYPE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_tcg900co137gb1ojjnsq0kqgk (CREATED_ID),
  KEY FK_g9f8yev3stq33vdfhjv62k1px (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'country_state'
--

DROP TABLE IF EXISTS country_state;
CREATE TABLE country_state (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_t2jxuvyhrbg179egfqgoloigr (CREATED_ID),
  KEY FK_2pmgyopqb0clmuanf77vq4wke (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'COUNTRY_STATE'
--

DROP TABLE IF EXISTS COUNTRY_STATE;
CREATE TABLE COUNTRY_STATE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_t2jxuvyhrbg179egfqgoloigr (CREATED_ID),
  KEY FK_2pmgyopqb0clmuanf77vq4wke (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'FIGURE_HEIGHT'
--

DROP TABLE IF EXISTS FIGURE_HEIGHT;
CREATE TABLE FIGURE_HEIGHT (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_am3bpj3iq9bekg17r0twhfjrk (CREATED_ID),
  KEY FK_b1o7nvqwlnfv7nlhk3s9ow62d (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'figure_height'
--

DROP TABLE IF EXISTS figure_height;
CREATE TABLE figure_height (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_am3bpj3iq9bekg17r0twhfjrk (CREATED_ID),
  KEY FK_b1o7nvqwlnfv7nlhk3s9ow62d (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'news_item'
--

DROP TABLE IF EXISTS news_item;
CREATE TABLE news_item (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ENABLED bit(1) NOT NULL,
  NEWS_ITEM_DATE datetime DEFAULT NULL,
  NEWS_ITEM_TYPE int(11) DEFAULT NULL,
  `TEXT` longtext COLLATE utf8_czech_ci NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_loc6p9w7owyae6emyuaakrvbu (CREATED_ID),
  KEY FK_htwlgse9e60unyni021stcgmw (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'NEWS_ITEM'
--

DROP TABLE IF EXISTS NEWS_ITEM;
CREATE TABLE NEWS_ITEM (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ENABLED bit(1) NOT NULL,
  NEWS_ITEM_DATE datetime DEFAULT NULL,
  NEWS_ITEM_TYPE int(11) DEFAULT NULL,
  `TEXT` longtext NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_loc6p9w7owyae6emyuaakrvbu (CREATED_ID),
  KEY FK_htwlgse9e60unyni021stcgmw (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'news_item_photo_url'
--

DROP TABLE IF EXISTS news_item_photo_url;
CREATE TABLE news_item_photo_url (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  FILE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  NEWSITEM_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_71vu9u8rai1wj1vfoi0lfci0y (CREATED_ID),
  KEY FK_242mmqq0ni1cu3fvkvnc5ev2a (LAST_MODIFIED_ID),
  KEY FK_dy4o2opondpbbob7q9u7idahy (NEWSITEM_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'NEWS_ITEM_PHOTO_URL'
--

DROP TABLE IF EXISTS NEWS_ITEM_PHOTO_URL;
CREATE TABLE NEWS_ITEM_PHOTO_URL (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) DEFAULT NULL,
  FILE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  NEWSITEM_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_71vu9u8rai1wj1vfoi0lfci0y (CREATED_ID),
  KEY FK_242mmqq0ni1cu3fvkvnc5ev2a (LAST_MODIFIED_ID),
  KEY FK_dy4o2opondpbbob7q9u7idahy (NEWSITEM_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'photo_url'
--

DROP TABLE IF EXISTS photo_url;
CREATE TABLE photo_url (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  FILE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRODUCT_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_2m4wackfms2acxts0brutm99d (CREATED_ID),
  KEY FK_hh74m0gl9w0ex7ct4f8jpvorh (LAST_MODIFIED_ID),
  KEY FK_ok94liy1e5n1xxxr58f4t14fv (PRODUCT_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PHOTO_URL'
--

DROP TABLE IF EXISTS PHOTO_URL;
CREATE TABLE PHOTO_URL (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) DEFAULT NULL,
  FILE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRODUCT_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_2m4wackfms2acxts0brutm99d (CREATED_ID),
  KEY FK_hh74m0gl9w0ex7ct4f8jpvorh (LAST_MODIFIED_ID),
  KEY FK_ok94liy1e5n1xxxr58f4t14fv (PRODUCT_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PLACE'
--

DROP TABLE IF EXISTS PLACE;
CREATE TABLE PLACE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CITY varchar(255) DEFAULT NULL,
  HOUSE_NR varchar(255) DEFAULT NULL,
  POST_CODE varchar(255) DEFAULT NULL,
  STREET varchar(255) DEFAULT NULL,
  BIKE_ROAD_NR varchar(255) DEFAULT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  DESCRIPTION_LINK varchar(255) DEFAULT NULL,
  NORTH double DEFAULT NULL,
  WEST double DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  NR_OF_RANKINGS int(11) DEFAULT NULL,
  QUALITY_RANKING double DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  COUNTRY_STATE_ID bigint(20) DEFAULT NULL,
  PLACE_TYPE_ID bigint(20) NOT NULL,
  REGION_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_gd4td1k10n6v30tm3a2dr8lyg (CREATED_ID),
  KEY FK_p1hwtjuhnopvj2at3hf8fwbu3 (LAST_MODIFIED_ID),
  KEY FK_ri7u7ytu03mt38ly2f54pa6nw (COUNTRY_STATE_ID),
  KEY FK_7e3xc9na32f4vtkcaeqe1wub (PLACE_TYPE_ID),
  KEY FK_mgst3mvw1k918de2tt6x9g0ch (REGION_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'place'
--

DROP TABLE IF EXISTS place;
CREATE TABLE place (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  BIKE_ROAD_NR varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  DESCRIPTION varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  DESCRIPTION_LINK varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  NR_OF_RANKINGS int(11) DEFAULT NULL,
  QUALITY_RANKING double DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PLACE_TYPE_ID bigint(20) NOT NULL,
  REGION_ID bigint(20) NOT NULL,
  CITY varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  HOUSE_NR varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  POST_CODE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  STREET varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  NORTH double DEFAULT NULL,
  WEST double DEFAULT NULL,
  COUNTRY_STATE_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_gd4td1k10n6v30tm3a2dr8lyg (CREATED_ID),
  KEY FK_p1hwtjuhnopvj2at3hf8fwbu3 (LAST_MODIFIED_ID),
  KEY FK_7e3xc9na32f4vtkcaeqe1wub (PLACE_TYPE_ID),
  KEY FK_mgst3mvw1k918de2tt6x9g0ch (REGION_ID),
  KEY FK_ri7u7ytu03mt38ly2f54pa6nw (COUNTRY_STATE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'place_comment'
--

DROP TABLE IF EXISTS place_comment;
CREATE TABLE place_comment (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PARENT_ID bigint(20) DEFAULT NULL,
  PLACE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_hbquro7jljerfp8lulkte1yey (CREATED_ID),
  KEY FK_ajrabpp2wf6nsd1b2vdo84ors (LAST_MODIFIED_ID),
  KEY FK_7iefirxym9bgarret3lkksknf (PARENT_ID),
  KEY FK_my6q5esbvd72ji2f1ewe9wdch (PLACE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PLACE_COMMENT'
--

DROP TABLE IF EXISTS PLACE_COMMENT;
CREATE TABLE PLACE_COMMENT (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  `TEXT` varchar(255) NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PARENT_ID bigint(20) DEFAULT NULL,
  PLACE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_hbquro7jljerfp8lulkte1yey (CREATED_ID),
  KEY FK_ajrabpp2wf6nsd1b2vdo84ors (LAST_MODIFIED_ID),
  KEY FK_7iefirxym9bgarret3lkksknf (PARENT_ID),
  KEY FK_my6q5esbvd72ji2f1ewe9wdch (PLACE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'place_photo_url'
--

DROP TABLE IF EXISTS place_photo_url;
CREATE TABLE place_photo_url (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  FILE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PLACE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_dkptru7v2fl68ktapm0kv4ste (CREATED_ID),
  KEY FK_bo5cgle90q88rgyayct5sxu45 (LAST_MODIFIED_ID),
  KEY FK_m8mb87jyvlsu3ircc9ofqcga2 (PLACE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PLACE_PHOTO_URL'
--

DROP TABLE IF EXISTS PLACE_PHOTO_URL;
CREATE TABLE PLACE_PHOTO_URL (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) DEFAULT NULL,
  FILE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PLACE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_dkptru7v2fl68ktapm0kv4ste (CREATED_ID),
  KEY FK_bo5cgle90q88rgyayct5sxu45 (LAST_MODIFIED_ID),
  KEY FK_m8mb87jyvlsu3ircc9ofqcga2 (PLACE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'place_type'
--

DROP TABLE IF EXISTS place_type;
CREATE TABLE place_type (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  PLACE_TYPE_COLOR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_i4c0mvdcuo72pjefac6sg2sou (CREATED_ID),
  KEY FK_mh1fy92k29vil9c8mpaad8rkd (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PLACE_TYPE'
--

DROP TABLE IF EXISTS PLACE_TYPE;
CREATE TABLE PLACE_TYPE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  PLACE_TYPE_COLOR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_i4c0mvdcuo72pjefac6sg2sou (CREATED_ID),
  KEY FK_mh1fy92k29vil9c8mpaad8rkd (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'producer'
--

DROP TABLE IF EXISTS producer;
CREATE TABLE producer (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_tm7ly8b339h4u325qhv0hdh8w (CREATED_ID),
  KEY FK_21juuudrqcggvhfpptvejayni (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCER'
--

DROP TABLE IF EXISTS PRODUCER;
CREATE TABLE PRODUCER (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_tm7ly8b339h4u325qhv0hdh8w (CREATED_ID),
  KEY FK_21juuudrqcggvhfpptvejayni (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT'
--

DROP TABLE IF EXISTS PRODUCT;
CREATE TABLE PRODUCT (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  BUY_URL varchar(255) NOT NULL,
  CAN_SEND_TO_ALL_COUNTRY bit(1) DEFAULT NULL,
  DELIVERY_FOR_FREE bit(1) DEFAULT NULL,
  DESCRIPTION longtext,
  DISCOUNT decimal(19,2) DEFAULT NULL,
  ENABLED bit(1) DEFAULT NULL,
  FINAL_PRICE decimal(19,2) NOT NULL,
  PRICE decimal(19,2) DEFAULT NULL,
  PRODUCT_NAME varchar(50) NOT NULL,
  PRODUCT_STATE int(11) DEFAULT NULL,
  VALID_FROM datetime DEFAULT NULL,
  VALID_TO datetime DEFAULT NULL,
  WEIGHT double NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  BICYCLE_CATEGORY_ID bigint(20) DEFAULT NULL,
  CATEGORY_ID bigint(20) DEFAULT NULL,
  PRODUCT_ID bigint(20) DEFAULT NULL,
  FIGURE_HEIGHT_ID bigint(20) DEFAULT NULL,
  PRODUCER_ID bigint(20) DEFAULT NULL,
  PRODUCT_COLOR_ID bigint(20) DEFAULT NULL,
  PRODUCT_USAGE_ID bigint(20) DEFAULT NULL,
  SELLER_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_h1mudty2asxysiyi74ir30spv (CREATED_ID),
  KEY FK_dvx56wdl9qapvlfqumc05c4oe (LAST_MODIFIED_ID),
  KEY FK_oc5ooeca0l6gimle8uo979jwe (BICYCLE_CATEGORY_ID),
  KEY FK_6t6fwpoax5485lfta1ha89rlh (CATEGORY_ID),
  KEY FK_hqwmmht0gcdpnlrpbg7do7ir7 (PRODUCT_ID),
  KEY FK_mat3d1nlrjhsdyq9eu9wplbsx (FIGURE_HEIGHT_ID),
  KEY FK_p4tbeci5384m88ypcrouapxtc (PRODUCER_ID),
  KEY FK_ikr28obncik165j8dlmkcocit (PRODUCT_COLOR_ID),
  KEY FK_ovmxhqqkejg87xt23y7pkn4t (PRODUCT_USAGE_ID),
  KEY FK_e7x61n614plid9vikljs1u5ut (SELLER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product'
--

DROP TABLE IF EXISTS product;
CREATE TABLE product (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  BUY_URL varchar(255) COLLATE utf8_czech_ci NOT NULL,
  CAN_SEND_TO_ALL_COUNTRY bit(1) DEFAULT NULL,
  DELIVERY_FOR_FREE bit(1) DEFAULT NULL,
  DESCRIPTION longtext COLLATE utf8_czech_ci,
  DISCOUNT decimal(19,2) DEFAULT NULL,
  ENABLED bit(1) DEFAULT NULL,
  FINAL_PRICE decimal(19,2) NOT NULL,
  PRICE decimal(19,2) DEFAULT NULL,
  PRODUCT_NAME varchar(50) COLLATE utf8_czech_ci NOT NULL,
  PRODUCT_STATE int(11) DEFAULT NULL,
  VALID_FROM datetime DEFAULT NULL,
  VALID_TO datetime DEFAULT NULL,
  WEIGHT double NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRODUCT_ID bigint(20) DEFAULT NULL,
  BICYCLE_CATEGORY_ID bigint(20) DEFAULT NULL,
  CATEGORY_ID bigint(20) DEFAULT NULL,
  FIGURE_HEIGHT_ID bigint(20) DEFAULT NULL,
  PRODUCER_ID bigint(20) DEFAULT NULL,
  PRODUCT_COLOR_ID bigint(20) DEFAULT NULL,
  PRODUCT_USAGE_ID bigint(20) DEFAULT NULL,
  SELLER_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_h1mudty2asxysiyi74ir30spv (CREATED_ID),
  KEY FK_dvx56wdl9qapvlfqumc05c4oe (LAST_MODIFIED_ID),
  KEY FK_hqwmmht0gcdpnlrpbg7do7ir7 (PRODUCT_ID),
  KEY FK_oc5ooeca0l6gimle8uo979jwe (BICYCLE_CATEGORY_ID),
  KEY FK_6t6fwpoax5485lfta1ha89rlh (CATEGORY_ID),
  KEY FK_mat3d1nlrjhsdyq9eu9wplbsx (FIGURE_HEIGHT_ID),
  KEY FK_p4tbeci5384m88ypcrouapxtc (PRODUCER_ID),
  KEY FK_ikr28obncik165j8dlmkcocit (PRODUCT_COLOR_ID),
  KEY FK_ovmxhqqkejg87xt23y7pkn4t (PRODUCT_USAGE_ID),
  KEY FK_e7x61n614plid9vikljs1u5ut (SELLER_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product_attribute'
--

DROP TABLE IF EXISTS product_attribute;
CREATE TABLE product_attribute (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ATTRIBUTE_VALUE varchar(255) COLLATE utf8_czech_ci NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRODUCT_ID bigint(20) NOT NULL,
  ATTRIBUTE_TYPE_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_onscn5vlf8boou38pvxooqbmd (CREATED_ID),
  KEY FK_jigly7glwaisxgnvxjvilhak0 (LAST_MODIFIED_ID),
  KEY FK_6h8m6ocg2jhu3bfieqa0dupb1 (PRODUCT_ID),
  KEY FK_cdugk8tgii0svs97t787exkm8 (ATTRIBUTE_TYPE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT_ATTRIBUTE'
--

DROP TABLE IF EXISTS PRODUCT_ATTRIBUTE;
CREATE TABLE PRODUCT_ATTRIBUTE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ATTRIBUTE_VALUE varchar(255) NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  ATTRIBUTE_TYPE_ID bigint(20) NOT NULL,
  PRODUCT_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_onscn5vlf8boou38pvxooqbmd (CREATED_ID),
  KEY FK_jigly7glwaisxgnvxjvilhak0 (LAST_MODIFIED_ID),
  KEY FK_cdugk8tgii0svs97t787exkm8 (ATTRIBUTE_TYPE_ID),
  KEY FK_6h8m6ocg2jhu3bfieqa0dupb1 (PRODUCT_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product_attribute_type'
--

DROP TABLE IF EXISTS product_attribute_type;
CREATE TABLE product_attribute_type (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  REQUIRED bit(1) DEFAULT NULL,
  UNITS varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  CATEGORY_TYPE_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_mbl5lgsvkudd9o5ibjpop0blb (CREATED_ID),
  KEY FK_l1smb5oyq0svfltyt4c0qvv3m (LAST_MODIFIED_ID),
  KEY FK_c49l7fsj3jj00hr7w8tqk7peh (CATEGORY_TYPE_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT_ATTRIBUTE_TYPE'
--

DROP TABLE IF EXISTS PRODUCT_ATTRIBUTE_TYPE;
CREATE TABLE PRODUCT_ATTRIBUTE_TYPE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  REQUIRED bit(1) DEFAULT NULL,
  UNITS varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  CATEGORY_TYPE_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_mbl5lgsvkudd9o5ibjpop0blb (CREATED_ID),
  KEY FK_l1smb5oyq0svfltyt4c0qvv3m (LAST_MODIFIED_ID),
  KEY FK_c49l7fsj3jj00hr7w8tqk7peh (CATEGORY_TYPE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product_color'
--

DROP TABLE IF EXISTS product_color;
CREATE TABLE product_color (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_fhbbt4a4ivx4gghpu8uocgbv (CREATED_ID),
  KEY FK_hpcmjjdvptxf0xy952m5tqep8 (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT_COLOR'
--

DROP TABLE IF EXISTS PRODUCT_COLOR;
CREATE TABLE PRODUCT_COLOR (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_fhbbt4a4ivx4gghpu8uocgbv (CREATED_ID),
  KEY FK_hpcmjjdvptxf0xy952m5tqep8 (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product_comment'
--

DROP TABLE IF EXISTS product_comment;
CREATE TABLE product_comment (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_jpt7usvsn3h869cret1uba2hr (CREATED_ID),
  KEY FK_lq7ng0nthdvxqjbefd1sfig74 (LAST_MODIFIED_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT_COMMENT'
--

DROP TABLE IF EXISTS PRODUCT_COMMENT;
CREATE TABLE PRODUCT_COMMENT (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  `TEXT` varchar(255) NOT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_jpt7usvsn3h869cret1uba2hr (CREATED_ID),
  KEY FK_lq7ng0nthdvxqjbefd1sfig74 (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'PRODUCT_USAGE'
--

DROP TABLE IF EXISTS PRODUCT_USAGE;
CREATE TABLE PRODUCT_USAGE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_7jc95wc5783ojo2xbmk31cyv8 (CREATED_ID),
  KEY FK_n7fjcq4k3mo7140gd70ql7x3 (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'product_usage'
--

DROP TABLE IF EXISTS product_usage;
CREATE TABLE product_usage (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_7jc95wc5783ojo2xbmk31cyv8 (CREATED_ID),
  KEY FK_n7fjcq4k3mo7140gd70ql7x3 (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'RATE'
--

DROP TABLE IF EXISTS RATE;
CREATE TABLE RATE (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ENTITY_ID bigint(20) DEFAULT NULL,
  IP_ADDRESS varchar(255) DEFAULT NULL,
  RATE_TYPE int(11) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_r8tq3l1asnnegemgqb74io4i7 (CREATED_ID),
  KEY FK_acb1vjrdtxr36erwi3663x9pk (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'rate'
--

DROP TABLE IF EXISTS rate;
CREATE TABLE rate (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  ENTITY_ID bigint(20) DEFAULT NULL,
  IP_ADDRESS varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  RATE_TYPE int(11) DEFAULT NULL,
  `VALUE` int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_r8tq3l1asnnegemgqb74io4i7 (CREATED_ID),
  KEY FK_acb1vjrdtxr36erwi3663x9pk (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'REGION'
--

DROP TABLE IF EXISTS REGION;
CREATE TABLE REGION (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  GOOGLE_ALIAS varchar(255) DEFAULT NULL,
  NORTH double DEFAULT NULL,
  WEST double DEFAULT NULL,
  ZOOM int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_iacpokgk2trq8d5ti0cakkn3t (CREATED_ID),
  KEY FK_ldyl6246ebdhl6xujw00sgoq3 (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'region'
--

DROP TABLE IF EXISTS region;
CREATE TABLE region (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  GOOGLE_ALIAS varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  NORTH double DEFAULT NULL,
  WEST double DEFAULT NULL,
  ZOOM int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_iacpokgk2trq8d5ti0cakkn3t (CREATED_ID),
  KEY FK_ldyl6246ebdhl6xujw00sgoq3 (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'REGISTRATION_REQUEST'
--

DROP TABLE IF EXISTS REGISTRATION_REQUEST;
CREATE TABLE REGISTRATION_REQUEST (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CAPTCHA_TEXT varchar(255) DEFAULT NULL,
  EMAIL varchar(255) NOT NULL,
  PHONE varchar(255) NOT NULL,
  PROCESSED bit(1) DEFAULT NULL,
  `TEXT` varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_4lt98qpyqkbtb5kwjhbnq2gsi (CREATED_ID),
  KEY FK_qw090r8xfeko91802tdghs0qx (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'registration_request'
--

DROP TABLE IF EXISTS registration_request;
CREATE TABLE registration_request (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CAPTCHA_TEXT varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  EMAIL varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PHONE varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PROCESSED bit(1) DEFAULT NULL,
  `TEXT` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_4lt98qpyqkbtb5kwjhbnq2gsi (CREATED_ID),
  KEY FK_qw090r8xfeko91802tdghs0qx (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'seller'
--

DROP TABLE IF EXISTS seller;
CREATE TABLE seller (
  MAP_URL varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PERSON_DEGREE varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PERSON_NAME varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PERSON_SALUTATION varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  PERSON_SURNAME varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  SALE_TYPE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  SELLER_DESCRIPTION longtext COLLATE utf8_czech_ci NOT NULL,
  SELLER_NAME varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SELLER_TITLE varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  WEB varchar(255) COLLATE utf8_czech_ci NOT NULL,
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  REGION_ID bigint(20) NOT NULL,
  SELLER_STATUS_ID bigint(20) DEFAULT NULL,
  ID_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_jbfv0uw21rhbem1ky6xt4a62e (REGION_ID),
  KEY FK_a1vaxq533fxecndx02tu30jpr (SELLER_STATUS_ID),
  KEY FK_lcjr7ts5qxohcfxwju4cj7a2j (ID_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'SELLER'
--

DROP TABLE IF EXISTS SELLER;
CREATE TABLE SELLER (
  MAP_URL varchar(255) DEFAULT NULL,
  PERSON_DEGREE varchar(20) DEFAULT NULL,
  PERSON_NAME varchar(20) DEFAULT NULL,
  PERSON_SALUTATION varchar(20) DEFAULT NULL,
  PERSON_SURNAME varchar(20) DEFAULT NULL,
  SALE_TYPE varchar(255) DEFAULT NULL,
  SELLER_DESCRIPTION longtext NOT NULL,
  SELLER_NAME varchar(20) NOT NULL,
  SELLER_TITLE varchar(255) DEFAULT NULL,
  WEB varchar(255) NOT NULL,
  ID_ID bigint(20) NOT NULL,
  REGION_ID bigint(20) DEFAULT NULL,
  SELLER_STATUS_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID_ID),
  KEY FK_jbfv0uw21rhbem1ky6xt4a62e (REGION_ID),
  KEY FK_a1vaxq533fxecndx02tu30jpr (SELLER_STATUS_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'SELLER_PHOTO_URL'
--

DROP TABLE IF EXISTS SELLER_PHOTO_URL;
CREATE TABLE SELLER_PHOTO_URL (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) DEFAULT NULL,
  FILE_NAME varchar(255) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  SELLER_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_qjrytu6qwkcf00et9f7837xqb (CREATED_ID),
  KEY FK_doi8kqdv6p8k4bfhav3oo4g1d (LAST_MODIFIED_ID),
  KEY FK_l5mq9ni0xb7iui6iy0jtlvdbn (SELLER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky 'seller_photo_url'
--

DROP TABLE IF EXISTS seller_photo_url;
CREATE TABLE seller_photo_url (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CONTENT_TYPE varchar(30) COLLATE utf8_czech_ci DEFAULT NULL,
  FILE_NAME varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  SELLER_ID bigint(20) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_qjrytu6qwkcf00et9f7837xqb (CREATED_ID),
  KEY FK_doi8kqdv6p8k4bfhav3oo4g1d (LAST_MODIFIED_ID),
  KEY FK_SELLER_ID (SELLER_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'seller_status'
--

DROP TABLE IF EXISTS seller_status;
CREATE TABLE seller_status (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) COLLATE utf8_czech_ci NOT NULL,
  CODE_KEY varchar(20) COLLATE utf8_czech_ci NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  PRIORITY int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_6ktqmrnmcfnodcb38f442s2j (CREATED_ID),
  KEY FK_k332y8traiqa44kwmbu26wqtb (LAST_MODIFIED_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky 'SELLER_STATUS'
--

DROP TABLE IF EXISTS SELLER_STATUS;
CREATE TABLE SELLER_STATUS (
  ID bigint(20) NOT NULL AUTO_INCREMENT,
  CREATED datetime DEFAULT NULL,
  LAST_MODIFIED datetime DEFAULT NULL,
  VERSION int(11) DEFAULT NULL,
  CODE_DESCRIPTION varchar(100) NOT NULL,
  CODE_KEY varchar(20) NOT NULL,
  SEQUENCE_NR int(11) DEFAULT NULL,
  PRIORITY int(11) DEFAULT NULL,
  CREATED_ID bigint(20) DEFAULT NULL,
  LAST_MODIFIED_ID bigint(20) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_6ktqmrnmcfnodcb38f442s2j (CREATED_ID),
  KEY FK_k332y8traiqa44kwmbu26wqtb (LAST_MODIFIED_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `application_permission`
--
ALTER TABLE `application_permission`
  ADD CONSTRAINT FK_6mmupjr60urw0ywlj79mhc9dy FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_c5dwvyeqbenhloc2eptj10lok FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `application_role`
--
ALTER TABLE `application_role`
  ADD CONSTRAINT FK_apkcgpjmemvnsc1brda4et6cx FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_kyavgp495u0hx0ccnfdxra6oe FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `application_role_permission`
--
ALTER TABLE `application_role_permission`
  ADD CONSTRAINT FK_l467vw6jhwo522b3ef8ovgkor FOREIGN KEY (PERMISSION_ID) REFERENCES application_permission (ID),
  ADD CONSTRAINT FK_msjrjy23nvkle00037evqd9ef FOREIGN KEY (ROLE_ID) REFERENCES application_role (ID);

--
-- Omezení pro tabulku `application_user`
--
ALTER TABLE `application_user`
  ADD CONSTRAINT FK_48416r9emtcor7pdprhgg1w1d FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_ot68oi4hpc4jt6fkayj6f4qxc FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `application_user_address`
--
ALTER TABLE `application_user_address`
  ADD CONSTRAINT FK_1lkhdy5ej6aur9985jqfh8pxs FOREIGN KEY (APPLICATION_USER_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_kympp6yykvtws3v1k619bids4 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_r7bbccy3owg6qmctbr03te1tb FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_tier8ryaokcxl0o9fgoh4p5wa FOREIGN KEY (COUNTRY_STATE_ID) REFERENCES country_state (ID);

--
-- Omezení pro tabulku `application_user_photo`
--
ALTER TABLE `application_user_photo`
  ADD CONSTRAINT FK_ny675dekdd2rk8ujtc6nmqea8 FOREIGN KEY (APPLICATION_USER_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_oftbtl900i2xutpnneehx2h5d FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_srjii7bqdp9emnug5c7043d4x FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `application_user_role`
--
ALTER TABLE `application_user_role`
  ADD CONSTRAINT FK_21d31gwey0t8tqpkt3jjsca74 FOREIGN KEY (USER_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_fvy2dr55uu61y45vcl97u336y FOREIGN KEY (ROLE_ID) REFERENCES application_role (ID);

--
-- Omezení pro tabulku `bicycle_category`
--
ALTER TABLE `bicycle_category`
  ADD CONSTRAINT FK_hp1u6dy2x0gyohvkmgnfe1lub FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_q34d2355sptbvsiehbbhotfb6 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT FK_23xgluwltibdgxigv1vcqsxm7 FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_btpmok2rj7ti0a2rj9bk4ie3d FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_hybvs6iml7t18iq3u4hc0ui8s FOREIGN KEY (CATEGORY_TYPE_ID) REFERENCES category_type (ID);

--
-- Omezení pro tabulku `category_type`
--
ALTER TABLE `category_type`
  ADD CONSTRAINT FK_g9f8yev3stq33vdfhjv62k1px FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_tcg900co137gb1ojjnsq0kqgk FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `country_state`
--
ALTER TABLE `country_state`
  ADD CONSTRAINT FK_2pmgyopqb0clmuanf77vq4wke FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_t2jxuvyhrbg179egfqgoloigr FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `figure_height`
--
ALTER TABLE `figure_height`
  ADD CONSTRAINT FK_am3bpj3iq9bekg17r0twhfjrk FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_b1o7nvqwlnfv7nlhk3s9ow62d FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `news_item`
--
ALTER TABLE `news_item`
  ADD CONSTRAINT FK_htwlgse9e60unyni021stcgmw FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_loc6p9w7owyae6emyuaakrvbu FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `news_item_photo_url`
--
ALTER TABLE `news_item_photo_url`
  ADD CONSTRAINT FK_242mmqq0ni1cu3fvkvnc5ev2a FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_71vu9u8rai1wj1vfoi0lfci0y FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_dy4o2opondpbbob7q9u7idahy FOREIGN KEY (NEWSITEM_ID) REFERENCES news_item (ID);

--
-- Omezení pro tabulku `photo_url`
--
ALTER TABLE `photo_url`
  ADD CONSTRAINT FK_2m4wackfms2acxts0brutm99d FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_hh74m0gl9w0ex7ct4f8jpvorh FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_ok94liy1e5n1xxxr58f4t14fv FOREIGN KEY (PRODUCT_ID) REFERENCES product (ID);

--
-- Omezení pro tabulku `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT FK_7e3xc9na32f4vtkcaeqe1wub FOREIGN KEY (PLACE_TYPE_ID) REFERENCES place_type (ID),
  ADD CONSTRAINT FK_gd4td1k10n6v30tm3a2dr8lyg FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_mgst3mvw1k918de2tt6x9g0ch FOREIGN KEY (REGION_ID) REFERENCES region (ID),
  ADD CONSTRAINT FK_p1hwtjuhnopvj2at3hf8fwbu3 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_ri7u7ytu03mt38ly2f54pa6nw FOREIGN KEY (COUNTRY_STATE_ID) REFERENCES country_state (ID);

--
-- Omezení pro tabulku `place_comment`
--
ALTER TABLE `place_comment`
  ADD CONSTRAINT FK_7iefirxym9bgarret3lkksknf FOREIGN KEY (PARENT_ID) REFERENCES place_comment (ID),
  ADD CONSTRAINT FK_ajrabpp2wf6nsd1b2vdo84ors FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_hbquro7jljerfp8lulkte1yey FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_my6q5esbvd72ji2f1ewe9wdch FOREIGN KEY (PLACE_ID) REFERENCES place (ID);

--
-- Omezení pro tabulku `place_photo_url`
--
ALTER TABLE `place_photo_url`
  ADD CONSTRAINT FK_bo5cgle90q88rgyayct5sxu45 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_dkptru7v2fl68ktapm0kv4ste FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_m8mb87jyvlsu3ircc9ofqcga2 FOREIGN KEY (PLACE_ID) REFERENCES place (ID);

--
-- Omezení pro tabulku `place_type`
--
ALTER TABLE `place_type`
  ADD CONSTRAINT FK_i4c0mvdcuo72pjefac6sg2sou FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_mh1fy92k29vil9c8mpaad8rkd FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT FK_21juuudrqcggvhfpptvejayni FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_tm7ly8b339h4u325qhv0hdh8w FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT FK_6t6fwpoax5485lfta1ha89rlh FOREIGN KEY (CATEGORY_ID) REFERENCES category (ID),
  ADD CONSTRAINT FK_dvx56wdl9qapvlfqumc05c4oe FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_e7x61n614plid9vikljs1u5ut FOREIGN KEY (SELLER_ID) REFERENCES seller (ID_ID),
  ADD CONSTRAINT FK_h1mudty2asxysiyi74ir30spv FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_hqwmmht0gcdpnlrpbg7do7ir7 FOREIGN KEY (PRODUCT_ID) REFERENCES product (ID),
  ADD CONSTRAINT FK_ikr28obncik165j8dlmkcocit FOREIGN KEY (PRODUCT_COLOR_ID) REFERENCES product_color (ID),
  ADD CONSTRAINT FK_mat3d1nlrjhsdyq9eu9wplbsx FOREIGN KEY (FIGURE_HEIGHT_ID) REFERENCES figure_height (ID),
  ADD CONSTRAINT FK_oc5ooeca0l6gimle8uo979jwe FOREIGN KEY (BICYCLE_CATEGORY_ID) REFERENCES bicycle_category (ID),
  ADD CONSTRAINT FK_ovmxhqqkejg87xt23y7pkn4t FOREIGN KEY (PRODUCT_USAGE_ID) REFERENCES product_usage (ID),
  ADD CONSTRAINT FK_p4tbeci5384m88ypcrouapxtc FOREIGN KEY (PRODUCER_ID) REFERENCES producer (ID);

--
-- Omezení pro tabulku `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT FK_6h8m6ocg2jhu3bfieqa0dupb1 FOREIGN KEY (PRODUCT_ID) REFERENCES product (ID),
  ADD CONSTRAINT FK_cdugk8tgii0svs97t787exkm8 FOREIGN KEY (ATTRIBUTE_TYPE_ID) REFERENCES product_attribute_type (ID),
  ADD CONSTRAINT FK_jigly7glwaisxgnvxjvilhak0 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_onscn5vlf8boou38pvxooqbmd FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `product_attribute_type`
--
ALTER TABLE `product_attribute_type`
  ADD CONSTRAINT FK_c49l7fsj3jj00hr7w8tqk7peh FOREIGN KEY (CATEGORY_TYPE_ID) REFERENCES category_type (ID),
  ADD CONSTRAINT FK_l1smb5oyq0svfltyt4c0qvv3m FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_mbl5lgsvkudd9o5ibjpop0blb FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT FK_fhbbt4a4ivx4gghpu8uocgbv FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_hpcmjjdvptxf0xy952m5tqep8 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `product_comment`
--
ALTER TABLE `product_comment`
  ADD CONSTRAINT FK_jpt7usvsn3h869cret1uba2hr FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_lq7ng0nthdvxqjbefd1sfig74 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `product_usage`
--
ALTER TABLE `product_usage`
  ADD CONSTRAINT FK_7jc95wc5783ojo2xbmk31cyv8 FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_n7fjcq4k3mo7140gd70ql7x3 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT FK_acb1vjrdtxr36erwi3663x9pk FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_r8tq3l1asnnegemgqb74io4i7 FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT FK_iacpokgk2trq8d5ti0cakkn3t FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_ldyl6246ebdhl6xujw00sgoq3 FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `registration_request`
--
ALTER TABLE `registration_request`
  ADD CONSTRAINT FK_4lt98qpyqkbtb5kwjhbnq2gsi FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_qw090r8xfeko91802tdghs0qx FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT FK_a1vaxq533fxecndx02tu30jpr FOREIGN KEY (SELLER_STATUS_ID) REFERENCES seller_status (ID),
  ADD CONSTRAINT FK_jbfv0uw21rhbem1ky6xt4a62e FOREIGN KEY (REGION_ID) REFERENCES region (ID),
  ADD CONSTRAINT FK_lcjr7ts5qxohcfxwju4cj7a2j FOREIGN KEY (ID_ID) REFERENCES application_user (ID);

--
-- Omezení pro tabulku `seller_photo_url`
--
ALTER TABLE `seller_photo_url`
  ADD CONSTRAINT FK_doi8kqdv6p8k4bfhav3oo4g1d FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_qjrytu6qwkcf00et9f7837xqb FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_SELLER_ID FOREIGN KEY (SELLER_ID) REFERENCES seller (ID_ID);

--
-- Omezení pro tabulku `seller_status`
--
ALTER TABLE `seller_status`
  ADD CONSTRAINT FK_6ktqmrnmcfnodcb38f442s2j FOREIGN KEY (CREATED_ID) REFERENCES application_user (ID),
  ADD CONSTRAINT FK_k332y8traiqa44kwmbu26wqtb FOREIGN KEY (LAST_MODIFIED_ID) REFERENCES application_user (ID);
