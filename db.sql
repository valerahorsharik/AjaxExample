-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 31, 2016 at 11:03 AM
-- Server version: 5.5.49-0+deb8u1-log
-- PHP Version: 5.6.20-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `expertb6_CRM`
--

-- --------------------------------------------------------

--
-- Table structure for table `cc_callcenters`
--

CREATE TABLE IF NOT EXISTS `cc_callcenters` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `director_id` int(11) NOT NULL,
  `broker_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_callcenters`
--

INSERT INTO `cc_callcenters` (`id`, `name`, `director_id`, `broker_id`, `type_id`, `phone`, `email`, `skype`, `address`, `city`, `country_id`, `active`) VALUES
(1, 'KievExpert', 0, 9, 1, NULL, NULL, NULL, NULL, '1', 223, 1),
(5, 'NewCenter', 3, 9, 1, '45546', 'bn@gmail.net', 'skype', 'addess', 'city', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_desks`
--

CREATE TABLE IF NOT EXISTS `cc_desks` (
`id` int(11) NOT NULL,
  `id_callcenter` int(11) NOT NULL,
  `director_id` int(11) DEFAULT NULL,
  `broker_id` int(11) NOT NULL,
  `desk_manager_id` int(11) DEFAULT NULL,
  `desk_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_desks`
--

INSERT INTO `cc_desks` (`id`, `id_callcenter`, `director_id`, `broker_id`, `desk_manager_id`, `desk_name`, `active`) VALUES
(1, 1, 19, 9, 20, 'English Desk', 1),
(2, 1, 19, 9, 20, 'Russian Desk', 1),
(3, 1, 12, 1, 7, 'NewDesk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_teams`
--

CREATE TABLE IF NOT EXISTS `cc_teams` (
`id` int(11) NOT NULL,
  `id_desk` int(11) NOT NULL,
  `team_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `teamleader_id` int(11) NOT NULL,
  `amount_of_shift_id` int(11) NOT NULL,
  `shift_work_time_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_teams`
--

INSERT INTO `cc_teams` (`id`, `id_desk`, `team_name`, `teamleader_id`, `amount_of_shift_id`, `shift_work_time_id`, `active`) VALUES
(1, 1, 'Team 1', 20, 1, 1, 1),
(2, 2, 'Team 2', 20, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_types`
--

CREATE TABLE IF NOT EXISTS `cc_types` (
`id` int(11) NOT NULL,
  `cc_type_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cc_type_short` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_types`
--

INSERT INTO `cc_types` (`id`, `cc_type_name`, `cc_type_short`) VALUES
(1, 'Binary', 'BO'),
(2, 'Forex', 'FX'),
(3, 'Binary+Forex', 'BF');

-- --------------------------------------------------------

--
-- Table structure for table `cc_users`
--

CREATE TABLE IF NOT EXISTS `cc_users` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stage_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cc_users`
--

INSERT INTO `cc_users` (`id`, `user_id`, `stage_name`, `user_type_id`, `team_id`, `active`) VALUES
(1, 8, 'Merry Fletcher', 2, 1, 1),
(2, 9, 'Rachel Mayers', 2, 1, 1),
(3, 10, 'Robert Green', 2, 1, 1),
(4, 11, 'Marcus Bleick', 2, 1, 1),
(5, 12, 'Mark Dyson', 2, 1, 1),
(6, 13, 'Egor Frolov', 2, 2, 1),
(7, 14, 'Sergey Golubev', 2, 2, 1),
(8, 15, 'Alyona Gumilyova', 2, 2, 1),
(9, 16, 'Dmitriy Saltykov', 2, 2, 1),
(10, 3, 'Ragnar Lodbrok', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salestatus`
--

CREATE TABLE IF NOT EXISTS `salestatus` (
`id` int(11) NOT NULL,
  `nameStatus` varchar(255) CHARACTER SET latin1 NOT NULL,
  `spotoptionstatus` enum('new','noAnswer','checkNumber','callAgain','notInterested','inTheMoney','noCall','notSupported') COLLATE utf8_unicode_ci DEFAULT NULL,
  `techfinancialsstatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fastChangeStatus` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salestatus`
--

INSERT INTO `salestatus` (`id`, `nameStatus`, `spotoptionstatus`, `techfinancialsstatus`, `fastChangeStatus`) VALUES
(1, 'new', 'new', '800, 875', 0),
(2, 'depositor', 'inTheMoney', '880, 884, 886', 0),
(3, 'no answer', 'noAnswer', '820', 1),
(4, 'not interested', 'notInterested', '910, 1340', 0),
(5, 'wrong number', 'checkNumber', '830', 1),
(6, 'not supported', 'notSupported', '', 0),
(7, 'reasign', NULL, '', 0),
(8, 'call back', 'callAgain', '810, 821, 822, 840, 845, 850, 860, 895, 1330', 0),
(9, 'under age', NULL, '', 1),
(10, 'not valid', NULL, '846, 890, 900, 1430', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `date_registration` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_active` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `photo_small` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_big` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `firstname`, `lastname`, `position`, `email`, `active`, `date_registration`, `date_active`, `phone`, `skype`, `photo_small`, `photo_big`) VALUES
(1, 'test', 'CBFO3Ao9BB7tg', NULL, NULL, NULL, 'test999@mail.ru', 0, '2015-03-04 09:46:01', '2016-05-27 10:13:46', '', '', '/skins/default/img/ava.jpg', '/uploaded/avatar/100x100/20150304-095741img50231.jpg'),
(2, '2', 'CB.Xzw5xjwAkk', 'Maksim', 'Yurchenko', 'cto', '2', 1, '2016-05-24 14:57:18', '2016-05-31 08:00:14', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(3, '3', 'CBpJ63BZ2DTFo', 'Volodymyr', 'Babak', NULL, '3', 1, '2016-05-24 15:09:18', '2016-05-30 15:35:29', '30637690432', 'skyper', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(4, '4', 'CBs2AchYpeIgA', 'Anna', 'Gashenko', NULL, '4', 1, '2016-05-24 15:11:44', '2016-05-31 06:28:59', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(5, '5', 'CBDKfxikcfELc', 'Igor', 'Bogodaiko', NULL, '5', 1, '2016-05-24 15:17:30', '2016-05-31 07:43:08', '+380957395552', 'igor_inspiron', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(6, '6', 'CBRXVZmsKANp2', 'Vlad', 'Dobkin', NULL, '6', 1, '2016-05-24 15:20:16', '2016-05-31 07:56:33', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(7, '7', 'CBUBq1A5v3EhA', 'Adler', 'Oswaldo', NULL, '7', 1, '2016-05-24 15:22:52', '2016-05-30 13:30:57', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(8, '8', 'CB//i0U4HT2Jk', 'Мария', 'Егода', NULL, '8', 1, '2016-05-26 14:22:09', '2016-05-27 11:00:11', '+1234567890', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(9, '9', 'CBbb0NBhPwUAQ', 'Рейчал', 'Адедоин', NULL, '9', 1, '2016-05-26 14:23:45', '2016-05-26 11:34:38', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(10, '10', 'CBi3HPc51qlSY', 'Simon', 'Lysonge', NULL, '10', 1, '2016-05-26 14:25:13', '2016-05-26 11:45:16', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(11, '11', 'CBz8GDC.KCbBM', 'Ali', 'Sher', NULL, '11', 1, '2016-05-26 14:25:44', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(12, '12', 'CBGxpJFwY6OA6', 'Anes', 'Swesi', NULL, '12', 1, '2016-05-26 14:26:10', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(13, '13', 'CBk6OhUzU.y3M', 'Егор', 'Бурнос', NULL, '13', 1, '2016-05-26 14:26:58', '2016-05-30 06:48:37', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(14, '14', 'CBh5IKOiZST2Q', 'Владислав', 'Василевский', NULL, '14', 1, '2016-05-26 14:27:23', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(15, '15', 'CBRFLsuW7jQnU', 'Катерина', 'Пасечнюк', NULL, '15', 1, '2016-05-26 14:28:11', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(16, '16', 'CBQ4g7GwAxku6', 'Дмитрий', 'Кривушкин', NULL, '16', 1, '2016-05-26 14:28:31', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(19, '19', 'CBCO3GdYEpMQk', 'Diana', 'Adamchuk', NULL, '19', 1, '2016-05-26 18:49:42', '2016-05-30 15:25:55', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png'),
(20, '20', 'CBo1F1lFoxS3Y', 'Марта', 'Резовских', NULL, '20', 1, '2016-05-27 10:15:30', '0000-00-00 00:00:00', '', '', '/uploaded/avatar/20x20/default_small.png', '/uploaded/avatar/100x100/default_large.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc_callcenters`
--
ALTER TABLE `cc_callcenters`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `director_id` (`director_id`), ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `cc_desks`
--
ALTER TABLE `cc_desks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `desk_name` (`desk_name`), ADD KEY `broker_id` (`broker_id`);

--
-- Indexes for table `cc_teams`
--
ALTER TABLE `cc_teams`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_types`
--
ALTER TABLE `cc_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_users`
--
ALTER TABLE `cc_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salestatus`
--
ALTER TABLE `salestatus`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nameStatus` (`nameStatus`), ADD FULLTEXT KEY `techfinancialsstatus` (`techfinancialsstatus`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ixEmail` (`email`), ADD UNIQUE KEY `ixLogin` (`login`(10)), ADD KEY `ixIdHash` (`id`), ADD KEY `ixLoginPassActive` (`login`,`password`,`active`), ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc_callcenters`
--
ALTER TABLE `cc_callcenters`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cc_desks`
--
ALTER TABLE `cc_desks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cc_teams`
--
ALTER TABLE `cc_teams`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cc_types`
--
ALTER TABLE `cc_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cc_users`
--
ALTER TABLE `cc_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `salestatus`
--
ALTER TABLE `salestatus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
