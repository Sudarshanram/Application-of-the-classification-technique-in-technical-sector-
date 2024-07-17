-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2022 at 08:34 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `client_data`
--
CREATE DATABASE IF NOT EXISTS `client_data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `client_data`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add client_model', 7, 'add_client_model'),
(26, 'Can change client_model', 7, 'change_client_model'),
(27, 'Can delete client_model', 7, 'delete_client_model'),
(28, 'Can view client_model', 7, 'view_client_model'),
(29, 'Can add project_model', 8, 'add_project_model'),
(30, 'Can change project_model', 8, 'change_project_model'),
(31, 'Can delete project_model', 8, 'delete_project_model'),
(32, 'Can view project_model', 8, 'view_project_model'),
(33, 'Can add technical_model', 9, 'add_technical_model'),
(34, 'Can change technical_model', 9, 'change_technical_model'),
(35, 'Can delete technical_model', 9, 'delete_technical_model'),
(36, 'Can view technical_model', 9, 'view_technical_model'),
(37, 'Can add client_detail_model', 10, 'add_client_detail_model'),
(38, 'Can change client_detail_model', 10, 'change_client_detail_model'),
(39, 'Can delete client_detail_model', 10, 'delete_client_detail_model'),
(40, 'Can view client_detail_model', 10, 'view_client_detail_model'),
(41, 'Can add client_project_details', 11, 'add_client_project_details'),
(42, 'Can change client_project_details', 11, 'change_client_project_details'),
(43, 'Can delete client_project_details', 11, 'delete_client_project_details'),
(44, 'Can view client_project_details', 11, 'view_client_project_details'),
(45, 'Can add client_project_model', 11, 'add_client_project_model'),
(46, 'Can change client_project_model', 11, 'change_client_project_model'),
(47, 'Can delete client_project_model', 11, 'delete_client_project_model'),
(48, 'Can view client_project_model', 11, 'view_client_project_model'),
(49, 'Can add client_details_send', 12, 'add_client_details_send'),
(50, 'Can change client_details_send', 12, 'change_client_details_send'),
(51, 'Can delete client_details_send', 12, 'delete_client_details_send'),
(52, 'Can view client_details_send', 12, 'view_client_details_send'),
(53, 'Can add project_team_report_upload', 13, 'add_project_team_report_upload'),
(54, 'Can change project_team_report_upload', 13, 'change_project_team_report_upload'),
(55, 'Can delete project_team_report_upload', 13, 'delete_project_team_report_upload'),
(56, 'Can view project_team_report_upload', 13, 'view_project_team_report_upload'),
(57, 'Can add project_team_report', 13, 'add_project_team_report'),
(58, 'Can change project_team_report', 13, 'change_project_team_report'),
(59, 'Can delete project_team_report', 13, 'delete_project_team_report'),
(60, 'Can view project_team_report', 13, 'view_project_team_report'),
(61, 'Can add team', 14, 'add_team'),
(62, 'Can change team', 14, 'change_team'),
(63, 'Can delete team', 14, 'delete_team'),
(64, 'Can view team', 14, 'view_team'),
(65, 'Can add document_upload', 15, 'add_document_upload'),
(66, 'Can change document_upload', 15, 'change_document_upload'),
(67, 'Can delete document_upload', 15, 'delete_document_upload'),
(68, 'Can view document_upload', 15, 'view_document_upload'),
(69, 'Can add new_file', 16, 'add_new_file'),
(70, 'Can change new_file', 16, 'change_new_file'),
(71, 'Can delete new_file', 16, 'delete_new_file'),
(72, 'Can view new_file', 16, 'view_new_file'),
(73, 'Can add project_r', 17, 'add_project_r'),
(74, 'Can change project_r', 17, 'change_project_r'),
(75, 'Can delete project_r', 17, 'delete_project_r'),
(76, 'Can view project_r', 17, 'view_project_r'),
(77, 'Can add project_r1', 18, 'add_project_r1'),
(78, 'Can change project_r1', 18, 'change_project_r1'),
(79, 'Can delete project_r1', 18, 'delete_project_r1'),
(80, 'Can view project_r1', 18, 'view_project_r1'),
(81, 'Can add project_r2', 19, 'add_project_r2'),
(82, 'Can change project_r2', 19, 'change_project_r2'),
(83, 'Can delete project_r2', 19, 'delete_project_r2'),
(84, 'Can view project_r2', 19, 'view_project_r2'),
(85, 'Can add project_r3', 20, 'add_project_r3'),
(86, 'Can change project_r3', 20, 'change_project_r3'),
(87, 'Can delete project_r3', 20, 'delete_project_r3'),
(88, 'Can view project_r3', 20, 'view_project_r3'),
(89, 'Can add technical_team_details', 21, 'add_technical_team_details'),
(90, 'Can change technical_team_details', 21, 'change_technical_team_details'),
(91, 'Can delete technical_team_details', 21, 'delete_technical_team_details'),
(92, 'Can view technical_team_details', 21, 'view_technical_team_details'),
(93, 'Can add client_project_models', 22, 'add_client_project_models'),
(94, 'Can change client_project_models', 22, 'change_client_project_models'),
(95, 'Can delete client_project_models', 22, 'delete_client_project_models'),
(96, 'Can view client_project_models', 22, 'view_client_project_models');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clientapp_client_detail_model`
--

CREATE TABLE IF NOT EXISTS `clientapp_client_detail_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` bigint(20) unsigned DEFAULT NULL,
  `organisation` varchar(150) DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `dob` varchar(150) DEFAULT NULL,
  `files` varchar(100) NOT NULL,
  `country` varchar(150) DEFAULT NULL,
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `clientapp_client_detail_model`
--

INSERT INTO `clientapp_client_detail_model` (`id`, `fullname`, `email`, `contact`, `organisation`, `gender`, `dob`, `files`, `country`, `approve`) VALUES
(24, 'manikandan', 'manikandan@gmail.com', 9879762876, 'mani industries', 'Male', '31/12/1972', 'files/aadhaar_card.jpg', 'InDia', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clientapp_client_model`
--

CREATE TABLE IF NOT EXISTS `clientapp_client_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `phonenumber` bigint(20) unsigned DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `actions` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `clientapp_client_model`
--

INSERT INTO `clientapp_client_model` (`id`, `username`, `email`, `password`, `phonenumber`, `gender`, `address`, `actions`) VALUES
(15, 'manikandan', 'manikandan@gmail.com', 'MAni@123', 9987437653, 'male', 'madura', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clientapp_client_project_models`
--

CREATE TABLE IF NOT EXISTS `clientapp_client_project_models` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(150) DEFAULT NULL,
  `organisation_address` varchar(150) NOT NULL,
  `organisation_Email` varchar(150) NOT NULL,
  `phonenumber` bigint(20) unsigned DEFAULT NULL,
  `services` varchar(150) DEFAULT NULL,
  `p_enquiry` varchar(150) DEFAULT NULL,
  `p_document` varchar(100) NOT NULL,
  `approve` tinyint(1) NOT NULL,
  `reject` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organisation_address` (`organisation_address`),
  UNIQUE KEY `organisation_Email` (`organisation_Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `clientapp_client_project_models`
--

INSERT INTO `clientapp_client_project_models` (`id`, `organisation_name`, `organisation_address`, `organisation_Email`, `phonenumber`, `services`, `p_enquiry`, `p_document`, `approve`, `reject`) VALUES
(10, 'mani industries', 'madurai', 'maniindustries@gmail.com', 9923485378, 'CLOUD COMPUTING', 'need my project completed in next two months', 'documents/project_details.jpeg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'clientapp', 'client_detail_model'),
(7, 'clientapp', 'client_model'),
(11, 'clientapp', 'client_project_model'),
(22, 'clientapp', 'client_project_models'),
(5, 'contenttypes', 'contenttype'),
(12, 'managerapp', 'client_details_send'),
(15, 'project_teamapp', 'document_upload'),
(16, 'project_teamapp', 'new_file'),
(8, 'project_teamapp', 'project_model'),
(17, 'project_teamapp', 'project_r'),
(18, 'project_teamapp', 'project_r1'),
(19, 'project_teamapp', 'project_r2'),
(20, 'project_teamapp', 'project_r3'),
(13, 'project_teamapp', 'project_team_report'),
(14, 'project_teamapp', 'team'),
(6, 'sessions', 'session'),
(9, 'technical_teamapp', 'technical_model'),
(21, 'technical_teamapp', 'technical_team_details');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-06 04:58:29.852089'),
(2, 'auth', '0001_initial', '2022-08-06 04:58:39.347546'),
(3, 'admin', '0001_initial', '2022-08-06 04:58:41.572373'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-06 04:58:41.620366'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-06 04:58:41.667361'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-06 04:58:42.860343'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-08-06 04:58:43.536247'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-08-06 04:58:44.266259'),
(9, 'auth', '0004_alter_user_username_opts', '2022-08-06 04:58:44.321199'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-08-06 04:58:44.893169'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-08-06 04:58:44.928167'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-06 04:58:44.976159'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-08-06 04:58:45.632174'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-06 04:58:46.401126'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-08-06 04:58:47.181029'),
(16, 'auth', '0011_update_proxy_permissions', '2022-08-06 04:58:47.262018'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-06 04:58:47.905033'),
(18, 'clientapp', '0001_initial', '2022-08-06 04:58:48.388965'),
(19, 'sessions', '0001_initial', '2022-08-06 04:58:49.065909'),
(20, 'project_teamapp', '0001_initial', '2022-08-06 10:03:36.605096'),
(21, 'technical_teamapp', '0001_initial', '2022-08-06 10:14:16.330004'),
(22, 'clientapp', '0002_client_detail_model', '2022-08-08 05:19:11.993806'),
(23, 'clientapp', '0003_client_detail_model_files', '2022-08-08 06:01:32.627579'),
(24, 'clientapp', '0004_client_project_details_and_more', '2022-08-08 10:30:23.203186'),
(25, 'clientapp', '0005_rename_client_project_details_client_project_model', '2022-08-08 10:47:16.134817'),
(26, 'clientapp', '0002_remove_client_project_model_organisation_and_more', '2022-08-10 04:36:10.662837'),
(27, 'clientapp', '0003_client_project_model_approve', '2022-08-10 04:36:11.268800'),
(28, 'managerapp', '0001_initial', '2022-08-10 05:41:24.475040'),
(29, 'clientapp', '0004_client_detail_model_country', '2022-08-11 08:07:42.038021'),
(30, 'clientapp', '0005_alter_client_project_model_p_document', '2022-08-13 09:41:24.710759'),
(31, 'project_teamapp', '0002_project_team_report_upload', '2022-08-16 13:49:47.138842'),
(32, 'project_teamapp', '0002_rename_project_team_report_upload_project_team_report', '2022-08-17 04:23:07.337080'),
(33, 'project_teamapp', '0002_new_file', '2022-08-17 05:27:02.667824'),
(34, 'project_teamapp', '0002_project_r2_delete_project_r1', '2022-08-17 08:41:08.270117'),
(35, 'project_teamapp', '0003_project_r3_delete_project_r2', '2022-08-17 08:42:43.957867'),
(36, 'project_teamapp', '0004_project_r2_delete_project_r3', '2022-08-17 08:43:12.832146'),
(37, 'project_teamapp', '0005_project_r3_delete_project_r2', '2022-08-17 08:45:52.880330'),
(38, 'project_teamapp', '0006_project_r1_delete_project_r3', '2022-08-17 08:52:51.608804'),
(39, 'project_teamapp', '0007_project_r2_delete_project_r1', '2022-08-17 09:22:47.803634'),
(40, 'project_teamapp', '0008_project_r1_delete_project_r2', '2022-08-17 09:25:04.668500'),
(41, 'technical_teamapp', '0002_technical_team_details', '2022-08-18 05:16:29.385562'),
(42, 'clientapp', '0002_rename_organisation_mail_client_project_model_organisation_email', '2022-08-18 05:24:24.670278'),
(43, 'clientapp', '0002_client_project_models_delete_client_project_model', '2022-08-18 05:27:02.246847'),
(44, 'technical_teamapp', '0003_alter_technical_team_details_current_project_details', '2022-08-18 06:31:41.139258'),
(45, 'project_teamapp', '0009_new_file_solutions', '2022-08-19 08:33:00.962841'),
(46, 'clientapp', '0003_client_model_actions', '2022-08-20 07:12:05.782294'),
(47, 'clientapp', '0004_client_detail_model_approve', '2022-08-20 09:05:25.220638'),
(48, 'project_teamapp', '0010_project_r1_approve', '2022-08-20 09:08:32.877938'),
(49, 'technical_teamapp', '0004_technical_team_details_approve', '2022-08-20 09:14:58.335247'),
(50, 'managerapp', '0002_client_details_send_organisation_email', '2022-08-22 07:08:36.754827'),
(51, 'managerapp', '0003_alter_client_details_send_project_completion', '2022-08-22 10:22:43.447650');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('k2ufi3gsjeeodvn3my8xz18e2uhsau4p', 'e30:1oR7wZ:2JmvsG_RyUDQG9kuc7VZXh5APGKL_fyWP1WOTdfIYzo', '2022-09-08 08:10:27.090492');

-- --------------------------------------------------------

--
-- Table structure for table `managerapp_client_details_send`
--

CREATE TABLE IF NOT EXISTS `managerapp_client_details_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clientname` varchar(150) NOT NULL,
  `client_organisation_name` varchar(150) NOT NULL,
  `projectstatus` varchar(150) NOT NULL,
  `project_completion` varchar(150) DEFAULT NULL,
  `payment_details` varchar(100) NOT NULL,
  `organisation_email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_organisation_name` (`client_organisation_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `managerapp_client_details_send`
--

INSERT INTO `managerapp_client_details_send` (`id`, `clientname`, `client_organisation_name`, `projectstatus`, `project_completion`, `payment_details`, `organisation_email`) VALUES
(5, 'manikandan', 'mani industries', 'project approved', 'with in upcoming 2 months ', 'payfiles/payment_details.jpg', 'maniindustries@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `project_teamapp_new_file`
--

CREATE TABLE IF NOT EXISTS `project_teamapp_new_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_TEAM_NAME` varchar(150) NOT NULL,
  `CHANGE_IN_PROJECT_SCOPE` varchar(150) NOT NULL,
  `COMMUNICATION_BREAKDOWN` varchar(150) NOT NULL,
  `INADEQUATE` varchar(150) DEFAULT NULL,
  `PLANNING` varchar(150) DEFAULT NULL,
  `TEAM_MEMBER_PROCASTINATION` varchar(150) DEFAULT NULL,
  `CLIENT_CHANGES_IN_PROJECT` varchar(150) DEFAULT NULL,
  `EXTERNAL_CHANGES` varchar(150) DEFAULT NULL,
  `solutions` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CHANGE_IN_PROJECT_SCOPE` (`CHANGE_IN_PROJECT_SCOPE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `project_teamapp_new_file`
--

INSERT INTO `project_teamapp_new_file` (`id`, `PROJECT_TEAM_NAME`, `CHANGE_IN_PROJECT_SCOPE`, `COMMUNICATION_BREAKDOWN`, `INADEQUATE`, `PLANNING`, `TEAM_MEMBER_PROCASTINATION`, `CLIENT_CHANGES_IN_PROJECT`, `EXTERNAL_CHANGES`, `solutions`) VALUES
(6, 'KIshore kumar', 'yes', 'internal', 'lack of hardwares', 'average', 'rarely', 'frequent', 'product quality', 'SHEDULE CAREFULLY and ESTIMATION and GATHER RIGHT RESOURCES and INDIVIDUAL DEADLINES');

-- --------------------------------------------------------

--
-- Table structure for table `project_teamapp_project_model`
--

CREATE TABLE IF NOT EXISTS `project_teamapp_project_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `phonenumber` bigint(20) unsigned DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `project_teamapp_project_model`
--

INSERT INTO `project_teamapp_project_model` (`id`, `username`, `email`, `password`, `phonenumber`, `gender`, `address`) VALUES
(6, 'kishore', 'kishore@gmail.com', 'Kishore@123', 8476453797, 'male', 'chennai');

-- --------------------------------------------------------

--
-- Table structure for table `project_teamapp_project_r1`
--

CREATE TABLE IF NOT EXISTS `project_teamapp_project_r1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_team_head` varchar(150) NOT NULL,
  `project_team_email` varchar(150) NOT NULL,
  `android` varchar(150) NOT NULL,
  `total_team_members1` varchar(150) DEFAULT NULL,
  `frontend` varchar(150) DEFAULT NULL,
  `total_team_members2` varchar(150) DEFAULT NULL,
  `backend` varchar(150) DEFAULT NULL,
  `total_team_members3` varchar(150) DEFAULT NULL,
  `testing` varchar(150) DEFAULT NULL,
  `total_team_members4` varchar(150) DEFAULT NULL,
  `others` varchar(150) DEFAULT NULL,
  `total_team_members5` varchar(150) DEFAULT NULL,
  `project_enquiry` varchar(150) DEFAULT NULL,
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_team_email` (`project_team_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `project_teamapp_project_r1`
--

INSERT INTO `project_teamapp_project_r1` (`id`, `project_team_head`, `project_team_email`, `android`, `total_team_members1`, `frontend`, `total_team_members2`, `backend`, `total_team_members3`, `testing`, `total_team_members4`, `others`, `total_team_members5`, `project_enquiry`, `approve`) VALUES
(18, 'kishore kumar', 'projectteam1@gmail.com', 'ANDROID', '0-1', 'FRONT END', '1-5', 'BACKEND END', '5-10', 'TESTING', '10-20', 'OTHERS', 'more than 20', 'its difficult to complete projects in upcoming two months', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_teamapp_team_project`
--

CREATE TABLE IF NOT EXISTS `project_teamapp_team_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_TEAM_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `technical_teamapp_technical_model`
--

CREATE TABLE IF NOT EXISTS `technical_teamapp_technical_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `phonenumber` bigint(20) unsigned DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `technical_teamapp_technical_model`
--

INSERT INTO `technical_teamapp_technical_model` (`id`, `username`, `email`, `password`, `phonenumber`, `gender`, `address`) VALUES
(8, 'rakesh', 'rakesh@gmail.com', 'Rakesh@123', 8724938754, 'male', 'chennai');

-- --------------------------------------------------------

--
-- Table structure for table `technical_teamapp_technical_team_details`
--

CREATE TABLE IF NOT EXISTS `technical_teamapp_technical_team_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `technicalteam_head_name` varchar(150) NOT NULL,
  `technicalteam_email` varchar(150) NOT NULL,
  `no_of_project_completed` varchar(150) NOT NULL,
  `current_project_details` varchar(150) DEFAULT NULL,
  `no_of_workers` varchar(150) DEFAULT NULL,
  `experienced` varchar(150) DEFAULT NULL,
  `freshers` varchar(150) DEFAULT NULL,
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `technicalteam_email` (`technicalteam_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `technical_teamapp_technical_team_details`
--

INSERT INTO `technical_teamapp_technical_team_details` (`id`, `technicalteam_head_name`, `technicalteam_email`, `no_of_project_completed`, `current_project_details`, `no_of_workers`, `experienced`, `freshers`, `approve`) VALUES
(6, 'rakesh kumar', 'techteam2@gmail.com', '33', 'report work is pending', '32', '5-20', '0-5', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
