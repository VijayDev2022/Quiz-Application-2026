-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2026 at 07:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_app_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General Knowledge Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(2, 'Science Basics Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(3, 'History Trivia Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(4, 'Sports Challenge Quiz', 0, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(5, 'Technology Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(6, 'Geography Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(7, 'Mathematics Quiz', 0, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(8, 'English Grammar Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(9, 'Movie Trivia Quiz', 1, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(10, 'Music Quiz', 0, '2026-04-27 07:47:04', '2026-04-27 07:47:04'),
(12, 'fefdfsfds', 1, '2026-04-28 06:48:24', '2026-04-28 06:48:24');

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_04_22_102037_add_role_to_users_table', 2),
(6, '2026_04_24_070536_create_questions_table', 3),
(7, '2026_04_24_090132_create_categories_table', 3),
(8, '2026_04_24_113402_add_category_id_to_questions_table', 3),
(9, '2026_04_24_121837_create_quizzes_table', 3),
(10, '2026_04_27_110252_create_quiz_attempts_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', '7cffcf88987eea2c0b5e1f5a9cb74850c5681d678b6133ae2ea0547426d12cc8', '[\"*\"]', '2026-04-22 05:18:21', NULL, '2026-04-22 05:06:19', '2026-04-22 05:18:21'),
(2, 'App\\Models\\User', 2, 'api-token', 'afbe5a5492e86ee66e4663a69ae16aee6f0342e4725fa3382f361cb1e8763aa0', '[\"*\"]', '2026-04-22 05:26:10', NULL, '2026-04-22 05:22:15', '2026-04-22 05:26:10'),
(3, 'App\\Models\\User', 2, 'api-token', '486dff725459161ca412a9dcad7dda347c90c5f0a6af85b2c3379136cbc192a7', '[\"*\"]', NULL, NULL, '2026-04-22 06:43:55', '2026-04-22 06:43:55'),
(4, 'App\\Models\\User', 2, 'api-token', 'c4f4a5bf2cdac4b5c19e0655fc8a8b416043a3e9df35fac5e708143c2ed83922', '[\"*\"]', NULL, NULL, '2026-04-22 06:58:30', '2026-04-22 06:58:30'),
(5, 'App\\Models\\User', 2, 'api-token', '2ebf2215b43a7a993823e76cda862a3e0055303ce6c87168c708c3396a27d378', '[\"*\"]', NULL, NULL, '2026-04-22 07:14:07', '2026-04-22 07:14:07'),
(6, 'App\\Models\\User', 2, 'api-token', 'ba9872f6f25fbb8b0cf2b11626bc86d29459eb0735b431286a4458bc50830388', '[\"*\"]', NULL, NULL, '2026-04-22 07:18:50', '2026-04-22 07:18:50'),
(7, 'App\\Models\\User', 2, 'api-token', '9e6c1d049f9aac384cd6d8552f39dd4725dc730f817343cfae3c5bf88f7aeaa5', '[\"*\"]', NULL, NULL, '2026-04-22 07:49:35', '2026-04-22 07:49:35'),
(8, 'App\\Models\\User', 2, 'api-token', '519d00226c3d44e901da1b2c58f4e896bcc2246c8d4607391f78a603d44b9eb9', '[\"*\"]', NULL, NULL, '2026-04-22 08:55:26', '2026-04-22 08:55:26'),
(9, 'App\\Models\\User', 2, 'api-token', '89b808f4565897d6a3dd3ecb7c37dab46a9be6e156f04efecb486a6b27a22697', '[\"*\"]', '2026-04-27 02:12:09', NULL, '2026-04-27 02:01:57', '2026-04-27 02:12:09'),
(10, 'App\\Models\\User', 2, 'api-token', '2235788ca77230264a19e8db2daf762dcab0137ebdd0ab60a13f533be6fb6022', '[\"*\"]', '2026-04-27 02:31:12', NULL, '2026-04-27 02:13:11', '2026-04-27 02:31:12'),
(11, 'App\\Models\\User', 1, 'api-token', 'c2d74bcfe49e526d52f395a92075680a5433f59d13335b32d8f4c5dfad9f139c', '[\"*\"]', '2026-04-27 02:32:24', NULL, '2026-04-27 02:31:31', '2026-04-27 02:32:24'),
(12, 'App\\Models\\User', 2, 'api-token', 'fe08e72a9a009a98ae4dc536dc49530629a0f529a2ea233f46c81896eb897b25', '[\"*\"]', '2026-04-27 02:36:09', NULL, '2026-04-27 02:34:48', '2026-04-27 02:36:09'),
(13, 'App\\Models\\User', 2, 'api-token', 'a3b9068d03f295234bd3adef94dfd23e78c75add73bc1d11181d4d8da8d6d7c3', '[\"*\"]', '2026-04-27 02:36:35', NULL, '2026-04-27 02:36:35', '2026-04-27 02:36:35'),
(14, 'App\\Models\\User', 1, 'api-token', '60104bae2c61108be84e665ed639d7d382a53e32397b88241f311f61a2b49197', '[\"*\"]', '2026-04-27 02:37:29', NULL, '2026-04-27 02:37:29', '2026-04-27 02:37:29'),
(15, 'App\\Models\\User', 2, 'api-token', '92eee5792c5aab20cba1a5783ab56b3a4f86392dfecdbe4caf32a963655f87fc', '[\"*\"]', '2026-04-27 02:51:24', NULL, '2026-04-27 02:38:54', '2026-04-27 02:51:24'),
(16, 'App\\Models\\User', 1, 'api-token', 'eb0580a90161c28f7c464ce21fb85c00b32bc5f23ce38daa627fcdc6d65e877e', '[\"*\"]', '2026-04-27 02:52:54', NULL, '2026-04-27 02:52:40', '2026-04-27 02:52:54'),
(17, 'App\\Models\\User', 2, 'api-token', '8d33436075cb15be8638047958d7cf0ab32b53cd714474d8d93e99dfe8452751', '[\"*\"]', '2026-04-27 02:55:00', NULL, '2026-04-27 02:53:05', '2026-04-27 02:55:00'),
(18, 'App\\Models\\User', 2, 'api-token', 'd4cbe256a467245fe522d5c1ec6a6339e03cf51ce1b677dcf48daad9985873d5', '[\"*\"]', '2026-04-27 05:28:12', NULL, '2026-04-27 02:55:16', '2026-04-27 05:28:12'),
(19, 'App\\Models\\User', 1, 'api-token', '7731116941cbce10961a7906314c6834fc0941db02119b097d6540c25374cbbf', '[\"*\"]', '2026-04-27 09:31:31', NULL, '2026-04-27 02:58:43', '2026-04-27 09:31:31'),
(20, 'App\\Models\\User', 2, 'api-token', 'b96e757af6975f85f9c9941482ce46377cd319e2fde0c9db6ba7e1166475bbe4', '[\"*\"]', '2026-04-27 05:44:16', NULL, '2026-04-27 05:43:36', '2026-04-27 05:44:16'),
(21, 'App\\Models\\User', 2, 'api-token', 'f9bcdfd16d3bf689222d327093a115141a44a7a81d24138884cfd74f33749202', '[\"*\"]', NULL, NULL, '2026-04-27 05:44:43', '2026-04-27 05:44:43'),
(22, 'App\\Models\\User', 2, 'api-token', '18919fc58fa6588e65fdadfc11411b9bcf447a339871ae1d978a5a1dc2cc2676', '[\"*\"]', NULL, NULL, '2026-04-27 05:45:55', '2026-04-27 05:45:55'),
(23, 'App\\Models\\User', 2, 'api-token', 'a5bebfa16fad1bb7b7cd3a6a6e5e3ed9feb85e9e6b297e66ce85b86fa2e47bad', '[\"*\"]', NULL, NULL, '2026-04-27 05:46:51', '2026-04-27 05:46:51'),
(24, 'App\\Models\\User', 2, 'api-token', 'aaa9e76c54c57f69c16ccba66b1de0b3c1e1511f50e4f6adbbfb689526721963', '[\"*\"]', NULL, NULL, '2026-04-27 05:47:14', '2026-04-27 05:47:14'),
(25, 'App\\Models\\User', 2, 'api-token', '5bb51411f03029ba922060d947ec93851a4e860feca4ee9ca35c2dec184177c7', '[\"*\"]', NULL, NULL, '2026-04-27 05:47:19', '2026-04-27 05:47:19'),
(26, 'App\\Models\\User', 2, 'api-token', '52b82b8c9b62c83af4a33439b7a23a54fa5a2732c379ca893affe261d517195f', '[\"*\"]', NULL, NULL, '2026-04-27 05:47:32', '2026-04-27 05:47:32'),
(27, 'App\\Models\\User', 2, 'api-token', '69677a0e899286569896546826f27938096b85c4e3fa7fb0bc2086eebce4f56c', '[\"*\"]', NULL, NULL, '2026-04-27 05:47:36', '2026-04-27 05:47:36'),
(28, 'App\\Models\\User', 2, 'api-token', '445e4d254b0b393a8c6bb910337be5e88414c61689ce7ceddaee9d5ddbd6c7b4', '[\"*\"]', NULL, NULL, '2026-04-27 05:48:28', '2026-04-27 05:48:28'),
(29, 'App\\Models\\User', 2, 'api-token', '7394ba63a550b07d3675ca07ac8dfeddeba342efb97f104de570cd917e7475ae', '[\"*\"]', '2026-04-27 06:04:25', NULL, '2026-04-27 05:48:42', '2026-04-27 06:04:25'),
(30, 'App\\Models\\User', 2, 'api-token', '1c189eb0ae0a98e06415f5226484e12409192215d6c4cd594af46caf861639a1', '[\"*\"]', '2026-04-27 06:05:46', NULL, '2026-04-27 06:04:39', '2026-04-27 06:05:46'),
(31, 'App\\Models\\User', 2, 'api-token', '3328959da4c0ff37b8431fc6b113de3204f3e2303ca791fe899f3e5ee48d0cde', '[\"*\"]', '2026-04-27 07:01:39', NULL, '2026-04-27 06:05:58', '2026-04-27 07:01:39'),
(32, 'App\\Models\\User', 2, 'api-token', 'fd2b120200eaea0b5186df6a4cdc89928afd5bf4bf03a4379462042a0a1746dc', '[\"*\"]', '2026-04-27 10:39:19', NULL, '2026-04-27 07:02:41', '2026-04-27 10:39:19'),
(33, 'App\\Models\\User', 2, 'api-token', 'f78f48d85ee1d4a8c8a21c9bf17d0a44d9beba3bb7f3caca561b5d533f5b82b8', '[\"*\"]', NULL, NULL, '2026-04-28 01:12:56', '2026-04-28 01:12:56'),
(34, 'App\\Models\\User', 2, 'api-token', 'd116b894af2792536d604770d1fb35bd0c6d47b40f58bb39ed09e19ff9d91fc1', '[\"*\"]', NULL, NULL, '2026-04-28 01:12:56', '2026-04-28 01:12:56'),
(35, 'App\\Models\\User', 2, 'api-token', '8dc01c4554a22798d5b531de62524ec3b40fce8981bb8077a40d4af627d7eec0', '[\"*\"]', '2026-04-28 01:12:57', NULL, '2026-04-28 01:12:56', '2026-04-28 01:12:57'),
(36, 'App\\Models\\User', 2, 'api-token', '0d3f41816807d984a066b72a4bb5f425cf0db9a6c95823321f945565d8c89191', '[\"*\"]', NULL, NULL, '2026-04-28 01:12:56', '2026-04-28 01:12:56'),
(37, 'App\\Models\\User', 2, 'api-token', 'a6543186cbfa0e6db8fcce76f373eb8b4dd74dfabca86ab806be0fedb2b50e54', '[\"*\"]', '2026-04-28 02:26:30', NULL, '2026-04-28 01:13:52', '2026-04-28 02:26:30'),
(38, 'App\\Models\\User', 2, 'api-token', '8ba6a14952e87c049155ec56323a226d8d8497345fafde2b5315699abdfe2bad', '[\"*\"]', '2026-04-28 02:26:57', NULL, '2026-04-28 02:26:57', '2026-04-28 02:26:57'),
(39, 'App\\Models\\User', 2, 'api-token', '9354dd602bf9e7ac1415d8e1b4dc3566aad2a11de102e3c88b7e5f032be72346', '[\"*\"]', '2026-04-28 02:35:26', NULL, '2026-04-28 02:29:29', '2026-04-28 02:35:26'),
(40, 'App\\Models\\User', 1, 'api-token', 'd79b334529c9ea1efa7dcbe8b978878954fa3fd4867e0641928fef790e958f24', '[\"*\"]', '2026-04-28 02:40:19', NULL, '2026-04-28 02:35:46', '2026-04-28 02:40:19'),
(41, 'App\\Models\\User', 1, 'api-token', '5ff657ecc8db0a725d4deb87af84e498c2d6c4d088e4b1e518560ede17f37b96', '[\"*\"]', '2026-04-28 02:40:42', NULL, '2026-04-28 02:40:40', '2026-04-28 02:40:42'),
(42, 'App\\Models\\User', 1, 'api-token', '0729f58505c9905907aba6a5d072886e0e6741b981a7c9b1c9836527a1e50fc7', '[\"*\"]', '2026-04-28 05:51:35', NULL, '2026-04-28 02:42:03', '2026-04-28 05:51:35'),
(43, 'App\\Models\\User', 2, 'api-token', 'b8d96c092ddaa56e9650b4731d9957f0e5d32810b9db279b44a5a0be1283da45', '[\"*\"]', '2026-04-28 02:49:53', NULL, '2026-04-28 02:46:32', '2026-04-28 02:49:53'),
(44, 'App\\Models\\User', 2, 'api-token', '1e4d6ab4700ee8d81169b40ffd940d003b9bdd30b7669a6aab26653c92789329', '[\"*\"]', '2026-04-28 02:51:26', NULL, '2026-04-28 02:50:08', '2026-04-28 02:51:26'),
(45, 'App\\Models\\User', 2, 'api-token', '49815a6ccffa9941361e90d0d9ea647f826314b5d998f516e6c85405cd50830f', '[\"*\"]', '2026-04-28 06:34:44', NULL, '2026-04-28 02:51:40', '2026-04-28 06:34:44'),
(46, 'App\\Models\\User', 3, 'api-token', 'dbae3382ed24b8662f3aa9be5f21cfdd88dda4d5e2e14b0e4fb65afa7e820264', '[\"*\"]', '2026-04-28 05:51:20', NULL, '2026-04-28 04:43:18', '2026-04-28 05:51:20'),
(47, 'App\\Models\\User', 1, 'api-token', '4010d77bc9575289c5f8060cd1798dd5d21a47e1dadd4b74e3e932ee08ec76b1', '[\"*\"]', '2026-04-28 06:35:04', NULL, '2026-04-28 05:52:13', '2026-04-28 06:35:04'),
(48, 'App\\Models\\User', 4, 'api-token', '0a461374b992458b55bc6bcd4cba33e4ca8f47151d733de5ec5a05fd3e6af26e', '[\"*\"]', '2026-04-28 07:52:40', NULL, '2026-04-28 06:27:14', '2026-04-28 07:52:40'),
(49, 'App\\Models\\User', 1, 'api-token', '7bf6b99d69a3266e20d7257746104dc57fecc2b7771688ffeaff19afa8994276', '[\"*\"]', '2026-04-28 06:56:02', NULL, '2026-04-28 06:35:35', '2026-04-28 06:56:02'),
(50, 'App\\Models\\User', 1, 'api-token', 'c9b338f119176d47d31b57f738fe72f427272ad5717f0a54978b716240ef107c', '[\"*\"]', '2026-04-28 07:52:57', NULL, '2026-04-28 06:56:36', '2026-04-28 07:52:57'),
(51, 'App\\Models\\User', 1, 'api-token', '3ddcc754bcb6a41293515bec29a3ff2726be6c63290a3795fbaa2e4fce295a3b', '[\"*\"]', '2026-04-28 08:00:09', NULL, '2026-04-28 07:56:18', '2026-04-28 08:00:09'),
(52, 'App\\Models\\User', 1, 'api-token', 'c734f78f259581db70ec48f6de2b33f5768214ee074eb4bb0cf8006dc3631f01', '[\"*\"]', '2026-04-28 08:08:41', NULL, '2026-04-28 08:08:38', '2026-04-28 08:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_answer` enum('a','b','c','d') NOT NULL,
  `explanation` text DEFAULT NULL,
  `marks` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `csv_upload` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `category_id`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `explanation`, `marks`, `image`, `csv_upload`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is the capital of India?', 1, 'Mumbai', 'Delhi', 'Chennai', 'Kolkata', 'b', 'Delhi is the capital of India.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(2, 'Which planet is known as the Red Planet?', 1, 'Earth', 'Mars', 'Venus', 'Jupiter', 'b', 'Mars appears red due to iron oxide.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(3, 'Largest ocean in the world?', 1, 'Atlantic', 'Indian', 'Pacific', 'Arctic', 'c', 'Pacific Ocean is the largest.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(4, 'Currency of Japan?', 1, 'Won', 'Dollar', 'Yen', 'Euro', 'c', 'Japan uses Yen.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(5, 'Fastest land animal?', 1, 'Lion', 'Tiger', 'Cheetah', 'Leopard', 'c', 'Cheetah is fastest.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(6, 'How many continents?', 1, '5', '6', '7', '8', 'c', 'There are 7 continents.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(7, 'National animal of India?', 1, 'Lion', 'Elephant', 'Tiger', 'Leopard', 'c', 'Tiger is national animal.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(8, 'Which gas do plants absorb?', 1, 'Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen', 'b', 'Plants absorb CO2.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(9, 'Smallest country?', 1, 'Monaco', 'Vatican City', 'Malta', 'Bhutan', 'b', 'Vatican City is smallest.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(10, 'Primary source of energy?', 1, 'Moon', 'Sun', 'Wind', 'Water', 'b', 'Sun is main energy source.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(11, 'H2O is chemical formula for?', 2, 'Oxygen', 'Hydrogen', 'Water', 'Salt', 'c', 'H2O is water.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(12, 'Speed of light?', 2, '3x10^8 m/s', '3x10^6 m/s', '3x10^5 m/s', '3x10^7 m/s', 'a', 'Speed of light is 3x10^8 m/s.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(13, 'Human heart chambers?', 2, '2', '3', '4', '5', 'c', 'Heart has 4 chambers.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(14, 'Gas for respiration?', 2, 'CO2', 'Oxygen', 'Nitrogen', 'Helium', 'b', 'Humans breathe oxygen.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(15, 'DNA stands for?', 2, 'Deoxyribo Nucleic Acid', 'Dynamic Network Acid', 'Digital Network Access', 'None', 'a', 'Correct full form.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(16, 'Boiling point of water?', 2, '90°C', '100°C', '110°C', '80°C', 'b', 'Boils at 100°C.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(17, 'Force unit?', 2, 'Joule', 'Newton', 'Watt', 'Pascal', 'b', 'Force measured in Newton.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(18, 'Earth revolves around?', 2, 'Moon', 'Mars', 'Sun', 'Venus', 'c', 'Earth orbits Sun.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(19, 'Photosynthesis occurs in?', 2, 'Roots', 'Leaves', 'Stem', 'Flower', 'b', 'Leaves perform photosynthesis.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(20, 'pH of pure water?', 2, '5', '6', '7', '8', 'c', 'Neutral pH is 7.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(21, 'Who was first President of India?', 3, 'Nehru', 'Rajendra Prasad', 'Gandhi', 'Patel', 'b', 'Rajendra Prasad was first President.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(22, 'Year of Independence India?', 3, '1945', '1946', '1947', '1948', 'c', 'India got independence in 1947.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(23, 'Who built Taj Mahal?', 3, 'Akbar', 'Shah Jahan', 'Babur', 'Aurangzeb', 'b', 'Built by Shah Jahan.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(24, 'World War II ended in?', 3, '1943', '1944', '1945', '1946', 'c', 'Ended in 1945.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(25, 'First Mughal emperor?', 3, 'Akbar', 'Babur', 'Humayun', 'Jahangir', 'b', 'Babur founded Mughal empire.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(26, 'Who discovered America?', 3, 'Columbus', 'Cook', 'Magellan', 'Marco Polo', 'a', 'Columbus discovered America.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(27, 'Ashoka dynasty?', 3, 'Maurya', 'Gupta', 'Chola', 'Pandya', 'a', 'Ashoka was Mauryan king.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(28, 'French Revolution year?', 3, '1789', '1776', '1800', '1812', 'a', 'Started in 1789.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(29, 'Who was Hitler?', 3, 'German Leader', 'Italian Leader', 'French Leader', 'Russian Leader', 'a', 'Hitler led Germany.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(30, 'Cold War countries?', 3, 'USA-USSR', 'India-China', 'UK-France', 'Germany-Italy', 'a', 'Cold war between USA & USSR.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(31, 'Cricket team players?', 4, '10', '11', '12', '9', 'b', '11 players in team.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(32, 'Olympics held every?', 4, '2 years', '3 years', '4 years', '5 years', 'c', 'Every 4 years.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(33, 'Football World Cup?', 4, 'FIFA', 'ICC', 'NBA', 'ATP', 'a', 'Organized by FIFA.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(34, 'Tennis court?', 4, 'Grass', 'Clay', 'Hard', 'All', 'd', 'Played on all surfaces.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(35, 'National sport of India?', 4, 'Cricket', 'Hockey', 'Football', 'Kabaddi', 'b', 'Hockey is traditionally considered.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(36, 'Basketball players/team?', 4, '5', '6', '7', '8', 'a', '5 players per team.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(37, 'IPL sport?', 4, 'Football', 'Cricket', 'Hockey', 'Tennis', 'b', 'IPL is cricket league.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(38, 'Badminton uses?', 4, 'Ball', 'Shuttlecock', 'Disc', 'Bat', 'b', 'Uses shuttlecock.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(39, 'Chess origin?', 4, 'India', 'China', 'USA', 'Russia', 'a', 'Originated in India.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(40, 'Marathon distance?', 4, '42 km', '40 km', '45 km', '50 km', 'a', 'Approx 42 km.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(41, 'CPU stands for?', 5, 'Central Process Unit', 'Central Processing Unit', 'Computer Personal Unit', 'Control Unit', 'b', 'Correct expansion.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(42, 'Brain of computer?', 5, 'RAM', 'CPU', 'Hard disk', 'GPU', 'b', 'CPU is brain.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(43, 'HTML used for?', 5, 'Programming', 'Styling', 'Structure', 'Database', 'c', 'HTML structures web.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(44, 'Java is?', 5, 'OS', 'Language', 'Browser', 'Hardware', 'b', 'Java is programming language.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(45, 'RAM is?', 5, 'Permanent', 'Temporary', 'External', 'None', 'b', 'RAM is volatile.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(46, 'Internet founder?', 5, 'Vint Cerf', 'Bill Gates', 'Steve Jobs', 'Elon Musk', 'a', 'Vint Cerf co-invented.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(47, 'WWW stands for?', 5, 'World Wide Web', 'World Web Wide', 'Wide Web World', 'None', 'a', 'Correct expansion.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(48, 'Operating system?', 5, 'Windows', 'Word', 'Excel', 'PowerPoint', 'a', 'Windows is OS.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(49, 'Cloud storage?', 5, 'Local disk', 'Internet storage', 'RAM', 'CPU', 'b', 'Stored online.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(50, 'AI stands for?', 5, 'Artificial Intelligence', 'Auto Intelligence', 'Advanced Interface', 'None', 'a', 'Correct term.', 1, '', '', 1, '2026-04-27 07:51:15', '2026-04-27 07:51:15'),
(51, 'Capital of France?', 6, 'Berlin', 'Madrid', 'Paris', 'Rome', 'c', 'Paris is capital of France.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(52, 'Largest desert?', 6, 'Sahara', 'Arctic', 'Gobi', 'Kalahari', 'a', 'Sahara is largest hot desert.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(53, 'Longest river?', 6, 'Amazon', 'Nile', 'Yangtze', 'Mississippi', 'b', 'Nile is longest.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(54, 'Mount Everest location?', 6, 'India', 'Nepal', 'China', 'Bhutan', 'b', 'Everest lies in Nepal.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(55, 'Smallest continent?', 6, 'Europe', 'Australia', 'Antarctica', 'South America', 'b', 'Australia is smallest.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(56, 'Ocean between Africa & Australia?', 6, 'Atlantic', 'Pacific', 'Indian', 'Arctic', 'c', 'Indian Ocean.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(57, 'Largest country?', 6, 'USA', 'China', 'Russia', 'India', 'c', 'Russia is largest.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(58, 'Currency of UK?', 6, 'Euro', 'Dollar', 'Pound', 'Yen', 'c', 'UK uses Pound.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(59, 'Continent with most countries?', 6, 'Asia', 'Europe', 'Africa', 'South America', 'c', 'Africa has most countries.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(60, 'Which is island nation?', 6, 'India', 'Japan', 'China', 'Nepal', 'b', 'Japan is island nation.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(61, '2 + 2 = ?', 7, '3', '4', '5', '6', 'b', '2+2=4.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(62, 'Square root of 16?', 7, '2', '3', '4', '5', 'c', '√16 = 4.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(63, '10 * 5 = ?', 7, '40', '50', '60', '30', 'b', '10×5=50.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(64, '100 / 10 = ?', 7, '5', '10', '20', '15', 'b', '100/10=10.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(65, '7 + 8 = ?', 7, '14', '15', '16', '13', 'b', '7+8=15.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(66, '12 - 4 = ?', 7, '6', '7', '8', '9', 'c', '12-4=8.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(67, '5^2 = ?', 7, '10', '20', '25', '30', 'c', '5 squared is 25.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(68, '9 * 9 = ?', 7, '72', '81', '90', '99', 'b', '9×9=81.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(69, '20% of 100?', 7, '10', '20', '30', '40', 'b', '20% = 20.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(70, '15 + 5 = ?', 7, '20', '25', '30', '15', 'a', '15+5=20.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(71, 'Choose correct: ___ apple', 8, 'A', 'An', 'The', 'No article', 'b', 'An is correct.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(72, 'Past tense of go?', 8, 'Goed', 'Went', 'Gone', 'Going', 'b', 'Past is went.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(73, 'Plural of child?', 8, 'Childs', 'Children', 'Childes', 'Childrens', 'b', 'Children is correct.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(74, 'He ___ playing.', 8, 'is', 'are', 'am', 'be', 'a', 'He is correct.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(75, 'Synonym of fast?', 8, 'Slow', 'Quick', 'Late', 'Stop', 'b', 'Quick means fast.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(76, 'Antonym of big?', 8, 'Large', 'Huge', 'Small', 'Wide', 'c', 'Small is opposite.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(77, 'She ___ a book.', 8, 'read', 'reads', 'reading', 'readed', 'b', 'She reads.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(78, 'Correct spelling?', 8, 'Recieve', 'Receive', 'Receeve', 'Receve', 'b', 'Receive is correct.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(79, 'Verb in sentence?', 8, 'Run', 'Blue', 'Quick', 'Tall', 'a', 'Run is verb.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(80, 'Noun example?', 8, 'Run', 'Happy', 'Dog', 'Quickly', 'c', 'Dog is noun.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(81, 'Who directed Titanic?', 9, 'Spielberg', 'Cameron', 'Nolan', 'Scott', 'b', 'James Cameron directed.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(82, 'Lead actor in Avatar?', 9, 'DiCaprio', 'Worthington', 'Cruise', 'Pitt', 'b', 'Sam Worthington starred.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(83, 'Oscar award is for?', 9, 'Music', 'Movies', 'Sports', 'Science', 'b', 'Oscars are film awards.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(84, 'Bollywood based in?', 9, 'Delhi', 'Mumbai', 'Chennai', 'Kolkata', 'b', 'Mumbai is hub.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(85, 'Harry Potter actor?', 9, 'Radcliffe', 'Watson', 'Grint', 'All', 'd', 'All acted in series.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(86, 'Marvel hero Iron Man?', 9, 'Evans', 'Downey Jr', 'Hemsworth', 'Holland', 'b', 'RDJ played Iron Man.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(87, 'Frozen is?', 9, 'Action', 'Animation', 'Drama', 'Horror', 'b', 'Animated film.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(88, 'Jurassic Park theme?', 9, 'Space', 'Dinosaurs', 'War', 'Fantasy', 'b', 'Dinosaur film.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(89, 'Fast & Furious genre?', 9, 'Romance', 'Action', 'Comedy', 'Drama', 'b', 'Action movie.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(90, 'Inception director?', 9, 'Nolan', 'Scott', 'Bay', 'Lucas', 'a', 'Christopher Nolan.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(91, 'Singer of Thriller?', 10, 'Prince', 'MJ', 'Elvis', 'Drake', 'd', 'Michael Jackson.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-28 02:38:16'),
(92, 'Instrument with keys?', 10, 'Guitar', 'Piano', 'Drums', 'Violin', 'b', 'Piano has keys.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(93, 'Indian classical music?', 10, 'Rock', 'Pop', 'Carnatic', 'Jazz', 'c', 'Carnatic is classical.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(94, 'Tempo means?', 10, 'Pitch', 'Speed', 'Volume', 'Tone', 'b', 'Tempo is speed.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(95, 'Guitar strings?', 10, '4', '5', '6', '7', 'c', 'Standard is 6.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(96, 'Beethoven was?', 10, 'Singer', 'Composer', 'Actor', 'Painter', 'b', 'Famous composer.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(97, 'Music symbol #?', 10, 'Flat', 'Sharp', 'Note', 'Clef', 'b', 'Sharp symbol.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(98, 'Pop music example?', 10, 'Rock', 'Jazz', 'Pop', 'Classical', 'c', 'Pop genre.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(99, 'Drum is?', 10, 'String', 'Percussion', 'Wind', 'Keyboard', 'b', 'Drum is percussion.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-27 07:56:04'),
(100, 'Singer means?', 10, 'Painter', 'Performer', 'Dancer', 'Writer', 'd', 'Singer performs songs.', 1, '', '', 1, '2026-04-27 07:56:04', '2026-04-28 02:38:27'),
(101, 'fgfd', 1, 'gfdg', 'gdfg', 'gdfg', 'gdf', 'a', 'gfdgfdg', 1, NULL, NULL, 1, '2026-04-28 05:13:52', '2026-04-28 05:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `time_limit` int(11) NOT NULL DEFAULT 10,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('easy','medium','difficult') NOT NULL DEFAULT 'easy',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `name`, `time_limit`, `category_id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Quiz 1', 5, 1, 'easy', 1, '2026-04-27 02:31:58', '2026-04-27 02:31:58'),
(2, 'Quiz 2', 5, 1, 'easy', 1, '2026-04-27 02:31:58', '2026-04-27 02:31:58'),
(24, 'Quiz 23', 5, 1, 'easy', 1, '2026-04-27 02:31:58', '2026-04-27 02:31:58'),
(25, 'Test', 10, 2, 'easy', 1, '2026-04-28 04:34:09', '2026-04-28 04:34:09'),
(26, 'Test 152', 10, 3, 'easy', 1, '2026-04-28 04:35:14', '2026-04-28 05:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `current_question` int(11) NOT NULL DEFAULT 0,
  `time_left` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `answers` longtext DEFAULT NULL,
  `status` enum('running','paused','completed') NOT NULL DEFAULT 'running',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `user_id`, `quiz_id`, `current_question`, `time_left`, `score`, `answers`, `status`, `created_at`, `updated_at`) VALUES
(32, 2, 2, 10, 280, 7, '{\"1\":\"b\",\"2\":\"b\",\"3\":\"b\",\"4\":\"b\",\"5\":\"c\",\"6\":\"c\",\"7\":\"b\",\"8\":\"b\",\"9\":\"b\",\"10\":\"b\"}', 'completed', '2026-04-28 03:47:49', '2026-04-28 03:48:14'),
(34, 2, 1, 10, 293, 5, '{\"1\":\"b\",\"2\":\"b\",\"3\":\"b\",\"4\":\"b\",\"5\":\"b\",\"6\":\"d\",\"7\":\"b\",\"8\":\"b\",\"9\":\"b\",\"10\":\"b\"}', 'completed', '2026-04-28 04:22:46', '2026-04-28 04:25:44'),
(35, 2, 24, 10, 200, 5, '{\"1\":\"a\",\"2\":\"b\",\"3\":\"b\",\"4\":\"b\",\"5\":\"a\",\"6\":\"c\",\"7\":\"c\",\"8\":\"a\",\"9\":\"b\",\"10\":\"b\"}', 'completed', '2026-04-28 04:30:13', '2026-04-28 04:32:21'),
(36, 3, 1, 10, 250, 4, '{\"1\":\"a\",\"2\":null,\"3\":\"b\",\"4\":\"b\",\"5\":\"b\",\"6\":\"c\",\"7\":null,\"8\":\"b\",\"9\":\"b\",\"10\":\"b\"}', 'completed', '2026-04-28 04:47:08', '2026-04-28 04:47:21'),
(37, 3, 2, 10, 200, 5, '{\"1\":\"a\",\"2\":\"b\",\"3\":\"b\",\"4\":\"b\",\"5\":\"b\",\"6\":\"c\",\"7\":\"b\",\"8\":\"b\",\"9\":\"b\",\"10\":\"b\"}', 'completed', '2026-04-28 04:51:33', '2026-04-28 04:51:49'),
(38, 2, 25, 20, 200, 5, '{\"11\":\"b\",\"12\":\"b\",\"13\":\"d\",\"14\":\"b\",\"15\":\"a\",\"16\":\"c\",\"17\":\"b\",\"18\":\"b\",\"19\":\"b\",\"20\":\"c\"}', 'completed', '2026-04-28 05:42:59', '2026-04-28 05:43:48'),
(39, 2, 26, 30, 320, 5, '{\"21\":\"a\",\"22\":\"c\",\"23\":\"c\",\"24\":\"d\",\"25\":\"b\",\"26\":\"a\",\"27\":\"b\",\"28\":\"b\",\"29\":\"a\",\"30\":\"a\"}', 'completed', '2026-04-28 05:53:42', '2026-04-28 05:58:10'),
(40, 4, 26, 30, 589, 4, '{\"21\":\"b\",\"22\":\"b\",\"23\":\"b\",\"24\":\"b\",\"25\":\"b\",\"26\":\"b\",\"27\":\"b\",\"28\":\"b\",\"29\":\"a\",\"30\":\"b\"}', 'completed', '2026-04-28 06:27:25', '2026-04-28 06:27:37'),
(41, 4, 25, 4, 589, 0, '{\"11\":\"b\",\"12\":\"b\",\"13\":\"b\",\"14\":\"b\"}', 'paused', '2026-04-28 06:38:37', '2026-04-28 06:39:05');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'John', 'john@mail.com', NULL, '$2y$10$CCREiuuJX4SAC82x6/SMVOKiWsW66/QCQb2pTED8W.DcMaGZ2YHo6', NULL, '2026-04-22 05:03:37', '2026-04-22 05:03:37', 'admin'),
(2, 'John6666', 'john2@mail.com', NULL, '$2y$10$CCREiuuJX4SAC82x6/SMVOKiWsW66/QCQb2pTED8W.DcMaGZ2YHo6', NULL, '2026-04-22 05:03:37', '2026-04-22 05:03:37', 'user'),
(3, 'John222', 'john22@mail.com', NULL, '$2y$10$CCREiuuJX4SAC82x6/SMVOKiWsW66/QCQb2pTED8W.DcMaGZ2YHo6', NULL, '2026-04-22 05:03:37', '2026-04-22 05:03:37', 'user'),
(4, 'Test', 'test@sdsadsad.com', NULL, '$2y$10$iJgidhnEnIoMFHzZSOzhQeDpW7iCKytoEpCq7deyzb.qcKXUBhori', NULL, '2026-04-28 06:26:23', '2026-04-28 06:26:46', 'user');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempts_user_id_foreign` (`user_id`),
  ADD KEY `quiz_attempts_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
