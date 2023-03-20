-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 09:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dating_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `block_users`
--

CREATE TABLE `block_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_blocked_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user1_id` bigint(20) UNSIGNED NOT NULL,
  `user2_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`id`, `user1_id`, `user2_id`, `created_at`, `updated_at`) VALUES
(1, 2, 5, '2023-03-20 13:32:52', '2023-03-20 13:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `dummy`
--

CREATE TABLE `dummy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_info`
--

CREATE TABLE `extra_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bio` text NOT NULL,
  `hobbie1` varchar(255) NOT NULL,
  `hobbie2` varchar(255) NOT NULL,
  `hobbie3` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_info`
--

INSERT INTO `extra_info` (`id`, `user_id`, `bio`, `hobbie1`, `hobbie2`, `hobbie3`, `created_at`, `updated_at`) VALUES
(1, 1, 'I love play video games, workout and hang out with friends. Hit me up if you down to grab a coffee together', 'Fitness', 'Videogames', 'Party', NULL, NULL),
(2, 2, 'I love to read, study and chill with friends. Let\'s hang out together and have matte time and read some books', 'Read', 'Study', 'Sleep', NULL, NULL),
(3, 3, 'Love to hear rock music, study and hang out with friends. I am open to any plan if we have fun', 'Hangout', 'Music', 'Music', NULL, NULL),
(4, 4, 'I love play soccer and listen to music. I am a barista and I bet you you can fall in love with my coffee.', 'Coffee', 'Soccer ', 'Video games', NULL, NULL),
(5, 5, 'I am super energetic, happy and bit crazy, but good crazy. I stress a lot while doing projects but let\'s go get a drink', 'Hang out', 'Study', 'Party', NULL, NULL),
(6, 6, 'I am a mechanical engineering at Cairo. If you are around here, hit me up and get some drinks', 'Get drinks', 'Hang out', 'Chill with friends', NULL, NULL),
(7, 7, 'Hi there! I\'m an adventurous person who loves exploring new places, trying new foods, and meeting new people. In my free time, you\'ll usually find me hiking in the mountains, playing guitar, or curling up with a good book', 'Books', 'Hiking', 'Eat', NULL, NULL),
(8, 8, 'I\'m an adventurous person who loves to explore new places and try new things. I enjoy hiking, camping, and exploring the outdoors, but I also appreciate a quiet night in with a good book or movie.', 'Movies', 'Books', 'Camping', NULL, NULL),
(9, 9, 'I\'m a passionate and creative person who enjoys expressing myself through art and music. I love going to concerts, painting, and trying out new recipes in the kitchen.', 'Music', 'Art', 'Cooking', NULL, NULL),
(10, 10, 'I\'m a driven and ambitious person who is always striving to improve and achieve my goals. I love learning and trying new things, and I\'m looking for someone who shares my drive and determination.', 'Soccer', 'Music', 'Arts', NULL, NULL),
(11, 11, 'I\'m a laid-back and easygoing person who loves to laugh and have a good time. I enjoy spending time with friends and family, trying new restaurants and bars, and exploring the city', 'Adventure', 'Hangout', 'Get drinks', NULL, NULL);

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
-- Table structure for table `favorite_users`
--

CREATE TABLE `favorite_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_favorite_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gender_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `gender_type`, `created_at`, `updated_at`) VALUES
(1, 'Male', NULL, NULL),
(2, 'Female', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interested_in_gender`
--

CREATE TABLE `interested_in_gender` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interested_in_relation`
--

CREATE TABLE `interested_in_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `relation_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message_content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `conversation_id`, `user_id`, `message_content`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Hello', '2023-03-20 13:45:01', '2023-03-20 13:45:01'),
(2, 1, 2, 'how are you?', '2023-03-20 13:49:40', '2023-03-20 13:49:40'),
(3, 1, 2, 'how are you?', '2023-03-20 13:50:00', '2023-03-20 13:50:00');

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
(1, '2013_03_18_000000_create_gender_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(28, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(29, '2019_08_19_000000_create_failed_jobs_table', 2),
(30, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(31, '2023_03_18_014126_create_user_photos_table', 2),
(32, '2023_03_18_014357_create_interested_in_gender_table', 3),
(33, '2023_03_18_014538_create_relationship_type_table', 3),
(34, '2023_03_18_014627_create_interested_in_relation_table', 3),
(35, '2023_03_18_170214_create_favorite_users_table', 3),
(36, '2023_03_18_174031_create_block_users_table', 3),
(37, '2023_03_18_223359_create_extra_info_table', 3),
(38, '2023_03_20_122057_create_conversation_table', 3),
(39, '2023_03_20_122109_create_message_table', 3),
(40, '2023_03_20_152629_create_dummy_table', 3);

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

-- --------------------------------------------------------

--
-- Table structure for table `relationship_type`
--

CREATE TABLE `relationship_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `age`, `location`, `gender_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saer', 'El Masri', 'saer@gmail.com', NULL, '$2y$10$QKQ17gRLh6.CQOcrl2zBVOoA5eaD4uyYVqaOstHXhsl/ahV8OrKOa', 23, 'Aley', 1, NULL, '2023-03-18 20:46:59', '2023-03-18 20:46:59'),
(2, 'Ambar', 'Charafeddine', 'ambar@gmail.com', NULL, '$2y$10$hl/19XA0Lwh9IxqWOEHgNOeBnehifkq3dGU8rzjQBTgVmbv9nL7VG', 20, 'Madrid', 2, NULL, '2023-03-18 20:47:42', '2023-03-18 20:47:42'),
(3, 'Imad', 'Charafeddine', 'imad@gmail.com', NULL, '$2y$10$OsLPXr2cH8yEjhhItPKfoecnffIBGLmEfYMVTLqCeAI46l80aqh/a', 24, 'Madrid', 1, NULL, '2023-03-18 20:48:10', '2023-03-18 20:48:10'),
(4, 'Amir', 'El Rayes', 'amir@gmail.com', NULL, '$2y$10$2gaeipYyTxy8SeexPpA8B.2GoacPim6IFHzhVcTFacIscxVEH1Hve', 22, 'Lebanon', 1, NULL, '2023-03-18 21:13:53', '2023-03-18 21:13:53'),
(5, 'Carol', 'El Souki', 'carol@gmail.com', NULL, '$2y$10$c/vFM9dCvrtyTqtPXdYNyuUkxFykFiJkxqByUqn5fpulaZDXIEA/y', 20, 'Aley', 2, NULL, '2023-03-19 07:28:16', '2023-03-19 07:28:16'),
(6, 'Samer', 'El Masri', 'samer@gmail.com', NULL, '$2y$10$EAbWwqu7mV5UG6iVN5mE2.RsbF8P6L/Pn9mR3ezu5pddAyr1T/wny', 32, 'Egypt', 1, NULL, '2023-03-19 07:33:37', '2023-03-19 07:33:37'),
(7, 'Rami', 'Noureddine', 'rami@gmail.com', NULL, '$2y$10$iDJkGFkWe9ZpVAqirTthqu99ZeJCyd5jyJSeUuRUEsvDKqc7CcFbq', 23, 'Miami', 1, NULL, '2023-03-19 07:39:50', '2023-03-19 07:39:50'),
(8, 'Pedro', 'Pascal', 'pedro@gmail.com', NULL, '$2y$10$zw7GrpPSgGrEnztNkKTn1.wyvyFxo/kGSkN.3IbFzvL30SbYtLPhq', 35, 'Texas', 1, NULL, '2023-03-19 07:40:35', '2023-03-19 07:40:35'),
(9, 'Marvan', 'Vargas', 'marvan@gmail.com', NULL, '$2y$10$7.2iCMI/WyUU.hj558jd0.7ujPyeilhbBc1TYqDYzS8RxzfF3YQMW', 23, 'Miami', 1, NULL, '2023-03-19 13:51:40', '2023-03-19 13:51:40'),
(10, 'Leonel', 'Messi', 'messi@gmail.com', NULL, '$2y$10$MnUaCxkFLyEu8Jd62U0oOegCeB2s1pU8FwVL3pPX8hgk8IX6nK2S6', 24, 'Madrid', 1, NULL, '2023-03-19 13:52:35', '2023-03-19 13:52:35'),
(11, 'Osvaldo', 'Gomez', 'osvaldo@gmail.com', NULL, '$2y$10$3zTMwFNWg.zqgsf3dhTq4eH871cMnqmpSjYbuyxEB9hvgXKnfduQa', 25, 'Mexico', 1, NULL, '2023-03-19 18:10:08', '2023-03-19 18:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_photos`
--

CREATE TABLE `user_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `profile_pic` text NOT NULL,
  `profile_add1` text DEFAULT NULL,
  `profile_add2` text DEFAULT NULL,
  `profile_add3` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block_users`
--
ALTER TABLE `block_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_users_user_id_foreign` (`user_id`),
  ADD KEY `block_users_user_blocked_id_foreign` (`user_blocked_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_user1_id_foreign` (`user1_id`),
  ADD KEY `conversation_user2_id_foreign` (`user2_id`);

--
-- Indexes for table `dummy`
--
ALTER TABLE `dummy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_info_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorite_users`
--
ALTER TABLE `favorite_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorite_users_user_id_foreign` (`user_id`),
  ADD KEY `favorite_users_user_favorite_id_foreign` (`user_favorite_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interested_in_gender`
--
ALTER TABLE `interested_in_gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interested_in_gender_gender_id_foreign` (`gender_id`),
  ADD KEY `interested_in_gender_user_id_foreign` (`user_id`);

--
-- Indexes for table `interested_in_relation`
--
ALTER TABLE `interested_in_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interested_in_relation_user_id_foreign` (`user_id`),
  ADD KEY `interested_in_relation_relation_type_id_foreign` (`relation_type_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_user_id_foreign` (`user_id`),
  ADD KEY `message_conversation_id_foreign` (`conversation_id`);

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
-- Indexes for table `relationship_type`
--
ALTER TABLE `relationship_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_gender_id_foreign` (`gender_id`);

--
-- Indexes for table `user_photos`
--
ALTER TABLE `user_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_photos_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block_users`
--
ALTER TABLE `block_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dummy`
--
ALTER TABLE `dummy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_info`
--
ALTER TABLE `extra_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_users`
--
ALTER TABLE `favorite_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `interested_in_gender`
--
ALTER TABLE `interested_in_gender`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interested_in_relation`
--
ALTER TABLE `interested_in_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relationship_type`
--
ALTER TABLE `relationship_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_photos`
--
ALTER TABLE `user_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_users`
--
ALTER TABLE `block_users`
  ADD CONSTRAINT `block_users_user_blocked_id_foreign` FOREIGN KEY (`user_blocked_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `block_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD CONSTRAINT `extra_info_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_users`
--
ALTER TABLE `favorite_users`
  ADD CONSTRAINT `favorite_users_user_favorite_id_foreign` FOREIGN KEY (`user_favorite_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interested_in_gender`
--
ALTER TABLE `interested_in_gender`
  ADD CONSTRAINT `interested_in_gender_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interested_in_gender_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interested_in_relation`
--
ALTER TABLE `interested_in_relation`
  ADD CONSTRAINT `interested_in_relation_relation_type_id_foreign` FOREIGN KEY (`relation_type_id`) REFERENCES `relationship_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interested_in_relation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_photos`
--
ALTER TABLE `user_photos`
  ADD CONSTRAINT `user_photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
