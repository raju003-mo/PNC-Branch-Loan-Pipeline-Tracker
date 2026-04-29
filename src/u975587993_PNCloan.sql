-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2026 at 02:11 PM
-- Server version: 11.8.6-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u975587993_PNCloan`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `application_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `ssn` varchar(15) NOT NULL,
  `loan_type` enum('personal','auto','home_equity') NOT NULL,
  `loan_amount` decimal(12,2) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `submitted_date` date NOT NULL,
  `approved_date` date DEFAULT NULL,
  `officer_id` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `loan_applications`
--

INSERT INTO `loan_applications` (`application_id`, `customer_name`, `ssn`, `loan_type`, `loan_amount`, `status`, `submitted_date`, `approved_date`, `officer_id`) VALUES
(1, 'Michael Brown', '111-11-1111', 'auto', 15000.00, 'pending', '2026-04-28', NULL, 1),
(2, 'Emily Davis', '222-22-2222', 'personal', 8000.00, 'pending', '2026-04-28', NULL, 2),
(3, 'Chris Evans', '333-33-3333', 'auto', 20000.00, 'approved', '2026-04-26', '2026-04-27', 1),
(4, 'Sophia Lee', '444-44-4444', 'home_equity', 120000.00, 'approved', '2026-04-25', '2026-04-26', 1),
(5, 'Daniel Smith', '555-55-5555', 'personal', 5000.00, 'approved', '2026-04-24', '2026-04-25', 2),
(6, 'Olivia Wilson', '666-66-6666', 'auto', 18000.00, 'approved', '2026-04-23', '2026-04-24', 3),
(7, 'Old Applicant', '777-77-7777', 'personal', 7000.00, 'pending', '2026-04-18', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `loan_officers`
--

CREATE TABLE `loan_officers` (
  `officer_id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_officers`
--

INSERT INTO `loan_officers` (`officer_id`, `employee_id`, `first_name`, `last_name`, `email`, `phone`, `hire_date`, `status`) VALUES
(1, 'PNC-4471', 'Sarah', 'Kim', 'sarah.kim@pnc.com', '4125550199', '2022-03-15', 'active'),
(2, 'PNC-4472', 'John', 'Miller', 'john.miller@pnc.com', '4125550123', '2021-07-10', 'active'),
(3, 'PNC-4473', 'Aisha', 'Patel', 'aisha.patel@pnc.com', '4125550456', '2023-01-05', 'active'),
(4, 'PNC-4474', 'David', 'Lopez', 'david.lopez@pnc.com', '4125550789', '2020-11-20', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`application_id`),
  ADD UNIQUE KEY `ssn` (`ssn`),
  ADD KEY `fk_officer` (`officer_id`);

--
-- Indexes for table `loan_officers`
--
ALTER TABLE `loan_officers`
  ADD PRIMARY KEY (`officer_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_officers`
--
ALTER TABLE `loan_officers`
  MODIFY `officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD CONSTRAINT `fk_officer` FOREIGN KEY (`officer_id`) REFERENCES `loan_officers` (`officer_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
