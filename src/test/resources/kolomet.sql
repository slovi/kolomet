-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Počítač: 127.2.226.2:3306
-- Vygenerováno: Ned 23. bře 2014, 22:53
-- Verze serveru: 5.5.36
-- Verze PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `kolomet`
--

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
  PRIMARY KEY (`id`),
  KEY `FK6DD211EFFD6B623` (`categoryType_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Vypisuji data pro tabulku `Category`
--

INSERT INTO `Category` (`id`, `version`, `codeDescription`, `codeKey`, `categoryType_id`) VALUES
(1, 0, 'Všechna kola', 'cat_bike_all', 1),
(2, 0, 'Horská kola', 'cat_bike_mountain', 1),
(3, 0, 'Horská kola 27,5', 'cat_bike_mountain275', 1),
(4, 0, 'Horská kola 29', 'cat_bike_mountain29', 1),
(5, 0, 'Celoodpružená kola', 'cat_bike_freeride', 1),
(6, 0, 'Krosová kola', 'cat_bike_cross', 1),
(7, 0, 'Trekingová kola', 'cat_bike_track', 1),
(8, 0, 'Dětská kola a odrážedla', 'cat_bike_children', 1),
(9, 0, 'Koloběžky', 'cat_bike_scooter', 1),
(10, 0, 'Elektrokola', 'cat_bike_electric', 1),
(11, 0, 'Silniční kola', 'cat_bike_road', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `CategoryType`
--

CREATE TABLE IF NOT EXISTS `CategoryType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `CategoryType`
--

INSERT INTO `CategoryType` (`id`, `version`, `codeDescription`, `codeKey`) VALUES
(1, 0, 'Kola', 'cattype_bike'),
(2, 1, 'Ostatní', 'cattype_other');

-- --------------------------------------------------------

--
-- Struktura tabulky `CountryState`
--

CREATE TABLE IF NOT EXISTS `CountryState` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `CountryState`
--

INSERT INTO `CountryState` (`id`, `version`, `codeDescription`, `codeKey`) VALUES
(1, 1, 'Česká republika', 'cs_cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `PhotoUrl`
--

CREATE TABLE IF NOT EXISTS `PhotoUrl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `urlValue` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Vypisuji data pro tabulku `Producer`
--

INSERT INTO `Producer` (`id`, `version`, `codeDescription`, `codeKey`, `name`) VALUES
(1, 0, '4Ever', 'prd_4ever', '4Ever'),
(2, 0, '4freetime', 'prd_4free', '4freetime'),
(3, 0, 'ACRA', 'prd_acra', 'ACRA'),
(4, 0, 'Acstar', 'prd_acsta', 'Acstar'),
(5, 0, 'Agogs', 'prd_agogs', 'Agogs'),
(6, 0, 'Alpina', 'prd_alpin', 'Alpina'),
(7, 0, 'Amulet', 'prd_amule', 'Amulet'),
(8, 0, 'APACHE', 'prd_apach', 'APACHE'),
(9, 0, 'Author', 'prd_autho', 'Author'),
(10, 0, 'Azub', 'prd_azub', 'Azub'),
(11, 0, 'Brother', 'prd_broth', 'Brother'),
(12, 0, 'Cannondale', 'prd_canno', 'Cannondale'),
(13, 0, 'Cosmic', 'prd_cosmi', 'Cosmic'),
(14, 0, 'COYOTE', 'prd_coyot', 'COYOTE'),
(15, 0, 'Rock Machine', 'prd_rockm', 'Rock Machine'),
(16, 0, 'Yamaha', 'prd_yamah', 'Yamaha'),
(17, 0, 'Zephir', 'prd_zephi', 'Zephir');

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
  PRIMARY KEY (`id`),
  KEY `FK50C664CFF66C8014` (`seller_id`),
  KEY `FK50C664CF6461F0C3` (`category_id`),
  KEY `FK50C664CF7033F843` (`producer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Vypisuji data pro tabulku `Product`
--

INSERT INTO `Product` (`id`, `version`, `discount`, `price`, `productName`, `category_id`, `producer_id`, `seller_id`, `description`) VALUES
(1, 0, '5000.00', '25999.00', 'Agang CULT 2.0 2012', 3, 4, 1, 'Model Cult prezentuje z pohledu značky AGang nejuniverzálnější kolo do horského terénu. Na konstrukci, funkci i designu modelu pracoval tvůrčí tým několik let. Získané zkušenosti umožnily vyladit jeho originální čtyř-čepový systém tak, aby poskytoval maximální komfort odpružení, ovladatelnost v náročnějších terénních pasážích či sjezdech, ale také minimální ztráty při šlapání. Schopnosti modelu Cult vycházejí především z použitých technologií, konstrukčních prvků a geometrie jeho celoodpruženého rámu. Ten disponuje zdvihem 150 mm a naším originálním čtyř-čepovým systémem odpružení zvaný Drive Link Pivot, jenž byl kompletně navržen našimi inženýry v Čechách. Tento systém byl optimalizován tak, aby nabídl jezdci aktivní zadní stavbu a zárověň maximálně omezil její pohupování při šlapání, a to hlavně při jízdě vsedě. Citlivost stavby pak ještě zvyšuje použití tlumiče o délce 200 mm se zdvihem 57 mm.'),
(2, 0, '500.00', '4590.00', 'A-Gang Capo 16" červená 2012', 8, 1, 1, 'Dětské kolo A-Gang Capo ve velikosti 16 palců s duralovým rámem v červeném barevném provedení. V ceně kola jsou zahrnuty blatníky a plastový celokryt řetězu. Přední brzda: čelisťová (s brzdovou páčkou na řidítkách) Zadní brzda: torpédo (zabrzdí šlápnutím pedálu směrem dozadu) BALANČNÍ KOLEČKA NEJSOU ZAHRNUTA V CENĚ KOLA! V jakém stavu bude kolo doručeno? Kolo před odesláním vždy prohlédne a seřídí náš mechanik. Kolo je ve složeném stavu, pouze je nutné namontovat pedály a připevnit (případně pouze narovnat) řidítka. Tam kde jsou součástí balanční kolečka, je nutné namontovat i je.'),
(3, 0, '5000.00', '30000.00', 'AUTHOR A 33 2013', 11, 9, 2, 'Chcete-li rychlost a efektivitu, pak je silniční kolo pro Vás. Díky aerodynamické konstrukci...'),
(4, 0, '7000.00', '53900.00', 'Merida Big Ninety-Nine CF Team', 11, 17, 2, 'Nové horské kolo, vhodné pro běžné výletníky. Kolemjdoucí se za vámi...');

-- --------------------------------------------------------

--
-- Struktura tabulky `ProductAttribute`
--

CREATE TABLE IF NOT EXISTS `ProductAttribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `attributeKey` varchar(40) NOT NULL,
  `attributeValue` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `Product_PhotoUrl`
--

CREATE TABLE IF NOT EXISTS `Product_PhotoUrl` (
  `Product_id` bigint(20) NOT NULL,
  `photoUrls_id` bigint(20) NOT NULL,
  UNIQUE KEY `photoUrls_id` (`photoUrls_id`),
  KEY `FK22D8336DA4593BE0` (`Product_id`),
  KEY `FK22D8336D2598E9FB` (`photoUrls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `Product_ProductAttribute`
--

CREATE TABLE IF NOT EXISTS `Product_ProductAttribute` (
  `Product_id` bigint(20) NOT NULL,
  `productAttributes_id` bigint(20) NOT NULL,
  UNIQUE KEY `productAttributes_id` (`productAttributes_id`),
  KEY `FK4F13B3FD6858D11B` (`productAttributes_id`),
  KEY `FK4F13B3FDA4593BE0` (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `Region`
--

CREATE TABLE IF NOT EXISTS `Region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `codeDescription` varchar(100) NOT NULL,
  `codeKey` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Vypisuji data pro tabulku `Region`
--

INSERT INTO `Region` (`id`, `version`, `codeDescription`, `codeKey`) VALUES
(1, 0, 'Praha', 'reg_pha'),
(3, 1, 'Stredočeský', 'reg_str'),
(4, 0, 'Ústecký', 'reg_ust'),
(5, 0, 'Liberecký', 'reg_lib'),
(6, 2, 'Plzeňský', 'reg_plz'),
(7, 0, 'Karlovarský', 'reg_klv'),
(8, 2, 'Jihočeský', 'reg_jhc'),
(9, 2, 'Vysočina', 'reg_vys'),
(10, 1, 'Královehradecký', 'reg_khr'),
(11, 1, 'Pardubický', 'reg_par'),
(12, 1, 'Jihomoravský', 'reg.jhm'),
(13, 1, 'Olomoucký', 'reg.olo'),
(14, 1, 'Zlínský', 'reg.zln'),
(15, 1, 'Moravskoslezský', 'reg.msl');

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
  `photoUrl` varchar(255) DEFAULT NULL,
  `saleType` varchar(255) DEFAULT NULL,
  `sellerDescription` longtext NOT NULL,
  `sellerName` varchar(20) NOT NULL,
  `web` varchar(255) DEFAULT NULL,
  `addressCountry_id` bigint(20) NOT NULL,
  `businessCountry_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `sellerStatus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93643B9F9AB44008` (`businessCountry_id`),
  KEY `FK93643B9F5719F83` (`sellerStatus_id`),
  KEY `FK93643B9F9C386B3C` (`addressCountry_id`),
  KEY `FK93643B9F78CE8343` (`region_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `Seller`
--

INSERT INTO `Seller` (`id`, `version`, `addressCity`, `addressDegree`, `addressEmail`, `addressName`, `addressPostCode`, `addressSalutation`, `addressStreet`, `businessCity`, `businessDegree`, `businessEmail`, `businessName`, `businessPhoneNumber`, `businessPostCode`, `businessSalutation`, `businessStreet`, `mapUrl`, `personDegree`, `personName`, `personSalutation`, `personSurname`, `photoUrl`, `saleType`, `sellerDescription`, `sellerName`, `web`, `addressCountry_id`, `businessCountry_id`, `region_id`, `sellerStatus_id`) VALUES
(1, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Specializovaný e-shop na cyklistiku a běžky... www.finebike.cz Zveme vás do naší prodejny na Praze 1 v ulici Skořepka 4. Najdete u nás rozsáhlý sortiment jak pro cyklistiku tak i pro běžecké lyžování, včetně oblečení a nezbytných doplňků. Nabízíme vám navíc kvalitní servis kol a také zázemí a kvalitu autorizovaného dealera renomovaných cyklistických a běžkařských značek, které držíme skladem, takže si jejich zboží můžete prohlédnout případně vyzkoušet a ihned koupit.', 'FineBike', '', 1, 1, 1, 1),
(2, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Prodáváme jízdní, horská, krosová, trekingová, cestovní, dětská a silniční kola Author a AGang, bike příslušenství a sportovní potřeby. Koloběžky Micro, Tempish a Yedoo, odrážedla Yedoo a Author. Naleznete u nás velký výběr cyklistického oblečení. Prodáváme přilby Author, Giro, Uvex, tretry Shimano a Northwave, oblečení Author, Silvini, Sensor, Craft, brýle Uvex, Tifosi a Relax, dětské sedačky Author a Hamax, výživa Enervit, Nutrend, Powerbar, cyklotrenažéry Tacx. Dále prodáváme značky Zéffal, Topeak, Schwalbe, Camelbak, Author, Panaracer, Shimano, Ritchey, Cateye, Abus, RST.', 'cyklocentrum.cz', '', 1, 1, 1, 2);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `SellerStatus`
--

INSERT INTO `SellerStatus` (`id`, `version`, `codeDescription`, `codeKey`, `priority`) VALUES
(1, 0, 'VIP', 'sellst_vip', 100),
(2, 1, 'Běžný prodejce', 'sellst_ord', 20);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `Category`
--
ALTER TABLE `Category`
  ADD CONSTRAINT `FK6DD211EFFD6B623` FOREIGN KEY (`categoryType_id`) REFERENCES `CategoryType` (`id`);

--
-- Omezení pro tabulku `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `FK50C664CF6461F0C3` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `FK50C664CF7033F843` FOREIGN KEY (`producer_id`) REFERENCES `Producer` (`id`),
  ADD CONSTRAINT `FK50C664CFF66C8014` FOREIGN KEY (`seller_id`) REFERENCES `Seller` (`id`);

--
-- Omezení pro tabulku `Product_PhotoUrl`
--
ALTER TABLE `Product_PhotoUrl`
  ADD CONSTRAINT `FK22D8336D2598E9FB` FOREIGN KEY (`photoUrls_id`) REFERENCES `PhotoUrl` (`id`),
  ADD CONSTRAINT `FK22D8336DA4593BE0` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`id`);

--
-- Omezení pro tabulku `Product_ProductAttribute`
--
ALTER TABLE `Product_ProductAttribute`
  ADD CONSTRAINT `FK4F13B3FD6858D11B` FOREIGN KEY (`productAttributes_id`) REFERENCES `ProductAttribute` (`id`),
  ADD CONSTRAINT `FK4F13B3FDA4593BE0` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`id`);

--
-- Omezení pro tabulku `Seller`
--
ALTER TABLE `Seller`
  ADD CONSTRAINT `FK93643B9F5719F83` FOREIGN KEY (`sellerStatus_id`) REFERENCES `SellerStatus` (`id`),
  ADD CONSTRAINT `FK93643B9F78CE8343` FOREIGN KEY (`region_id`) REFERENCES `Region` (`id`),
  ADD CONSTRAINT `FK93643B9F9AB44008` FOREIGN KEY (`businessCountry_id`) REFERENCES `CountryState` (`id`),
  ADD CONSTRAINT `FK93643B9F9C386B3C` FOREIGN KEY (`addressCountry_id`) REFERENCES `CountryState` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
