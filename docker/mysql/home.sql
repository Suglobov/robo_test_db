-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Сен 28 2018 г., 11:47
-- Версия сервера: 8.0.12
-- Версия PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `home`
--

-- --------------------------------------------------------

--
-- Структура таблицы `achievements`
--

CREATE TABLE `achievements` (
  `pk` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `characters`
--

CREATE TABLE `characters` (
  `pk` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fk_first_line` int(11) DEFAULT '1',
  `fk_second_line` int(11) DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `characters`
--

INSERT INTO `characters` (`pk`, `name`, `fk_first_line`, `fk_second_line`) VALUES
(1, 'Dr. Velda Larkin', 1, 4),
(2, 'Wava Medhurst I', 1, 4),
(3, 'Bradford Corkery', 1, 4),
(4, 'Amari Kuvalis IV', 1, 2),
(5, 'Joshuah Mante', 1, 4),
(6, 'Mrs. Daisy Gibson', 1, 3),
(7, 'Chet Larkin', 1, 4),
(8, 'Eldora Hyatt', 1, 4),
(9, 'Lee Mills I', 1, 4),
(10, 'Jordi Boyle', 1, 4),
(11, 'Efren Wintheiser', 1, 4),
(12, 'Nicola Bergstrom DVM', 1, 2),
(13, 'Dr. Anais Wyman DVM', 1, 3),
(14, 'Destiny Hamill', 1, 4),
(15, 'Ernestina Sanford II', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `characters_levels`
--

CREATE TABLE `characters_levels` (
  `pk` int(11) NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL,
  `experience` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `characters_levels`
--

INSERT INTO `characters_levels` (`pk`, `level`, `experience`) VALUES
(1, 1, 0),
(2, 2, 500),
(3, 3, 750),
(4, 4, 1125),
(5, 5, 1688),
(6, 6, 2532),
(7, 7, 3798),
(8, 8, 5697),
(9, 9, 8546),
(10, 10, 12819),
(11, 11, 19229),
(12, 12, 28844),
(13, 13, 43266),
(14, 14, 64899),
(15, 15, 97349),
(16, 16, 146024),
(17, 17, 219036),
(18, 18, 328554),
(19, 19, 492831),
(20, 20, 739247),
(21, 21, 1108871),
(22, 22, 1663307),
(23, 23, 2494961),
(24, 24, 3742442),
(25, 25, 5613663),
(26, 26, 8420495),
(27, 27, 12630743),
(28, 28, 18946115),
(29, 29, 28419173),
(30, 30, 42628760);

-- --------------------------------------------------------

--
-- Структура таблицы `characters_lines`
--

CREATE TABLE `characters_lines` (
  `pk` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `characters_lines`
--

INSERT INTO `characters_lines` (`pk`, `name`) VALUES
(1, 'health'),
(2, 'rage'),
(3, 'energy'),
(4, 'mana');

-- --------------------------------------------------------

--
-- Структура таблицы `characters_parametrs`
--

CREATE TABLE `characters_parametrs` (
  `pk` int(11) NOT NULL,
  `fk_character` int(11) DEFAULT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL,
  `move_speed` int(10) UNSIGNED DEFAULT NULL,
  `physical_attack` int(10) UNSIGNED DEFAULT NULL,
  `magic_attack` int(10) UNSIGNED DEFAULT NULL,
  `first_line_value` int(10) UNSIGNED DEFAULT NULL,
  `second_line_value` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `matches`
--

CREATE TABLE `matches` (
  `pk` int(11) NOT NULL,
  `fk_status` int(11) DEFAULT NULL,
  `datetime_start` datetime DEFAULT NULL,
  `datetime_finish` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `matches_logs`
--

CREATE TABLE `matches_logs` (
  `pk` int(11) NOT NULL,
  `fk_match` int(11) DEFAULT NULL,
  `fk_user_1` int(11) DEFAULT NULL,
  `fk_user_2` int(11) DEFAULT NULL,
  `datetime_event` datetime DEFAULT NULL,
  `fk_event` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `matches_logs_events`
--

CREATE TABLE `matches_logs_events` (
  `pk` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `matches_logs_events`
--

INSERT INTO `matches_logs_events` (`pk`, `name`) VALUES
(1, '1 kill 2');

-- --------------------------------------------------------

--
-- Структура таблицы `matches_partys`
--

CREATE TABLE `matches_partys` (
  `pk` int(11) NOT NULL,
  `fk_match` int(11) DEFAULT NULL,
  `fk_team_1` int(11) DEFAULT NULL,
  `fk_team_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `matches_statuses`
--

CREATE TABLE `matches_statuses` (
  `pk` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `matches_statuses`
--

INSERT INTO `matches_statuses` (`pk`, `status`) VALUES
(2, '1 team win'),
(3, '2 team win'),
(5, 'error'),
(1, 'in progress'),
(4, 'preparation');

-- --------------------------------------------------------

--
-- Структура таблицы `matches_teams`
--

CREATE TABLE `matches_teams` (
  `pk` int(11) NOT NULL,
  `fk_user_has_ch_1` int(11) DEFAULT NULL,
  `fk_user_has_ch_2` int(11) DEFAULT NULL,
  `fk_user_has_ch_3` int(11) DEFAULT NULL,
  `fk_user_has_ch_4` int(11) DEFAULT NULL,
  `fk_user_has_ch_5` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `pk` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `registration_date` date NOT NULL,
  `last_visit_date` date NOT NULL,
  `rating_ball` int(10) UNSIGNED DEFAULT '0',
  `experience` bigint(20) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`pk`, `login`, `password`, `registration_date`, `last_visit_date`, `rating_ball`, `experience`) VALUES
(154, 'Jaclyn Rowe II', '58399a83f9650508b5d3ce39918be38e', '2018-08-23', '2018-09-15', 263, 66897043663433565),
(155, 'Kade Krajcik', 'b6a8ce153364c6c8a42b4e3b97bbf659', '2017-10-11', '2018-04-13', 422, 181530443869222377),
(156, 'Reilly Ankunding', '7df18ff53de5a09ba216c20280efb645', '2018-09-10', '2018-09-12', 855, 101216937003095338),
(157, 'Trycia Waelchi', '1266f4f83f5694f79cf117242647771e', '2017-11-15', '2017-12-29', 10, 21588818818110055),
(158, 'Shanna Rutherford', 'a9c982ea48f8cf4349ff7130cc273735', '2018-02-09', '2018-07-22', 556, 227355302060567932),
(159, 'Prof. Dedrick Lehner', 'afc4160051bd291c9de765b7eb6594a5', '2018-05-12', '2018-09-17', 523, 211323869317600278),
(160, 'Tito Harvey', 'f0983a839643d89f3c48bc646f410637', '2017-10-07', '2017-10-24', 748, 245538782402503989),
(161, 'Travon Ruecker', '325a0a5a2a81d44cec27975b181a23e0', '2018-05-05', '2018-07-04', 393, 130162529507623278),
(162, 'Jamaal Kohler IV', '4aea0ac57bb17ad357e796803e63f78d', '2018-04-28', '2018-05-26', 458, 71326913419635106),
(163, 'Dina Gerlach', '2ece0b149e9a8f6dc08c2ee46bb3f864', '2018-07-03', '2018-09-02', 688, 191971805048388098),
(164, 'Verdie Waelchi', 'a61cbdcf125df6ca115d44f3fd69c61e', '2017-11-02', '2017-11-04', 872, 86018586102760748),
(165, 'Mia Fritsch', '31c42c67e3778212abbc5beef9cdcf2e', '2018-05-12', '2018-07-04', 194, 153122034636585001),
(166, 'Willie Boyer I', '3919e0e5d3e1f6eef8b79495b3617ad5', '2018-04-06', '2018-09-02', 155, 261995434153595086),
(167, 'Eldora Goodwin II', '850a7a42030028e3858e7f6fb8372162', '2018-08-03', '2018-08-22', 310, 173133240014879522),
(168, 'Samir Gerhold IV', '605ab9f827e6d95f42c204ca1a3765a0', '2017-10-20', '2018-02-19', 441, 95743082889791989),
(169, 'Carolanne Kunze', 'f7297df218edb4be407adaf2dcd7a744', '2018-01-10', '2018-08-16', 221, 14166799555298173),
(170, 'Alverta Casper', 'e4b08ffa20bbbaa9100646a5d587642d', '2018-08-25', '2018-09-19', 5, 256131869608713831),
(171, 'Ms. Hellen Kuhic Sr.', 'd6e6fb384cf2b08d91d9cf24f9e2bbce', '2017-11-14', '2018-03-20', 93, 199940197696568956),
(172, 'Prof. Ivory Ward', '13420aad933f3e1a6bbca37fce3d32f5', '2018-08-20', '2018-08-29', 872, 37984305107955796),
(173, 'Mr. Jonathan Donnelly DDS', '2775c69bce3349a9da1374342ee0116b', '2017-10-30', '2017-11-20', 17, 194125064552676741),
(174, 'Effie Jenkins', 'f238dac09a4daf523f36687f5eee7784', '2018-01-27', '2018-07-09', 782, 251053044252069122),
(175, 'Bruce Franecki I', '02f833c626749fb0a5a8475bfcdf5e9d', '2018-06-23', '2018-09-21', 899, 306262755462823012),
(176, 'Candido Kertzmann', 'd3359420310556cefe6db5a1fb7359ad', '2017-11-16', '2018-03-11', 349, 121491582950934797),
(177, 'Ima Bechtelar', '78810c0949416231168d824f41326d48', '2018-09-27', '2018-09-27', 4, 216715441614478657),
(178, 'Colleen Wiegand', 'ccd83efbde88c89038c71dfcdbf3f477', '2018-05-19', '2018-07-03', 679, 223843851672613455),
(179, 'Rudolph Ernser V', 'f9796df9ddc027e2e559bb6367be51bd', '2018-04-03', '2018-08-19', 306, 101336313762999207),
(180, 'Timmy Hodkiewicz', 'f1c74cea7cbdb81b4e758cf53f1b9023', '2018-03-01', '2018-09-01', 252, 287212766184358170),
(181, 'Dr. Alessia Doyle Jr.', '5557337c5f71ff4782afbf43abc1040c', '2017-12-19', '2018-08-17', 686, 251773626156544041),
(182, 'Giovani Blick', 'f3c8abf3681e3fefb58a1630c8b6d08a', '2018-09-21', '2018-09-27', 641, 155424885586362728),
(183, 'Billie Turner', '784ed05baa3429bb0087ef7cede5fedc', '2018-07-08', '2018-07-24', 396, 286928959470330077),
(184, 'Adele Klocko', '8d2d489f2c4243559abc6d7bcc5f101b', '2018-05-21', '2018-06-18', 497, 1223691039783608),
(185, 'Rhett Beer', '5bd4775a0fefaa7b79ced0fccc905890', '2018-03-14', '2018-05-05', 770, 297492146677380195),
(186, 'Claudia Pfeffer', '2cd085770edcdc03eca769ae35bfd7dd', '2018-09-07', '2018-09-10', 814, 73884828792274688),
(187, 'Prof. Maribel Hirthe DDS', 'a26ed8299aed6742dd35e0f4f818f967', '2018-07-08', '2018-08-31', 44, 56212481364747749),
(188, 'Evelyn Kohler', '42c24b272068c880b7cf7f4c5de1f7a7', '2018-08-23', '2018-09-07', 109, 306916173819711847),
(189, 'Bernadine Schumm', '59f0c5f8f7b51d68180a894d5a8456f2', '2018-01-23', '2018-07-19', 31, 262969255990892556),
(190, 'Mrs. Aditya Greenfelder III', 'df0e51b61d319d6723e119cf5a0f1160', '2018-09-19', '2018-09-28', 806, 281518710560723381),
(191, 'Esmeralda Hane', 'd0c4d0893ba466b04e4b37a1cbc8a009', '2018-08-15', '2018-09-20', 184, 112427090392989808),
(192, 'Prof. Jesse Hackett Sr.', '900049169c7c76af40e4f514a9be9cb7', '2017-11-22', '2018-04-24', 19, 73975506847639424),
(193, 'Harvey Rice MD', '6ecead45f08c1fdc60e19c19b5667086', '2017-10-09', '2018-07-26', 74, 140989093433012575),
(194, 'Dr. Margret Abshire DVM', 'bca17aeb1e8ff7b36f0640de06be6aa2', '2018-07-29', '2018-08-19', 157, 131776888506440693),
(195, 'Agustin Skiles', '65b4fd8bf93657035157b5923121e777', '2017-11-25', '2018-03-25', 683, 189786552769333452),
(196, 'Dr. Isabel McCullough DDS', '66ac57ed03b79ad110687819b3bf2be2', '2018-06-24', '2018-07-31', 919, 295690328820043540),
(197, 'Mr. Randi Krajcik', '7c88543c4afc194bc16d03b7f77affaa', '2018-01-13', '2018-03-26', 619, 84685621650065857),
(198, 'Michel Champlin', '48ddfd89bb6716a54239c2087de09aa2', '2018-02-19', '2018-09-09', 396, 310956689928428747),
(199, 'Phoebe Brekke Jr.', '8339d031c4fa9667bdbd22ff886ff744', '2018-07-14', '2018-08-08', 284, 111440021052312945),
(200, 'Dorris Kerluke III', 'ee10cfa7fc67ebabd85362506544c5f1', '2018-02-08', '2018-04-10', 297, 84027340280298555),
(201, 'Dannie Cummings MD', '8d3e849a03eebb4bc65e0ddf102b6c16', '2018-09-21', '2018-09-22', 157, 146053791229036405),
(202, 'Lavinia Hayes', 'b821a9ea7126ba21907066362d5326ac', '2018-05-31', '2018-09-26', 678, 131411931156489712),
(203, 'Andre Turner', '4e022f8c42c81d33c27bbd8d0108562c', '2018-06-20', '2018-07-22', 106, 172195068268857194);

--
-- Триггеры `users`
--
DELIMITER $$
CREATE TRIGGER `hash_user_password` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    SET NEW.password = md5(NEW.password);
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_has_achievements`
--

CREATE TABLE `users_has_achievements` (
  `pk` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_achievement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_has_characters`
--

CREATE TABLE `users_has_characters` (
  `pk` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_character` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users_levels`
--

CREATE TABLE `users_levels` (
  `pk` int(11) NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL,
  `experience` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users_levels`
--

INSERT INTO `users_levels` (`pk`, `level`, `experience`) VALUES
(1, 1, 0),
(2, 2, 100),
(3, 3, 150),
(4, 4, 225),
(5, 5, 338),
(6, 6, 507),
(7, 7, 761),
(8, 8, 1142),
(9, 9, 1713),
(10, 10, 2570),
(11, 11, 3855),
(12, 12, 5783),
(13, 13, 8675),
(14, 14, 13013),
(15, 15, 19520),
(16, 16, 29280),
(17, 17, 43920),
(18, 18, 65880),
(19, 19, 98820),
(20, 20, 148230),
(21, 21, 222345),
(22, 22, 333518),
(23, 23, 500277),
(24, 24, 750416),
(25, 25, 1125624),
(26, 26, 1688436),
(27, 27, 2532654),
(28, 28, 3798981),
(29, 29, 5698472),
(30, 30, 8547708),
(31, 31, 12821562),
(32, 32, 19232343),
(33, 33, 28848515),
(34, 34, 43272773),
(35, 35, 64909160),
(36, 36, 97363740),
(37, 37, 146045610),
(38, 38, 219068415),
(39, 39, 328602623),
(40, 40, 492903935),
(41, 41, 739355903),
(42, 42, 1109033855),
(43, 43, 1663550783),
(44, 44, 2495326175),
(45, 45, 3742989263),
(46, 46, 5614483895),
(47, 47, 8421725843),
(48, 48, 12632588765),
(49, 49, 18948883148),
(50, 50, 28423324722),
(51, 51, 42634987083),
(52, 52, 63952480625),
(53, 53, 95928720938),
(54, 54, 143893081407),
(55, 55, 215839622111),
(56, 56, 323759433167),
(57, 57, 485639149751),
(58, 58, 728458724627),
(59, 59, 1092688086941),
(60, 60, 1639032130412),
(61, 61, 2458548195618),
(62, 62, 3687822293427),
(63, 63, 5531733440141),
(64, 64, 8297600160212),
(65, 65, 12446400240318),
(66, 66, 18669600360477),
(67, 67, 28004400540716),
(68, 68, 42006600811074),
(69, 69, 63009901216611),
(70, 70, 94514851824917),
(71, 71, 141772277737380),
(72, 72, 212658416606060),
(73, 73, 318987624909100),
(74, 74, 478481437363640),
(75, 75, 717722156045470),
(76, 76, 1076583234068200),
(77, 77, 1614874851102300),
(78, 78, 2422312276653400),
(79, 79, 3633468414980200),
(80, 80, 5450202622470300),
(81, 81, 8175303933705400),
(82, 82, 12262955900558000),
(83, 83, 18394433850837000),
(84, 84, 27591650776256000),
(85, 85, 41387476164384000),
(86, 86, 62081214246575000),
(87, 87, 93121821369863000),
(88, 88, 139682732054790000),
(89, 89, 209524098082190000),
(90, 90, 314286147123290000),
(91, 91, 471429220684930000),
(92, 92, 707143831027400000),
(93, 93, 1060715746541100000),
(94, 94, 1591073619811600000),
(95, 95, 2386610429717500000),
(96, 96, 3579915644576200000),
(97, 97, 5369873466864300000),
(98, 98, 8054810200296400000),
(99, 99, 12082215300445000000),
(100, 100, 18123322950667000000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`pk`);

--
-- Индексы таблицы `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `character_name_uindex` (`name`),
  ADD KEY `characters_characters_lines_pk_fk_2` (`fk_second_line`),
  ADD KEY `characters_characters_lines_pk_fk` (`fk_first_line`);

--
-- Индексы таблицы `characters_levels`
--
ALTER TABLE `characters_levels`
  ADD PRIMARY KEY (`pk`);

--
-- Индексы таблицы `characters_lines`
--
ALTER TABLE `characters_lines`
  ADD PRIMARY KEY (`pk`);

--
-- Индексы таблицы `characters_parametrs`
--
ALTER TABLE `characters_parametrs`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `characters_parametrs_characters_pk_fk` (`fk_character`);

--
-- Индексы таблицы `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `matches_match_status_pk_fk` (`fk_status`);

--
-- Индексы таблицы `matches_logs`
--
ALTER TABLE `matches_logs`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `matches_logs_matches_pk_fk` (`fk_match`),
  ADD KEY `matches_logs_users_pk_fk` (`fk_user_1`),
  ADD KEY `matches_logs_users_pk_fk_2` (`fk_user_2`);

--
-- Индексы таблицы `matches_logs_events`
--
ALTER TABLE `matches_logs_events`
  ADD PRIMARY KEY (`pk`);

--
-- Индексы таблицы `matches_partys`
--
ALTER TABLE `matches_partys`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `match_party_matches_pk_fk` (`fk_match`),
  ADD KEY `match_party_match_team_pk_fk` (`fk_team_1`),
  ADD KEY `match_party_match_team_pk_fk_2` (`fk_team_2`);

--
-- Индексы таблицы `matches_statuses`
--
ALTER TABLE `matches_statuses`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `match_status_status_uindex` (`status`);

--
-- Индексы таблицы `matches_teams`
--
ALTER TABLE `matches_teams`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `matches_teams_users_has_characters_pk_fk` (`fk_user_has_ch_1`),
  ADD KEY `matches_teams_users_has_characters_pk_fk_2` (`fk_user_has_ch_2`),
  ADD KEY `matches_teams_users_has_characters_pk_fk_3` (`fk_user_has_ch_3`),
  ADD KEY `matches_teams_users_has_characters_pk_fk_4` (`fk_user_has_ch_4`),
  ADD KEY `matches_teams_users_has_characters_pk_fk_5` (`fk_user_has_ch_5`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `users_login_uindex` (`login`);

--
-- Индексы таблицы `users_has_achievements`
--
ALTER TABLE `users_has_achievements`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `users_has_achievements_users_pk_fk` (`fk_user`),
  ADD KEY `users_has_achievements_achievements_pk_fk` (`fk_achievement`);

--
-- Индексы таблицы `users_has_characters`
--
ALTER TABLE `users_has_characters`
  ADD PRIMARY KEY (`pk`),
  ADD KEY `user_has_character_users_pk_fk` (`fk_user`),
  ADD KEY `user_has_character_character_pk_fk` (`fk_character`);

--
-- Индексы таблицы `users_levels`
--
ALTER TABLE `users_levels`
  ADD PRIMARY KEY (`pk`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `achievements`
--
ALTER TABLE `achievements`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `characters`
--
ALTER TABLE `characters`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `characters_levels`
--
ALTER TABLE `characters_levels`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `characters_lines`
--
ALTER TABLE `characters_lines`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `characters_parametrs`
--
ALTER TABLE `characters_parametrs`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `matches`
--
ALTER TABLE `matches`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `matches_logs`
--
ALTER TABLE `matches_logs`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `matches_logs_events`
--
ALTER TABLE `matches_logs_events`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `matches_partys`
--
ALTER TABLE `matches_partys`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `matches_statuses`
--
ALTER TABLE `matches_statuses`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `matches_teams`
--
ALTER TABLE `matches_teams`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT для таблицы `users_has_achievements`
--
ALTER TABLE `users_has_achievements`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_has_characters`
--
ALTER TABLE `users_has_characters`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_levels`
--
ALTER TABLE `users_levels`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_characters_lines_pk_fk` FOREIGN KEY (`fk_first_line`) REFERENCES `characters_lines` (`pk`),
  ADD CONSTRAINT `characters_characters_lines_pk_fk_2` FOREIGN KEY (`fk_second_line`) REFERENCES `characters_lines` (`pk`);

--
-- Ограничения внешнего ключа таблицы `characters_parametrs`
--
ALTER TABLE `characters_parametrs`
  ADD CONSTRAINT `characters_parametrs_characters_pk_fk` FOREIGN KEY (`fk_character`) REFERENCES `characters` (`pk`);

--
-- Ограничения внешнего ключа таблицы `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_match_status_pk_fk` FOREIGN KEY (`fk_status`) REFERENCES `matches_statuses` (`pk`);

--
-- Ограничения внешнего ключа таблицы `matches_logs`
--
ALTER TABLE `matches_logs`
  ADD CONSTRAINT `matches_logs_matches_pk_fk` FOREIGN KEY (`fk_match`) REFERENCES `matches` (`pk`),
  ADD CONSTRAINT `matches_logs_users_pk_fk` FOREIGN KEY (`fk_user_1`) REFERENCES `users` (`pk`),
  ADD CONSTRAINT `matches_logs_users_pk_fk_2` FOREIGN KEY (`fk_user_2`) REFERENCES `users` (`pk`);

--
-- Ограничения внешнего ключа таблицы `matches_partys`
--
ALTER TABLE `matches_partys`
  ADD CONSTRAINT `match_party_match_team_pk_fk` FOREIGN KEY (`fk_team_1`) REFERENCES `matches_teams` (`pk`),
  ADD CONSTRAINT `match_party_match_team_pk_fk_2` FOREIGN KEY (`fk_team_2`) REFERENCES `matches_teams` (`pk`),
  ADD CONSTRAINT `match_party_matches_pk_fk` FOREIGN KEY (`fk_match`) REFERENCES `matches` (`pk`);

--
-- Ограничения внешнего ключа таблицы `matches_teams`
--
ALTER TABLE `matches_teams`
  ADD CONSTRAINT `matches_teams_users_has_characters_pk_fk` FOREIGN KEY (`fk_user_has_ch_1`) REFERENCES `users_has_characters` (`pk`),
  ADD CONSTRAINT `matches_teams_users_has_characters_pk_fk_2` FOREIGN KEY (`fk_user_has_ch_2`) REFERENCES `users_has_characters` (`pk`),
  ADD CONSTRAINT `matches_teams_users_has_characters_pk_fk_3` FOREIGN KEY (`fk_user_has_ch_3`) REFERENCES `users_has_characters` (`pk`),
  ADD CONSTRAINT `matches_teams_users_has_characters_pk_fk_4` FOREIGN KEY (`fk_user_has_ch_4`) REFERENCES `users_has_characters` (`pk`),
  ADD CONSTRAINT `matches_teams_users_has_characters_pk_fk_5` FOREIGN KEY (`fk_user_has_ch_5`) REFERENCES `users_has_characters` (`pk`);

--
-- Ограничения внешнего ключа таблицы `users_has_achievements`
--
ALTER TABLE `users_has_achievements`
  ADD CONSTRAINT `users_has_achievements_achievements_pk_fk` FOREIGN KEY (`fk_achievement`) REFERENCES `achievements` (`pk`),
  ADD CONSTRAINT `users_has_achievements_users_pk_fk` FOREIGN KEY (`fk_user`) REFERENCES `users` (`pk`);

--
-- Ограничения внешнего ключа таблицы `users_has_characters`
--
ALTER TABLE `users_has_characters`
  ADD CONSTRAINT `user_has_character_character_pk_fk` FOREIGN KEY (`fk_character`) REFERENCES `characters` (`pk`),
  ADD CONSTRAINT `user_has_character_users_pk_fk` FOREIGN KEY (`fk_user`) REFERENCES `users` (`pk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
