-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306

-- Generation Time: Sep 11, 2012 at 04:04 PM
-- Server version: 5.5.23
-- PHP Version: 5.4.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `librivox_catalog_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `psuedo_first_name` varchar(55) DEFAULT NULL,
  `psuedo_last_name` varchar(55) DEFAULT NULL,
  `author_url` text,
  `other_url` text,
  `dob` varchar(10) DEFAULT NULL,
  `dod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_number` int(3) NOT NULL,
  `key` varchar(40) NOT NULL,
  `value` text,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_projects`
--

CREATE TABLE `group_projects` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(55) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `active`, `sort_order`) VALUES
(1, 'English', 1, 10),
(2, 'French', 1, 20),
(3, 'German', 1, 30),
(4, 'Italian', 1, 40),
(5, 'Spanish', 1, 50),
(6, 'Afrikaans', 1, 60),
(7, 'Aleut', 1, 70),
(8, 'Ancient Greek', 1, 80),
(9, 'Arabic', 1, 90),
(10, 'Bengali', 1, 100),
(11, 'Bisaya', 1, 110),
(12, 'Bulgarian', 1, 120),
(13, 'Catalan', 1, 130),
(14, 'Chinese', 1, 140),
(15, 'Church Slavonic', 1, 150),
(16, 'Czech', 1, 160),
(17, 'Danish', 1, 170),
(18, 'Dholuo', 1, 180),
(19, 'Dutch', 1, 190),
(20, 'Esperanto', 1, 200),
(21, 'Farsi', 1, 210),
(22, 'Finnish', 1, 220),
(23, 'Friulano', 1, 230),
(24, 'Gamilaraay', 1, 240),
(25, 'Gascon', 1, 250),
(26, 'Greek', 1, 260),
(27, 'Hebrew', 1, 270),
(28, 'Hungarian', 1, 280),
(29, 'Icelandic', 1, 290),
(30, 'Iloko', 1, 300),
(31, 'Indonesian', 1, 310),
(32, 'Interlingua', 1, 320),
(33, 'Irish', 1, 330),
(34, 'Iroquoian', 1, 340),
(35, 'Japanese', 1, 350),
(36, 'Javanese', 1, 360),
(37, 'Khasi', 1, 370),
(38, 'Korean', 1, 380),
(39, 'Latin', 1, 390),
(40, 'Latvian', 1, 400),
(41, 'Lithuanian', 1, 410),
(42, 'Maltese', 1, 420),
(43, 'Mayan Languages', 1, 430),
(44, 'Middle English', 1, 440),
(45, 'Multilingual', 1, 450),
(46, 'Nahuatl', 1, 460),
(47, 'Napoletano-Calabrese', 1, 470),
(48, 'North American Indian', 1, 480),
(49, 'Norwegian', 1, 490),
(50, 'Old English', 1, 500),
(51, 'Polish', 1, 510),
(52, 'Portuguese', 1, 520),
(53, 'Romanian', 1, 530),
(54, 'Russian', 1, 540),
(55, 'Sanskrit', 1, 550),
(56, 'Serbian', 1, 560),
(57, 'Slovak', 1, 570),
(58, 'Swedish', 1, 580),
(59, 'Tagalog', 1, 590),
(60, 'Tamil', 1, 600),
(61, 'Turkish', 1, 610),
(62, 'Ukrainian', 1, 620),
(63, 'Urdu', 1, 630),
(64, 'Welsh', 1, 640),
(65, 'Yiddish', 1, 650),
(66, 'Other', 1, 660);
-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `display_name` varchar(55) DEFAULT NULL,
  `agreement` tinyint(1) DEFAULT 0,
  `max_projects` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `person_roles`
--

CREATE TABLE `person_roles` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) DEFAULT 0,
  `person_bc_id` int(11) DEFAULT 0,
  `person_altbc_id` int(11) DEFAULT 0,
  `person_mc_id` int(11) DEFAULT 0,
  `person_pl_id` int(11) DEFAULT 0,
  `title_prefix` varchar(55) DEFAULT NULL,
  `title` text,
  `description` text,
  `project_type` varchar(55) DEFAULT NULL,
  `num_sections` int(11) DEFAULT 0,
  `has_preface` tinyint(1) DEFAULT 0,
  `date_target` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `url_text_source` text,
  `url_project` text,
  `url_other` text,
  `date_begin` datetime DEFAULT NULL,
  `copyright_check` int(11) DEFAULT NULL,
  `url_librivox` text,
  `url_forum` text,
  `url_iarchive` text,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_authors`
--

CREATE TABLE `project_authors` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_categories`
--

CREATE TABLE `project_categories` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_genres`
--

CREATE TABLE `project_genres` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `readers`
--

CREATE TABLE `readers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `section_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `section_number` int(11) DEFAULT 1,
  `title` text,
  `listen_url` text,
  `status` varchar(55) DEFAULT NULL,
  `pl_status` varchar(55) DEFAULT NULL,
  `word_count` int(11) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



--
-- Table structure for table `section_readers`
--

CREATE TABLE `section_readers` (
  `reader_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`reader_id`,`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;