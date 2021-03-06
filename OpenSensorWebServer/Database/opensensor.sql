-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2016 at 06:21 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opensensor`
--

-- --------------------------------------------------------

--
-- Table structure for table `gas`
--

CREATE TABLE `gas` (
  `GAS` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `gas`
--

INSERT INTO `gas` (`GAS`) VALUES
('BUI'),
('CO'),
('CO2'),
('LPG');

-- --------------------------------------------------------

--
-- Table structure for table `sensormodel`
--

CREATE TABLE `sensormodel` (
  `SENSORMODEL` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sensormodel`
--

INSERT INTO `sensormodel` (`SENSORMODEL`) VALUES
('GP2Y10'),
('MG811'),
('MQ135'),
('MQ2');

-- --------------------------------------------------------

--
-- Table structure for table `sensorvalue`
--

CREATE TABLE `sensorvalue` (
  `SENSORMODEL` varchar(50) CHARACTER SET latin1 NOT NULL,
  `GAS` varchar(50) CHARACTER SET latin1 NOT NULL,
  `TIME` datetime NOT NULL,
  `VALUE` float DEFAULT NULL,
  `UNIT` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sensorvalue`
--

INSERT INTO `sensorvalue` (`SENSORMODEL`, `GAS`, `TIME`, `VALUE`, `UNIT`) VALUES
('GP2Y10', 'BUI', '2016-04-25 11:13:46', 4, 'mg/m3'),
('MG811', 'CO2', '2016-04-25 11:13:46', 3, 'ppm'),
('MQ135', 'CO', '2016-04-25 11:13:46', 2, 'ppm'),
('MQ2', 'LPG', '2016-04-25 11:13:46', 1, 'ppm');

-- --------------------------------------------------------

--
-- Table structure for table `thresholdvalue`
--

CREATE TABLE `thresholdvalue` (
  `SENSORMODEL` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `THRESHOLD_VALUE` float NOT NULL,
  `THRESHOLD_COLOR` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `thresholdvalue`
--

INSERT INTO `thresholdvalue` (`SENSORMODEL`, `THRESHOLD_VALUE`, `THRESHOLD_COLOR`) VALUES
('GP2Y10', 0.11, '#ff00ff'),
('MG811', 6000, '#ff8000'),
('MQ135', 9, '#0524fa'),
('MQ2', 12, '#ff0000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gas`
--
ALTER TABLE `gas`
  ADD PRIMARY KEY (`GAS`);

--
-- Indexes for table `sensormodel`
--
ALTER TABLE `sensormodel`
  ADD PRIMARY KEY (`SENSORMODEL`);

--
-- Indexes for table `sensorvalue`
--
ALTER TABLE `sensorvalue`
  ADD PRIMARY KEY (`SENSORMODEL`,`GAS`,`TIME`),
  ADD KEY `FK_RELATIONSHIP_2` (`GAS`);

--
-- Indexes for table `thresholdvalue`
--
ALTER TABLE `thresholdvalue`
  ADD PRIMARY KEY (`SENSORMODEL`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sensorvalue`
--
ALTER TABLE `sensorvalue`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`SENSORMODEL`) REFERENCES `sensormodel` (`SENSORMODEL`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`GAS`) REFERENCES `gas` (`GAS`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
