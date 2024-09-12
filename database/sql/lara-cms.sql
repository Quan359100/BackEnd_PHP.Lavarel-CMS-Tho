-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2024 at 02:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `social_links` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `email_verified_at`, `password`, `avatar`, `status`, `social_links`, `remember_token`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '', 'superadmin', '019XXXXXXXX', 'superadmin@example.com', NULL, '$2y$10$vt0nY03Rnm8KMBH3N/wlOuyhlOOfCMz1hbc2vWQC6cbNzqVePsbWi', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(2, 'Admin', '', 'admin', '018XXXXXXXX', 'admin@example.com', NULL, '$2y$10$vt0nY03Rnm8KMBH3N/wlOuyhlOOfCMz1hbc2vWQC6cbNzqVePsbWi', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33'),
(3, 'Editor', '', 'editor', '017XXXXXXXX', 'editor@example.com', NULL, '$2y$10$vt0nY03Rnm8KMBH3N/wlOuyhlOOfCMz1hbc2vWQC6cbNzqVePsbWi', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `article_types`
--

CREATE TABLE `article_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `authors` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `description`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `authors`) VALUES
(11, '<p>https://en.wikipedia.org/wiki/George_R._R._Martin</p>', 1, NULL, 1, 1, NULL, '2024-08-02 22:13:53', '2024-08-07 05:04:33', 'G.Martin');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `enable_bg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>active, 0=>inactive',
  `text_color` varchar(20) NOT NULL DEFAULT '000000',
  `priority` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `enable_bg`, `text_color`, `priority`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Thơ', 'life-style', NULL, 1, 0, '000000', 1, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33'),
(2, 'Văn', 'fashion', NULL, 1, 0, '000000', 1, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33'),
(4, 'Fiction', 'non-fiction', '<p>Non-Fiction l&agrave; truyện hư cấu</p>', 0, 0, '000000', 4, '2024-08-06 10:17:45', 1, 1, 1, '2024-08-06 10:02:18', '2024-08-06 10:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2020_05_01_000000_create_admins_table', 1),
(7, '2020_05_01_000010_create_users_table', 1),
(8, '2020_05_01_000020_create_failed_jobs_table', 1),
(9, '2020_05_01_000030_create_password_resets_table', 1),
(10, '2020_05_01_000050_create_categories_table', 1),
(11, '2020_05_01_000060_create_pages_table', 1),
(12, '2020_05_01_000070_create_blogs_table', 1),
(13, '2020_05_01_000080_create_contacts_table', 1),
(14, '2020_05_01_000090_create_tracks_table', 1),
(15, '2021_02_03_061323_create_article_types_table', 1),
(16, '2021_02_27_184353_create_permission_tables', 1),
(17, '2021_02_27_185000_create_countries_table', 1),
(18, '2021_02_27_185728_create_languages_table', 1),
(19, '2021_08_07_071049_create_cache_table', 1),
(20, '2021_08_07_101047_create_services_table', 1),
(21, '2021_09_16_014842_create_booking_requests_table', 1),
(22, '2021_09_20_171606_create_booking_rates_table', 1),
(23, '2021_09_20_193849_create_billing_information_table', 1),
(24, '2022_11_24_143537_delete_old_settings_table', 1),
(25, '2022_11_25_143537_create_settings_table', 1),
(26, '2022_11_25_151900_create_general_settings', 1),
(27, '2022_11_25_152111_create_contact_settings', 1),
(28, '2022_11_25_152117_create_social_settings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(2, 'App\\Models\\Admin', 4),
(2, 'App\\Models\\Admin', 5),
(3, 'App\\Models\\Admin', 3),
(4, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Null if page has no category',
  `article_type_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'If Article Belongs to a Type',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `authors` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `pub_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `description`, `image`, `category_id`, `article_type_id`, `status`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `tag`, `authors`, `title`, `pub_date`) VALUES
(19, 'nói-nhỏ', '<p>Anh y&ecirc;u ơi! Gh&eacute; tai em n&oacute;i nhỏ</p>\r\n<p>Sẽ b&ecirc;n người m&atilde;i m&atilde;i chẳng đ&ocirc;̉i thay</p>\r\n<p>Nguyện b&ecirc;n anh y&ecirc;u m&atilde;i m&atilde;i suốt đời n&agrave;y</p>\r\n<p>Sưởi nồng ấm, những đ&ecirc;m đ&ocirc;ng lạnh gi&aacute;&hellip;</p>', NULL, 2, NULL, 1, NULL, 1, 1, NULL, '2024-08-03 01:02:07', '2024-08-07 04:35:59', 'Thơ', 'Mr.V', 'Nói Nhỏ', '2024-08-03'),
(20, 'game-of-throne', '<p><i><b>A Game of Thrones</b></i><span>&nbsp;is the first novel in&nbsp;</span><i><a href=\"https://en.wikipedia.org/wiki/A_Song_of_Ice_and_Fire\" title=\"A Song of Ice and Fire\">A Song of Ice and Fire</a></i><span>, a series of&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Fantasy\" title=\"Fantasy\">fantasy</a><span>&nbsp;novels by American author&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/George_R._R._Martin\" title=\"George R. R. Martin\">George R. R. Martin</a><span>. It was first published on August 6</span></p>', NULL, 4, NULL, 1, NULL, 1, NULL, NULL, '2024-08-07 04:41:50', '2024-08-07 04:41:50', 'Fiction,Fantasy', 'G.Martin', 'Game of throne', '1980-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `group_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(2, 'settings.view', 'admin', 'settings', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(3, 'settings.edit', 'admin', 'settings', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(4, 'permission.view', 'admin', 'permission', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(5, 'permission.create', 'admin', 'permission', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(6, 'permission.edit', 'admin', 'permission', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(7, 'permission.delete', 'admin', 'permission', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(8, 'admin.view', 'admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(9, 'admin.create', 'admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(10, 'admin.edit', 'admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(11, 'admin.delete', 'admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(12, 'admin_profile.view', 'admin', 'admin_profile', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(13, 'admin_profile.edit', 'admin', 'admin_profile', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(14, 'role.view', 'admin', 'role_manage', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(15, 'role.create', 'admin', 'role_manage', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(16, 'role.edit', 'admin', 'role_manage', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(17, 'role.delete', 'admin', 'role_manage', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(18, 'user.view', 'admin', 'user', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(19, 'user.create', 'admin', 'user', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(20, 'user.edit', 'admin', 'user', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(21, 'user.delete', 'admin', 'user', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(22, 'category.view', 'admin', 'category', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(23, 'category.create', 'admin', 'category', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(24, 'category.edit', 'admin', 'category', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(25, 'category.delete', 'admin', 'category', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(26, 'page.view', 'admin', 'page', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(27, 'page.create', 'admin', 'page', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(28, 'page.edit', 'admin', 'page', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(29, 'page.delete', 'admin', 'page', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(30, 'author.view', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(31, 'poetry.create', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(32, 'poetry.edit', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(33, 'poetry.delete', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(34, 'booking_request.view', 'admin', 'booking_request', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(35, 'booking_request.edit', 'admin', 'booking_request', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(36, 'booking_request.delete', 'admin', 'booking_request', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(37, 'author.view', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(38, 'author.create', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(39, 'author.edit', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(40, 'author.delete', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(41, 'slider.view', 'admin', 'slider', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(42, 'slider.create', 'admin', 'slider', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(43, 'slider.edit', 'admin', 'slider', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(44, 'slider.delete', 'admin', 'slider', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(45, 'tracking.view', 'admin', 'tracking', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(46, 'tracking.delete', 'admin', 'tracking', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(47, 'email_notification.view', 'admin', 'notifications', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(48, 'email_notification.edit', 'admin', 'notifications', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(49, 'email_message.view', 'admin', 'notifications', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(50, 'email_message.edit', 'admin', 'notifications', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(51, 'contact.view', 'admin', 'contacts', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(52, 'contact.create', 'admin', 'contacts', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(53, 'module.view', 'admin', 'module', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(54, 'module.create', 'admin', 'module', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(55, 'module.edit', 'admin', 'module', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(56, 'module.delete', 'admin', 'module', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(57, 'module.toggle', 'admin', 'module', '2024-06-28 23:14:32', '2024-06-28 23:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `poems`
--

CREATE TABLE `poems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active, 0=>inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poems`
--

INSERT INTO `poems` (`id`, `title`, `slug`, `description`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `date`, `status`) VALUES
(6, 'quan', 'quan-2', '<p>quan</p>\r\n<p>quan</p>\r\n<p>quan</p>', NULL, 1, NULL, NULL, '2024-07-13 06:08:24', '2024-07-13 06:08:24', '2024-07-12', 1),
(8, 'le', 'le', '<p>Le</p>\r\n<p>Le</p>\r\n<p>Le</p>', NULL, 1, NULL, NULL, '2024-07-13 06:14:49', '2024-07-13 06:14:49', '2024-07-05', 1),
(9, 'linh23', 'linh23', '<p>linh</p>\r\n<p>linh</p>\r\n<p>linh</p>', NULL, 1, NULL, NULL, '2024-07-13 06:28:55', '2024-07-13 06:28:55', '2024-07-11', 1),
(11, 'quan123', 'quan123', '<p>iiiii</p>\r\n<p>ikki</p>\r\n<p>jkj</p>', NULL, 1, NULL, NULL, '2024-07-13 06:29:11', '2024-07-13 06:29:11', '2024-07-11', 1),
(15, 'quan', 'quan-3', '<p>quan</p>\r\n<p>quan</p>', NULL, 1, NULL, NULL, '2024-07-29 13:46:58', '2024-07-29 13:46:58', '2024-07-10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Subscriber', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(2, 'Admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(3, 'Editor', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(4, 'Super Admin', 'admin', '2024-06-28 23:14:32', '2024-06-28 23:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'general', 'name', 0, '\"CMS Th\\u01a1 V\\u0103n\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(2, 'general', 'logo', 0, '\"logo.png\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(3, 'general', 'favicon', 0, '\"favicon.ico\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(4, 'general', 'description', 0, 'null', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(5, 'general', 'copyright_text', 0, '\"Copyright \\u00a9 2024\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(6, 'general', 'meta_keywords', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(7, 'general', 'meta_description', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(8, 'general', 'meta_author', 0, '\"Quan\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(9, 'contact', 'contact_no', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(10, 'contact', 'phone', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(11, 'contact', 'email_primary', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(12, 'contact', 'email_secondary', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(13, 'contact', 'address', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(14, 'contact', 'working_day_hours', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(15, 'contact', 'map_lat', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(16, 'contact', 'map_long', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(17, 'contact', 'map_zoom', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 16:41:58'),
(18, 'social', 'facebook', 0, '\"https:\\/\\/facebook.com\\/example\"', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(19, 'social', 'twitter', 0, '\"https:\\/\\/twitter.com\\/\"', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(20, 'social', 'youtube', 0, '\"https:\\/\\/youtube.com\\/\"', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(21, 'social', 'linkedin', 0, '\"https:\\/\\/linkedin.com\\/\"', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(22, 'api', 'list_api', 0, '\"<p><a href=\\\"..\\/api\\/categories\\\">http:\\/\\/localhost:8000\\/api\\/categories<\\/a>;<br \\/><a href=\\\"..\\/api\\/pages\\/random?limit=5;\\\"> http:\\/\\/localhost:8000\\/api\\/pages\\/random?limit=5;<\\/a><br \\/><a href=\\\"..\\/api\\/category;\\\">http:\\/\\/localhost:8000\\/api\\/category;<\\/a><br \\/><a href=\\\"..\\/api\\/categories\\\">http:\\/\\/localhost:8000\\/api\\/article<\\/a>;<br \\/><a href=\\\"..\\/api\\/categories\\\">http:\\/\\/localhost:8000\\/api\\/chat<\\/a>;<br \\/><a href=\\\"..\\/api\\/config\\\">http:\\/\\/localhost:8000\\/api\\/config;<\\/a><br \\/>http:\\/\\/localhost:8000\\/api\\/search?keyword=quan&amp;limit=10&amp;offset=0<\\/p>\\r\\n<p><\\/p>\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53'),
(23, 'api', 'data_setting_api', 0, '\"<p>Quan Dep Trai<\\/p>\\r\\n<p>Quan Dep Trai<\\/p>\\r\\n<p>Quan Dep Trai<\\/p>\"', '2024-06-28 23:14:32', '2024-08-02 13:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `reference_link` varchar(191) DEFAULT NULL COMMENT 'If there is possible to keep any reference link',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `title`, `description`, `reference_link`, `admin_id`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-07-02 07:21:37', '2024-07-02 07:21:37'),
(2, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-07-02 07:21:44', '2024-07-02 07:21:44'),
(3, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-07-02 07:21:46', '2024-07-02 07:21:46'),
(4, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-07-02 07:23:50', '2024-07-02 07:23:50'),
(5, 'quan3591', 'New Admin has been created', NULL, 1, NULL, NULL, '2024-07-03 09:44:02', '2024-07-03 09:44:02'),
(6, 'quan3591', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2024-07-03 09:44:36', '2024-07-03 09:44:36'),
(7, 'quan', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 04:25:33', '2024-07-06 04:25:33'),
(8, 'test', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:07:38', '2024-07-06 06:07:38'),
(9, 'ơ;l', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:09:08', '2024-07-06 06:09:08'),
(10, 'jjkj', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:12:01', '2024-07-06 06:12:01'),
(11, 'l;l;l', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:17:56', '2024-07-06 06:17:56'),
(12, 'hkjhjk', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:19:00', '2024-07-06 06:19:00'),
(13, 'hhhhhh', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:19:18', '2024-07-06 06:19:18'),
(14, 'klkkl', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-06 06:26:10', '2024-07-06 06:26:10'),
(15, 'kl;kl;', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-08 05:10:49', '2024-07-08 05:10:49'),
(16, 'hjkhkj', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-12 07:36:43', '2024-07-12 07:36:43'),
(17, 'hjkhkj', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2024-07-12 07:44:50', '2024-07-12 07:44:50'),
(20, 'quan', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-12 07:48:36', '2024-07-12 07:48:36'),
(21, '2024-07-11', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-12 08:09:58', '2024-07-12 08:09:58'),
(22, 'quan', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 06:08:24', '2024-07-13 06:08:24'),
(23, 'le', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 06:14:49', '2024-07-13 06:14:49'),
(24, 'linh23', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 06:28:55', '2024-07-13 06:28:55'),
(25, 'quan123', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 06:29:11', '2024-07-13 06:29:11'),
(26, 'll', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 06:30:46', '2024-07-13 06:30:46'),
(27, 'fghfhgf', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 08:00:43', '2024-07-13 08:00:43'),
(28, 'kljklj', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-13 10:42:12', '2024-07-13 10:42:12'),
(29, 'quan333', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-20 13:23:09', '2024-07-20 13:23:09'),
(30, ';l;kl;', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-20 13:30:58', '2024-07-20 13:30:58'),
(31, 'quan', 'New Page has been created', NULL, 1, NULL, NULL, '2024-07-21 09:29:58', '2024-07-21 09:29:58'),
(32, 'quan', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-29 13:46:58', '2024-07-29 13:46:58'),
(33, 'dung', 'New Service has been created', NULL, 1, NULL, NULL, '2024-07-29 13:47:22', '2024-07-29 13:47:22'),
(34, 'Bangla', 'Language has been updated successfully !!', NULL, 1, NULL, NULL, '2024-07-29 19:31:01', '2024-07-29 19:31:01'),
(35, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-01 16:41:57', '2024-08-01 16:41:57'),
(36, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-01 16:41:58', '2024-08-01 16:41:58'),
(37, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-01 22:39:50', '2024-08-01 22:39:50'),
(38, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 02:09:18', '2024-08-02 02:09:18'),
(39, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 02:10:25', '2024-08-02 02:10:25'),
(40, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 10:59:19', '2024-08-02 10:59:19'),
(41, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 11:19:29', '2024-08-02 11:19:29'),
(42, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 11:20:00', '2024-08-02 11:20:00'),
(43, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 11:21:02', '2024-08-02 11:21:02'),
(44, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 13:27:23', '2024-08-02 13:27:23'),
(45, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-02 13:47:53', '2024-08-02 13:47:53'),
(46, 'quan0000000', 'New Admin has been created', NULL, 1, NULL, NULL, '2024-08-02 22:01:09', '2024-08-02 22:01:09'),
(47, 'quan0000000', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2024-08-02 22:02:16', '2024-08-02 22:02:16'),
(48, 'Nói Nhỏ', 'New Page has been created', NULL, 1, NULL, NULL, '2024-08-03 01:02:07', '2024-08-03 01:02:07'),
(49, 'Nói Nhỏ', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2024-08-03 01:11:40', '2024-08-03 01:11:40'),
(50, 'Dung007', 'New Admin has been created', NULL, 1, NULL, NULL, '2024-08-03 10:49:43', '2024-08-03 10:49:43'),
(51, 'Dung004', 'Admin has been updated successfully !!', NULL, 1, NULL, NULL, '2024-08-03 10:50:34', '2024-08-03 10:50:34'),
(52, 'Non-Fiction', 'New Category has been created', NULL, 1, NULL, NULL, '2024-08-06 10:02:18', '2024-08-06 10:02:18'),
(53, 'non-fiction', 'Phân Loại đã được tạo!!', NULL, 1, NULL, NULL, '2024-08-06 10:14:25', '2024-08-06 10:14:25'),
(54, 'Nói Nhỏ', 'Page has been updated successfully !!', NULL, 1, NULL, NULL, '2024-08-07 04:35:59', '2024-08-07 04:35:59'),
(55, 'Game of throne', 'New Page has been created', NULL, 1, NULL, NULL, '2024-08-07 04:41:50', '2024-08-07 04:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `phone_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=active, 0=inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_created_by_foreign` (`created_by`),
  ADD KEY `admins_updated_by_foreign` (`updated_by`),
  ADD KEY `admins_deleted_by_foreign` (`deleted_by`),
  ADD KEY `admins_first_name_index` (`first_name`),
  ADD KEY `admins_phone_no_index` (`phone_no`);

--
-- Indexes for table `article_types`
--
ALTER TABLE `article_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_created_by_foreign` (`created_by`),
  ADD KEY `blogs_updated_by_foreign` (`updated_by`),
  ADD KEY `blogs_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_updated_by_foreign` (`updated_by`),
  ADD KEY `categories_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_created_by_foreign` (`created_by`),
  ADD KEY `pages_updated_by_foreign` (`updated_by`),
  ADD KEY `pages_deleted_by_foreign` (`deleted_by`),
  ADD KEY `pages_category_id_foreign` (`category_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `poems`
--
ALTER TABLE `poems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`),
  ADD KEY `services_created_by_foreign` (`created_by`),
  ADD KEY `services_updated_by_foreign` (`updated_by`),
  ADD KEY `services_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_group_index` (`group`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracks_deleted_by_foreign` (`deleted_by`),
  ADD KEY `tracks_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_first_name_index` (`first_name`),
  ADD KEY `users_phone_no_index` (`phone_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `article_types`
--
ALTER TABLE `article_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `poems`
--
ALTER TABLE `poems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poems`
--
ALTER TABLE `poems`
  ADD CONSTRAINT `services_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tracks_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
