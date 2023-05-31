-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 03:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibrarydjango_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_email` varchar(254) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add college', 7, 'add_college'),
(26, 'Can change college', 7, 'change_college'),
(27, 'Can delete college', 7, 'delete_college'),
(28, 'Can view college', 7, 'view_college'),
(29, 'Can add student', 8, 'add_student'),
(30, 'Can change student', 8, 'change_student'),
(31, 'Can delete student', 8, 'delete_student'),
(32, 'Can view student', 8, 'view_student'),
(33, 'Can add admin', 9, 'add_admin'),
(34, 'Can change admin', 9, 'change_admin'),
(35, 'Can delete admin', 9, 'delete_admin'),
(36, 'Can view admin', 9, 'view_admin'),
(37, 'Can add book', 10, 'add_book'),
(38, 'Can change book', 10, 'change_book'),
(39, 'Can delete book', 10, 'delete_book'),
(40, 'Can view book', 10, 'view_book'),
(41, 'Can add borrow', 11, 'add_borrow'),
(42, 'Can change borrow', 11, 'change_borrow'),
(43, 'Can delete borrow', 11, 'delete_borrow'),
(44, 'Can view borrow', 11, 'view_borrow');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$8xRVkuiAwpLWimHKSkAC4z$aJbP8axiN0JIvMY5paHt3Uzf0Su+eflbpXgKLhJ/h68=', '2023-05-31 12:59:25.953007', 1, 'mau_sean', '', '', '202080070@psu.palawan.edu.ph', 1, 1, '2023-05-27 17:11:08.207663');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `book_name` varchar(500) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_isbn` bigint(20) NOT NULL,
  `year_published` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bid`, `book_name`, `book_author`, `book_isbn`, `year_published`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'The Hunger Games', 'Suzanne Collins', 9780439023481, 2008, 5, '2023-05-28 02:08:39.096850', '2023-05-28 06:51:54.274371'),
(5, 'Charlotte’s Web', 'E.B. White', 9780590302715, 1952, 4, '2023-05-28 02:55:17.080032', '2023-05-28 18:52:24.383498'),
(6, 'CyberEthics', 'Richard A. Spinello', 9780763700645, 2000, 3, '2023-05-28 19:05:10.745075', '2023-05-30 13:57:07.464434'),
(7, 'Divergent', 'Veronica Roth', 9780062024022, 2011, 5, '2023-05-28 19:06:43.772622', '2023-05-30 13:51:01.837390'),
(8, 'Don Quixote', 'Miguel de Cervantes', 9780099469698, 1960, 5, '2023-05-28 19:08:04.335997', '2023-05-31 11:23:05.614908'),
(9, 'Engineers\' Practical Databook: A Technical Reference Guide for Students and Professionals', 'Jay Smith', 1980619344, 2018, 5, '2023-05-28 19:08:39.274585', '2023-05-31 13:49:23.690193'),
(10, 'Information Assurance and Security Technologies for Risk Assessment and Threat Management', 'Te-Shun Chou', 1613505078, 2011, 5, '2023-05-28 19:09:18.449636', '2023-05-28 19:09:18.449636'),
(11, 'It Ends with us', 'Colleen Hoover', 9781432899790, 2016, 5, '2023-05-28 19:09:57.498763', '2023-05-28 19:09:57.498763'),
(12, 'Life Works, And Writings Of A Genius, Writer, Scientist And National Hero', 'Gregorio F. Zaide, et al.', 9789712733239, 2014, 4, '2023-05-28 19:10:30.310819', '2023-05-31 13:44:32.417443'),
(13, 'Managing Information Technology', 'Carol V. Brown', 9783319388908, 2011, 5, '2023-05-28 19:11:03.617446', '2023-05-28 19:11:03.617446'),
(14, 'One Hundred Years of Soltitude', 'Gabriel Garcia Marquez', 9780060114183, 1967, 4, '2023-05-28 19:11:59.991133', '2023-05-31 13:51:33.878565'),
(15, 'Learning C# by Developing Games with Unity', 'Harrison Ferrone', 1837636877, 2022, 5, '2023-05-31 11:24:16.886668', '2023-05-31 11:24:16.886668'),
(16, 'Life Works, And Writings Of A Genius, Writer, Scientist And National Hero', 'Gregorio F. Zaide, et al.', 9789712733239, 2014, 5, '2023-05-31 11:25:20.594052', '2023-05-31 11:25:20.594052'),
(17, 'Managing Information Technology', 'Carol V. Brown', 9783319388908, 2011, 4, '2023-05-31 11:25:52.927045', '2023-05-31 13:50:59.160894'),
(18, 'OSINT Techniques: Resources for Uncovering Online Information', 'Michael Bazzel', 9798366360401, 2023, 6, '2023-05-31 11:26:46.845630', '2023-05-31 13:48:57.951460'),
(19, 'Python Programming and SQL: 5 books in 1 - The #1 Coding Course from Beginner to Advanced. Learn it Well & Fast (2023) (Computer Programming)', 'Mark Reed', 9798373278850, 2023, 1, '2023-05-31 11:27:21.300725', '2023-05-31 11:27:21.300725'),
(20, 'Python Programming for Beginners: The Complete Guide to Mastering Python in 7 Days with Hands-On Exercises – Top Secret Coding Tips to Get an Unfair Advantage and Land Your Dream Job!', 'Philip Robbins', 9798376161821, 2023, 5, '2023-05-31 11:27:59.728061', '2023-05-31 11:27:59.728061'),
(21, 'Social Engineering: The Science of Human Hacking', 'Christopher Hadnagy', 111943338, 2018, 5, '2023-05-31 11:28:48.417172', '2023-05-31 11:28:48.417172'),
(22, 'Structures: Or Why Things Don\'t Fall Down', 'J. E. Gordon', 8601419985296, 2003, 5, '2023-05-31 11:29:21.391296', '2023-05-31 11:29:21.391296'),
(23, 'The Da Vinci Code', 'Dan Brown', 9780385504201, 2003, 5, '2023-05-31 11:29:56.843658', '2023-05-31 13:45:56.283803'),
(24, 'The Design of Everyday Things', 'Donald Norman', 9780465067107, 1988, 5, '2023-05-31 11:30:32.205214', '2023-05-31 11:30:32.205214'),
(25, 'The Dream of the Red Chamber', 'Cao Xueqin', 9780253192646, 1791, 5, '2023-05-31 11:31:57.505864', '2023-05-31 11:31:57.505864'),
(26, 'The Great Gatsby', 'F. Scott Fitzgerald', 9780140007466, 1925, 5, '2023-05-31 11:32:38.498516', '2023-05-31 11:32:38.498516'),
(27, 'The Lion, the Witch and the Wardrobe', 'C.S. Lewis', 9780001831803, 1950, 5, '2023-05-31 11:33:19.961449', '2023-05-31 13:47:13.047776'),
(28, 'The Lord of the Rings', 'J.R.R Tolkien', 9780544003415, 1954, 5, '2023-05-31 11:34:41.986736', '2023-05-31 11:34:41.986736'),
(29, 'The Pentester BluePrint: Starting a Career as an Ethical Hacker', 'Kim Crawley', 1119684307, 2020, 3, '2023-05-31 11:35:51.665211', '2023-05-31 11:35:51.665211'),
(30, 'The Three Laws of Cybersecurity: The Ultimate Guide with Checklists, Tables, Diagrams and with new Strategies to Protect Your Assets', 'Gianclaudio Aldo Moresi', 3033087574, 2022, 5, '2023-05-31 11:36:44.726726', '2023-05-31 11:36:44.726726'),
(31, 'The Great Gatsby', 'F. Scott Fitzgerald', 9780140007466, 1925, 5, '2023-05-31 11:39:08.476525', '2023-05-31 11:39:08.476525');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL,
  `time_borrow` datetime(6) NOT NULL,
  `time_return` datetime(6) DEFAULT NULL,
  `fines` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `book_isbn` int(11) NOT NULL,
  `coll_id_id` int(11) NOT NULL,
  `student_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrow_id`, `time_borrow`, `time_return`, `fines`, `status`, `created_at`, `updated_at`, `book_isbn`, `coll_id_id`, `student_id_id`) VALUES
(1, '2023-05-28 03:16:31.000000', '2023-05-28 04:50:00.000000', 0, 'Not Paid', '2023-05-28 03:16:38.047206', '2023-05-28 04:56:15.741287', 5, 138, 202080086),
(2, '2023-05-28 04:19:00.000000', '2023-06-09 06:11:00.000000', 5317, 'Not Paid', '2023-05-28 04:19:24.201356', '2023-05-28 06:11:31.540374', 1, 138, 202080030),
(3, '2023-05-28 04:19:00.000000', '2023-06-10 06:11:00.000000', 5797, 'Not Paid', '2023-05-28 04:20:00.678746', '2023-05-28 06:11:59.750032', 1, 138, 202080030),
(7, '2023-05-28 05:35:00.000000', '2023-05-30 06:08:00.000000', 490, 'Not Paid', '2023-05-28 05:35:20.682241', '2023-05-28 06:11:08.648680', 1, 138, 202080028),
(20, '2023-05-28 06:57:00.000000', '2023-05-25 06:57:00.000000', 0, 'Paid', '2023-05-28 06:57:28.258547', '2023-05-28 06:59:39.071566', 5, 138, 202080030),
(21, '2023-05-28 07:01:00.000000', '2023-06-09 07:01:00.000000', 5280, 'Not Paid', '2023-05-28 07:01:11.494572', '2023-05-28 07:02:19.123642', 5, 138, 202080028),
(22, '2023-05-28 18:52:00.000000', NULL, 0, 'Not Paid', '2023-05-28 18:52:24.367505', '2023-05-28 18:52:24.367505', 5, 138, 202080028),
(23, '2023-05-28 19:05:00.000000', NULL, 0, 'Not Paid', '2023-05-28 19:05:41.527122', '2023-05-28 19:05:41.527122', 6, 138, 202080086),
(24, '2023-05-28 19:12:00.000000', NULL, 0, 'Not Paid', '2023-05-28 19:12:41.035088', '2023-05-28 19:12:41.035088', 12, 138, 202080070),
(25, '2023-05-28 19:12:00.000000', NULL, 0, 'Not Paid', '2023-05-28 19:12:59.724361', '2023-05-28 19:12:59.724361', 14, 139, 202030108),
(26, '2023-05-28 19:13:00.000000', '2023-05-31 11:22:00.000000', 803, 'Not Paid', '2023-05-28 19:13:20.217118', '2023-05-31 11:23:05.606904', 8, 138, 202080028),
(27, '2023-05-30 13:50:00.000000', '2023-06-03 13:50:00.000000', 1440, 'Not Paid', '2023-05-30 13:50:39.615217', '2023-05-30 13:51:01.833389', 7, 134, 202060023),
(28, '2023-05-30 13:52:00.000000', '2023-06-09 13:53:00.000000', 4320, 'Not Paid', '2023-05-30 13:53:00.749001', '2023-05-30 13:53:19.009848', 14, 139, 202030044),
(29, '2023-05-30 13:56:00.000000', NULL, 0, 'Not Paid', '2023-05-30 13:57:07.452158', '2023-05-30 13:57:07.452158', 6, 137, 202070181),
(30, '2023-05-18 13:43:00.000000', '2023-05-23 13:43:00.000000', 1920, 'Not Paid', '2023-05-31 13:43:52.255132', '2023-05-31 13:44:32.415439', 12, 140, 202040098),
(31, '2023-05-31 13:45:00.000000', '2023-06-08 13:45:00.000000', 3360, 'Not Paid', '2023-05-31 13:45:49.237485', '2023-05-31 13:45:56.281804', 23, 136, 201990032),
(32, '2023-05-31 13:46:00.000000', '2023-06-05 13:46:00.000000', 1920, 'Not Paid', '2023-05-31 13:47:03.675044', '2023-05-31 13:47:13.044773', 27, 136, 201990069),
(33, '2023-05-31 13:47:00.000000', '2023-06-01 13:47:00.000000', 0, 'Paid', '2023-05-31 13:47:49.641184', '2023-05-31 13:48:57.947460', 18, 135, 202040447),
(34, '2023-05-29 13:48:00.000000', '2023-05-31 13:48:00.000000', 480, 'Not Paid', '2023-05-31 13:48:54.866687', '2023-05-31 13:49:23.686195', 9, 135, 202020082),
(35, '2023-05-31 13:50:00.000000', NULL, 0, 'Not Paid', '2023-05-31 13:50:59.159423', '2023-05-31 13:50:59.159423', 17, 133, 202020775),
(36, '2023-05-31 13:51:00.000000', '2023-06-02 13:51:00.000000', 480, 'Not Paid', '2023-05-31 13:51:28.792934', '2023-05-31 13:51:33.874561', 14, 133, 202120155);

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `id` int(11) NOT NULL,
  `college_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`id`, `college_name`) VALUES
(132, 'CAH'),
(133, 'CBA'),
(134, 'CCJE'),
(135, 'CEAT'),
(136, 'CHTM'),
(137, 'CNHS'),
(138, 'CS'),
(139, 'CTE'),
(140, 'LHS');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-27 17:12:01.264519', '132', 'CAH', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-05-27 17:12:18.598531', '133', 'CBA', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-05-27 17:12:23.668644', '134', 'CCJE', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-05-27 17:12:41.291755', '135', 'CEAT', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-05-27 17:12:48.553230', '136', 'CHTM', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-05-27 17:13:01.076221', '137', 'CNHS', 1, '[{\"added\": {}}]', 7, 1),
(7, '2023-05-27 17:13:05.956680', '138', 'CS', 1, '[{\"added\": {}}]', 7, 1),
(8, '2023-05-27 17:13:11.388282', '139', 'CTE', 1, '[{\"added\": {}}]', 7, 1),
(9, '2023-05-27 17:13:15.984463', '140', 'LHS', 1, '[{\"added\": {}}]', 7, 1),
(10, '2023-05-27 17:13:22.532726', '140', 'LHS', 2, '[]', 7, 1),
(11, '2023-05-28 02:08:39.096850', '1', 'The Hunger Games', 1, '[{\"added\": {}}]', 10, 1),
(12, '2023-05-28 02:22:43.328422', '2', 'dddd', 2, '[]', 10, 1),
(13, '2023-05-28 02:22:54.199532', '202080086', 'Orga, Sean Harvey D.', 2, '[]', 8, 1),
(14, '2023-05-28 03:16:38.047206', '1', 'Orga, Sean Harvey D.', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'myelibrary_app', 'admin'),
(10, 'myelibrary_app', 'book'),
(11, 'myelibrary_app', 'borrow'),
(7, 'myelibrary_app', 'college'),
(8, 'myelibrary_app', 'student'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-27 17:07:34.399537'),
(2, 'auth', '0001_initial', '2023-05-27 17:07:34.951447'),
(3, 'admin', '0001_initial', '2023-05-27 17:07:35.103834'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-27 17:07:35.127791'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-27 17:07:35.156681'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-05-27 17:07:35.255409'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-05-27 17:07:35.327261'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-05-27 17:07:35.359665'),
(9, 'auth', '0004_alter_user_username_opts', '2023-05-27 17:07:35.391494'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-05-27 17:07:35.455683'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-05-27 17:07:35.464058'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-27 17:07:35.488322'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-05-27 17:07:35.517093'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-27 17:07:35.548974'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-05-27 17:07:35.577896'),
(16, 'auth', '0011_update_proxy_permissions', '2023-05-27 17:07:35.600668'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-05-27 17:07:35.633078'),
(18, 'myelibrary_app', '0001_initial', '2023-05-27 17:07:35.735474'),
(19, 'myelibrary_app', '0002_admin_book_alter_college_id_alter_student_date_add_and_more', '2023-05-27 17:07:36.008501'),
(20, 'sessions', '0001_initial', '2023-05-27 17:07:36.048797'),
(21, 'myelibrary_app', '0003_alter_admin_admin_id_alter_book_bid_and_more', '2023-05-28 02:18:55.772565'),
(22, 'myelibrary_app', '0004_alter_borrow_book_isbn', '2023-05-28 02:48:23.831346'),
(23, 'myelibrary_app', '0005_alter_borrow_book_isbn', '2023-05-28 02:49:13.807398'),
(24, 'myelibrary_app', '0006_rename_action_borrow_status', '2023-05-28 03:13:39.821927');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0v7l4kckaj9s173t8oexdvvdvnzszczh', '.eJxVjMsOwiAUBf-FtSFQuCgu3fsNzX2AVA0kpV0Z_12bdKHbMzPnpUZclzKuPc3jJOqsrDr8boT8SHUDcsd6a5pbXeaJ9KbonXZ9bZKel939OyjYy7dmALbEYgz5ZI8uDJCTjz5b8MCZAqELDj15K4M4wZjRhBBPCEAcSL0_7go4Tg:1q2xSB:2yi09eZn1hAEkz-hNdVx5fxflX9w57AL-SQ6x5pvF7k', '2023-06-10 17:11:43.823402'),
('8mqnlocvq73q75iov7u8zbprkh360ifo', '.eJxVjMsOwiAUBf-FtSFQuCgu3fsNzX2AVA0kpV0Z_12bdKHbMzPnpUZclzKuPc3jJOqsrDr8boT8SHUDcsd6a5pbXeaJ9KbonXZ9bZKel939OyjYy7dmALbEYgz5ZI8uDJCTjz5b8MCZAqELDj15K4M4wZjRhBBPCEAcSL0_7go4Tg:1q3xRq:GjZXQBRWEy48espWKTfczqs0ADYj0SGHR12V5on0MRw', '2023-06-13 11:23:30.628415'),
('fdb0ltv3qpugmakf1edmaqsikmxloifp', '.eJxVjMsOwiAUBf-FtSFQuCgu3fsNzX2AVA0kpV0Z_12bdKHbMzPnpUZclzKuPc3jJOqsrDr8boT8SHUDcsd6a5pbXeaJ9KbonXZ9bZKel939OyjYy7dmALbEYgz5ZI8uDJCTjz5b8MCZAqELDj15K4M4wZjRhBBPCEAcSL0_7go4Tg:1q4LQD:sz6xX_tnI_RySjl94Y3F6i0p7_6hBz3hhQnGkB0mlbc', '2023-06-14 12:59:25.961175');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` bigint(20) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `corporate_email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `date_add` date NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `college_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `student_name`, `corporate_email`, `address`, `date_add`, `updated_at`, `created_at`, `college_id_id`) VALUES
(201990032, 'Buhian, Mally', '201990032@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:49:10.653640', '2023-05-30 11:49:10.653640', 136),
(201990069, 'Malvas, Mia Erika D.', '201990069@psu.palawan.edu.ph', 'San Pedro, PPC', '2023-05-30', '2023-05-30 11:49:43.813571', '2023-05-30 11:49:43.813571', 136),
(202020082, 'Aaron Esparrago', '202020082@psu.palawan.edu.ph', 'Sta. Monica', '2023-05-29', '2023-05-29 07:45:29.285609', '2023-05-29 07:45:29.285609', 135),
(202020734, 'Cuerdo, Madelyn', '202020734@psu.palawan.edu.ph', 'Santa Monica, PPC', '2023-05-30', '2023-05-30 11:47:23.634844', '2023-05-30 11:47:23.634844', 133),
(202020775, 'Lucmayon, Mark Kevin B.', '202020775@psu.palawan.edu.ph', 'Tagburos, PPC', '2023-05-30', '2023-05-30 11:51:34.148646', '2023-05-30 11:51:34.148646', 133),
(202030044, 'Lopez, Christine', '202030044@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:50:57.014132', '2023-05-30 11:50:57.014132', 139),
(202030090, 'Madam, Charlotte', '202030090@psu.palawan.edu.ph', 'Sicsican, PPC', '2023-05-31', '2023-05-31 13:54:30.976202', '2023-05-31 13:54:30.976202', 134),
(202030097, 'Cayao, Natahaniel Mauther', '202030097@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-31', '2023-05-31 11:21:46.296594', '2023-05-31 11:21:46.296594', 132),
(202030108, 'Beating, Princess N.', '202030108@psu.palawan.edu.ph', 'Wescom, PPC', '2023-05-28', '2023-05-28 07:39:47.206990', '2023-05-28 01:17:16.556150', 139),
(202040023, 'Daniela Estacio', '202040023@psu.palawan.edu.ph', 'Sta. Monica, PPC', '2023-05-29', '2023-05-29 07:52:47.944553', '2023-05-29 07:52:47.944553', 135),
(202040098, 'Llado, Lixun C.', '202040098@psu.palawan.edu.ph', 'Buncag, PPC', '2023-05-31', '2023-05-31 11:19:49.265747', '2023-05-31 11:19:49.265747', 140),
(202040271, 'Morales, Aiden', '202040271@psu.palawan.edu.ph', 'Sta. Monica, PPC', '2023-05-30', '2023-05-30 11:32:18.258477', '2023-05-30 11:32:18.258477', 135),
(202040294, 'Abdiel Verame', '202040294@psu.palawan.edu.ph', 'San Pedro, PPC', '2023-05-29', '2023-05-29 07:46:01.953578', '2023-05-29 07:46:01.953578', 135),
(202040447, 'Aiman Madtaib', '202040447@psu.palawan.edu.ph', 'San Pedro, PPC', '2023-05-29', '2023-05-29 07:50:09.146969', '2023-05-29 07:50:09.146969', 135),
(202060023, 'Dubla, Jeralyn', '202060023@psu.palawan.edu.ph', 'Santa Monica, PPC', '2023-05-30', '2023-05-30 13:49:47.313699', '2023-05-30 13:49:33.196189', 134),
(202070017, 'Arielle Bajala', '202070017@psu.palawan.edu.ph', 'Sta. Monica, PPC', '2023-05-29', '2023-05-29 07:51:10.963302', '2023-05-29 07:51:10.963302', 137),
(202070029, 'Bacer, Alfred', '202070029@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:34:16.855239', '2023-05-30 11:34:16.855239', 137),
(202070039, 'Cambalos, Angelica Nicole', '202070039@psu.palawan.edu.ph', 'Sta. Monica, PPC', '2023-05-30', '2023-05-30 11:35:06.575577', '2023-05-30 11:35:06.575577', 137),
(202070054, 'Ayumi De Guzman', '202070054@psu.palawan.edu.ph', 'Sta. Monica, PPC', '2023-05-29', '2023-05-29 07:52:03.902984', '2023-05-29 07:52:03.902984', 137),
(202070063, 'Dumawa, Alexander Philip', '202070063@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:33:22.178562', '2023-05-30 11:33:22.178562', 137),
(202070143, 'Abegail Rabo', '202070143@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-29', '2023-05-29 07:48:05.653613', '2023-05-29 07:48:05.653613', 137),
(202070181, 'Tierra, Nicole Angel', '202070181@psu.palawan.edu.ph', 'San Pedro, PPC', '2023-05-30', '2023-05-30 13:55:27.678166', '2023-05-30 13:55:27.678166', 137),
(202080028, 'Calma, Ingrid Justine S.', '202080028@psu.palawan.edu.ph', 'Naval, PPC', '2023-05-28', '2023-05-28 01:15:15.698250', '2023-05-27 23:41:35.530021', 138),
(202080030, 'Casayas, Jiezca P.', '202080030@psu.palawan.edu.ph', 'San Pedro. PPC', '2023-05-28', '2023-05-28 01:12:44.031825', '2023-05-27 23:42:41.142492', 138),
(202080070, 'Llado, Maurene C.', '202080070@psu.palawan.edu.ph', 'Santa Monica, PPC', '2023-05-28', '2023-05-27 17:14:58.170874', '2023-05-27 17:14:58.170874', 138),
(202080083, 'Dela Cruz, Juanc P.', '202080083@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:48:31.038298', '2023-05-30 11:48:31.038298', 134),
(202080086, 'Orga, Sean Harvey D.', '202080086@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-28', '2023-05-28 02:22:54.196509', '2023-05-27 23:39:55.022213', 138),
(202080343, 'Maria Victoria Del Moro', '202080343@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-29', '2023-05-29 07:55:20.973913', '2023-05-29 07:55:20.973913', 138),
(202090052, 'Malvar, Joan Mae', '202090052@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:54:13.173858', '2023-05-30 11:54:13.173858', 140),
(202120155, 'Cacacha, Angel Andrea, D', '202120155@psu.palawan.edu.ph', 'Tiniguiban, PPC', '2023-05-30', '2023-05-30 11:45:54.356944', '2023-05-30 11:45:54.356944', 133),
(202130519, 'Sanchez, Jella Mae', '202130519@psu.palawan.edu.ph', 'Buncag, PPC', '2023-05-30', '2023-05-30 11:52:18.118889', '2023-05-30 11:52:18.118889', 139),
(2020120097, 'Paruco, Anjel Mae U.', '2020120097@psu.palawan.edu.ph', 'Santa Monica, PPC', '2023-05-30', '2023-05-30 11:53:01.947697', '2023-05-30 11:53:01.947697', 134);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `borrow_coll_id_id_43af97bf_fk_college_id` (`coll_id_id`),
  ADD KEY `borrow_student_id_id_911b1cae_fk_student_sid` (`student_id_id`),
  ADD KEY `borrow_book_isbn_7eb2a18d_fk_book_bid` (`book_isbn`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `corporate_email` (`corporate_email`),
  ADD KEY `student_college_id_id_a6a655f1_fk_myelibrary_app_college_id` (`college_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_book_isbn_7eb2a18d_fk_book_bid` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`bid`),
  ADD CONSTRAINT `borrow_coll_id_id_43af97bf_fk_college_id` FOREIGN KEY (`coll_id_id`) REFERENCES `college` (`id`),
  ADD CONSTRAINT `borrow_student_id_id_911b1cae_fk_student_sid` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`sid`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_college_id_id_a6a655f1_fk_myelibrary_app_college_id` FOREIGN KEY (`college_id_id`) REFERENCES `college` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
