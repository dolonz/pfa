-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 05:07 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sync`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `branch` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `username`, `email`, `password`, `branch`, `status`, `description`) VALUES
(3, 'HAJAR ABACHOUCH', 'Abachouch@ewa.com', '123', 'DEV', 'student', ''),
(4, 'OUMAIMA ABOUTALIB', 'Aboutalib@ewa.com', '123', 'DES', 'student', ''),
(5, 'MOSTAPHA ABRAIM', 'Abraim@ewa.com', '123', 'DEV', 'student', ''),
(7, 'TACHFINE AKOUNAD', 'Akounad@ewa.com', '123', 'DEV', 'student', ''),
(8, 'KHALID AMGOUNE', 'Amgoune@ewa.com', '123', 'DEV', 'student', ''),
(10, 'MOHAMED AMLOU', 'Amlou@ewa.com', '123', 'DEV', 'student', ''),
(14, 'MAROUANE BEN BRAHIM', 'BenBrahim@ewa.com', '123', 'DEV', 'student', ''),
(15, 'YASSINE BENSLIM', 'Benslim@ewa.com', '123', 'DES', 'student', '.'),
(16, 'NOUREDDINE BENTALEB', 'Bentaleb@ewa.com', '123', 'DEV', 'student', '.'),
(17, 'AICHA DAOUDI', 'Daoudi@ewa.com', '123', 'DEV', 'student', '.'),
(18, 'MOUSAAB EDDOUNITE', 'Eddounite@ewa.com', '123', 'DEV', 'student', '.'),
(19, 'YASSMINE EL ACHHAB', 'ElAchhab@ewa.com', '123', 'DEV', 'student', '.'),
(20, 'SOUFIANE EL GHAZY', 'ElGhazy@ewa.com', '123', 'DES', 'student', '.'),
(21, 'OUSSAMA ELWAZANI', 'Elwazani@ewa.com', '123', 'DEV', 'student', '.'),
(22, 'ABDELLATIF ENNASER', 'Ennaser@ewa.com', '123', 'DEV', 'student', '.'),
(23, 'EL YOUSSOUFI HAMZA', 'ElYoussfi@ewa.com', '123', 'DEV', 'student', '.'),
(24, 'SALAH EDDINE HOUMADI', 'Houmadi@ewa.com', '123', 'DEV', 'student', '.'),
(25, 'MOHAMED ELMEHDI HYAD', 'Hyad@ewa.com', '123', 'DEV', 'student', '.'),
(26, 'SALMA IGHIJJOU', 'Ighijjou@ewa.com', '123', 'DES', 'student', '.'),
(27, 'ABDERRAHMAN IHIHI', 'Ihihi@ewa.com', '123', 'DEV', 'student', '.'),
(28, 'MOUHAMED AMINE ISSOU', 'Isouktane@ewa.com', '123', 'DEV', 'student', '.'),
(29, 'AMINE JOUHA', 'Jouha@ewa.com', '123', 'DEV', 'student', '.'),
(30, 'MOUHAMED AMINE KHALI', 'Khalis@ewa.com', '123', 'DEV', 'student', '.'),
(31, 'HAMZA KHIAR', 'Khiar@ewa.com', '123', 'DEV', 'student', '.'),
(32, 'YASSER LAHBOUB', 'Lahboub@ewa.com', '123', 'DES', 'student', '.'),
(33, 'YOUSRA LAZRAK', 'Lazrak@ewa.com', '123', 'DES', 'student', '.'),
(34, 'ABDELGHANI OUAOURIKT', 'Ouaourikt@ewa.com', '123', 'DEV', 'student', '.'),
(35, 'HOUDA ROUCHDI', 'Rouchdi@ewa.com', '123', 'DEV', 'student', '.'),
(36, 'SALMA SAAIOU', 'Saaiou@ewa.com', '123', 'DEV', 'student', '.'),
(37, 'OMAR TORAIF', 'Toraif@ewa.com', '123', 'DEV', 'student', '.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`) VALUES
(1, 'marouane@ewa.com', 'marouane', '123'),
(5, 'aicha@ewa.com', 'aicha ', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
