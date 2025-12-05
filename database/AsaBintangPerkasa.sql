-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2025 at 10:49 AM
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
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(20, 16, 3, 1, '2025-08-15 01:46:58', '2025-08-15 01:46:58'),
(21, 16, 4, 1, '2025-08-15 01:47:02', '2025-08-15 01:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Minyak', 'minyak', '1i0GRG1RxAy9fOh5oahCVNv0JOa2nWgbSTD3pisn.png', '2025-08-12 22:25:09', '2025-08-12 22:25:09'),
(2, 'Kecap', 'kecap', '03xsRhFB8yRe3G1GRlbdEqKZd5vezI99KeL3IPdS.png', '2025-08-15 00:00:53', '2025-08-15 00:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
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
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_05_19_021700_create_categories_table', 1),
(7, '2022_05_20_152415_create_suppliers_table', 1),
(8, '2022_05_21_115535_create_products_table', 1),
(9, '2022_06_02_023929_create_carts_table', 1),
(10, '2022_06_02_083045_create_transactions_table', 1),
(11, '2022_06_02_083409_create_transaction_details_table', 1),
(12, '2022_06_05_130429_create_vehicles_table', 1),
(13, '2022_06_06_032916_create_rents_table', 1),
(14, '2022_06_08_010711_create_permission_tables', 1),
(15, '2022_06_08_025026_create_orders_table', 1),
(16, '2025_08_13_095305_create_vehicle_transactions_table', 2),
(17, '2025_08_13_134747_add_prices_to_products_table', 3),
(18, '2025_08_13_144505_add_total_price_to_transaction_details_table', 4),
(19, '2025_08_14_123849_add_product_fields_to_vehicle_items', 5),
(20, '2025_08_15_031243_add_role_to_users_table', 6),
(21, '2025_08_15_034512_add_address_to_users_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'Menunggu Konfirmasi',
  `image` varchar(255) DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'index-dashboard', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(2, 'index-product', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(3, 'create-product', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(4, 'delete-product', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(5, 'update-product', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(6, 'index-category', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(7, 'create-category', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(8, 'delete-category', 'web', '2025-08-12 18:12:58', '2025-08-12 18:12:58'),
(9, 'update-category', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(10, 'index-supplier', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(11, 'create-supplier', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(12, 'delete-supplier', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(13, 'update-supplier', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(14, 'index-vehicle', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(15, 'create-vehicle', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(16, 'delete-vehicle', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(17, 'update-vehicle', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(18, 'index-stock', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(19, 'create-stock', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(20, 'index-permission', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(21, 'create-permission', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(22, 'delete-permission', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(23, 'update-permission', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(24, 'index-role', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(25, 'create-role', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(26, 'delete-role', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(27, 'update-role', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(28, 'index-user', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(29, 'create-user', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(30, 'delete-user', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(31, 'update-user', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(32, 'index-order', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(33, 'create-order', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(34, 'index-rent', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(35, 'create-rent', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(36, 'index-transaction', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(37, 'create-transaction', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `purchase_price` decimal(15,2) DEFAULT NULL,
  `selling_price` decimal(15,2) DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `supplier_id`, `name`, `slug`, `description`, `purchase_price`, `selling_price`, `quantity`, `image`, `unit`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Minyak Kita Bantal', 'minyak-kita-bantal', 'Minyak keren', 80000.00, 100000.00, 1010, 'uu1W842R3SW3zSqE6XVl9cWLRKut2Q8KPUrVG5Z0.png', 'PCS', '2025-08-12 22:25:55', '2025-08-14 07:50:05'),
(2, 1, 1, 'Minyak Kita Pouch', 'minyak-kita-pouch', 'ddfdf', 85000.00, 110000.00, 896, 'iR1dKNMQykKXfse6JMat217shT3jlRtt2xL85nkz.png', 'Bungkus', '2025-08-13 00:53:42', '2025-08-13 06:41:00'),
(3, 1, 1, 'Minyak Kamu heheh', 'minyak-kamu-heheh', 'Enak tenan', 100000.00, 120000.00, 2380, 'V7d9Qsgah33PSpBLed92cq7q1Of7EpDpIcq91tCj.png', 'Bungkus', '2025-08-13 07:08:41', '2025-08-15 01:23:13'),
(4, 2, 2, 'Kecap Manis', 'kecap-manis', 'Kecap Enak', 30000.00, 60000.00, 930, 'p1HtQH4IeWY771XJ4JJ5O9imQAm9e9eW6ia3H5ut.png', 'Bungkus', '2025-08-15 00:01:39', '2025-08-15 01:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `rents`
--

CREATE TABLE `rents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `requirement` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Kendaraan Sedang Digunakan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(2, 'Customer', 'web', '2025-08-12 18:12:59', '2025-08-12 18:12:59');

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
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `telp`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Pak Akbar', '09203223', 'Pekanbaru', '2025-08-12 22:25:29', '2025-08-12 22:25:29'),
(2, 'Pak Aksa', '834837434', 'Medan', '2025-08-15 00:01:08', '2025-08-15 00:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `invoice`, `created_at`, `updated_at`) VALUES
(1, 2, 'INV-1S368W8D', '2025-08-12 22:29:29', '2025-08-12 22:29:29'),
(2, 3, 'INV-CV36S3E6', '2025-08-12 22:34:27', '2025-08-12 22:34:27'),
(3, 3, 'INV-OZI9CW0A', '2025-08-13 06:35:44', '2025-08-13 06:35:44'),
(4, 1, 'INV-83K303N7', '2025-08-13 06:41:00', '2025-08-13 06:41:00'),
(5, 3, 'INV-3049C81X', '2025-08-13 07:32:54', '2025-08-13 07:32:54'),
(6, 3, 'INV-VD3W23L2', '2025-08-13 07:55:26', '2025-08-13 07:55:26'),
(7, 3, 'INV-62U4776T', '2025-08-13 07:57:03', '2025-08-13 07:57:03'),
(8, 1, 'INV-S36OF29L', '2025-08-13 20:05:56', '2025-08-13 20:05:56'),
(9, 3, 'INV-EDDISUMH', '2025-08-13 21:42:50', '2025-08-13 21:42:50'),
(10, 3, 'INV-9GYIGML3', '2025-08-13 21:43:15', '2025-08-13 21:43:15'),
(11, 2, 'INV-UXCFU47A', '2025-08-13 22:27:25', '2025-08-13 22:27:25'),
(12, 3, 'INV-AB3WLPKF', '2025-08-13 22:41:46', '2025-08-13 22:41:46'),
(13, 3, 'INV-5B123T1Z', '2025-08-13 23:38:21', '2025-08-13 23:38:21'),
(14, 3, 'INV-RJPF8HYW', '2025-08-14 06:48:00', '2025-08-14 06:48:00'),
(15, 2, 'INV-GEKF3YF0', '2025-08-14 23:38:29', '2025-08-14 23:38:29'),
(16, 2, 'INV-Y8LQRVPX', '2025-08-14 23:38:51', '2025-08-14 23:38:51'),
(17, 3, 'INV-GYCMHLXT', '2025-08-14 23:39:46', '2025-08-14 23:39:46'),
(18, 3, 'INV-AXNLAK0M', '2025-08-14 23:41:24', '2025-08-14 23:41:24'),
(19, 3, 'INV-1TLH9FEY', '2025-08-14 23:54:13', '2025-08-14 23:54:13'),
(20, 3, 'INV-A7I1S41N', '2025-08-14 23:58:44', '2025-08-14 23:58:44'),
(21, 3, 'INV-WYVIKYT3', '2025-08-15 00:26:46', '2025-08-15 00:26:46'),
(22, 3, 'INV-N7THLRWD', '2025-08-15 01:22:25', '2025-08-15 01:22:25'),
(23, 3, 'INV-IKIABTRE', '2025-08-15 01:23:13', '2025-08-15 01:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `product_id`, `quantity`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, '2025-08-12 22:29:29', '2025-08-12 22:29:29'),
(2, 2, 1, 10, NULL, '2025-08-12 22:34:27', '2025-08-12 22:34:27'),
(3, 3, 2, 100, NULL, '2025-08-13 06:35:44', '2025-08-13 06:35:44'),
(4, 4, 2, 4, NULL, '2025-08-13 06:41:00', '2025-08-13 06:41:00'),
(5, 4, 1, 3, NULL, '2025-08-13 06:41:00', '2025-08-13 06:41:00'),
(6, 5, 3, 2, NULL, '2025-08-13 07:32:54', '2025-08-13 07:32:54'),
(7, 7, 3, 4, 480000.00, '2025-08-13 07:57:03', '2025-08-13 07:57:03'),
(8, 8, 3, 4, 480000.00, '2025-08-13 20:05:56', '2025-08-13 20:05:56'),
(9, 9, 3, 4, 480000.00, '2025-08-13 21:42:50', '2025-08-13 21:42:50'),
(10, 10, 3, 6, 720000.00, '2025-08-13 21:43:15', '2025-08-13 21:43:15'),
(11, 11, 3, 13, 1560000.00, '2025-08-13 22:27:25', '2025-08-13 22:27:25'),
(12, 12, 3, 23, 2760000.00, '2025-08-13 22:41:46', '2025-08-13 22:41:46'),
(13, 12, 1, 2, 0.00, '2025-08-13 22:41:46', '2025-08-13 22:41:46'),
(14, 13, 1, 2, 200000.00, '2025-08-13 23:38:21', '2025-08-13 23:38:21'),
(15, 13, 3, 3, 360000.00, '2025-08-13 23:38:21', '2025-08-13 23:38:21'),
(16, 14, 1, 5, 500000.00, '2025-08-14 06:48:00', '2025-08-14 06:48:00'),
(17, 14, 3, 3, 360000.00, '2025-08-14 06:48:00', '2025-08-14 06:48:00'),
(18, 15, 3, 3, 360000.00, '2025-08-14 23:38:29', '2025-08-14 23:38:29'),
(19, 16, 3, 10, 1200000.00, '2025-08-14 23:38:51', '2025-08-14 23:38:51'),
(20, 17, 3, 10, 1200000.00, '2025-08-14 23:39:46', '2025-08-14 23:39:46'),
(21, 18, 3, 10, 1200000.00, '2025-08-14 23:41:24', '2025-08-14 23:41:24'),
(22, 19, 3, 30, 3600000.00, '2025-08-14 23:54:13', '2025-08-14 23:54:13'),
(23, 20, 3, 30, 3600000.00, '2025-08-14 23:58:44', '2025-08-14 23:58:44'),
(24, 21, 4, 50, 3000000.00, '2025-08-15 00:26:46', '2025-08-15 00:26:46'),
(25, 22, 4, 20, 1200000.00, '2025-08-15 01:22:25', '2025-08-15 01:22:25'),
(26, 22, 3, 100, 12000000.00, '2025-08-15 01:22:25', '2025-08-15 01:22:25'),
(27, 23, 3, 20, 2400000.00, '2025-08-15 01:23:13', '2025-08-15 01:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `avatar`, `department`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$rLqh3zL9lwyRSjSMmrjiW.ISZ6hK7K8LqyagJs673Vo4DhYaYZObW', NULL, NULL, NULL, NULL, 'Umum', NULL, '2025-08-12 18:12:59', '2025-08-12 18:12:59'),
(2, 'Aksa', 'Aksa@gmail.com', NULL, '$2y$10$FuqtKdlHq1fKHTGN7i257..GYJ0BQVcSEWkLnCzHTm45o/SGFCz3K', NULL, NULL, NULL, NULL, 'Umum', NULL, '2025-08-12 22:28:32', '2025-08-12 22:28:32'),
(3, 'Aksara', 'Aksarara@gmail.com', NULL, '$2y$10$pqD.58KjgbcpLSER2I3OG.7NWR6jo4YWNVvyCwzR.DlvQPUV313x6', NULL, NULL, NULL, NULL, 'Umum', NULL, '2025-08-12 22:34:09', '2025-08-14 23:07:36'),
(16, 'Serena', 'serena@gmail.com', NULL, '$2y$10$c6N7X1T04W9fk9zdvqSjN.eG7gkF/7UfEqy7KGunNRzqw8xXSKiJu', NULL, NULL, NULL, NULL, 'Umum', NULL, '2025-08-15 01:46:20', '2025-08-15 01:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `merk` varchar(255) NOT NULL,
  `license_plat` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `condition` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `slug`, `type`, `merk`, `license_plat`, `image`, `condition`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fuso', 'fuso', 'Truk', 'Yamaha', 'BA 223 KM', 'p2WQMZgaRW4HPUu1gvAwErX7CF8EcgohWLO6NNJ5.png', 0, 'Tersedia', '2025-08-13 00:55:20', '2025-08-13 00:55:20'),
(2, 'Colt Diesel', 'colt-diesel', 'Truk', 'Mitsubishi', 'BM 2824 QQ', 'quI5AKVlc9tP1LBLj527htXWHsSQ7IQPuawJnqai.png', 0, 'Tersedia', '2025-08-15 00:51:04', '2025-08-15 00:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_items`
--

CREATE TABLE `vehicle_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_items`
--

INSERT INTO `vehicle_items` (`id`, `Supplier`, `product_id`, `category_id`, `product_name`, `quantity`, `purchase_price`, `subtotal`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 3, 100000.00, 300000.00, NULL, '2025-08-14 06:43:53', '2025-08-14 06:43:53'),
(2, 'Pak Akbar', 1, 1, 'Minyak Kita Bantal', 6, 80000.00, 480000.00, NULL, '2025-08-14 06:46:03', '2025-08-14 06:46:03'),
(3, 'Pak Akbar', 1, 1, 'Minyak Kita Bantal', 6, 80000.00, 480000.00, NULL, '2025-08-14 07:46:02', '2025-08-14 07:46:02'),
(4, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 10, 100000.00, 1000000.00, NULL, '2025-08-14 07:46:02', '2025-08-14 07:46:02'),
(5, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 10, 100000.00, 1000000.00, NULL, '2025-08-14 07:46:32', '2025-08-14 07:46:32'),
(6, 'Pak Akbar', 1, 1, 'Minyak Kita Bantal', 14, 80000.00, 1120000.00, NULL, '2025-08-14 07:50:05', '2025-08-14 07:50:05'),
(7, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 1000, 100000.00, 100000000.00, NULL, '2025-08-14 23:31:28', '2025-08-14 23:31:28'),
(8, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 1000, 100000.00, 100000000.00, NULL, '2025-08-14 23:31:55', '2025-08-14 23:31:55'),
(9, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 10, 100000.00, 1000000.00, NULL, '2025-08-14 23:40:34', '2025-08-14 23:40:34'),
(10, 'Pak Akbar', 3, 1, 'Minyak Kamu heheh', 10, 100000.00, 1000000.00, NULL, '2025-08-14 23:41:04', '2025-08-14 23:41:04'),
(11, 'Pak Aksa', 4, 2, 'Kecap Manis', 1000, 30000.00, 30000000.00, NULL, '2025-08-15 00:26:26', '2025-08-15 00:26:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `rents`
--
ALTER TABLE `rents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rents_user_id_foreign` (`user_id`),
  ADD KEY `rents_vehicle_id_foreign` (`vehicle_id`);

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
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_details_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_items`
--
ALTER TABLE `vehicle_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_items_category_id_foreign` (`category_id`),
  ADD KEY `vehicle_items_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rents`
--
ALTER TABLE `rents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle_items`
--
ALTER TABLE `vehicle_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rents`
--
ALTER TABLE `rents`
  ADD CONSTRAINT `rents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `rents_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transaction_details_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `vehicle_items`
--
ALTER TABLE `vehicle_items`
  ADD CONSTRAINT `vehicle_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
