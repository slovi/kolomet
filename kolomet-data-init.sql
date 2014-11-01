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

--
-- Vypisuji data pro tabulku `APPLICATION_ROLE`
--

INSERT INTO `APPLICATION_ROLE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `ROLE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(3, '2014-03-31 00:00:00', '2014-08-23 15:36:24', 10, 'role_admin', 2, 2),
(4, '2014-03-31 06:24:02', '2014-10-11 02:32:22', 6, 'role_seller', 2, 2),
(5, '2014-06-24 00:28:21', '2014-10-11 02:32:33', 3, 'role_user', 2, 2),
(8, '2014-07-25 07:21:49', '2014-07-29 22:05:54', 1, 'role_placeown', 5, 2);

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
(4, 3),
(4, 4),
(4, 8),
(4, 18),
(4, 20),
(4, 29),
(5, 3),
(5, 24),
(5, 26),
(5, 29);

INSERT INTO `APPLICATION_USER` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONDITION_AGREEMENT`, `CONDITION_VERSION`, `ENABLED`, `NAME`, `PASSWORD`, `PHONE`, `SURNAME`, `TOKEN`, `USERNAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `NICKNAME`) VALUES
(2, '2014-03-31 00:00:00', '2014-10-13 22:11:01', 5, NULL, NULL, b'1', 'Jiří', '9cae5a2d3e935245e564395b8f1fa110d8bc95c8', NULL, 'Slovák', NULL, 'jiri.slovak@gmail.com', NULL, 2, 'slovi'),
(5, '2014-03-31 07:14:20', '2014-10-26 21:36:22', 11, NULL, NULL, b'1', NULL, '2806e0bbe0f4441a8429ce1523578da104173b82', NULL, NULL, NULL, 'ales.radomersky@gmail.com', NULL, 5, NULL),
(39, '2014-10-11 08:37:00', '2014-10-14 20:48:20', 4, NULL, NULL, b'1', 'Vít', '6d15fb0b563c4783fd653cfbd38f63b5da3e3818', NULL, 'Ratislav', NULL, 'vit.ratislav@gmail.com', NULL, 5, '');

--
-- Vypisuji data pro tabulku `APPLICATION_USER_PHOTO`
--

INSERT INTO `APPLICATION_USER_PHOTO` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CONTENT_TYPE`, `FILE_NAME`, `CREATED_ID`, `LAST_MODIFIED_ID`, `APPLICATION_USER_ID`) VALUES
(2, '2014-09-27 11:24:31', '2014-09-27 11:24:31', 0, 'image/jpeg', 'IMAG0507.jpg', NULL, NULL, 25);

--
-- Vypisuji data pro tabulku `APPLICATION_USER_ROLE`
--

INSERT INTO `APPLICATION_USER_ROLE` (`USER_ID`, `ROLE_ID`) VALUES
(5, 3),
(2, 3),
(39, 3);

--
-- Vypisuji data pro tabulku `BICYCLE_CATEGORY`
--

INSERT INTO `BICYCLE_CATEGORY` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-05-11 00:04:42', '2014-05-11 00:04:42', 0, 'Pánské', 'bcat_man', NULL, 2, 2),
(2, '2014-05-11 00:04:53', '2014-05-11 00:04:53', 0, 'Dámské', 'bcat_woman', NULL, 2, 2),
(3, '2014-05-11 00:05:02', '2014-05-11 00:05:02', 0, 'Dětské', 'bcat_child', NULL, 2, 2),
(4, '2014-05-24 13:52:01', '2014-05-24 13:57:44', 2, 'Pánské/Dámské', 'bcat_all', NULL, 5, 5);

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

--
-- Vypisuji data pro tabulku `CATEGORY_TYPE`
--

INSERT INTO `CATEGORY_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 0, 'Kola', 'cattype_bike', NULL, NULL, NULL),
(2, NULL, NULL, 1, 'Ostatní', 'cattype_other', NULL, NULL, NULL);

--
-- Vypisuji data pro tabulku `COUNTRY_STATE`
--

INSERT INTO `COUNTRY_STATE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 1, 'Česká republika', 'cs_cz', NULL, NULL, NULL);

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

--
-- Vypisuji data pro tabulku `PLACE_TYPE`
--

INSERT INTO `PLACE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PLACE_TYPE_COLOR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-06-24 00:30:36', '2014-08-23 17:42:48', 2, 'Restaurace', 'ptype_restaurant', 10, 2, 2, 2),
(2, '2014-06-24 00:31:44', '2014-09-20 17:38:20', 4, 'Příroda, památky', 'ptype_interest', 100, 1, 2, 5),
(3, '2014-10-25 13:27:38', '2014-11-01 07:46:16', 2, 'Zábava nejen pro děti', 'Zábava', 0, 4, 5, 5);

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

--
-- Vypisuji data pro tabulku `PRODUCT_ATTRIBUTE`
--

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
(42, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '24 měsíců', 14, 5, 17, 2),
(43, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, 'bílá', 14, 5, 17, 4),
(44, '2014-05-24 18:04:20', '2014-06-15 20:43:29', 1, '19"', 14, 5, 17, 7),
(46, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '', 7, 5, 18, 2),
(47, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, 'červená', 7, 5, 18, 4),
(48, '2014-05-24 22:08:49', '2014-06-15 20:42:57', 3, '1,3', 7, 5, 18, 7),
(50, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 19, 2),
(51, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, 'tyrkysova', 7, 5, 19, 4),
(52, '2014-05-24 22:17:16', '2014-06-14 20:52:18', 14, '1', 7, 5, 19, 7),
(54, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 21, 2),
(55, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, 'tyrkysova', 2, 5, 21, 4),
(56, '2014-06-14 20:24:52', '2014-06-14 20:52:51', 2, '1', 2, 5, 21, 7),
(58, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 22, 2),
(59, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, 'tyrkysova', 2, 5, 22, 4),
(60, '2014-06-14 20:32:16', '2014-06-14 21:22:24', 3, '1', 2, 5, 22, 7),
(62, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 4),
(63, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 2),
(64, '2014-06-14 20:40:28', '2014-06-14 20:45:25', 1, '', 2, 2, 23, 7),
(66, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '2 roky', 2, 2, 24, 2),
(67, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, 'červená', 2, 2, 24, 4),
(68, '2014-06-14 20:42:00', '2014-06-14 20:42:30', 1, '27"', 2, 2, 24, 7),
(70, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '24 měsíců', 5, 5, 25, 2),
(71, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, 'bílá', 5, 5, 25, 4),
(72, '2014-06-14 20:42:33', '2014-06-14 21:34:12', 2, '19"', 5, 5, 25, 7),
(74, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '24 měsíců', 5, 5, 26, 2),
(75, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, 'bílá', 5, 5, 26, 4),
(76, '2014-06-14 20:43:54', '2014-06-14 21:30:16', 1, '19"', 5, 5, 26, 7),
(78, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '24 měsíců', 5, 2, 27, 2),
(79, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, 'bílá', 5, 2, 27, 4),
(80, '2014-06-14 20:47:32', '2014-08-16 01:02:05', 3, '19"', 5, 2, 27, 7),
(82, '2014-06-14 21:37:59', '2014-06-14 21:38:25', 1, '', 5, 5, 1, 7),
(84, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, 'červená', 2, 5, 28, 4),
(85, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 28, 2),
(86, '2014-06-15 17:36:24', '2014-09-29 21:59:33', 3, '', 2, 5, 28, 7),
(88, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 29, 2),
(89, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, 'tyrkysova', 2, 5, 29, 4),
(90, '2014-06-15 17:54:47', '2014-09-28 22:35:28', 2, '1', 2, 5, 29, 7),
(92, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 30, 2),
(93, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, 'tyrkysova', 2, 2, 30, 4),
(94, '2014-06-15 19:27:32', '2014-08-16 00:57:59', 2, '1', 2, 2, 30, 7),
(96, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 4),
(97, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 2),
(98, '2014-06-15 20:35:58', '2014-06-15 20:35:58', 0, '', 5, 5, 31, 7),
(100, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '2 roky', 5, 5, 32, 2),
(101, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, 'červená', 5, 5, 32, 4),
(102, '2014-06-15 20:37:06', '2014-08-16 06:36:17', 4, '27"', 5, 5, 32, 7),
(104, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 4),
(105, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 2),
(106, '2014-06-15 20:42:22', '2014-06-15 20:42:22', 0, '', 5, 5, 20, 7),
(109, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 4),
(110, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 2),
(111, '2014-06-15 20:45:36', '2014-06-15 20:45:36', 0, '', 5, 5, 10, 7),
(117, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 2),
(118, '2014-06-15 20:47:59', '2014-06-15 20:47:59', 0, '', 5, 5, 2, 7),
(120, '2014-06-15 20:48:36', '2014-06-15 20:48:36', 0, '', 5, 5, 3, 7),
(122, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 33, 2),
(123, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '', 5, 2, 33, 4),
(124, '2014-06-16 06:10:59', '2014-09-27 18:36:31', 16, '1,3', 5, 2, 33, 7),
(126, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, '1,5 roku', 7, 5, 34, 2),
(127, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, 'Perleťová a hnědá a fialová', 7, 5, 34, 4),
(128, '2014-06-28 07:44:37', '2014-10-11 07:12:05', 11, '', 7, 5, 34, 7),
(130, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, 'chromová', 6, 2, 35, 4),
(132, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, '19"', 6, 2, 35, 7),
(133, '2014-10-02 21:06:03', '2014-10-12 02:25:50', 9, 'bez záruky', 6, 2, 35, 2),
(134, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 4),
(135, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 9),
(137, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 7),
(138, '2014-10-03 19:54:40', '2014-10-03 19:54:40', 0, '', 6, 6, 36, 2),
(139, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 4),
(140, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 9),
(142, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, '', 2, 2, 37, 7),
(143, '2014-10-04 16:42:18', '2014-10-04 16:47:33', 7, 'Testcccc', 2, 2, 37, 2),
(144, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, 'test', 2, 5, 38, 4),
(145, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, 'test', 2, 5, 38, 9),
(147, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, '', 2, 5, 38, 7),
(148, '2014-10-05 11:23:48', '2014-10-12 19:45:57', 4, '', 2, 5, 38, 2),
(149, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 4),
(150, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 9),
(152, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 7),
(153, '2014-10-05 12:15:45', '2014-10-05 12:15:45', 0, '', 2, 2, 39, 2),
(156, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 42, 4),
(157, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 42, 9),
(159, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'testtes', 2, 2, 42, 7),
(160, '2014-10-05 16:38:43', '2014-10-12 02:37:52', 3, 'test', 2, 2, 42, 2),
(161, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 43, 4),
(162, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 43, 9),
(164, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 43, 7),
(165, '2014-10-05 16:41:53', '2014-10-05 16:41:53', 0, 'test', 2, 2, 43, 2),
(166, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'žluté pruhy', 5, 5, 44, 4),
(167, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'Ano', 5, 5, 44, 9),
(168, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, 'aa', 5, 5, 44, 7),
(169, '2014-10-05 17:15:50', '2014-10-06 22:21:12', 4, '2 roky', 5, 5, 44, 2),
(170, '2014-10-05 17:26:07', '2014-10-05 17:26:07', 0, '', 5, 5, 22, 9),
(171, '2014-10-11 07:11:03', '2014-10-11 07:12:05', 2, '', 5, 5, 34, 9),
(172, '2014-10-11 07:12:20', '2014-10-12 02:25:50', 9, '', 5, 2, 35, 9);

--
-- Vypisuji data pro tabulku `PRODUCT_ATTRIBUTE_TYPE`
--

INSERT INTO `PRODUCT_ATTRIBUTE_TYPE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `REQUIRED`, `UNITS`, `CREATED_ID`, `LAST_MODIFIED_ID`, `CATEGORY_TYPE_ID`) VALUES
(2, NULL, '2014-06-12 01:22:54', 1, 'Záruka', 'pat.bike.guarantee', 100, b'0', '', NULL, 2, 1),
(4, NULL, '2014-06-14 19:52:52', 3, 'Doplňující barva', 'pat.bike.color', 10000, b'0', '', NULL, 2, 1),
(7, '2014-05-16 23:52:46', '2014-06-12 01:23:11', 4, 'Velikost kola', 'pat.bike.bikesize', 100, b'0', '', 2, 2, 1),
(9, '2014-10-03 07:38:01', '2014-10-03 07:38:01', 0, 'Možnost koupit na úvěr', 'pat.bike.loan', 100, b'0', '', 5, 5, 1);

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

--
-- Vypisuji data pro tabulku `PRODUCT_USAGE`
--

INSERT INTO `PRODUCT_USAGE` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, '2014-04-14 20:59:57', '2014-04-14 20:59:57', 0, 'Terénní', 'usage_terrain', NULL, 5, 5),
(2, '2014-05-03 17:37:27', '2014-05-03 17:37:27', 0, 'Asfalt', 'usage_asphalt', NULL, 5, 5),
(3, '2014-05-03 17:38:54', '2014-05-03 17:38:54', 0, 'Lehký terén', 'usage_easyterrain', NULL, 5, 5),
(4, '2014-05-03 17:39:55', '2014-05-03 17:39:55', 0, 'Sjezdová kola', 'usage_downhill', NULL, 5, 5);

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

--
-- Vypisuji data pro tabulku `SELLER_STATUS`
--

INSERT INTO `SELLER_STATUS` (`ID`, `CREATED`, `LAST_MODIFIED`, `VERSION`, `CODE_DESCRIPTION`, `CODE_KEY`, `SEQUENCE_NR`, `PRIORITY`, `CREATED_ID`, `LAST_MODIFIED_ID`) VALUES
(1, NULL, NULL, 0, 'VIP', 'sellst_vip', NULL, 100, NULL, NULL),
(2, NULL, '2014-05-24 13:01:12', 2, 'Běžný prodejce', 'sellst_ord', NULL, 100, NULL, 2);
