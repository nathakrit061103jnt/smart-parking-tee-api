-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2021 at 06:06 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart-parking`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookings`
--

CREATE TABLE `tbl_bookings` (
  `bk_id` int(11) NOT NULL COMMENT 'เลขที่การจอง',
  `m_id` int(11) NOT NULL COMMENT 'รหัสสมาชิกที่มาจอง',
  `pk_id` int(11) NOT NULL COMMENT 'ไอดีที่จอดรถ',
  `bk_start` date NOT NULL COMMENT 'วัน-เวลาที่มาจอด',
  `bk_end` date NOT NULL COMMENT 'วัน-เวลาที่ออกจากที่จอดรถ',
  `bk_time` int(11) NOT NULL COMMENT 'เวลาที่จอด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parkings`
--

CREATE TABLE `tbl_parkings` (
  `pk_id` int(11) NOT NULL COMMENT 'ไอดีที่จอดรถ',
  `pk_name` varchar(200) NOT NULL COMMENT 'ไอดี ชื่อที่จอดรถ',
  `st_id` int(11) NOT NULL DEFAULT 1 COMMENT 'ไอดีสถานะจอดรถ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_parkings`
--

INSERT INTO `tbl_parkings` (`pk_id`, `pk_name`, `st_id`) VALUES
(1, 'ที่จอดรถจุดที่ 1', 1),
(2, 'ที่จอดรถจุดที่ 2', 2),
(3, 'ที่จอดรถจุดที่ 3', 1),
(4, 'ที่จอดรถจุดที่ 4', 3),
(5, 'ที่จอดรถจุดที่ 5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `st_id` int(11) NOT NULL COMMENT 'ไอดีสถานะ',
  `st_name` varchar(200) NOT NULL COMMENT 'รายละเอียด',
  `st_color` varchar(50) NOT NULL COMMENT 'สี'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`st_id`, `st_name`, `st_color`) VALUES
(1, 'ไม่ว่าง', 'red'),
(2, 'ว่าง', 'green'),
(3, 'ถูกจองเเล้ว', 'orange');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_total_car`
--

CREATE TABLE `tbl_total_car` (
  `tc_id` int(11) NOT NULL,
  `tc_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_total_car`
--

INSERT INTO `tbl_total_car` (`tc_id`, `tc_date`) VALUES
(1, '2020-10-30 04:54:42'),
(2, '2020-10-30 04:55:33'),
(3, '2020-10-30 04:55:36'),
(4, '2020-10-30 06:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `u_userId` varchar(200) NOT NULL COMMENT 'userID ผู้ใช้งาน เก็บเพื่อใช้ส่งข้อความตอบกลับ',
  `u_type` varchar(20) NOT NULL COMMENT 'ประเภทของผู้ใช้งาน',
  `u_regisst_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาการเป็นสมาชิก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`u_userId`, `u_type`, `u_regisst_time`) VALUES
('59986', '', '2020-10-28 03:19:10'),
('Uf8aa8ac888821125a4e18b66a394095a', '', '2020-10-28 03:19:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  ADD PRIMARY KEY (`bk_id`);

--
-- Indexes for table `tbl_parkings`
--
ALTER TABLE `tbl_parkings`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `tbl_total_car`
--
ALTER TABLE `tbl_total_car`
  ADD PRIMARY KEY (`tc_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`u_userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  MODIFY `bk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'เลขที่การจอง';

--
-- AUTO_INCREMENT for table `tbl_parkings`
--
ALTER TABLE `tbl_parkings`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ไอดีที่จอดรถ', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ไอดีสถานะ', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_total_car`
--
ALTER TABLE `tbl_total_car`
  MODIFY `tc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
