-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 11:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `des` varchar(1000) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `cat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `des`, `img`, `date`, `uid`, `cat`) VALUES
(2, 'awdawdsa', '<p>awdawdawd</p>', '16681183241680.jpg', '2022-11-11 05:12:04', 3, 'art'),
(3, 'awdadsd', '<p>ddawdawdawdawd</p>', '1668119139374248062764_1044780696357219_1535500921426331548_n.jpg', '2022-11-11 05:25:39', 6, 'art'),
(4, 'adawdawd', '<p>awdawdawd</p>', '166811947443822021046_à¸¡à¸à¸à¸¹à¸ à¸_à¸¡à¸¿à¸à¸à¸à¹à¸¡à¸.jpg', '2022-11-11 05:31:14', 1, 'art');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `img`) VALUES
(1, 'test', 'test', '$2a$10$li4uhobbDOyBaBhd6.eE..A92m3drT7AmIMLo9HCgOKWDSjT3R5iW', NULL),
(2, 'admin', 'admin', '$2a$10$8GMXLp4y2mA1UOXDxqy7i.5ftr4y5UH.3KsEKogS4Sa.Rf/E4vvHy', NULL),
(3, '123', '123', '$2a$10$gyMQ4XULveaIO.a9bv695.0tgwLEtg9SaAvVmQHMTDZdUtXzEzfLi', NULL),
(4, 'test2', 'test2', '$2a$10$NJS4r9wvJ/QRfDCzcpHsEO2DMEQmu4jy18EEYiRBzef8OYCxV8ME6', NULL),
(5, 'aof', 'aof', '$2a$10$qrENxXzmqLWECbgticqIFe.3VGvgT6HVSSiTdL7y19vmg8Z5Y6ip6', NULL),
(6, 'aon', 'aon', '$2a$10$CSJnJs54VPdHodFNzNFfme26vT4EJ4.F/inzI2cYXHKRn6WT9IiDW', NULL),
(7, 'aon2', 'aon2', '$2a$10$bIrrrfnfAU6rpM7ZHuD6mOOxpqTxs/7NKx11CrruQRA90oGOdmWbW', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_post` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_user_post` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
