-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 01, 2022 at 10:55 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'English', '2022-10-29 23:05:58.000000', '2022-10-29 23:05:58.000000'),
(3, 'French', '2022-10-29 23:06:09.000000', '2022-10-29 23:06:09.000000'),
(4, 'ICDL', '2022-10-29 23:06:23.000000', '2022-10-29 23:06:23.000000'),
(5, 'Communication Skills', '2022-10-29 23:06:59.000000', '2022-10-29 23:06:59.000000'),
(6, 'db1', '2022-10-31 22:21:49.000000', '2022-10-31 22:21:49.000000'),
(7, 'db2', '2022-11-01 08:32:19.000000', '2022-11-01 08:32:19.000000');

-- --------------------------------------------------------

--
-- Table structure for table `course_teacher`
--

DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE IF NOT EXISTS `course_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL,
  `id_teacher` int(11) NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test` (`id_course`),
  KEY `test2` (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_teacher`
--

INSERT INTO `course_teacher` (`id`, `id_course`, `id_teacher`, `created_at`, `updated_at`) VALUES
(2, 2, 2, '2022-10-30 00:06:16.000000', '2022-10-30 00:06:16.000000'),
(3, 2, 3, '2022-10-30 00:06:38.000000', '2022-10-30 00:06:38.000000'),
(4, 3, 4, '2022-10-30 00:07:07.000000', '2022-10-30 00:07:07.000000'),
(5, 3, 5, '2022-10-30 00:07:18.000000', '2022-10-30 00:07:18.000000'),
(6, 4, 3, '2022-10-30 00:07:43.000000', '2022-10-30 00:07:43.000000'),
(7, 5, 4, '2022-10-30 00:08:16.000000', '2022-10-30 00:08:16.000000'),
(8, 6, 6, '2022-10-31 22:22:46.000000', '2022-10-31 22:22:46.000000'),
(9, 6, 5, '2022-10-31 22:23:54.000000', '2022-10-31 22:23:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('41c84932624dd5969ce4db435379ad39efb682929086126d1d2e682fdc550cf0787779fc5d4f45f0', 2, 1, 'MyApp', '[]', 0, '2022-10-29 22:59:10', '2022-10-29 22:59:10', '2023-10-30 00:59:10'),
('e2047091526c4f27609d7b1a6a9d560beb3ba2f3a3167393d1733487f0f3a1f98674ee040d9e8e20', 1, 1, 'MyApp', '[]', 0, '2022-10-29 23:01:58', '2022-10-29 23:01:58', '2023-10-30 01:01:58'),
('5efe2549106da5e9c233e9401e25c1a54fa429dfc4c53c869f835e38ed36ffcb458ea93dcfe53f93', 1, 1, 'MyApp', '[]', 0, '2022-10-29 23:05:17', '2022-10-29 23:05:17', '2023-10-30 01:05:17'),
('9d1954df3e18c9f3eb5648c0f35679782265bff7e3c01cc526607d3118e6658450ce23d46ae4d774', 2, 1, 'MyApp', '[]', 0, '2022-10-29 23:05:58', '2022-10-29 23:05:58', '2023-10-30 01:05:58'),
('d31641081357ff664ae5c969fe624017ffbd7c6663d9b93d2676321c597835e08b157e5d2be7385c', 3, 1, 'MyApp', '[]', 0, '2022-10-29 23:06:09', '2022-10-29 23:06:09', '2023-10-30 01:06:09'),
('aca690e926a4ac98f10dccdc6bdd6756ee880836c3f802438844e498826417ed2d1f429a2de9e852', 4, 1, 'MyApp', '[]', 0, '2022-10-29 23:06:23', '2022-10-29 23:06:23', '2023-10-30 01:06:23'),
('48406286c341a07ee426462515d0e69cf7ad4c95b89dca7056452970b84f01fb97d13fb47134c4a2', 5, 1, 'MyApp', '[]', 0, '2022-10-29 23:06:59', '2022-10-29 23:06:59', '2023-10-30 01:06:59'),
('1e0d05a1ec0b4023c1cde9c8bcbe3c97063332364c117a7adecbe6fe32101f6a9d407d2eac02d2b9', 2, 1, 'MyApp', '[]', 0, '2022-10-29 23:07:52', '2022-10-29 23:07:52', '2023-10-30 01:07:52'),
('5177b0b5c29820610a150de7f3a3352f60c8887a784048374d47d5b46399979a506cd8d5b26510ad', 3, 1, 'MyApp', '[]', 0, '2022-10-29 23:08:30', '2022-10-29 23:08:30', '2023-10-30 01:08:30'),
('3343424d01e18d7adfc740360987da25307a635d6b5b3e7e39daede00cc2c1e7b1a83843c946a662', 4, 1, 'MyApp', '[]', 0, '2022-10-29 23:08:44', '2022-10-29 23:08:44', '2023-10-30 01:08:44'),
('cb08dda8b1e22c37b8af1bf4fddbba8f99600107fb8ca39fc14b2a75d7c7f917da402c4420273a75', 5, 1, 'MyApp', '[]', 0, '2022-10-29 23:08:58', '2022-10-29 23:08:58', '2023-10-30 01:08:58'),
('9033d24bfe2399389bd1bdfc6216436dabf747beeb67c3db1c89b7758cd70380fd632447b96a970e', 3, 1, 'MyApp', '[]', 0, '2022-10-30 00:46:59', '2022-10-30 00:46:59', '2023-10-30 02:46:59'),
('b67df508e02dd7f5021a4bfaa6f07b05555f5563c769825b40e38aeeef5bebe74cebd22b41f8f379', 4, 1, 'MyApp', '[]', 0, '2022-10-30 01:22:45', '2022-10-30 01:22:45', '2023-10-30 03:22:45'),
('a948c2a4c713e3c27487c59a9ededbc2b9ed6695d4594f48cfe05270e59a06189f29b5f2080908d4', 5, 1, 'MyApp', '[]', 0, '2022-10-31 22:18:23', '2022-10-31 22:18:23', '2023-11-01 00:18:23'),
('783129b690aee84a23479192457279c819a0823155ed32936e75b15765e621f0f936ba845d25eed8', 6, 1, 'MyApp', '[]', 0, '2022-10-31 22:21:49', '2022-10-31 22:21:49', '2023-11-01 00:21:49'),
('2c816ef698c27fbc4669afb2e8b45dcdfc7465cbbeb99323d9cc0b455134a565b581a935f6bd17f6', 6, 1, 'MyApp', '[]', 0, '2022-10-31 22:22:18', '2022-10-31 22:22:18', '2023-11-01 00:22:18'),
('611e99656d4406b9ffa7ac0584ecf1af7345773c3e6873854f35bc9f7d6b3fb5f406ce17b2b4eb98', 7, 1, 'MyApp', '[]', 0, '2022-11-01 08:32:19', '2022-11-01 08:32:19', '2023-11-01 10:32:19'),
('42c108460a7753e08b8e4d578df17acb5e0407a0f640f2111a5aba825c826b7680a8b531c29ae5f4', 7, 1, 'MyApp', '[]', 0, '2022-11-01 08:33:17', '2022-11-01 08:33:17', '2023-11-01 10:33:17'),
('0dbddf18a4dd0651d81d9600d663ab6b119d89fad9330390dd44e3f119e09a2baafbfcaffaaa3442', 8, 1, 'MyApp', '[]', 0, '2022-11-01 08:34:22', '2022-11-01 08:34:22', '2023-11-01 10:34:22'),
('959fd477961c0e35198bbac2e168d8de3cb8ef2bc7a85848390f93be3980c37610de0161aec26940', 6, 1, 'MyApp', '[]', 0, '2022-11-01 08:37:06', '2022-11-01 08:37:06', '2023-11-01 10:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'xO4ElyKitWY4dWzmiYyVpz9ebqeFvRTRE7T9PVXv', NULL, 'http://localhost', 1, 0, 0, '2022-10-29 22:58:55', '2022-10-29 22:58:55'),
(2, NULL, 'Laravel Password Grant Client', 'X3AF4fqgfyYdyjoZgMHnr0knbfpUqnV5rXHsfVRo', 'users', 'http://localhost', 0, 1, 0, '2022-10-29 22:58:55', '2022-10-29 22:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-29 22:58:55', '2022-10-29 22:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `id_course_teacher` int(11) NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st` (`id_student`),
  KEY `tr` (`id_course_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `id_student`, `id_course_teacher`, `created_at`, `updated_at`) VALUES
(2, 4, 3, '2022-10-30 01:22:55.000000', '2022-10-30 01:22:55.000000'),
(3, 3, 6, '2022-10-30 10:23:02.000000', '2022-10-30 10:23:02.000000'),
(5, 6, 8, '2022-11-01 08:40:07.000000', '2022-11-01 08:40:07.000000'),
(6, 5, 2, '2022-11-01 08:43:41.000000', '2022-11-01 08:43:41.000000');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(3, 'ahmed', 'ahmed@gmail.com', '', '2022-10-30 00:46:58.000000', '2022-10-30 00:46:58.000000'),
(4, 'alaa', 'alaa@gmail.com', '123', '2022-10-30 01:22:45.000000', '2022-10-30 01:22:45.000000'),
(5, 'alaa', 'ahmed@gmail.comm', '$2y$10$cD.Lr2AEZCR6K2ZfysmhaOO60flJNDeDnS/317iIq6Uy7e8J8LfaC', '2022-10-31 22:18:20.000000', '2022-10-31 22:18:20.000000'),
(6, 'nour', 'nour@gmail.com', '$2y$10$oVEGiVcTu1vwac9YAjUee.H1t77nLNm1EImQe8S8eygI6MTYOr3ee', '2022-11-01 08:37:06.000000', '2022-11-01 08:37:06.000000');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp(6) NOT NULL,
  `updated_at` timestamp(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Gary Cabrera', '2022-10-29 23:07:52.000000', '2022-10-29 23:07:52.000000'),
(3, 'James Vance', '2022-10-29 23:08:30.000000', '2022-10-29 23:08:30.000000'),
(4, 'Aliza Vance', '2022-10-29 23:08:44.000000', '2022-10-29 23:08:44.000000'),
(5, 'Averie Carter', '2022-10-29 23:08:58.000000', '2022-10-29 23:08:58.000000'),
(6, 'ahmed', '2022-10-31 22:22:18.000000', '2022-10-31 22:22:18.000000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmed@gmail.com', '123', '2022-10-30 13:53:05', '2022-10-30 13:53:05');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_teacher`
--
ALTER TABLE `course_teacher`
  ADD CONSTRAINT `test` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `test2` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `st` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `tr` FOREIGN KEY (`id_course_teacher`) REFERENCES `course_teacher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
