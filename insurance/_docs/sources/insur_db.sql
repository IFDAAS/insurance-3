-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- ����: insur.mysql
-- ����� ��������: ��� 23 2012 �., 22:24
-- ������ �������: 5.1.41
-- ������ PHP: 5.2.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- ���� ������: `insur_db`
--

-- --------------------------------------------------------

--
-- ��������� ������� `insur_article_categories`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_article_categories`;
CREATE TABLE IF NOT EXISTS `insur_article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��������� ������� `insur_article_content`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_article_content`;
CREATE TABLE IF NOT EXISTS `insur_article_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `created` datetime DEFAULT NULL COMMENT 'дата/время создания',
  `status` int(11) DEFAULT NULL COMMENT 'по умолчанию - опубликована, доступна. -1 - заблокирована',
  `insur_coworkers_id` int(11) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`insur_coworkers_id`),
  KEY `fk_insur_article_content_insur_coworkers1` (`insur_coworkers_id`),
  KEY `FK_insur_article_content_insur_insurance_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='													' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��������� ������� `insur_article_matrix`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_article_matrix`;
CREATE TABLE IF NOT EXISTS `insur_article_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_category_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`article_category_id`,`article_id`),
  KEY `fk_insur_article_matrix_insur_article_categories1` (`article_category_id`),
  KEY `fk_insur_article_matrix_insur_article_content1` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��������� ������� `insur_coworkers`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_coworkers`;
CREATE TABLE IF NOT EXISTS `insur_coworkers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL COMMENT 'id должности',
  `name_middlename_surname` text COMMENT 'Фамилия, имя, отчество',
  `insur_workers_roles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`insur_workers_roles_id`),
  KEY `fk_insur_coworkers_insur_workers_roles` (`insur_workers_roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��������� ������� `insur_insurance_object`
--
-- ��������: ��� 23 2012 �., 13:16
--

DROP TABLE IF EXISTS `insur_insurance_object`;
CREATE TABLE IF NOT EXISTS `insur_insurance_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `date_changes` datetime DEFAULT NULL,
  `title` varchar(45) NOT NULL COMMENT 'META: title',
  `keywords` text NOT NULL COMMENT 'META: keywords',
  `description` text NOT NULL COMMENT 'META: description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=237 AUTO_INCREMENT=71 ;

--
-- ���� ������ ������� `insur_insurance_object`
--

INSERT INTO `insur_insurance_object` (`id`, `name`, `status`, `parent_id`, `alias`, `category_id`, `date_changes`, `title`, `keywords`, `description`) VALUES
(1, '�������', 1, -1, 'site/index', NULL, NULL, '', '', ''),
(2, '� ��������', 1, -1, 'o_kompanii', NULL, NULL, '', '', ''),
(3, '�������', 1, 2, 'istorija', NULL, NULL, '', '', ''),
(4, '� ����������', 1, 2, 'o_korporatzii', NULL, NULL, '', '', ''),
(5, '�����������', 1, 2, 'rukovodstvo', NULL, NULL, '', '', ''),
(6, '��������� ����������', 1, 2, 'raskrytije_informatzii', NULL, NULL, '', '', ''),
(7, '��������', 1, 6, 'document', NULL, NULL, '', '', ''),
(8, '����� �����������', 1, 2, 'musey_strahovanija', NULL, NULL, '', '', ''),
(9, '��������', 1, 2, 'vakansiji', NULL, NULL, '', '', ''),
(10, '������ ��� ���������', 1, 9, 'anketa', NULL, NULL, '', '', ''),
(11, '������� ��������', 1, 2, 'novosti', NULL, NULL, '', '', ''),
(12, '�������', 1, 11, 'novost1', NULL, NULL, '', '', ''),
(13, '��������', 1, 2, 'kontakty', NULL, NULL, '', '', ''),
(14, '���������� ����������', 1, 2, 'finansovyje_pokazatli', NULL, NULL, '', '', ''),
(15, '������� �����������', 1, 2, 'novosti_strahovanija', NULL, NULL, '', '', ''),
(16, '�������', 1, 15, 'novost2', NULL, NULL, '', '', ''),
(17, '�������', 1, 15, 'novost3', NULL, NULL, '', '', ''),
(18, '������������� ��������', 1, -1, 'korporativnym_klientam', NULL, NULL, '', '', ''),
(19, '������� ������� 1', 1, 18, 'gotovoje_reshenije1', NULL, NULL, '', '', ''),
(20, '������� ������� 2', 1, 18, 'gotovoje_reshenije2', NULL, NULL, '', '', ''),
(21, '���������������', 1, 18, 'avtostrahovanije18', NULL, NULL, '', '', ''),
(22, '���', 1, 18, 'dms18', NULL, NULL, '', '', ''),
(23, '���� ��������� ��������� ������', 1, 22, 'strahovoj_sluchaj', NULL, NULL, '', '', ''),
(24, '�������� ����������', 1, 18, 'poleznaja_informatzija18', NULL, NULL, '', '', ''),
(25, '������ � �������� �������', 1, -1, 'malomu_i_srednemu_biznesu', NULL, NULL, '', '', ''),
(26, '������������ ���������', 1, 25, 'stroitelnym_kompanijam', NULL, NULL, '', '', ''),
(27, '����������� ���������', 1, 26, 'strahovanije_imushestva26', NULL, NULL, '', '', ''),
(28, '����������� ������� ��������', 1, 26, 'strahovanije_opasyh_objectov', NULL, NULL, '', '', ''),
(29, '����������� �����������-��������� �����', 1, 26, 'strahovanije_stroitelno_montazhnyh_rabot', NULL, NULL, '', '', ''),
(30, '���', 1, 26, 'dms26', NULL, NULL, '', '', ''),
(31, '��', 1, 26, 'ns26', NULL, NULL, '', '', ''),
(32, '���', 1, 26, 'vzr26', NULL, NULL, '', '', ''),
(33, '����������� ���������', 1, 26, 'strahovanije_avtoparka', NULL, NULL, '', '', ''),
(34, '���������������� ��������', 1, 25, 'proizvodstvennyje_kompaniji', NULL, NULL, '', '', ''),
(35, '�������� �����������', 1, 25, 'kompaniji_perevozchiki', NULL, NULL, '', '', ''),
(36, '���������������� ��������', 1, 25, 'farmazevticheskije_kompaniji', NULL, NULL, '', '', ''),
(37, '���', 1, 25, 'dms25', NULL, NULL, '', '', ''),
(38, '���', 1, 25, 'vzr25', NULL, NULL, '', '', ''),
(39, '���������������', 1, 25, 'avtostrahovanije25', NULL, NULL, '', '', ''),
(40, '�����', 1, 40, 'osago', NULL, NULL, '', '', ''),
(41, '�����', 1, 40, 'kasko', NULL, NULL, '', '', ''),
(42, '�������� ����������', 1, 25, 'poleznaja_informatzija25', NULL, NULL, '', '', ''),
(43, '���������� �����', 1, -1, 'fizicheskim_litzam', NULL, NULL, '', '', ''),
(44, '�������������', 1, 43, 'avtovladeltzy', NULL, NULL, '', '', ''),
(45, '��', 1, 44, 'go', NULL, NULL, '', '', ''),
(46, '���', 1, 44, 'vzr44', NULL, NULL, '', '', ''),
(47, '��', 1, 44, 'ns44', NULL, NULL, '', '', ''),
(48, '���', 1, 44, 'dms44', NULL, NULL, '', '', ''),
(49, '���������������', 1, 44, 'avtostrahovanije44', NULL, NULL, '', '', ''),
(50, '����������� ���������', 1, 44, 'strahovanije_imushestva44', NULL, NULL, '', '', ''),
(51, '��������� ������������', 1, 43, 'vladeltzy_nedvizhimosti', NULL, NULL, '', '', ''),
(52, '�������', 1, 43, 'turisty', NULL, NULL, '', '', ''),
(53, '�����', 1, 43, 'semja', NULL, NULL, '', '', ''),
(54, '�������������� ������ �������', 1, 43, 'individualnyj_podbor_reshenij', NULL, NULL, '', '', ''),
(55, '���', 1, 43, 'vzr43', NULL, NULL, '', '', ''),
(56, '����������� ���������', 1, 43, 'strahovanije_imushestva43', NULL, NULL, '', '', ''),
(57, '��������', 1, 56, 'kvartiry', NULL, NULL, '', '', ''),
(58, '�����������', 1, 57, 'kalkulator', NULL, NULL, '', '', ''),
(59, '���������� ����', 1, 56, 'zagorodnyje_doma', NULL, NULL, '', '', ''),
(60, '����', 1, 56, 'dachi', NULL, NULL, '', '', ''),
(61, '�������� ����������', 1, 43, 'poleznaja_informatzija43', NULL, NULL, '', '', ''),
(62, '���������', 1, -1, 'partneram', NULL, NULL, '', '', ''),
(63, '������', 1, 62, 'bankam', NULL, NULL, '', '', ''),
(64, '��������', 1, 62, 'brokeram', NULL, NULL, '', '', ''),
(66, '����������� �����������', 1, 62, 'medicinskim_uchrezhdenijam', NULL, NULL, '', '', ''),
(67, '�����������', 1, 62, 'avtosalonam', NULL, NULL, '', '', ''),
(68, '��������� ������', 1, -2, 'site/otpravit_zajavku', NULL, NULL, '', '', ''),
(69, '������ ������', 1, -2, 'site/zadat_vopros', NULL, NULL, '', '', ''),
(70, '���� ��������� ��������� ������', 1, -2, 'esli_proizoshel_strahovoj_sluchay/', NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- ��������� ������� `insur_object_category`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_object_category`;
CREATE TABLE IF NOT EXISTS `insur_object_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=4 ;

--
-- ���� ������ ������� `insur_object_category`
--

INSERT INTO `insur_object_category` (`id`, `name`) VALUES
(1, 'subject'),
(2, 'isurance_type'),
(3, 'product');

-- --------------------------------------------------------

--
-- ��������� ������� `insur_users`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_users`;
CREATE TABLE IF NOT EXISTS `insur_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

--
-- ���� ������ ������� `insur_users`
--

INSERT INTO `insur_users` (`id`, `login`, `password`, `status`, `role`) VALUES
(1, 'frol', '46f94c8de14fb36680850768ff1b7f2a', 1, 'admin');

-- --------------------------------------------------------

--
-- ��������� ������� `insur_workers_roles`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `insur_workers_roles`;
CREATE TABLE IF NOT EXISTS `insur_workers_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL COMMENT 'должность',
  `description` varchar(45) DEFAULT NULL COMMENT 'Описание должности',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��������� ������� `users`
--
-- ��������: ��� 21 2012 �., 11:14
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

--
-- ���� ������ ������� `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `status`, `role`) VALUES
(1, 'frol', '46f94c8de14fb36680850768ff1b7f2a', 1, 'admin');

--
-- ����������� �������� ����� ����������� ������
--

--
-- ����������� �������� ����� ������� `insur_article_content`
--
ALTER TABLE `insur_article_content`
  ADD CONSTRAINT `fk_insur_article_content_insur_coworkers1` FOREIGN KEY (`insur_coworkers_id`) REFERENCES `insur_coworkers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_insur_article_content_insur_insurance_object_id` FOREIGN KEY (`object_id`) REFERENCES `insur_insurance_object` (`id`);

--
-- ����������� �������� ����� ������� `insur_article_matrix`
--
ALTER TABLE `insur_article_matrix`
  ADD CONSTRAINT `fk_insur_article_matrix_insur_article_categories1` FOREIGN KEY (`article_category_id`) REFERENCES `insur_article_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_insur_article_matrix_insur_article_content1` FOREIGN KEY (`article_id`) REFERENCES `insur_article_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- ����������� �������� ����� ������� `insur_coworkers`
--
ALTER TABLE `insur_coworkers`
  ADD CONSTRAINT `fk_insur_coworkers_insur_workers_roles` FOREIGN KEY (`insur_workers_roles_id`) REFERENCES `insur_workers_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- ����������� �������� ����� ������� `insur_insurance_object`
--
ALTER TABLE `insur_insurance_object`
  ADD CONSTRAINT `FK_insur_insurance_object_insur_object_category_id` FOREIGN KEY (`category_id`) REFERENCES `insur_object_category` (`id`);
