-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2024 at 03:07 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingcalendar`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_rooms`
--

CREATE TABLE `available_rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `available_rooms`
--

INSERT INTO `available_rooms` (`room_id`, `room_name`) VALUES
(62, 'Taylor Hall 200'),
(63, 'Taylor Hall 300'),
(64, 'Taylor Hall 205');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `name` text NOT NULL,
  `email` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `timeslot` varchar(25) NOT NULL,
  `room` varchar(255) NOT NULL,
  `reader_one` varchar(255) NOT NULL,
  `reader_two` varchar(255) NOT NULL,
  `thesis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `defense_schedule`
--

CREATE TABLE `defense_schedule` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `defense_schedule`
--

INSERT INTO `defense_schedule` (`id`, `start_date`, `end_date`) VALUES
(51, '2024-04-01', '2024-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `panel_passwords`
--

CREATE TABLE `panel_passwords` (
  `panel` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `panel_passwords`
--

INSERT INTO `panel_passwords` (`panel`, `password`, `last_updated`) VALUES
('professor', '12', '2024-02-23 02:04:12'),
('student', '1234', '2024-02-23 02:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `timeslot` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `name`, `date`, `timeslot`) VALUES
(165, 'Dr. Visa', '2024-04-01', '14:00-14:50'),
(166, 'Dr. Visa', '2024-04-01', '15:00-15:50'),
(167, 'Dr. Visa', '2024-04-01', '16:00-16:50'),
(168, 'Dr. Visa', '2024-04-02', '11:00-11:50'),
(169, 'Dr. Visa', '2024-04-02', '13:00-13:50'),
(170, 'Dr. Visa', '2024-04-02', '15:00-15:50'),
(171, 'Dr. Visa', '2024-04-03', '14:00-14:50'),
(172, 'Dr. Visa', '2024-04-03', '15:00-15:50'),
(173, 'Dr. Visa', '2024-04-03', '16:00-16:50'),
(174, 'Dr. Visa', '2024-04-04', '11:00-11:50'),
(175, 'Dr. Visa', '2024-04-04', '13:00-13:50'),
(176, 'Dr. Visa', '2024-04-04', '15:00-15:50'),
(177, 'Dr. Visa', '2024-04-08', '14:00-14:50'),
(178, 'Dr. Visa', '2024-04-08', '15:00-15:50'),
(179, 'Dr. Visa', '2024-04-08', '16:00-16:50'),
(180, 'Dr. Visa', '2024-04-09', '11:00-11:50'),
(181, 'Dr. Visa', '2024-04-09', '13:00-13:50'),
(182, 'Dr. Visa', '2024-04-09', '15:00-15:50'),
(183, 'Dr. Visa', '2024-04-10', '14:00-14:50'),
(184, 'Dr. Visa', '2024-04-10', '15:00-15:50'),
(185, 'Dr. Visa', '2024-04-10', '16:00-16:50'),
(186, 'Dr. Visa', '2024-04-11', '11:00-11:50'),
(187, 'Dr. Visa', '2024-04-11', '13:00-13:50'),
(188, 'Dr. Visa', '2024-04-11', '15:00-15:50'),
(189, 'Dr. Visa', '2024-04-15', '14:00-14:50'),
(190, 'Dr. Visa', '2024-04-15', '15:00-15:50'),
(191, 'Dr. Visa', '2024-04-15', '16:00-16:50'),
(192, 'Dr. Visa', '2024-04-16', '11:00-11:50'),
(193, 'Dr. Visa', '2024-04-16', '13:00-13:50'),
(194, 'Dr. Visa', '2024-04-16', '15:00-15:50'),
(195, 'Dr. Visa', '2024-04-18', '11:00-11:50'),
(196, 'Dr. Visa', '2024-04-18', '13:00-13:50'),
(197, 'Dr. Visa', '2024-04-18', '15:00-15:50'),
(198, 'Dr. Visa', '2024-04-22', '14:00-14:50'),
(199, 'Dr. Visa', '2024-04-22', '15:00-15:50'),
(200, 'Dr. Visa', '2024-04-22', '16:00-16:50'),
(201, 'Dr. Visa', '2024-04-23', '11:00-11:50'),
(202, 'Dr. Visa', '2024-04-23', '13:00-13:50'),
(203, 'Dr. Visa', '2024-04-23', '15:00-15:50'),
(204, 'Dr. Visa', '2024-04-24', '14:00-14:50'),
(205, 'Dr. Visa', '2024-04-24', '15:00-15:50'),
(206, 'Dr. Visa', '2024-04-24', '16:00-16:50'),
(207, 'Dr. Montelione', '2024-04-01', '14:00-14:50'),
(208, 'Dr. Montelione', '2024-04-01', '15:00-15:50'),
(209, 'Dr. Montelione', '2024-04-01', '16:00-16:50'),
(210, 'Dr. Montelione', '2024-04-02', '08:00-08:50'),
(211, 'Dr. Montelione', '2024-04-02', '09:00-09:50'),
(212, 'Dr. Montelione', '2024-04-02', '10:00-10:50'),
(213, 'Dr. Montelione', '2024-04-02', '11:00-11:50'),
(214, 'Dr. Montelione', '2024-04-02', '12:00-12:50'),
(215, 'Dr. Montelione', '2024-04-02', '13:00-13:50'),
(216, 'Dr. Montelione', '2024-04-02', '14:00-14:50'),
(217, 'Dr. Montelione', '2024-04-03', '14:00-14:50'),
(218, 'Dr. Montelione', '2024-04-03', '15:00-15:50'),
(219, 'Dr. Montelione', '2024-04-03', '16:00-16:50'),
(220, 'Dr. Montelione', '2024-04-05', '12:00-12:50'),
(221, 'Dr. Montelione', '2024-04-05', '16:00-16:50'),
(222, 'Dr. Montelione', '2024-04-08', '14:00-14:50'),
(223, 'Dr. Montelione', '2024-04-08', '15:00-15:50'),
(224, 'Dr. Montelione', '2024-04-08', '16:00-16:50'),
(225, 'Dr. Montelione', '2024-04-09', '08:00-08:50'),
(226, 'Dr. Montelione', '2024-04-09', '09:00-09:50'),
(227, 'Dr. Montelione', '2024-04-09', '10:00-10:50'),
(228, 'Dr. Montelione', '2024-04-09', '11:00-11:50'),
(229, 'Dr. Montelione', '2024-04-09', '12:00-12:50'),
(230, 'Dr. Montelione', '2024-04-09', '13:00-13:50'),
(231, 'Dr. Montelione', '2024-04-09', '14:00-14:50'),
(232, 'Dr. Montelione', '2024-04-09', '15:00-15:50'),
(233, 'Dr. Montelione', '2024-04-10', '14:00-14:50'),
(234, 'Dr. Montelione', '2024-04-10', '15:00-15:50'),
(235, 'Dr. Montelione', '2024-04-10', '16:00-16:50'),
(236, 'Dr. Montelione', '2024-04-12', '12:00-12:50'),
(237, 'Dr. Montelione', '2024-04-12', '16:00-16:50'),
(238, 'Dr. Montelione', '2024-04-15', '14:00-14:50'),
(239, 'Dr. Montelione', '2024-04-15', '15:00-15:50'),
(240, 'Dr. Montelione', '2024-04-15', '16:00-16:50'),
(241, 'Dr. Montelione', '2024-04-16', '08:00-08:50'),
(242, 'Dr. Montelione', '2024-04-16', '09:00-09:50'),
(243, 'Dr. Montelione', '2024-04-16', '10:00-10:50'),
(244, 'Dr. Montelione', '2024-04-16', '11:00-11:50'),
(245, 'Dr. Montelione', '2024-04-16', '12:00-12:50'),
(246, 'Dr. Montelione', '2024-04-16', '13:00-13:50'),
(247, 'Dr. Montelione', '2024-04-16', '14:00-14:50'),
(248, 'Dr. Montelione', '2024-04-16', '15:00-15:50'),
(249, 'Dr. Montelione', '2024-04-16', '16:00-16:50'),
(250, 'Dr. Montelione', '2024-04-17', '14:00-14:50'),
(251, 'Dr. Montelione', '2024-04-17', '15:00-15:50'),
(252, 'Dr. Montelione', '2024-04-17', '16:00-16:50'),
(253, 'Dr. Montelione', '2024-04-19', '12:00-12:50'),
(254, 'Dr. Montelione', '2024-04-19', '16:00-16:50'),
(255, 'Dr. Montelione', '2024-04-22', '14:00-14:50'),
(256, 'Dr. Montelione', '2024-04-22', '15:00-15:50'),
(257, 'Dr. Montelione', '2024-04-22', '16:00-16:50'),
(258, 'Dr. Montelione', '2024-04-23', '08:00-08:50'),
(259, 'Dr. Montelione', '2024-04-23', '09:00-09:50'),
(260, 'Dr. Montelione', '2024-04-23', '10:00-10:50'),
(261, 'Dr. Montelione', '2024-04-23', '11:00-11:50'),
(262, 'Dr. Montelione', '2024-04-23', '12:00-12:50'),
(263, 'Dr. Montelione', '2024-04-23', '13:00-13:50'),
(264, 'Dr. Montelione', '2024-04-23', '14:00-14:50'),
(265, 'Dr. Montelione', '2024-04-23', '15:00-15:50'),
(266, 'Dr. Montelione', '2024-04-23', '16:00-16:50'),
(267, 'Dr. Montelione', '2024-04-24', '14:00-14:50'),
(268, 'Dr. Montelione', '2024-04-24', '15:00-15:50'),
(269, 'Dr. Montelione', '2024-04-24', '16:00-16:50'),
(270, 'Dr. Heather', '2024-04-01', '12:00-12:50'),
(271, 'Dr. Heather', '2024-04-01', '14:00-14:50'),
(272, 'Dr. Heather', '2024-04-01', '16:00-16:50'),
(273, 'Dr. Heather', '2024-04-02', '13:00-13:50'),
(274, 'Dr. Heather', '2024-04-02', '15:00-15:50'),
(275, 'Dr. Heather', '2024-04-03', '16:00-16:50'),
(276, 'Dr. Heather', '2024-04-04', '08:00-08:50'),
(277, 'Dr. Heather', '2024-04-04', '09:00-09:50'),
(278, 'Dr. Heather', '2024-04-04', '14:00-14:50'),
(279, 'Dr. Heather', '2024-04-04', '15:00-15:50'),
(280, 'Dr. Heather', '2024-04-04', '16:00-16:50'),
(281, 'Dr. Heather', '2024-04-05', '12:00-12:50'),
(282, 'Dr. Heather', '2024-04-05', '16:00-16:50'),
(283, 'Dr. Heather', '2024-04-08', '12:00-12:50'),
(284, 'Dr. Heather', '2024-04-08', '14:00-14:50'),
(285, 'Dr. Heather', '2024-04-08', '16:00-16:50'),
(286, 'Dr. Heather', '2024-04-09', '13:00-13:50'),
(287, 'Dr. Heather', '2024-04-09', '15:00-15:50'),
(288, 'Dr. Heather', '2024-04-10', '12:00-12:50'),
(289, 'Dr. Heather', '2024-04-10', '14:00-14:50'),
(290, 'Dr. Heather', '2024-04-10', '15:00-15:50'),
(291, 'Dr. Heather', '2024-04-10', '16:00-16:50'),
(292, 'Dr. Heather', '2024-04-11', '08:00-08:50'),
(293, 'Dr. Heather', '2024-04-11', '09:00-09:50'),
(294, 'Dr. Heather', '2024-04-11', '14:00-14:50'),
(295, 'Dr. Heather', '2024-04-11', '15:00-15:50'),
(296, 'Dr. Heather', '2024-04-11', '16:00-16:50'),
(297, 'Dr. Heather', '2024-04-12', '12:00-12:50'),
(298, 'Dr. Heather', '2024-04-12', '16:00-16:50'),
(299, 'Dr. Heather', '2024-04-15', '12:00-12:50'),
(300, 'Dr. Heather', '2024-04-15', '15:00-15:50'),
(301, 'Dr. Heather', '2024-04-15', '16:00-16:50'),
(302, 'Dr. Heather', '2024-04-16', '08:00-08:50'),
(303, 'Dr. Heather', '2024-04-16', '09:00-09:50'),
(304, 'Dr. Heather', '2024-04-16', '10:00-10:50'),
(305, 'Dr. Heather', '2024-04-16', '11:00-11:50'),
(306, 'Dr. Heather', '2024-04-16', '12:00-12:50'),
(307, 'Dr. Heather', '2024-04-16', '13:00-13:50'),
(308, 'Dr. Heather', '2024-04-16', '14:00-14:50'),
(309, 'Dr. Heather', '2024-04-16', '15:00-15:50'),
(310, 'Dr. Heather', '2024-04-16', '16:00-16:50'),
(311, 'Dr. Heather', '2024-04-17', '12:00-12:50'),
(312, 'Dr. Heather', '2024-04-17', '14:00-14:50'),
(313, 'Dr. Heather', '2024-04-17', '15:00-15:50'),
(314, 'Dr. Heather', '2024-04-17', '16:00-16:50'),
(315, 'Dr. Heather', '2024-04-18', '08:00-08:50'),
(316, 'Dr. Heather', '2024-04-18', '09:00-09:50'),
(317, 'Dr. Heather', '2024-04-18', '14:00-14:50'),
(318, 'Dr. Heather', '2024-04-18', '15:00-15:50'),
(319, 'Dr. Heather', '2024-04-18', '16:00-16:50'),
(320, 'Dr. Heather', '2024-04-19', '12:00-12:50'),
(321, 'Dr. Heather', '2024-04-19', '16:00-16:50'),
(322, 'Dr. Heather', '2024-04-22', '12:00-12:50'),
(323, 'Dr. Heather', '2024-04-22', '15:00-15:50'),
(324, 'Dr. Heather', '2024-04-22', '16:00-16:50'),
(325, 'Dr. Heather', '2024-04-23', '08:00-08:50'),
(326, 'Dr. Heather', '2024-04-23', '09:00-09:50'),
(327, 'Dr. Heather', '2024-04-23', '10:00-10:50'),
(328, 'Dr. Heather', '2024-04-23', '11:00-11:50'),
(329, 'Dr. Heather', '2024-04-23', '12:00-12:50'),
(330, 'Dr. Heather', '2024-04-23', '13:00-13:50'),
(331, 'Dr. Heather', '2024-04-23', '14:00-14:50'),
(332, 'Dr. Heather', '2024-04-23', '15:00-15:50'),
(333, 'Dr. Heather', '2024-04-23', '16:00-16:50'),
(334, 'Dr. Heather', '2024-04-24', '12:00-12:50'),
(335, 'Dr. Heather', '2024-04-24', '14:00-14:50'),
(336, 'Dr. Heather', '2024-04-24', '15:00-15:50'),
(337, 'Dr. Heather', '2024-04-24', '16:00-16:50');

-- --------------------------------------------------------

--
-- Table structure for table `professor_list`
--

CREATE TABLE `professor_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor_list`
--

INSERT INTO `professor_list` (`id`, `name`) VALUES
(48, 'Dr. Visa'),
(49, 'Dr. Montelione'),
(50, 'Dr. Heather'),
(51, 'Dr. Palmer');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--
 
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `timeslot` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `date`, `timeslot`) VALUES
(618, 'Taylor Hall 200', '2024-04-01', '12:00-12:50'),
(619, 'Taylor Hall 200', '2024-04-01', '14:00-14:50'),
(620, 'Taylor Hall 200', '2024-04-01', '15:00-15:50'),
(621, 'Taylor Hall 200', '2024-04-01', '16:00-16:50'),
(622, 'Taylor Hall 200', '2024-04-02', '08:00-08:50'),
(623, 'Taylor Hall 200', '2024-04-02', '09:00-09:50'),
(624, 'Taylor Hall 200', '2024-04-02', '10:00-10:50'),
(625, 'Taylor Hall 200', '2024-04-02', '11:00-11:50'),
(626, 'Taylor Hall 200', '2024-04-02', '12:00-12:50'),
(627, 'Taylor Hall 200', '2024-04-02', '13:00-13:50'),
(628, 'Taylor Hall 200', '2024-04-02', '14:00-14:50'),
(629, 'Taylor Hall 200', '2024-04-02', '15:00-15:50'),
(630, 'Taylor Hall 200', '2024-04-02', '16:00-16:50'),
(631, 'Taylor Hall 200', '2024-04-03', '12:00-12:50'),
(632, 'Taylor Hall 200', '2024-04-03', '14:00-14:50'),
(633, 'Taylor Hall 200', '2024-04-03', '15:00-15:50'),
(634, 'Taylor Hall 200', '2024-04-03', '16:00-16:50'),
(635, 'Taylor Hall 200', '2024-04-04', '08:00-08:50'),
(636, 'Taylor Hall 200', '2024-04-04', '09:00-09:50'),
(637, 'Taylor Hall 200', '2024-04-04', '10:00-10:50'),
(638, 'Taylor Hall 200', '2024-04-04', '11:00-11:50'),
(639, 'Taylor Hall 200', '2024-04-04', '12:00-12:50'),
(640, 'Taylor Hall 200', '2024-04-04', '13:00-13:50'),
(641, 'Taylor Hall 200', '2024-04-04', '14:00-14:50'),
(642, 'Taylor Hall 200', '2024-04-04', '15:00-15:50'),
(643, 'Taylor Hall 200', '2024-04-04', '16:00-16:50'),
(644, 'Taylor Hall 200', '2024-04-05', '12:00-12:50'),
(645, 'Taylor Hall 200', '2024-04-05', '16:00-16:50'),
(646, 'Taylor Hall 200', '2024-04-08', '12:00-12:50'),
(647, 'Taylor Hall 200', '2024-04-08', '14:00-14:50'),
(648, 'Taylor Hall 200', '2024-04-08', '15:00-15:50'),
(649, 'Taylor Hall 200', '2024-04-08', '16:00-16:50'),
(650, 'Taylor Hall 200', '2024-04-09', '08:00-08:50'),
(651, 'Taylor Hall 200', '2024-04-09', '09:00-09:50'),
(652, 'Taylor Hall 200', '2024-04-09', '10:00-10:50'),
(653, 'Taylor Hall 200', '2024-04-09', '11:00-11:50'),
(654, 'Taylor Hall 200', '2024-04-09', '12:00-12:50'),
(655, 'Taylor Hall 200', '2024-04-09', '13:00-13:50'),
(656, 'Taylor Hall 200', '2024-04-09', '14:00-14:50'),
(657, 'Taylor Hall 200', '2024-04-09', '15:00-15:50'),
(658, 'Taylor Hall 200', '2024-04-09', '16:00-16:50'),
(659, 'Taylor Hall 200', '2024-04-10', '12:00-12:50'),
(660, 'Taylor Hall 200', '2024-04-10', '14:00-14:50'),
(661, 'Taylor Hall 200', '2024-04-10', '15:00-15:50'),
(662, 'Taylor Hall 200', '2024-04-10', '16:00-16:50'),
(663, 'Taylor Hall 200', '2024-04-11', '08:00-08:50'),
(664, 'Taylor Hall 200', '2024-04-11', '09:00-09:50'),
(665, 'Taylor Hall 200', '2024-04-11', '10:00-10:50'),
(666, 'Taylor Hall 200', '2024-04-11', '11:00-11:50'),
(667, 'Taylor Hall 200', '2024-04-11', '12:00-12:50'),
(668, 'Taylor Hall 200', '2024-04-11', '13:00-13:50'),
(669, 'Taylor Hall 200', '2024-04-11', '14:00-14:50'),
(670, 'Taylor Hall 200', '2024-04-11', '15:00-15:50'),
(671, 'Taylor Hall 200', '2024-04-11', '16:00-16:50'),
(672, 'Taylor Hall 200', '2024-04-12', '12:00-12:50'),
(673, 'Taylor Hall 200', '2024-04-12', '16:00-16:50'),
(674, 'Taylor Hall 200', '2024-04-15', '12:00-12:50'),
(675, 'Taylor Hall 200', '2024-04-15', '14:00-14:50'),
(676, 'Taylor Hall 200', '2024-04-15', '15:00-15:50'),
(677, 'Taylor Hall 200', '2024-04-15', '16:00-16:50'),
(678, 'Taylor Hall 200', '2024-04-16', '08:00-08:50'),
(679, 'Taylor Hall 200', '2024-04-16', '09:00-09:50'),
(680, 'Taylor Hall 200', '2024-04-16', '10:00-10:50'),
(681, 'Taylor Hall 200', '2024-04-16', '11:00-11:50'),
(682, 'Taylor Hall 200', '2024-04-16', '12:00-12:50'),
(683, 'Taylor Hall 200', '2024-04-16', '13:00-13:50'),
(684, 'Taylor Hall 200', '2024-04-16', '14:00-14:50'),
(685, 'Taylor Hall 200', '2024-04-16', '15:00-15:50'),
(686, 'Taylor Hall 200', '2024-04-16', '16:00-16:50'),
(687, 'Taylor Hall 200', '2024-04-17', '12:00-12:50'),
(688, 'Taylor Hall 200', '2024-04-17', '14:00-14:50'),
(689, 'Taylor Hall 200', '2024-04-17', '15:00-15:50'),
(690, 'Taylor Hall 200', '2024-04-17', '16:00-16:50'),
(691, 'Taylor Hall 200', '2024-04-18', '08:00-08:50'),
(692, 'Taylor Hall 200', '2024-04-18', '09:00-09:50'),
(693, 'Taylor Hall 200', '2024-04-18', '10:00-10:50'),
(694, 'Taylor Hall 200', '2024-04-18', '11:00-11:50'),
(695, 'Taylor Hall 200', '2024-04-18', '12:00-12:50'),
(696, 'Taylor Hall 200', '2024-04-18', '13:00-13:50'),
(697, 'Taylor Hall 200', '2024-04-18', '14:00-14:50'),
(698, 'Taylor Hall 200', '2024-04-18', '15:00-15:50'),
(699, 'Taylor Hall 200', '2024-04-18', '16:00-16:50'),
(700, 'Taylor Hall 200', '2024-04-19', '12:00-12:50'),
(701, 'Taylor Hall 200', '2024-04-19', '16:00-16:50'),
(702, 'Taylor Hall 200', '2024-04-22', '12:00-12:50'),
(703, 'Taylor Hall 200', '2024-04-22', '14:00-14:50'),
(704, 'Taylor Hall 200', '2024-04-22', '15:00-15:50'),
(705, 'Taylor Hall 200', '2024-04-22', '16:00-16:50'),
(706, 'Taylor Hall 200', '2024-04-23', '08:00-08:50'),
(707, 'Taylor Hall 200', '2024-04-23', '09:00-09:50'),
(708, 'Taylor Hall 200', '2024-04-23', '10:00-10:50'),
(709, 'Taylor Hall 200', '2024-04-23', '11:00-11:50'),
(710, 'Taylor Hall 200', '2024-04-23', '12:00-12:50'),
(711, 'Taylor Hall 200', '2024-04-23', '13:00-13:50'),
(712, 'Taylor Hall 200', '2024-04-23', '14:00-14:50'),
(713, 'Taylor Hall 200', '2024-04-23', '15:00-15:50'),
(714, 'Taylor Hall 200', '2024-04-23', '16:00-16:50'),
(715, 'Taylor Hall 200', '2024-04-24', '12:00-12:50'),
(716, 'Taylor Hall 200', '2024-04-24', '14:00-14:50'),
(717, 'Taylor Hall 200', '2024-04-24', '15:00-15:50'),
(718, 'Taylor Hall 200', '2024-04-24', '16:00-16:50'),
(719, 'Taylor Hall 300', '2024-04-01', '12:00-12:50'),
(720, 'Taylor Hall 300', '2024-04-01', '14:00-14:50'),
(721, 'Taylor Hall 300', '2024-04-01', '15:00-15:50'),
(722, 'Taylor Hall 300', '2024-04-01', '16:00-16:50'),
(723, 'Taylor Hall 300', '2024-04-02', '08:00-08:50'),
(724, 'Taylor Hall 300', '2024-04-02', '09:00-09:50'),
(725, 'Taylor Hall 300', '2024-04-02', '10:00-10:50'),
(726, 'Taylor Hall 300', '2024-04-02', '11:00-11:50'),
(727, 'Taylor Hall 300', '2024-04-02', '12:00-12:50'),
(728, 'Taylor Hall 300', '2024-04-02', '13:00-13:50'),
(729, 'Taylor Hall 300', '2024-04-02', '14:00-14:50'),
(730, 'Taylor Hall 300', '2024-04-02', '15:00-15:50'),
(731, 'Taylor Hall 300', '2024-04-02', '16:00-16:50'),
(732, 'Taylor Hall 300', '2024-04-03', '12:00-12:50'),
(733, 'Taylor Hall 300', '2024-04-03', '14:00-14:50'),
(734, 'Taylor Hall 300', '2024-04-03', '15:00-15:50'),
(735, 'Taylor Hall 300', '2024-04-03', '16:00-16:50'),
(736, 'Taylor Hall 300', '2024-04-04', '08:00-08:50'),
(737, 'Taylor Hall 300', '2024-04-04', '09:00-09:50'),
(738, 'Taylor Hall 300', '2024-04-04', '10:00-10:50'),
(739, 'Taylor Hall 300', '2024-04-04', '11:00-11:50'),
(740, 'Taylor Hall 300', '2024-04-04', '12:00-12:50'),
(741, 'Taylor Hall 300', '2024-04-04', '13:00-13:50'),
(742, 'Taylor Hall 300', '2024-04-04', '14:00-14:50'),
(743, 'Taylor Hall 300', '2024-04-04', '15:00-15:50'),
(744, 'Taylor Hall 300', '2024-04-04', '16:00-16:50'),
(745, 'Taylor Hall 300', '2024-04-05', '12:00-12:50'),
(746, 'Taylor Hall 300', '2024-04-05', '16:00-16:50'),
(747, 'Taylor Hall 300', '2024-04-08', '12:00-12:50'),
(748, 'Taylor Hall 300', '2024-04-08', '14:00-14:50'),
(749, 'Taylor Hall 300', '2024-04-08', '15:00-15:50'),
(750, 'Taylor Hall 300', '2024-04-08', '16:00-16:50'),
(751, 'Taylor Hall 300', '2024-04-09', '08:00-08:50'),
(752, 'Taylor Hall 300', '2024-04-09', '09:00-09:50'),
(753, 'Taylor Hall 300', '2024-04-09', '10:00-10:50'),
(754, 'Taylor Hall 300', '2024-04-09', '11:00-11:50'),
(755, 'Taylor Hall 300', '2024-04-09', '12:00-12:50'),
(756, 'Taylor Hall 300', '2024-04-09', '13:00-13:50'),
(757, 'Taylor Hall 300', '2024-04-09', '14:00-14:50'),
(758, 'Taylor Hall 300', '2024-04-09', '15:00-15:50'),
(759, 'Taylor Hall 300', '2024-04-09', '16:00-16:50'),
(760, 'Taylor Hall 300', '2024-04-10', '12:00-12:50'),
(761, 'Taylor Hall 300', '2024-04-10', '14:00-14:50'),
(762, 'Taylor Hall 300', '2024-04-10', '15:00-15:50'),
(763, 'Taylor Hall 300', '2024-04-10', '16:00-16:50'),
(764, 'Taylor Hall 300', '2024-04-11', '08:00-08:50'),
(765, 'Taylor Hall 300', '2024-04-11', '09:00-09:50'),
(766, 'Taylor Hall 300', '2024-04-11', '10:00-10:50'),
(767, 'Taylor Hall 300', '2024-04-11', '11:00-11:50'),
(768, 'Taylor Hall 300', '2024-04-11', '12:00-12:50'),
(769, 'Taylor Hall 300', '2024-04-11', '13:00-13:50'),
(770, 'Taylor Hall 300', '2024-04-11', '14:00-14:50'),
(771, 'Taylor Hall 300', '2024-04-11', '15:00-15:50'),
(772, 'Taylor Hall 300', '2024-04-11', '16:00-16:50'),
(773, 'Taylor Hall 300', '2024-04-12', '12:00-12:50'),
(774, 'Taylor Hall 300', '2024-04-12', '16:00-16:50'),
(775, 'Taylor Hall 300', '2024-04-15', '12:00-12:50'),
(776, 'Taylor Hall 300', '2024-04-15', '14:00-14:50'),
(777, 'Taylor Hall 300', '2024-04-15', '15:00-15:50'),
(778, 'Taylor Hall 300', '2024-04-15', '16:00-16:50'),
(779, 'Taylor Hall 300', '2024-04-16', '08:00-08:50'),
(780, 'Taylor Hall 300', '2024-04-16', '09:00-09:50'),
(781, 'Taylor Hall 300', '2024-04-16', '10:00-10:50'),
(782, 'Taylor Hall 300', '2024-04-16', '11:00-11:50'),
(783, 'Taylor Hall 300', '2024-04-16', '12:00-12:50'),
(784, 'Taylor Hall 300', '2024-04-16', '13:00-13:50'),
(785, 'Taylor Hall 300', '2024-04-16', '14:00-14:50'),
(786, 'Taylor Hall 300', '2024-04-16', '15:00-15:50'),
(787, 'Taylor Hall 300', '2024-04-16', '16:00-16:50'),
(788, 'Taylor Hall 300', '2024-04-17', '12:00-12:50'),
(789, 'Taylor Hall 300', '2024-04-17', '14:00-14:50'),
(790, 'Taylor Hall 300', '2024-04-17', '15:00-15:50'),
(791, 'Taylor Hall 300', '2024-04-17', '16:00-16:50'),
(792, 'Taylor Hall 300', '2024-04-18', '08:00-08:50'),
(793, 'Taylor Hall 300', '2024-04-18', '09:00-09:50'),
(794, 'Taylor Hall 300', '2024-04-18', '10:00-10:50'),
(795, 'Taylor Hall 300', '2024-04-18', '11:00-11:50'),
(796, 'Taylor Hall 300', '2024-04-18', '12:00-12:50'),
(797, 'Taylor Hall 300', '2024-04-18', '13:00-13:50'),
(798, 'Taylor Hall 300', '2024-04-18', '14:00-14:50'),
(799, 'Taylor Hall 300', '2024-04-18', '15:00-15:50'),
(800, 'Taylor Hall 300', '2024-04-18', '16:00-16:50'),
(801, 'Taylor Hall 300', '2024-04-19', '12:00-12:50'),
(802, 'Taylor Hall 300', '2024-04-19', '16:00-16:50'),
(803, 'Taylor Hall 300', '2024-04-22', '12:00-12:50'),
(804, 'Taylor Hall 300', '2024-04-22', '14:00-14:50'),
(805, 'Taylor Hall 300', '2024-04-22', '15:00-15:50'),
(806, 'Taylor Hall 300', '2024-04-22', '16:00-16:50'),
(807, 'Taylor Hall 300', '2024-04-23', '08:00-08:50'),
(808, 'Taylor Hall 300', '2024-04-23', '09:00-09:50'),
(809, 'Taylor Hall 300', '2024-04-23', '10:00-10:50'),
(810, 'Taylor Hall 300', '2024-04-23', '11:00-11:50'),
(811, 'Taylor Hall 300', '2024-04-23', '12:00-12:50'),
(812, 'Taylor Hall 300', '2024-04-23', '13:00-13:50'),
(813, 'Taylor Hall 300', '2024-04-23', '14:00-14:50'),
(814, 'Taylor Hall 300', '2024-04-23', '15:00-15:50'),
(815, 'Taylor Hall 300', '2024-04-23', '16:00-16:50'),
(816, 'Taylor Hall 300', '2024-04-24', '12:00-12:50'),
(817, 'Taylor Hall 300', '2024-04-24', '14:00-14:50'),
(818, 'Taylor Hall 300', '2024-04-24', '15:00-15:50'),
(819, 'Taylor Hall 300', '2024-04-24', '16:00-16:50'),
(820, 'Taylor Hall 205', '2024-04-01', '12:00-12:50'),
(821, 'Taylor Hall 205', '2024-04-01', '14:00-14:50'),
(822, 'Taylor Hall 205', '2024-04-01', '15:00-15:50'),
(823, 'Taylor Hall 205', '2024-04-01', '16:00-16:50'),
(824, 'Taylor Hall 205', '2024-04-02', '08:00-08:50'),
(825, 'Taylor Hall 205', '2024-04-02', '09:00-09:50'),
(826, 'Taylor Hall 205', '2024-04-02', '10:00-10:50'),
(827, 'Taylor Hall 205', '2024-04-02', '11:00-11:50'),
(828, 'Taylor Hall 205', '2024-04-02', '12:00-12:50'),
(829, 'Taylor Hall 205', '2024-04-02', '13:00-13:50'),
(830, 'Taylor Hall 205', '2024-04-02', '14:00-14:50'),
(831, 'Taylor Hall 205', '2024-04-02', '15:00-15:50'),
(832, 'Taylor Hall 205', '2024-04-02', '16:00-16:50'),
(833, 'Taylor Hall 205', '2024-04-03', '12:00-12:50'),
(834, 'Taylor Hall 205', '2024-04-03', '14:00-14:50'),
(835, 'Taylor Hall 205', '2024-04-03', '15:00-15:50'),
(836, 'Taylor Hall 205', '2024-04-03', '16:00-16:50'),
(837, 'Taylor Hall 205', '2024-04-04', '08:00-08:50'),
(838, 'Taylor Hall 205', '2024-04-04', '09:00-09:50'),
(839, 'Taylor Hall 205', '2024-04-04', '10:00-10:50'),
(840, 'Taylor Hall 205', '2024-04-04', '11:00-11:50'),
(841, 'Taylor Hall 205', '2024-04-04', '12:00-12:50'),
(842, 'Taylor Hall 205', '2024-04-04', '13:00-13:50'),
(843, 'Taylor Hall 205', '2024-04-04', '14:00-14:50'),
(844, 'Taylor Hall 205', '2024-04-04', '15:00-15:50'),
(845, 'Taylor Hall 205', '2024-04-04', '16:00-16:50'),
(846, 'Taylor Hall 205', '2024-04-05', '12:00-12:50'),
(847, 'Taylor Hall 205', '2024-04-05', '16:00-16:50'),
(848, 'Taylor Hall 205', '2024-04-08', '12:00-12:50'),
(849, 'Taylor Hall 205', '2024-04-08', '14:00-14:50'),
(850, 'Taylor Hall 205', '2024-04-08', '15:00-15:50'),
(851, 'Taylor Hall 205', '2024-04-08', '16:00-16:50'),
(852, 'Taylor Hall 205', '2024-04-09', '08:00-08:50'),
(853, 'Taylor Hall 205', '2024-04-09', '09:00-09:50'),
(854, 'Taylor Hall 205', '2024-04-09', '10:00-10:50'),
(855, 'Taylor Hall 205', '2024-04-09', '11:00-11:50'),
(856, 'Taylor Hall 205', '2024-04-09', '12:00-12:50'),
(857, 'Taylor Hall 205', '2024-04-09', '13:00-13:50'),
(858, 'Taylor Hall 205', '2024-04-09', '14:00-14:50'),
(859, 'Taylor Hall 205', '2024-04-09', '15:00-15:50'),
(860, 'Taylor Hall 205', '2024-04-09', '16:00-16:50'),
(861, 'Taylor Hall 205', '2024-04-10', '12:00-12:50'),
(862, 'Taylor Hall 205', '2024-04-10', '14:00-14:50'),
(863, 'Taylor Hall 205', '2024-04-10', '15:00-15:50'),
(864, 'Taylor Hall 205', '2024-04-10', '16:00-16:50'),
(865, 'Taylor Hall 205', '2024-04-11', '08:00-08:50'),
(866, 'Taylor Hall 205', '2024-04-11', '09:00-09:50'),
(867, 'Taylor Hall 205', '2024-04-11', '10:00-10:50'),
(868, 'Taylor Hall 205', '2024-04-11', '11:00-11:50'),
(869, 'Taylor Hall 205', '2024-04-11', '12:00-12:50'),
(870, 'Taylor Hall 205', '2024-04-11', '13:00-13:50'),
(871, 'Taylor Hall 205', '2024-04-11', '14:00-14:50'),
(872, 'Taylor Hall 205', '2024-04-11', '15:00-15:50'),
(873, 'Taylor Hall 205', '2024-04-11', '16:00-16:50'),
(874, 'Taylor Hall 205', '2024-04-12', '12:00-12:50'),
(875, 'Taylor Hall 205', '2024-04-12', '16:00-16:50'),
(876, 'Taylor Hall 205', '2024-04-15', '12:00-12:50'),
(877, 'Taylor Hall 205', '2024-04-15', '14:00-14:50'),
(878, 'Taylor Hall 205', '2024-04-15', '15:00-15:50'),
(879, 'Taylor Hall 205', '2024-04-15', '16:00-16:50'),
(880, 'Taylor Hall 205', '2024-04-16', '08:00-08:50'),
(881, 'Taylor Hall 205', '2024-04-16', '09:00-09:50'),
(882, 'Taylor Hall 205', '2024-04-16', '10:00-10:50'),
(883, 'Taylor Hall 205', '2024-04-16', '11:00-11:50'),
(884, 'Taylor Hall 205', '2024-04-16', '12:00-12:50'),
(885, 'Taylor Hall 205', '2024-04-16', '13:00-13:50'),
(886, 'Taylor Hall 205', '2024-04-16', '14:00-14:50'),
(887, 'Taylor Hall 205', '2024-04-16', '15:00-15:50'),
(888, 'Taylor Hall 205', '2024-04-16', '16:00-16:50'),
(889, 'Taylor Hall 205', '2024-04-17', '12:00-12:50'),
(890, 'Taylor Hall 205', '2024-04-17', '14:00-14:50'),
(891, 'Taylor Hall 205', '2024-04-17', '15:00-15:50'),
(892, 'Taylor Hall 205', '2024-04-17', '16:00-16:50'),
(893, 'Taylor Hall 205', '2024-04-18', '08:00-08:50'),
(894, 'Taylor Hall 205', '2024-04-18', '09:00-09:50'),
(895, 'Taylor Hall 205', '2024-04-18', '10:00-10:50'),
(896, 'Taylor Hall 205', '2024-04-18', '11:00-11:50'),
(897, 'Taylor Hall 205', '2024-04-18', '12:00-12:50'),
(898, 'Taylor Hall 205', '2024-04-18', '13:00-13:50'),
(899, 'Taylor Hall 205', '2024-04-18', '14:00-14:50'),
(900, 'Taylor Hall 205', '2024-04-18', '15:00-15:50'),
(901, 'Taylor Hall 205', '2024-04-18', '16:00-16:50'),
(902, 'Taylor Hall 205', '2024-04-19', '12:00-12:50'),
(903, 'Taylor Hall 205', '2024-04-19', '16:00-16:50'),
(904, 'Taylor Hall 205', '2024-04-22', '12:00-12:50'),
(905, 'Taylor Hall 205', '2024-04-22', '14:00-14:50'),
(906, 'Taylor Hall 205', '2024-04-22', '15:00-15:50'),
(907, 'Taylor Hall 205', '2024-04-22', '16:00-16:50'),
(908, 'Taylor Hall 205', '2024-04-23', '08:00-08:50'),
(909, 'Taylor Hall 205', '2024-04-23', '09:00-09:50'),
(910, 'Taylor Hall 205', '2024-04-23', '10:00-10:50'),
(911, 'Taylor Hall 205', '2024-04-23', '11:00-11:50'),
(912, 'Taylor Hall 205', '2024-04-23', '12:00-12:50'),
(913, 'Taylor Hall 205', '2024-04-23', '13:00-13:50'),
(914, 'Taylor Hall 205', '2024-04-23', '14:00-14:50'),
(915, 'Taylor Hall 205', '2024-04-23', '15:00-15:50'),
(916, 'Taylor Hall 205', '2024-04-23', '16:00-16:50'),
(917, 'Taylor Hall 205', '2024-04-24', '12:00-12:50'),
(918, 'Taylor Hall 205', '2024-04-24', '14:00-14:50'),
(919, 'Taylor Hall 205', '2024-04-24', '15:00-15:50'),
(920, 'Taylor Hall 205', '2024-04-24', '16:00-16:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_rooms`
--
ALTER TABLE `available_rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `defense_schedule`
--
ALTER TABLE `defense_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_passwords`
--
ALTER TABLE `panel_passwords`
  ADD PRIMARY KEY (`panel`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professor_list`
--
ALTER TABLE `professor_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available_rooms`
--
ALTER TABLE `available_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `defense_schedule`
--
ALTER TABLE `defense_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `professor_list`
--
ALTER TABLE `professor_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=921;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
