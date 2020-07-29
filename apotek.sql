-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2020 at 01:12 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `distributor_id` int(11) NOT NULL,
  `dname` varchar(100) NOT NULL,
  `sop` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`distributor_id`, `dname`, `sop`) VALUES
(1, 'PT Kalbe', 'img/SOP/09d10c4376f1be7b39294fb99ad6c84fS.png'),
(2, 'PT Indonesia', 'img/SOP/d41d8cd98f00b204e9800998ecf8427eS.png');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `distributor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`drug_id`, `name`, `amount`, `price`, `description`, `distributor_id`) VALUES
(1, 'Paratusin', 106, 10000, 'Obat', 1),
(3, 'Vitacimin', 100, 3500, 'Vitamin', 1),
(4, 'Troches', 150, 1500, 'Obat Sakit Tenggorokan', 2),
(5, 'Salonpas', 55, 10000, 'Obat Pegal', 1),
(6, 'Lafaloz', 50, 5500, 'Obat Pegal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_details` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_details`) VALUES
(1, 'Owner'),
(2, 'Pharmacist'),
(3, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `total_purchase` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cek` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `total_purchase`, `user_id`, `cek`) VALUES
(3, 67500, 2, 1),
(4, 62500, 4, 1),
(5, 115500, 2, 1),
(6, 50500, 2, 1),
(7, 45500, 2, 1),
(8, 135500, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `detail_trans_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `amounts` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`detail_trans_id`, `drug_id`, `amounts`, `trans_id`) VALUES
(11, 4, 5, 3),
(12, 1, 4, 3),
(13, 1, 3, 4),
(14, 3, 5, 4),
(15, 1, 7, 5),
(16, 3, 3, 5),
(17, 1, 3, 6),
(18, 3, 3, 6),
(19, 5, 1, 6),
(20, 6, 2, 7),
(21, 1, 3, 7),
(22, 4, 3, 7),
(23, 1, 9, 8),
(24, 5, 4, 8),
(25, 6, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `nick_name` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `pas_foto` varchar(49) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `nick_name`, `jenis_kelamin`, `email`, `username`, `password`, `pas_foto`, `role_id`) VALUES
(1, 'Muhammad Anjar Harimurti', 'Anjar', 'L', 'acool90@yahoo.co.id', 'args06', '4c9e702429f461fc593f802045454052', 'img/PasFoto/man.png', 1),
(2, 'Raditya Bagaskara', 'Bagas', 'L', 'bagas@gmail.com', 'bgss06', '4c9e702429f461fc593f802045454052', 'img/PasFoto/man.png', 2),
(4, 'Caca Santika', 'Caca', 'P', 'casa@gmail.com', 'casa26', '827ccb0eea8a706c4c34a16891f84e7b', 'img/PasFoto/woman.png', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`distributor_id`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `fk_distributorID` (`distributor_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `fk_userID` (`user_id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`detail_trans_id`),
  ADD KEY `fk_transID` (`trans_id`),
  ADD KEY `fk_drugID` (`drug_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_roleID` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `distributor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `detail_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `fk_distributorID` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `fk_drugID` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  ADD CONSTRAINT `fk_transID` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_roleID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
