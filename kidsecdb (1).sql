-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2025 at 06:39 PM
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
-- Database: `kidsecdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_staff`
--

CREATE TABLE `admin_staff` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `profile_image` longblob NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_staff`
--

INSERT INTO `admin_staff` (`id`, `fullname`, `contact_number`, `email`, `address`, `role`, `profile_image`, `password`) VALUES
(1, 'Students Haven', '09368919566', 'studentshaven2021@gmail.com', '66 Dona Margarita Subd. Binakayan, Kawit, Cavite', 'Super Admin', '', 'studentshaven');

-- --------------------------------------------------------

--
-- Table structure for table `archive_tbl`
--

CREATE TABLE `archive_tbl` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(80) NOT NULL,
  `MIDDLENAME` varchar(80) NOT NULL,
  `LASTNAME` varchar(80) NOT NULL,
  `CONTACT_NUMBER` varchar(50) NOT NULL,
  `ADDRESS` text NOT NULL,
  `PARENT_ID` int(11) NOT NULL,
  `PICTURE` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authorize_person`
--

CREATE TABLE `authorize_person` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(80) NOT NULL,
  `MIDDLENAME` varchar(80) DEFAULT NULL,
  `LASTNAME` varchar(80) NOT NULL,
  `CONTACT_NUMBER` varchar(50) DEFAULT NULL,
  `ADDRESS` text DEFAULT NULL,
  `PARENT_ID` int(11) NOT NULL,
  `PICTURE` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(244) DEFAULT NULL,
  `IMAGE` longtext DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardian`
--

CREATE TABLE `guardian` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(80) DEFAULT NULL,
  `MIDDLENAME` varchar(80) DEFAULT NULL,
  `LASTNAME` varchar(80) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(50) DEFAULT NULL,
  `ADDRESS` text DEFAULT NULL,
  `PICTURE` text DEFAULT NULL,
  `EMAIL` varchar(120) DEFAULT NULL,
  `PASSWORD` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `REDIRECTION` text NOT NULL,
  `DESCRIPTION` varchar(244) NOT NULL,
  `CREATED_DT` datetime NOT NULL DEFAULT current_timestamp(),
  `STUDENT_ID` int(11) DEFAULT NULL,
  `IS_READ` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(80) DEFAULT NULL,
  `LASTNAME` varchar(80) DEFAULT NULL,
  `MIDDLENAME` varchar(80) DEFAULT NULL,
  `ADDRESS` text DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  `PICTURE` longtext DEFAULT NULL,
  `GRADE_LEVEL` varchar(50) DEFAULT NULL,
  `SECTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `ID` int(11) NOT NULL,
  `STUDENT_ID` varchar(50) NOT NULL,
  `CREATED_DT` date NOT NULL DEFAULT current_timestamp(),
  `TIME_IN` datetime DEFAULT current_timestamp(),
  `TIME_OUT` datetime DEFAULT NULL,
  `AUTHORIZE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_guardian`
--

CREATE TABLE `student_guardian` (
  `STUDENT_NUMBER` int(11) NOT NULL,
  `PARENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_guardian`
--

INSERT INTO `student_guardian` (`STUDENT_NUMBER`, `PARENT_ID`) VALUES
(1, 1),
(2, 1),
(100003, 4),
(100004, 5),
(100003, 4),
(100004, 5),
(100013, 10),
(100014, 11);

-- --------------------------------------------------------

--
-- Table structure for table `student_qrcode`
--

CREATE TABLE `student_qrcode` (
  `ID` int(11) NOT NULL,
  `QR_CODE` text DEFAULT NULL,
  `STUDENT_NUMBER` int(11) NOT NULL,
  `STATUS` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(80) DEFAULT NULL,
  `MIDDLENAME` varchar(80) DEFAULT NULL,
  `LASTNAME` varchar(80) DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  `ADDRESS` text DEFAULT NULL,
  `CONTACT_NUMBER` varchar(50) DEFAULT NULL,
  `PICTURE` longtext DEFAULT NULL,
  `EMAIL` varchar(120) DEFAULT NULL,
  `PASSWORD` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_students`
--

CREATE TABLE `teacher_students` (
  `TEACHER_ID` int(11) NOT NULL,
  `STUDENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_staff`
--
ALTER TABLE `admin_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archive_tbl`
--
ALTER TABLE `archive_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `authorize_person`
--
ALTER TABLE `authorize_person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `guardian`
--
ALTER TABLE `guardian`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student_qrcode`
--
ALTER TABLE `student_qrcode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_staff`
--
ALTER TABLE `admin_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `archive_tbl`
--
ALTER TABLE `archive_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `authorize_person`
--
ALTER TABLE `authorize_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `guardian`
--
ALTER TABLE `guardian`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100015;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `student_qrcode`
--
ALTER TABLE `student_qrcode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
