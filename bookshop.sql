-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2022 at 03:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `bookauthorID` int(11) NOT NULL,
  `bookauthorname` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`bookauthorID`, `bookauthorname`, `created_at`, `updated_at`) VALUES
(1, 'Bret Easton Ellis', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(2, 'Miguel de Cervantes', '2022-08-24 08:13:58', '2022-08-24 01:13:58'),
(3, 'George Orwell', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(4, 'Haruki Murakami', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(5, 'Frank Herbert', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(6, 'F. Scott Fitzgerald', '2022-08-23 07:31:03', '2022-08-23 00:31:03'),
(7, 'Harper Lee', '2022-08-24 08:21:02', '2022-08-24 01:21:02'),
(8, 'J. R. R Tolkien', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(9, 'Stephen King', '2022-08-22 14:37:30', '2022-08-22 14:09:45'),
(10, 'Barack Obamaaaa', '2022-08-24 09:36:47', '2022-08-24 02:36:47'),
(11, 'Donald Trump', '2022-08-24 02:37:01', '2022-08-24 02:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `bookcategoryID` varchar(3) NOT NULL,
  `categoryname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`bookcategoryID`, `categoryname`) VALUES
('01', 'Fiction'),
('02', 'Mystery'),
('03', 'Tragedy');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cID` int(11) NOT NULL,
  `cName` varchar(30) NOT NULL,
  `cPassword` varchar(100) NOT NULL,
  `cPhone` int(11) DEFAULT NULL,
  `cAddress` varchar(100) DEFAULT NULL,
  `cEmail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `sID` int(11) NOT NULL,
  `orderdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `bookID` int(11) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `bookcategoryID` varchar(3) NOT NULL,
  `bookimage` varchar(20) DEFAULT NULL,
  `bookprice` int(11) DEFAULT NULL,
  `bookdetail` varchar(500) DEFAULT NULL,
  `bookauthorID` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`bookID`, `bookname`, `bookcategoryID`, `bookimage`, `bookprice`, `bookdetail`, `bookauthorID`, `updated_at`, `created_at`) VALUES
(1, 'American Psycho', '02', '1.png', 15, 'American Psycho is a 1991 novel by American author Bret Easton Ellis. Set in 1980s New York, the novel follows the life of a wealthy young stockbroker, the novel\'s narrator, Patrick Bateman.', 1, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(2, 'Don Quixote', '01', '2.png', 10, 'The plot revolves around the adventures of a member of the lowest nobility, an hidalgo from La Mancha named Alonso Quijano, who reads so many chivalric romances that he either loses or pretends to have lost his mind in order to become a knight-errant (caballero errante) to revive chivalry and serve his nation.', 2, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(3, '1984', '01', '3.png', 8, '1984 is a dystopian novella by George Orwell published in 1949, which follows the life of Winston Smith, a low ranking member of \'the Party\', who is frustrated by the omnipresent eyes of the party, and its ominous ruler Big Brother.', 3, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(4, 'Kafka On The Shore', '01', '4.png', 14, 'Kafka on the Shore is a 2002 novel by Japanese author Haruki Murakami.', 4, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(5, 'Dune', '01', '5.png', 14, 'Dune is a 1965 epic science fiction novel by American author Frank Herbert, originally published as two separate serials in Analog magazine.', 5, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(6, 'The Great Gatsby', '03', '6.png', 15, 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald.', 6, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(7, 'To Kill a Mockingbird', '01', '7.png', 12, 'To Kill a Mockingbird is a novel by the American author Harper Lee.', 7, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(8, 'The Hobbit', '01', '8.png', 18, 'The Hobbit, or There and Back Again is a children\'s fantasy novel by English author J. R. R. Tolkien.', 8, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(9, 'The Lord of the Rings', '01', '9.png', 20, 'The Lord of the Rings is an epic high-fantasy novel by English author and scholar J. R. R. Tolkien.', 8, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(10, 'The Shining', '01', '10.png', 15, 'Of all his masterpieces vying for the top spot, The Shining has come out on top as King\'s best work.', 9, '2022-08-24 08:01:47', '2022-08-24 08:01:02'),
(11, 'asfdsafdsa', '01', '9.png', 69, 'sadfsadfsdf', 8, '2022-08-24 08:01:47', '2022-08-24 08:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `saler`
--

CREATE TABLE `saler` (
  `sID` int(11) NOT NULL,
  `sName` varchar(30) NOT NULL,
  `sPhone` int(11) DEFAULT NULL,
  `sAddress` varchar(100) DEFAULT NULL,
  `sEmail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Joker Baby', 'ihatebatman@gmail.com', NULL, '$2y$10$GNZipbO8BliBGln0t9ntLu6O24y.U.KXFk8HsP1mtc623lOI1hA6C', NULL, '2022-08-13 00:38:52', '2022-08-22 00:46:54', 0),
(3, 'Batman', 'ilovebat@gmail.com', NULL, '$2y$10$3EndJIzLNd2T46ebS1EnIug2W4QOUBGQuvh1dM7r5fIuVdECMZ6Ya', NULL, '2022-08-20 09:25:37', '2022-08-21 01:20:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`bookauthorID`),
  ADD UNIQUE KEY `bookauthorname` (`bookauthorname`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`bookcategoryID`),
  ADD UNIQUE KEY `categoryname` (`categoryname`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cID`);

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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `fk_c` (`cID`),
  ADD KEY `fk_s` (`sID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD KEY `fk_oID` (`orderID`),
  ADD KEY `fk_bID` (`bookID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `fk_cat` (`bookcategoryID`),
  ADD KEY `fk_author` (`bookauthorID`);

--
-- Indexes for table `saler`
--
ALTER TABLE `saler`
  ADD PRIMARY KEY (`sID`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_c` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`),
  ADD CONSTRAINT `fk_s` FOREIGN KEY (`sID`) REFERENCES `saler` (`sID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fk_bID` FOREIGN KEY (`bookID`) REFERENCES `products` (`bookID`),
  ADD CONSTRAINT `fk_oID` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`bookauthorID`) REFERENCES `authors` (`bookauthorID`),
  ADD CONSTRAINT `fk_cat` FOREIGN KEY (`bookcategoryID`) REFERENCES `category` (`bookcategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
