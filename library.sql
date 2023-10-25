-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2023 at 12:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `libsys_admin`
--

CREATE TABLE `libsys_admin` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `a_contact` varchar(20) NOT NULL,
  `a_password` varchar(255) NOT NULL,
  `a_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_admin`
--

INSERT INTO `libsys_admin` (`a_id`, `a_name`, `a_contact`, `a_password`, `a_status`) VALUES
(14, 'HUNG', '0939624810', '12bf4611c3912fd1cd8ef5a4f864c8a3', 1),
(15, 'TUNG', '0859757660', '0f043c901ac151f0e881bb1428b7d8af', 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_author`
--

CREATE TABLE `libsys_author` (
  `au_id` int(11) NOT NULL,
  `au_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_author`
--

INSERT INTO `libsys_author` (`au_id`, `au_name`) VALUES
(6, 'Rifujin na Magonote'),
(5, 'Alan Forbes'),
(4, 'Reki Kawahara'),
(3, 'Jack London'),
(2, 'Hector Malot'),
(1, 'Dale Carnegie');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_books`
--

CREATE TABLE `libsys_books` (
  `b_id` int(11) NOT NULL,
  `b_code` varchar(50) NOT NULL,
  `b_name` varchar(50) NOT NULL,
  `b_author` int(11) NOT NULL,
  `b_publishar` int(11) NOT NULL,
  `b_qty` int(11) NOT NULL,
  `b_self` int(11) NOT NULL,
  `b_price` decimal(10,2) NOT NULL,
  `b_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_books`
--

INSERT INTO `libsys_books` (`b_id`, `b_code`, `b_name`, `b_author`, `b_publishar`, `b_qty`, `b_self`, `b_price`, `b_status`) VALUES
(1, 'SAO1', 'SWORD ART ONLINE VOL.1', 4, 1, 4, 1, 50000.00, 1),
(2, 'SAO2', 'SWORD ART ONLINE VOL.2', 4, 1, 5, 1, 50000.00, 1),
(3, 'MST1', 'MUSHOKU TENSEI VOL.1', 6, 1, 4, 2, 250000.00, 1),
(4, 'MST2', 'MUSHOKU TENSEI VOL.2', 6, 1, 4, 2, 250000.00, 1),
(5, 'DNT', 'Đắc nhân tâm', 1, 2, 8, 3, 300000.00, 1),
(6, 'NFA', 'Không gia đình', 3, 2, 7, 5, 40000.00, 1),
(7, 'MST3', 'MUSHOKU TENSEI VOL.3', 6, 1, 4, 2, 15000.00, 1),
(8, 'COW', 'Tiếng gọi nơi hoang dã', 3, 1, 3, 6, 15000.00, 1),
(9, 'JOPHP', 'THE JOY OF PHP: A BEGINNING', 5, 2, 4, 9, 12000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_departments`
--

CREATE TABLE `libsys_departments` (
  `d_id` int(11) NOT NULL,
  `d_code` varchar(100) NOT NULL,
  `d_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_departments`
--

INSERT INTO `libsys_departments` (`d_id`, `d_code`, `d_name`) VALUES
(1, 'PHY', 'Physics'),
(2, 'IT', 'Information Technology'),
(3, 'HEC', 'Health Care'),
(4, 'JAP', 'Japanese');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_issue`
--

CREATE TABLE `libsys_issue` (
  `i_id` int(11) NOT NULL,
  `i_book_code` varchar(11) NOT NULL,
  `i_student_code` int(11) NOT NULL,
  `i_check` int(11) NOT NULL COMMENT 'book_id+student_id',
  `i_date` date NOT NULL,
  `i_e_date` date NOT NULL COMMENT 'End date',
  `i_r_date` date NOT NULL,
  `i_fine` decimal(10,2) NOT NULL,
  `i_status` int(11) NOT NULL COMMENT '0=return,1=issued'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_issue`
--

INSERT INTO `libsys_issue` (`i_id`, `i_book_code`, `i_student_code`, `i_check`, `i_date`, `i_e_date`, `i_r_date`, `i_fine`, `i_status`) VALUES
(104, 'COW', 20010960, 0, '2023-10-24', '2023-11-08', '0000-00-00', 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `libsys_publisher`
--

CREATE TABLE `libsys_publisher` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_publisher`
--

INSERT INTO `libsys_publisher` (`pub_id`, `pub_name`) VALUES
(2, 'NXB trẻ'),
(1, 'NXB Kim Đồng');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_semester`
--

CREATE TABLE `libsys_semester` (
  `sem_id` int(11) NOT NULL,
  `sem_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_semester`
--

INSERT INTO `libsys_semester` (`sem_id`, `sem_name`) VALUES
(1, '1st'),
(2, '2nd'),
(3, '3rd'),
(4, '4th'),
(5, '5th'),
(6, '6th'),
(7, '7th'),
(8, '8th');

-- --------------------------------------------------------

--
-- Table structure for table `libsys_students`
--

CREATE TABLE `libsys_students` (
  `s_id` int(11) NOT NULL,
  `s_code` varchar(50) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_dept` int(11) NOT NULL,
  `s_semester` int(11) NOT NULL,
  `s_contact` varchar(50) NOT NULL,
  `s_password` varchar(255) NOT NULL,
  `s_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libsys_students`
--

INSERT INTO `libsys_students` (`s_id`, `s_code`, `s_name`, `s_dept`, `s_semester`, `s_contact`, `s_password`, `s_status`) VALUES
(1, '20010960', 'LE TIEN HUNG', 2, 7, '09399624810', '12bf4611c3912fd1cd8ef5a4f864c8a3', 1),
(2, '20010990', 'NGUYEN THANH TUNG', 2, 7, '00934243423', 'Tung123', 1),
(3, '20010980', 'NGUYEN VAN A', 4, 0, '09876543210', 'c3c2bd601f0ec6a02ed4a4e55cc15b0b', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `libsys_admin`
--
ALTER TABLE `libsys_admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `a_contact` (`a_contact`);

--
-- Indexes for table `libsys_author`
--
ALTER TABLE `libsys_author`
  ADD PRIMARY KEY (`au_id`);

--
-- Indexes for table `libsys_books`
--
ALTER TABLE `libsys_books`
  ADD PRIMARY KEY (`b_id`),
  ADD UNIQUE KEY `b_code` (`b_code`);

--
-- Indexes for table `libsys_departments`
--
ALTER TABLE `libsys_departments`
  ADD PRIMARY KEY (`d_id`),
  ADD UNIQUE KEY `d_code` (`d_code`);

--
-- Indexes for table `libsys_issue`
--
ALTER TABLE `libsys_issue`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `i_check` (`i_check`) USING BTREE;

--
-- Indexes for table `libsys_publisher`
--
ALTER TABLE `libsys_publisher`
  ADD PRIMARY KEY (`pub_id`),
  ADD UNIQUE KEY `pub_name` (`pub_name`);

--
-- Indexes for table `libsys_semester`
--
ALTER TABLE `libsys_semester`
  ADD PRIMARY KEY (`sem_id`),
  ADD UNIQUE KEY `sem_name` (`sem_name`);

--
-- Indexes for table `libsys_students`
--
ALTER TABLE `libsys_students`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_code` (`s_code`),
  ADD UNIQUE KEY `s_contact` (`s_contact`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `libsys_admin`
--
ALTER TABLE `libsys_admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `libsys_author`
--
ALTER TABLE `libsys_author`
  MODIFY `au_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `libsys_books`
--
ALTER TABLE `libsys_books`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `libsys_departments`
--
ALTER TABLE `libsys_departments`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `libsys_issue`
--
ALTER TABLE `libsys_issue`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `libsys_publisher`
--
ALTER TABLE `libsys_publisher`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `libsys_semester`
--
ALTER TABLE `libsys_semester`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `libsys_students`
--
ALTER TABLE `libsys_students`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
