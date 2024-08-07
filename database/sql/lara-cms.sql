-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2024 at 09:05 PM
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
(12, '<p style=\"font-weight: 400;\"><strong>- Họ v&agrave; t&ecirc;n</strong><em>:<span>&nbsp;</span><strong>Trần Văn M&agrave;u</strong></em><span>&nbsp;</span>&nbsp;&nbsp;&nbsp;B&uacute;t danh:<span>&nbsp;</span><strong>Bằng Lăng</strong></p>\r\n<p style=\"font-weight: 400;\"><strong>- Năm sinh: 1966</strong></p>\r\n<p style=\"font-weight: 400;\"><strong>- Qu&ecirc; qu&aacute;n: x&atilde; Long Thắng, huyện Lai Vung, tỉnh Đồng Th&aacute;p</strong></p>\r\n<p style=\"font-weight: 400;\"><strong>- Nơi ở hiện nay</strong>:<span>&nbsp;</span><strong><em>750 ấp B&igrave;nh Lợi, x&atilde; B&igrave;nh Th&agrave;nh, huyện Lấp V&ograve;, tỉnh Đồng Th&aacute;p</em></strong></p>\r\n<p style=\"font-weight: 400;\"><strong>- Chức vụ v&agrave; nơi c&ocirc;ng t&aacute;c</strong>:<span>&nbsp;</span><strong>Gi&aacute;o vi&ecirc;n - Tổ trưởng tổ Ngữ văn - GDCD</strong>, trường THCS B&igrave;nh Th&agrave;nh, huyện Lấp V&ograve;, tỉnh Đồng Th&aacute;p.</p>\r\n<p style=\"font-weight: 400;\">- Ủy vi&ecirc;n BCH ph&acirc;n hội VHNT tỉnh Đồng Th&aacute;p</p>\r\n<p style=\"font-weight: 400;\">- Ủy vi&ecirc;n BCH hội VHNT huyện Lấp V&ograve;</p>\r\n<p style=\"font-weight: 400;\">- Th&agrave;nh vi&ecirc;n Tao Đ&agrave;n tỉnh An Giang &ndash; Hội LHVH NT tỉnh An Giang</p>', 1, NULL, 1, NULL, NULL, '2024-08-07 11:01:38', '2024-08-07 11:01:38', 'Bằng Lăng Tím');

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
(1, 'Thơ', 'thơ', NULL, 1, 0, '000000', 1, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33'),
(2, 'Văn', 'văn', NULL, 1, 0, '000000', 1, NULL, NULL, NULL, NULL, '2024-06-28 23:14:33', '2024-06-28 23:14:33'),
(5, 'Non-Fiction', 'non-fiction', NULL, 1, 0, '000000', 5, NULL, 1, NULL, NULL, '2024-08-07 09:49:37', '2024-08-07 09:49:37'),
(6, 'Fiction', 'fiction', NULL, 1, 0, '000000', 6, NULL, 1, NULL, NULL, '2024-08-07 09:50:26', '2024-08-07 09:50:26');

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
(19, 'nói-nhỏ', '<p>Anh y&ecirc;u ơi! Gh&eacute; tai em n&oacute;i nhỏ</p>\r\n<p>Sẽ b&ecirc;n người m&atilde;i m&atilde;i chẳng đ&ocirc;̉i thay</p>\r\n<p>Nguyện b&ecirc;n anh y&ecirc;u m&atilde;i m&atilde;i suốt đời n&agrave;y</p>\r\n<p>Sưởi nồng ấm, những đ&ecirc;m đ&ocirc;ng lạnh gi&aacute;&hellip;</p>', NULL, 1, NULL, 1, NULL, 1, 1, NULL, '2024-08-03 01:02:07', '2024-08-07 10:14:48', 'Thơ', 'Mr.V', 'Nói Nhỏ', '2024-08-03'),
(21, 'hà-nội-mùa-cúc-họa-mi', '<div class=\"paragraph\">Đ&ocirc;ng H&agrave; Nội họa mi c&uacute;c nở</div>\r\n<div class=\"paragraph\">C&aacute;nh mỏng xinh rạng rỡ b&ecirc;n thềm</div>\r\n<div class=\"paragraph\">Thu qua nỗi nhớ nhiều th&ecirc;m</div>\r\n<div class=\"paragraph\">L&aacute; v&agrave;ng tr&uacute;t rụng &ecirc;m đềm lối xưa</div>\r\n<div class=\"paragraph\">Phố ng&aacute;i ngủ như vừa tỉnh giấc</div>\r\n<div class=\"paragraph\">Gi&oacute; lang thang gh&eacute; bậc hi&ecirc;n nh&agrave;</div>\r\n<div class=\"paragraph\">Ngỡ ng&agrave;ng trước những nụ hoa</div>\r\n<div class=\"paragraph\">Tinh kh&ocirc;i c&aacute;nh trắng mượt m&agrave; đ&aacute;ng y&ecirc;u</div>\r\n<div class=\"paragraph\">T&agrave; &aacute;o mỏng diễm kiều d&aacute;ng ngọc</div>\r\n<div class=\"paragraph\">Mắt nhung huyền m&aacute;i t&oacute;c ngang vai</div>\r\n<div class=\"paragraph\">Xinh tươi đượm n&eacute;t trang đ&agrave;i</div>\r\n<div class=\"paragraph\">Dạo tr&ecirc;n phố nhỏ l&agrave;m ai ngẩn nh&igrave;n</div>\r\n<div class=\"paragraph\">Bao kỷ niệm hằn in t&acirc;m tr&iacute;</div>\r\n<div class=\"paragraph\">Ly c&agrave; ph&ecirc; thơm vị ngọt ng&agrave;o</div>\r\n<div class=\"paragraph\">Ấm nồng hạnh ph&uacute;c ta trao</div>\r\n<div class=\"paragraph\">Họa mi c&uacute;c nở quyện v&agrave;o hồn thơ</div>\r\n<div class=\"paragraph\">Xa biết đến bao giờ gặp lại</div>\r\n<div class=\"paragraph\">Mối t&igrave;nh đầu đẹp m&atilde;i nh&eacute; anh</div>\r\n<div class=\"paragraph\">Tr&aacute;i tim em đ&atilde; ri&ecirc;ng d&agrave;nh</div>\r\n<div class=\"paragraph\">Hai ngăn chứa cả t&igrave;nh xanh ch&uacute;ng m&igrave;nh.</div>', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-08-07 10:14:31', '2024-08-07 10:14:31', 'Thơ', 'Bằng Lăng Tím', 'Hà Nội mùa cúc họa mi', '2024-08-08'),
(22, 'tìm-lại-những-mùa-đông-hà-nội', '<div class=\"paragraph\">H&agrave; Nội đ&ecirc;m m&ugrave;a đ&ocirc;ng!</div>\r\n<div class=\"paragraph\">L&agrave;nh lạnh heo may ph&iacute;a s&ocirc;ng Hồng thổi tới,</div>\r\n<div class=\"paragraph\">Ngọn đ&egrave;n v&agrave;ng ng&oacute;ng ai m&agrave; đứng đợi</div>\r\n<div class=\"paragraph\">Hương sữa thoảng nồng n&agrave;n dệt sợi nhớ, sợi thương...</div>\r\n<div class=\"paragraph\">H&agrave; Nội trải m&ugrave; sương,</div>\r\n<div class=\"paragraph\">Những con đường kho&aacute;c l&ecirc;n m&agrave;u &aacute;o cũ,</div>\r\n<div class=\"paragraph\">Những n&oacute;c phố th&acirc;m nghi&ecirc;m x&ocirc; nghi&ecirc;ng cả một thời qu&aacute; khứ</div>\r\n<div class=\"paragraph\">Bước ch&acirc;n người c&ocirc; lữ chợt hanh hao.</div>\r\n<div class=\"paragraph\">L&ograve;ng b&acirc;ng khu&acirc;ng nhớ kỷ niệm năm n&agrave;o:</div>\r\n<div class=\"paragraph\">Tiếng t&agrave;u điện leng keng...leng keng vọng về trong hư ảo,</div>\r\n<div class=\"paragraph\">Hương Ngọc lan lối hẹn h&ograve; nhuộm thơm m&ugrave;i nếp &aacute;o</div>\r\n<div class=\"paragraph\">Thoảng đ&acirc;u đ&acirc;y hơi ấm mối t&igrave;nh đầu...</div>\r\n<div class=\"paragraph\">Vẫn c&ograve;n đ&oacute;, những h&agrave;ng c&acirc;y im lặng, d&atilde;i dầu</div>\r\n<div class=\"paragraph\">Vẫn c&ograve;n đ&oacute;, giọng rao đ&ecirc;m lắng s&acirc;u miền k&yacute; ức</div>\r\n<div class=\"paragraph\">&Aacute;nh trăng mờ thao thức</div>\r\n<div class=\"paragraph\">Để b&agrave;n ch&acirc;n người ra đi day dứt lối xưa về</div>\r\n<div class=\"paragraph\">Chợt thấy l&ograve;ng t&aacute;i t&ecirc; !</div>\r\n<div class=\"paragraph\">N&agrave;o ai hiểu qu&atilde;ng thời gian l&ecirc; th&ecirc; nơi đất kh&aacute;ch</div>\r\n<div class=\"paragraph\">Nhưng c&ograve;n đ&oacute; H&agrave; Nội th&acirc;n thương khiến t&acirc;m hồn gột sạch</div>\r\n<div class=\"paragraph\">Để c&aacute;nh chim trời sau bao năm xa c&aacute;ch về t&igrave;m lại những m&ugrave;a đ&ocirc;ng...</div>', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, '2024-08-07 10:15:29', '2024-08-07 10:15:29', NULL, 'Đỗ Kim Quang', 'Tìm lại những mùa đông Hà Nội', '2024-08-08'),
(23, 'poor-or-rich', '<p><span>One day, a rich dad took his son on a trip to a poor village. He wanted to show his son how the people in the village lived. They spent time on a farm of one of the poorest families. At the end of the day, the dad asked: &ldquo;Did you see how poor they are? What did you learn?&rdquo;</span><br /><span>The boy answered: &ldquo;We have a dog, they have four. We have a pool, they have a river. We buy food and they grow theirs. We have walls to protect us, they have friends.&rdquo;</span><br /><span>After they left, the boy wanted to tell his dad the truth. &ldquo;Well, thanks for showing me how poor we are&rdquo;, said the boy.</span></p>', NULL, 6, NULL, 1, NULL, 1, NULL, NULL, '2024-08-07 10:22:01', '2024-08-07 10:22:01', 'Văn', 'Vô Danh', 'Poor or rich', '2024-08-08'),
(24, 'never-tell-a-lie', '<p><span>On his deathbed, a father advised his son to always speak the truth. The son promised that he would never tell a lie. One day, while going to the city through a forest, he got surrounded by some robbers. One of them asked, &ldquo;What do you have?&rdquo; The boy answered, &ldquo;I have fifty rupees.&rdquo; They searched for him but couldn&rsquo;t find anything. When they were about to go, the boy called out, &ldquo;I am not telling a lie. See this fifty rupee note which I had hidden in my shirt.&rdquo; The leader of the robbers felt pleased with the truthfulness of the boy, gave him a hundred rupees as a reward and went away.</span></p>', NULL, 6, NULL, 1, NULL, 1, NULL, NULL, '2024-08-07 10:22:45', '2024-08-07 10:22:45', NULL, 'Vô Danh', 'Never tell a lie', '2024-08-08'),
(25, 'tiếng-hót-chim-sơn-ca', '<p class=\"block2\">Trời thu, nắng đẹp.</p>\r\n<p class=\"block2\">T&ocirc;i đẩy cổng bước v&agrave;o vườn nh&agrave; người bạn chơi chim. &Ocirc;ng chủ reo to:</p>\r\n<p class=\"block2\">- Nh&agrave; văn! Ai b&aacute;o m&agrave; biết đấy?</p>\r\n<p class=\"block2\">Thấy t&ocirc;i ngơ ng&aacute;c, &ocirc;ng cười vui:</p>\r\n<p class=\"block2\">- V&ocirc; t&igrave;nh hả? C&agrave;ng hay!</p>\r\n<p class=\"block2\">&Ocirc;ng quay lại n&oacute;i với người kh&aacute;ch đầu bạc:</p>\r\n<p class=\"block2\">- C&oacute; thể&hellip; điềm l&agrave;nh cho ta đ&acirc;y.</p>\r\n<p class=\"block2\">Ch&uacute;ng t&ocirc;i ngồi tr&ecirc;n thảm bẹ ng&ocirc; trải tr&ecirc;n nền cỏ dưới b&oacute;ng một c&acirc;y nh&atilde;n cổ thụ. Đang say m&ecirc; thưởng thức hương vị thơm đậm của nước ch&egrave; trong c&aacute;i ch&eacute;n hạt m&iacute;t mộc, t&ocirc;i bỗng nghe tiếng h&oacute;t của họa mi. Tiếng h&oacute;t vang động, vui tươi, dồn dập.</p>\r\n<p class=\"block2\">- Họa mi h&oacute;t được nhiều giọng thật! &ndash; T&ocirc;i th&aacute;n phục.</p>\r\n<p class=\"block2\">Xem ra c&acirc;u n&oacute;i của t&ocirc;i nịnh được &ocirc;ng chủ &iacute;t nhiều, &ocirc;ng cười kh&agrave; kh&agrave;. Rồi &ocirc;ng thổi s&aacute;o miệng theo nhịp điệu n&agrave;o đ&oacute;. Con họa mi ngừng h&oacute;t, vươn người lắng nghe. &Ocirc;ng thổi v&agrave;i tiếng nữa, nhẹ như gi&oacute; thoảng qua. Nhưng con họa mi bắt nhận được ngay, n&oacute; đ&aacute;p lại bằng những chuỗi &acirc;m thanh &ecirc;m &aacute;i. N&oacute; h&oacute;t ngập ngừng, c&oacute; &lrm; &yacute; nghe ng&oacute;ng, tiếng cao dần, lảnh l&oacute;t. Sau lần s&aacute;o miệng thứ ba của &ocirc;ng chủ, t&ocirc;i thấy con họa mi đứng thẳng người, rướn ngực cất l&ecirc;n một b&agrave;i ca nhiều thanh sắc cao sang.</p>\r\n<p class=\"block2\">T&ocirc;i ngỡ ng&agrave;ng, b&igrave;nh thường tr&ocirc;ng tướng con họa mi rất dữ, sao b&acirc;y giờ n&oacute; dịu d&agrave;ng đến thế? Biết được &yacute; t&ocirc;i, &ocirc;ng chủ lại cười kh&agrave;:</p>\r\n<p class=\"block2\">- Từ hiền nh&acirc;n qu&acirc;n tử đến những kẻ qu&ecirc; m&ugrave;a cục mịch, ph&agrave;m đ&atilde; t&aacute;n g&aacute;i th&igrave; ai nấy cố l&ecirc;n giọng ngọt ng&agrave;o, quyến rũ. Ban n&atilde;y t&ocirc;i phải giả tiếng chim m&aacute;i đấy.</p>\r\n<p class=\"block2\">Ch&uacute;ng t&ocirc;i ồ cười, cũng chẳng tự hỏi cười m&igrave;nh hay cười con họa mi h&aacute;o sắc bị lừa. &Ocirc;ng chủ lại nẩy những tiếng s&aacute;o miệng ngắn. Con họa mi quay ngoắt đầu, lơ l&aacute;o nh&igrave;n quanh. Đến nhịp s&aacute;o thứ hai, n&oacute; nhảy chồm chồm về bốn ph&iacute;a, mắt long l&ecirc;n, c&aacute;c ng&oacute;n ch&acirc;n quắp chặt nan lồng như muốn ph&aacute; tung ra. Rồi n&oacute; h&oacute;t liến thoắng, những nhịp ngắn, dữ dằn. Chỉ một tiếng n&oacute; m&agrave; vang cả khu vườn như c&oacute; rất nhiều con đang ch&agrave;nh chọe với nhau.</p>\r\n<p class=\"block2\">- &Ocirc;ng n&oacute;i đến chất dữ dằn của n&oacute; th&igrave; đấy &ndash; &Ocirc;ng chủ bảo t&ocirc;i &ndash; T&ocirc;i giả tiếng chim trống, n&oacute; vội v&agrave;ng khẳng định quyền chủ l&atilde;nh địa của n&oacute;, đe dọa đối phương. C&ograve;n tiếng h&oacute;t của n&oacute; l&uacute;c &ocirc;ng mới đến l&agrave; tiếng h&oacute;t phởn phơ, phởn phơ khi được tắm m&aacute;t, được ăn ngon&hellip;</p>\r\n<p class=\"block2\">&Ocirc;ng cười, quay lại với mấy người kh&aacute;ch, lắc đầu:</p>\r\n<p class=\"block2\">- Mời c&aacute;c &ocirc;ng đến nghe tiếng sơn ca t&ocirc;i lại đi giới thiệu họa mi &hellip; Th&ocirc;i, &acirc;u cũng l&agrave; c&aacute;i sự đời!</p>\r\n<p class=\"block2\">Thấy t&ocirc;i kh&ocirc;ng hiều, &ocirc;ng kh&aacute;ch đầu bạc giải th&iacute;ch:</p>\r\n<p class=\"block2\">- Ch&uacute;ng t&ocirc;i h&acirc;m mộ tiếng h&oacute;t của chim sơn ca, đ&atilde; nhiều lần đến chầu chực ở đ&acirc;y cả buổi rồi lại về kh&ocirc;ng. Nghe n&oacute;i độ n&agrave;y con sơn ca hay h&oacute;t v&agrave;o qu&atilde;ng 10 giờ sang, h&ocirc;m qua ch&uacute;ng t&ocirc;i đến đ&acirc;y từ 9 giờ. M&atilde;i đến hơn 11 giờ trưa n&oacute; vẫn lặng thinh. Ch&uacute;ng t&ocirc;i vừa ra về th&igrave; n&oacute; h&oacute;t, tiếc thật! H&ocirc;m nay quyết chờ cho kỳ được.</p>\r\n<p class=\"block2\">T&ocirc;i thấy l&ograve;ng phấn chấn, n&oacute;i g&oacute;p:</p>\r\n<p class=\"block2\">- T&ocirc;i cũng từng được nghe n&oacute;i về tiếng h&oacute;t cao q&uacute;y của chim sơn ca v&agrave; cũng chưa một lần được thưởng thức. Liệu &ocirc;ng chủ c&oacute; thể gi&uacute;p ch&uacute;ng t&ocirc;i kh&ocirc;ng? Như với con họa mi ấy&hellip;.</p>\r\n<p class=\"block2\">&Ocirc;ng lắc đầu, nghi&ecirc;m chỉnh:</p>\r\n<p class=\"block2\">- Kh&aacute;c với c&aacute;c giống chim kh&aacute;c, con sơn ca kh&ocirc;ng h&oacute;t để mồi ch&agrave;i con m&aacute;i, kh&ocirc;ng h&oacute;t v&igrave; miếng ăn ngon, kh&ocirc;ng h&oacute;t v&igrave; chuyện tranh gi&agrave;nh, th&ugrave; hận. N&oacute; chỉ h&oacute;t khi n&oacute; th&iacute;ch h&oacute;t, kh&ocirc;ng c&oacute; c&aacute;ch g&igrave; k&iacute;ch th&iacute;ch được n&oacute;.</p>\r\n<p class=\"block2\">&Ocirc;ng lim dim mắt, giọng mơ m&agrave;ng:</p>\r\n<p class=\"block2\">- V&agrave; khi h&oacute;t, n&oacute; kh&ocirc;ng cần biết những g&igrave; ở xung quanh&hellip; To&agrave;n th&acirc;n n&oacute; rung l&ecirc;n, mỗi sợi long đều rung, n&oacute; từ từ bốc th&acirc;n l&ecirc;n cao tới khi lưng chạm v&agrave;o nan lồng lại từ từ hạ xuống&hellip; C&ograve;n tiếng h&oacute;t&hellip; Trời! Tiếng h&oacute;t&hellip;</p>\r\n<p class=\"block2\">Một l&aacute;t im lặng, mọi con mắt đều hướng về ph&iacute;a một c&aacute;i lồng cao, đan rất đẹp đặt ngay tr&ecirc;n mặt đất chỗ c&oacute; b&oacute;ng nắng lấp lo&aacute;ng. B&acirc;y giờ t&ocirc;i mới thật sự để &lrm; &yacute; thấy một con chim nhỏ, m&agrave;u n&acirc;u nhạt đa tha thẩn t&igrave;m bới đ&aacute;m c&aacute;t rải tr&ecirc;n đ&aacute;y lồng, con chim hiền h&ograve;a, giản dị, vẻ ngo&agrave;i kh&ocirc;ng c&oacute; g&igrave; đ&aacute;ng để &yacute;.</p>\r\n<p class=\"block2\">- N&oacute; giống con sẻ đồng qu&aacute; nhỉ! &ndash; T&ocirc;i thốt l&ecirc;n.</p>\r\n<p class=\"block2\">- Đ&uacute;ng vậy! &ndash; &Ocirc;ng chủ khẳng định &ndash; B&igrave;nh thường n&oacute; cũng hay kiếm ăn lẫn trong đ&aacute;m sẻ đồng, &iacute;t người ph&acirc;n biệt được n&oacute; l&agrave; sơn ca. Bọn đ&aacute;nh sẻ cũng thường bắt lẫn nhiều sơn ca, với họ th&igrave; chim l&agrave; để vặt long, buộc th&agrave;nh từng x&acirc;u mười con, mang b&aacute;n ở chợ Bắc Qua với gi&aacute; năm trăm đồng một con&hellip;</p>\r\n<p class=\"block2\">Giọng &ocirc;ng kh&agrave;n đi sau chuỗi ho khan:</p>\r\n<p class=\"block2\">- C&oacute; lần nh&igrave;n những x&acirc;u chim đ&oacute;, t&ocirc;i đ&atilde; ứa nước mắt, kh&ocirc;ng biết trong số n&agrave;y c&oacute; bao nhi&ecirc;u con sơn ca!</p>', NULL, 5, NULL, 1, NULL, 1, 1, NULL, '2024-08-07 10:30:19', '2024-08-07 10:31:16', 'Văn', 'Nguyễn Văn Hoan', 'Tiếng hót chim sơn ca', '2024-08-08');

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
(31, 'author.create', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(32, 'author.edit', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(33, 'author.delete', 'admin', 'service', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(37, 'poetry.view', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(38, 'poetry.create', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(39, 'poetry.edit', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
(40, 'poetry.delete', 'admin', 'blog', '2024-06-28 23:14:32', '2024-06-28 23:14:32'),
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
(9, 'Sống', '', '<p>&ldquo;Nhịp sống vội v&atilde;, bước ch&acirc;n mỏi mệt</p>\r\n<p>Cuộc sống phồn hoa, lại chẳng c&oacute; được hạnh ph&uacute;c.&rdquo;</p>', NULL, 1, NULL, NULL, '2024-07-13 06:28:55', '2024-08-07 10:54:12', '2024-07-11', 1),
(17, 'Nắng', 'nắng', '<p>&ldquo;Nắng đ&atilde; l&igrave;a xa, cơn mưa lạnh buốt,</p>\r\n<p>L&ograve;ng người lạc l&otilde;ng, nỗi buồn kh&ocirc;ng ngu&ocirc;i.&rdquo;</p>', NULL, 1, NULL, NULL, '2024-08-07 10:51:02', '2024-08-07 10:51:02', '2024-08-08', 1);

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
(1, 'general', 'name', 0, '\"CMS Th\\u01a1 V\\u0103n\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(2, 'general', 'logo', 0, '\"logo.png\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(3, 'general', 'favicon', 0, '\"favicon.ico\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(4, 'general', 'description', 0, 'null', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(5, 'general', 'copyright_text', 0, '\"Copyright \\u00a9 2024\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(6, 'general', 'meta_keywords', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(7, 'general', 'meta_description', 0, 'null', '2024-06-28 23:14:32', '2024-08-01 22:39:50'),
(8, 'general', 'meta_author', 0, '\"Quan\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
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
(22, 'api', 'list_api', 0, '\"<p><a href=\\\"..\\/api\\/categories\\\">http:\\/\\/localhost:8000\\/api\\/categories<\\/a><br \\/><a href=\\\"..\\/api\\/pages\\/random?limit=5;\\\"> http:\\/\\/localhost:8000\\/api\\/pages\\/random?limit=5<\\/a><br \\/>http:\\/\\/localhost:8000\\/api\\/category?id=2&amp;limit=15&amp;offset=0&amp;ordering=pubdate<br \\/>http:\\/\\/localhost:8000\\/api\\/article?id=19<br \\/>http:\\/\\/localhost:8000\\/api\\/chat?keyword=N%C3%B3i%20Nh%E1%BB%8F<br \\/><a href=\\\"..\\/api\\/config\\\">http:\\/\\/localhost:8000\\/api\\/config<\\/a><br \\/>http:\\/\\/localhost:8000\\/api\\/search?keyword=quan&amp;limit=10&amp;offset=0<\\/p>\\r\\n<p><\\/p>\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55'),
(23, 'api', 'data_setting_api', 0, '\"<p><span>Cu\\u1ed1n s&aacute;ch \\u0111\\u01b0\\u1ee3c \\u0111&aacute;nh gi&aacute; cao v\\u1ec1 kh\\u1ea3 n\\u0103ng quan s&aacute;t v&agrave; tinh t\\u1ebf c\\u1ee7a t&aacute;c gi\\u1ea3, c\\u0169ng nh\\u01b0 s\\u1ee9c m\\u1ea1nh c\\u1ee7a t\\u1eebng c&acirc;u ch\\u1eef. \\u0110&acirc;y l&agrave; m\\u1ed9t t&aacute;c ph\\u1ea9m ch\\u1ee9a \\u0111\\u1ef1ng nhi\\u1ec1u th&ocirc;ng \\u0111i\\u1ec7p &yacute; ngh\\u0129a v\\u1ec1 t&igrave;nh y&ecirc;u, \\u0111au kh\\u1ed5 v&agrave; hy v\\u1ecdng. D&ugrave; l&agrave; m\\u1ed9t t&aacute;c ph\\u1ea9m c\\u1ee7a m\\u1ed9t t&aacute;c gi\\u1ea3 tr\\u1ebb tu\\u1ed5i, &ldquo;M\\u1ed9t tho&aacute;ng ta r\\u1ef1c r\\u1ee1 \\u1edf nh&acirc;n gian&rdquo; \\u0111&atilde; chinh ph\\u1ee5c \\u0111\\u01b0\\u1ee3c tr&aacute;i tim c\\u1ee7a r\\u1ea5t nhi\\u1ec1u \\u0111\\u1ed9c gi\\u1ea3 tr&ecirc;n th\\u1ebf gi\\u1edbi.<\\/span><\\/p>\\r\\n<p><\\/p>\"', '2024-06-28 23:14:32', '2024-08-07 10:44:55');

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
(55, 'Game of throne', 'New Page has been created', NULL, 1, NULL, NULL, '2024-08-07 04:41:50', '2024-08-07 04:41:50'),
(56, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-07 05:30:33', '2024-08-07 05:30:33'),
(57, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-07 07:47:50', '2024-08-07 07:47:50'),
(58, 'Non-Fiction', 'Phân Loại mới được tạo', NULL, 1, NULL, NULL, '2024-08-07 09:49:37', '2024-08-07 09:49:37'),
(59, 'Fiction', 'Phân Loại mới được tạo', NULL, 1, NULL, NULL, '2024-08-07 09:50:26', '2024-08-07 09:50:26'),
(60, 'Hà Nội mùa cúc họa mi', 'Tác Phẩm đã được tạo', NULL, 1, NULL, NULL, '2024-08-07 10:14:31', '2024-08-07 10:14:31'),
(61, 'Nói Nhỏ', 'Tác Phẩm đã được sửa!!', NULL, 1, NULL, NULL, '2024-08-07 10:14:48', '2024-08-07 10:14:48'),
(62, 'Tìm lại những mùa đông Hà Nội', 'Tác Phẩm đã được tạo', NULL, 1, NULL, NULL, '2024-08-07 10:15:29', '2024-08-07 10:15:29'),
(63, 'Poor or rich', 'Tác Phẩm đã được tạo', NULL, 1, NULL, NULL, '2024-08-07 10:22:01', '2024-08-07 10:22:01'),
(64, 'Never tell a lie', 'Tác Phẩm đã được tạo', NULL, 1, NULL, NULL, '2024-08-07 10:22:45', '2024-08-07 10:22:45'),
(65, 'Tiếng hót chim sơn ca', 'Tác Phẩm đã được tạo', NULL, 1, NULL, NULL, '2024-08-07 10:30:19', '2024-08-07 10:30:19'),
(66, 'Tiếng hót chim sơn ca', 'Tác Phẩm đã được sửa!!', NULL, 1, NULL, NULL, '2024-08-07 10:31:16', '2024-08-07 10:31:16'),
(67, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-07 10:36:25', '2024-08-07 10:36:25'),
(68, 'Settings', 'Setting was updated.', NULL, 1, NULL, NULL, '2024-08-07 10:44:55', '2024-08-07 10:44:55'),
(69, 'Nắng', 'New Service has been created', NULL, 1, NULL, NULL, '2024-08-07 10:51:02', '2024-08-07 10:51:02'),
(70, 'Sống', 'Câu Thơ đã được update!!', NULL, 1, NULL, NULL, '2024-08-07 10:54:12', '2024-08-07 10:54:12');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `poems`
--
ALTER TABLE `poems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
