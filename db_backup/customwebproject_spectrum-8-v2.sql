-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2025 at 12:46 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customwebproject_spectrum-8-v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ShortName` varchar(25) DEFAULT NULL,
  `NickName` varchar(15) DEFAULT NULL,
  `Abbr` varchar(4) DEFAULT NULL,
  `MaxParticipants` int(11) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `AssessmentTypeID` int(10) UNSIGNED DEFAULT NULL,
  `Setup` longtext DEFAULT NULL,
  `Instructions` longtext DEFAULT NULL,
  `EvalList` longtext DEFAULT NULL,
  `ColorID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `Name`, `ShortName`, `NickName`, `Abbr`, `MaxParticipants`, `Sort`, `AssessmentTypeID`, `Setup`, `Instructions`, `EvalList`, `ColorID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`, `Image`, `video`) VALUES
(1, '8-Point Agility Octagon', 'Agility Octagon', 'Octagon', 'OCT', 1, 1, 1, 'Setup\n1.) Place the setup disc in the middle of the running space\n\n2.) Secure the disc to prevent rotation or translation movement (for example with a weight, masking tape, or having a second person physically hold it down)\n\n3.) Pull the center setup string/ribbon straight along the white radial arm on the disc, and place the white cone at the two meter mark on the string\n\n4.) Repeat the cone placement for the other seven colors, creating an octagon shape\n\n5.) Tester meets with group of participants(s) \n\n6.) Tester gives participants verbal instructions\n\n7.) Tester displays color scale chart\n\n8.) Tester gives participants white paper wristbands\n\n9.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Tester opens app\n\n2.) Select the grade/gender subgroup on the app to get the appropriate 95th percentile finish time, the fixed time for the run\n\n3.) Participant lines up\n\n4.) Start button is depressed on the dashboard\n\n5.) App produces go audio signal\n\n6.) Participant runs and touches color markers on a 45 degrees angle in color sequence order - white, pink, yellow, purple, orange, green, blue, red\n\n7.) App produces audio stop signal at the preset time (ex 12 seconds)\n\n\nScoring\n1.) Tester notes last color marker touched before the audio signal\n\n2.) Tester depresses a corresponding color button on the dashboard\n\n3.) App records, displays performance\n\n4.) Tester raises the corresponding color flag\n\n5.) Tester gives participant(s) corresponding color dot\n\n6.) Traditional timing: Stop the watch at the red cone touch\n\n7.) The app will display the color score based on stored scoring tables', 'Agility - Change of direction - Reaction time - Spatial awareness - Thinking on feet', 1, 1, '6', '1', 'false', '2022-12-05 18:04:16', '2023-02-14 01:02:49', NULL, 'spectrum 8 icons_1660244109_1670503396.png', 'sample_videos___dummy_videos_for_demo_use(360p)_1676318569.mp4'),
(2, 'Standing Triple Jump', 'Triple Jump', 'Triple 8', 'TJ', 2, 2, 2, '1.) Measure a length of string/ribbon and mark the 95th percentile distance with a red clip\n\n2.) Set the \\\"color spacer\\\" length to the appropriate grade & age segment length\n\n3.) Place a blue clip \\\"color spacer\\\" length from the red color marker, closer to the start\n\n4.) Similarly place the remaining clips at \\\"color spacer\\\" increments (green, orange, purple, orange, yellow, pink, white)\n\n5.) Pull the string/ribbon straight from the start in the desired direction of the jump or throw\n\n6.) Place colored cones alongside the corresponding clip for greater visibility\n\n7.) Tester meets with group of participants(s)\n\n8.) Tester gives participants verbal instructions\n\n9.) Tester displays color scale chart\n\n10.) Tester gives participants white paper wristbands\n\n11.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Participants line up \n\n2.) Participants throws or jumps to the furthest color maker\n\n3.) Tester notes the last color marker that is surpassed by a jump or throws\n\n4.) Tester presses a corresponding color button on the dashboard\n\n5.) App records, and displays performance based on stored scoring tables\n\n6.) Tester raises the corresponding color flag\n\n7.) Tester gives participant(s) corresponding color dot', 'Balance - Lower body power - Power symmetry - Timing', 2, 1, '6', '6', 'false', '2022-12-05 18:06:52', '2022-12-08 17:43:35', NULL, 'triple jump_1660953714_1670503415.png', NULL),
(3, '24 Meter Sprint', '24M Sprint', '24M', '24M', 3, 3, 1, '1.) Tester places white color marker on field\n\n2.) Using 24 meter measuring tape Tester places red color marker 24 meters from white marker\n\n3.) Tester meets with group of participants(s)\n\n4.) Tester gives participants verbal instructions\n\n5.) Tester displays color scale chart\n\n6.) Tester gives participants white paper wristbands\n\n7.) Tester places 8 colored flags and color dots within reach or with a helper', '1.) Tester opens the app\n\n2.) Tester selects the event/name/grade/gender subgroup on the dashboard\n\n3.) Participant lines up at white color marker\n\n4.) Start button is depressed on the dashboard\n\n5.) App produces go audio signal\n\n6.) Participant runs at maximum speed\n\n7.) Tester depresses the stop button when participants crosses red color marker\n\n8.) App produces audio stop signal\n\n9.) App captures time elapsed\n\n10.) App computes and records the color score \n\n11.) Tester views the color score on the dashboard\n\n12.) Tester raises the corresponding color flag\n\n13.) Tester gives participant(s) corresponding color dot\n\n14.) Tester places the white color marker on field\n\n15.) Using 24-meter measuring tape Tester places the red color marker 24 meters from the white marker', 'Acceleration - First step quickness - Reaction time - Top speed', 3, 1, '6', '6', 'false', '2022-12-05 18:08:48', '2022-12-20 21:18:32', NULL, '24 meter dash_1660953730_1670503428.png', NULL),
(4, 'Soft Javelin Throw', 'Javlin', 'Cloud 8', 'JT', 4, 6, 2, '1.) Measure a length of string/ribbon and mark the 95th percentile distance with a red clip\r\n\r\n2.) Set the \\\"color spacer\\\" length to appropriate grade & age segment length\r\n\r\n3.) Place a blue clip \\\"color spacer\\\" length from the red color marker, closer to the start\r\n\r\n4.) Similarly place the remaining clips at \\\"color spacer\\\" increments (green, orange, purple, orange, yellow, pink, white) \r\n\r\n5.) Pull the string/ribbon straight from the start in the desired direction of the jump or throw\r\n\r\n6.) Place colored cones alongside the corresponding clip for greater visibility\r\n\r\n7.) Tester meets with group of participants(s)\r\n\r\n8.) Tester gives participants verbal instructions\r\n\r\n9.) Tester displays color scale chart\r\n\r\n10.) Tester gives participants white paper wristbands\r\n\r\n11.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Participants line up\r\n\r\n2.) Participants throws or jumps to the furthest color maker\\n\\n\r\n\r\nScoring \r\n1.) Tester notes last color marker that is surpassed by jump or throw\r\n\r\n2.) Tester presses corresponding color button on dashboard\r\n\r\n3.) App records, displays performance based on stored scoring tables\r\n\r\n4.) Tester raises corresponding color flag\r\n\r\n5.) Tester gives participant(s) corresponding color dot', 'Arm Strength - Core Strength - Hand Eye Coordnation - Kinetic Chain Power - Timing', 4, 1, '6', '1', 'false', '2022-12-05 18:11:18', '2023-04-06 16:58:50', NULL, 'javelin_1656319949_1657004566_1670503441.png', NULL),
(5, 'Octagon Speed Endurance', 'Octagon Speed', '8 Track', '00', 5, 5, 1, '1.) Place the setup disc in the middle of the running space\r\n\r\n2.) Secure the disc to prevent rotation or translation movement (for example with a weight, masking tape, or having a second person physically hold it down)\r\n\r\n3.) Pull the center setup string/ribbon straight along the white radial arm on the disc, and place the white cone at the 8  meter mark on the string\r\n\r\n4.) Repeat the cone placement for the other seven colors, creating an octagon shape\r\n\r\n5.) Runners start behind the red cone; the run consists of two counterclockwise circuits around the octagon\r\n\r\n6.) Tester meets with group of participants(s)\r\n\r\n7.) Tester gives participants verbal instructions\r\n\r\n8.) Tester displays color scale chart\r\n\r\n9.) Tester gives participants white paper wristbands\r\n\r\n10.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Tester opens app\n\n2.) Select the grade/gender subgroup on the app to get the appropriate 95th percentile finish time, the fixed time for the run\n\n3.) Participant lines up\n\n4.) Press Start button\n5.) App produces go audio signal\n\n6.) Participant runs at maximum speed\n\n7.) Participant runs around the color markers  the 8 color markers 2 times in counter clockwise direction\n\n8.) App produces audio stop signal at preset time (ex 15 seconds)\n\n1.) Tester notes last color marker passed before audio signal\n\n2.) Tester presses corresponding color button on dashboard\n\n3.) App records, displays performance\n\n4.) Tester raises corresponding color flag\n\n5.) Tester gives participant(s) corresponding color dot\n\n6.) Traditional timing: Stop the watch at the end of the second lap at the touching of the red color marker\n\n7.) The app will display the color score based on stored scoring tables\n\nSetup\n1.) Place the setup disc in the middle of the running space\n\n2.) Secure the disc to prevent rotation or translation movement (for example with a weight, masking tape, or having a second person physically hold it down)\n\n3.) Pull the center setup string/ribbon straight along the white radial arm on the disc, and place the white cone at the 8  meter mark on the string\n\n4.) Repeat the cone placement for the other seven colors, creating an octagon shape\n\n5.) Runners start behind the red cone; the run consists of two counterclockwise circuits around the octagon\n\n6.) Tester meets with group of participants(s)\n\n7.) Tester gives participants verbal instructions\n\n8.) Tester displays color scale chart\n\n9.) Tester gives participants white paper wristbands\n\n10.) Tester places 8 colored flags and color dots within reach or with helper', 'Running stride effiency - Speed endurance - Top end speed - Turn running', 5, 1, '6', '6', 'false', '2022-12-05 18:12:52', '2022-12-20 21:19:28', NULL, 'speed octagon_1658878743_1670503453.png', NULL),
(6, 'Overhead', 'Weight Throw', '8 Bell', 'OWT', 6, 4, 2, 'Setup\n1.) Measure a length of string/ribbon and mark the 95th percentile distance with a red clip\n\n2.) Set the \\\"color spacer\\\" length to appropriate grade & age segment length\n\n3.) Place a blue clip \\\"color spacer\\\" length from the red color marker, closer to the start\n\n4.) Similarly place the remaining clips at \\\"color spacer\\\" increments (green, orange, purple, orange, yellow, pink, white)\n\n5.) Pull the string/ribbon straight from the start in the desired direction of the jump or throw\n\n6.) Place colored cones alongside the corresponding clip for greater visibility\n\n7.) Tester meets with group of participants(s)\n\n8.) Tester gives participants verbal instructions\n\n9.) Tester displays color scale chart\n\n10.) Tester gives participants white paper wristbands\n\n11.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Participants line up\r\n\r\n2.) Participants throws or jumps to the furthest color maker\r\n\r\nScoring\r\n1.) Tester notes last color marker that is surpassed by jump or throw\r\n\r\n2.) Tester depresses corresponding color button on dashboard\r\n\r\n3.) App records, displays performance based on stored scoring tables\r\n\r\n4.) Tester raises corresponding color flag\r\n\r\n5.) Tester gives participant(s) corresponding color dot', 'Core strength - Full body power - Hand Eye Coordnation - Kinetic Chain power - Spatial awareness', 6, 1, '6', '1', 'false', '2022-12-05 18:14:41', '2023-04-06 16:58:29', NULL, 'old - overhead throw_1658878759_1670503467.png', NULL),
(7, '8 Mile Beeper', 'Beeper Test', '8 Mile', 'BT', 7, 7, 2, 'Setup\n1.) Set up two parallel lines (using gym or sports field lines and/or strings/ribbons)\n\n2.) Tester meets with group of participants(s)\n\n3.) Tester gives participants verbal instructions\n\n4.) Tester displays color flip chart\n\n5.) Tester gives participants white paper wristbands\n\n6.) Tester places 8 colored flags and color dots within reach or with helper', '1.) Participants line up\r\n\r\n2.) Select the grade/gender subgroup on the app to get the appropriate line spacing\r\n\r\n3.) The event consists of repeated cycles of a single back and forth run between the two lines\r\n\r\n4.) The participants start each cycle on an audible start signal; there will also be an audible stop signal\r\n\r\n5.) The time between the start and stop signals decreases after every 8 cycles Each cycle ends when the participant returns to the start\r\n\r\n6.) The cycles continue until the participant cannot return to the starting line before the audible stop signal on two consecutive cycles\r\n\r\nScoring\r\n1.) Tester notes when the participants cannot return to the starting line before the beep signal\r\n\r\n2.) Tester views the color flip chart and presses the corresponding color button on dashboard\r\n\r\n3.) App records performance\r\n\r\n4.) Tester gives participant(s) corresponding color dot', 'Aerobic endurance - Mental Strength - Pace judgement - Running effiency', 7, 1, '6', '1', 'false', '2022-12-05 18:16:07', '2022-12-30 21:14:59', NULL, '8 mile beeper test_1656319966_1670503488.png', NULL),
(8, '8-Point Obstacle Course', 'Obstacle Course', 'Crazy 8', 'OBC', 8, 8, 1, '1.) Set up two parallel lines (using gym or sports field lines and/or strings/ribbons)\n\n2.) Tester meets with group of participants(s)\n\n3.) Tester gives participants verbal instructions\n\n4.) Tester displays color flip chart\n\n5.) Tester gives participants white paper wristbands\n\n6.) Tester places 8 colored flags and color dots within reach or with helper\n\nSetup\n1.) Use measuring tape to mark start and finish 24 meters apart with white (start) and red (finish) color markers\n\n2.) Place a pink color marker one meter behind the start and a second pink color marker two meters behind the start for the figure 8 element\n\n3.) Place the eight yellow agility circles in a 2x4 array beginning one meter from the start; adjacent circles should be touching\n\n4.) Place the purple hoop holder and hoop five meters from the start\n\n5.) Place the two orange water jump markers eight and nine meters from the start, laying them perpendicular to the run direction\n\n6.) Place the two green markers 11 meters from the start and two meters from each other\n\n7.) Place the three blue hurdles 14, 16, and 18 meters from the start\n\n8.) Tester meets with a group of participants(s)\n\n9.) Tester gives participants verbal instructions\n\n10.) Tester displays color scale chart\n\n11.) Tester gives participants white paper wristbands\n\n12.) Tester places 8 colored flags and color dots within reach or with a helper', '1.) Participants line up at white color marker facing pink color marker\r\n\r\n2.) Tester selects the grade/gender subgroup on the app to get the appropriate 95th percentile finish time, the fixed time for the run\r\n\r\n3.) Tester starts the run with the app stopwatch\r\n\r\n4.) Participant starts at the white marker and faces the pink markers\r\n\r\n5.) Participant completes a figure 8 pattern around the pink markers, finishing the pattern at the start (and facing the finish line)\r\n\r\n6.) Participant steps through each yellow agility circle once, alternating legs each time\r\n\r\n7.) Participant runs through adjustable purple hoop\r\n\r\n8.) Participant jumps across the adjustable orange water jump markers\r\n\r\n9.) Participant touches each side-to-side green marker once\r\n\r\n10.) Participant jumps over each adjustable blue hurdle\r\n\r\n11.) Participant runs past the red finish marker\r\n\r\n\r\nScoring\r\n1.) Tester records the color score in the app as the last color obstacle completed when the fixed time signal is heard\r\n\r\n2.) Tester depresses corresponding color button on dashboard\r\n\r\n3.) App records, displays performance based on stored scoring tables\r\n\r\n4.) Tester raises corresponding color flag\r\n\r\n5.) Tester gives participant(s) corresponding color dot\r\n\r\n6.) Traditional timing: Stop the watch at the red marker finish line\r\n\r\n1.) Set up two parallel lines (using gym or sports field lines and/or strings/ribbons)\r\n\r\n2.) Tester meets with group of participants(s)\r\n\r\n3.) Tester gives participants verbal instructions\r\n\r\n4.) Tester displays color flip chart\r\n\r\n5.) Tester gives participants white paper wristbands\r\n\r\n6.) Tester places 8 colored flags and color dots within reach or with helper', 'Agility - Change of direction - Flexibility - Jumping abiliity - Quickness - Spatial awareness - Speed', 8, 1, '6', '6', 'false', '2022-12-05 18:17:22', '2023-03-01 20:36:45', NULL, 'obstacle course_1656319959_1670503544.png', 'sample_512kb_1677685005.mp4'),
(9, '8-Point Agility Octagon', '8 Mile', 'TJVT', 'AAL', -9, 9, 1, 'test', 'test', 'test', 4, 1, '6', '6', 'true', '2022-12-06 15:40:53', '2022-12-20 21:22:27', NULL, 'obstacle course_1656319959_1670503582.png', NULL),
(10, 'Grade Test', 'Ali', 'VAS', '44', -5, 1, 8, 'https://res.cloudinary.com/akbarchanna/image/upload/v1671447194/Spectrum-8/Spectrum%20Bug%20Images/image_2022_12_19T10_52_11_952Z_d7dxkr.png', 'https://res.cloudinary.com/akbarchanna/image/upload/v1671447194/Spectrum-8/Spectrum%20Bug%20Images/image_2022_12_19T10_52_11_952Z_d7dxkr.png', 'https://res.cloudinary.com/akbarchanna/image/upload/v1671447194/Spectrum-8/Spectrum%20Bug%20Images/image_2022_12_19T10_52_11_952Z_d7dxkr.png', 7, 1, '6', NULL, 'true', '2022-12-19 16:34:44', '2022-12-20 21:22:29', NULL, 'speed octagon_1658878743_1671449684.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_evaluates`
--

CREATE TABLE `assessment_evaluates` (
  `id` int(10) UNSIGNED NOT NULL,
  `AssessmentID` int(10) UNSIGNED DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_evaluates`
--

INSERT INTO `assessment_evaluates` (`id`, `AssessmentID`, `Name`, `Weight`, `Sort`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Agility', 1, 1, 1, '6', '6', 'false', '2022-12-05 18:53:37', '2022-12-15 00:37:24', NULL),
(2, 1, 'Change Of Direction', 1, 2, 1, '6', '6', 'false', '2022-12-06 15:42:06', '2022-12-15 01:05:14', NULL),
(3, 1, 'Reaction Time', 1, 3, 1, '6', '6', 'false', '2022-12-07 12:59:20', '2022-12-15 01:05:31', NULL),
(4, 1, 'Spatial Awareness', 1, 4, 1, '6', '6', 'false', '2022-12-07 12:59:38', '2022-12-15 01:05:41', NULL),
(5, 1, 'Thinking On Feet', 1, 5, 1, '6', '6', 'false', '2022-12-07 12:59:50', '2022-12-15 01:05:55', NULL),
(6, 2, 'Balance', 1, 1, 1, '6', NULL, 'false', '2022-12-15 00:40:41', '2022-12-15 00:40:41', NULL),
(7, 2, 'Lower Body Power', 1, 2, 1, '6', '6', 'false', '2022-12-15 00:41:37', '2022-12-15 01:06:13', NULL),
(8, 2, 'Power Symmetry', 1, 3, 1, '6', NULL, 'false', '2022-12-15 00:42:19', '2022-12-15 00:42:19', NULL),
(9, 2, 'Timing', 1, 4, 1, '6', NULL, 'false', '2022-12-15 00:42:46', '2022-12-15 00:42:46', NULL),
(10, 3, 'Acceleration', 1, 1, 1, '6', '6', 'false', '2022-12-15 00:44:04', '2023-01-03 18:52:44', NULL),
(11, 3, 'First Step Quickness', 1, 2, 1, '6', '6', 'false', '2022-12-15 00:44:46', '2022-12-15 01:06:33', NULL),
(12, 3, 'Reaction Time', 1, 3, 1, '6', '6', 'false', '2022-12-15 00:45:09', '2022-12-15 01:06:45', NULL),
(13, 3, 'Top Speed', 1, 4, 1, '6', NULL, 'false', '2022-12-15 00:45:54', '2022-12-15 00:45:54', NULL),
(14, 4, 'Arm Strength', 1, 1, 1, '6', NULL, 'false', '2022-12-15 00:46:28', '2022-12-15 00:46:28', NULL),
(15, 4, 'Core Strength', 1, 2, 1, '6', NULL, 'false', '2022-12-15 00:47:04', '2022-12-15 00:47:04', NULL),
(16, 4, 'Hand Eye Coordination', 1, 3, 1, '6', NULL, 'false', '2022-12-15 00:47:38', '2022-12-15 00:47:38', NULL),
(17, 4, 'Kinetic Chain Power', 1, 4, 1, '6', NULL, 'false', '2022-12-15 00:48:21', '2022-12-15 00:48:21', NULL),
(18, 4, 'Timing', 1, 5, 1, '6', NULL, 'false', '2022-12-15 00:48:33', '2022-12-15 00:48:33', NULL),
(19, 5, 'Running Stride Efficiency', 1, 1, 1, '6', '6', 'false', '2022-12-15 00:49:59', '2022-12-15 01:07:09', NULL),
(20, 5, 'Speed Endurance', 1, 2, 1, '6', '6', 'false', '2022-12-15 00:50:31', '2022-12-15 01:07:33', NULL),
(21, 5, 'Top End Speed', 1, 3, 1, '6', '6', 'false', '2022-12-15 00:50:55', '2022-12-15 01:07:54', NULL),
(22, 5, 'Turn Running', 1, 4, 1, '6', '6', 'false', '2022-12-15 00:51:36', '2022-12-15 01:08:12', NULL),
(23, 6, 'Core Strength', 1, 1, 1, '6', NULL, 'false', '2022-12-15 00:52:41', '2022-12-15 00:52:41', NULL),
(24, 6, 'Full Body Power', 1, 2, 1, '6', '6', 'false', '2022-12-15 00:53:01', '2022-12-15 01:08:41', NULL),
(25, 6, 'Hand Eye Coordination', 1, 3, 1, '6', '6', 'false', '2022-12-15 00:53:33', '2022-12-15 01:10:57', NULL),
(26, 6, 'Kinetic Chain Power', 1, 4, 1, '6', '6', 'false', '2022-12-15 00:53:55', '2022-12-15 01:08:59', NULL),
(27, 6, 'Spatial Awareness', 1, 5, 1, '6', '6', 'false', '2022-12-15 00:54:19', '2022-12-15 01:09:09', NULL),
(28, 7, 'Aerobic Endurance', 1, 1, 1, '6', '6', 'false', '2022-12-15 00:55:27', '2022-12-15 01:09:26', NULL),
(29, 7, 'Mental Strength', 1, 2, 1, '6', NULL, 'false', '2022-12-15 00:55:50', '2022-12-15 00:55:50', NULL),
(30, 7, 'Pace Judgement', 1, 3, 1, '6', '6', 'false', '2022-12-15 00:56:10', '2022-12-15 01:09:41', NULL),
(31, 7, 'Running Effiency', 1, 4, 1, '6', '6', 'false', '2022-12-15 00:56:33', '2022-12-15 01:09:55', NULL),
(32, 8, 'Agility', 1, 1, 1, '6', NULL, 'false', '2022-12-15 00:57:22', '2022-12-15 00:57:22', NULL),
(33, 8, 'Change Of Direction', 1, 2, 1, '6', '6', 'false', '2022-12-15 00:59:08', '2022-12-15 01:10:08', NULL),
(34, 8, 'Flexibility', 1, 3, 1, '6', '6', 'false', '2022-12-15 00:59:53', '2022-12-15 01:03:04', NULL),
(35, 8, 'Jumping Ability', 1, 4, 1, '6', '6', 'false', '2022-12-15 01:00:24', '2022-12-15 01:10:20', NULL),
(36, 8, 'Quickness', 1, 5, 1, '6', '6', 'false', '2022-12-15 01:01:04', '2022-12-15 01:03:56', NULL),
(37, 8, 'Spatial Awareness', 1, 6, 1, '6', '6', 'false', '2022-12-15 01:01:38', '2022-12-15 01:04:55', NULL),
(38, 8, 'Speed', 1, 7, 1, '6', '6', 'false', '2022-12-15 01:02:36', '2022-12-15 01:04:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_results`
--

CREATE TABLE `assessment_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `EventID` int(10) UNSIGNED DEFAULT NULL,
  `ParticipantID` int(10) UNSIGNED DEFAULT NULL,
  `AssessmentID` int(10) UNSIGNED DEFAULT NULL,
  `GradeID` int(10) UNSIGNED DEFAULT NULL,
  `GenderID` int(10) UNSIGNED DEFAULT NULL,
  `ColorID` int(10) UNSIGNED DEFAULT NULL,
  `Results` varchar(25) DEFAULT NULL,
  `DTRecorded` datetime DEFAULT NULL,
  `Attempt` int(11) DEFAULT NULL,
  `Percent` double(8,2) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_results`
--

INSERT INTO `assessment_results` (`id`, `EventID`, `ParticipantID`, `AssessmentID`, `GradeID`, `GenderID`, `ColorID`, `Results`, `DTRecorded`, `Attempt`, `Percent`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 00:06:11', '2022-12-08 00:06:11', NULL),
(2, 6, 2, 2, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 8.00, 1, '4', NULL, 'false', '2022-12-08 00:09:54', '2022-12-08 00:09:54', NULL),
(3, 6, 7, 1, 1, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '15', NULL, 'false', '2022-12-08 00:39:56', '2022-12-19 14:06:42', NULL),
(4, 6, 7, 4, 1, 2, 1, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '15', NULL, 'false', '2022-12-08 00:40:27', '2022-12-08 00:40:27', NULL),
(5, 6, 7, 1, 1, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '15', NULL, 'false', '2022-12-08 00:46:37', '2022-12-08 00:46:37', NULL),
(6, 8, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 02:35:50', '2022-12-08 02:35:50', NULL),
(7, 8, 3, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 02:36:00', '2022-12-08 02:36:00', NULL),
(8, 8, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 07:01:11', '2022-12-08 07:01:11', NULL),
(9, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 12:02:05', '2022-12-08 12:02:05', NULL),
(10, 8, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 12:47:50', '2022-12-08 12:47:50', NULL),
(11, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 13:09:53', '2022-12-08 13:09:53', NULL),
(12, 6, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 13:14:12', '2022-12-08 13:14:12', NULL),
(13, 6, 2, 4, 5, 2, 1, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-08 13:19:16', '2022-12-08 13:19:16', NULL),
(14, 6, 3, 4, 5, 2, 1, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-08 13:19:21', '2022-12-08 13:19:21', NULL),
(15, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-08 13:45:59', '2022-12-08 13:45:59', NULL),
(16, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 7, 5.00, 1, '4', NULL, 'false', '2022-12-09 19:32:40', '2022-12-09 19:32:40', NULL),
(17, 6, 3, 2, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 8.00, 1, '4', NULL, 'false', '2022-12-09 19:34:03', '2022-12-09 19:34:03', NULL),
(18, 6, 2, 4, 5, 2, 1, '25', '2012-10-22 00:00:00', 2, 25.00, 1, '4', NULL, 'false', '2022-12-09 19:37:51', '2022-12-09 19:37:51', NULL),
(19, 6, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 4, 5.00, 1, '4', NULL, 'false', '2022-12-09 23:00:08', '2022-12-09 23:00:08', NULL),
(20, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 8, 5.00, 1, '4', NULL, 'false', '2022-12-09 23:00:56', '2022-12-09 23:00:56', NULL),
(21, 6, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 5, 5.00, 1, '4', NULL, 'false', '2022-12-10 00:02:19', '2022-12-10 00:02:19', NULL),
(22, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 9, 5.00, 1, '4', NULL, 'false', '2022-12-10 00:08:19', '2022-12-10 00:08:19', NULL),
(23, 6, 2, 6, 5, 2, 8, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-10 00:19:59', '2022-12-10 00:19:59', NULL),
(24, 6, 2, 7, 5, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-10 00:25:06', '2022-12-10 00:25:06', NULL),
(25, 6, 3, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-10 04:38:30', '2022-12-10 04:38:30', NULL),
(26, 6, 3, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 25.00, 1, '4', NULL, 'false', '2022-12-10 04:39:26', '2022-12-10 04:39:26', NULL),
(27, 6, 3, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 3, 25.00, 1, '4', NULL, 'false', '2022-12-10 04:39:26', '2022-12-10 04:39:26', NULL),
(28, 6, 2, 3, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-10 04:40:03', '2022-12-10 04:40:03', NULL),
(29, 6, 3, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 4, 25.00, 1, '4', NULL, 'false', '2022-12-10 04:40:42', '2022-12-10 04:40:42', NULL),
(30, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 10, 5.00, 1, '4', NULL, 'false', '2022-12-10 04:42:50', '2022-12-10 04:42:50', NULL),
(31, 6, 2, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 11, 5.00, 1, '4', NULL, 'false', '2022-12-10 04:45:48', '2022-12-10 04:45:48', NULL),
(32, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 12, 5.00, 1, '4', NULL, 'false', '2022-12-10 04:47:16', '2022-12-10 04:47:16', NULL),
(33, 6, 3, 2, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 8.00, 1, '4', NULL, 'false', '2022-12-10 05:07:35', '2022-12-10 05:07:35', NULL),
(34, 6, 3, 4, 6, 2, 1, '25', '2012-10-22 00:00:00', 2, 25.00, 1, '4', NULL, 'false', '2022-12-10 05:07:59', '2022-12-10 05:07:59', NULL),
(35, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 13, 5.00, 1, '4', NULL, 'false', '2022-12-10 05:14:10', '2022-12-10 05:14:10', NULL),
(36, 6, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 6, 5.00, 1, '4', NULL, 'false', '2022-12-10 05:19:29', '2022-12-10 05:19:29', NULL),
(37, 6, 3, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 5, 25.00, 1, '4', NULL, 'false', '2022-12-10 20:17:26', '2022-12-10 20:17:26', NULL),
(38, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 14, 5.00, 1, '4', NULL, 'false', '2022-12-10 20:17:59', '2022-12-10 20:17:59', NULL),
(39, 6, 3, 3, 5, 1, 1, '25', '2012-10-22 00:00:00', 6, 25.00, 1, '4', NULL, 'false', '2022-12-11 05:30:20', '2022-12-11 05:30:20', NULL),
(40, 6, 3, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 7, 5.00, 1, '4', NULL, 'false', '2022-12-12 04:18:52', '2022-12-12 04:18:52', NULL),
(41, 6, 3, 4, 6, 2, 1, '25', '2012-10-22 00:00:00', 3, 25.00, 1, '4', NULL, 'false', '2022-12-12 05:35:35', '2022-12-12 05:35:35', NULL),
(42, 1, 2, 1, 5, 1, 2, '25', '2012-10-22 00:00:00', 15, 5.00, 1, '4', NULL, 'false', '2022-12-12 19:46:05', '2022-12-14 18:46:00', NULL),
(43, 1, 2, 7, 5, 1, 2, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2022-12-12 19:46:32', '2022-12-12 19:46:32', NULL),
(44, 1, 2, 3, 5, 1, 3, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2022-12-12 22:58:17', '2022-12-13 18:31:58', NULL),
(45, 1, 2, 2, 5, 1, 2, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2022-12-12 22:59:04', '2022-12-13 18:31:58', NULL),
(46, 1, 2, 3, 5, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'true', '2022-12-12 23:04:28', '2022-12-13 18:32:47', '2022-12-13 18:32:47'),
(47, 6, 2, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 16, 5.00, 1, '4', NULL, 'true', '2022-12-13 18:29:04', '2022-12-13 18:32:38', '2022-12-13 18:32:38'),
(48, 8, 3, 4, 6, 2, 1, '25', '2012-10-22 00:00:00', 4, 25.00, 1, '4', NULL, 'false', '2022-12-13 18:37:18', '2022-12-20 21:02:58', NULL),
(49, 1, 3, 4, 6, 3, 2, '25', '2012-10-22 00:00:00', 5, 5.00, 1, '4', NULL, 'false', '2022-12-14 07:00:00', '2022-12-19 13:19:31', NULL),
(50, 1, 2, 2, 5, 1, 1, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2022-12-16 02:25:27', '2022-12-16 02:25:27', NULL),
(51, 1, 2, 2, 5, 1, 1, '25', '2012-10-22 00:00:00', 4, 5.00, 1, '4', NULL, 'false', '2022-12-16 02:25:48', '2022-12-19 13:19:55', NULL),
(52, 1, 2, 6, 5, 2, 6, '25', '2012-10-22 00:00:00', 2, 25.00, 1, '4', NULL, 'false', '2022-12-16 03:45:25', '2022-12-19 13:19:51', NULL),
(53, 1, 3, 6, 6, 2, 2, '25', '2012-10-22 00:00:00', 1, 25.00, 1, '4', NULL, 'false', '2022-12-19 03:57:12', '2022-12-19 13:37:16', NULL),
(54, 1, 10, 4, 5, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-19 03:57:50', '2022-12-19 13:19:39', NULL),
(55, 1, 10, 2, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-19 03:58:33', '2022-12-19 13:31:12', NULL),
(56, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '32', NULL, 'false', '2022-12-28 17:03:12', '2022-12-28 17:03:12', NULL),
(57, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 2, 14.00, 1, '32', NULL, 'false', '2022-12-28 17:04:49', '2022-12-28 17:04:49', NULL),
(58, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 3, 14.00, 1, '32', NULL, 'false', '2022-12-28 17:06:18', '2022-12-28 17:06:18', NULL),
(59, 1, 34, 2, 11, 2, 5, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '32', NULL, 'false', '2022-12-28 17:07:20', '2022-12-28 17:07:20', NULL),
(60, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 4, 14.00, 1, '32', NULL, 'false', '2022-12-28 17:10:06', '2022-12-28 17:10:06', NULL),
(61, 1, 33, 2, 12, 1, 5, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '32', NULL, 'false', '2022-12-28 17:12:07', '2022-12-28 17:12:07', NULL),
(62, 1, 34, 4, 11, 2, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '32', NULL, 'false', '2022-12-28 17:14:42', '2022-12-28 17:14:42', NULL),
(63, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 5, 14.00, 1, '32', NULL, 'false', '2022-12-28 17:15:44', '2022-12-28 17:15:44', NULL),
(64, 1, 30, 6, 12, 1, 4, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '32', NULL, 'false', '2022-12-28 18:36:36', '2022-12-28 18:36:36', NULL),
(65, 1, 32, 4, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '32', NULL, 'false', '2022-12-28 18:37:06', '2022-12-28 18:37:06', NULL),
(66, 1, 22, 2, 9, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '31', NULL, 'false', '2022-12-28 18:58:23', '2022-12-28 18:58:23', NULL),
(67, 1, 28, 2, 9, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '31', NULL, 'false', '2022-12-28 19:15:52', '2022-12-28 19:15:52', NULL),
(68, 1, 28, 4, 12, 2, 8, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '31', NULL, 'false', '2022-12-28 19:23:40', '2022-12-28 19:23:40', NULL),
(69, 1, 19, 6, 9, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '31', NULL, 'false', '2022-12-28 19:24:29', '2022-12-28 19:24:29', NULL),
(70, 1, 26, 6, 12, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-29 19:59:41', '2022-12-29 19:59:41', NULL),
(71, 1, 27, 6, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2022-12-29 20:00:00', '2022-12-29 20:00:00', NULL),
(72, 1, 37, 4, 9, 2, 7, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '34', NULL, 'false', '2022-12-30 18:47:16', '2022-12-30 18:47:16', NULL),
(73, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '4', NULL, 'false', '2022-12-30 20:08:03', '2022-12-30 20:08:03', NULL),
(74, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '4', NULL, 'false', '2022-12-30 20:10:46', '2022-12-30 20:10:46', NULL),
(75, 1, 26, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '4', NULL, 'false', '2022-12-30 20:11:05', '2022-12-30 20:11:05', NULL),
(76, 1, 25, 3, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '4', NULL, 'false', '2022-12-30 20:13:13', '2022-12-30 20:13:13', NULL),
(77, 1, 36, 1, 9, 1, 4, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '35', NULL, 'false', '2023-01-03 17:54:36', '2023-01-03 17:54:36', NULL),
(78, 1, 36, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '35', NULL, 'false', '2023-01-03 17:55:31', '2023-01-03 17:55:31', NULL),
(79, 1, 36, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '35', NULL, 'false', '2023-01-03 17:56:31', '2023-01-03 17:56:31', NULL),
(80, 1, 36, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '35', NULL, 'false', '2023-01-03 17:58:35', '2023-01-03 17:58:35', NULL),
(81, 1, 38, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '35', NULL, 'false', '2023-01-03 18:03:33', '2023-01-03 18:03:33', NULL),
(82, 1, 38, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '35', NULL, 'false', '2023-01-03 18:04:17', '2023-01-03 18:04:17', NULL),
(83, 1, 38, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '35', NULL, 'false', '2023-01-03 18:04:42', '2023-01-03 18:04:42', NULL),
(84, 1, 36, 1, 6, 1, 1, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '35', NULL, 'false', '2023-01-03 18:05:11', '2023-01-03 18:05:11', NULL),
(85, 1, 36, 8, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '35', NULL, 'false', '2023-01-03 18:05:40', '2023-01-03 18:05:40', NULL),
(86, 1, 38, 7, 6, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:22:10', '2023-01-03 19:22:10', NULL),
(87, 1, 38, 7, 6, 1, 7, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:22:32', '2023-01-03 19:22:32', NULL),
(88, 1, 36, 7, 6, 1, 8, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:22:37', '2023-01-03 19:22:37', NULL),
(89, 1, 38, 8, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '35', NULL, 'false', '2023-01-03 19:22:59', '2023-01-03 19:22:59', NULL),
(90, 1, 36, 8, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 14.00, 1, '35', NULL, 'false', '2023-01-03 19:23:10', '2023-01-03 19:23:10', NULL),
(91, 1, 38, 6, 6, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:23:30', '2023-01-03 19:23:30', NULL),
(92, 1, 38, 5, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:24:01', '2023-01-03 19:24:01', NULL),
(93, 1, 38, 5, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:25:13', '2023-01-03 19:25:13', NULL),
(94, 1, 36, 5, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:25:43', '2023-01-03 19:25:43', NULL),
(95, 1, 38, 5, 6, 1, 1, '25', '2012-10-22 00:00:00', 3, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:26:04', '2023-01-03 19:26:04', NULL),
(96, 1, 36, 5, 6, 1, 8, '25', '2012-10-22 00:00:00', 2, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:27:35', '2023-01-03 19:27:35', NULL),
(97, 1, 38, 4, 6, 1, 5, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:28:19', '2023-01-03 19:28:19', NULL),
(98, 1, 36, 4, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:28:28', '2023-01-03 19:28:28', NULL),
(99, 1, 38, 5, 6, 1, 1, '25', '2012-10-22 00:00:00', 4, 24.00, 1, '35', NULL, 'false', '2023-01-03 19:28:49', '2023-01-03 19:28:49', NULL),
(100, 1, 36, 3, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '35', NULL, 'false', '2023-01-03 19:29:28', '2023-01-03 19:29:28', NULL),
(101, 1, 38, 3, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '35', NULL, 'false', '2023-01-03 19:31:26', '2023-01-03 19:31:26', NULL),
(102, 1, 38, 2, 6, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:32:20', '2023-01-03 19:32:20', NULL),
(103, 1, 36, 2, 6, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '35', NULL, 'false', '2023-01-03 19:32:25', '2023-01-03 19:32:25', NULL),
(104, 1, 25, 1, 5, 1, 3, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '4', NULL, 'false', '2023-01-04 01:54:39', '2023-01-04 01:54:39', NULL),
(105, 1, 27, 1, 5, 1, 6, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '4', NULL, 'false', '2023-01-04 01:55:15', '2023-01-04 01:55:15', NULL),
(106, 1, 27, 4, 8, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-04 01:56:00', '2023-01-04 01:56:00', NULL),
(107, 1, 27, 2, 8, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-04 04:48:13', '2023-01-04 04:48:13', NULL),
(108, 1, 27, 2, 8, 1, 3, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-04 04:48:51', '2023-01-04 04:48:51', NULL),
(109, 1, 38, 7, 6, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '35', NULL, 'false', '2023-01-04 15:26:56', '2023-01-04 15:26:56', NULL),
(110, 1, 36, 7, 6, 1, 5, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '35', NULL, 'false', '2023-01-04 15:27:07', '2023-01-04 15:27:07', NULL),
(111, 1, 38, 3, 6, 1, 1, '25', '2012-10-22 00:00:00', 2, 4.00, 1, '35', NULL, 'false', '2023-01-04 15:30:05', '2023-01-04 15:30:05', NULL),
(112, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '41', NULL, 'false', '2023-01-04 16:06:49', '2023-01-04 16:06:49', NULL),
(113, 1, 39, 2, 12, 1, 8, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '41', NULL, 'false', '2023-01-04 16:08:30', '2023-01-04 16:08:30', NULL),
(114, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '41', NULL, 'false', '2023-01-04 16:20:11', '2023-01-04 16:20:11', NULL),
(115, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '41', NULL, 'false', '2023-01-04 16:29:50', '2023-01-04 16:29:50', NULL),
(116, 1, 40, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '41', NULL, 'false', '2023-01-04 17:10:29', '2023-01-04 17:10:29', NULL),
(117, 1, 40, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '41', NULL, 'false', '2023-01-04 17:14:21', '2023-01-04 17:14:21', NULL),
(118, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '41', NULL, 'false', '2023-01-04 17:17:32', '2023-01-04 17:17:32', NULL),
(119, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '41', NULL, 'false', '2023-01-04 17:34:13', '2023-01-04 17:34:13', NULL),
(120, 1, 39, 3, 12, 1, 3, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '41', NULL, 'false', '2023-01-04 17:35:11', '2023-01-04 17:35:11', NULL),
(121, 1, 39, 4, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '41', NULL, 'false', '2023-01-04 17:38:44', '2023-01-04 17:38:44', NULL),
(122, 1, 40, 5, 9, 1, 2, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '41', NULL, 'false', '2023-01-04 17:40:04', '2023-01-04 17:40:04', NULL),
(123, 1, 40, 7, 9, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '41', NULL, 'false', '2023-01-04 17:44:11', '2023-01-04 17:44:11', NULL),
(124, 1, 39, 4, 12, 1, 4, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '41', NULL, 'false', '2023-01-04 17:53:42', '2023-01-04 17:53:42', NULL),
(125, 1, 40, 2, 9, 1, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '41', NULL, 'false', '2023-01-04 17:54:36', '2023-01-04 17:54:36', NULL),
(126, 1, 39, 8, 12, 1, 3, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '41', NULL, 'false', '2023-01-04 17:56:07', '2023-01-04 17:56:07', NULL),
(127, 1, 39, 4, 12, 1, 4, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '41', NULL, 'false', '2023-01-04 18:22:45', '2023-01-04 18:22:45', NULL),
(128, 1, 27, 2, 8, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-05 08:49:43', '2023-01-05 08:49:43', NULL),
(129, 1, 27, 8, 8, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '4', NULL, 'false', '2023-01-05 10:02:48', '2023-01-05 10:02:48', NULL),
(130, 1, 25, 2, 5, 1, 7, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-06 04:15:07', '2023-01-06 04:15:07', NULL),
(131, 1, 25, 2, 5, 1, 2, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-06 04:16:18', '2023-01-06 04:16:18', NULL),
(132, 1, 26, 2, 12, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-06 04:17:01', '2023-01-06 04:17:01', NULL),
(133, 1, 25, 7, 5, 1, 7, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-06 09:41:57', '2023-01-06 09:41:57', NULL),
(134, 1, 25, 4, 5, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-06 09:42:38', '2023-01-06 09:42:38', NULL),
(135, 1, 25, 3, 5, 1, 8, '25', '2012-10-22 00:00:00', 2, 4.00, 1, '4', NULL, 'false', '2023-01-06 09:43:28', '2023-01-06 09:43:28', NULL),
(136, 1, 27, 3, 5, 1, 6, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '4', NULL, 'false', '2023-01-06 09:44:18', '2023-01-06 09:44:18', NULL),
(137, 1, 27, 2, 8, 1, 2, '25', '2012-10-22 00:00:00', 4, 5.00, 1, '4', NULL, 'false', '2023-01-08 17:39:58', '2023-01-08 17:39:58', NULL),
(138, 1, 25, 3, 5, 1, 8, '25', '2012-10-22 00:00:00', 3, 4.00, 1, '4', NULL, 'false', '2023-01-09 10:27:09', '2023-01-09 10:27:09', NULL),
(139, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '4', NULL, 'false', '2023-01-09 20:02:25', '2023-01-09 20:02:25', NULL),
(140, 1, 26, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '4', NULL, 'false', '2023-01-09 20:02:54', '2023-01-09 20:02:54', NULL),
(141, 1, 27, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '4', NULL, 'false', '2023-01-09 20:03:33', '2023-01-09 20:03:33', NULL),
(142, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '4', NULL, 'false', '2023-01-09 20:06:05', '2023-01-09 20:06:05', NULL),
(143, 1, 27, 3, 8, 1, 7, '25', '2012-10-22 00:00:00', 2, 4.00, 1, '4', NULL, 'false', '2023-01-09 23:12:53', '2023-01-09 23:12:53', NULL),
(144, 1, 25, 3, 8, 1, 3, '25', '2012-10-22 00:00:00', 4, 4.00, 1, '4', NULL, 'false', '2023-01-09 23:14:08', '2023-01-09 23:14:08', NULL),
(145, 1, 42, 8, 2, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '42', NULL, 'false', '2023-01-10 13:03:15', '2023-01-10 13:03:15', NULL),
(146, 1, 39, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 6, 16.00, 1, '42', NULL, 'false', '2023-01-10 13:45:22', '2023-01-10 13:45:22', NULL),
(147, 1, 30, 1, 12, 1, 2, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 15:13:04', '2023-01-10 15:13:04', NULL),
(148, 1, 30, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '43', NULL, 'false', '2023-01-10 15:38:07', '2023-01-10 15:38:07', NULL),
(149, 1, 30, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:08:15', '2023-01-10 16:08:15', NULL),
(150, 1, 1, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:12:00', '2023-01-10 16:12:00', NULL),
(151, 1, 30, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:14:49', '2023-01-10 16:14:49', NULL),
(152, 1, 4, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:15:01', '2023-01-10 16:15:01', NULL),
(153, 1, 5, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:15:12', '2023-01-10 16:15:12', NULL),
(154, 1, 13, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:15:30', '2023-01-10 16:15:30', NULL),
(155, 1, 17, 1, 12, 1, 2, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:15:57', '2023-01-10 16:15:57', NULL),
(156, 1, 32, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:16:13', '2023-01-10 16:16:13', NULL),
(157, 1, 1, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:16:49', '2023-01-10 16:16:49', NULL),
(158, 1, 1, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:24:35', '2023-01-10 16:24:35', NULL),
(159, 1, 5, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:24:45', '2023-01-10 16:24:45', NULL),
(160, 1, 13, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '43', NULL, 'false', '2023-01-10 16:24:56', '2023-01-10 16:24:56', NULL),
(161, 1, 30, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '43', NULL, 'false', '2023-01-10 17:16:46', '2023-01-10 17:16:46', NULL),
(162, 1, 30, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 6, 16.00, 1, '43', NULL, 'false', '2023-01-10 17:25:53', '2023-01-10 17:25:53', NULL),
(163, 1, 40, 1, 9, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '42', NULL, 'false', '2023-01-11 04:35:53', '2023-01-11 04:35:53', NULL),
(164, 1, 41, 4, 5, 2, 7, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-11 04:37:26', '2023-01-11 04:37:26', NULL),
(165, 1, 27, 4, 8, 1, 2, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-11 05:45:02', '2023-01-11 05:45:02', NULL),
(166, 1, 27, 6, 8, 1, 2, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-11 05:45:43', '2023-01-11 05:45:43', NULL),
(167, 1, 27, 6, 8, 1, 4, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-11 05:46:29', '2023-01-11 05:46:29', NULL),
(168, 1, 27, 7, 8, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-11 05:47:05', '2023-01-11 05:47:05', NULL),
(169, 1, 27, 5, 8, 1, 1, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '4', NULL, 'false', '2023-01-11 05:47:58', '2023-01-11 05:47:58', NULL),
(170, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '44', NULL, 'false', '2023-01-11 13:44:33', '2023-01-11 13:44:33', NULL),
(171, 1, 21, 2, 9, 1, 7, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '44', NULL, 'false', '2023-01-11 13:49:42', '2023-01-11 13:49:42', NULL),
(172, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '44', NULL, 'false', '2023-01-11 13:50:29', '2023-01-11 13:50:29', NULL),
(173, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '44', NULL, 'false', '2023-01-11 13:50:53', '2023-01-11 13:50:53', NULL),
(174, 1, 25, 1, 5, 1, 8, '25', '2012-10-22 00:00:00', 6, 16.00, 1, '4', NULL, 'false', '2023-01-11 16:03:07', '2023-01-11 16:03:07', NULL),
(175, 1, 41, 3, 5, 1, 7, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '42', NULL, 'false', '2023-01-12 04:30:07', '2023-01-12 04:30:07', NULL),
(176, 1, 42, 6, 5, 2, 5, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-12 19:48:40', '2023-01-12 19:48:40', NULL),
(177, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '44', NULL, 'false', '2023-01-12 19:54:05', '2023-01-12 19:54:05', NULL),
(178, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '44', NULL, 'false', '2023-01-12 19:54:53', '2023-01-12 19:54:53', NULL),
(179, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 6, 16.00, 1, '44', NULL, 'false', '2023-01-12 20:10:04', '2023-01-12 20:10:04', NULL),
(180, 1, 20, 1, 10, 1, 1, '25', '2012-10-22 00:00:00', 7, 16.00, 1, '44', NULL, 'false', '2023-01-12 20:10:35', '2023-01-12 20:10:35', NULL),
(181, 1, 20, 2, 10, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '44', NULL, 'false', '2023-01-12 20:19:05', '2023-01-12 20:19:05', NULL),
(182, 1, 20, 2, 10, 1, 7, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '44', NULL, 'false', '2023-01-12 20:23:11', '2023-01-12 20:23:11', NULL),
(183, 1, 40, 6, 9, 1, 8, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-13 03:43:51', '2023-01-13 03:43:51', NULL),
(184, 1, 34, 8, 11, 1, 1, '25', '2012-10-22 00:00:00', 6, 14.00, 1, '44', NULL, 'false', '2023-01-17 13:05:13', '2023-01-17 13:05:13', NULL),
(185, 1, 12, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '45', NULL, 'false', '2023-01-17 16:31:23', '2023-01-17 16:31:23', NULL),
(186, 1, 20, 2, 10, 1, 2, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '45', NULL, 'false', '2023-01-17 16:35:11', '2023-01-17 16:35:11', NULL),
(187, 1, 33, 5, 12, 1, 4, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '45', NULL, 'false', '2023-01-17 16:46:26', '2023-01-17 16:46:26', NULL),
(188, 1, 24, 5, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '45', NULL, 'false', '2023-01-17 16:49:09', '2023-01-17 16:49:09', NULL),
(189, 1, 12, 5, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 24.00, 1, '45', NULL, 'false', '2023-01-17 16:58:26', '2023-01-17 16:58:26', NULL),
(190, 1, 33, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '45', NULL, 'false', '2023-01-17 17:09:06', '2023-01-17 17:09:06', NULL),
(191, 1, 20, 3, 10, 1, 1, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '45', NULL, 'false', '2023-01-17 17:14:09', '2023-01-17 17:14:09', NULL),
(192, 1, 24, 1, 5, 1, 2, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '45', NULL, 'false', '2023-01-17 17:28:16', '2023-01-17 17:28:16', NULL),
(193, 1, 33, 4, 12, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '45', NULL, 'false', '2023-01-17 17:45:29', '2023-01-17 17:45:29', NULL),
(194, 1, 12, 8, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '45', NULL, 'false', '2023-01-17 17:47:10', '2023-01-17 17:47:10', NULL),
(195, 1, 24, 8, 5, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '45', NULL, 'false', '2023-01-17 18:11:16', '2023-01-17 18:11:16', NULL),
(196, 1, 33, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '45', NULL, 'false', '2023-01-17 18:14:09', '2023-01-17 18:14:09', NULL),
(197, 1, 24, 8, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 14.00, 1, '45', NULL, 'false', '2023-01-17 18:14:47', '2023-01-17 18:14:47', NULL),
(198, 1, 31, 3, 12, 1, 6, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '45', NULL, 'false', '2023-01-19 15:17:48', '2023-01-19 15:17:48', NULL),
(199, 1, 40, 2, 9, 1, 3, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '42', NULL, 'false', '2023-01-20 03:36:03', '2023-01-20 03:36:03', NULL),
(200, 1, 41, 6, 5, 2, 1, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-20 03:55:15', '2023-01-20 03:55:15', NULL),
(201, 1, 40, 6, 5, 2, 6, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '42', NULL, 'false', '2023-01-20 03:59:37', '2023-01-20 03:59:37', NULL),
(202, 1, 40, 4, 9, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-20 06:16:33', '2023-01-20 06:16:33', NULL),
(203, 1, 42, 1, 2, 1, 3, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '46', NULL, 'false', '2023-01-20 14:58:11', '2023-01-20 14:58:11', NULL),
(204, 1, 42, 1, 2, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '46', NULL, 'false', '2023-01-20 14:58:40', '2023-01-20 14:58:40', NULL),
(205, 1, 25, 1, 5, 1, 7, '25', '2012-10-22 00:00:00', 7, 16.00, 1, '4', NULL, 'false', '2023-01-20 16:44:14', '2023-01-20 16:44:14', NULL),
(206, 1, 46, 3, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '48', NULL, 'false', '2023-01-20 17:13:40', '2023-01-20 17:13:40', NULL),
(207, 1, 1, 1, 1, 1, 1, '25', '2012-10-22 00:12:12', 4, 2.00, 1, '48', NULL, 'false', '2023-01-20 18:57:59', '2023-01-20 18:57:59', NULL),
(208, 1, 46, 1, 12, 1, 8, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:33:11', '2023-01-20 19:33:11', NULL),
(209, 1, 46, 1, 12, 1, 8, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:33:12', '2023-01-20 19:33:12', NULL),
(210, 1, 47, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:33:49', '2023-01-20 19:33:49', NULL),
(211, 1, 47, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 2, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:33:49', '2023-01-20 19:33:49', NULL),
(212, 1, 15, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:34:59', '2023-01-20 19:34:59', NULL),
(213, 1, 46, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 3, 16.00, 1, '48', NULL, 'false', '2023-01-20 19:37:07', '2023-01-20 19:37:07', NULL),
(214, 1, 41, 2, 5, 2, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '42', NULL, 'false', '2023-01-21 01:58:22', '2023-01-21 01:58:22', NULL),
(215, 1, 40, 3, 9, 1, 3, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '42', NULL, 'false', '2023-01-21 02:01:05', '2023-01-21 02:01:05', NULL),
(216, 1, 25, 3, 5, 1, 1, '25', '2012-10-22 00:00:00', 5, 4.00, 1, '4', NULL, 'false', '2023-01-21 07:56:46', '2023-01-21 07:56:46', NULL),
(217, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 8, 16.00, 1, '4', NULL, 'false', '2023-01-23 20:08:38', '2023-01-23 20:08:38', NULL),
(218, 1, 46, 1, 12, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '48', NULL, 'false', '2023-01-24 18:11:48', '2023-01-24 18:11:48', NULL),
(219, 1, 46, 7, 12, 2, 8, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '48', NULL, 'false', '2023-01-24 18:12:17', '2023-01-24 18:12:17', NULL),
(220, 1, 46, 3, 12, 1, 1, '25', '2012-10-22 00:00:00', 2, 4.00, 1, '48', NULL, 'false', '2023-01-24 18:51:39', '2023-01-24 18:51:39', NULL),
(221, 1, 25, 1, 5, 1, 1, '25', '2012-10-22 00:00:00', 9, 16.00, 1, '4', NULL, 'false', '2023-01-24 19:30:34', '2023-01-24 19:30:34', NULL),
(222, 1, 45, 3, 3, 1, 8, '25', '2012-10-22 00:00:00', 1, 4.00, 1, '49', NULL, 'false', '2023-01-24 19:57:33', '2023-01-24 19:57:33', NULL),
(223, 1, 48, 7, 2, 1, 6, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '49', NULL, 'false', '2023-01-24 19:59:48', '2023-01-24 19:59:48', NULL),
(224, 1, 25, 3, 5, 1, 3, '25', '2012-10-22 00:00:00', 6, 4.00, 1, '4', NULL, 'false', '2023-01-24 20:45:07', '2023-01-24 20:45:07', NULL),
(225, 1, 25, 8, 5, 1, 4, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '4', NULL, 'false', '2023-01-24 21:09:56', '2023-01-24 21:09:56', NULL),
(226, 1, 26, 8, 12, 1, 1, '25', '2012-10-22 00:00:00', 1, 14.00, 1, '4', NULL, 'false', '2023-01-24 21:11:00', '2023-01-24 21:11:00', NULL),
(227, 1, 26, 8, 12, 1, 8, '25', '2012-10-22 00:00:00', 2, 14.00, 1, '4', NULL, 'false', '2023-01-24 21:12:23', '2023-01-24 21:12:23', NULL),
(228, 1, 26, 2, 12, 1, 7, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-25 01:39:50', '2023-01-25 01:39:50', NULL),
(229, 1, 26, 1, 12, 1, 1, '25', '2025-01-23 00:00:06', 3, 16.00, 1, '4', NULL, 'false', '2023-01-25 01:43:42', '2023-01-25 01:43:42', NULL),
(230, 1, 26, 4, 12, 1, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-25 04:06:51', '2023-01-25 04:06:51', NULL),
(231, 1, 26, 3, 12, 1, 1, '25', '2025-01-23 00:00:02', 1, 4.00, 1, '4', NULL, 'false', '2023-01-25 04:28:37', '2023-01-25 04:28:37', NULL),
(232, 1, 26, 6, 12, 1, 5, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-25 04:41:32', '2023-01-25 04:41:32', NULL),
(233, 1, 26, 3, 12, 1, 6, '25', '2025-01-23 00:00:06', 2, 4.00, 1, '4', NULL, 'false', '2023-01-25 04:44:21', '2023-01-25 04:44:21', NULL),
(234, 1, 26, 2, 12, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-25 05:25:51', '2023-01-25 05:25:51', NULL),
(235, 1, 26, 2, 12, 1, 2, '25', '2012-10-22 00:00:00', 4, 5.00, 1, '4', NULL, 'false', '2023-01-25 05:26:32', '2023-01-25 05:26:32', NULL),
(236, 1, 26, 2, 12, 1, 5, '25', '2012-10-22 00:00:00', 5, 5.00, 1, '4', NULL, 'false', '2023-01-25 05:27:36', '2023-01-25 05:27:36', NULL),
(237, 1, 25, 2, 5, 1, 4, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-25 05:28:08', '2023-01-25 05:28:08', NULL),
(238, 1, 26, 2, 5, 1, 5, '25', '2012-10-22 00:00:00', 6, 5.00, 1, '4', NULL, 'false', '2023-01-25 05:28:15', '2023-01-25 05:28:15', NULL),
(239, 1, 26, 6, 12, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-25 08:34:43', '2023-01-25 08:34:43', NULL),
(240, 1, 25, 4, 5, 1, 3, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-25 10:18:13', '2023-01-25 10:18:13', NULL),
(241, 1, 45, 1, 3, 1, 4, '25', '2025-01-23 00:00:02', 1, 16.00, 1, '49', NULL, 'false', '2023-01-25 13:12:03', '2023-01-25 13:12:03', NULL),
(242, 1, 42, 2, 2, 2, 4, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:13:14', '2023-01-25 13:13:14', NULL),
(243, 1, 43, 2, 2, 2, 4, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:13:22', '2023-01-25 13:13:22', NULL),
(244, 1, 45, 2, 2, 2, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:13:38', '2023-01-25 13:13:38', NULL),
(245, 1, 35, 2, 2, 2, 3, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:14:14', '2023-01-25 13:14:14', NULL),
(246, 1, 42, 2, 2, 2, 8, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:14:36', '2023-01-25 13:14:36', NULL),
(247, 1, 42, 2, 2, 2, 5, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '49', NULL, 'false', '2023-01-25 13:14:47', '2023-01-25 13:14:47', NULL),
(248, 1, 43, 5, 11, 1, 1, '25', '2025-01-23 00:00:02', 1, 24.00, 1, '49', NULL, 'false', '2023-01-25 13:15:37', '2023-01-25 13:15:37', NULL),
(249, 1, 26, 4, 12, 1, 5, '25', '2012-10-22 00:00:00', 2, 5.00, 1, '4', NULL, 'false', '2023-01-26 06:56:36', '2023-01-26 06:56:36', NULL),
(250, 1, 25, 4, 5, 1, 2, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-26 06:57:12', '2023-01-26 06:57:12', NULL),
(251, 1, 26, 4, 5, 1, 3, '25', '2012-10-22 00:00:00', 3, 5.00, 1, '4', NULL, 'false', '2023-01-26 06:57:18', '2023-01-26 06:57:18', NULL),
(252, 1, 25, 6, 5, 1, 2, '25', '2012-10-22 00:00:00', 1, 5.00, 1, '4', NULL, 'false', '2023-01-26 07:38:19', '2023-01-26 07:38:19', NULL),
(253, 1, 25, 2, 5, 1, 3, '25', '2012-10-22 00:00:00', 4, 6.00, 1, '4', NULL, 'false', '2023-01-28 10:15:44', '2023-01-28 10:15:44', NULL),
(254, 1, 26, 2, 5, 1, 2, '25', '2012-10-22 00:00:00', 7, 6.00, 1, '4', NULL, 'false', '2023-01-28 10:15:52', '2023-01-28 10:15:52', NULL),
(255, 1, 42, 4, 2, 2, 3, '25', '2012-10-22 00:00:00', 1, 10.00, 1, '49', NULL, 'false', '2023-01-30 14:26:45', '2023-01-30 14:26:45', NULL),
(256, 1, 48, 3, 2, 1, 1, '25', '2030-01-23 00:00:01', 1, 4.21, 1, '49', NULL, 'false', '2023-01-30 14:28:13', '2023-01-30 14:28:13', NULL),
(257, 1, 16, 3, 2, 1, 6, '25', '2030-01-23 00:00:06', 1, 4.21, 1, '49', NULL, 'false', '2023-01-30 14:28:40', '2023-01-30 14:28:40', NULL),
(258, 1, 42, 1, 2, 1, 1, '25', '2030-01-23 00:00:02', 3, 15.59, 1, '49', NULL, 'false', '2023-01-30 14:50:47', '2023-01-30 14:50:47', NULL),
(259, 1, 25, 1, 5, 1, 1, '25', '2030-01-23 00:00:06', 10, 12.94, 1, '4', NULL, 'false', '2023-01-30 21:59:41', '2023-01-30 21:59:41', NULL),
(260, 1, 16, 1, 8, 1, 1, '25', '2012-10-22 00:00:00', 1, 9.98, 1, '49', NULL, 'false', '2023-02-01 02:49:45', '2023-02-01 02:49:45', NULL),
(261, 1, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:01', 11, 12.94, 1, '4', NULL, 'false', '2023-02-02 22:50:55', '2023-02-02 22:50:55', NULL),
(262, 1, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:03', 12, 12.94, 1, '4', NULL, 'false', '2023-02-02 22:52:11', '2023-02-02 22:52:11', NULL),
(263, 1, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:07', 13, 12.94, 1, '4', NULL, 'false', '2023-02-02 23:00:21', '2023-02-02 23:00:21', NULL),
(264, 1, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:06', 14, 12.94, 1, '4', NULL, 'false', '2023-02-02 23:01:21', '2023-02-02 23:01:21', NULL),
(265, 32, 42, 1, 2, 1, 1, '25', '2023-02-02 00:00:07', 4, 15.59, 1, '49', NULL, 'false', '2023-02-03 00:17:01', '2023-02-03 00:17:01', NULL),
(266, 17, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:15', 15, 12.94, 1, '4', NULL, 'false', '2023-02-03 00:22:24', '2023-02-03 00:22:24', NULL),
(267, 17, 25, 1, 5, 1, 1, '25', '2023-02-02 00:00:01', 16, 12.94, 1, '4', NULL, 'false', '2023-02-03 00:23:13', '2023-02-03 00:23:13', NULL),
(268, 32, 42, 1, 2, 1, 1, '16.42', '2023-02-02 00:00:02', 5, 15.59, 1, '49', NULL, 'false', '2023-02-03 00:32:24', '2023-02-03 00:32:24', NULL),
(269, 32, 42, 2, 2, 2, 7, '20', '2023-02-02 00:00:00', 4, 4.50, 1, '49', NULL, 'false', '2023-02-03 00:35:19', '2023-02-03 00:35:19', NULL),
(270, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-03 00:00:05', 17, 12.94, 1, '4', NULL, 'false', '2023-02-03 01:00:40', '2023-02-03 01:00:40', NULL),
(271, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-03 00:00:01', 18, 12.94, 1, '4', NULL, 'false', '2023-02-03 01:01:26', '2023-02-03 01:01:26', NULL),
(272, 17, 25, 1, 5, 1, 3, '18.77', '2023-02-03 00:00:18', 19, 12.94, 1, '4', NULL, 'false', '2023-02-03 01:06:51', '2023-02-03 01:06:51', NULL),
(273, 32, 42, 1, 2, 1, 1, '16.42', '2023-02-03 00:00:04', 6, 15.59, 1, '49', NULL, 'false', '2023-02-03 12:25:36', '2023-02-03 12:25:36', NULL),
(274, 32, 42, 1, 2, 1, 1, '16.42', '2023-02-03 00:00:02', 7, 15.59, 1, '49', NULL, 'false', '2023-02-03 13:55:24', '2023-02-03 13:55:24', NULL),
(275, 32, 35, 1, 2, 1, 3, '18.77', '2023-02-03 00:00:18', 1, 15.59, 1, '49', NULL, 'false', '2023-02-03 13:56:31', '2023-02-03 13:56:31', NULL),
(276, 32, 42, 3, 2, 1, 6, '6.39', '2023-02-03 00:00:06', 1, 4.21, 1, '49', NULL, 'false', '2023-02-03 13:58:20', '2023-02-03 13:58:20', NULL),
(277, 1, 25, 4, 5, 1, 2, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '4', NULL, 'false', '2023-02-06 05:46:26', '2023-02-06 05:46:26', NULL),
(278, 1, 25, 6, 5, 1, 1, '25', '2012-10-22 00:00:00', 2, 8.00, 1, '4', NULL, 'false', '2023-02-06 05:51:02', '2023-02-06 05:51:02', NULL),
(279, 1, 25, 6, 5, 1, 4, '25', '2012-10-22 00:00:00', 3, 8.00, 1, '4', NULL, 'false', '2023-02-08 02:02:35', '2023-02-08 02:02:35', NULL),
(280, 1, 25, 4, 5, 1, 2, '25', '2012-10-22 00:00:00', 5, 16.00, 1, '4', NULL, 'false', '2023-02-08 04:36:40', '2023-02-08 04:36:40', NULL),
(281, 17, 25, 1, 5, 1, 4, '20.21', '2023-02-08 00:00:02', 20, 12.94, 1, '4', NULL, 'false', '2023-02-08 14:00:06', '2023-02-08 14:00:06', NULL),
(282, 17, 25, 3, 5, 1, 3, '5.02', '2023-02-08 00:00:05', 7, 3.23, 1, '4', NULL, 'false', '2023-02-08 19:34:15', '2023-02-08 19:34:15', NULL),
(283, 14, 9, 1, 4, 1, 1, '16.42', '2023-02-09 00:00:03', 1, 13.93, 1, '51', NULL, 'false', '2023-02-09 14:16:15', '2023-02-09 14:16:15', NULL),
(284, 32, 42, 1, 2, 1, 1, '16.42', '2023-02-09 00:00:02', 8, 15.59, 1, '49', NULL, 'false', '2023-02-09 14:59:48', '2023-02-09 14:59:48', NULL),
(285, 32, 35, 1, 2, 1, 1, '16.42', '2023-02-09 00:00:04', 2, 15.59, 1, '49', NULL, 'false', '2023-02-09 15:00:02', '2023-02-09 15:00:02', NULL),
(286, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-14 00:00:01', 21, 12.94, 1, '4', NULL, 'false', '2023-02-14 13:37:50', '2023-02-14 13:37:50', NULL),
(287, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-14 00:00:01', 22, 12.94, 1, '4', NULL, 'false', '2023-02-14 14:51:47', '2023-02-14 14:51:47', NULL),
(288, 14, 39, 1, 8, 1, 1, '16.42', '2023-02-14 00:00:01', 7, 9.98, 1, '51', NULL, 'false', '2023-02-14 15:46:41', '2023-02-14 15:46:41', NULL),
(289, 14, 9, 1, 8, 1, 4, '20.21', '2023-02-14 00:00:19', 2, 9.98, 1, '51', NULL, 'false', '2023-02-14 15:47:27', '2023-02-14 15:47:27', NULL),
(290, 14, 13, 1, 8, 1, 7, '26.27', '2023-02-14 00:00:24', 3, 9.98, 1, '51', NULL, 'false', '2023-02-14 15:48:29', '2023-02-14 15:48:29', NULL),
(291, 14, 19, 1, 8, 1, 8, '100', '2023-02-14 00:01:52', 1, 9.98, 1, '51', NULL, 'false', '2023-02-14 15:50:45', '2023-02-14 15:50:45', NULL),
(292, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-14 00:00:01', 23, 12.94, 1, '4', NULL, 'false', '2023-02-14 16:01:04', '2023-02-14 16:01:04', NULL),
(293, 14, 41, 6, 5, 2, 4, '50', '2023-02-14 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-02-14 16:21:06', '2023-02-14 16:21:06', NULL),
(294, 14, 30, 6, 8, 1, 4, '50', '2023-02-14 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-02-14 17:33:27', '2023-02-14 17:33:27', NULL),
(295, 14, 39, 6, 8, 1, 4, '50', '2023-02-14 00:00:00', 1, 8.00, 1, '51', NULL, 'false', '2023-02-14 17:33:59', '2023-02-14 17:33:59', NULL),
(296, 14, 20, 8, 8, 1, 3, '16', '2023-02-14 00:00:15', 1, 11.00, 1, '51', NULL, 'false', '2023-02-14 17:36:25', '2023-02-14 17:36:25', NULL),
(297, 14, 48, 6, 2, 1, 4, '50', '2023-02-14 00:00:00', 1, 8.00, 1, '51', NULL, 'false', '2023-02-14 17:37:05', '2023-02-14 17:37:05', NULL),
(298, 14, 30, 6, 2, 1, 3, '60', '2023-02-14 00:00:00', 3, 8.00, 1, '51', NULL, 'false', '2023-02-14 17:37:14', '2023-02-14 17:37:14', NULL),
(299, 14, 39, 6, 2, 1, 1, '80', '2023-02-14 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-02-14 17:37:34', '2023-02-14 17:37:34', NULL),
(300, 14, 20, 5, 8, 1, 1, '24.15', '2023-02-14 00:00:03', 1, 18.34, 1, '51', NULL, 'false', '2023-02-14 17:40:01', '2023-02-14 17:40:01', NULL),
(301, 14, 19, 4, 8, 1, 4, '50', '2023-02-14 00:00:00', 1, 20.00, 1, '51', NULL, 'false', '2023-02-14 17:40:39', '2023-02-14 17:40:39', NULL),
(302, 14, 13, 4, 8, 1, 5, '40', '2023-02-14 00:00:00', 1, 20.00, 1, '51', NULL, 'false', '2023-02-14 17:40:51', '2023-02-14 17:40:51', NULL),
(303, 14, 9, 4, 4, 1, 8, '10', '2023-02-14 00:00:00', 1, 15.00, 1, '51', NULL, 'false', '2023-02-14 17:41:09', '2023-02-14 17:41:09', NULL),
(304, 14, 13, 2, 8, 2, 1, '80', '2023-02-14 00:00:00', 1, 6.00, 1, '51', NULL, 'false', '2023-02-14 17:42:07', '2023-02-14 17:42:07', NULL),
(305, 14, 5, 3, 5, 1, 3, '5.02', '2023-02-14 00:00:05', 1, 3.23, 1, '51', NULL, 'false', '2023-02-14 17:42:52', '2023-02-14 17:42:52', NULL),
(306, 14, 14, 2, 8, 1, 2, '70', '2023-02-14 00:00:00', 1, 6.50, 1, '51', NULL, 'false', '2023-02-14 17:43:28', '2023-02-14 17:43:28', NULL),
(307, 14, 48, 1, 2, 1, 4, '20.21', '2023-02-14 00:00:21', 1, 15.59, 1, '51', NULL, 'false', '2023-02-14 17:44:37', '2023-02-14 17:44:37', NULL),
(308, 1, 25, 4, 5, 1, 2, '25', '2012-10-22 00:00:00', 6, 16.00, 1, '4', NULL, 'false', '2023-02-15 02:52:49', '2023-02-15 02:52:49', NULL),
(309, 1, 26, 4, 5, 1, 1, '25', '2012-10-22 00:00:00', 4, 16.00, 1, '4', NULL, 'false', '2023-02-15 03:30:29', '2023-02-15 03:30:29', NULL),
(310, 17, 26, 6, 8, 1, 2, '70', '2023-02-14 00:00:00', 4, 8.00, 1, '4', NULL, 'false', '2023-02-15 08:38:47', '2023-02-15 08:38:47', NULL),
(311, 17, 25, 4, 5, 1, 2, '70', '2023-02-15 00:00:00', 7, 16.00, 1, '4', NULL, 'false', '2023-02-15 18:11:25', '2023-02-15 18:11:25', NULL),
(312, 17, 26, 5, 8, 1, 1, '24.15', '2023-02-15 00:00:14', 1, 18.34, 1, '4', NULL, 'false', '2023-02-15 18:13:07', '2023-02-15 18:13:07', NULL),
(313, 14, 20, 1, 8, 1, 1, '16.42', '2023-02-15 00:00:02', 8, 9.98, 1, '51', NULL, 'false', '2023-02-15 19:16:00', '2023-02-15 19:16:00', NULL),
(314, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-15 00:00:02', 24, 12.94, 1, '4', NULL, 'false', '2023-02-15 22:11:31', '2023-02-15 22:11:31', NULL),
(315, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-15 00:00:06', 25, 12.94, 1, '4', NULL, 'false', '2023-02-15 22:13:03', '2023-02-15 22:13:03', NULL),
(316, 17, 25, 2, 5, 1, 7, '20', '2023-02-15 00:00:00', 5, 6.00, 1, '4', NULL, 'false', '2023-02-15 22:14:51', '2023-02-15 22:14:51', NULL),
(317, 14, 20, 1, 8, 1, 4, '20.21', '2023-02-16 00:00:02', 9, 9.98, 1, '51', NULL, 'false', '2023-02-16 13:12:34', '2023-02-16 13:12:34', NULL),
(318, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-16 00:00:02', 26, 12.94, 1, '4', NULL, 'false', '2023-02-16 13:17:29', '2023-02-16 13:17:29', NULL),
(319, 14, 20, 1, 8, 1, 1, '16.42', '2023-02-16 00:00:03', 10, 9.98, 1, '51', NULL, 'false', '2023-02-16 14:15:46', '2023-02-16 14:15:46', NULL),
(320, 14, 20, 6, 8, 1, 7, '20', '2023-02-16 00:00:00', 1, 8.00, 1, '51', NULL, 'false', '2023-02-16 14:16:39', '2023-02-16 14:16:39', NULL),
(321, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-16 00:00:02', 27, 12.94, 1, '4', NULL, 'false', '2023-02-16 20:30:15', '2023-02-16 20:30:15', NULL),
(322, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-16 00:00:01', 28, 12.94, 1, '4', NULL, 'false', '2023-02-16 23:45:10', '2023-02-16 23:45:10', NULL),
(323, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-16 00:00:01', 29, 12.94, 1, '4', NULL, 'false', '2023-02-16 23:45:53', '2023-02-16 23:45:53', NULL),
(324, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-17 00:00:02', 30, 12.94, 1, '4', NULL, 'false', '2023-02-17 00:19:10', '2023-02-17 00:19:10', NULL),
(325, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-18 00:00:04', 31, 12.94, 1, '4', NULL, 'false', '2023-02-18 00:41:16', '2023-02-18 00:41:16', NULL),
(326, 17, 25, 1, 5, 1, 8, '100', '2023-02-17 00:00:03', 32, 12.94, 1, '4', NULL, 'false', '2023-02-18 07:30:33', '2023-02-18 07:30:33', NULL),
(327, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-22 00:00:03', 33, 12.94, 1, '4', NULL, 'false', '2023-02-22 00:47:03', '2023-02-22 00:47:03', NULL),
(328, 17, 26, 1, 5, 1, 1, '16.42', '2023-02-22 00:00:03', 4, 12.94, 1, '4', NULL, 'false', '2023-02-22 00:47:16', '2023-02-22 00:47:16', NULL),
(329, 17, 25, 1, 5, 1, 1, '16.42', '2023-02-22 00:00:02', 34, 12.94, 1, '4', NULL, 'false', '2023-02-22 06:15:28', '2023-02-22 06:15:28', NULL),
(330, 17, 26, 1, 5, 1, 7, '26.27', '2023-02-22 00:00:00', 5, 12.94, 1, '4', NULL, 'false', '2023-02-22 06:15:39', '2023-02-22 06:15:39', NULL),
(331, 17, 25, 6, 5, 1, 7, '20', '2023-02-22 00:00:00', 4, 8.00, 1, '4', NULL, 'false', '2023-02-22 17:23:16', '2023-02-22 17:23:16', NULL),
(332, 14, 20, 1, 8, 1, 4, '20.21', '2023-02-22 00:00:19', 11, 9.98, 1, '51', NULL, 'false', '2023-02-22 17:51:28', '2023-02-22 17:51:28', NULL),
(333, 14, 41, 1, 8, 1, 3, '18.77', '2023-02-22 00:00:18', 1, 9.98, 1, '51', NULL, 'false', '2023-02-22 17:52:23', '2023-02-22 17:52:23', NULL),
(334, 14, 14, 3, 8, 1, 3, '5.02', '2023-02-22 00:00:05', 1, 3.14, 1, '51', NULL, 'false', '2023-02-22 18:23:08', '2023-02-22 18:23:08', NULL),
(335, 14, 14, 1, 8, 1, 3, '18.77', '2023-02-22 00:00:18', 1, 9.98, 1, '51', NULL, 'false', '2023-02-22 18:24:11', '2023-02-22 18:24:11', NULL),
(336, 14, 5, 3, 8, 1, 3, '5.02', '2023-02-22 00:00:05', 2, 3.14, 1, '51', NULL, 'false', '2023-02-22 18:26:21', '2023-02-22 18:26:21', NULL),
(337, 14, 20, 2, 8, 1, 8, '10', '2023-02-22 00:00:00', 4, 6.50, 1, '51', NULL, 'false', '2023-02-22 18:35:50', '2023-02-22 18:35:50', NULL),
(338, 14, 41, 2, 8, 1, 5, '40', '2023-02-22 00:00:00', 2, 6.50, 1, '51', NULL, 'false', '2023-02-22 18:36:30', '2023-02-22 18:36:30', NULL),
(339, 14, 14, 2, 8, 1, 7, '20', '2023-02-22 00:00:00', 2, 6.50, 1, '51', NULL, 'false', '2023-02-22 18:37:01', '2023-02-22 18:37:01', NULL),
(340, 14, 48, 3, 8, 1, 8, '100', '2023-02-22 00:00:08', 2, 3.14, 1, '51', NULL, 'false', '2023-02-22 18:37:56', '2023-02-22 18:37:56', NULL),
(341, 14, 13, 6, 8, 2, 5, '40', '2023-02-22 00:00:00', 1, 8.00, 1, '51', NULL, 'false', '2023-02-22 18:40:05', '2023-02-22 18:40:05', NULL),
(342, 14, 20, 4, 8, 1, 2, '70', '2023-02-22 00:00:00', 1, 20.00, 1, '51', NULL, 'false', '2023-02-22 18:40:20', '2023-02-22 18:40:20', NULL),
(343, 14, 39, 5, 8, 1, 1, '24.15', '2023-02-22 00:00:02', 1, 18.34, 1, '51', NULL, 'false', '2023-02-22 18:40:50', '2023-02-22 18:40:50', NULL),
(344, 14, 13, 4, 8, 1, 8, '10', '2023-02-22 00:00:00', 2, 20.00, 1, '51', NULL, 'false', '2023-02-22 18:51:01', '2023-02-22 18:51:01', NULL),
(345, 11, 36, 6, 8, 2, 5, '40', '2023-02-22 00:00:00', 1, 8.00, 1, '46', NULL, 'false', '2023-02-22 19:01:47', '2023-02-22 19:01:47', NULL),
(346, 11, 36, 6, 8, 2, 2, '70', '2023-02-22 00:00:00', 2, 8.00, 1, '46', NULL, 'false', '2023-02-22 19:03:37', '2023-02-22 19:03:37', NULL),
(347, 7, 47, 6, 8, 2, 6, '30', '2023-02-22 00:00:00', 1, 8.00, 1, '50', NULL, 'false', '2023-02-22 19:28:16', '2023-02-22 19:28:16', NULL),
(348, 7, 47, 6, 8, 2, 4, '50', '2023-02-22 00:00:00', 2, 8.00, 1, '50', NULL, 'false', '2023-02-22 19:29:32', '2023-02-22 19:29:32', NULL),
(349, 14, 20, 4, 8, 1, 7, '20', '2023-02-25 00:00:00', 2, 20.00, 1, '51', NULL, 'false', '2023-02-25 00:35:22', '2023-02-25 00:35:22', NULL),
(350, 14, 13, 4, 8, 1, 8, '10', '2023-02-25 00:00:00', 3, 20.00, 1, '51', NULL, 'false', '2023-02-25 00:39:17', '2023-02-25 00:39:17', NULL),
(351, 17, 26, 1, 5, 1, 1, '16.42', '2023-02-25 00:00:05', 6, 12.94, 1, '4', NULL, 'false', '2023-02-25 01:41:15', '2023-02-25 01:41:15', NULL),
(352, 7, 47, 4, 8, 2, 8, '10', '2023-02-25 00:00:00', 1, 15.00, 1, '50', NULL, 'false', '2023-02-25 01:45:24', '2023-02-25 01:45:24', NULL),
(353, 7, 44, 4, 8, 2, 8, '10', '2023-02-25 00:00:00', 1, 15.00, 1, '50', NULL, 'false', '2023-02-25 01:45:59', '2023-02-25 01:45:59', NULL),
(354, 7, 40, 2, 8, 1, 7, '20', '2023-02-25 00:00:00', 3, 6.50, 1, '50', NULL, 'false', '2023-02-25 01:54:19', '2023-02-25 01:54:19', NULL),
(355, 7, 40, 2, 8, 1, 7, '20', '2023-02-25 00:00:00', 4, 6.50, 1, '50', NULL, 'false', '2023-02-25 01:55:32', '2023-02-25 01:55:32', NULL),
(356, 7, 40, 2, 8, 1, 7, '20', '2023-02-25 00:00:00', 5, 6.50, 1, '50', NULL, 'false', '2023-02-25 01:56:57', '2023-02-25 01:56:57', NULL),
(357, 7, 44, 2, 8, 1, 7, '20', '2023-02-25 00:00:00', 1, 6.50, 1, '50', NULL, 'false', '2023-02-25 01:57:05', '2023-02-25 01:57:05', NULL),
(358, 7, 44, 2, 8, 2, 7, '20', '2023-02-25 00:00:00', 2, 6.00, 1, '50', NULL, 'false', '2023-02-25 01:57:55', '2023-02-25 01:57:55', NULL);
INSERT INTO `assessment_results` (`id`, `EventID`, `ParticipantID`, `AssessmentID`, `GradeID`, `GenderID`, `ColorID`, `Results`, `DTRecorded`, `Attempt`, `Percent`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(359, 17, 25, 1, 5, 1, 6, '23.88', '2023-02-25 00:00:23', 35, 12.94, 1, '4', NULL, 'false', '2023-02-26 07:58:18', '2023-02-26 07:58:18', NULL),
(360, 32, 42, 6, 2, 2, 8, '10', '2023-02-27 00:00:00', 2, 8.00, 1, '49', NULL, 'false', '2023-02-27 18:02:10', '2023-02-27 18:02:10', NULL),
(361, 14, 39, 4, 5, 2, 7, '20', '2023-02-27 00:00:00', 4, 15.00, 1, '51', NULL, 'false', '2023-02-27 18:03:21', '2023-02-27 18:03:21', NULL),
(362, 32, 16, 6, 2, 2, 1, '80', '2023-02-27 00:00:00', 1, 8.00, 1, '49', NULL, 'false', '2023-02-27 18:03:36', '2023-02-27 18:03:36', NULL),
(363, 14, 19, 4, 5, 2, 1, '80', '2023-02-27 00:00:00', 2, 15.00, 1, '51', NULL, 'false', '2023-02-27 18:03:50', '2023-02-27 18:03:50', NULL),
(364, 14, 13, 2, 8, 1, 6, '30', '2023-02-27 00:00:00', 2, 6.50, 1, '51', NULL, 'false', '2023-02-27 18:07:09', '2023-02-27 18:07:09', NULL),
(365, 32, 35, 1, 8, 1, 4, '20.21', '2023-02-27 00:00:02', 3, 9.98, 1, '49', NULL, 'false', '2023-02-27 18:07:48', '2023-02-27 18:07:48', NULL),
(366, 14, 19, 2, 8, 1, 3, '60', '2023-02-27 00:00:00', 1, 6.50, 1, '51', NULL, 'false', '2023-02-27 18:07:55', '2023-02-27 18:07:55', NULL),
(367, 32, 16, 1, 8, 1, 3, '18.77', '2023-02-27 00:00:18', 2, 9.98, 1, '49', NULL, 'false', '2023-02-27 18:08:32', '2023-02-27 18:08:32', NULL),
(368, 32, 42, 4, 2, 2, 7, '20', '2023-02-27 00:00:00', 2, 10.00, 1, '49', NULL, 'false', '2023-02-27 18:16:20', '2023-02-27 18:16:20', NULL),
(369, 32, 16, 4, 8, 1, 5, '40', '2023-02-27 00:00:00', 1, 20.00, 1, '49', NULL, 'false', '2023-02-27 18:16:55', '2023-02-27 18:16:55', NULL),
(370, 32, 42, 5, 2, 1, 4, '29.72', '2023-02-27 00:00:28', 1, 23.42, 1, '49', NULL, 'false', '2023-02-27 18:18:06', '2023-02-27 18:18:06', NULL),
(371, 32, 35, 5, 2, 1, 1, '24.15', '2023-02-27 00:00:01', 1, 23.42, 1, '49', NULL, 'false', '2023-02-27 18:18:14', '2023-02-27 18:18:14', NULL),
(372, 32, 16, 5, 2, 1, 3, '27.6', '2023-02-27 00:00:26', 1, 23.42, 1, '49', NULL, 'false', '2023-02-27 18:19:05', '2023-02-27 18:19:05', NULL),
(373, 32, 16, 5, 8, 1, 4, '29.72', '2023-02-27 00:00:03', 2, 18.34, 1, '49', NULL, 'false', '2023-02-27 18:21:18', '2023-02-27 18:21:18', NULL),
(374, 14, 20, 4, 8, 1, 2, '70', '2023-02-27 00:00:00', 3, 20.00, 1, '51', NULL, 'false', '2023-02-27 18:21:41', '2023-02-27 18:21:41', NULL),
(375, 14, 19, 4, 8, 1, 1, '80', '2023-02-27 00:00:00', 3, 20.00, 1, '51', NULL, 'false', '2023-02-27 18:21:51', '2023-02-27 18:21:51', NULL),
(376, 32, 16, 6, 8, 1, 5, '40', '2023-02-27 00:00:00', 2, 8.00, 1, '49', NULL, 'false', '2023-02-27 18:22:34', '2023-02-27 18:22:34', NULL),
(377, 14, 5, 5, 5, 1, 3, '27.6', '2023-02-27 00:00:26', 1, 21.06, 1, '51', NULL, 'false', '2023-02-27 18:23:00', '2023-02-27 18:23:00', NULL),
(378, 32, 16, 6, 8, 1, 2, '70', '2023-02-27 00:00:00', 3, 8.00, 1, '49', NULL, 'false', '2023-02-27 18:23:15', '2023-02-27 18:23:15', NULL),
(379, 14, 19, 5, 5, 1, 3, '27.6', '2023-02-27 00:00:26', 1, 21.06, 1, '51', NULL, 'false', '2023-02-27 18:23:37', '2023-02-27 18:23:37', NULL),
(380, 14, 20, 6, 8, 1, 1, '80', '2023-02-27 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-02-27 18:24:04', '2023-02-27 18:24:04', NULL),
(381, 14, 19, 6, 8, 1, 3, '60', '2023-02-27 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-02-27 18:24:18', '2023-02-27 18:24:18', NULL),
(382, 32, 35, 8, 8, 1, 4, '17.23', '2023-02-27 00:00:18', 1, 11.00, 1, '49', NULL, 'false', '2023-02-27 18:28:54', '2023-02-27 18:28:54', NULL),
(383, 14, 13, 8, 8, 1, 4, '17.23', '2023-02-27 00:00:18', 1, 11.00, 1, '51', NULL, 'false', '2023-02-27 18:31:36', '2023-02-27 18:31:36', NULL),
(384, 32, 16, 8, 8, 1, 6, '20.36', '2023-02-27 00:00:19', 1, 11.00, 1, '49', NULL, 'false', '2023-02-27 18:34:12', '2023-02-27 18:34:12', NULL),
(385, 32, 35, 1, 2, 1, 1, '16.42', '2023-02-28 00:00:01', 4, 15.59, 1, '49', NULL, 'false', '2023-02-28 14:56:49', '2023-02-28 14:56:49', NULL),
(386, 32, 16, 1, 2, 1, 1, '16.42', '2023-02-28 00:00:01', 3, 15.59, 1, '49', NULL, 'false', '2023-02-28 14:57:00', '2023-02-28 14:57:00', NULL),
(387, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 1, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:19:37', '2023-02-28 15:19:37', NULL),
(388, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:06', 2, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:21:18', '2023-02-28 15:21:18', NULL),
(389, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 3, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:21:58', '2023-02-28 15:21:58', NULL),
(390, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 5, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:22:06', '2023-02-28 15:22:06', NULL),
(391, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 4, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:22:46', '2023-02-28 15:22:46', NULL),
(392, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 5, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:23:08', '2023-02-28 15:23:08', NULL),
(393, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 6, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:23:14', '2023-02-28 15:23:14', NULL),
(394, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 7, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:24:58', '2023-02-28 15:24:58', NULL),
(395, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 6, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:27:51', '2023-02-28 15:27:51', NULL),
(396, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 8, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:28:09', '2023-02-28 15:28:09', NULL),
(397, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 7, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:29:33', '2023-02-28 15:29:33', NULL),
(398, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 9, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:30:14', '2023-02-28 15:30:14', NULL),
(399, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 8, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:31:06', '2023-02-28 15:31:06', NULL),
(400, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 9, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:32:22', '2023-02-28 15:32:22', NULL),
(401, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 10, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:35:01', '2023-02-28 15:35:01', NULL),
(402, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 10, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:35:09', '2023-02-28 15:35:09', NULL),
(403, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 11, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:36:22', '2023-02-28 15:36:22', NULL),
(404, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:03', 11, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:36:31', '2023-02-28 15:36:31', NULL),
(405, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 2, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:36:40', '2023-02-28 15:36:40', NULL),
(406, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 12, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:42:39', '2023-02-28 15:42:39', NULL),
(407, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 12, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:42:50', '2023-02-28 15:42:50', NULL),
(408, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 3, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:42:55', '2023-02-28 15:42:55', NULL),
(409, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 13, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:47:08', '2023-02-28 15:47:08', NULL),
(410, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 4, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:47:13', '2023-02-28 15:47:13', NULL),
(411, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 13, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:47:18', '2023-02-28 15:47:18', NULL),
(412, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 14, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:47:52', '2023-02-28 15:47:52', NULL),
(413, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 5, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:48:01', '2023-02-28 15:48:01', NULL),
(414, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 14, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:48:11', '2023-02-28 15:48:11', NULL),
(415, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 15, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:48:35', '2023-02-28 15:48:35', NULL),
(416, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 6, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:48:39', '2023-02-28 15:48:39', NULL),
(417, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 15, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:48:43', '2023-02-28 15:48:43', NULL),
(418, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 16, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:49:02', '2023-02-28 15:49:02', NULL),
(419, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 16, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:49:08', '2023-02-28 15:49:08', NULL),
(420, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 7, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:49:13', '2023-02-28 15:49:13', NULL),
(421, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 17, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:49:47', '2023-02-28 15:49:47', NULL),
(422, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:03', 17, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:50:03', '2023-02-28 15:50:03', NULL),
(423, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 8, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:50:10', '2023-02-28 15:50:10', NULL),
(424, 21, 46, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 18, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:52:53', '2023-02-28 15:52:53', NULL),
(425, 21, 15, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 9, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:53:02', '2023-02-28 15:53:02', NULL),
(426, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:02', 18, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:53:09', '2023-02-28 15:53:09', NULL),
(427, 21, 23, 1, 8, 1, 1, '16.42', '2023-02-28 00:00:01', 19, 9.98, 1, '48', NULL, 'false', '2023-02-28 15:53:26', '2023-02-28 15:53:26', NULL),
(428, 17, 25, 3, 5, 1, 7, '7.02', '2023-03-01 00:00:06', 8, 3.23, 1, '4', NULL, 'false', '2023-03-01 18:08:33', '2023-03-01 18:08:33', NULL),
(429, 33, 48, 3, 2, 1, 6, '6.39', '2023-03-01 00:00:07', 3, 4.21, 1, '52', NULL, 'false', '2023-03-01 19:19:58', '2023-03-01 19:19:58', NULL),
(430, 33, 48, 1, 2, 1, 4, '20.21', '2023-03-01 00:00:18', 2, 15.59, 1, '52', NULL, 'false', '2023-03-01 19:47:33', '2023-03-01 19:47:33', NULL),
(431, 33, 48, 3, 2, 1, 6, '6.39', '2023-03-01 00:00:07', 4, 4.21, 1, '52', NULL, 'false', '2023-03-01 19:48:34', '2023-03-01 19:48:34', NULL),
(432, 33, 48, 8, 2, 1, 3, '16', '2023-03-01 00:00:16', 1, 14.00, 1, '52', NULL, 'false', '2023-03-01 19:49:41', '2023-03-01 19:49:41', NULL),
(433, 33, 48, 6, 2, 1, 3, '60', '2023-03-01 00:00:00', 2, 8.00, 1, '52', NULL, 'false', '2023-03-01 19:52:40', '2023-03-01 19:52:40', NULL),
(434, 33, 48, 3, 2, 1, 3, '5.02', '2023-03-01 00:00:05', 5, 4.21, 1, '52', NULL, 'false', '2023-03-01 19:56:31', '2023-03-01 19:56:31', NULL),
(435, 7, 50, 4, 1, 2, 2, '70', '2023-03-01 00:00:00', 1, 10.00, 1, '20', NULL, 'false', '2023-03-01 21:45:23', '2023-03-01 21:45:23', NULL),
(436, 7, 50, 6, 1, 2, 5, '40', '2023-03-01 00:00:00', 1, 8.00, 1, '20', NULL, 'false', '2023-03-01 21:48:33', '2023-03-01 21:48:33', NULL),
(437, 7, 50, 3, 1, 1, 5, '7.02', '2023-03-01 00:00:06', 1, 4.39, 1, '20', NULL, 'false', '2023-03-01 21:49:44', '2023-03-01 21:49:44', NULL),
(438, 7, 50, 3, 1, 1, 5, '7.02', '2023-03-01 00:00:05', 2, 4.39, 1, '20', NULL, 'false', '2023-03-01 21:50:40', '2023-03-01 21:50:40', NULL),
(439, 7, 50, 3, 1, 1, 7, '7.02', '2023-03-01 00:00:05', 3, 4.39, 1, '20', NULL, 'false', '2023-03-01 21:51:30', '2023-03-01 21:51:30', NULL),
(440, 14, 20, 1, 8, 1, 1, '16.42', '2023-03-02 00:00:01', 12, 9.98, 1, '51', NULL, 'false', '2023-03-02 15:31:49', '2023-03-02 15:31:49', NULL),
(441, 14, 13, 1, 8, 1, 7, '26.27', '2023-03-02 00:00:24', 4, 9.98, 1, '51', NULL, 'false', '2023-03-02 15:33:09', '2023-03-02 15:33:09', NULL),
(442, 14, 30, 2, 8, 1, 6, '30', '2023-03-02 00:00:00', 1, 6.50, 1, '51', NULL, 'false', '2023-03-02 15:34:51', '2023-03-02 15:34:51', NULL),
(443, 14, 5, 6, 5, 2, 8, '10', '2023-03-02 00:00:00', 1, 8.00, 1, '51', NULL, 'false', '2023-03-02 15:35:15', '2023-03-02 15:35:15', NULL),
(444, 14, 20, 1, 8, 1, 3, '18.77', '2023-03-02 00:00:18', 13, 9.98, 1, '51', NULL, 'false', '2023-03-02 15:37:17', '2023-03-02 15:37:17', NULL),
(445, 14, 30, 6, 5, 2, 6, '30', '2023-03-02 00:00:00', 4, 8.00, 1, '51', NULL, 'false', '2023-03-02 15:37:22', '2023-03-02 15:37:22', NULL),
(446, 14, 39, 1, 8, 1, 6, '23.88', '2023-03-02 00:00:23', 8, 9.98, 1, '51', NULL, 'false', '2023-03-02 15:38:22', '2023-03-02 15:38:22', NULL),
(447, 11, 38, 4, 6, 2, 7, '20', '2023-03-02 00:00:00', 2, 15.00, 1, '46', NULL, 'false', '2023-03-02 15:40:59', '2023-03-02 15:40:59', NULL),
(448, 19, 1, 1, 5, 1, 3, '18.77', '2023-03-02 00:00:18', 5, 12.94, 1, '43', NULL, 'false', '2023-03-02 15:48:30', '2023-03-02 15:48:30', NULL),
(449, 34, 21, 1, 8, 1, 3, '18.77', '2023-03-02 00:00:18', 1, 9.98, 1, '44', NULL, 'false', '2023-03-02 15:57:11', '2023-03-02 15:57:11', NULL),
(450, 14, 30, 1, 8, 1, 7, '26.27', '2023-03-02 00:00:19', 7, 9.98, 1, '51', NULL, 'false', '2023-03-02 17:20:14', '2023-03-02 17:20:14', NULL),
(451, 14, 39, 1, 8, 1, 7, '26.27', '2023-03-02 00:00:00', 9, 9.98, 1, '51', NULL, 'false', '2023-03-02 17:23:34', '2023-03-02 17:23:34', NULL),
(452, 14, 13, 1, 8, 1, 8, '100', '2023-03-02 00:00:33', 5, 9.98, 1, '51', NULL, 'false', '2023-03-02 17:29:13', '2023-03-02 17:29:13', NULL),
(453, 7, 48, 4, 2, 1, 8, '10', '2023-03-02 00:00:00', 1, 10.00, 1, '60', NULL, 'false', '2023-03-02 18:58:21', '2023-03-02 18:58:21', NULL),
(454, 7, 48, 1, 2, 1, 1, '16.42', '2023-03-02 00:00:03', 3, 15.59, 1, '60', NULL, 'false', '2023-03-02 19:55:04', '2023-03-02 19:55:04', NULL),
(455, 7, 48, 6, 2, 1, 8, '10', '2023-03-02 00:00:00', 3, 8.00, 1, '60', NULL, 'false', '2023-03-02 20:00:29', '2023-03-02 20:00:29', NULL),
(456, 14, 20, 1, 8, 1, 1, '16.42', '2023-03-02 00:00:14', 14, 9.98, 1, '51', NULL, 'false', '2023-03-02 20:04:43', '2023-03-02 20:04:43', NULL),
(457, 7, 48, 6, 2, 1, 7, '20', '2023-03-02 00:00:00', 4, 8.00, 1, '60', NULL, 'false', '2023-03-02 20:13:42', '2023-03-02 20:13:42', NULL),
(458, 7, 51, 1, 7, 1, 1, '16.42', '2023-03-02 00:00:02', 1, 10.97, 1, '60', NULL, 'false', '2023-03-02 20:14:54', '2023-03-02 20:14:54', NULL),
(459, 13, 50, 4, 1, 2, 1, '80', '2023-03-02 00:00:00', 2, 10.00, 1, '20', NULL, 'false', '2023-03-03 03:03:51', '2023-03-03 03:03:51', NULL),
(460, 22, 51, 1, 7, 1, 8, '100', '2023-03-03 00:00:38', 2, 10.97, 1, '18', NULL, 'false', '2023-03-03 17:17:27', '2023-03-03 17:17:27', NULL),
(461, 22, 38, 4, 6, 2, 7, '20', '2023-03-03 00:00:00', 3, 15.00, 1, '46', NULL, 'false', '2023-03-03 17:59:05', '2023-03-03 17:59:05', NULL),
(462, 22, 44, 4, 6, 2, 8, '10', '2023-03-03 00:00:00', 2, 15.00, 1, '46', NULL, 'false', '2023-03-03 17:59:11', '2023-03-03 17:59:11', NULL),
(463, 13, 50, 5, 1, 1, 6, '35.13', '2023-03-03 00:00:31', 1, 24.15, 1, '20', NULL, 'false', '2023-03-03 19:58:51', '2023-03-03 19:58:51', NULL),
(464, 13, 50, 4, 1, 2, 3, '60', '2023-03-03 00:00:00', 3, 10.00, 1, '20', NULL, 'false', '2023-03-03 20:13:53', '2023-03-03 20:13:53', NULL),
(465, 13, 50, 3, 1, 1, 6, '6.39', '2023-03-03 00:00:06', 4, 4.39, 1, '20', NULL, 'false', '2023-03-03 22:39:51', '2023-03-03 22:39:51', NULL),
(466, 17, 25, 1, 5, 1, 8, '100', '2023-03-03 00:00:03', 36, 12.94, 1, '4', NULL, 'false', '2023-03-04 07:57:36', '2023-03-04 07:57:36', NULL),
(467, 17, 25, 5, 5, 1, 4, '29.72', '2023-03-05 00:00:28', 1, 21.06, 1, '4', NULL, 'false', '2023-03-06 08:24:18', '2023-03-06 08:24:18', NULL),
(468, 13, 50, 3, 1, 1, 6, '6.39', '2023-03-06 00:00:07', 5, 4.39, 1, '20', NULL, 'false', '2023-03-06 19:18:48', '2023-03-06 19:18:48', NULL),
(469, 13, 50, 3, 1, 1, 3, '5.02', '2023-03-06 00:00:05', 6, 4.39, 1, '20', NULL, 'false', '2023-03-06 19:21:36', '2023-03-06 19:21:36', NULL),
(470, 13, 50, 3, 1, 1, 4, '5.4', '2023-03-06 00:00:07', 7, 4.39, 1, '20', NULL, 'false', '2023-03-06 19:24:06', '2023-03-06 19:24:06', NULL),
(471, 17, 25, 1, 5, 1, 6, '23.88', '2023-03-06 00:00:23', 37, 12.94, 1, '4', NULL, 'false', '2023-03-06 19:26:29', '2023-03-06 19:26:29', NULL),
(472, 13, 50, 3, 1, 1, 2, '4.68', '2023-03-06 00:00:04', 8, 4.39, 1, '20', NULL, 'false', '2023-03-06 19:35:26', '2023-03-06 19:35:26', NULL),
(473, 13, 50, 3, 1, 1, 6, '6.39', '2023-03-06 00:00:07', 9, 4.39, 1, '20', NULL, 'false', '2023-03-06 19:37:00', '2023-03-06 19:37:00', NULL),
(474, 13, 50, 4, 1, 2, 1, '80', '2023-03-06 00:00:00', 4, 10.00, 1, '20', NULL, 'false', '2023-03-06 19:44:24', '2023-03-06 19:44:24', NULL),
(475, 13, 50, 2, 1, 2, 6, '30', '2023-03-06 00:00:00', 1, 4.50, 1, '20', NULL, 'false', '2023-03-06 19:49:07', '2023-03-06 19:49:07', NULL),
(476, 13, 50, 3, 1, 1, 1, '4.39', '2023-03-06 00:00:07', 10, 4.39, 1, '20', NULL, 'false', '2023-03-06 20:02:09', '2023-03-06 20:02:09', NULL),
(477, 13, 50, 3, 1, 1, 1, '4.39', '2023-03-06 00:00:03', 11, 4.39, 1, '20', NULL, 'false', '2023-03-06 20:17:31', '2023-03-06 20:17:31', NULL),
(478, 13, 50, 3, 1, 1, 1, '4.39', '2023-03-06 00:00:03', 12, 4.39, 1, '20', NULL, 'false', '2023-03-06 20:18:38', '2023-03-06 20:18:38', NULL),
(479, 13, 50, 3, 1, 1, 1, '4.39', '2023-03-06 00:00:01', 13, 4.39, 1, '20', NULL, 'false', '2023-03-06 20:19:46', '2023-03-06 20:19:46', NULL),
(480, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-06 00:00:02', 38, 12.94, 1, '4', NULL, 'false', '2023-03-06 20:26:15', '2023-03-06 20:26:15', NULL),
(481, 17, 25, 1, 5, 1, 8, '100', '2023-03-06 00:01:03', 39, 12.94, 1, '4', NULL, 'false', '2023-03-06 20:37:15', '2023-03-06 20:37:15', NULL),
(482, 17, 25, 4, 5, 1, 3, '60', '2023-03-06 00:00:00', 8, 16.00, 1, '4', NULL, 'false', '2023-03-06 20:49:51', '2023-03-06 20:49:51', NULL),
(483, 17, 25, 2, 5, 1, 3, '60', '2023-03-06 00:00:00', 6, 6.00, 1, '4', NULL, 'false', '2023-03-06 20:52:12', '2023-03-06 20:52:12', NULL),
(484, 17, 26, 2, 5, 1, 5, '40', '2023-03-06 00:00:00', 8, 6.00, 1, '4', NULL, 'false', '2023-03-06 20:52:24', '2023-03-06 20:52:24', NULL),
(485, 13, 48, 2, 2, 1, 2, '70', '2023-03-06 00:00:00', 1, 4.50, 1, '20', NULL, 'false', '2023-03-06 20:58:24', '2023-03-06 20:58:24', NULL),
(486, 17, 25, 6, 5, 1, 2, '70', '2023-03-06 00:00:00', 5, 8.00, 1, '4', NULL, 'false', '2023-03-07 01:32:53', '2023-03-07 01:32:53', NULL),
(487, 17, 26, 6, 5, 1, 6, '30', '2023-03-06 00:00:00', 5, 8.00, 1, '4', NULL, 'false', '2023-03-07 01:33:02', '2023-03-07 01:33:02', NULL),
(488, 14, 13, 6, 8, 2, 1, '80', '2023-03-07 00:00:00', 2, 8.00, 1, '51', NULL, 'false', '2023-03-07 12:58:23', '2023-03-07 12:58:23', NULL),
(489, 14, 5, 1, 5, 1, 3, '18.77', '2023-03-07 00:00:18', 3, 12.94, 1, '51', NULL, 'false', '2023-03-07 12:59:20', '2023-03-07 12:59:20', NULL),
(490, 14, 13, 1, 5, 1, 8, '100', '2023-03-07 00:00:03', 6, 12.94, 1, '51', NULL, 'false', '2023-03-07 13:00:02', '2023-03-07 13:00:02', NULL),
(491, 14, 13, 2, 8, 2, 1, '80', '2023-03-07 00:00:00', 3, 6.00, 1, '51', NULL, 'false', '2023-03-07 13:00:31', '2023-03-07 13:00:31', NULL),
(492, 14, 20, 2, 8, 2, 6, '30', '2023-03-07 00:00:00', 5, 6.00, 1, '51', NULL, 'false', '2023-03-07 13:00:44', '2023-03-07 13:00:44', NULL),
(493, 14, 30, 3, 8, 1, 4, '5.4', '2023-03-07 00:00:17', 1, 3.14, 1, '51', NULL, 'false', '2023-03-07 13:01:37', '2023-03-07 13:01:37', NULL),
(494, 21, 23, 1, 8, 1, 4, '20.21', '2023-03-07 00:00:02', 20, 9.98, 1, '48', NULL, 'false', '2023-03-07 15:05:14', '2023-03-07 15:05:14', NULL),
(495, 21, 46, 1, 8, 1, 4, '20.21', '2023-03-07 00:00:21', 19, 9.98, 1, '48', NULL, 'false', '2023-03-07 15:06:11', '2023-03-07 15:06:11', NULL),
(496, 21, 23, 1, 8, 1, 5, '26.27', '2023-03-07 00:00:18', 21, 9.98, 1, '48', NULL, 'false', '2023-03-07 15:06:12', '2023-03-07 15:06:12', NULL),
(497, 21, 15, 2, 8, 1, 2, '70', '2023-03-07 00:00:00', 1, 6.50, 1, '48', NULL, 'false', '2023-03-07 15:06:50', '2023-03-07 15:06:50', NULL),
(498, 21, 15, 2, 8, 1, 3, '60', '2023-03-07 00:00:00', 2, 6.50, 1, '48', NULL, 'false', '2023-03-07 15:06:50', '2023-03-07 15:06:50', NULL),
(499, 21, 46, 3, 8, 1, 7, '7.02', '2023-03-07 00:00:07', 3, 3.14, 1, '48', NULL, 'false', '2023-03-07 15:08:47', '2023-03-07 15:08:47', NULL),
(500, 21, 46, 3, 8, 1, 8, '100', '2023-03-07 00:00:08', 3, 3.14, 1, '48', NULL, 'false', '2023-03-07 15:08:47', '2023-03-07 15:08:47', NULL),
(501, 21, 23, 4, 8, 1, 4, '50', '2023-03-07 00:00:00', 1, 20.00, 1, '48', NULL, 'false', '2023-03-07 15:09:36', '2023-03-07 15:09:36', NULL),
(502, 21, 23, 4, 8, 1, 1, '80', '2023-03-07 00:00:00', 2, 20.00, 1, '48', NULL, 'false', '2023-03-07 15:09:38', '2023-03-07 15:09:38', NULL),
(503, 21, 23, 5, 8, 1, 4, '29.72', '2023-03-07 00:00:28', 1, 18.34, 1, '48', NULL, 'false', '2023-03-07 15:11:03', '2023-03-07 15:11:03', NULL),
(504, 21, 23, 5, 8, 1, 4, '29.72', '2023-03-07 00:00:03', 2, 18.34, 1, '48', NULL, 'false', '2023-03-07 15:11:21', '2023-03-07 15:11:21', NULL),
(505, 21, 15, 5, 8, 1, 6, '35.13', '2023-03-07 00:00:33', 1, 18.34, 1, '48', NULL, 'false', '2023-03-07 15:12:29', '2023-03-07 15:12:29', NULL),
(506, 21, 23, 6, 8, 2, 7, '20', '2023-03-07 00:00:00', 1, 8.00, 1, '48', NULL, 'false', '2023-03-07 15:13:26', '2023-03-07 15:13:26', NULL),
(507, 21, 46, 6, 8, 2, 6, '30', '2023-03-07 00:00:00', 1, 8.00, 1, '48', NULL, 'false', '2023-03-07 15:13:28', '2023-03-07 15:13:28', NULL),
(508, 21, 23, 8, 8, 1, 8, '100', '2023-03-07 00:00:25', 1, 11.00, 1, '48', NULL, 'false', '2023-03-07 15:16:10', '2023-03-07 15:16:10', NULL),
(509, 21, 23, 8, 8, 1, 8, '100', '2023-03-07 00:00:23', 2, 11.00, 1, '48', NULL, 'false', '2023-03-07 15:16:17', '2023-03-07 15:16:17', NULL),
(510, 34, 21, 1, 8, 1, 1, '16.42', '2023-03-07 07:00:58', 2, 9.98, 1, '44', NULL, 'false', '2023-03-07 19:01:04', '2023-03-07 19:01:04', NULL),
(511, 13, 50, 2, 1, 2, 2, '70', '2023-03-07 00:00:00', 2, 4.50, 1, '20', NULL, 'false', '2023-03-07 20:48:21', '2023-03-07 20:48:21', NULL),
(512, 13, 48, 4, 2, 1, 3, '60', '2023-03-07 00:00:00', 2, 10.00, 1, '20', NULL, 'false', '2023-03-07 21:04:04', '2023-03-07 21:04:04', NULL),
(513, 13, 50, 2, 1, 2, 5, '40', '2023-03-07 00:00:00', 3, 4.50, 1, '20', NULL, 'false', '2023-03-07 21:23:46', '2023-03-07 21:23:46', NULL),
(514, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-08 02:18:05', 40, 12.94, 1, '4', NULL, 'false', '2023-03-08 15:18:05', '2023-03-08 15:18:05', NULL),
(515, 14, 20, 1, 8, 1, 3, '18.77', '2023-03-08 02:20:01', 15, 9.98, 1, '51', NULL, 'false', '2023-03-08 15:20:01', '2023-03-08 15:20:01', NULL),
(516, 17, 25, 1, 5, 1, 8, '100', '2023-03-08 03:13:04', 41, 12.94, 1, '4', NULL, 'false', '2023-03-08 16:13:04', '2023-03-08 16:13:04', NULL),
(517, 13, 30, 4, 8, 1, 3, '60', '2023-03-09 11:57:08', 1, 20.00, 1, '20', NULL, 'false', '2023-03-10 00:57:08', '2023-03-10 00:57:08', NULL),
(518, 13, 50, 4, 8, 1, 2, '70', '2023-03-09 11:57:19', 5, 20.00, 1, '20', NULL, 'false', '2023-03-10 00:57:19', '2023-03-10 00:57:19', NULL),
(519, 13, 48, 2, 2, 1, 6, '30', '2023-03-09 11:57:31', 2, 4.50, 1, '20', NULL, 'false', '2023-03-10 00:57:31', '2023-03-10 00:57:31', NULL),
(520, 13, 30, 2, 2, 1, 2, '70', '2023-03-09 11:59:10', 2, 4.50, 1, '20', NULL, 'false', '2023-03-10 00:59:10', '2023-03-10 00:59:10', NULL),
(521, 13, 50, 2, 2, 1, 4, '50', '2023-03-09 11:59:21', 4, 4.50, 1, '20', NULL, 'false', '2023-03-10 00:59:21', '2023-03-10 00:59:21', NULL),
(522, 14, 5, 1, 5, 1, 8, '100', '2023-03-10 06:02:53', 4, 12.94, 1, '51', NULL, 'false', '2023-03-10 19:02:53', '2023-03-10 19:02:53', NULL),
(523, 17, 25, 1, 5, 1, 7, '26.27', '2023-03-13 00:03:52', 42, 12.94, 1, '4', NULL, 'false', '2023-03-13 12:03:52', '2023-03-13 12:03:52', NULL),
(524, 21, 46, 1, 8, 1, 8, '100', '2023-03-13 02:11:36', 20, 9.98, 1, '48', NULL, 'false', '2023-03-13 14:11:36', '2023-03-13 14:11:36', NULL),
(525, 17, 25, 1, 5, 1, 7, '26.27', '2023-03-13 02:15:08', 43, 12.94, 1, '4', NULL, 'false', '2023-03-13 14:15:08', '2023-03-13 14:15:08', NULL),
(526, 19, 1, 1, 5, 1, 8, '100', '2023-03-13 02:24:14', 6, 12.94, 1, '43', NULL, 'false', '2023-03-13 14:24:14', '2023-03-13 14:24:14', NULL),
(527, 22, 51, 3, 7, 1, 8, '100', '2023-03-13 02:29:42', 1, 3.23, 1, '46', NULL, 'false', '2023-03-13 14:29:42', '2023-03-13 14:29:42', NULL),
(528, 22, 22, 3, 7, 1, 8, '100', '2023-03-13 02:30:00', 1, 3.23, 1, '46', NULL, 'false', '2023-03-13 14:30:00', '2023-03-13 14:30:00', NULL),
(529, 19, 1, 1, 5, 1, 7, '26.27', '2023-03-17 01:56:36', 7, 12.94, 1, '43', NULL, 'false', '2023-03-17 13:56:36', '2023-03-17 13:56:36', NULL),
(530, 21, 46, 3, 8, 1, 5, '5.85', '2023-03-17 02:00:05', 5, 3.14, 1, '48', NULL, 'false', '2023-03-17 14:00:05', '2023-03-17 14:00:05', NULL),
(531, 22, 38, 1, 6, 1, 8, '100', '2023-03-17 02:19:37', 4, 11.96, 1, '97', NULL, 'false', '2023-03-17 14:19:37', '2023-03-17 14:19:37', NULL),
(532, 22, 45, 3, 2, 1, 3, '5.02', '2023-03-17 02:24:39', 2, 4.21, 1, '97', NULL, 'false', '2023-03-17 14:24:39', '2023-03-17 14:24:39', NULL),
(533, 22, 38, 1, 6, 1, 8, '100', '2023-03-17 02:27:10', 5, 11.96, 1, '97', NULL, 'false', '2023-03-17 14:27:10', '2023-03-17 14:27:10', NULL),
(534, 22, 42, 2, 2, 2, 8, '10', '2023-03-17 02:28:17', 5, 4.50, 1, '97', NULL, 'false', '2023-03-17 14:28:17', '2023-03-17 14:28:17', NULL),
(535, 22, 45, 2, 2, 2, 7, '20', '2023-03-17 02:28:23', 2, 4.50, 1, '97', NULL, 'false', '2023-03-17 14:28:23', '2023-03-17 14:28:23', NULL),
(536, 22, 4, 2, 2, 2, 6, '30', '2023-03-17 02:28:27', 1, 4.50, 1, '97', NULL, 'false', '2023-03-17 14:28:27', '2023-03-17 14:28:27', NULL),
(537, 22, 38, 4, 6, 2, 5, '40', '2023-03-17 02:28:52', 4, 15.00, 1, '97', NULL, 'false', '2023-03-17 14:28:52', '2023-03-17 14:28:52', NULL),
(538, 22, 51, 4, 6, 2, 4, '50', '2023-03-17 02:28:56', 1, 15.00, 1, '97', NULL, 'false', '2023-03-17 14:28:56', '2023-03-17 14:28:56', NULL),
(539, 22, 42, 4, 6, 2, 3, '60', '2023-03-17 02:28:59', 3, 15.00, 1, '97', NULL, 'false', '2023-03-17 14:28:59', '2023-03-17 14:28:59', NULL),
(540, 22, 45, 4, 6, 2, 2, '70', '2023-03-17 02:29:03', 1, 15.00, 1, '97', NULL, 'false', '2023-03-17 14:29:03', '2023-03-17 14:29:03', NULL),
(541, 22, 38, 6, 6, 2, 8, '10', '2023-03-17 02:29:21', 2, 8.00, 1, '97', NULL, 'false', '2023-03-17 14:29:21', '2023-03-17 14:29:21', NULL),
(542, 22, 51, 6, 6, 2, 7, '20', '2023-03-17 02:29:25', 1, 8.00, 1, '97', NULL, 'false', '2023-03-17 14:29:25', '2023-03-17 14:29:25', NULL),
(543, 22, 42, 6, 6, 2, 5, '40', '2023-03-17 02:29:29', 3, 8.00, 1, '97', NULL, 'false', '2023-03-17 14:29:29', '2023-03-17 14:29:29', NULL),
(544, 22, 45, 6, 6, 2, 4, '50', '2023-03-17 02:29:33', 1, 8.00, 1, '97', NULL, 'false', '2023-03-17 14:29:33', '2023-03-17 14:29:33', NULL),
(545, 22, 45, 2, 3, 1, 7, '20', '2023-03-17 02:33:42', 3, 5.50, 1, '97', NULL, 'false', '2023-03-17 14:33:42', '2023-03-17 14:33:42', NULL),
(546, 22, 4, 2, 3, 1, 4, '50', '2023-03-17 02:33:46', 2, 5.50, 1, '97', NULL, 'false', '2023-03-17 14:33:46', '2023-03-17 14:33:46', NULL),
(547, 22, 38, 8, 6, 1, 6, '20.36', '2023-03-17 02:34:21', 2, 12.00, 1, '97', NULL, 'false', '2023-03-17 14:34:21', '2023-03-17 14:34:21', NULL),
(548, 22, 38, 3, 6, 1, 8, '100', '2023-03-17 02:39:31', 3, 3.43, 1, '97', NULL, 'false', '2023-03-17 14:39:31', '2023-03-17 14:39:31', NULL),
(549, 22, 51, 3, 6, 1, 8, '100', '2023-03-17 02:39:49', 2, 3.43, 1, '97', NULL, 'false', '2023-03-17 14:39:49', '2023-03-17 14:39:49', NULL),
(550, 22, 51, 3, 7, 1, 8, '100', '2023-03-17 02:40:21', 3, 3.23, 1, '97', NULL, 'false', '2023-03-17 14:40:21', '2023-03-17 14:40:21', NULL),
(551, 22, 42, 3, 7, 1, 8, '100', '2023-03-17 02:40:35', 2, 3.23, 1, '97', NULL, 'false', '2023-03-17 14:40:35', '2023-03-17 14:40:35', NULL),
(552, 22, 45, 3, 7, 1, 8, '100', '2023-03-17 02:40:48', 3, 3.23, 1, '97', NULL, 'false', '2023-03-17 14:40:48', '2023-03-17 14:40:48', NULL),
(553, 13, 50, 4, 1, 2, 3, '60', '2023-03-17 10:58:42', 6, 10.00, 1, '20', NULL, 'false', '2023-03-17 22:58:42', '2023-03-17 22:58:42', NULL),
(554, 22, 11, 1, 6, 1, 8, '100', '2023-03-17 10:59:19', 1, 11.96, 1, '36', NULL, 'false', '2023-03-17 22:59:19', '2023-03-17 22:59:19', NULL),
(555, 22, 44, 1, 6, 1, 1, '16.42', '2023-03-17 10:59:26', 1, 11.96, 1, '36', NULL, 'false', '2023-03-17 22:59:26', '2023-03-17 22:59:26', NULL),
(556, 22, 44, 1, 6, 1, 1, '16.42', '2023-03-17 10:59:43', 2, 11.96, 1, '36', NULL, 'false', '2023-03-17 22:59:43', '2023-03-17 22:59:43', NULL),
(557, 13, 50, 2, 8, 1, 2, '70', '2023-03-17 11:23:31', 5, 6.50, 1, '20', NULL, 'false', '2023-03-17 23:23:31', '2023-03-17 23:23:31', NULL),
(558, 13, 30, 3, 8, 1, 6, '6.39', '2023-03-17 11:46:12', 2, 3.14, 1, '20', NULL, 'false', '2023-03-17 23:46:12', '2023-03-17 23:46:12', NULL),
(559, 17, 26, 3, 8, 1, 8, '100', '2023-03-19 09:17:17', 3, 3.14, 1, '4', NULL, 'false', '2023-03-19 21:17:17', '2023-03-19 21:17:17', NULL),
(560, 17, 25, 5, 5, 1, 8, '100', '2023-03-19 12:25:36', 2, 21.06, 1, '4', NULL, 'false', '2023-03-20 00:25:36', '2023-03-20 00:25:36', NULL),
(561, 17, 25, 1, 5, 1, 8, '100', '2023-03-20 08:31:47', 44, 12.94, 1, '4', NULL, 'false', '2023-03-20 20:31:47', '2023-03-20 20:31:47', NULL),
(562, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-20 23:34:08', 45, 12.94, 1, '4', NULL, 'false', '2023-03-21 11:34:08', '2023-03-21 11:34:08', NULL),
(563, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-20 23:34:15', 7, 12.94, 1, '4', NULL, 'false', '2023-03-21 11:34:15', '2023-03-21 11:34:15', NULL),
(564, 17, 26, 1, 8, 1, 6, '23.88', '2023-03-20 23:35:00', 8, 9.98, 1, '4', NULL, 'false', '2023-03-21 11:35:00', '2023-03-21 11:35:00', NULL),
(565, 17, 25, 2, 5, 1, 6, '30', '2023-03-20 23:36:50', 7, 6.00, 1, '4', NULL, 'false', '2023-03-21 11:36:50', '2023-03-21 11:36:50', NULL),
(566, 17, 26, 2, 5, 1, 4, '50', '2023-03-20 23:37:06', 9, 6.00, 1, '4', NULL, 'false', '2023-03-21 11:37:06', '2023-03-21 11:37:06', NULL),
(567, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-21 11:52:06', 46, 12.94, 1, '4', NULL, 'false', '2023-03-21 23:52:06', '2023-03-21 23:52:06', NULL),
(568, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-21 11:52:12', 9, 12.94, 1, '4', NULL, 'false', '2023-03-21 23:52:12', '2023-03-21 23:52:12', NULL),
(569, 17, 26, 2, 5, 1, 7, '20', '2023-03-21 11:54:09', 10, 6.00, 1, '4', NULL, 'false', '2023-03-21 23:54:09', '2023-03-21 23:54:09', NULL),
(570, 13, 30, 2, 8, 1, 3, '60', '2023-03-21 15:25:00', 3, 6.50, 1, '20', NULL, 'false', '2023-03-22 03:25:00', '2023-03-22 03:25:00', NULL),
(571, 13, 30, 2, 8, 1, 3, '60', '2023-03-21 15:32:37', 4, 6.50, 1, '20', NULL, 'false', '2023-03-22 03:32:37', '2023-03-22 03:32:37', NULL),
(572, 13, 48, 2, 8, 1, 6, '30', '2023-03-21 15:32:56', 3, 6.50, 1, '20', NULL, 'false', '2023-03-22 03:32:56', '2023-03-22 03:32:56', NULL),
(573, 13, 48, 2, 2, 1, 2, '70', '2023-03-21 15:33:43', 4, 4.50, 1, '20', NULL, 'false', '2023-03-22 03:33:43', '2023-03-22 03:33:43', NULL),
(574, 13, 30, 2, 8, 1, 1, '80', '2023-03-21 15:33:52', 5, 6.50, 1, '20', NULL, 'false', '2023-03-22 03:33:52', '2023-03-22 03:33:52', NULL),
(575, 13, 50, 4, 1, 2, 4, '50', '2023-03-21 16:25:19', 7, 10.00, 1, '20', NULL, 'false', '2023-03-22 04:25:19', '2023-03-22 04:25:19', NULL),
(576, 13, 48, 2, 2, 1, 5, '40', '2023-03-21 16:30:53', 5, 4.50, 1, '20', NULL, 'false', '2023-03-22 04:30:53', '2023-03-22 04:30:53', NULL),
(577, 13, 30, 2, 2, 1, 2, '70', '2023-03-21 16:30:57', 6, 4.50, 1, '20', NULL, 'false', '2023-03-22 04:30:57', '2023-03-22 04:30:57', NULL),
(578, 13, 50, 2, 2, 1, 3, '60', '2023-03-21 16:31:04', 6, 4.50, 1, '20', NULL, 'false', '2023-03-22 04:31:04', '2023-03-22 04:31:04', NULL),
(579, 22, 44, 1, 8, 1, 1, '16.42', '2023-03-21 16:35:13', 3, 9.98, 1, '36', NULL, 'false', '2023-03-22 04:35:13', '2023-03-22 04:35:13', NULL),
(580, 22, 44, 1, 8, 1, 1, '16.42', '2023-03-21 16:35:32', 4, 9.98, 1, '36', NULL, 'false', '2023-03-22 04:35:32', '2023-03-22 04:35:32', NULL),
(581, 22, 44, 1, 8, 1, 1, '16.42', '2023-03-21 16:37:26', 5, 9.98, 1, '36', NULL, 'false', '2023-03-22 04:37:26', '2023-03-22 04:37:26', NULL),
(582, 22, 11, 1, 6, 1, 1, '16.42', '2023-03-21 16:37:42', 2, 11.96, 1, '36', NULL, 'false', '2023-03-22 04:37:42', '2023-03-22 04:37:42', NULL),
(583, 13, 30, 4, 2, 1, 2, '70', '2023-03-21 16:38:47', 2, 10.00, 1, '20', NULL, 'false', '2023-03-22 04:38:47', '2023-03-22 04:38:47', NULL),
(584, 13, 48, 4, 2, 1, 2, '70', '2023-03-21 16:38:56', 3, 10.00, 1, '20', NULL, 'false', '2023-03-22 04:38:56', '2023-03-22 04:38:56', NULL),
(585, 13, 50, 4, 2, 1, 2, '70', '2023-03-21 16:39:00', 8, 10.00, 1, '20', NULL, 'false', '2023-03-22 04:39:00', '2023-03-22 04:39:00', NULL),
(586, 22, 11, 1, 6, 1, 1, '16.42', '2023-03-21 16:39:54', 3, 11.96, 1, '36', NULL, 'false', '2023-03-22 04:39:54', '2023-03-22 04:39:54', NULL),
(587, 22, 44, 1, 6, 1, 1, '16.42', '2023-03-21 16:40:07', 6, 11.96, 1, '36', NULL, 'false', '2023-03-22 04:40:07', '2023-03-22 04:40:07', NULL),
(588, 22, 11, 1, 8, 1, 1, '16.42', '2023-03-21 16:41:41', 4, 9.98, 1, '36', NULL, 'false', '2023-03-22 04:41:41', '2023-03-22 04:41:41', NULL),
(589, 22, 44, 1, 8, 1, 1, '16.42', '2023-03-21 16:41:59', 7, 9.98, 1, '36', NULL, 'false', '2023-03-22 04:41:59', '2023-03-22 04:41:59', NULL),
(590, 7, 16, 1, 8, 1, 6, '23.88', '2023-03-21 18:36:33', 4, 9.98, 1, '96', NULL, 'false', '2023-03-22 06:36:33', '2023-03-22 06:36:33', NULL),
(591, 7, 16, 1, 8, 1, 8, '100', '2023-03-21 18:37:34', 5, 9.98, 1, '96', NULL, 'false', '2023-03-22 06:37:34', '2023-03-22 06:37:34', NULL),
(592, 7, 1, 2, 5, 2, 5, '40', '2023-03-21 18:38:01', 1, 5.50, 1, '96', NULL, 'false', '2023-03-22 06:38:01', '2023-03-22 06:38:01', NULL),
(593, 7, 2, 2, 5, 2, 3, '60', '2023-03-21 18:38:04', 5, 5.50, 1, '96', NULL, 'false', '2023-03-22 06:38:04', '2023-03-22 06:38:04', NULL),
(594, 7, 35, 2, 5, 2, 2, '70', '2023-03-21 18:38:06', 2, 5.50, 1, '96', NULL, 'false', '2023-03-22 06:38:06', '2023-03-22 06:38:06', NULL),
(595, 7, 16, 2, 5, 2, 4, '50', '2023-03-21 18:38:08', 1, 5.50, 1, '96', NULL, 'false', '2023-03-22 06:38:08', '2023-03-22 06:38:08', NULL),
(596, 7, 1, 1, 5, 1, 7, '26.27', '2023-03-22 00:57:26', 8, 12.94, 1, '96', NULL, 'false', '2023-03-22 12:57:26', '2023-03-22 12:57:26', NULL),
(597, 7, 1, 2, 5, 2, 8, '10', '2023-03-22 01:01:07', 2, 5.50, 1, '96', NULL, 'false', '2023-03-22 13:01:07', '2023-03-22 13:01:07', NULL),
(598, 7, 16, 2, 5, 2, 3, '60', '2023-03-22 01:01:16', 2, 5.50, 1, '96', NULL, 'false', '2023-03-22 13:01:16', '2023-03-22 13:01:16', NULL),
(599, 7, 2, 1, 5, 1, 1, '16.42', '2023-03-22 01:02:38', 16, 12.94, 1, '96', NULL, 'false', '2023-03-22 13:02:38', '2023-03-22 13:02:38', NULL),
(600, 7, 16, 2, 8, 1, 8, '10', '2023-03-22 01:02:56', 3, 6.50, 1, '96', NULL, 'false', '2023-03-22 13:02:56', '2023-03-22 13:02:56', NULL),
(601, 7, 2, 1, 5, 1, 6, '23.88', '2023-03-22 01:03:39', 17, 12.94, 1, '96', NULL, 'false', '2023-03-22 13:03:39', '2023-03-22 13:03:39', NULL),
(602, 7, 16, 2, 8, 1, 4, '50', '2023-03-22 01:04:57', 4, 6.50, 1, '96', NULL, 'false', '2023-03-22 13:04:57', '2023-03-22 13:04:57', NULL),
(603, 7, 1, 2, 5, 2, 4, '50', '2023-03-22 01:05:50', 3, 5.50, 1, '96', NULL, 'false', '2023-03-22 13:05:50', '2023-03-22 13:05:50', NULL),
(604, 7, 16, 2, 5, 2, 1, '80', '2023-03-22 01:05:56', 5, 5.50, 1, '96', NULL, 'false', '2023-03-22 13:05:56', '2023-03-22 13:05:56', NULL),
(605, 7, 2, 3, 5, 1, 8, '100', '2023-03-22 01:06:56', 3, 3.23, 1, '96', NULL, 'false', '2023-03-22 13:06:56', '2023-03-22 13:06:56', NULL),
(606, 7, 35, 4, 5, 1, 3, '60', '2023-03-22 01:07:24', 1, 16.00, 1, '96', NULL, 'false', '2023-03-22 13:07:24', '2023-03-22 13:07:24', NULL),
(607, 7, 16, 4, 5, 1, 3, '60', '2023-03-22 01:07:32', 2, 16.00, 1, '96', NULL, 'false', '2023-03-22 13:07:32', '2023-03-22 13:07:32', NULL),
(608, 7, 2, 4, 5, 1, 7, '20', '2023-03-22 01:08:05', 3, 16.00, 1, '96', NULL, 'false', '2023-03-22 13:08:05', '2023-03-22 13:08:05', NULL),
(609, 7, 16, 4, 8, 1, 4, '50', '2023-03-22 01:08:50', 3, 20.00, 1, '96', NULL, 'false', '2023-03-22 13:08:50', '2023-03-22 13:08:50', NULL),
(610, 7, 2, 5, 5, 1, 1, '24.15', '2023-03-22 01:09:35', 1, 21.06, 1, '96', NULL, 'false', '2023-03-22 13:09:35', '2023-03-22 13:09:35', NULL),
(611, 7, 16, 5, 8, 1, 1, '24.15', '2023-03-22 01:09:35', 3, 18.34, 1, '96', NULL, 'false', '2023-03-22 13:09:35', '2023-03-22 13:09:35', NULL),
(612, 7, 35, 5, 5, 1, 7, '38.64', '2023-03-22 01:10:29', 2, 21.06, 1, '96', NULL, 'false', '2023-03-22 13:10:29', '2023-03-22 13:10:29', NULL),
(613, 7, 1, 5, 5, 1, 6, '35.13', '2023-03-22 01:10:42', 1, 21.06, 1, '96', NULL, 'false', '2023-03-22 13:10:42', '2023-03-22 13:10:42', NULL),
(614, 7, 2, 8, 5, 1, 6, '20.36', '2023-03-22 01:13:52', 1, 12.00, 1, '96', NULL, 'false', '2023-03-22 13:13:52', '2023-03-22 13:13:52', NULL),
(615, 7, 16, 8, 8, 1, 6, '20.36', '2023-03-22 01:13:53', 2, 11.00, 1, '96', NULL, 'false', '2023-03-22 13:13:53', '2023-03-22 13:13:53', NULL),
(616, 7, 35, 8, 5, 1, 4, '17.23', '2023-03-22 01:14:34', 2, 12.00, 1, '96', NULL, 'false', '2023-03-22 13:14:34', '2023-03-22 13:14:34', NULL),
(617, 7, 35, 8, 8, 1, 4, '17.23', '2023-03-22 01:14:34', 2, 11.00, 1, '96', NULL, 'false', '2023-03-22 13:14:34', '2023-03-22 13:14:34', NULL),
(618, 17, 25, 6, 5, 1, 7, '20', '2023-03-22 06:32:42', 6, 8.00, 1, '4', NULL, 'false', '2023-03-22 18:32:42', '2023-03-22 18:32:42', NULL),
(619, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:34:46', 10, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:34:46', '2023-03-22 18:34:46', NULL),
(620, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:35:09', 47, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:35:09', '2023-03-22 18:35:09', NULL),
(621, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:39:29', 11, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:39:29', '2023-03-22 18:39:29', NULL),
(622, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:40:25', 12, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:40:25', '2023-03-22 18:40:25', NULL),
(623, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:41:48', 13, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:41:48', '2023-03-22 18:41:48', NULL),
(624, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:41:56', 48, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:41:56', '2023-03-22 18:41:56', NULL),
(625, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:42:57', 49, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:42:57', '2023-03-22 18:42:57', NULL),
(626, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:43:02', 14, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:43:02', '2023-03-22 18:43:02', NULL),
(627, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:43:29', 50, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:43:29', '2023-03-22 18:43:29', NULL),
(628, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:43:37', 15, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:43:37', '2023-03-22 18:43:37', NULL),
(629, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:44:22', 51, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:44:22', '2023-03-22 18:44:22', NULL),
(630, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:44:27', 16, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:44:27', '2023-03-22 18:44:27', NULL),
(631, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:46:11', 52, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:46:11', '2023-03-22 18:46:11', NULL),
(632, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:46:17', 17, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:46:17', '2023-03-22 18:46:17', NULL),
(633, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-22 06:46:36', 18, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:46:36', '2023-03-22 18:46:36', NULL),
(634, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-22 06:46:43', 53, 12.94, 1, '4', NULL, 'false', '2023-03-22 18:46:43', '2023-03-22 18:46:43', NULL),
(635, 15, 42, 1, 2, 1, 6, '23.88', '2023-03-22 12:36:55', 9, 15.59, 1, '39', NULL, 'false', '2023-03-23 00:36:55', '2023-03-23 00:36:55', NULL),
(636, 15, 42, 1, 2, 1, 4, '20.21', '2023-03-23 08:10:00', 10, 15.59, 1, '39', NULL, 'false', '2023-03-23 20:10:00', '2023-03-23 20:10:00', NULL),
(637, 13, 30, 4, 8, 1, 7, '20', '2023-03-25 05:43:24', 3, 20.00, 1, '20', NULL, 'false', '2023-03-25 17:43:24', '2023-03-25 17:43:24', NULL),
(638, 13, 50, 4, 8, 1, 5, '40', '2023-03-25 05:43:40', 9, 20.00, 1, '20', NULL, 'false', '2023-03-25 17:43:40', '2023-03-25 17:43:40', NULL),
(639, 15, 42, 1, 2, 1, 4, '20.21', '2023-03-26 12:39:43', 11, 15.59, 1, '39', NULL, 'false', '2023-03-27 00:39:43', '2023-03-27 00:39:43', NULL),
(640, 17, 25, 1, 5, 1, 1, '16.42', '2023-03-26 20:11:17', 54, 12.94, 1, '4', NULL, 'false', '2023-03-27 08:11:17', '2023-03-27 08:11:17', NULL),
(641, 17, 26, 1, 5, 1, 1, '16.42', '2023-03-26 20:11:24', 19, 12.94, 1, '4', NULL, 'false', '2023-03-27 08:11:24', '2023-03-27 08:11:24', NULL),
(642, 22, 38, 1, 6, 1, 8, '100', '2023-03-27 18:19:28', 6, 11.96, 1, '97', NULL, 'false', '2023-03-28 06:19:28', '2023-03-28 06:19:28', NULL),
(643, 22, 45, 2, 3, 1, 8, '10', '2023-03-27 18:19:55', 4, 5.50, 1, '97', NULL, 'false', '2023-03-28 06:19:55', '2023-03-28 06:19:55', NULL),
(644, 22, 4, 2, 3, 1, 3, '60', '2023-03-27 18:19:58', 3, 5.50, 1, '97', NULL, 'false', '2023-03-28 06:19:58', '2023-03-28 06:19:58', NULL),
(645, 22, 38, 4, 6, 2, 5, '40', '2023-03-27 18:21:45', 5, 15.00, 1, '97', NULL, 'false', '2023-03-28 06:21:45', '2023-03-28 06:21:45', NULL),
(646, 22, 45, 4, 6, 2, 1, '80', '2023-03-27 18:21:47', 2, 15.00, 1, '97', NULL, 'false', '2023-03-28 06:21:47', '2023-03-28 06:21:47', NULL),
(647, 22, 4, 4, 6, 2, 4, '50', '2023-03-27 18:21:51', 1, 15.00, 1, '97', NULL, 'false', '2023-03-28 06:21:51', '2023-03-28 06:21:51', NULL),
(648, 22, 4, 5, 8, 1, 8, '100', '2023-03-27 18:22:52', 1, 18.34, 1, '97', NULL, 'false', '2023-03-28 06:22:52', '2023-03-28 06:22:52', NULL),
(649, 22, 4, 8, 8, 1, 6, '20.36', '2023-03-27 18:24:26', 1, 11.00, 1, '97', NULL, 'false', '2023-03-28 06:24:26', '2023-03-28 06:24:26', NULL),
(650, 22, 4, 1, 8, 1, 8, '100', '2023-03-27 21:45:27', 2, 9.98, 1, '97', NULL, 'false', '2023-03-28 09:45:27', '2023-03-28 09:45:27', NULL),
(651, 22, 38, 1, 8, 1, 3, '18.77', '2023-03-27 21:45:57', 7, 9.98, 1, '97', NULL, 'false', '2023-03-28 09:45:57', '2023-03-28 09:45:57', NULL),
(652, 22, 45, 2, 3, 1, 4, '50', '2023-03-27 21:46:13', 5, 5.50, 1, '97', NULL, 'false', '2023-03-28 09:46:13', '2023-03-28 09:46:13', NULL),
(653, 22, 45, 4, 3, 1, 1, '80', '2023-03-27 21:47:24', 3, 15.00, 1, '97', NULL, 'false', '2023-03-28 09:47:24', '2023-03-28 09:47:24', NULL),
(654, 22, 4, 4, 3, 1, 3, '60', '2023-03-27 21:47:28', 2, 15.00, 1, '97', NULL, 'false', '2023-03-28 09:47:28', '2023-03-28 09:47:28', NULL),
(655, 22, 45, 5, 3, 1, 6, '35.13', '2023-03-27 21:48:26', 1, 22.69, 1, '97', NULL, 'false', '2023-03-28 09:48:26', '2023-03-28 09:48:26', NULL),
(656, 22, 4, 5, 3, 1, 4, '29.72', '2023-03-27 21:49:07', 2, 22.69, 1, '97', NULL, 'false', '2023-03-28 09:49:07', '2023-03-28 09:49:07', NULL),
(657, 22, 4, 8, 8, 1, 6, '20.36', '2023-03-27 22:12:08', 2, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:12:08', '2023-03-28 10:12:08', NULL),
(658, 22, 38, 8, 8, 1, 5, '18.67', '2023-03-27 22:14:04', 3, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:14:04', '2023-03-28 10:14:04', NULL),
(659, 22, 38, 8, 8, 1, 1, '14', '2023-03-27 22:15:32', 4, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:15:32', '2023-03-28 10:15:32', NULL),
(660, 22, 45, 8, 8, 1, 1, '14', '2023-03-27 22:15:42', 1, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:15:42', '2023-03-28 10:15:42', NULL),
(661, 22, 4, 8, 8, 1, 1, '14', '2023-03-27 22:15:54', 3, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:15:54', '2023-03-28 10:15:54', NULL),
(662, 22, 4, 8, 8, 1, 3, '16', '2023-03-27 22:16:37', 4, 11.00, 1, '97', NULL, 'false', '2023-03-28 10:16:37', '2023-03-28 10:16:37', NULL),
(663, 22, 45, 6, 3, 1, 3, '60', '2023-03-27 22:18:13', 2, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:18:13', '2023-03-28 10:18:13', NULL),
(664, 22, 38, 4, 6, 2, 6, '30', '2023-03-27 22:24:33', 6, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:24:33', '2023-03-28 10:24:33', NULL),
(665, 22, 4, 4, 6, 2, 4, '50', '2023-03-27 22:24:41', 3, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:24:41', '2023-03-28 10:24:41', NULL),
(666, 22, 4, 1, 8, 1, 4, '20.21', '2023-03-27 22:25:41', 3, 9.98, 1, '97', NULL, 'false', '2023-03-28 10:25:41', '2023-03-28 10:25:41', NULL),
(667, 22, 38, 1, 6, 1, 7, '26.27', '2023-03-27 22:36:58', 8, 11.96, 1, '97', NULL, 'false', '2023-03-28 10:36:58', '2023-03-28 10:36:58', NULL),
(668, 22, 4, 1, 8, 1, 5, '21.89', '2023-03-27 22:36:58', 4, 9.98, 1, '97', NULL, 'false', '2023-03-28 10:36:58', '2023-03-28 10:36:58', NULL),
(669, 22, 45, 2, 3, 1, 6, '30', '2023-03-27 22:40:45', 6, 5.50, 1, '97', NULL, 'false', '2023-03-28 10:40:45', '2023-03-28 10:40:45', NULL),
(670, 22, 4, 2, 3, 1, 7, '20', '2023-03-27 22:41:01', 4, 5.50, 1, '97', NULL, 'false', '2023-03-28 10:41:01', '2023-03-28 10:41:01', NULL),
(671, 22, 38, 4, 6, 2, 7, '20', '2023-03-27 22:41:46', 7, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:41:46', '2023-03-28 10:41:46', NULL),
(672, 22, 45, 4, 6, 2, 6, '30', '2023-03-27 22:42:02', 4, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:42:02', '2023-03-28 10:42:02', NULL),
(673, 22, 4, 4, 6, 2, 2, '70', '2023-03-27 22:42:32', 4, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:42:32', '2023-03-28 10:42:32', NULL),
(674, 22, 38, 2, 6, 2, 7, '20', '2023-03-27 22:44:43', 2, 5.50, 1, '97', NULL, 'false', '2023-03-28 10:44:43', '2023-03-28 10:44:43', NULL),
(675, 22, 45, 4, 3, 1, 4, '50', '2023-03-27 22:45:03', 5, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:45:03', '2023-03-28 10:45:03', NULL),
(676, 22, 45, 6, 3, 1, 4, '50', '2023-03-27 22:45:27', 3, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:45:27', '2023-03-28 10:45:27', NULL),
(677, 22, 38, 6, 6, 2, 7, '20', '2023-03-27 22:46:00', 3, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:46:00', '2023-03-28 10:46:00', NULL),
(678, 22, 45, 6, 6, 2, 8, '10', '2023-03-27 22:46:06', 4, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:46:06', '2023-03-28 10:46:06', NULL),
(679, 22, 38, 5, 6, 1, 7, '38.64', '2023-03-27 22:48:29', 5, 20.15, 1, '97', NULL, 'false', '2023-03-28 10:48:29', '2023-03-28 10:48:29', NULL),
(680, 22, 45, 5, 3, 1, 6, '35.13', '2023-03-27 22:48:29', 2, 22.69, 1, '97', NULL, 'false', '2023-03-28 10:48:29', '2023-03-28 10:48:29', NULL),
(681, 22, 4, 5, 8, 1, 7, '38.64', '2023-03-27 22:48:30', 3, 18.34, 1, '97', NULL, 'false', '2023-03-28 10:48:30', '2023-03-28 10:48:30', NULL),
(682, 22, 38, 4, 6, 2, 6, '30', '2023-03-27 22:49:48', 8, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:49:48', '2023-03-28 10:49:48', NULL),
(683, 22, 45, 4, 6, 2, 6, '30', '2023-03-27 22:50:41', 6, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:50:41', '2023-03-28 10:50:41', NULL),
(684, 22, 38, 4, 6, 2, 7, '20', '2023-03-27 22:52:16', 9, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:52:16', '2023-03-28 10:52:16', NULL),
(685, 22, 38, 4, 6, 2, 6, '30', '2023-03-27 22:52:21', 10, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:52:21', '2023-03-28 10:52:21', NULL),
(686, 22, 38, 4, 6, 2, 5, '40', '2023-03-27 22:52:25', 11, 15.00, 1, '97', NULL, 'false', '2023-03-28 10:52:25', '2023-03-28 10:52:25', NULL),
(687, 22, 45, 6, 3, 1, 6, '30', '2023-03-27 22:55:18', 5, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:55:18', '2023-03-28 10:55:18', NULL),
(688, 22, 45, 6, 3, 1, 8, '10', '2023-03-27 22:55:28', 6, 8.00, 1, '97', NULL, 'false', '2023-03-28 10:55:28', '2023-03-28 10:55:28', NULL),
(689, 22, 45, 1, 3, 1, 1, '16.42', '2023-03-27 23:11:06', 2, 14.76, 1, '97', NULL, 'false', '2023-03-28 11:11:06', '2023-03-28 11:11:06', NULL),
(690, 22, 38, 1, 6, 1, 1, '16.42', '2023-03-28 12:33:28', 9, 11.96, 1, '97', NULL, 'false', '2023-03-29 00:33:28', '2023-03-29 00:33:28', NULL),
(691, 22, 38, 1, 6, 1, 1, '16.42', '2023-03-28 16:38:44', 10, 11.96, 1, '97', NULL, 'false', '2023-03-29 04:38:44', '2023-03-29 04:38:44', NULL),
(692, 22, 38, 2, 6, 2, 8, '10', '2023-03-28 19:16:01', 3, 5.50, 1, '97', NULL, 'false', '2023-03-29 07:16:01', '2023-03-29 07:16:01', NULL),
(693, 37, 58, 3, 4, 1, 8, '100', '2023-03-28 21:53:39', 1, 3.85, 1, '99', NULL, 'false', '2023-03-29 09:53:39', '2023-03-29 09:53:39', NULL),
(694, 37, 58, 1, 4, 1, 7, '26.27', '2023-03-28 21:55:24', 1, 13.93, 1, '99', NULL, 'false', '2023-03-29 09:55:24', '2023-03-29 09:55:24', NULL),
(695, 37, 58, 2, 4, 1, 3, '60', '2023-03-28 21:55:45', 1, 5.50, 1, '99', NULL, 'false', '2023-03-29 09:55:45', '2023-03-29 09:55:45', NULL),
(696, 37, 57, 2, 3, 1, 3, '60', '2023-03-28 21:56:09', 1, 5.50, 1, '99', NULL, 'false', '2023-03-29 09:56:09', '2023-03-29 09:56:09', NULL),
(697, 37, 58, 2, 3, 1, 4, '50', '2023-03-28 21:56:18', 2, 5.50, 1, '99', NULL, 'false', '2023-03-29 09:56:18', '2023-03-29 09:56:18', NULL),
(698, 37, 57, 2, 3, 1, 6, '30', '2023-03-28 21:57:31', 2, 5.50, 1, '99', NULL, 'false', '2023-03-29 09:57:31', '2023-03-29 09:57:31', NULL),
(699, 37, 57, 2, 3, 1, 7, '20', '2023-03-28 22:05:39', 3, 5.50, 1, '99', NULL, 'false', '2023-03-29 10:05:39', '2023-03-29 10:05:39', NULL),
(700, 37, 57, 2, 3, 1, 7, '20', '2023-03-28 22:12:05', 4, 5.50, 1, '99', NULL, 'false', '2023-03-29 10:12:05', '2023-03-29 10:12:05', NULL),
(701, 37, 57, 2, 3, 1, 2, '70', '2023-03-28 22:12:18', 5, 5.50, 1, '99', NULL, 'false', '2023-03-29 10:12:18', '2023-03-29 10:12:18', NULL),
(702, 37, 57, 4, 3, 1, 4, '50', '2023-03-28 22:14:35', 1, 15.00, 1, '99', NULL, 'false', '2023-03-29 10:14:35', '2023-03-29 10:14:35', NULL),
(703, 37, 57, 4, 3, 1, 1, '80', '2023-03-28 22:14:49', 2, 15.00, 1, '99', NULL, 'false', '2023-03-29 10:14:49', '2023-03-29 10:14:49', NULL),
(704, 37, 58, 5, 4, 1, 4, '29.72', '2023-03-28 22:15:50', 1, 21.97, 1, '99', NULL, 'false', '2023-03-29 10:15:50', '2023-03-29 10:15:50', NULL),
(705, 37, 57, 5, 3, 1, 5, '32.2', '2023-03-28 22:15:50', 1, 22.69, 1, '99', NULL, 'false', '2023-03-29 10:15:50', '2023-03-29 10:15:50', NULL),
(706, 37, 57, 4, 4, 1, 7, '20', '2023-03-28 22:20:44', 3, 15.00, 1, '99', NULL, 'false', '2023-03-29 10:20:44', '2023-03-29 10:20:44', NULL),
(707, 37, 58, 8, 4, 1, 6, '20.36', '2023-03-28 22:23:27', 1, 13.00, 1, '99', NULL, 'false', '2023-03-29 10:23:27', '2023-03-29 10:23:27', NULL),
(708, 37, 57, 8, 4, 1, 7, '22.4', '2023-03-28 22:24:58', 1, 13.00, 1, '99', NULL, 'false', '2023-03-29 10:24:58', '2023-03-29 10:24:58', NULL),
(709, 37, 57, 8, 4, 1, 1, '14', '2023-03-28 22:25:10', 2, 13.00, 1, '99', NULL, 'false', '2023-03-29 10:25:10', '2023-03-29 10:25:10', NULL),
(710, 17, 25, 1, 5, 1, 1, '12.94', '2023-03-29 12:28:11', 55, 12.94, 1, '4', NULL, 'false', '2023-03-30 00:28:11', '2023-03-30 00:28:11', NULL),
(711, 37, 56, 1, 3, 2, 7, '23.62', '2023-03-29 19:31:42', 1, 14.76, 1, '98', NULL, 'false', '2023-03-30 07:31:42', '2023-03-30 07:31:42', NULL);
INSERT INTO `assessment_results` (`id`, `EventID`, `ParticipantID`, `AssessmentID`, `GradeID`, `GenderID`, `ColorID`, `Results`, `DTRecorded`, `Attempt`, `Percent`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(712, 37, 55, 1, 3, 2, 8, '100', '2023-03-29 19:34:04', 1, 14.76, 1, '98', NULL, 'false', '2023-03-30 07:34:04', '2023-03-30 07:34:04', NULL),
(713, 37, 56, 2, 8, 1, 2, '70', '2023-03-29 19:35:00', 1, 6.50, 1, '98', NULL, 'false', '2023-03-30 07:35:00', '2023-03-30 07:35:00', NULL),
(714, 37, 54, 3, 7, 1, 8, '100', '2023-03-29 19:45:24', 1, 3.23, 1, '98', NULL, 'false', '2023-03-30 07:45:24', '2023-03-30 07:45:24', NULL),
(715, 37, 54, 4, 8, 1, 6, '30', '2023-03-29 19:49:02', 1, 20.00, 1, '98', NULL, 'false', '2023-03-30 07:49:02', '2023-03-30 07:49:02', NULL),
(716, 37, 56, 5, 3, 2, 8, '100', '2023-03-29 19:54:32', 1, 22.69, 1, '98', NULL, 'false', '2023-03-30 07:54:32', '2023-03-30 07:54:32', NULL),
(717, 37, 54, 5, 3, 1, 8, '100', '2023-03-29 19:55:45', 1, 22.69, 1, '98', NULL, 'false', '2023-03-30 07:55:45', '2023-03-30 07:55:45', NULL),
(718, 37, 55, 6, 7, 2, 5, '40', '2023-03-29 19:56:09', 1, 8.00, 1, '98', NULL, 'false', '2023-03-30 07:56:09', '2023-03-30 07:56:09', NULL),
(719, 37, 56, 6, 7, 2, 7, '20', '2023-03-29 19:56:13', 1, 8.00, 1, '98', NULL, 'false', '2023-03-30 07:56:13', '2023-03-30 07:56:13', NULL),
(720, 37, 54, 3, 8, 1, 8, '100', '2023-03-29 20:07:46', 2, 3.14, 1, '98', NULL, 'false', '2023-03-30 08:07:46', '2023-03-30 08:07:46', NULL),
(721, 37, 54, 3, 8, 1, 8, '100', '2023-03-29 23:10:47', 3, 3.14, 1, '98', NULL, 'false', '2023-03-30 11:10:47', '2023-03-30 11:10:47', NULL),
(722, 22, 38, 1, 6, 2, 7, '19.14', '2023-03-30 21:11:51', 11, 11.96, 1, '97', NULL, 'false', '2023-03-31 09:11:51', '2023-03-31 09:11:51', NULL),
(723, 22, 38, 5, 6, 2, 3, '24.39', '2023-03-30 21:18:36', 6, 21.34, 1, '97', NULL, 'false', '2023-03-31 09:18:36', '2023-03-31 09:18:36', NULL),
(724, 22, 53, 5, 6, 1, 7, '32.24', '2023-03-30 21:39:39', 1, 20.15, 1, '97', NULL, 'false', '2023-03-31 09:39:39', '2023-03-31 09:39:39', NULL),
(725, 22, 45, 5, 6, 1, 5, '30.25', '2023-03-30 21:41:42', 3, 20.15, 1, '97', NULL, 'false', '2023-03-31 09:41:42', '2023-03-31 09:41:42', NULL),
(726, 22, 52, 6, 6, 2, 6, '30', '2023-03-30 21:45:44', 1, 8.00, 1, '97', NULL, 'false', '2023-03-31 09:45:44', '2023-03-31 09:45:44', NULL),
(727, 22, 52, 8, 6, 1, 3, '14.86', '2023-03-30 21:50:11', 1, 12.00, 1, '97', NULL, 'false', '2023-03-31 09:50:11', '2023-03-31 09:50:11', NULL),
(728, 37, 57, 1, 3, 1, 7, '24', '2023-04-03 22:57:08', 1, 14.76, 1, '99', NULL, 'false', '2023-04-04 10:57:08', '2023-04-04 10:57:08', NULL),
(729, 37, 56, 2, 3, 2, 6, '30', '2023-04-03 22:59:02', 2, 5.50, 1, '98', NULL, 'false', '2023-04-04 10:59:02', '2023-04-04 10:59:02', NULL),
(730, 37, 56, 2, 3, 2, 4, '50', '2023-04-03 22:59:21', 3, 5.50, 1, '98', NULL, 'false', '2023-04-04 10:59:21', '2023-04-04 10:59:21', NULL),
(731, 37, 56, 1, 7, 2, 8, '100', '2023-04-03 23:04:17', 2, 10.97, 1, '98', NULL, 'false', '2023-04-04 11:04:17', '2023-04-04 11:04:17', NULL),
(732, 37, 57, 1, 3, 1, 5, '20', '2023-04-03 23:04:41', 2, 14.76, 1, '99', NULL, 'false', '2023-04-04 11:04:41', '2023-04-04 11:04:41', NULL),
(733, 37, 54, 2, 3, 2, 3, '60', '2023-04-03 23:08:37', 1, 5.50, 1, '98', NULL, 'false', '2023-04-04 11:08:37', '2023-04-04 11:08:37', NULL),
(734, 37, 57, 2, 3, 1, 6, '30', '2023-04-03 23:08:38', 6, 5.50, 1, '99', NULL, 'false', '2023-04-04 11:08:38', '2023-04-04 11:08:38', NULL),
(735, 37, 54, 3, 3, 1, 8, '100', '2023-04-03 23:11:24', 4, 4.03, 1, '98', NULL, 'false', '2023-04-04 11:11:24', '2023-04-04 11:11:24', NULL),
(736, 37, 56, 4, 3, 2, 7, '20', '2023-04-03 23:17:51', 1, 15.00, 1, '98', NULL, 'false', '2023-04-04 11:17:51', '2023-04-04 11:17:51', NULL),
(737, 37, 54, 3, 8, 1, 8, '100', '2023-04-04 01:45:21', 5, 3.14, 1, '98', NULL, 'false', '2023-04-04 13:45:21', '2023-04-04 13:45:21', NULL),
(738, 37, 57, 7, 3, 1, 7, '20', '2023-04-04 02:01:51', 1, 13.00, 1, '99', NULL, 'false', '2023-04-04 14:01:51', '2023-04-04 14:01:51', NULL),
(739, 13, 59, 8, 4, 1, 7, '20.8', '2023-04-04 02:13:24', 1, 13.00, 1, '99', NULL, 'false', '2023-04-04 14:13:24', '2023-04-04 14:13:24', NULL),
(740, 13, 50, 3, 8, 2, 8, '100', '2023-04-04 05:24:27', 14, 3.23, 1, '20', NULL, 'false', '2023-04-04 17:24:27', '2023-04-04 17:24:27', NULL),
(741, 13, 30, 1, 8, 1, 2, '10.65', '2023-04-04 05:25:22', 8, 9.98, 1, '20', NULL, 'false', '2023-04-04 17:25:22', '2023-04-04 17:25:22', NULL),
(742, 13, 48, 1, 8, 1, 4, '19.19', '2023-04-04 05:25:54', 4, 9.98, 1, '20', NULL, 'false', '2023-04-04 17:25:54', '2023-04-04 17:25:54', NULL),
(743, 13, 58, 1, 2, 1, 1, '15.59', '2023-04-04 23:28:16', 2, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:28:16', '2023-04-05 11:28:16', NULL),
(744, 13, 59, 1, 2, 1, 2, '14.86', '2023-04-04 23:28:55', 1, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:28:55', '2023-04-05 11:28:55', NULL),
(745, 13, 59, 1, 2, 1, 1, '13', '2023-04-04 23:29:01', 2, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:29:01', '2023-04-05 11:29:01', NULL),
(746, 13, 57, 1, 2, 1, 2, '15.74', '2023-04-04 23:29:26', 3, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:29:26', '2023-04-05 11:29:26', NULL),
(747, 13, 58, 1, 2, 1, 8, '100', '2023-04-04 23:30:55', 3, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:30:55', '2023-04-05 11:30:55', NULL),
(748, 13, 59, 1, 2, 1, 8, '100', '2023-04-04 23:31:21', 3, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:31:21', '2023-04-05 11:31:21', NULL),
(749, 13, 59, 1, 2, 1, 7, '22.29', '2023-04-04 23:32:02', 4, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:32:02', '2023-04-05 11:32:02', NULL),
(750, 13, 57, 1, 2, 1, 1, '14.76', '2023-04-04 23:32:18', 4, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:32:18', '2023-04-05 11:32:18', NULL),
(751, 13, 58, 1, 2, 1, 1, '15.59', '2023-04-04 23:33:17', 4, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:33:17', '2023-04-05 11:33:17', NULL),
(752, 13, 48, 1, 2, 1, 1, '15.59', '2023-04-04 23:36:07', 5, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:07', '2023-04-05 11:36:07', NULL),
(753, 13, 59, 1, 2, 1, 1, '13', '2023-04-04 23:36:13', 5, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:13', '2023-04-05 11:36:13', NULL),
(754, 13, 59, 1, 2, 1, 1, '13', '2023-04-04 23:36:18', 6, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:18', '2023-04-05 11:36:18', NULL),
(755, 13, 57, 1, 2, 1, 1, '14.76', '2023-04-04 23:36:23', 5, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:23', '2023-04-05 11:36:23', NULL),
(756, 13, 57, 1, 2, 1, 1, '14.76', '2023-04-04 23:36:28', 6, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:28', '2023-04-05 11:36:28', NULL),
(757, 13, 58, 1, 2, 1, 1, '15.59', '2023-04-04 23:36:34', 5, 15.59, 1, '99', NULL, 'false', '2023-04-05 11:36:34', '2023-04-05 11:36:34', NULL),
(758, 13, 48, 3, 2, 1, 1, '4', '2023-04-04 23:38:48', 6, 4.21, 1, '99', NULL, 'false', '2023-04-05 11:38:48', '2023-04-05 11:38:48', NULL),
(759, 13, 50, 2, 1, 2, 5, '40', '2023-04-05 04:29:36', 7, 4.50, 1, '20', NULL, 'false', '2023-04-05 16:29:36', '2023-04-05 16:29:36', NULL),
(760, 13, 30, 4, 8, 1, 2, '70', '2023-04-05 04:30:10', 4, 20.00, 1, '20', NULL, 'false', '2023-04-05 16:30:10', '2023-04-05 16:30:10', NULL),
(761, 13, 50, 4, 8, 1, 5, '40', '2023-04-05 04:30:21', 10, 20.00, 1, '20', NULL, 'false', '2023-04-05 16:30:21', '2023-04-05 16:30:21', NULL),
(762, 13, 50, 3, 1, 2, 3, '6', '2023-04-05 13:03:36', 15, 4.39, 1, '20', NULL, 'false', '2023-04-06 01:03:36', '2023-04-06 01:03:36', NULL),
(763, 13, 50, 3, 1, 2, 3, '6', '2023-04-05 14:34:13', 16, 4.39, 1, '20', NULL, 'false', '2023-04-06 02:34:13', '2023-04-06 02:34:13', NULL),
(764, 13, 30, 3, 1, 1, 2, '4', '2023-04-05 14:37:09', 3, 4.39, 1, '20', NULL, 'false', '2023-04-06 02:37:09', '2023-04-06 02:37:09', NULL),
(765, 13, 30, 3, 1, 1, 2, '4', '2023-04-05 14:37:29', 4, 4.39, 1, '20', NULL, 'false', '2023-04-06 02:37:29', '2023-04-06 02:37:29', NULL),
(766, 13, 30, 5, 1, 1, 4, '22.57', '2023-04-05 14:39:42', 1, 24.15, 1, '20', NULL, 'false', '2023-04-06 02:39:42', '2023-04-06 02:39:42', NULL),
(767, 13, 30, 7, 8, 1, 3, '60', '2023-04-05 14:40:30', 1, 1.00, 1, '20', NULL, 'false', '2023-04-06 02:40:30', '2023-04-06 02:40:30', NULL),
(768, 13, 50, 3, 1, 2, 2, '5', '2023-04-05 16:55:04', 17, 4.39, 1, '20', NULL, 'false', '2023-04-06 04:55:04', '2023-04-06 04:55:04', NULL),
(769, 37, 54, 1, 8, 1, 5, '13.31', '2023-04-06 22:09:02', 1, 9.98, 1, '98', NULL, 'false', '2023-04-07 10:09:02', '2023-04-07 10:09:02', NULL),
(770, 22, 22, 3, 8, 1, 8, '100', '2023-04-09 15:02:22', 2, 3.14, 1, '46', NULL, 'false', '2023-04-10 03:02:22', '2023-04-10 03:02:22', NULL),
(771, 13, 38, 2, 6, 1, 3, '60', '2023-04-09 22:01:29', 4, 6.00, 1, '97', NULL, 'false', '2023-04-10 10:01:29', '2023-04-10 10:01:29', NULL),
(772, 13, 52, 2, 6, 1, 3, '60', '2023-04-09 22:01:37', 1, 6.00, 1, '97', NULL, 'false', '2023-04-10 10:01:37', '2023-04-10 10:01:37', NULL),
(773, 13, 53, 2, 6, 1, 4, '50', '2023-04-09 22:02:51', 1, 6.00, 1, '97', NULL, 'false', '2023-04-10 10:02:51', '2023-04-10 10:02:51', NULL),
(774, 13, 45, 2, 6, 1, 2, '70', '2023-04-09 22:02:56', 7, 6.00, 1, '97', NULL, 'false', '2023-04-10 10:02:56', '2023-04-10 10:02:56', NULL),
(775, 13, 52, 6, 3, 1, 3, '60', '2023-04-09 22:22:28', 2, 8.00, 1, '97', NULL, 'false', '2023-04-10 10:22:28', '2023-04-10 10:22:28', NULL),
(776, 22, 52, 6, 6, 2, 7, '20', '2023-04-09 22:22:38', 3, 8.00, 1, '97', NULL, 'false', '2023-04-10 10:22:38', '2023-04-10 10:22:38', NULL),
(777, 22, 45, 4, 6, 2, 1, '80', '2023-04-09 22:27:54', 7, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:27:54', '2023-04-10 10:27:54', NULL),
(778, 22, 52, 4, 6, 2, 8, '10', '2023-04-09 22:27:58', 1, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:27:58', '2023-04-10 10:27:58', NULL),
(779, 22, 52, 4, 3, 1, 8, '10', '2023-04-09 22:29:01', 2, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:29:01', '2023-04-10 10:29:01', NULL),
(780, 22, 38, 7, 6, 2, 8, '10', '2023-04-09 22:29:44', 4, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:29:44', '2023-04-10 10:29:44', NULL),
(781, 22, 53, 7, 6, 2, 7, '20', '2023-04-09 22:29:49', 1, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:29:49', '2023-04-10 10:29:49', NULL),
(782, 22, 45, 7, 6, 2, 5, '40', '2023-04-09 22:29:54', 1, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:29:54', '2023-04-10 10:29:54', NULL),
(783, 22, 52, 7, 6, 2, 4, '50', '2023-04-09 22:29:58', 1, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:29:58', '2023-04-10 10:29:58', NULL),
(784, 22, 52, 7, 3, 1, 8, '10', '2023-04-09 22:32:55', 2, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:32:55', '2023-04-10 10:32:55', NULL),
(785, 22, 45, 7, 3, 1, 4, '50', '2023-04-09 22:49:22', 2, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:49:22', '2023-04-10 10:49:22', NULL),
(786, 22, 52, 7, 3, 1, 5, '40', '2023-04-09 22:49:29', 3, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:49:29', '2023-04-10 10:49:29', NULL),
(787, 13, 52, 7, 6, 1, 4, '50', '2023-04-09 22:49:34', 4, 1.00, 1, '97', NULL, 'false', '2023-04-10 10:49:34', '2023-04-10 10:49:34', NULL),
(788, 13, 52, 6, 3, 1, 7, '20', '2023-04-09 22:53:57', 4, 8.00, 1, '97', NULL, 'false', '2023-04-10 10:53:57', '2023-04-10 10:53:57', NULL),
(789, 22, 38, 4, 6, 2, 4, '50', '2023-04-09 22:54:13', 12, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:54:13', '2023-04-10 10:54:13', NULL),
(790, 22, 53, 4, 6, 2, 3, '60', '2023-04-09 22:54:15', 1, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:54:15', '2023-04-10 10:54:15', NULL),
(791, 22, 45, 4, 6, 2, 2, '70', '2023-04-09 22:54:17', 8, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:54:17', '2023-04-10 10:54:17', NULL),
(792, 22, 52, 4, 6, 2, 5, '40', '2023-04-09 22:54:19', 3, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:54:19', '2023-04-10 10:54:19', NULL),
(793, 13, 52, 4, 3, 1, 8, '10', '2023-04-09 22:54:36', 4, 15.00, 1, '97', NULL, 'false', '2023-04-10 10:54:36', '2023-04-10 10:54:36', NULL),
(794, 22, 22, 7, 8, 1, 4, '50', '2023-04-09 23:18:29', 1, 1.00, 1, '46', NULL, 'false', '2023-04-10 11:18:29', '2023-04-10 11:18:29', NULL),
(795, 22, 7, 7, 8, 1, 2, '70', '2023-04-09 23:18:35', 1, 1.00, 1, '46', NULL, 'false', '2023-04-10 11:18:35', '2023-04-10 11:18:35', NULL),
(796, 22, 7, 7, 8, 1, 3, '60', '2023-04-09 23:20:52', 2, 1.00, 1, '46', NULL, 'false', '2023-04-10 11:20:52', '2023-04-10 11:20:52', NULL),
(797, 22, 22, 1, 8, 1, 1, '9.98', '2023-04-10 04:52:03', 1, 9.98, 1, '46', NULL, 'false', '2023-04-10 16:52:03', '2023-04-10 16:52:03', NULL),
(798, 22, 36, 1, 8, 2, 1, '12.35', '2023-04-10 04:52:23', 6, 12.35, 1, '46', NULL, 'false', '2023-04-10 16:52:23', '2023-04-10 16:52:23', NULL),
(799, 22, 22, 1, 8, 1, 1, '9.98', '2023-04-10 04:54:53', 2, 9.98, 1, '46', NULL, 'false', '2023-04-10 16:54:53', '2023-04-10 16:54:53', NULL),
(800, 22, 7, 1, 8, 1, 1, '11.96', '2023-04-10 04:55:20', 3, 9.98, 1, '46', NULL, 'false', '2023-04-10 16:55:20', '2023-04-10 16:55:20', NULL),
(801, 22, 7, 1, 8, 1, 1, '11.96', '2023-04-10 11:44:39', 4, 9.98, 1, '46', NULL, 'false', '2023-04-10 23:44:39', '2023-04-10 23:44:39', NULL),
(802, 15, 42, 1, 2, 2, 2, '16.63', '2023-04-10 17:19:12', 12, 15.59, 1, '39', NULL, 'false', '2023-04-11 05:19:12', '2023-04-11 05:19:12', NULL),
(803, 15, 42, 1, 2, 2, 3, '17.82', '2023-04-10 17:20:33', 13, 15.59, 1, '39', NULL, 'false', '2023-04-11 05:20:33', '2023-04-11 05:20:33', NULL),
(804, 15, 42, 4, 2, 2, 7, '20', '2023-04-10 17:45:19', 4, 10.00, 1, '39', NULL, 'false', '2023-04-11 05:45:19', '2023-04-11 05:45:19', NULL),
(805, 22, 7, 1, 6, 1, 1, '11.96', '2023-04-10 18:22:01', 5, 11.96, 1, '46', NULL, 'false', '2023-04-11 06:22:01', '2023-04-11 06:22:01', NULL),
(806, 22, 7, 7, 6, 1, 3, '60', '2023-04-10 18:22:21', 3, 1.00, 1, '46', NULL, 'false', '2023-04-11 06:22:21', '2023-04-11 06:22:21', NULL),
(807, 22, 7, 7, 6, 1, 3, '60', '2023-04-10 18:22:48', 4, 1.00, 1, '46', NULL, 'false', '2023-04-11 06:22:48', '2023-04-11 06:22:48', NULL),
(808, 22, 22, 1, 8, 1, 1, '9.98', '2023-04-11 03:27:05', 3, 9.98, 1, '46', NULL, 'false', '2023-04-11 15:27:05', '2023-04-11 15:27:05', NULL),
(809, 13, 50, 3, 1, 2, 1, '4.39', '2023-04-11 05:55:16', 18, 4.39, 1, '20', NULL, 'false', '2023-04-11 17:55:16', '2023-04-11 17:55:16', NULL),
(810, 13, 30, 1, 8, 1, 2, '10.65', '2023-04-11 06:31:58', 9, 9.98, 1, '20', NULL, 'false', '2023-04-11 18:31:58', '2023-04-11 18:31:58', NULL),
(811, 13, 50, 1, 8, 2, 2, '17.51', '2023-04-11 06:32:29', 1, 12.35, 1, '20', NULL, 'false', '2023-04-11 18:32:29', '2023-04-11 18:32:29', NULL),
(812, 13, 30, 7, 8, 1, 6, '30', '2023-04-11 06:33:08', 2, 1.00, 1, '20', NULL, 'false', '2023-04-11 18:33:08', '2023-04-11 18:33:08', NULL),
(813, 13, 50, 7, 8, 1, 3, '60', '2023-04-11 06:33:12', 1, 1.00, 1, '20', NULL, 'false', '2023-04-11 18:33:12', '2023-04-11 18:33:12', NULL),
(814, 13, 50, 8, 1, 2, 2, '14.93', '2023-04-11 06:33:47', 1, 14.00, 1, '20', NULL, 'false', '2023-04-11 18:33:47', '2023-04-11 18:33:47', NULL),
(815, 13, 30, 8, 1, 1, 2, '11.73', '2023-04-11 06:34:26', 1, 14.00, 1, '20', NULL, 'false', '2023-04-11 18:34:26', '2023-04-11 18:34:26', NULL),
(816, 13, 30, 8, 1, 1, 2, '11.73', '2023-04-11 06:34:52', 2, 14.00, 1, '20', NULL, 'false', '2023-04-11 18:34:52', '2023-04-11 18:34:52', NULL),
(817, 13, 53, 2, 6, 1, 2, '70', '2023-04-11 07:05:33', 2, 6.00, 1, '20', NULL, 'false', '2023-04-11 19:05:33', '2023-04-11 19:05:33', NULL),
(818, 13, 53, 2, 6, 1, 3, '60', '2023-04-11 09:19:04', 3, 6.00, 1, '20', NULL, 'false', '2023-04-11 21:19:04', '2023-04-11 21:19:04', NULL),
(819, 13, 30, 2, 6, 1, 6, '30', '2023-04-11 09:19:11', 7, 6.00, 1, '20', NULL, 'false', '2023-04-11 21:19:11', '2023-04-11 21:19:11', NULL),
(820, 13, 50, 2, 6, 1, 5, '40', '2023-04-11 09:19:16', 8, 6.00, 1, '20', NULL, 'false', '2023-04-11 21:19:16', '2023-04-11 21:19:16', NULL),
(821, 15, 21, 3, 1, 1, 8, '100', '2023-04-11 10:45:10', 1, 4.39, 1, '39', NULL, 'false', '2023-04-11 22:45:10', '2023-04-11 22:45:10', NULL),
(822, 15, 8, 3, 1, 1, 4, '4.96', '2023-04-11 10:45:37', 1, 4.39, 1, '39', NULL, 'false', '2023-04-11 22:45:37', '2023-04-11 22:45:37', NULL),
(823, 21, 23, 2, 8, 2, 3, '60', '2023-04-11 11:16:07', 1, 6.00, 1, '48', NULL, 'false', '2023-04-11 23:16:07', '2023-04-11 23:16:07', NULL),
(824, 21, 23, 2, 8, 2, 7, '20', '2023-04-11 11:18:07', 2, 6.00, 1, '48', NULL, 'false', '2023-04-11 23:18:07', '2023-04-11 23:18:07', NULL),
(825, 21, 46, 1, 8, 2, 5, '16.47', '2023-04-11 11:36:11', 21, 12.35, 1, '48', NULL, 'false', '2023-04-11 23:36:11', '2023-04-11 23:36:11', NULL),
(826, 22, 22, 1, 8, 1, 4, '12.28', '2023-04-11 13:48:21', 4, 9.98, 1, '46', NULL, 'false', '2023-04-12 01:48:21', '2023-04-12 01:48:21', NULL),
(827, 22, 7, 1, 8, 1, 1, '11.96', '2023-04-11 13:48:30', 6, 9.98, 1, '46', NULL, 'false', '2023-04-12 01:48:30', '2023-04-12 01:48:30', NULL),
(828, 22, 7, 7, 8, 1, 3, '60', '2023-04-11 13:48:50', 5, 1.00, 1, '46', NULL, 'false', '2023-04-12 01:48:50', '2023-04-12 01:48:50', NULL),
(829, 13, 30, 6, 8, 1, 3, '60', '2023-04-11 15:33:54', 5, 8.00, 1, '20', NULL, 'false', '2023-04-12 03:33:54', '2023-04-12 03:33:54', NULL),
(830, 13, 53, 6, 8, 1, 3, '60', '2023-04-11 15:33:58', 1, 8.00, 1, '20', NULL, 'false', '2023-04-12 03:33:58', '2023-04-12 03:33:58', NULL),
(831, 13, 50, 6, 8, 1, 3, '60', '2023-04-11 15:34:04', 2, 8.00, 1, '20', NULL, 'false', '2023-04-12 03:34:04', '2023-04-12 03:34:04', NULL),
(832, 13, 30, 6, 8, 1, 2, '70', '2023-04-11 16:04:00', 6, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:04:00', '2023-04-12 04:04:00', NULL),
(833, 13, 30, 6, 8, 1, 6, '30', '2023-04-11 16:04:45', 7, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:04:45', '2023-04-12 04:04:45', NULL),
(834, 13, 53, 6, 6, 1, 5, '40', '2023-04-11 16:05:17', 2, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:05:17', '2023-04-12 04:05:17', NULL),
(835, 13, 30, 6, 6, 1, 5, '40', '2023-04-11 16:05:21', 8, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:05:21', '2023-04-12 04:05:21', NULL),
(836, 13, 50, 6, 6, 1, 5, '40', '2023-04-11 16:05:23', 3, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:05:23', '2023-04-12 04:05:23', NULL),
(837, 13, 53, 6, 6, 1, 1, '80', '2023-04-11 16:15:08', 3, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:15:08', '2023-04-12 04:15:08', NULL),
(838, 13, 53, 6, 6, 1, 2, '70', '2023-04-11 16:47:46', 4, 8.00, 1, '20', NULL, 'false', '2023-04-12 04:47:46', '2023-04-12 04:47:46', NULL),
(839, 22, 44, 1, 8, 1, 1, '9.98', '2023-04-11 17:00:24', 8, 9.98, 1, '36', NULL, 'false', '2023-04-12 05:00:24', '2023-04-12 05:00:24', NULL),
(840, 22, 11, 1, 8, 1, 1, '11.96', '2023-04-11 17:00:43', 5, 9.98, 1, '36', NULL, 'false', '2023-04-12 05:00:43', '2023-04-12 05:00:43', NULL),
(841, 22, 11, 1, 6, 1, 1, '11.96', '2023-04-11 17:02:44', 6, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:02:44', '2023-04-12 05:02:44', NULL),
(842, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-11 17:02:48', 9, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:02:48', '2023-04-12 05:02:48', NULL),
(843, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-11 17:03:03', 10, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:03:03', '2023-04-12 05:03:03', NULL),
(844, 22, 11, 1, 6, 1, 1, '11.96', '2023-04-11 17:03:09', 7, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:03:09', '2023-04-12 05:03:09', NULL),
(845, 13, 53, 6, 6, 1, 5, '40', '2023-04-11 17:03:10', 5, 8.00, 1, '20', NULL, 'false', '2023-04-12 05:03:10', '2023-04-12 05:03:10', NULL),
(846, 13, 50, 6, 6, 1, 2, '70', '2023-04-11 17:03:13', 4, 8.00, 1, '20', NULL, 'false', '2023-04-12 05:03:13', '2023-04-12 05:03:13', NULL),
(847, 13, 2, 6, 6, 1, 7, '20', '2023-04-11 17:03:17', 3, 8.00, 1, '20', NULL, 'false', '2023-04-12 05:03:17', '2023-04-12 05:03:17', NULL),
(848, 13, 2, 6, 5, 1, 5, '40', '2023-04-11 17:03:48', 4, 8.00, 1, '20', NULL, 'false', '2023-04-12 05:03:48', '2023-04-12 05:03:48', NULL),
(849, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-11 17:06:16', 11, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:06:16', '2023-04-12 05:06:16', NULL),
(850, 22, 11, 1, 6, 1, 1, '11.96', '2023-04-11 17:06:26', 8, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:06:26', '2023-04-12 05:06:26', NULL),
(851, 22, 11, 1, 6, 1, 1, '11.96', '2023-04-11 17:06:41', 9, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:06:41', '2023-04-12 05:06:41', NULL),
(852, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-11 17:06:46', 12, 11.96, 1, '36', NULL, 'false', '2023-04-12 05:06:46', '2023-04-12 05:06:46', NULL),
(853, 21, 46, 1, 8, 2, 4, '15.2', '2023-04-12 05:09:02', 22, 0.12, 1, '48', NULL, 'false', '2023-04-12 17:09:02', '2023-04-12 17:09:02', NULL),
(854, 21, 15, 1, 8, 1, 7, '15.97', '2023-04-12 05:09:11', 10, 0.10, 1, '48', NULL, 'false', '2023-04-12 17:09:11', '2023-04-12 17:09:11', NULL),
(855, 15, 6, 7, 7, 1, 1, '80', '2023-04-12 16:51:13', 1, 0.01, 1, '39', NULL, 'false', '2023-04-13 04:51:13', '2023-04-13 04:51:13', NULL),
(856, 15, 51, 3, 7, 1, 7, '5.17', '2023-04-12 17:02:16', 4, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:02:16', '2023-04-13 05:02:16', NULL),
(857, 15, 8, 3, 7, 1, 2, '4.3', '2023-04-12 17:03:30', 2, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:03:30', '2023-04-13 05:03:30', NULL),
(858, 15, 6, 8, 5, 2, 1, '12', '2023-04-12 17:04:59', 1, 0.12, 1, '39', NULL, 'false', '2023-04-13 05:04:59', '2023-04-13 05:04:59', NULL),
(859, 15, 51, 8, 5, 1, 2, '11.73', '2023-04-12 17:05:23', 1, 0.12, 1, '39', NULL, 'false', '2023-04-13 05:05:23', '2023-04-13 05:05:23', NULL),
(860, 15, 51, 8, 5, 1, 3, '12.57', '2023-04-12 17:05:51', 2, 0.12, 1, '39', NULL, 'false', '2023-04-13 05:05:51', '2023-04-13 05:05:51', NULL),
(861, 15, 42, 8, 5, 2, 4, '17.23', '2023-04-12 17:06:25', 2, 0.12, 1, '39', NULL, 'false', '2023-04-13 05:06:25', '2023-04-13 05:06:25', NULL),
(862, 15, 8, 8, 7, 1, 3, '14.86', '2023-04-12 17:09:11', 1, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:09:11', '2023-04-13 05:09:11', NULL),
(863, 15, 6, 8, 7, 2, 6, '17.45', '2023-04-12 17:09:41', 2, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:09:41', '2023-04-13 05:09:41', NULL),
(864, 15, 51, 8, 7, 1, 7, '17.6', '2023-04-12 17:10:09', 3, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:10:09', '2023-04-13 05:10:09', NULL),
(865, 15, 51, 8, 7, 1, 6, '16', '2023-04-12 17:10:54', 4, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:10:54', '2023-04-13 05:10:54', NULL),
(866, 15, 42, 8, 7, 2, 2, '14.93', '2023-04-12 17:11:25', 3, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:11:25', '2023-04-13 05:11:25', NULL),
(867, 15, 51, 8, 7, 1, 1, '11', '2023-04-12 17:12:03', 5, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:12:03', '2023-04-13 05:12:03', NULL),
(868, 15, 42, 8, 7, 2, 2, '14.93', '2023-04-12 17:12:50', 4, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:12:50', '2023-04-13 05:12:50', NULL),
(869, 15, 21, 8, 7, 1, 4, '17.23', '2023-04-12 17:13:51', 1, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:13:51', '2023-04-13 05:13:51', NULL),
(870, 15, 8, 8, 7, 1, 1, '13', '2023-04-12 17:14:08', 2, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:14:08', '2023-04-13 05:14:08', NULL),
(871, 15, 6, 8, 7, 2, 1, '12', '2023-04-12 17:14:21', 3, 0.11, 1, '39', NULL, 'false', '2023-04-13 05:14:21', '2023-04-13 05:14:21', NULL),
(872, 15, 51, 3, 7, 1, 1, '3.23', '2023-04-12 17:15:01', 5, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:15:01', '2023-04-13 05:15:01', NULL),
(873, 15, 51, 3, 7, 1, 6, '4.7', '2023-04-12 17:16:05', 6, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:16:05', '2023-04-13 05:16:05', NULL),
(874, 15, 42, 3, 7, 2, 6, '6.12', '2023-04-12 17:16:19', 3, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:16:19', '2023-04-13 05:16:19', NULL),
(875, 15, 21, 3, 7, 1, 5, '5.85', '2023-04-12 17:16:43', 2, 0.03, 1, '39', NULL, 'false', '2023-04-13 05:16:43', '2023-04-13 05:16:43', NULL),
(876, 13, 59, 1, 4, 1, 7, '22.29', '2023-04-12 17:38:03', 7, 0.14, 1, '99', NULL, 'false', '2023-04-13 05:38:03', '2023-04-13 05:38:03', NULL),
(877, 13, 48, 1, 2, 1, 8, '100', '2023-04-12 17:39:10', 6, 0.16, 1, '99', NULL, 'false', '2023-04-13 05:39:10', '2023-04-13 05:39:10', NULL),
(878, 13, 48, 1, 2, 1, 3, '17.82', '2023-04-12 17:40:23', 7, 0.16, 1, '99', NULL, 'false', '2023-04-13 05:40:23', '2023-04-13 05:40:23', NULL),
(879, 13, 59, 2, 4, 1, 8, '10', '2023-04-12 17:40:53', 1, 0.06, 1, '99', NULL, 'false', '2023-04-13 05:40:53', '2023-04-13 05:40:53', NULL),
(880, 13, 48, 2, 4, 1, 2, '70', '2023-04-12 17:40:58', 6, 0.06, 1, '99', NULL, 'false', '2023-04-13 05:40:58', '2023-04-13 05:40:58', NULL),
(881, 13, 48, 3, 2, 1, 7, '6.74', '2023-04-12 17:41:26', 7, 0.04, 1, '99', NULL, 'false', '2023-04-13 05:41:26', '2023-04-13 05:41:26', NULL),
(882, 37, 57, 6, 3, 1, 5, '40', '2023-04-12 17:41:42', 1, 0.08, 1, '99', NULL, 'false', '2023-04-13 05:41:42', '2023-04-13 05:41:42', NULL),
(883, 37, 58, 6, 3, 1, 3, '60', '2023-04-12 17:41:44', 1, 0.08, 1, '99', NULL, 'false', '2023-04-13 05:41:44', '2023-04-13 05:41:44', NULL),
(884, 13, 48, 5, 2, 1, 5, '31.23', '2023-04-12 17:42:34', 1, 0.23, 1, '99', NULL, 'false', '2023-04-13 05:42:34', '2023-04-13 05:42:34', NULL),
(885, 13, 58, 4, 2, 1, 5, '40', '2023-04-12 17:42:51', 1, 0.10, 1, '99', NULL, 'false', '2023-04-13 05:42:51', '2023-04-13 05:42:51', NULL),
(886, 13, 48, 4, 2, 1, 3, '60', '2023-04-12 17:42:53', 4, 0.10, 1, '99', NULL, 'false', '2023-04-13 05:42:53', '2023-04-13 05:42:53', NULL),
(887, 13, 58, 7, 2, 1, 7, '20', '2023-04-12 17:43:09', 1, 0.01, 1, '99', NULL, 'false', '2023-04-13 05:43:09', '2023-04-13 05:43:09', NULL),
(888, 13, 48, 7, 2, 1, 1, '80', '2023-04-12 17:43:13', 2, 0.01, 1, '99', NULL, 'false', '2023-04-13 05:43:13', '2023-04-13 05:43:13', NULL),
(889, 13, 48, 8, 2, 1, 7, '22.4', '2023-04-12 17:43:55', 2, 0.14, 1, '99', NULL, 'false', '2023-04-13 05:43:55', '2023-04-13 05:43:55', NULL),
(890, 15, 21, 6, 7, 1, 2, '70', '2023-04-12 18:41:54', 1, 0.08, 1, '39', NULL, 'false', '2023-04-13 06:41:54', '2023-04-13 06:41:54', NULL),
(891, 13, 59, 1, 4, 1, 2, '14.86', '2023-04-12 19:55:03', 8, 0.14, 1, '99', NULL, 'false', '2023-04-13 07:55:03', '2023-04-13 07:55:03', NULL),
(892, 13, 59, 3, 4, 1, 7, '6.16', '2023-04-12 19:57:09', 1, 0.04, 1, '99', NULL, 'false', '2023-04-13 07:57:09', '2023-04-13 07:57:09', NULL),
(893, 13, 48, 6, 2, 1, 5, '40', '2023-04-12 20:02:39', 5, 0.08, 1, '99', NULL, 'false', '2023-04-13 08:02:39', '2023-04-13 08:02:39', NULL),
(894, 13, 58, 1, 2, 1, 4, '19.19', '2023-04-12 22:08:13', 6, 0.16, 1, '99', NULL, 'false', '2023-04-13 10:08:13', '2023-04-13 10:08:13', NULL),
(895, 22, 32, 1, 8, 1, 1, '9.98', '2023-04-12 22:14:59', 2, 0.10, 1, '46', NULL, 'false', '2023-04-13 10:14:59', '2023-04-13 10:14:59', NULL),
(896, 22, 7, 1, 8, 1, 2, '12.76', '2023-04-12 22:16:24', 7, 0.10, 1, '46', NULL, 'false', '2023-04-13 10:16:24', '2023-04-13 10:16:24', NULL),
(897, 22, 7, 1, 8, 1, 6, '17.4', '2023-04-12 22:21:16', 8, 0.10, 1, '46', NULL, 'false', '2023-04-13 10:21:16', '2023-04-13 10:21:16', NULL),
(898, 22, 17, 7, 8, 1, 8, '10', '2023-04-12 22:21:42', 1, 0.01, 1, '46', NULL, 'false', '2023-04-13 10:21:42', '2023-04-13 10:21:42', NULL),
(899, 22, 22, 4, 8, 1, 8, '10', '2023-04-12 22:22:39', 1, 0.20, 1, '46', NULL, 'false', '2023-04-13 10:22:39', '2023-04-13 10:22:39', NULL),
(900, 22, 36, 4, 8, 1, 5, '40', '2023-04-12 22:23:00', 2, 0.20, 1, '46', NULL, 'false', '2023-04-13 10:23:00', '2023-04-13 10:23:00', NULL),
(901, 22, 17, 2, 8, 1, 4, '50', '2023-04-12 22:23:19', 1, 0.06, 1, '46', NULL, 'false', '2023-04-13 10:23:19', '2023-04-13 10:23:19', NULL),
(902, 22, 7, 4, 6, 1, 7, '20', '2023-04-12 22:24:42', 2, 0.16, 1, '46', NULL, 'false', '2023-04-13 10:24:42', '2023-04-13 10:24:42', NULL),
(903, 22, 32, 4, 6, 1, 7, '20', '2023-04-12 22:25:13', 2, 0.16, 1, '46', NULL, 'false', '2023-04-13 10:25:13', '2023-04-13 10:25:13', NULL),
(904, 22, 17, 4, 6, 1, 3, '60', '2023-04-12 22:25:31', 1, 0.16, 1, '46', NULL, 'false', '2023-04-13 10:25:31', '2023-04-13 10:25:31', NULL),
(905, 22, 36, 4, 6, 1, 6, '30', '2023-04-12 22:26:04', 3, 0.16, 1, '46', NULL, 'false', '2023-04-13 10:26:04', '2023-04-13 10:26:04', NULL),
(906, 22, 22, 6, 8, 1, 6, '30', '2023-04-12 22:27:03', 1, 0.08, 1, '46', NULL, 'false', '2023-04-13 10:27:03', '2023-04-13 10:27:03', NULL),
(907, 22, 45, 3, 3, 1, 2, '4.3', '2023-04-12 23:18:24', 4, 0.04, 1, '97', NULL, 'false', '2023-04-13 11:18:24', '2023-04-13 11:18:24', NULL),
(908, 22, 36, 3, 8, 2, 3, '3.69', '2023-04-12 23:21:39', 2, 0.03, 1, '46', NULL, 'false', '2023-04-13 11:21:39', '2023-04-13 11:21:39', NULL),
(909, 22, 22, 3, 8, 1, 5, '4.19', '2023-04-12 23:22:36', 3, 0.03, 1, '46', NULL, 'false', '2023-04-13 11:22:36', '2023-04-13 11:22:36', NULL),
(910, 37, 57, 3, 3, 1, 6, '5.86', '2023-04-12 23:29:10', 1, 0.04, 1, '99', NULL, 'false', '2023-04-13 11:29:10', '2023-04-13 11:29:10', NULL),
(911, 37, 57, 3, 3, 1, 6, '5.86', '2023-04-12 23:31:04', 2, 0.04, 1, '99', NULL, 'false', '2023-04-13 11:31:04', '2023-04-13 11:31:04', NULL),
(912, 22, 11, 1, 8, 1, 1, '11.96', '2023-04-13 17:01:04', 10, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:01:04', '2023-04-14 05:01:04', NULL),
(913, 22, 44, 1, 8, 1, 1, '9.98', '2023-04-13 17:01:16', 13, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:01:16', '2023-04-14 05:01:16', NULL),
(914, 22, 44, 1, 8, 1, 1, '9.98', '2023-04-13 17:01:35', 14, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:01:35', '2023-04-14 05:01:35', NULL),
(915, 22, 11, 1, 8, 1, 1, '11.96', '2023-04-13 17:01:46', 11, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:01:46', '2023-04-14 05:01:46', NULL),
(916, 22, 11, 1, 6, 1, 1, '11.96', '2023-04-13 17:02:16', 12, 0.12, 1, '36', NULL, 'false', '2023-04-14 05:02:16', '2023-04-14 05:02:16', NULL),
(917, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-13 17:02:20', 15, 0.12, 1, '36', NULL, 'false', '2023-04-14 05:02:20', '2023-04-14 05:02:20', NULL),
(918, 22, 44, 1, 8, 1, 1, '9.98', '2023-04-13 17:02:36', 16, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:02:36', '2023-04-14 05:02:36', NULL),
(919, 22, 11, 1, 8, 1, 1, '11.96', '2023-04-13 17:02:41', 13, 0.10, 1, '36', NULL, 'false', '2023-04-14 05:02:41', '2023-04-14 05:02:41', NULL),
(920, 22, 11, 3, 6, 1, 3, '3.92', '2023-04-13 18:04:52', 1, 0.03, 1, '36', NULL, 'false', '2023-04-14 06:04:52', '2023-04-14 06:04:52', NULL),
(921, 22, 44, 3, 6, 1, 3, '3.59', '2023-04-13 18:05:38', 1, 0.03, 1, '36', NULL, 'false', '2023-04-14 06:05:38', '2023-04-14 06:05:38', NULL),
(922, 13, 48, 1, 2, 1, 1, '15.59', '2023-04-13 20:34:31', 8, 0.16, 1, '99', NULL, 'false', '2023-04-14 08:34:31', '2023-04-14 08:34:31', NULL),
(923, 13, 59, 1, 2, 1, 1, '13', '2023-04-13 20:34:38', 9, 0.16, 1, '99', NULL, 'false', '2023-04-14 08:34:38', '2023-04-14 08:34:38', NULL),
(924, 13, 59, 1, 2, 1, 1, '13', '2023-04-13 20:34:42', 10, 0.16, 1, '99', NULL, 'false', '2023-04-14 08:34:42', '2023-04-14 08:34:42', NULL),
(925, 13, 57, 1, 2, 1, 1, '14.76', '2023-04-13 20:34:50', 7, 0.16, 1, '99', NULL, 'false', '2023-04-14 08:34:50', '2023-04-14 08:34:50', NULL),
(926, 13, 57, 1, 2, 1, 1, '14.76', '2023-04-13 20:35:09', 8, 0.16, 1, '99', NULL, 'false', '2023-04-14 08:35:09', '2023-04-14 08:35:09', NULL),
(927, 13, 48, 1, 4, 1, 1, '15.59', '2023-04-13 20:37:37', 9, 0.14, 1, '99', NULL, 'false', '2023-04-14 08:37:37', '2023-04-14 08:37:37', NULL),
(928, 13, 59, 1, 4, 1, 1, '13', '2023-04-13 20:37:42', 11, 0.14, 1, '99', NULL, 'false', '2023-04-14 08:37:42', '2023-04-14 08:37:42', NULL),
(929, 13, 59, 1, 4, 1, 1, '13', '2023-04-13 20:37:47', 12, 0.14, 1, '99', NULL, 'false', '2023-04-14 08:37:47', '2023-04-14 08:37:47', NULL),
(930, 13, 57, 1, 4, 1, 1, '14.76', '2023-04-13 20:37:54', 9, 0.14, 1, '99', NULL, 'false', '2023-04-14 08:37:54', '2023-04-14 08:37:54', NULL),
(931, 13, 57, 1, 4, 1, 1, '14.76', '2023-04-13 20:37:59', 10, 0.14, 1, '99', NULL, 'false', '2023-04-14 08:37:59', '2023-04-14 08:37:59', NULL),
(932, 22, 11, 3, 6, 1, 8, '100', '2023-04-15 12:25:24', 2, 0.03, 1, '36', NULL, 'false', '2023-04-16 00:25:24', '2023-04-16 00:25:24', NULL),
(933, 15, 21, 3, 4, 1, 5, '5.37', '2023-04-16 19:00:29', 3, 0.04, 1, '39', NULL, 'false', '2023-04-17 07:00:29', '2023-04-17 07:00:29', NULL),
(934, 13, 50, 2, 1, 2, 2, '70', '2023-04-18 13:17:03', 9, 0.04, 1, '20', NULL, 'false', '2023-04-19 01:17:03', '2023-04-19 01:17:03', NULL),
(935, 13, 2, 2, 1, 2, 2, '70', '2023-04-18 13:17:11', 6, 0.04, 1, '20', NULL, 'false', '2023-04-19 01:17:11', '2023-04-19 01:17:11', NULL),
(936, 13, 53, 2, 6, 1, 1, '80', '2023-04-18 13:17:59', 4, 0.06, 1, '20', NULL, 'false', '2023-04-19 01:17:59', '2023-04-19 01:17:59', NULL),
(937, 13, 2, 2, 6, 1, 3, '60', '2023-04-18 13:18:10', 7, 0.06, 1, '20', NULL, 'false', '2023-04-19 01:18:10', '2023-04-19 01:18:10', NULL),
(938, 13, 53, 1, 6, 1, 3, '13.67', '2023-04-18 13:19:24', 1, 0.12, 1, '20', NULL, 'false', '2023-04-19 01:19:24', '2023-04-19 01:19:24', NULL),
(939, 13, 2, 3, 5, 1, 4, '3.98', '2023-04-18 13:20:13', 4, 0.03, 1, '20', NULL, 'false', '2023-04-19 01:20:13', '2023-04-19 01:20:13', NULL),
(940, 13, 53, 3, 5, 1, 4, '4.22', '2023-04-18 13:20:25', 1, 0.03, 1, '20', NULL, 'false', '2023-04-19 01:20:25', '2023-04-19 01:20:25', NULL),
(941, 13, 50, 3, 5, 2, 2, '4.68', '2023-04-18 13:20:46', 19, 0.04, 1, '20', NULL, 'false', '2023-04-19 01:20:46', '2023-04-19 01:20:46', NULL),
(942, 15, 8, 1, 1, 1, 4, '20.2', '2023-04-21 11:00:58', 1, 0.16, 1, '39', NULL, 'false', '2023-04-21 23:00:58', '2023-04-21 23:00:58', NULL),
(943, 15, 8, 3, 1, 1, 4, '5.4', '2023-04-24 12:16:09', 3, 0.04, 1, '39', NULL, 'false', '2023-04-25 00:16:09', '2023-04-25 00:16:09', NULL),
(944, 13, 53, 7, 6, 1, 3, '60', '2023-04-25 09:10:02', 2, 0.00, 1, '20', NULL, 'false', '2023-04-25 21:10:02', '2023-04-25 21:10:02', NULL),
(945, 13, 50, 7, 6, 1, 6, '30', '2023-04-25 09:10:18', 2, 0.00, 1, '20', NULL, 'false', '2023-04-25 21:10:18', '2023-04-25 21:10:18', NULL),
(946, 13, 2, 7, 6, 1, 5, '40', '2023-04-25 09:10:23', 3, 0.00, 1, '20', NULL, 'false', '2023-04-25 21:10:23', '2023-04-25 21:10:23', NULL),
(947, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 03:40:00', 23, 0.12, 1, '48', NULL, 'false', '2023-04-26 15:40:00', '2023-04-26 15:40:00', NULL),
(948, 21, 46, 1, 8, 2, 6, '17.9', '2023-04-26 03:57:46', 24, 0.12, 1, '48', NULL, 'false', '2023-04-26 15:57:46', '2023-04-26 15:57:46', NULL),
(949, 21, 46, 1, 8, 2, 3, '14.1', '2023-04-26 03:59:22', 25, 0.12, 1, '48', NULL, 'false', '2023-04-26 15:59:22', '2023-04-26 15:59:22', NULL),
(950, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 03:59:35', 26, 0.12, 1, '48', NULL, 'false', '2023-04-26 15:59:35', '2023-04-26 15:59:35', NULL),
(951, 21, 46, 2, 8, 2, 7, '20', '2023-04-26 04:01:17', 1, 0.06, 1, '48', NULL, 'false', '2023-04-26 16:01:17', '2023-04-26 16:01:17', NULL),
(952, 13, 59, 1, 4, 1, 4, '17.1', '2023-04-26 06:27:01', 13, 0.14, 1, '99', NULL, 'false', '2023-04-26 18:27:01', '2023-04-26 18:27:01', NULL),
(953, 13, 57, 1, 4, 1, 1, '14.7', '2023-04-26 06:27:08', 11, 0.14, 1, '99', NULL, 'false', '2023-04-26 18:27:08', '2023-04-26 18:27:08', NULL),
(954, 13, 59, 1, 4, 1, 5, '18.5', '2023-04-26 06:33:52', 14, 0.14, 1, '99', NULL, 'false', '2023-04-26 18:33:52', '2023-04-26 18:33:52', NULL),
(955, 15, 8, 4, 1, 1, 2, '70', '2023-04-26 12:45:23', 1, 0.10, 1, '39', NULL, 'false', '2023-04-27 00:45:23', '2023-04-27 00:45:23', NULL),
(956, 13, 50, 2, 1, 2, 2, '70', '2023-04-26 17:15:09', 10, 0.04, 1, '20', NULL, 'false', '2023-04-27 05:15:09', '2023-04-27 05:15:09', NULL),
(957, 21, 15, 2, 8, 2, 3, '60', '2023-04-26 21:30:39', 3, 0.06, 1, '48', NULL, 'false', '2023-04-27 09:30:39', '2023-04-27 09:30:39', NULL),
(958, 21, 23, 2, 8, 2, 3, '60', '2023-04-26 21:30:44', 3, 0.06, 1, '48', NULL, 'false', '2023-04-27 09:30:44', '2023-04-27 09:30:44', NULL),
(959, 21, 23, 2, 8, 2, 7, '20', '2023-04-26 21:45:11', 4, 0.06, 1, '48', NULL, 'false', '2023-04-27 09:45:11', '2023-04-27 09:45:11', NULL),
(960, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 21:46:19', 22, 0.10, 1, '48', NULL, 'false', '2023-04-27 09:46:19', '2023-04-27 09:46:19', NULL),
(961, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 21:46:25', 27, 0.12, 1, '48', NULL, 'false', '2023-04-27 09:46:25', '2023-04-27 09:46:25', NULL),
(962, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 21:46:39', 28, 0.12, 1, '48', NULL, 'false', '2023-04-27 09:46:39', '2023-04-27 09:46:39', NULL),
(963, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 21:46:50', 11, 0.10, 1, '48', NULL, 'false', '2023-04-27 09:46:50', '2023-04-27 09:46:50', NULL),
(964, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 21:47:12', 23, 0.10, 1, '48', NULL, 'false', '2023-04-27 09:47:12', '2023-04-27 09:47:12', NULL),
(965, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 21:47:24', 29, 0.12, 1, '48', NULL, 'false', '2023-04-27 09:47:24', '2023-04-27 09:47:24', NULL),
(966, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 21:48:00', 24, 0.10, 1, '48', NULL, 'false', '2023-04-27 09:48:00', '2023-04-27 09:48:00', NULL),
(967, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 21:48:09', 30, 0.12, 1, '48', NULL, 'false', '2023-04-27 09:48:09', '2023-04-27 09:48:09', NULL),
(968, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 21:49:15', 25, 0.10, 1, '48', NULL, 'false', '2023-04-27 09:49:15', '2023-04-27 09:49:15', NULL),
(969, 21, 23, 2, 8, 2, 3, '60', '2023-04-26 22:59:04', 5, 0.06, 1, '48', NULL, 'false', '2023-04-27 10:59:04', '2023-04-27 10:59:04', NULL),
(970, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:02:31', 26, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:02:31', '2023-04-27 11:02:31', NULL),
(971, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:04:39', 31, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:04:39', '2023-04-27 11:04:39', NULL),
(972, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:04:51', 27, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:04:51', '2023-04-27 11:04:51', NULL),
(973, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:05:00', 32, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:05:00', '2023-04-27 11:05:00', NULL),
(974, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:05:07', 12, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:05:07', '2023-04-27 11:05:07', NULL),
(975, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:06:32', 28, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:06:32', '2023-04-27 11:06:32', NULL),
(976, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:06:40', 33, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:06:40', '2023-04-27 11:06:40', NULL),
(977, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:07:05', 13, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:07:05', '2023-04-27 11:07:05', NULL),
(978, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:08:34', 29, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:08:34', '2023-04-27 11:08:34', NULL),
(979, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:08:41', 34, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:08:41', '2023-04-27 11:08:41', NULL),
(980, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:08:47', 35, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:08:47', '2023-04-27 11:08:47', NULL),
(981, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:09:02', 14, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:09:02', '2023-04-27 11:09:02', NULL),
(982, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:13:40', 30, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:13:40', '2023-04-27 11:13:40', NULL),
(983, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:13:45', 36, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:13:45', '2023-04-27 11:13:45', NULL),
(984, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:14:12', 37, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:14:12', '2023-04-27 11:14:12', NULL),
(985, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:14:51', 38, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:14:51', '2023-04-27 11:14:51', NULL),
(986, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:17:39', 39, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:17:39', '2023-04-27 11:17:39', NULL),
(987, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:17:44', 15, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:17:44', '2023-04-27 11:17:44', NULL),
(988, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:18:23', 40, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:18:23', '2023-04-27 11:18:23', NULL),
(989, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:18:29', 16, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:18:29', '2023-04-27 11:18:29', NULL),
(990, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:20:09', 17, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:20:09', '2023-04-27 11:20:09', NULL),
(991, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:20:15', 41, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:20:15', '2023-04-27 11:20:15', NULL),
(992, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:20:21', 31, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:20:21', '2023-04-27 11:20:21', NULL),
(993, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:21:01', 32, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:21:01', '2023-04-27 11:21:01', NULL),
(994, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:21:06', 42, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:21:06', '2023-04-27 11:21:06', NULL),
(995, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:21:11', 18, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:21:11', '2023-04-27 11:21:11', NULL),
(996, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:24:20', 33, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:24:20', '2023-04-27 11:24:20', NULL),
(997, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:24:25', 43, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:24:25', '2023-04-27 11:24:25', NULL),
(998, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:24:31', 19, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:24:31', '2023-04-27 11:24:31', NULL),
(999, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:26:59', 34, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:26:59', '2023-04-27 11:26:59', NULL),
(1000, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:27:04', 44, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:27:04', '2023-04-27 11:27:04', NULL),
(1001, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:27:08', 20, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:27:08', '2023-04-27 11:27:08', NULL),
(1002, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:27:34', 45, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:27:34', '2023-04-27 11:27:34', NULL),
(1003, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:27:39', 21, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:27:39', '2023-04-27 11:27:39', NULL),
(1004, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:27:44', 35, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:27:44', '2023-04-27 11:27:44', NULL),
(1005, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:28:05', 22, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:28:05', '2023-04-27 11:28:05', NULL),
(1006, 21, 46, 1, 8, 2, 1, '12.3', '2023-04-26 23:28:11', 46, 0.12, 1, '48', NULL, 'false', '2023-04-27 11:28:11', '2023-04-27 11:28:11', NULL),
(1007, 21, 23, 1, 8, 1, 1, '9.98', '2023-04-26 23:28:15', 36, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:28:15', '2023-04-27 11:28:15', NULL),
(1008, 21, 15, 1, 8, 1, 1, '9.98', '2023-04-26 23:31:42', 23, 0.10, 1, '48', NULL, 'false', '2023-04-27 11:31:42', '2023-04-27 11:31:42', NULL),
(1009, 21, 23, 2, 8, 2, 7, '20', '2023-04-26 23:33:03', 6, 0.06, 1, '48', NULL, 'false', '2023-04-27 11:33:03', '2023-04-27 11:33:03', NULL),
(1010, 21, 46, 2, 8, 2, 3, '60', '2023-04-26 23:33:08', 2, 0.06, 1, '48', NULL, 'false', '2023-04-27 11:33:08', '2023-04-27 11:33:08', NULL),
(1011, 21, 15, 2, 8, 2, 2, '70', '2023-04-26 23:33:14', 4, 0.06, 1, '48', NULL, 'false', '2023-04-27 11:33:14', '2023-04-27 11:33:14', NULL),
(1012, 13, 48, 1, 4, 1, 1, '15.5', '2023-04-27 04:37:34', 10, 0.14, 1, '99', NULL, 'false', '2023-04-27 16:37:34', '2023-04-27 16:37:34', NULL),
(1013, 13, 59, 1, 4, 1, 1, '13.9', '2023-04-27 04:37:42', 15, 0.14, 1, '99', NULL, 'false', '2023-04-27 16:37:42', '2023-04-27 16:37:42', NULL),
(1014, 13, 57, 1, 4, 1, 1, '14.7', '2023-04-27 04:37:46', 12, 0.14, 1, '99', NULL, 'false', '2023-04-27 16:37:46', '2023-04-27 16:37:46', NULL),
(1015, 13, 58, 1, 4, 1, 1, '15.5', '2023-04-27 04:37:51', 7, 0.14, 1, '99', NULL, 'false', '2023-04-27 16:37:51', '2023-04-27 16:37:51', NULL),
(1016, 13, 59, 1, 4, 1, 3, '15.9', '2023-04-27 04:39:21', 16, 0.14, 1, '99', NULL, 'false', '2023-04-27 16:39:21', '2023-04-27 16:39:21', NULL),
(1017, 13, 50, 3, 1, 2, 4, '5.4', '2023-04-27 09:01:44', 20, 0.04, 1, '20', NULL, 'false', '2023-04-27 21:01:44', '2023-04-27 21:01:44', NULL),
(1018, 13, 53, 2, 5, 1, 3, '60', '2023-04-27 09:02:10', 5, 0.06, 1, '20', NULL, 'false', '2023-04-27 21:02:10', '2023-04-27 21:02:10', NULL),
(1019, 13, 50, 2, 5, 1, 2, '70', '2023-04-27 09:02:16', 11, 0.06, 1, '20', NULL, 'false', '2023-04-27 21:02:16', '2023-04-27 21:02:16', NULL),
(1020, 13, 50, 6, 1, 2, 2, '70', '2023-04-27 16:45:42', 5, 0.08, 1, '20', NULL, 'false', '2023-04-28 04:45:42', '2023-04-28 04:45:42', NULL),
(1021, 13, 50, 8, 1, 2, 3, '16', '2023-04-27 16:48:17', 2, 0.14, 1, '20', NULL, 'false', '2023-04-28 04:48:17', '2023-04-28 04:48:17', NULL),
(1022, 13, 53, 3, 6, 1, 7, '5.49', '2023-04-27 18:13:29', 2, 0.03, 1, '20', NULL, 'false', '2023-04-28 06:13:29', '2023-04-28 06:13:29', NULL),
(1023, 13, 50, 3, 6, 2, 6, '6.39', '2023-04-27 18:13:36', 21, 0.04, 1, '20', NULL, 'false', '2023-04-28 06:13:36', '2023-04-28 06:13:36', NULL),
(1024, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-27 18:13:42', 17, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:13:42', '2023-04-28 06:13:42', NULL),
(1025, 13, 2, 3, 6, 1, 5, '4.31', '2023-04-27 18:13:50', 5, 0.03, 1, '20', NULL, 'false', '2023-04-28 06:13:50', '2023-04-28 06:13:50', NULL),
(1026, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-27 18:14:47', 18, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:14:47', '2023-04-28 06:14:47', NULL),
(1027, 13, 2, 6, 5, 1, 3, '60', '2023-04-27 18:14:50', 5, 0.08, 1, '20', NULL, 'false', '2023-04-28 06:14:50', '2023-04-28 06:14:50', NULL),
(1028, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-27 18:15:21', 19, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:15:21', '2023-04-28 06:15:21', NULL),
(1029, 22, 11, 1, 6, 1, 1, '11.9', '2023-04-27 18:15:33', 14, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:15:33', '2023-04-28 06:15:33', NULL),
(1030, 13, 53, 6, 5, 1, 3, '60', '2023-04-27 18:15:47', 6, 0.08, 1, '20', NULL, 'false', '2023-04-28 06:15:47', '2023-04-28 06:15:47', NULL),
(1031, 13, 50, 6, 5, 1, 3, '60', '2023-04-27 18:15:51', 6, 0.08, 1, '20', NULL, 'false', '2023-04-28 06:15:51', '2023-04-28 06:15:51', NULL),
(1032, 22, 11, 1, 6, 1, 1, '11.9', '2023-04-27 18:15:54', 15, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:15:54', '2023-04-28 06:15:54', NULL),
(1033, 22, 44, 1, 6, 1, 1, '9.98', '2023-04-27 18:16:00', 20, 0.12, 1, '36', NULL, 'false', '2023-04-28 06:16:00', '2023-04-28 06:16:00', NULL),
(1034, 13, 50, 2, 1, 2, 5, '40', '2023-04-28 07:24:35', 12, 0.04, 1, '20', NULL, 'false', '2023-04-28 19:24:35', '2023-04-28 19:24:35', NULL),
(1035, 13, 53, 2, 1, 2, 6, '30', '2023-04-28 07:24:46', 6, 0.04, 1, '20', NULL, 'false', '2023-04-28 19:24:46', '2023-04-28 19:24:46', NULL),
(1036, 13, 2, 2, 1, 2, 7, '20', '2023-04-28 07:24:53', 8, 0.04, 1, '20', NULL, 'false', '2023-04-28 19:24:53', '2023-04-28 19:24:53', NULL),
(1037, 13, 50, 1, 1, 2, 2, '17.5', '2023-04-28 17:17:29', 2, 0.16, 1, '20', NULL, 'false', '2023-04-29 05:17:29', '2023-04-29 05:17:29', NULL),
(1038, 13, 2, 1, 1, 1, 7, '20.7', '2023-04-28 17:17:43', 18, 0.16, 1, '20', NULL, 'false', '2023-04-29 05:17:43', '2023-04-29 05:17:43', NULL),
(1039, 22, 22, 1, 8, 1, 1, '9.98', '2023-05-04 05:47:42', 5, 0.10, 1, '46', NULL, 'false', '2023-05-04 17:47:42', '2023-05-04 17:47:42', NULL),
(1040, 13, 43, 1, 8, 1, 1, '9.98', '2023-05-04 06:01:48', 1, 0.10, 1, '50', NULL, 'false', '2023-05-04 18:01:48', '2023-05-04 18:01:48', NULL),
(1041, 13, 47, 1, 8, 2, 8, '100', '2023-05-04 06:02:53', 3, 0.12, 1, '50', NULL, 'false', '2023-05-04 18:02:53', '2023-05-04 18:02:53', NULL),
(1042, 13, 40, 1, 8, 1, 8, '100', '2023-05-04 06:09:12', 4, 0.10, 1, '50', NULL, 'false', '2023-05-04 18:09:12', '2023-05-04 18:09:12', NULL),
(1043, 13, 43, 1, 8, 1, 8, '100', '2023-05-04 06:09:55', 2, 0.10, 1, '50', NULL, 'false', '2023-05-04 18:09:55', '2023-05-04 18:09:55', NULL),
(1044, 17, 25, 1, 5, 1, 2, '13.8', '2023-05-04 06:31:53', 56, 0.13, 1, '4', NULL, 'false', '2023-05-04 18:31:53', '2023-05-04 18:31:53', NULL),
(1045, 13, 47, 1, 8, 2, 2, '13.1', '2023-05-04 06:51:38', 4, 0.12, 1, '50', NULL, 'false', '2023-05-04 18:51:38', '2023-05-04 18:51:38', NULL),
(1046, 13, 47, 3, 8, 2, 2, '3.45', '2023-05-04 06:52:53', 1, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:52:53', '2023-05-04 18:52:53', NULL),
(1047, 13, 47, 3, 8, 2, 1, '3.23', '2023-05-04 06:54:16', 2, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:54:16', '2023-05-04 18:54:16', NULL),
(1048, 13, 40, 3, 8, 1, 2, '3.35', '2023-05-04 06:54:29', 2, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:54:29', '2023-05-04 18:54:29', NULL),
(1049, 13, 47, 3, 8, 2, 5, '4.31', '2023-05-04 06:55:34', 3, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:55:34', '2023-05-04 18:55:34', NULL),
(1050, 13, 40, 3, 8, 1, 6, '4.57', '2023-05-04 06:55:48', 3, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:55:48', '2023-05-04 18:55:48', NULL),
(1051, 13, 40, 3, 8, 1, 2, '3.35', '2023-05-04 06:59:24', 4, 0.03, 1, '50', NULL, 'false', '2023-05-04 18:59:24', '2023-05-04 18:59:24', NULL),
(1052, 13, 40, 3, 8, 1, 2, '3.35', '2023-05-04 09:04:37', 5, 0.03, 1, '50', NULL, 'false', '2023-05-04 21:04:37', '2023-05-04 21:04:37', NULL),
(1053, 17, 25, 1, 5, 1, 2, '13.8', '2023-05-04 21:28:47', 57, 0.13, 1, '4', NULL, 'false', '2023-05-05 09:28:47', '2023-05-05 09:28:47', NULL),
(1054, 22, 7, 1, 6, 1, 6, '17.4', '2023-05-05 09:01:28', 9, 0.12, 1, '46', NULL, 'false', '2023-05-05 21:01:28', '2023-05-05 21:01:28', NULL),
(1055, 22, 22, 1, 6, 1, 6, '14.5', '2023-05-05 09:01:48', 6, 0.12, 1, '46', NULL, 'false', '2023-05-05 21:01:48', '2023-05-05 21:01:48', NULL),
(1056, 15, 8, 1, 1, 1, 3, '18.7', '2023-05-06 23:57:40', 2, 0.16, 1, '39', NULL, 'false', '2023-05-07 11:57:40', '2023-05-07 11:57:40', NULL),
(1057, 15, 8, 1, 1, 1, 4, '20.2', '2023-05-08 10:20:16', 3, 0.16, 1, '39', NULL, 'false', '2023-05-08 22:20:16', '2023-05-08 22:20:16', NULL),
(1058, 15, 6, 3, 2, 2, 5, '5.61', '2023-05-08 10:24:50', 1, 0.04, 1, '39', NULL, 'false', '2023-05-08 22:24:50', '2023-05-08 22:24:50', NULL),
(1059, 13, 53, 1, 6, 1, 3, '13.6', '2023-05-09 08:28:59', 2, 0.12, 1, '20', NULL, 'false', '2023-05-09 20:28:59', '2023-05-09 20:28:59', NULL),
(1060, 13, 47, 1, 8, 2, 2, '13.1', '2023-05-09 09:48:55', 5, 0.12, 1, '50', NULL, 'false', '2023-05-09 21:48:55', '2023-05-09 21:48:55', NULL),
(1061, 13, 47, 1, 8, 2, 5, '16.4', '2023-05-09 09:49:55', 6, 0.12, 1, '50', NULL, 'false', '2023-05-09 21:49:55', '2023-05-09 21:49:55', NULL),
(1062, 13, 50, 2, 1, 2, 3, '60', '2023-05-09 10:26:03', 13, 0.04, 1, '20', NULL, 'false', '2023-05-09 22:26:03', '2023-05-09 22:26:03', NULL),
(1063, 13, 2, 2, 5, 1, 1, '80', '2023-05-09 10:26:14', 9, 0.06, 1, '20', NULL, 'false', '2023-05-09 22:26:14', '2023-05-09 22:26:14', NULL),
(1064, 13, 50, 3, 1, 2, 2, '4.68', '2023-05-09 10:28:00', 22, 0.04, 1, '20', NULL, 'false', '2023-05-09 22:28:00', '2023-05-09 22:28:00', NULL);
INSERT INTO `assessment_results` (`id`, `EventID`, `ParticipantID`, `AssessmentID`, `GradeID`, `GenderID`, `ColorID`, `Results`, `DTRecorded`, `Attempt`, `Percent`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1065, 13, 2, 3, 1, 1, 3, '3.69', '2023-05-09 10:28:14', 6, 0.04, 1, '20', NULL, 'false', '2023-05-09 22:28:14', '2023-05-09 22:28:14', NULL),
(1066, 13, 53, 3, 1, 1, 5, '4.57', '2023-05-09 10:28:26', 3, 0.04, 1, '20', NULL, 'false', '2023-05-09 22:28:26', '2023-05-09 22:28:26', NULL),
(1067, 13, 50, 7, 1, 2, 3, '60', '2023-05-09 10:29:46', 3, 0.00, 1, '20', NULL, 'false', '2023-05-09 22:29:46', '2023-05-09 22:29:46', NULL),
(1068, 13, 2, 7, 1, 2, 7, '20', '2023-05-09 10:29:50', 4, 0.00, 1, '20', NULL, 'false', '2023-05-09 22:29:50', '2023-05-09 22:29:50', NULL),
(1069, 13, 53, 7, 1, 2, 4, '50', '2023-05-09 10:29:53', 3, 0.00, 1, '20', NULL, 'false', '2023-05-09 22:29:53', '2023-05-09 22:29:53', NULL),
(1070, 13, 50, 8, 1, 2, 3, '16', '2023-05-09 10:31:07', 3, 0.14, 1, '20', NULL, 'false', '2023-05-09 22:31:07', '2023-05-09 22:31:07', NULL),
(1071, 13, 50, 5, 1, 2, 1, '24.1', '2023-05-09 14:34:50', 2, 0.24, 1, '20', NULL, 'false', '2023-05-10 02:34:50', '2023-05-10 02:34:50', NULL),
(1072, 15, 21, 1, 1, 1, 1, '14.7', '2023-05-10 06:17:37', 3, 0.16, 1, '39', NULL, 'false', '2023-05-10 18:17:37', '2023-05-10 18:17:37', NULL),
(1073, 15, 21, 3, 1, 1, 5, '5.37', '2023-05-10 06:31:10', 4, 0.04, 1, '39', NULL, 'false', '2023-05-10 18:31:10', '2023-05-10 18:31:10', NULL),
(1074, 15, 8, 3, 1, 1, 5, '5.85', '2023-05-10 06:54:09', 4, 0.04, 1, '39', NULL, 'false', '2023-05-10 18:54:09', '2023-05-10 18:54:09', NULL),
(1075, 15, 51, 3, 1, 1, 6, '4.7', '2023-05-10 07:05:27', 7, 0.04, 1, '39', NULL, 'false', '2023-05-10 19:05:27', '2023-05-10 19:05:27', NULL),
(1076, 15, 33, 3, 4, 1, 6, '5.6', '2023-05-10 07:11:53', 1, 0.04, 1, '39', NULL, 'false', '2023-05-10 19:11:53', '2023-05-10 19:11:53', NULL),
(1077, 15, 8, 3, 1, 1, 5, '5.85', '2023-05-10 09:02:40', 5, 0.04, 1, '39', NULL, 'false', '2023-05-10 21:02:40', '2023-05-10 21:02:40', NULL),
(1078, 15, 33, 3, 2, 1, 6, '5.6', '2023-05-10 10:25:08', 2, 0.04, 1, '39', NULL, 'false', '2023-05-10 22:25:08', '2023-05-10 22:25:08', NULL),
(1079, 15, 8, 3, 1, 1, 6, '6.39', '2023-05-10 11:29:58', 6, 0.04, 1, '39', NULL, 'false', '2023-05-10 23:29:58', '2023-05-10 23:29:58', NULL),
(1080, 15, 33, 3, 1, 1, 7, '6.16', '2023-05-10 14:44:40', 3, 0.04, 1, '39', NULL, 'false', '2023-05-11 02:44:40', '2023-05-11 02:44:40', NULL),
(1081, 15, 8, 3, 1, 1, 7, '7.02', '2023-05-11 05:40:55', 7, 0.04, 1, '39', NULL, 'false', '2023-05-11 17:40:55', '2023-05-11 17:40:55', NULL),
(1082, 15, 8, 1, 1, 1, 4, '20.2', '2023-05-11 18:06:14', 4, 0.16, 1, '39', NULL, 'false', '2023-05-12 06:06:14', '2023-05-12 06:06:14', NULL),
(1083, 21, 64, 2, 4, 1, 1, '80', '2023-05-12 02:24:46', 1, 0.06, 1, '111', NULL, 'false', '2023-05-12 14:24:46', '2023-05-12 14:24:46', NULL),
(1084, 21, 62, 2, 2, 1, 6, '30', '2023-05-12 02:25:51', 1, 0.04, 1, '111', NULL, 'false', '2023-05-12 14:25:51', '2023-05-12 14:25:51', NULL),
(1085, 21, 61, 1, 1, 2, 6, '23.8', '2023-05-12 02:27:36', 1, 0.16, 1, '111', NULL, 'false', '2023-05-12 14:27:36', '2023-05-12 14:27:36', NULL),
(1086, 15, 6, 3, 2, 2, 3, '4.81', '2023-05-13 06:07:29', 2, 0.04, 1, '39', NULL, 'false', '2023-05-13 18:07:29', '2023-05-13 18:07:29', NULL),
(1087, 15, 8, 3, 1, 1, 6, '6.39', '2023-05-13 06:39:29', 8, 0.04, 1, '39', NULL, 'false', '2023-05-13 18:39:29', '2023-05-13 18:39:29', NULL),
(1088, 15, 8, 1, 1, 1, 3, '18.7', '2023-05-13 15:30:09', 5, 0.16, 1, '39', NULL, 'false', '2023-05-14 03:30:09', '2023-05-14 03:30:09', NULL),
(1089, 21, 61, 1, 1, 2, 1, '16.4', '2023-05-16 01:31:28', 2, 0.16, 1, '111', NULL, 'false', '2023-05-16 13:31:28', '2023-05-16 13:31:28', NULL),
(1090, 21, 61, 1, 1, 2, 1, '16.4', '2023-05-16 01:31:28', 2, 0.16, 1, '111', NULL, 'false', '2023-05-16 13:31:28', '2023-05-16 13:31:28', NULL),
(1091, 13, 50, 3, 1, 2, 2, '4.68', '2023-05-16 13:04:15', 23, 0.04, 1, '20', NULL, 'false', '2023-05-17 01:04:15', '2023-05-17 01:04:15', NULL),
(1092, 13, 53, 3, 6, 1, 5, '4.57', '2023-05-16 13:49:01', 4, 0.03, 1, '20', NULL, 'false', '2023-05-17 01:49:01', '2023-05-17 01:49:01', NULL),
(1093, 13, 50, 3, 6, 2, 2, '4.68', '2023-05-16 13:50:50', 24, 0.04, 1, '20', NULL, 'false', '2023-05-17 01:50:50', '2023-05-17 01:50:50', NULL),
(1094, 13, 2, 3, 6, 1, 5, '4.31', '2023-05-16 13:51:16', 7, 0.03, 1, '20', NULL, 'false', '2023-05-17 01:51:16', '2023-05-17 01:51:16', NULL),
(1095, 13, 53, 8, 6, 1, 2, '12.8', '2023-05-16 15:45:14', 1, 0.12, 1, '20', NULL, 'false', '2023-05-17 03:45:14', '2023-05-17 03:45:14', NULL),
(1096, 13, 50, 2, 1, 2, 5, '40', '2023-05-17 15:48:43', 14, 0.04, 1, '20', NULL, 'false', '2023-05-18 03:48:43', '2023-05-18 03:48:43', NULL),
(1097, 13, 50, 4, 1, 2, 1, '80', '2023-05-17 15:49:58', 11, 0.10, 1, '20', NULL, 'false', '2023-05-18 03:49:58', '2023-05-18 03:49:58', NULL),
(1098, 13, 50, 3, 1, 2, 1, '4.39', '2023-05-17 15:50:50', 25, 0.04, 1, '20', NULL, 'false', '2023-05-18 03:50:50', '2023-05-18 03:50:50', NULL),
(1099, 22, 22, 7, 8, 1, 7, '20', '2023-05-18 02:27:18', 2, 0.00, 1, '46', NULL, 'false', '2023-05-18 14:27:18', '2023-05-18 14:27:18', NULL),
(1100, 21, 61, 1, 1, 2, 8, '100', '2023-05-18 02:28:43', 4, 0.16, 1, '111', NULL, 'false', '2023-05-18 14:28:43', '2023-05-18 14:28:43', NULL),
(1101, 22, 22, 2, 8, 1, 1, '80', '2023-05-18 02:30:58', 2, 0.06, 1, '46', NULL, 'false', '2023-05-18 14:30:58', '2023-05-18 14:30:58', NULL),
(1102, 22, 7, 2, 8, 1, 2, '70', '2023-05-18 02:31:28', 1, 0.06, 1, '46', NULL, 'false', '2023-05-18 14:31:28', '2023-05-18 14:31:28', NULL),
(1103, 21, 64, 3, 1, 1, 6, '5.6', '2023-05-18 02:32:46', 1, 0.04, 1, '111', NULL, 'false', '2023-05-18 14:32:46', '2023-05-18 14:32:46', NULL),
(1104, 22, 22, 6, 8, 1, 6, '30', '2023-05-18 02:34:52', 2, 0.08, 1, '46', NULL, 'false', '2023-05-18 14:34:52', '2023-05-18 14:34:52', NULL),
(1105, 21, 64, 6, 4, 1, 1, '80', '2023-05-18 02:35:00', 1, 0.08, 1, '111', NULL, 'false', '2023-05-18 14:35:00', '2023-05-18 14:35:00', NULL),
(1106, 21, 61, 1, 1, 2, 6, '23.88', '2023-05-18 02:59:44', 5, 0.16, 1, '111', NULL, 'false', '2023-05-18 14:59:44', '2023-05-18 14:59:44', NULL),
(1107, 13, 50, 2, 1, 2, 1, '80', '2023-05-18 08:18:03', 15, 0.04, 1, '20', NULL, 'false', '2023-05-18 20:18:03', '2023-05-18 20:18:03', NULL),
(1108, 22, 22, 1, 8, 1, 2, '10.65', '2023-05-18 08:22:42', 7, 0.10, 1, '46', NULL, 'false', '2023-05-18 20:22:42', '2023-05-18 20:22:42', NULL),
(1109, 22, 22, 1, 8, 1, 1, '9.98', '2023-05-18 08:23:22', 8, 0.10, 1, '46', NULL, 'false', '2023-05-18 20:23:22', '2023-05-18 20:23:22', NULL),
(1110, 22, 22, 1, 8, 1, 3, '11.41', '2023-05-18 08:24:16', 9, 0.10, 1, '46', NULL, 'false', '2023-05-18 20:24:16', '2023-05-18 20:24:16', NULL),
(1111, 22, 22, 1, 8, 1, 3, '11.41', '2023-05-18 08:25:36', 10, 0.10, 1, '46', NULL, 'false', '2023-05-18 20:25:36', '2023-05-18 20:25:36', NULL),
(1112, 13, 50, 6, 1, 2, 2, '70', '2023-05-19 11:48:38', 7, 0.08, 1, '20', NULL, 'false', '2023-05-19 23:48:38', '2023-05-19 23:48:38', NULL),
(1113, 13, 2, 6, 1, 2, 1, '80', '2023-05-19 11:48:48', 6, 0.08, 1, '20', NULL, 'false', '2023-05-19 23:48:48', '2023-05-19 23:48:48', NULL),
(1114, 13, 53, 6, 1, 2, 6, '30', '2023-05-19 11:48:54', 7, 0.08, 1, '20', NULL, 'false', '2023-05-19 23:48:54', '2023-05-19 23:48:54', NULL),
(1115, 13, 50, 3, 1, 2, 4, '5.4', '2023-05-21 11:46:07', 26, 0.04, 1, '20', NULL, 'false', '2023-05-21 23:46:07', '2023-05-21 23:46:07', NULL),
(1116, 22, 22, 1, 8, 1, 2, '10.65', '2023-05-22 05:22:38', 11, 0.10, 1, '46', NULL, 'false', '2023-05-22 17:22:38', '2023-05-22 17:22:38', NULL),
(1117, 22, 22, 1, 8, 1, 6, '14.52', '2023-05-22 05:25:11', 12, 0.10, 1, '46', NULL, 'false', '2023-05-22 17:25:11', '2023-05-22 17:25:11', NULL),
(1118, 22, 22, 1, 8, 1, 1, '9.98', '2023-05-22 05:27:48', 13, 0.10, 1, '46', NULL, 'false', '2023-05-22 17:27:48', '2023-05-22 17:27:48', NULL),
(1119, 15, 8, 3, 1, 1, 5, '5.85', '2023-05-22 06:00:20', 9, 0.04, 1, '39', NULL, 'false', '2023-05-22 18:00:20', '2023-05-22 18:00:20', NULL),
(1120, 15, 6, 3, 1, 2, 6, '6.12', '2023-05-22 06:09:25', 3, 0.04, 1, '39', NULL, 'false', '2023-05-22 18:09:25', '2023-05-22 18:09:25', NULL),
(1121, 15, 8, 1, 1, 1, 3, '18.77', '2023-05-22 13:46:21', 6, 0.16, 1, '39', NULL, 'false', '2023-05-23 01:46:21', '2023-05-23 01:46:21', NULL),
(1122, 15, 51, 6, 5, 1, 5, '40', '2023-05-22 13:47:26', 2, 0.08, 1, '39', NULL, 'false', '2023-05-23 01:47:26', '2023-05-23 01:47:26', NULL),
(1123, 15, 8, 2, 1, 1, 6, '30', '2023-05-22 14:02:22', 1, 0.04, 1, '39', NULL, 'false', '2023-05-23 02:02:22', '2023-05-23 02:02:22', NULL),
(1124, 21, 63, 1, 3, 2, 4, '18.17', '2023-05-24 06:18:29', 1, 0.15, 1, '111', NULL, 'false', '2023-05-24 18:18:29', '2023-05-24 18:18:29', NULL),
(1125, 21, 64, 3, 4, 1, 6, '5.6', '2023-05-24 06:20:04', 2, 0.04, 1, '111', NULL, 'false', '2023-05-24 18:20:04', '2023-05-24 18:20:04', NULL),
(1126, 21, 61, 1, 1, 2, 4, '20.21', '2023-05-24 06:21:45', 6, 0.16, 1, '111', NULL, 'false', '2023-05-24 18:21:45', '2023-05-24 18:21:45', NULL),
(1127, 21, 64, 1, 4, 1, 1, '13.93', '2023-05-24 06:35:13', 1, 0.14, 1, '111', NULL, 'false', '2023-05-24 18:35:13', '2023-05-24 18:35:13', NULL),
(1128, 13, 2, 6, 5, 1, 2, '70', '2023-05-24 07:11:30', 7, 0.08, 1, '20', NULL, 'false', '2023-05-24 19:11:30', '2023-05-24 19:11:30', NULL),
(1129, 21, 27, 1, 8, 1, 2, '10.65', '2023-05-24 10:21:59', 3, 0.10, 1, '20', NULL, 'false', '2023-05-24 22:21:59', '2023-05-24 22:21:59', NULL),
(1130, 21, 27, 1, 8, 1, 3, '11.41', '2023-05-24 10:39:55', 4, 0.10, 1, '20', NULL, 'false', '2023-05-24 22:39:55', '2023-05-24 22:39:55', NULL),
(1131, 15, 8, 3, 1, 1, 7, '7.02', '2023-05-28 04:48:14', 10, 0.04, 1, '39', NULL, 'false', '2023-05-28 16:48:14', '2023-05-28 16:48:14', NULL),
(1132, 15, 8, 3, 1, 1, 5, '5.85', '2023-05-28 05:29:59', 11, 0.04, 1, '39', NULL, 'false', '2023-05-28 17:29:59', '2023-05-28 17:29:59', NULL),
(1133, 15, 8, 3, 1, 1, 4, '5.4', '2023-05-28 06:23:42', 12, 0.04, 1, '39', NULL, 'false', '2023-05-28 18:23:42', '2023-05-28 18:23:42', NULL),
(1134, 21, 49, 3, 7, 1, 7, '5.17', '2023-05-28 09:16:44', 1, 0.03, 1, '20', NULL, 'false', '2023-05-28 21:16:44', '2023-05-28 21:16:44', NULL),
(1135, 15, 8, 2, 1, 1, 7, '20', '2023-05-28 18:34:27', 2, 0.04, 1, '39', NULL, 'false', '2023-05-29 06:34:27', '2023-05-29 06:34:27', NULL),
(1136, 15, 8, 3, 1, 1, 8, '100', '2023-05-30 19:14:13', 13, 0.04, 1, '39', NULL, 'false', '2023-05-31 07:14:13', '2023-05-31 07:14:13', NULL),
(1137, 15, 6, 3, 1, 2, 1, '4.21', '2023-05-30 19:14:27', 4, 0.04, 1, '39', NULL, 'false', '2023-05-31 07:14:27', '2023-05-31 07:14:27', NULL),
(1138, 15, 8, 3, 1, 1, 5, '5.85', '2023-05-31 03:00:35', 14, 0.04, 1, '39', NULL, 'false', '2023-05-31 15:00:35', '2023-05-31 15:00:35', NULL),
(1139, 15, 8, 3, 1, 1, 6, '6.39', '2023-05-31 03:01:58', 15, 0.04, 1, '39', NULL, 'false', '2023-05-31 15:01:58', '2023-05-31 15:01:58', NULL),
(1140, 21, 66, 1, 2, 2, 1, '15.59', '2023-05-31 04:08:54', 1, 0.16, 1, '20', NULL, 'false', '2023-05-31 16:08:54', '2023-05-31 16:08:54', NULL),
(1141, 21, 63, 1, 3, 2, 1, '14.76', '2023-06-06 02:43:56', 2, 0.15, 1, '111', NULL, 'false', '2023-06-06 14:43:56', '2023-06-06 14:43:56', NULL),
(1142, 21, 61, 2, 1, 2, 7, '20', '2023-06-06 02:44:41', 1, 0.04, 1, '111', NULL, 'false', '2023-06-06 14:44:41', '2023-06-06 14:44:41', NULL),
(1143, 21, 69, 1, 4, 1, 4, '17.14', '2023-06-10 03:39:46', 1, 0.14, 1, '20', NULL, 'false', '2023-06-10 15:39:46', '2023-06-10 15:39:46', NULL),
(1144, 21, 68, 1, 4, 2, 7, '22.29', '2023-06-10 03:39:59', 1, 0.14, 1, '20', NULL, 'false', '2023-06-10 15:39:59', '2023-06-10 15:39:59', NULL),
(1145, 21, 61, 1, 1, 2, 3, '18.77', '2023-06-13 03:16:31', 7, 0.16, 1, '111', NULL, 'false', '2023-06-13 15:16:31', '2023-06-13 15:16:31', NULL),
(1146, 21, 64, 1, 4, 1, 6, '20.26', '2023-06-13 03:18:54', 2, 0.14, 1, '111', NULL, 'false', '2023-06-13 15:18:54', '2023-06-13 15:18:54', NULL),
(1147, 21, 69, 3, 4, 1, 6, '5.6', '2023-06-13 03:22:57', 1, 0.04, 1, '20', NULL, 'false', '2023-06-13 15:22:57', '2023-06-13 15:22:57', NULL),
(1148, 21, 68, 3, 4, 2, 6, '5.6', '2023-06-13 03:23:09', 1, 0.04, 1, '20', NULL, 'false', '2023-06-13 15:23:09', '2023-06-13 15:23:09', NULL),
(1149, 21, 27, 6, 8, 1, 4, '50', '2023-06-13 03:23:29', 4, 0.08, 1, '20', NULL, 'false', '2023-06-13 15:23:29', '2023-06-13 15:23:29', NULL),
(1150, 21, 49, 6, 8, 1, 5, '40', '2023-06-13 03:23:33', 1, 0.08, 1, '20', NULL, 'false', '2023-06-13 15:23:33', '2023-06-13 15:23:33', NULL),
(1151, 21, 69, 6, 8, 1, 1, '80', '2023-06-13 03:23:35', 1, 0.08, 1, '20', NULL, 'false', '2023-06-13 15:23:35', '2023-06-13 15:23:35', NULL),
(1152, 21, 50, 7, 1, 2, 7, '20', '2023-06-13 03:24:06', 4, 0.00, 1, '20', NULL, 'false', '2023-06-13 15:24:06', '2023-06-13 15:24:06', NULL),
(1153, 21, 69, 6, 4, 1, 2, '70', '2023-06-13 06:18:56', 2, 0.08, 1, '20', NULL, 'false', '2023-06-13 18:18:56', '2023-06-13 18:18:56', NULL),
(1154, 21, 67, 6, 4, 1, 2, '70', '2023-06-13 06:18:59', 1, 0.08, 1, '20', NULL, 'false', '2023-06-13 18:18:59', '2023-06-13 18:18:59', NULL),
(1155, 21, 68, 6, 4, 1, 1, '80', '2023-06-13 06:19:03', 1, 0.08, 1, '20', NULL, 'false', '2023-06-13 18:19:03', '2023-06-13 18:19:03', NULL),
(1156, 15, 8, 3, 1, 1, 3, '5.02', '2023-06-24 00:01:00', 16, 0.04, 1, '39', NULL, 'false', '2023-06-24 12:01:00', '2023-06-24 12:01:00', NULL),
(1157, 15, 6, 4, 2, 2, 3, '60', '2023-06-24 00:01:24', 1, 0.10, 1, '39', NULL, 'false', '2023-06-24 12:01:24', '2023-06-24 12:01:24', NULL),
(1158, 15, 8, 3, 1, 1, 3, '5.02', '2023-06-27 18:08:33', 17, 0.04, 1, '39', NULL, 'false', '2023-06-28 06:08:33', '2023-06-28 06:08:33', NULL),
(1159, 15, 6, 3, 1, 2, 5, '5.61', '2023-06-27 18:09:03', 5, 0.04, 1, '39', NULL, 'false', '2023-06-28 06:09:03', '2023-06-28 06:09:03', NULL),
(1160, 15, 21, 3, 1, 1, 5, '5.37', '2023-06-27 18:10:12', 5, 0.04, 1, '39', NULL, 'false', '2023-06-28 06:10:12', '2023-06-28 06:10:12', NULL),
(1161, 15, 42, 3, 1, 2, 5, '4.93', '2023-06-27 18:11:00', 4, 0.04, 1, '39', NULL, 'false', '2023-06-28 06:11:00', '2023-06-28 06:11:00', NULL),
(1162, 15, 8, 3, 1, 1, 4, '5.4', '2023-06-29 15:01:30', 18, 0.04, 1, '39', NULL, 'false', '2023-06-30 03:01:30', '2023-06-30 03:01:30', NULL),
(1163, 15, 8, 3, 1, 1, 5, '5.85', '2023-06-29 17:17:24', 19, 0.04, 1, '39', NULL, 'false', '2023-06-30 05:17:24', '2023-06-30 05:17:24', NULL),
(1164, 15, 8, 3, 1, 1, 5, '5.85', '2023-07-02 09:39:58', 20, 0.04, 1, '39', NULL, 'false', '2023-07-02 21:39:58', '2023-07-02 21:39:58', NULL),
(1165, 15, 6, 3, 1, 2, 7, '6.74', '2023-07-02 09:41:46', 6, 0.04, 1, '39', NULL, 'false', '2023-07-02 21:41:46', '2023-07-02 21:41:46', NULL),
(1166, 15, 60, 8, 6, 2, 3, '13.71', '2023-07-03 08:10:04', 1, 0.12, 1, '39', NULL, 'false', '2023-07-03 20:10:04', '2023-07-03 20:10:04', NULL),
(1167, 15, 8, 6, 1, 1, 7, '20', '2023-07-03 12:25:28', 1, 0.08, 1, '39', NULL, 'false', '2023-07-04 00:25:28', '2023-07-04 00:25:28', NULL),
(1168, 15, 8, 6, 1, 1, 7, '20', '2023-07-03 12:31:57', 2, 0.08, 1, '39', NULL, 'false', '2023-07-04 00:31:57', '2023-07-04 00:31:57', NULL),
(1169, 15, 8, 1, 1, 1, 3, '18.77', '2023-07-04 10:41:29', 7, 0.16, 1, '39', NULL, 'false', '2023-07-04 22:41:29', '2023-07-04 22:41:29', NULL),
(1170, 15, 6, 1, 1, 2, 7, '24.94', '2023-07-04 10:41:52', 1, 0.16, 1, '39', NULL, 'false', '2023-07-04 22:41:52', '2023-07-04 22:41:52', NULL),
(1171, 15, 6, 3, 2, 2, 6, '6.12', '2023-07-04 11:19:31', 7, 0.04, 1, '39', NULL, 'false', '2023-07-04 23:19:31', '2023-07-04 23:19:31', NULL),
(1172, 15, 21, 3, 2, 1, 4, '4.96', '2023-07-04 11:20:14', 6, 0.04, 1, '39', NULL, 'false', '2023-07-04 23:20:14', '2023-07-04 23:20:14', NULL),
(1173, 15, 8, 1, 1, 1, 3, '18.77', '2023-07-04 18:24:39', 8, 0.16, 1, '39', NULL, 'false', '2023-07-05 06:24:39', '2023-07-05 06:24:39', NULL),
(1174, 15, 8, 3, 1, 1, 4, '5.4', '2023-07-05 07:06:05', 21, 0.04, 1, '39', NULL, 'false', '2023-07-05 19:06:05', '2023-07-05 19:06:05', NULL),
(1175, 15, 8, 3, 1, 1, 4, '5.4', '2023-07-05 07:23:32', 22, 0.04, 1, '39', NULL, 'false', '2023-07-05 19:23:32', '2023-07-05 19:23:32', NULL),
(1176, 15, 8, 3, 1, 1, 5, '5.85', '2023-07-05 07:26:31', 23, 0.04, 1, '39', NULL, 'false', '2023-07-05 19:26:31', '2023-07-05 19:26:31', NULL),
(1177, 15, 6, 3, 1, 2, 4, '5.18', '2023-07-05 07:26:47', 8, 0.04, 1, '39', NULL, 'false', '2023-07-05 19:26:47', '2023-07-05 19:26:47', NULL),
(1178, 15, 8, 2, 1, 1, 7, '20', '2023-07-08 13:57:42', 3, 0.04, 1, '39', NULL, 'false', '2023-07-09 01:57:42', '2023-07-09 01:57:42', NULL),
(1179, 15, 8, 1, 1, 1, 3, '18.77', '2023-07-09 05:27:37', 9, 0.16, 1, '39', NULL, 'false', '2023-07-09 17:27:37', '2023-07-09 17:27:37', NULL),
(1180, 15, 8, 3, 1, 1, 8, '100', '2023-07-17 19:32:59', 24, 0.04, 1, '39', NULL, 'false', '2023-07-18 07:32:59', '2023-07-18 07:32:59', NULL),
(1181, 15, 8, 1, 1, 1, 1, '16.42', '2023-07-17 19:39:44', 10, 0.16, 1, '39', NULL, 'false', '2023-07-18 07:39:44', '2023-07-18 07:39:44', NULL),
(1182, 15, 8, 3, 1, 1, 4, '5.4', '2023-07-17 19:44:17', 25, 0.04, 1, '39', NULL, 'false', '2023-07-18 07:44:17', '2023-07-18 07:44:17', NULL),
(1183, 21, 27, 1, 8, 1, 2, '10.65', '2023-08-28 08:12:02', 5, 0.10, 1, '20', NULL, 'false', '2023-08-28 20:12:02', '2023-08-28 20:12:02', NULL),
(1184, 22, 11, 1, 6, 1, 1, '11.96', '2023-08-29 16:26:39', 16, 0.12, 1, '36', NULL, 'false', '2023-08-30 04:26:39', '2023-08-30 04:26:39', NULL),
(1185, 22, 11, 1, 6, 1, 6, '17.4', '2023-08-29 16:42:19', 17, 0.12, 1, '36', NULL, 'false', '2023-08-30 04:42:19', '2023-08-30 04:42:19', NULL),
(1186, 22, 13, 1, 6, 2, 1, '12.35', '2023-08-29 16:43:07', 7, 0.13, 1, '36', NULL, 'false', '2023-08-30 04:43:07', '2023-08-30 04:43:07', NULL),
(1187, 15, 33, 3, 1, 1, 4, '4.74', '2023-08-30 15:13:07', 4, 0.04, 1, '39', NULL, 'false', '2023-08-31 03:13:07', '2023-08-31 03:13:07', NULL),
(1188, 15, 51, 3, 1, 1, 6, '4.7', '2023-08-30 15:13:29', 8, 0.04, 1, '39', NULL, 'false', '2023-08-31 03:13:29', '2023-08-31 03:13:29', NULL),
(1189, 15, 42, 3, 1, 2, 8, '100', '2023-08-30 15:13:50', 5, 0.04, 1, '39', NULL, 'false', '2023-08-31 03:13:50', '2023-08-31 03:13:50', NULL),
(1190, 15, 60, 3, 1, 2, 8, '100', '2023-08-30 15:14:16', 1, 0.04, 1, '39', NULL, 'false', '2023-08-31 03:14:16', '2023-08-31 03:14:16', NULL),
(1191, 15, 8, 1, 1, 1, 2, '17.51', '2023-08-30 15:46:56', 11, 0.16, 1, '39', NULL, 'false', '2023-08-31 03:46:56', '2023-08-31 03:46:56', NULL),
(1192, 15, 8, 1, 1, 1, 1, '16.42', '2023-09-15 14:53:53', 12, 0.16, 1, '39', NULL, 'false', '2023-09-16 02:53:53', '2023-09-16 02:53:53', NULL),
(1193, 15, 8, 3, 1, 1, 5, '5.85', '2023-09-22 17:02:46', 26, 0.04, 1, '39', NULL, 'false', '2023-09-23 05:02:46', '2023-09-23 05:02:46', NULL),
(1194, 12, 70, 6, 1, 1, 1, '80', '2023-09-24 07:10:07', 1, 0.08, 1, '20', NULL, 'false', '2023-09-24 19:10:07', '2023-09-24 19:10:07', NULL),
(1195, 12, 70, 3, 1, 1, 2, '4.68', '2023-12-19 05:26:59', 1, 0.04, 1, '20', NULL, 'false', '2023-12-19 18:26:59', '2023-12-19 18:26:59', NULL),
(1196, 15, 80, 3, 18, 1, 4, '3.29', '2023-12-21 17:30:56', 1, 0.03, 1, '20', NULL, 'false', '2023-12-22 06:30:56', '2023-12-22 06:30:56', NULL),
(1197, 15, 51, 6, 5, 1, 6, '30', '2024-01-10 08:37:23', 3, 0.08, 1, '39', NULL, 'false', '2024-01-10 21:37:23', '2024-01-10 21:37:23', NULL),
(1198, 15, 75, 6, 5, 1, 1, '80', '2024-01-10 08:37:30', 1, 0.08, 1, '39', NULL, 'false', '2024-01-10 21:37:30', '2024-01-10 21:37:30', NULL),
(1199, 15, 6, 1, 2, 1, 3, '17.82', '2024-01-25 08:40:40', 2, 0.16, 1, '39', NULL, 'false', '2024-01-25 21:40:40', '2024-01-25 21:40:40', NULL),
(1200, 15, 28, 1, 2, 1, 4, '18.17', '2024-01-25 08:40:51', 1, 0.16, 1, '39', NULL, 'false', '2024-01-25 21:40:51', '2024-01-25 21:40:51', NULL),
(1201, 15, 75, 5, 7, 1, 4, '23.69', '2024-01-30 02:47:34', 1, 0.19, 1, '39', NULL, 'false', '2024-01-30 15:47:34', '2024-01-30 15:47:34', NULL),
(1202, 15, 51, 3, 5, 1, 6, '4.7', '2024-02-07 17:08:04', 9, 0.03, 1, '39', NULL, 'false', '2024-02-08 06:08:04', '2024-02-08 06:08:04', NULL),
(1203, 15, 33, 2, 7, 1, 7, '20', '2024-02-29 02:37:04', 2, 0.06, 1, '39', NULL, 'false', '2024-02-29 15:37:04', '2024-02-29 15:37:04', NULL),
(1204, 15, 51, 2, 7, 1, 7, '20', '2024-02-29 02:37:22', 1, 0.06, 1, '39', NULL, 'false', '2024-02-29 15:37:22', '2024-02-29 15:37:22', NULL),
(1205, 15, 33, 6, 4, 1, 5, '40', '2024-03-13 06:41:13', 1, 0.08, 1, '39', NULL, 'false', '2024-03-13 18:41:13', '2024-03-13 18:41:13', NULL),
(1206, 15, 6, 3, 2, 1, 4, '5.18', '2024-03-13 08:00:29', 9, 0.04, 1, '39', NULL, 'false', '2024-03-13 20:00:29', '2024-03-13 20:00:29', NULL),
(1207, 15, 6, 3, 2, 1, 4, '5.18', '2024-03-13 09:27:14', 10, 0.04, 1, '39', NULL, 'false', '2024-03-13 21:27:14', '2024-03-13 21:27:14', NULL),
(1208, 15, 28, 3, 2, 1, 5, '5.37', '2024-03-13 10:06:01', 1, 0.04, 1, '39', NULL, 'false', '2024-03-13 22:06:01', '2024-03-13 22:06:01', NULL),
(1209, 15, 6, 3, 2, 1, 5, '5.61', '2024-03-14 05:08:40', 11, 0.04, 1, '39', NULL, 'false', '2024-03-14 17:08:40', '2024-03-14 17:08:40', NULL),
(1210, 15, 6, 3, 2, 1, 4, '5.18', '2024-03-14 05:54:55', 12, 0.04, 1, '39', NULL, 'false', '2024-03-14 17:54:55', '2024-03-14 17:54:55', NULL),
(1211, 15, 78, 3, 16, 1, 5, '3.79', '2024-03-14 06:40:10', 1, 0.03, 1, '39', NULL, 'false', '2024-03-14 18:40:10', '2024-03-14 18:40:10', NULL),
(1212, 15, 6, 2, 2, 1, 6, '30', '2024-03-14 09:41:51', 1, 0.04, 1, '39', NULL, 'false', '2024-03-14 21:41:51', '2024-03-14 21:41:51', NULL),
(1213, 15, 6, 3, 2, 1, 5, '5.61', '2024-03-14 11:07:27', 13, 0.04, 1, '39', NULL, 'false', '2024-03-14 23:07:27', '2024-03-14 23:07:27', NULL),
(1214, 15, 28, 3, 2, 1, 7, '6.45', '2024-03-14 11:18:01', 2, 0.04, 1, '39', NULL, 'false', '2024-03-14 23:18:01', '2024-03-14 23:18:01', NULL),
(1215, 15, 6, 3, 2, 1, 6, '6.12', '2024-03-14 11:56:55', 14, 0.04, 1, '39', NULL, 'false', '2024-03-14 23:56:55', '2024-03-14 23:56:55', NULL),
(1216, 15, 33, 6, 4, 1, 3, '60', '2024-03-20 02:42:16', 2, 0.08, 1, '39', NULL, 'false', '2024-03-20 14:42:16', '2024-03-20 14:42:16', NULL),
(1217, 17, 25, 4, 5, 1, 6, '30', '2024-05-08 06:29:54', 9, 0.16, 1, '4', NULL, 'false', '2024-05-08 18:29:54', '2024-05-08 18:29:54', NULL),
(1218, 17, 26, 4, 5, 1, 5, '40', '2024-05-08 06:30:02', 5, 0.16, 1, '4', NULL, 'false', '2024-05-08 18:30:02', '2024-05-08 18:30:02', NULL),
(1219, 15, 33, 3, 4, 1, 5, '5.13', '2024-05-10 02:50:12', 5, 0.04, 1, '39', NULL, 'false', '2024-05-10 14:50:12', '2024-05-10 14:50:12', NULL),
(1220, 15, 6, 3, 2, 1, 4, '5.18', '2024-05-10 02:53:38', 15, 0.04, 1, '39', NULL, 'false', '2024-05-10 14:53:38', '2024-05-10 14:53:38', NULL),
(1221, 15, 75, 3, 3, 1, 8, '100', '2024-05-10 10:20:51', 1, 0.04, 1, '39', NULL, 'false', '2024-05-10 22:20:51', '2024-05-10 22:20:51', NULL),
(1222, 15, 75, 3, 7, 1, 5, '4.31', '2024-05-10 11:07:07', 2, 0.03, 1, '39', NULL, 'false', '2024-05-10 23:07:07', '2024-05-10 23:07:07', NULL),
(1223, 15, 75, 1, 7, 1, 8, '100', '2024-05-10 11:19:00', 1, 0.11, 1, '39', NULL, 'false', '2024-05-10 23:19:00', '2024-05-10 23:19:00', NULL),
(1224, 15, 76, 1, 7, 1, 1, '9.98', '2024-05-10 11:19:11', 1, 0.11, 1, '39', NULL, 'false', '2024-05-10 23:19:11', '2024-05-10 23:19:11', NULL),
(1225, 15, 75, 3, 4, 1, 4, '3.98', '2024-05-10 11:45:05', 3, 0.04, 1, '39', NULL, 'false', '2024-05-10 23:45:05', '2024-05-10 23:45:05', NULL),
(1226, 15, 75, 6, 7, 1, 1, '80', '2024-05-11 05:28:01', 2, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:01', '2024-05-11 17:28:01', NULL),
(1227, 15, 76, 6, 7, 1, 1, '80', '2024-05-11 05:28:06', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:06', '2024-05-11 17:28:06', NULL),
(1228, 15, 77, 6, 7, 1, 1, '80', '2024-05-11 05:28:08', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:08', '2024-05-11 17:28:08', NULL),
(1229, 15, 78, 6, 7, 1, 1, '80', '2024-05-11 05:28:11', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:11', '2024-05-11 17:28:11', NULL),
(1230, 15, 79, 6, 7, 1, 1, '80', '2024-05-11 05:28:13', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:13', '2024-05-11 17:28:13', NULL),
(1231, 15, 80, 6, 7, 1, 1, '80', '2024-05-11 05:28:16', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:16', '2024-05-11 17:28:16', NULL),
(1232, 15, 6, 6, 7, 1, 1, '80', '2024-05-11 05:28:18', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:18', '2024-05-11 17:28:18', NULL),
(1233, 15, 28, 6, 7, 1, 1, '80', '2024-05-11 05:28:23', 1, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:23', '2024-05-11 17:28:23', NULL),
(1234, 15, 33, 6, 7, 1, 1, '80', '2024-05-11 05:28:27', 3, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:27', '2024-05-11 17:28:27', NULL),
(1235, 15, 51, 6, 7, 1, 1, '80', '2024-05-11 05:28:30', 4, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:30', '2024-05-11 17:28:30', NULL),
(1236, 15, 76, 6, 7, 1, 1, '80', '2024-05-11 05:28:39', 2, 0.08, 1, '39', NULL, 'false', '2024-05-11 17:28:39', '2024-05-11 17:28:39', NULL),
(1237, 15, 78, 3, 16, 1, 8, '100', '2024-05-23 15:47:10', 2, 0.03, 1, '39', NULL, 'false', '2024-05-24 03:47:10', '2024-05-24 03:47:10', NULL),
(1238, 15, 33, 3, 4, 1, 5, '5.13', '2024-05-24 06:14:31', 6, 0.04, 1, '39', NULL, 'false', '2024-05-24 18:14:31', '2024-05-24 18:14:31', NULL),
(1239, 15, 6, 3, 2, 1, 5, '5.61', '2024-05-24 13:15:44', 16, 0.04, 1, '39', NULL, 'false', '2024-05-25 01:15:44', '2024-05-25 01:15:44', NULL),
(1240, 15, 6, 1, 2, 1, 3, '17.82', '2024-05-25 06:05:16', 3, 0.16, 1, '39', NULL, 'false', '2024-05-25 18:05:16', '2024-05-25 18:05:16', NULL),
(1241, 15, 6, 1, 2, 1, 3, '17.82', '2024-05-25 06:17:40', 4, 0.16, 1, '39', NULL, 'false', '2024-05-25 18:17:40', '2024-05-25 18:17:40', NULL),
(1242, 15, 6, 1, 2, 1, 4, '19.19', '2024-05-25 11:56:06', 5, 0.16, 1, '39', NULL, 'false', '2024-05-25 23:56:06', '2024-05-25 23:56:06', NULL),
(1243, 15, 6, 1, 2, 1, 3, '17.82', '2024-05-25 12:25:39', 6, 0.16, 1, '39', NULL, 'false', '2024-05-26 00:25:39', '2024-05-26 00:25:39', NULL),
(1244, 15, 33, 1, 4, 1, 4, '17.14', '2024-05-27 14:30:08', 3, 0.14, 1, '39', NULL, 'false', '2024-05-28 02:30:08', '2024-05-28 02:30:08', NULL),
(1245, 15, 6, 3, 2, 1, 4, '5.18', '2024-08-12 11:10:33', 17, 0.04, 1, '39', NULL, 'false', '2024-08-12 23:10:33', '2024-08-12 23:10:33', NULL),
(1246, 15, 28, 6, 3, 1, 6, '30', '2025-02-02 01:50:22', 2, 0.08, 1, '39', NULL, 'false', '2025-02-02 14:50:22', '2025-02-02 14:50:22', NULL),
(1247, 15, 6, 4, 2, 1, 7, '20', '2025-08-08 09:47:08', 2, 0.10, 1, '39', NULL, 'false', '2025-08-08 21:47:08', '2025-08-08 21:47:08', NULL),
(1248, 15, 28, 4, 2, 1, 6, '30', '2025-08-08 09:47:12', 2, 0.10, 1, '39', NULL, 'false', '2025-08-08 21:47:12', '2025-08-08 21:47:12', NULL),
(1249, 15, 51, 1, 2, 1, 4, '15.93', '2025-10-14 07:06:23', 3, 0.16, 1, '39', NULL, 'false', '2025-10-14 19:06:23', '2025-10-14 19:06:23', NULL),
(1250, 15, 6, 2, 2, 1, 6, '30', '2025-10-29 02:43:39', 2, 0.04, 1, '39', NULL, 'false', '2025-10-29 14:43:39', '2025-10-29 14:43:39', NULL),
(1251, 15, 6, 5, 2, 1, 3, '26.77', '2025-10-29 02:50:25', 1, 0.23, 1, '39', NULL, 'false', '2025-10-29 14:50:25', '2025-10-29 14:50:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_scorings`
--

CREATE TABLE `assessment_scorings` (
  `id` int(10) UNSIGNED NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `MinValue` varchar(255) DEFAULT NULL,
  `MaxValue` varchar(255) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `Beep` varchar(255) DEFAULT NULL,
  `Distance` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Score_target` enum('Duration','Distance','Beep') NOT NULL,
  `minTime` varchar(255) NOT NULL DEFAULT '0',
  `maxTime` varchar(255) NOT NULL DEFAULT '0',
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_types`
--

CREATE TABLE `assessment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Timed` tinyint(4) DEFAULT NULL,
  `Distance` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_types`
--

INSERT INTO `assessment_types` (`id`, `Name`, `Timed`, `Distance`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Timed', 1, 0, 1, '6', '6', 'false', '2022-12-05 17:05:57', '2022-12-20 21:14:27', NULL),
(2, 'Distance', 0, 1, 1, '6', '6', 'false', '2022-12-05 17:06:57', '2022-12-20 21:15:01', NULL),
(3, 'Non-Traditional Distance', 1, 0, 1, '6', '6', 'false', '2022-12-05 17:19:33', '2022-12-30 21:16:18', '2022-12-30 21:16:18'),
(4, 'Cycle Count', 1, 0, 1, '6', '6', 'false', '2022-12-05 17:19:45', '2022-12-30 21:16:33', '2022-12-30 21:16:33'),
(5, '8 Track', 1, 0, 1, '6', NULL, 'false', '2022-12-05 17:19:53', '2022-12-30 21:16:37', '2022-12-30 21:16:37'),
(6, '8 Bell', 1, 0, 1, '6', NULL, 'false', '2022-12-05 17:21:14', '2022-12-30 21:16:43', '2022-12-30 21:16:43'),
(7, '8 Mile', 0, 1, 1, '6', NULL, 'false', '2022-12-05 17:21:26', '2022-12-30 21:16:47', '2022-12-30 21:16:47'),
(8, 'Crazy 8', 1, 0, 1, '6', NULL, 'false', '2022-12-05 17:21:36', '2022-12-30 21:16:53', '2022-12-30 21:16:53'),
(9, '8 Mile Beeper', 1, 0, 1, '6', '6', 'false', '2022-12-06 15:36:31', '2022-12-30 21:16:58', '2022-12-30 21:16:58'),
(10, 'test', 1, 0, 1, '6', NULL, 'false', '2022-12-07 15:37:12', '2022-12-30 21:17:02', '2022-12-30 21:17:02'),
(11, 'Grade Test', 0, 1, 1, '6', '6', 'false', '2022-12-13 18:45:37', '2022-12-30 21:17:07', '2022-12-30 21:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `ColorID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `Name`, `ColorID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Class 1', 8, 1, '6', '19', 'false', '2022-12-05 18:42:16', '2023-12-19 23:26:05', NULL),
(2, 'Class 2', 7, 1, '6', '6', 'false', '2022-12-05 18:52:56', '2022-12-15 01:28:20', NULL),
(3, 'Class 3', 6, 1, '6', '6', 'false', '2022-12-06 15:35:24', '2022-12-15 01:28:32', NULL),
(4, 'Class 4', 5, 1, '6', '6', 'false', '2022-12-06 15:35:35', '2022-12-15 01:26:55', NULL),
(5, 'Class 5', 4, 1, '6', '6', 'false', '2022-12-13 18:44:48', '2022-12-15 01:28:52', NULL),
(6, 'Class 6', 3, 1, '6', '6', 'false', '2022-12-15 01:27:27', '2022-12-15 01:29:06', NULL),
(7, 'Class 7', 2, 1, '6', NULL, 'false', '2022-12-15 01:27:40', '2022-12-15 01:27:40', NULL),
(8, 'Class 8', 1, 1, '6', NULL, 'false', '2022-12-15 01:27:55', '2022-12-15 01:27:55', NULL),
(9, 'Class 9', 8, 1, '19', NULL, 'false', '2023-12-19 08:20:43', '2023-12-19 08:20:43', NULL),
(10, 'Class 10', 5, 1, '19', NULL, 'false', '2023-12-19 08:21:07', '2023-12-19 08:21:07', NULL),
(11, 'Class 11', 3, 1, '19', NULL, 'false', '2023-12-19 08:21:22', '2023-12-19 08:21:22', NULL),
(12, 'Class 12', 1, 1, '19', NULL, 'false', '2023-12-19 08:21:37', '2023-12-19 08:21:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `Information` varchar(150) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `WebColor` varchar(10) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `Name`, `Information`, `Sort`, `WebColor`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Red', 'Red Color', 1, '#ff0000', 1, '6', NULL, 'false', '2022-12-05 17:27:51', '2022-12-06 15:34:59', NULL),
(2, 'Blue', 'Blue Color', 2, '#0000ff', 1, '6', NULL, 'false', '2022-12-05 17:28:43', '2022-12-05 17:28:43', NULL),
(3, 'Green', 'Green Color', 3, '#00ff1e', 1, '6', NULL, 'false', '2022-12-05 17:29:57', '2022-12-05 17:29:57', NULL),
(4, 'Orange', 'Orange Color', 4, '#ffa500', 1, '6', NULL, 'false', '2022-12-05 17:31:11', '2022-12-05 17:31:11', NULL),
(5, 'Violet', 'Violet Color', 5, '#800080', 1, '6', NULL, 'false', '2022-12-05 17:31:45', '2022-12-05 17:31:45', NULL),
(6, 'Yellow', 'Yellow Color', 6, '#fff700', 1, '6', NULL, 'false', '2022-12-05 17:32:21', '2022-12-05 17:32:21', NULL),
(7, 'Pink', 'Pink Color', 7, '#f9b9ce', 1, '6', NULL, 'false', '2022-12-05 17:33:49', '2022-12-05 17:33:49', NULL),
(8, 'White', 'White color', 8, '#ffffff', 1, '6', NULL, 'false', '2022-12-05 17:34:27', '2022-12-05 17:34:27', NULL),
(9, 'Brown Color', 'Brown Color', 9, '#aa5c31', 1, '6', NULL, 'true', '2022-12-06 15:34:16', '2023-05-12 14:19:54', NULL),
(10, 'Indigo', 'Color Indigo', 10, '#4b0082', 1, '6', NULL, 'true', '2022-12-07 12:51:53', '2023-05-12 14:19:50', NULL),
(11, 'Diamond', 'Color Diamond', 11, '#b9f2ff', 1, '6', NULL, 'true', '2022-12-07 12:53:35', '2023-05-12 14:19:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ContactTypeID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `FacilitatorID` int(10) UNSIGNED DEFAULT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `PhoneWork` varchar(32) DEFAULT NULL,
  `CanTextWork` tinyint(4) DEFAULT NULL,
  `PhoneMobil` varchar(32) DEFAULT NULL,
  `CanTextMobil` tinyint(4) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `ContactTypeID`, `OrganizationID`, `FacilitatorID`, `Firstname`, `Lastname`, `PhoneWork`, `CanTextWork`, `PhoneMobil`, `CanTextMobil`, `Address`, `Email`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 5, 1, 'Javlin', 'Throw', '03103444978', 1, '03103444978', 1, 'OIP', 'ali.akbar@oip.com.pk', 1, '6', '6', 'true', '2022-12-05 18:56:03', '2022-12-16 16:38:25', NULL),
(2, 1, 1, 3, 'talha', 'ahemd', '03042349918', 1, '03042349918', 1, 'OIP', 'ali.akbar@oip.com.org', 1, '6', NULL, 'true', '2022-12-06 15:47:32', '2022-12-16 16:38:31', NULL),
(3, 1, 7, 6, 'ALi', 'Akbar', '0304255555', 1, '035555555', 1, 'jauhar', 'abc.def@maila', 1, '6', NULL, 'true', '2022-12-07 13:08:12', '2022-12-16 16:38:33', NULL),
(4, 1, 7, 15, 'Hannan', 'Muhammad', '0304234777777', 1, '7777777777777', 1, 'ali.akbar', 'abc.def@mail.come', 1, '6', NULL, 'true', '2022-12-07 13:08:51', '2022-12-16 16:38:37', NULL),
(5, 2, 5, 1, 'Javlin', 'Game', '03042348888', 1, '03102545998', 1, 'OIP', 'abc.def@mailarr', 1, '6', NULL, 'true', '2022-12-07 13:10:39', '2022-12-16 16:38:41', NULL),
(6, 2, 8, 25, 'Amiyah', 'Rice', '03042349918', 1, '03042349918', 1, 'Larkana', 'ali.akbar@oip.com.pktn', 1, '6', NULL, 'false', '2022-12-16 16:46:49', '2022-12-16 16:46:49', NULL),
(7, 3, 9, 21, 'Faith', 'Well-done', '03042349918', 1, '03042349918', 1, 'Birmingham', 'abc.def@mailaai', 1, '6', NULL, 'false', '2022-12-16 16:48:38', '2022-12-16 16:48:38', NULL),
(8, 1, 10, 22, 'Bella\'Zion', 'Johnson', '03042349918', 1, '03042349918', 1, 'London', 'Johnson@gmail.com', 1, '6', NULL, 'false', '2022-12-16 16:50:34', '2022-12-16 16:50:34', NULL),
(9, 5, 11, 23, 'Melodi', 'Owens', '03010344789', 1, '03103444978', 1, 'Washington DC', 'Owens55@gmail.com', 1, '6', NULL, 'false', '2022-12-16 17:00:24', '2022-12-16 17:00:24', NULL),
(10, 6, 12, 24, 'Khyllian', 'Grisby', '03103444978', 1, '03103444978', 1, 'California', 'Grisby@gmail.com', 1, '6', NULL, 'false', '2022-12-16 17:01:21', '2022-12-16 17:01:21', NULL),
(11, 1, 4, 12, 'aaaaaaaaaaaaaaaaaaaaaaaaaaassssssssss', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssss', 'Phonew2', 1, 'phionr22', 1, '1', 'abc.def@mailaaaaaa', 1, '6', NULL, 'true', '2022-12-19 17:10:49', '2023-02-15 15:50:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_types`
--

CREATE TABLE `contact_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Classification` varchar(25) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_types`
--

INSERT INTO `contact_types` (`id`, `Classification`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Phone', 1, '6', '6', 'false', '2022-12-05 18:55:19', '2022-12-15 00:03:48', NULL),
(2, 'Work', 1, '6', NULL, 'false', '2022-12-05 18:55:25', '2022-12-06 15:48:52', NULL),
(3, 'Home', 1, '6', NULL, 'false', '2022-12-05 18:55:29', '2022-12-05 18:55:29', NULL),
(4, 'School / college', 1, '6', '6', 'true', '2022-12-06 15:48:21', '2022-12-16 16:58:46', NULL),
(5, 'School', 1, '6', NULL, 'false', '2022-12-16 16:58:54', '2022-12-16 16:58:54', NULL),
(6, 'Business', 1, '6', NULL, 'false', '2022-12-16 16:59:10', '2022-12-16 16:59:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_data`
--

CREATE TABLE `copy_data` (
  `AssessmentID` int(11) NOT NULL,
  `GradeID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `GenderID` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `Percent` float NOT NULL,
  `UseSegment` tinyint(1) NOT NULL DEFAULT 0,
  `DistanceToRed` float GENERATED ALWAYS AS (round(cast(`Percent` as float),2) * `UseSegment`) VIRTUAL,
  `RL` float GENERATED ALWAYS AS (round(cast(0 as float),2)) VIRTUAL,
  `RU` float GENERATED ALWAYS AS (round(cast(`Percent` as float),2)) VIRTUAL,
  `BL` float GENERATED ALWAYS AS (round(cast(cast(`Percent` as float) + 0.01 as float),2)) VIRTUAL,
  `BU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 15 as float),2)) VIRTUAL,
  `GL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 15 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `GU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 14 as float),2)) VIRTUAL,
  `OL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 14 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `OU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 13 as float),2)) VIRTUAL,
  `VL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 13 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `VU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 12 as float),2)) VIRTUAL,
  `YL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 12 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `YU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 11 as float),2)) VIRTUAL,
  `PL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 11 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `PU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 10 as float),2)) VIRTUAL,
  `WL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 10 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `WU` float GENERATED ALWAYS AS (round(cast(100 as float),2)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `copy_data`
--

INSERT INTO `copy_data` (`AssessmentID`, `GradeID`, `GenderID`, `Percent`, `UseSegment`) VALUES
(1, 1, 1, 16.42, 0),
(1, 1, 2, 16.42, 0),
(1, 2, 1, 15.59, 0),
(1, 2, 2, 15.59, 0),
(1, 3, 1, 14.76, 0),
(1, 3, 2, 14.76, 0),
(1, 4, 1, 13.93, 0),
(1, 4, 2, 13.93, 0),
(1, 5, 1, 12.94, 0),
(1, 5, 2, 13.54, 0),
(1, 6, 1, 11.96, 0),
(1, 6, 2, 13.14, 0),
(1, 7, 1, 10.97, 0),
(1, 7, 2, 12.75, 0),
(1, 8, 1, 9.98, 0),
(1, 8, 2, 12.35, 0),
(2, 1, 1, 4.5, 1),
(2, 1, 2, 4.5, 1),
(2, 2, 1, 4.5, 1),
(2, 2, 2, 4.5, 1),
(2, 3, 1, 5.5, 1),
(2, 3, 2, 5.5, 1),
(2, 4, 1, 5.5, 1),
(2, 4, 2, 5.5, 1),
(2, 5, 1, 6, 1),
(2, 5, 2, 5.5, 1),
(2, 6, 1, 6, 1),
(2, 6, 2, 5.5, 1),
(2, 7, 1, 6.5, 1),
(2, 7, 2, 6, 1),
(2, 8, 1, 6.5, 1),
(2, 8, 2, 6, 1),
(3, 1, 1, 4.39, 0),
(3, 1, 2, 4.39, 0),
(3, 2, 1, 4.21, 0),
(3, 2, 2, 4.21, 0),
(3, 3, 1, 4.03, 0),
(3, 3, 2, 4.03, 0),
(3, 4, 1, 3.85, 0),
(3, 4, 2, 3.85, 0),
(3, 5, 1, 3.23, 0),
(3, 5, 2, 3.7, 0),
(3, 6, 1, 3.43, 0),
(3, 6, 2, 3.54, 0),
(3, 7, 1, 3.23, 0),
(3, 7, 2, 3.39, 0),
(3, 8, 1, 3.14, 0),
(3, 8, 2, 3.23, 0),
(4, 1, 1, 10, 1),
(4, 1, 2, 10, 1),
(4, 2, 1, 10, 1),
(4, 2, 2, 10, 1),
(4, 3, 1, 15, 1),
(4, 3, 2, 15, 1),
(4, 4, 1, 15, 1),
(4, 4, 2, 15, 1),
(4, 5, 1, 16, 1),
(4, 5, 2, 15, 1),
(4, 6, 1, 16, 1),
(4, 6, 2, 15, 1),
(4, 7, 1, 20, 1),
(4, 7, 2, 15, 1),
(4, 8, 1, 20, 1),
(4, 8, 2, 15, 1),
(5, 1, 1, 24.15, 0),
(5, 1, 2, 24.15, 0),
(5, 2, 1, 23.42, 0),
(5, 2, 2, 23.42, 0),
(5, 3, 1, 22.69, 0),
(5, 3, 2, 22.69, 0),
(5, 4, 1, 21.97, 0),
(5, 4, 2, 21.97, 0),
(5, 5, 1, 21.06, 0),
(5, 5, 2, 21.65, 0),
(5, 6, 1, 20.15, 0),
(5, 6, 2, 21.34, 0),
(5, 7, 1, 19.25, 0),
(5, 7, 2, 21.03, 0),
(5, 8, 1, 18.34, 0),
(5, 8, 2, 20.71, 0),
(6, 1, 1, 8, 1),
(6, 1, 2, 8, 1),
(6, 2, 1, 8, 1),
(6, 2, 2, 8, 1),
(6, 3, 1, 8, 1),
(6, 3, 2, 8, 1),
(6, 4, 1, 8, 1),
(6, 4, 2, 8, 1),
(6, 5, 1, 8, 1),
(6, 5, 2, 8, 1),
(6, 6, 1, 8, 1),
(6, 6, 2, 8, 1),
(6, 7, 1, 8, 1),
(6, 7, 2, 8, 1),
(6, 8, 1, 8, 1),
(6, 8, 2, 8, 1),
(7, 1, 1, 8, 1),
(7, 1, 2, 8, 1),
(7, 2, 1, 8, 1),
(7, 2, 2, 8, 1),
(7, 3, 1, 8, 1),
(7, 3, 2, 8, 1),
(7, 4, 1, 8, 1),
(7, 4, 2, 8, 1),
(7, 5, 1, 8, 1),
(7, 5, 2, 8, 1),
(7, 6, 1, 8, 1),
(7, 6, 2, 8, 1),
(7, 7, 1, 8, 1),
(7, 7, 2, 8, 1),
(7, 8, 1, 8, 1),
(7, 8, 2, 8, 1),
(8, 1, 1, 14, 0),
(8, 1, 2, 14, 0),
(8, 2, 1, 14, 0),
(8, 2, 2, 14, 0),
(8, 3, 1, 13, 0),
(8, 3, 2, 13, 0),
(8, 4, 1, 13, 0),
(8, 4, 2, 13, 0),
(8, 5, 1, 12, 0),
(8, 5, 2, 12, 0),
(8, 6, 1, 12, 0),
(8, 6, 2, 12, 0),
(8, 7, 1, 11, 0),
(8, 7, 2, 11, 0),
(8, 8, 1, 11, 0),
(8, 8, 2, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `facilitator_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_id`, `device_name`, `facilitator_id`, `created_at`, `updated_at`) VALUES
(8, 'iPhone12,5', 'iPhone 11 Pro Max', 4, '2023-03-28 15:12:46', '2023-03-28 15:12:46'),
(12, 'goldfish_x86', 'Android SDK built for x86', 4, '2023-03-29 22:56:51', '2023-03-29 22:56:51'),
(19, 'iPhone10,2', 'iPhone', 4, '2023-04-03 23:29:34', '2023-04-03 23:29:34'),
(27, 'goldfish_x86', 'Android SDK built for x86', 50, '2023-04-10 01:24:34', '2023-04-10 01:24:34'),
(33, 'iPhone12,3', 'iPhone 11 Pro', 46, '2023-04-10 16:40:07', '2023-04-10 16:40:07'),
(37, 'goldfish_x86', 'Android SDK built for x86', 48, '2023-04-11 23:15:24', '2023-04-11 23:15:24'),
(44, 'iPhone12,1', 'iPhone 11', 48, '2023-04-12 16:42:30', '2023-04-12 16:42:30'),
(61, 'goldfish_x86', 'Android SDK built for x86', 48, '2023-04-22 00:17:27', '2023-04-22 00:17:27'),
(62, 'goldfish_x86', 'Android SDK built for x86', 48, '2023-04-26 00:30:10', '2023-04-26 00:30:10'),
(97, 'taimen', 'Pixel 2 XL', 42, '2023-05-05 01:40:00', '2023-05-05 01:40:00'),
(99, 'taimen', 'Pixel 2 XL', 42, '2023-05-05 04:02:19', '2023-05-05 04:02:19'),
(153, 'iPhone13,3', 'iPhone', 36, '2023-05-09 22:20:00', '2023-05-09 22:20:00'),
(156, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-10 13:16:18', '2023-05-10 13:16:18'),
(163, 'iPhone13,4', 'iPhone', 39, '2023-05-10 18:36:45', '2023-05-10 18:36:45'),
(164, 'QC_Reference_Phone', 'OPPO A57', 4, '2023-05-10 18:52:22', '2023-05-10 18:52:22'),
(165, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-11 15:50:15', '2023-05-11 15:50:15'),
(166, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-11 15:50:37', '2023-05-11 15:50:37'),
(174, 'spes', 'Redmi Note 11', 46, '2023-05-15 19:43:24', '2023-05-15 19:43:24'),
(195, 'panther', 'Pixel 7', 39, '2023-05-22 17:59:27', '2023-05-22 17:59:27'),
(196, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-22 18:12:06', '2023-05-22 18:12:06'),
(197, 'iPhone13,3', 'iPhone', 38, '2023-05-23 01:55:36', '2023-05-23 01:55:36'),
(198, 'iPhone13,4', 'iPhone', 39, '2023-05-23 02:05:20', '2023-05-23 02:05:20'),
(201, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-23 19:04:09', '2023-05-23 19:04:09'),
(202, 'spes', 'Redmi Note 11', 46, '2023-05-23 19:29:41', '2023-05-23 19:29:41'),
(206, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2023-05-24 17:10:49', '2023-05-24 17:10:49'),
(210, 'spes', 'Redmi Note 11', 20, '2023-05-26 17:36:13', '2023-05-26 17:36:13'),
(212, 'iPhone13,3', 'iPhone', 36, '2023-05-31 04:45:51', '2023-05-31 04:45:51'),
(213, 'iPhone13,4', 'iPhone', 39, '2023-05-31 07:13:19', '2023-05-31 07:13:19'),
(219, 'goldfish_arm64', 'sdk_gphone64_arm64', 48, '2023-06-12 18:57:31', '2023-06-12 18:57:31'),
(220, 'goldfish_arm64', 'sdk_gphone64_arm64', 99, '2023-06-12 18:58:05', '2023-06-12 18:58:05'),
(224, 'berlna', 'motorola edge 5G UW (2021)', 39, '2023-06-13 02:36:04', '2023-06-13 02:36:04'),
(225, 'a32', 'Galaxy A32', 111, '2023-06-13 14:50:33', '2023-06-13 14:50:33'),
(226, 'a32', 'Galaxy A32', 20, '2023-06-13 15:21:22', '2023-06-13 15:21:22'),
(231, 'iPhone13,2', 'iPhone', 20, '2023-09-09 00:53:16', '2023-09-09 00:53:16'),
(236, 'iPhone13,2', 'iPhone', 20, '2023-09-24 18:56:20', '2023-09-24 18:56:20'),
(246, 'trona', 'Fire Tablet', 20, '2023-12-22 06:29:52', '2023-12-22 06:29:52'),
(247, 'iPad12,2', 'iPad', 39, '2023-12-22 06:40:34', '2023-12-22 06:40:34'),
(248, 'iPhone13,2', 'iPhone', 39, '2023-12-22 06:44:37', '2023-12-22 06:44:37'),
(249, 'trona', 'Fire Tablet', 39, '2023-12-22 07:07:22', '2023-12-22 07:07:22'),
(251, 'iPhone13,2', 'iPhone', 20, '2024-04-28 14:36:55', '2024-04-28 14:36:55'),
(252, 'iPhone13,2', 'iPhone', 20, '2024-05-06 06:20:20', '2024-05-06 06:20:20'),
(253, 'tb8168p1_64_bsp', '100071485', 39, '2024-05-08 03:57:23', '2024-05-08 03:57:23'),
(254, 'goldfish_arm64', 'sdk_gphone64_arm64', 4, '2024-05-08 18:21:06', '2024-05-08 18:21:06'),
(255, 'iPhone10,2', 'iPhone', 4, '2024-05-08 18:28:32', '2024-05-08 18:28:32'),
(256, 'iPhone16,2', 'iPhone', 39, '2024-05-09 03:43:29', '2024-05-09 03:43:29'),
(257, 'iPhone16,2', 'iPhone', 20, '2024-08-12 23:26:09', '2024-08-12 23:26:09'),
(258, 'iPad12,2', 'iPad', 39, '2024-09-06 11:25:42', '2024-09-06 11:25:42'),
(259, 'pineapple', 'Kent', 39, '2024-11-08 01:23:26', '2024-11-08 01:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `email_types`
--

CREATE TABLE `email_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_types`
--

INSERT INTO `email_types` (`id`, `Name`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'gmail', 1, '1', '6', 'false', '2022-12-05 18:22:20', '2022-12-13 19:49:59', NULL),
(2, 'outlook', 1, '1', NULL, 'false', '2022-12-05 18:22:27', '2022-12-13 19:50:00', NULL),
(3, 'Yahoo', 1, '6', '6', 'false', '2022-12-06 15:11:55', '2022-12-13 19:50:01', NULL),
(4, 'Gmail', 1, '6', '12', 'false', '2022-12-06 15:32:19', '2023-02-15 15:29:35', NULL),
(5, 'hotmail', 1, '6', NULL, 'false', '2022-12-06 15:33:02', '2022-12-13 19:50:06', NULL),
(6, 'Gmail', 1, '6', '6', 'false', '2022-12-07 12:45:38', '2022-12-13 19:50:07', NULL),
(7, 'outlook', 1, '6', NULL, 'false', '2022-12-07 12:45:43', '2022-12-07 12:45:43', NULL),
(8, 'ProtonMail', 1, '6', '6', 'false', '2022-12-07 12:46:30', '2022-12-07 12:47:24', NULL),
(9, 'iCloud Mail', 1, '6', '6', 'false', '2022-12-07 12:46:42', '2022-12-07 12:47:31', NULL),
(10, 'Zoho Mail', 1, '6', NULL, 'false', '2022-12-07 12:46:49', '2022-12-07 12:46:49', NULL),
(11, 'GMX', 1, '6', '6', 'false', '2022-12-07 12:46:58', '2022-12-13 19:50:08', NULL),
(12, 'GMX', 1, '6', NULL, 'false', '2022-12-07 12:48:30', '2022-12-13 19:50:09', NULL),
(13, 'Yahoo', 1, '6', NULL, 'false', '2022-12-13 18:42:12', '2022-12-13 18:42:12', NULL),
(14, 'Outlook', 1, '12', NULL, 'false', '2023-02-15 15:29:49', '2023-02-15 15:29:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `S8S_ID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `FacilityContactID` int(10) UNSIGNED DEFAULT NULL,
  `FacilityName` varchar(150) DEFAULT NULL,
  `FacilityAddress` varchar(150) DEFAULT NULL,
  `EventTypeID` int(10) UNSIGNED DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `S8S_ID`, `OrganizationID`, `Name`, `StartDate`, `StartTime`, `EndDate`, `EndTime`, `FacilityContactID`, `FacilityName`, `FacilityAddress`, `EventTypeID`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 7, 'Javlin', '2022-11-29', '18:58:00', '2022-12-14', '18:59:00', 1, 'Running', 'jauhar', 5, 1, 1, '6', '15', 'true', '2022-12-05 18:57:08', '2022-12-16 17:32:14', NULL),
(2, 6, 5, 'Javlin Test Name', '2022-11-04', '18:58:00', '2022-06-08', '18:00:00', 3, 'Javlin', 'jauhar', 6, 1, 1, '6', '15', 'true', '2022-12-05 18:59:20', '2022-12-16 17:32:18', NULL),
(3, 6, 6, 'Jumping', '1988-01-05', '19:03:00', '1887-01-05', '19:03:00', 4, 'jumping', 'https://res.cloudinary.com/akbarchanna/video/upload/v1670251696/Spectrum-8/Spectrum%20Video%20Bugs/bulk_delete_ayum7e.webm', 5, 1, 1, '6', '15', 'true', '2022-12-05 19:04:38', '2022-12-07 15:19:38', NULL),
(4, 7, 1, 'Ali Akbar', '2022-12-05', '19:00:00', '2022-12-05', '19:00:00', 1, 'Javlin', 'jauhar', 1, 1, 1, '7', '6', 'true', '2022-12-05 20:00:38', '2022-12-16 17:32:23', NULL),
(5, 6, 5, 'Grade Test', '2022-12-06', '15:59:00', '2022-12-07', '15:59:00', 1, 'Javlin', 'jauhar', 2, 1, 1, '6', NULL, 'true', '2022-12-06 15:59:34', '2022-12-16 17:32:27', NULL),
(6, 7, 6, 'Grade Test', '2022-12-13', '16:23:00', '2022-12-21', '16:19:00', 2, 'Javlin', 'jauhar', 1, 1, 1, '7', '7', 'false', '2022-12-06 16:20:02', '2022-12-16 16:34:25', '2022-12-16 16:34:25'),
(7, 15, 16, 'Running', '2023-01-17', '14:56:00', '2023-01-31', '14:56:00', 8, 'Fernandez', 'jauhar', 7, 1, 1, '15', '1', 'false', '2022-12-07 14:57:00', '2023-03-02 16:02:01', NULL),
(8, 15, 7, 'Running Tech', '2022-12-15', '14:59:00', '2022-12-02', '14:01:00', 2, 'Bears', 'jauhar', 4, 1, 1, '15', NULL, 'false', '2022-12-07 14:57:40', '2022-12-16 16:34:33', '2022-12-16 16:34:33'),
(9, 6, 4, 'FastLine', '2022-12-08', '14:34:00', '2022-12-08', '02:35:00', 3, 'jumping', 'jauhar', 5, 1, 1, '6', NULL, 'false', '2022-12-08 14:35:03', '2022-12-16 16:34:30', '2022-12-16 16:34:30'),
(10, 6, 8, 'Vision Plays', '2022-12-08', '18:48:00', '2022-12-09', '18:48:00', 3, 'Emerging Riders', 'jauhar', 6, 1, 1, '6', '6', 'false', '2022-12-08 18:50:08', '2022-12-16 16:34:37', '2022-12-16 16:34:37'),
(11, 6, 16, 'Family Feud Color Clash', '2022-12-16', '19:12:00', '2022-12-17', '17:15:00', 6, 'Amiyah Rice', 'Karachi', 1, 1, 1, '6', '1', 'false', '2022-12-16 17:15:13', '2023-03-02 16:01:43', NULL),
(12, 6, 24, 'Tampa Bay Color Slay', '2023-11-30', '08:00:00', '2023-12-01', '17:00:00', 6, 'Faith Weldon', '32 Street Noval', 4, 1, 1, '6', '19', 'false', '2022-12-16 17:16:43', '2023-09-08 23:15:24', NULL),
(13, 6, 20, 'Aquatics', '2022-12-16', '17:20:00', '2022-12-17', '17:16:00', 8, 'Johnson', '45 North Central Garden', 7, 1, 1, '6', '6', 'false', '2022-12-16 17:17:56', '2023-01-27 18:21:12', NULL),
(14, 6, 11, 'Athletics', '2022-12-16', '17:20:00', '2022-12-31', '23:18:00', 9, 'Owens', '45 West Street', 4, 1, 1, '6', '15', 'false', '2022-12-16 17:19:07', '2023-01-17 16:55:27', NULL),
(15, 6, 12, 'Artistic', '2022-12-16', '23:23:00', '2022-12-17', '21:19:00', 10, 'Gridby', 'Eiffel Tower North West Garden', 6, 1, 1, '6', NULL, 'false', '2022-12-16 17:20:21', '2022-12-16 17:20:21', NULL),
(16, 6, 20, 'Family Feud Color Clash', '2022-12-16', '18:51:00', '2022-12-23', '18:48:00', 8, 'Bella\'Zion Johnson', '45 North Central Garden', 7, 1, 1, '6', '6', 'false', '2022-12-16 18:49:34', '2023-01-27 18:21:26', NULL),
(17, 6, 4, 'Eds Test Event', '2022-12-16', '18:50:00', '2022-12-16', '19:50:00', 9, 'Melodi Owens', 'Eiffel Tower North West Garden', 3, 1, 1, '6', NULL, 'false', '2022-12-16 18:50:48', '2022-12-16 18:50:48', NULL),
(18, 6, 9, 'Grade Test', '2022-12-19', '17:25:00', '2022-12-07', '17:13:00', 7, 'Running', '32 Street Noval', 4, 1, 1, '6', NULL, 'false', '2022-12-19 17:45:30', '2022-12-19 17:45:30', NULL),
(19, 1, 14, 'Karen Bairds', '2016-01-03', '14:12:00', '2013-04-08', '14:11:00', 7, 'Nathaniel Bright', 'Duis placeat eius n', 3, 1, 1, '1', '12', 'false', '2023-01-02 18:50:45', '2023-01-14 19:47:22', NULL),
(20, 1, 13, 'Whoopi Richard', '1993-02-19', '20:31:00', '2014-10-23', '20:30:00', 9, 'Summer Foster', 'Eum esse et non aspe', 3, 1, 1, '1', NULL, 'false', '2023-01-02 19:37:54', '2023-01-02 19:37:54', NULL),
(21, 1, 10, 'Donovan Adkins', '2021-06-19', '18:43:00', '2018-02-08', '18:42:00', 6, 'Macaulay Holman', 'Dolor suscipit digni', 3, 1, 1, '1', NULL, 'false', '2023-01-02 19:40:05', '2023-01-02 19:40:05', NULL),
(22, 1, 8, 'Cody Doyle', '2009-09-17', '16:13:00', '1994-05-28', '16:12:00', 7, 'Travis Becker', 'Et numquam rem in om', 4, 1, 1, '1', NULL, 'false', '2023-01-02 19:45:11', '2023-01-02 19:45:11', NULL),
(23, 1, 13, 'Malik Cochran', '1992-06-23', '21:06:00', '1973-03-01', '21:05:00', 9, 'Uta Bartlett', 'Fugit et dolore ali', 3, 1, 1, '1', NULL, 'false', '2023-01-02 19:47:48', '2023-01-02 19:47:48', NULL),
(24, 1, 14, 'Lillian Gonzalez', '2003-10-20', '11:22:00', '1978-01-30', '11:21:00', 11, 'Patience Baker', 'Culpa voluptatem Se', 6, 1, 1, '1', NULL, 'false', '2023-01-02 20:22:12', '2023-02-15 15:24:55', '2023-02-15 15:24:55'),
(25, 1, 14, 'Gay Prince', '1991-06-13', '18:43:00', '2003-02-22', '18:41:00', 9, 'Pamela Macdonald', 'Quisquam irure qui b', 4, 1, 1, '1', NULL, 'false', '2023-01-02 20:25:55', '2023-01-02 20:25:55', NULL),
(26, 1, 20, 'James Ramos', '2020-05-23', '07:48:00', '2003-05-28', '07:47:00', 8, 'Candice Juarez', 'Commodi quis qui vol', 7, 1, 1, '1', '6', 'false', '2023-01-02 21:10:14', '2023-01-27 18:17:15', NULL),
(27, 6, 8, 'Family Feud Color Clash', '2023-01-25', '18:59:00', '2023-01-19', '18:59:00', 9, 'Melody Owens', '45 North Central Garden', 5, 1, 1, '6', NULL, 'false', '2023-01-03 18:57:02', '2023-01-03 18:57:02', NULL),
(28, 6, 10, 'August 20, 2022 Even', '2023-01-14', '18:59:00', '2023-02-09', '18:57:00', 8, 'Morata', '32 Street Noval', 6, 1, 1, '6', NULL, 'false', '2023-01-03 18:58:04', '2023-01-03 18:58:04', NULL),
(29, 6, 10, 'Eds Test Even', '2023-05-13', '08:30:00', '2023-05-13', '18:00:00', 8, 'Lionel Messi', '32 Street Noval', 4, 1, 1, '6', '19', 'false', '2023-01-03 18:59:38', '2023-04-28 18:58:55', NULL),
(30, 6, 20, 'Allister', '2023-01-18', '20:31:00', '2023-01-26', '20:32:00', 10, 'Bear Gills', 'jauhar', 7, 1, 1, '6', '6', 'false', '2023-01-09 20:28:52', '2023-01-27 18:16:49', NULL),
(31, 6, 20, '24 Meter Sprint', '2023-01-27', '12:21:00', '2023-01-27', '18:21:00', 7, 'Neon Sports', '45 North Central Garden', 7, 1, 1, '6', '6', 'false', '2023-01-27 18:16:04', '2023-01-27 18:16:27', NULL),
(32, 1, 16, 'test evetn', '2022-02-22', '12:12:00', '2022-03-22', '23:22:00', 6, 'Vladim', 'Soluta', 1, 1, 1, '1', '1', 'false', '2023-01-30 15:00:24', '2023-03-02 16:01:27', NULL),
(33, 7, 21, 'Cricket', '2023-02-09', '18:37:00', '2023-02-09', '13:43:00', 10, 'Youth Foundation', '32 Street Noval', 7, 1, 1, '7', NULL, 'false', '2023-02-09 13:40:36', '2023-02-09 13:40:36', NULL),
(34, 1, 15, 'Cricket games', '2023-03-08', '22:02:00', '2023-03-23', '22:02:00', 9, 'Owens', 'London', 7, 1, 1, '1', NULL, 'false', '2023-03-02 15:56:27', '2023-03-02 15:56:27', NULL),
(35, 1, 16, 'Light Games', '2023-03-23', '13:02:00', '2023-03-25', '10:10:00', 10, 'Brown Facility', 'New York', 4, 1, 1, '1', '1', 'false', '2023-03-02 16:00:00', '2023-03-02 16:01:04', NULL),
(36, 1, 22, '111 Test Event', '2023-03-21', '20:51:00', '2023-03-24', '20:51:00', 10, '111 Facility', '3620 South Renellie Drive', 2, 1, 1, '1', NULL, 'false', '2023-03-22 04:52:14', '2023-03-22 04:52:14', NULL),
(37, 1, 23, 'License Testing', '2023-03-29', '09:46:00', '2023-03-31', '01:41:00', 9, 'new org', '32 Street Noval', 1, 1, 1, '1', NULL, 'false', '2023-03-29 08:41:32', '2023-03-29 08:41:32', NULL),
(38, 19, 12, 'Edmund  Bernosky', '2023-12-23', '08:00:00', '2023-12-24', '18:00:00', 6, 'Facility', '123 main st', 4, 1, 1, '19', NULL, 'false', '2023-12-20 00:49:05', '2023-12-20 00:49:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_assessments`
--

CREATE TABLE `event_assessments` (
  `id` int(10) UNSIGNED NOT NULL,
  `EventID` int(10) UNSIGNED DEFAULT NULL,
  `AssessmentID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_assessments`
--

INSERT INTO `event_assessments` (`id`, `EventID`, `AssessmentID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 6, 1, '6', '7', 'true', '2022-12-05 19:28:46', '2022-12-16 17:21:23', NULL),
(2, 1, 2, 1, '6', NULL, 'true', '2022-12-05 19:28:50', '2022-12-16 17:32:46', NULL),
(3, 3, 7, 1, '6', '6', 'true', '2022-12-05 19:28:55', '2022-12-16 17:32:48', NULL),
(4, 2, 5, 1, '6', NULL, 'true', '2022-12-05 19:29:06', '2022-12-16 17:32:50', NULL),
(5, 2, 3, 1, '7', NULL, 'true', '2022-12-05 20:04:57', '2022-12-16 17:32:51', NULL),
(6, 4, 8, 1, '7', NULL, 'true', '2022-12-05 20:05:01', '2022-12-16 17:32:53', NULL),
(7, 4, 4, 1, '6', NULL, 'true', '2022-12-06 16:00:06', '2022-12-16 17:32:54', NULL),
(8, 5, 8, 1, '6', NULL, 'true', '2022-12-06 16:00:10', '2022-12-16 17:32:55', NULL),
(9, 3, 3, 1, '7', NULL, 'true', '2022-12-06 16:20:50', '2022-12-16 17:32:44', NULL),
(10, 6, 7, 1, '7', NULL, 'false', '2022-12-06 16:20:55', '2022-12-16 17:21:27', '2022-12-16 17:21:27'),
(11, 10, 1, 1, '6', NULL, 'false', '2022-12-08 18:51:09', '2022-12-16 17:21:27', '2022-12-16 17:21:27'),
(12, 8, 4, 1, '6', NULL, 'false', '2022-12-08 18:51:16', '2022-12-16 17:21:27', '2022-12-16 17:21:27'),
(13, 9, 7, 1, '6', NULL, 'false', '2022-12-08 18:51:22', '2022-12-16 17:21:32', '2022-12-16 17:21:32'),
(14, 10, 6, 1, '6', NULL, 'false', '2022-12-08 18:51:27', '2022-12-16 17:21:32', '2022-12-16 17:21:32'),
(15, 11, 6, 1, '6', NULL, 'false', '2022-12-16 17:34:09', '2022-12-16 17:34:09', NULL),
(16, 12, 1, 1, '6', NULL, 'false', '2022-12-16 17:34:21', '2022-12-16 17:34:21', NULL),
(17, 13, 3, 1, '6', NULL, 'false', '2022-12-16 17:34:30', '2022-12-16 17:34:30', NULL),
(18, 14, 2, 1, '6', '6', 'false', '2022-12-16 17:34:41', '2022-12-16 17:35:00', NULL),
(19, 15, 4, 1, '6', NULL, 'false', '2022-12-16 17:34:48', '2022-12-16 17:34:48', NULL),
(20, 12, 2, 1, '12', NULL, 'false', '2022-12-21 20:33:14', '2022-12-21 20:33:14', NULL),
(21, 12, 3, 1, '12', '6', 'false', '2022-12-21 20:33:28', '2022-12-21 20:41:27', NULL),
(22, 12, 4, 1, '12', NULL, 'false', '2022-12-21 20:34:08', '2022-12-21 20:34:08', NULL),
(23, 12, 5, 1, '12', NULL, 'false', '2022-12-21 20:34:16', '2022-12-21 20:34:16', NULL),
(24, 12, 6, 1, '12', NULL, 'false', '2022-12-21 20:34:26', '2022-12-21 20:34:26', NULL),
(25, 12, 7, 1, '12', NULL, 'false', '2022-12-21 20:34:41', '2022-12-21 20:34:41', NULL),
(26, 12, 2, 1, '12', NULL, 'false', '2022-12-21 20:35:50', '2022-12-21 20:36:12', '2022-12-21 20:36:12'),
(27, 12, 8, 1, '12', '6', 'false', '2022-12-21 20:37:38', '2023-02-17 04:15:37', NULL),
(28, 13, 6, 1, '1', NULL, 'false', '2022-12-26 12:55:34', '2022-12-26 12:55:34', NULL),
(29, 23, 1, 1, '1', NULL, 'false', '2023-03-02 20:08:39', '2023-03-02 20:08:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_catagories`
--

CREATE TABLE `event_catagories` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Abbr` varchar(10) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_catagories`
--

INSERT INTO `event_catagories` (`id`, `Name`, `Abbr`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'School - Students', 'SCH', 1, '6', '6', 'false', '2022-12-05 18:53:59', '2022-12-15 01:34:53', NULL),
(2, 'Club - Members', 'CLUB', 1, '6', '6', 'false', '2022-12-05 18:54:11', '2022-12-15 01:35:27', NULL),
(3, 'Organization School - Students', 'OSS', 1, '6', '6', 'false', '2022-12-06 15:44:03', '2022-12-15 01:43:32', NULL),
(4, 'Public Event', 'PE', 1, '6', '6', 'false', '2022-12-07 13:01:47', '2022-12-15 01:47:49', NULL),
(5, 'Octagon Speed Endurance', 'OSE', 1, '6', NULL, 'true', '2022-12-07 13:04:03', '2022-12-15 01:48:28', NULL),
(6, 'Warp 8', 'WP8', 1, '6', NULL, 'true', '2022-12-07 13:04:15', '2022-12-15 01:48:31', NULL),
(7, 'IAAF World Championships', 'IWC', 1, '6', NULL, 'false', '2023-01-27 18:14:11', '2023-01-27 18:14:11', NULL),
(8, 'Cycling', 'CYG', 1, '12', NULL, 'false', '2023-02-15 15:49:27', '2023-02-15 15:49:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_facilitators`
--

CREATE TABLE `event_facilitators` (
  `id` int(10) UNSIGNED NOT NULL,
  `EventID` int(10) UNSIGNED DEFAULT NULL,
  `FacilitatorID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_facilitators`
--

INSERT INTO `event_facilitators` (`id`, `EventID`, `FacilitatorID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`) VALUES
(1, 11, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(2, 12, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(3, 13, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(4, 14, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(5, 15, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(6, 16, 31, 1, NULL, NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59'),
(7, 17, 32, 1, NULL, NULL, 'false', '2022-12-27 17:39:49', '2022-12-27 17:39:49'),
(8, 7, 3, 1, NULL, NULL, 'false', '2022-12-28 18:59:59', '2022-12-28 18:59:59'),
(9, 7, 33, 1, NULL, NULL, 'false', '2022-12-29 16:07:53', '2022-12-29 16:07:53'),
(10, 13, 34, 1, NULL, NULL, 'false', '2022-12-30 18:07:13', '2022-12-30 18:07:13'),
(11, 20, 35, 1, NULL, NULL, 'false', '2023-01-03 16:37:35', '2023-01-03 16:37:35'),
(12, 21, 35, 1, NULL, NULL, 'false', '2023-01-03 16:37:35', '2023-01-03 16:37:35'),
(13, 24, 35, 1, NULL, NULL, 'false', '2023-01-03 16:37:35', '2023-01-03 16:37:35'),
(15, 7, 37, 1, NULL, NULL, 'false', '2023-01-03 18:26:46', '2023-01-03 18:26:46'),
(16, 14, 38, 1, NULL, NULL, 'false', '2023-01-03 18:27:44', '2023-01-03 18:27:44'),
(19, 11, 40, 1, NULL, NULL, 'false', '2023-01-03 18:32:18', '2023-01-03 18:32:18'),
(20, 14, 40, 1, NULL, NULL, 'false', '2023-01-03 18:32:18', '2023-01-03 18:32:18'),
(21, 12, 41, 1, NULL, NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03'),
(22, 14, 41, 1, NULL, NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03'),
(23, 15, 41, 1, NULL, NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03'),
(24, 19, 41, 1, NULL, NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03'),
(25, 20, 41, 1, NULL, NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03'),
(26, 12, 42, 1, NULL, NULL, 'false', '2023-01-09 19:42:15', '2023-01-09 19:42:15'),
(27, 13, 42, 1, NULL, NULL, 'false', '2023-01-09 19:42:15', '2023-01-09 19:42:15'),
(36, 19, 44, 1, NULL, NULL, 'false', '2023-01-11 12:51:12', '2023-01-11 12:51:12'),
(37, 22, 44, 1, NULL, NULL, 'false', '2023-01-11 12:51:12', '2023-01-11 12:51:12'),
(38, 26, 44, 1, NULL, NULL, 'false', '2023-01-11 12:51:12', '2023-01-11 12:51:12'),
(50, 7, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(51, 14, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(52, 15, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(53, 17, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(54, 20, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(55, 23, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(56, 24, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(57, 26, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(58, 28, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(59, 29, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(60, 30, 45, 1, NULL, NULL, 'false', '2023-01-17 13:54:50', '2023-01-17 13:54:50'),
(83, 7, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(84, 11, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(85, 12, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(86, 13, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(87, 14, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(88, 15, 48, 1, NULL, NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38'),
(110, 7, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(111, 11, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(112, 12, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(113, 13, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(114, 14, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(115, 15, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(116, 16, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(117, 17, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(118, 18, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(119, 19, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(120, 20, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(121, 21, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(122, 22, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(123, 23, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(124, 24, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(125, 25, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(126, 26, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(127, 27, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(128, 28, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(129, 29, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(130, 30, 49, 1, NULL, NULL, 'false', '2023-01-24 19:53:31', '2023-01-24 19:53:31'),
(146, 31, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(147, 30, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(148, 26, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(149, 16, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(150, 13, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(151, 7, 50, 1, NULL, NULL, 'false', '2023-02-01 18:07:28', '2023-02-01 18:07:28'),
(153, 14, 47, 1, NULL, NULL, 'false', '2023-02-01 18:09:41', '2023-02-01 18:09:41'),
(154, 30, 29, 1, NULL, NULL, 'false', '2023-02-01 18:10:46', '2023-02-01 18:10:46'),
(155, 26, 29, 1, NULL, NULL, 'false', '2023-02-01 18:10:46', '2023-02-01 18:10:46'),
(156, 16, 29, 1, NULL, NULL, 'false', '2023-02-01 18:10:46', '2023-02-01 18:10:46'),
(157, 29, 51, 1, NULL, NULL, 'false', '2023-02-08 17:15:19', '2023-02-08 17:15:19'),
(158, 14, 51, 1, NULL, NULL, 'false', '2023-02-08 17:15:19', '2023-02-08 17:15:19'),
(159, 29, 43, 1, NULL, NULL, 'false', '2023-02-15 15:51:25', '2023-02-15 15:51:25'),
(160, 14, 43, 1, NULL, NULL, 'false', '2023-02-15 15:51:25', '2023-02-15 15:51:25'),
(161, 33, 52, 1, NULL, NULL, 'false', '2023-02-16 23:00:54', '2023-02-16 23:00:54'),
(162, 31, 53, 1, NULL, NULL, 'false', '2023-02-16 23:07:26', '2023-02-16 23:07:26'),
(163, 33, 54, 1, NULL, NULL, 'false', '2023-02-16 23:11:21', '2023-02-16 23:11:21'),
(179, 32, 55, 1, NULL, NULL, 'false', '2023-02-24 12:33:45', '2023-02-24 12:33:45'),
(180, 31, 56, 1, NULL, NULL, 'false', '2023-02-24 21:55:01', '2023-02-24 21:55:01'),
(181, 30, 56, 1, NULL, NULL, 'false', '2023-02-24 21:55:01', '2023-02-24 21:55:01'),
(182, 26, 56, 1, NULL, NULL, 'false', '2023-02-24 21:55:01', '2023-02-24 21:55:01'),
(183, 31, 57, 1, NULL, NULL, 'false', '2023-02-24 21:55:57', '2023-02-24 21:55:57'),
(184, 30, 57, 1, NULL, NULL, 'false', '2023-02-24 21:55:57', '2023-02-24 21:55:57'),
(185, 31, 58, 1, NULL, NULL, 'false', '2023-02-24 22:00:43', '2023-02-24 22:00:43'),
(186, 30, 58, 1, NULL, NULL, 'false', '2023-02-24 22:00:43', '2023-02-24 22:00:43'),
(191, 35, 59, 1, NULL, NULL, 'false', '2023-03-02 16:04:59', '2023-03-02 16:04:59'),
(192, 32, 59, 1, NULL, NULL, 'false', '2023-03-02 16:04:59', '2023-03-02 16:04:59'),
(193, 11, 59, 1, NULL, NULL, 'false', '2023-03-02 16:04:59', '2023-03-02 16:04:59'),
(194, 7, 59, 1, NULL, NULL, 'false', '2023-03-02 16:04:59', '2023-03-02 16:04:59'),
(199, 35, 61, 1, NULL, NULL, 'false', '2023-03-02 16:17:57', '2023-03-02 16:17:57'),
(200, 32, 61, 1, NULL, NULL, 'false', '2023-03-02 16:17:57', '2023-03-02 16:17:57'),
(201, 11, 61, 1, NULL, NULL, 'false', '2023-03-02 16:17:57', '2023-03-02 16:17:57'),
(202, 7, 61, 1, NULL, NULL, 'false', '2023-03-02 16:17:57', '2023-03-02 16:17:57'),
(203, 31, 62, 1, NULL, NULL, 'false', '2023-03-02 16:26:40', '2023-03-02 16:26:40'),
(204, 30, 62, 1, NULL, NULL, 'false', '2023-03-02 16:26:40', '2023-03-02 16:26:40'),
(205, 31, 63, 1, NULL, NULL, 'false', '2023-03-02 16:27:44', '2023-03-02 16:27:44'),
(206, 30, 63, 1, NULL, NULL, 'false', '2023-03-02 16:27:44', '2023-03-02 16:27:44'),
(207, 30, 64, 1, NULL, NULL, 'false', '2023-03-02 16:33:44', '2023-03-02 16:33:44'),
(208, 31, 65, 1, NULL, NULL, 'false', '2023-03-02 16:39:34', '2023-03-02 16:39:34'),
(209, 30, 65, 1, NULL, NULL, 'false', '2023-03-02 16:39:34', '2023-03-02 16:39:34'),
(210, 31, 66, 1, NULL, NULL, 'false', '2023-03-02 16:47:00', '2023-03-02 16:47:00'),
(211, 30, 66, 1, NULL, NULL, 'false', '2023-03-02 16:47:00', '2023-03-02 16:47:00'),
(212, 31, 67, 1, NULL, NULL, 'false', '2023-03-02 16:50:09', '2023-03-02 16:50:09'),
(213, 30, 67, 1, NULL, NULL, 'false', '2023-03-02 16:50:09', '2023-03-02 16:50:09'),
(214, 35, 68, 1, NULL, NULL, 'false', '2023-03-03 12:30:47', '2023-03-03 12:30:47'),
(215, 32, 68, 1, NULL, NULL, 'false', '2023-03-03 12:30:47', '2023-03-03 12:30:47'),
(216, 11, 68, 1, NULL, NULL, 'false', '2023-03-03 12:30:47', '2023-03-03 12:30:47'),
(217, 7, 68, 1, NULL, NULL, 'false', '2023-03-03 12:30:47', '2023-03-03 12:30:47'),
(218, 35, 69, 1, NULL, NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:46:42'),
(219, 32, 69, 1, NULL, NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:46:42'),
(220, 11, 69, 1, NULL, NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:46:42'),
(221, 7, 69, 1, NULL, NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:46:42'),
(222, 35, 70, 1, NULL, NULL, 'false', '2023-03-03 16:59:43', '2023-03-03 16:59:43'),
(223, 32, 70, 1, NULL, NULL, 'false', '2023-03-03 16:59:43', '2023-03-03 16:59:43'),
(224, 11, 70, 1, NULL, NULL, 'false', '2023-03-03 16:59:43', '2023-03-03 16:59:43'),
(225, 7, 70, 1, NULL, NULL, 'false', '2023-03-03 16:59:43', '2023-03-03 16:59:43'),
(226, 35, 71, 1, NULL, NULL, 'false', '2023-03-03 17:02:13', '2023-03-03 17:02:13'),
(227, 32, 71, 1, NULL, NULL, 'false', '2023-03-03 17:02:13', '2023-03-03 17:02:13'),
(228, 11, 71, 1, NULL, NULL, 'false', '2023-03-03 17:02:13', '2023-03-03 17:02:13'),
(229, 7, 71, 1, NULL, NULL, 'false', '2023-03-03 17:02:13', '2023-03-03 17:02:13'),
(230, 35, 72, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(231, 35, 73, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(232, 32, 72, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(233, 32, 73, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(234, 7, 72, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(235, 7, 73, 1, NULL, NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08'),
(236, 34, 74, 1, NULL, NULL, 'false', '2023-03-06 13:18:17', '2023-03-06 13:18:17'),
(237, 31, 75, 1, NULL, NULL, 'false', '2023-03-06 14:34:10', '2023-03-06 14:34:10'),
(238, 26, 75, 1, NULL, NULL, 'false', '2023-03-06 14:34:10', '2023-03-06 14:34:10'),
(239, 31, 76, 1, NULL, NULL, 'false', '2023-03-06 15:15:46', '2023-03-06 15:15:46'),
(240, 30, 76, 1, NULL, NULL, 'false', '2023-03-06 15:15:46', '2023-03-06 15:15:46'),
(241, 16, 76, 1, NULL, NULL, 'false', '2023-03-06 15:15:46', '2023-03-06 15:15:46'),
(242, 31, 77, 1, NULL, NULL, 'false', '2023-03-06 15:16:35', '2023-03-06 15:16:35'),
(243, 30, 77, 1, NULL, NULL, 'false', '2023-03-06 15:16:35', '2023-03-06 15:16:35'),
(244, 26, 77, 1, NULL, NULL, 'false', '2023-03-06 15:16:35', '2023-03-06 15:16:35'),
(245, 31, 78, 1, NULL, NULL, 'false', '2023-03-06 15:24:08', '2023-03-06 15:24:08'),
(248, 31, 80, 1, NULL, NULL, 'false', '2023-03-06 19:55:03', '2023-03-06 19:55:03'),
(249, 30, 80, 1, NULL, NULL, 'false', '2023-03-06 19:55:03', '2023-03-06 19:55:03'),
(250, 31, 81, 1, NULL, NULL, 'false', '2023-03-06 19:55:36', '2023-03-06 19:55:36'),
(251, 30, 81, 1, NULL, NULL, 'false', '2023-03-06 19:55:36', '2023-03-06 19:55:36'),
(259, 31, 87, 1, NULL, NULL, 'false', '2023-03-06 20:03:27', '2023-03-06 20:03:27'),
(260, 31, 88, 1, NULL, NULL, 'false', '2023-03-06 20:05:07', '2023-03-06 20:05:07'),
(261, 31, 89, 1, NULL, NULL, 'false', '2023-03-06 20:06:54', '2023-03-06 20:06:54'),
(262, 30, 89, 1, NULL, NULL, 'false', '2023-03-06 20:06:54', '2023-03-06 20:06:54'),
(263, 31, 90, 1, NULL, NULL, 'false', '2023-03-06 20:10:11', '2023-03-06 20:10:11'),
(264, 30, 90, 1, NULL, NULL, 'false', '2023-03-06 20:10:11', '2023-03-06 20:10:11'),
(267, 31, 92, 1, NULL, NULL, 'false', '2023-03-06 20:14:21', '2023-03-06 20:14:21'),
(268, 30, 92, 1, NULL, NULL, 'false', '2023-03-06 20:14:21', '2023-03-06 20:14:21'),
(269, 31, 93, 1, NULL, NULL, 'false', '2023-03-06 20:15:34', '2023-03-06 20:15:34'),
(270, 30, 93, 1, NULL, NULL, 'false', '2023-03-06 20:15:34', '2023-03-06 20:15:34'),
(271, 31, 94, 1, NULL, NULL, 'false', '2023-03-07 15:14:55', '2023-03-07 15:14:55'),
(272, 30, 94, 1, NULL, NULL, 'false', '2023-03-07 15:14:55', '2023-03-07 15:14:55'),
(273, 31, 95, 1, NULL, NULL, 'false', '2023-03-07 16:07:17', '2023-03-07 16:07:17'),
(274, 30, 95, 1, NULL, NULL, 'false', '2023-03-07 16:07:17', '2023-03-07 16:07:17'),
(275, 35, 96, 1, NULL, NULL, 'false', '2023-03-07 17:58:19', '2023-03-07 17:58:19'),
(276, 11, 96, 1, NULL, NULL, 'false', '2023-03-07 17:58:19', '2023-03-07 17:58:19'),
(277, 7, 96, 1, NULL, NULL, 'false', '2023-03-07 17:58:19', '2023-03-07 17:58:19'),
(290, 31, 97, 1, NULL, NULL, 'false', '2023-03-22 05:03:20', '2023-03-22 05:03:20'),
(291, 30, 97, 1, NULL, NULL, 'false', '2023-03-22 05:03:20', '2023-03-22 05:03:20'),
(292, 26, 97, 1, NULL, NULL, 'false', '2023-03-22 05:03:20', '2023-03-22 05:03:20'),
(294, 36, 60, 1, NULL, NULL, 'false', '2023-03-22 13:29:51', '2023-03-22 13:29:51'),
(302, 34, 98, 1, NULL, NULL, 'false', '2023-04-04 10:53:54', '2023-04-04 10:53:54'),
(318, 15, 110, 1, NULL, NULL, 'false', '2023-05-09 12:36:47', '2023-05-09 12:36:47'),
(331, 12, 121, 1, NULL, NULL, 'false', '2023-09-09 05:12:28', '2023-09-09 05:12:28'),
(334, 15, 122, 1, NULL, NULL, 'false', '2023-12-20 01:05:27', '2023-12-20 01:05:27'),
(335, 15, 20, 1, NULL, NULL, 'false', '2023-12-20 01:07:09', '2023-12-20 01:07:09'),
(336, 15, 39, 1, NULL, NULL, 'false', '2024-05-06 05:42:03', '2024-05-06 05:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `event_organizations`
--

CREATE TABLE `event_organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `EventID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_organizations`
--

INSERT INTO `event_organizations` (`id`, `EventID`, `OrganizationID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`) VALUES
(7, 19, 15, 1, NULL, NULL, 'false', '2023-01-11 12:50:31', '2023-01-11 12:50:31'),
(8, 20, 15, 1, NULL, NULL, 'false', '2023-01-11 12:50:31', '2023-01-11 12:50:31'),
(9, 26, 15, 1, NULL, NULL, 'false', '2023-01-11 12:50:31', '2023-01-11 12:50:31'),
(12, 7, 18, 1, NULL, NULL, 'false', '2023-01-20 17:50:57', '2023-01-20 17:50:57'),
(76, 30, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(77, 29, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(78, 28, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(79, 27, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(80, 26, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(81, 25, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(82, 24, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(83, 23, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(84, 22, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(85, 21, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(86, 20, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(87, 19, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(88, 18, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(89, 17, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(90, 16, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(91, 15, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(92, 14, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(93, 13, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(94, 12, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(95, 11, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(96, 7, 19, 1, NULL, NULL, 'false', '2023-02-01 17:45:04', '2023-02-01 17:45:04'),
(97, 11, 17, 1, NULL, NULL, 'false', '2023-02-01 17:45:43', '2023-02-01 17:45:43'),
(98, 7, 16, 1, NULL, NULL, 'false', '2023-02-01 18:04:11', '2023-02-01 18:04:11'),
(99, 31, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(100, 30, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(101, 29, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(102, 28, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(103, 27, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(104, 24, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(105, 23, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(106, 22, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(107, 20, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(108, 19, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(109, 18, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(110, 17, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(111, 16, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(112, 15, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(113, 14, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(114, 13, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(115, 12, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(116, 11, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(117, 7, 21, 1, NULL, NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14'),
(118, 30, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(119, 29, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(120, 28, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(121, 27, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(122, 26, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(123, 25, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(124, 23, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(125, 22, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(126, 21, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(127, 20, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(128, 19, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(129, 18, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(130, 17, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(131, 16, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(132, 15, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(133, 14, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(134, 13, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(135, 12, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(136, 11, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(137, 7, 20, 1, NULL, NULL, 'false', '2023-03-07 21:19:41', '2023-03-07 21:19:41'),
(139, 16, 22, 1, NULL, NULL, 'false', '2023-03-22 04:50:54', '2023-03-22 04:50:54'),
(140, 30, 23, 1, NULL, NULL, 'false', '2023-03-29 08:37:20', '2023-03-29 08:37:20'),
(143, 31, 24, 1, NULL, NULL, 'false', '2023-09-08 22:54:58', '2023-09-08 22:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `InPerson` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `Vitrual` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `EventCatagoryID` int(10) UNSIGNED DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `Name`, `InPerson`, `Vitrual`, `EventCatagoryID`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Class Assessment(s) Event', 1, 1, 1, 1, 1, '6', '6', 'false', '2022-12-05 18:54:41', '2022-12-15 01:39:37', NULL),
(2, 'School Event', 1, 1, 1, 1, 1, '6', '6', 'false', '2022-12-05 18:54:50', '2022-12-15 01:40:02', NULL),
(3, 'School Virtual Event', 1, 1, 1, 1, 1, '6', '6', 'false', '2022-12-06 15:45:08', '2022-12-15 01:40:29', NULL),
(4, 'Organization Event', 1, 1, 3, 1, 1, '6', '6', 'false', '2022-12-07 13:05:39', '2022-12-15 01:45:32', NULL),
(5, 'Inter - Organization - School', 1, 1, 3, 1, 1, '6', '6', 'false', '2022-12-07 13:05:52', '2022-12-15 01:46:16', NULL),
(6, 'Virtual Inter - Organization - School', 1, 1, 3, 1, 1, '6', '6', 'false', '2022-12-07 13:06:09', '2022-12-15 01:46:57', NULL),
(7, 'Extreme Sports', 1, 1, 7, 1, 1, '6', NULL, 'false', '2023-01-27 18:15:04', '2023-01-27 18:15:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilitators`
--

CREATE TABLE `facilitators` (
  `id` int(10) UNSIGNED NOT NULL,
  `S8S_ID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `OrgAdmin` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `ManageParticipants` tinyint(4) DEFAULT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `show_video` tinyint(1) NOT NULL DEFAULT 1,
  `EmailVerifiedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `number_of_devices_login` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilitators`
--

INSERT INTO `facilitators` (`id`, `S8S_ID`, `OrganizationID`, `OrgAdmin`, `IsActive`, `ManageParticipants`, `Firstname`, `Lastname`, `Email`, `Password`, `show_video`, `EmailVerifiedOn`, `remember_token`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`, `otp`, `number_of_devices_login`) VALUES
(1, 6, 5, NULL, 0, 0, 'Javlin throw', 'Throw', 'ali.akbar@oip.com.pkuuu', '$2y$10$2aYj02dW/YhvoWpnvIpMyOMaivuzFtZzjDSEssg86AAWFw8tUCQ.i', 1, '2022-12-05 13:50:36', NULL, 1, '6', '6', 'true', '2022-12-05 18:50:36', '2022-12-14 23:54:35', NULL, NULL, 2),
(2, 6, 2, NULL, 0, 0, 'Javlin', 'Throw', 'abc.def@mail.come', '$2y$10$vSFru4SahVApzzKvAsfXV.xMh/cy8NoHWNIi.7iQrs99jkVPc8lwe', 1, '2022-12-05 13:50:53', NULL, 1, '6', NULL, 'false', '2022-12-05 18:50:53', '2022-12-30 17:03:46', NULL, NULL, 2),
(3, 1, 2, NULL, 1, 1, 'muhammad', 'talha', 'talhanaser71@gmail.com', '$2y$10$Qg4axaYI9qTKUq4JbNWaoeJOQI20y7w9hxJZlcIK3emlwZ6XCqCEi', 1, '2022-12-05 16:34:25', NULL, 1, '6', '1', 'false', '2022-12-05 21:34:25', '2022-12-28 18:59:59', NULL, NULL, 2),
(4, 1, 4, NULL, 1, 0, 'muhammad', 'talha', 'talhakhan105@yahoo.com', '$2y$10$7neUFoHWL691p.1xQQX74.8uq.P3p7QaVTlZTzlhpRMwYe96Zj53G', 1, '2022-12-05 16:36:32', 'rYs5NFRMUb6i1ye5fBYWHtKRC1yv6k7fZ8wmt3eoxoBsi9ri0jgjKFoNQ6Jl', 1, '6', '1', 'false', '2022-12-05 21:36:32', '2023-03-20 22:45:38', NULL, NULL, 8),
(5, 6, 5, NULL, 1, 1, 'Test', 'One', 'ali.akbar@oip.com.org', '$2y$10$npGzxcgA.mNVW96bl5fHzuXXdWNq6P0bFpUqUTbzjpWwBdK6Lhbqq', 1, '2022-12-06 10:51:39', NULL, 1, '6', NULL, 'true', '2022-12-06 15:51:39', '2022-12-08 14:06:42', NULL, NULL, 2),
(6, 8, 7, NULL, 1, 0, 'Test', 'Three', 'applicationmanager@gmail.com', '$2y$10$Cf4y/A8FZ1v72v8mVx8vL.EkLsgwNQxbRVYYY8s/TihBYaxahy2pG', 1, '2022-12-06 11:26:50', NULL, 1, '8', NULL, 'true', '2022-12-06 16:26:50', '2022-12-16 16:17:19', NULL, NULL, 2),
(7, 8, 6, NULL, 1, 1, 'https://webprojectmockup.com/custom/-8-v2/', 'https://webprojectmockup.com/custom/-8-v2/', 'https//webprojectmockup.com/custom/spectrum-8-v2/grade@gmail.com', '$2y$10$g29jU06scRw0/n0Mc/Sb/O5vwt30/u/0AAxno72ayLpYjXeypv9lu', 1, '2022-12-06 13:55:22', NULL, 1, '8', NULL, 'false', '2022-12-06 18:55:22', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(8, 8, 5, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@maila', '$2y$10$hsgdo1tsl9R78w8lyB/TNeNUka/tN2MXYMsl8IE.hev/rHt.TId4O', 1, '2022-12-06 13:56:43', NULL, 1, '8', NULL, 'false', '2022-12-06 18:56:43', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(9, 8, 5, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@maila', '$2y$10$CoNJJAeGDMQUPYPIZjVcbOENxvkuVyKk9n5.TILE8I3uzoFCXHa7a', 1, '2022-12-06 13:56:43', NULL, 1, '8', NULL, 'false', '2022-12-06 18:56:43', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(10, 10, 11, NULL, 1, 1, 'Amiyah', 'Banaspati', 'abc.def@maila', '$2y$10$oG0K0MV8dqgMqMmrPOv.ROIWzqfN1CmUDJZjceNyx6NtnMiE6pFYi', 1, '2022-12-06 13:56:43', NULL, 1, '8', '10', 'false', '2022-12-06 18:56:43', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(11, 8, 5, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@mailaa', '$2y$10$5VWyZV.ko8KSp3V8XDtmpuBaWfJ4hWRql3pOZpO0olTVcRCqWnqbu', 1, '2022-12-06 13:56:53', NULL, 1, '8', NULL, 'false', '2022-12-06 18:56:53', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(12, 9, 4, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@mailaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '$2y$10$V5oxTJiCZRs4HISdbQtd2eB/VzmrQms5kYedpQKNF0vHJwFdcysSy', 1, '2022-12-06 13:56:53', NULL, 1, '8', '9', 'false', '2022-12-06 18:56:53', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(13, 8, 5, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@mailaa', '$2y$10$LuLNII1QhomSr7R6kR26MeU3IKQnuYj5RNv4mMVmgswtH3T.qF1NS', 1, '2022-12-06 13:56:54', NULL, 1, '8', NULL, 'false', '2022-12-06 18:56:54', '2023-01-27 17:20:40', '2023-01-27 17:20:40', NULL, 2),
(14, 8, 5, NULL, 1, 1, 'Lorem ipsum dolor sit amet, consectetur', 'Lorem ipsum dolor sit amet, consectetur', 'abc.def@mailaa', '$2y$10$RfhpJAmIV7Pp.qsozQfbFe//NIVLkeuT1tfYOFKK6CaN88eoyqkgy', 1, '2022-12-06 13:56:54', NULL, 1, '8', NULL, 'true', '2022-12-06 18:56:54', '2022-12-16 16:17:31', NULL, NULL, 2),
(15, 9, 5, NULL, 1, 1, 'Muhammad', 'Hannan', 'muhammad.hannan@oip.com.pk', '$2y$10$mWEHvgULrj4c/skm1V2RROZYyJypIHlymFasfoXg2vSp4L.NsHjWi', 1, '2022-12-07 07:20:17', 'iXQ4FK6jQYa7s97m4A0HON3aUfp884Ih64lCJiwh9MBTBxIvyzmLdqdOZ952', 1, '8', '9', 'true', '2022-12-07 12:20:17', '2023-04-10 15:24:17', NULL, NULL, 2),
(16, 6, 4, NULL, 1, 0, 'Robert', 'Khan', 'shehneelkhan92@gmail.com', '$2y$10$YIuB9eN9lKFh5ZZuXoWrOOlOwQ9qGV3ow6FztxmyKy08cCmCNYU6O', 1, '2022-12-08 08:00:13', NULL, 1, '6', '6', 'true', '2022-12-08 13:00:13', '2022-12-16 16:17:28', NULL, NULL, 2),
(17, 6, 4, NULL, 1, 1, 'Danny', 'Morrison', 'ali.akbar@oip.com.pkddd', '$2y$10$ncMYrAynK18BZzRp/q/z.O/xcjp4YBS8oozF0YhmfNSaM1jvppjHW', 1, '2022-12-08 08:49:00', NULL, 1, '6', '6', 'true', '2022-12-08 13:49:00', '2022-12-16 16:17:25', NULL, NULL, 2),
(18, 6, 8, NULL, 1, 1, 'John', 'Wick', 'ali.akbar@oip.com.pk', '$2y$10$5qlyYzRFlzKOS7VvBCh88efOinUT4LHf3y6NeN0GbjHEM0fsOGMya', 1, '2022-12-08 10:05:45', 'HalubH2q6vyl2JyIRFwo4plGwPmxdiDBQCL2cFc6IZ8IuexVKT6HRNK0WqBy', 1, '6', NULL, 'false', '2022-12-08 15:05:45', '2023-03-03 16:20:10', NULL, NULL, 2),
(19, 6, 8, NULL, 0, 0, 'John', 'victor', 'akbarchanna94@gmail.com', '$2y$10$6cgetAEvPXcUqKufvo.hW.DQjAx7Qky6cbloithamI2B5aK/ZyfPu', 1, '2022-12-08 10:06:43', NULL, 1, '6', NULL, 'false', '2022-12-08 15:06:43', '2023-05-11 22:28:16', NULL, '5090', 2),
(20, 19, 12, NULL, 1, NULL, 'Edmund', 'Bernosky', 'ed.bernosky@spectrum8sports.com', '$2y$10$.bDqwwDyexrAtt6ykQ7paOx0/49wUlpK7cvoC4pxVBClosNZ/JjEK', 1, '2022-12-14 18:57:30', '87dK6RQIPFujLIMpRLn2dpFTPyr2eRTgt7MH5VLLC6Ct6VuJ29x6icqMbqFP', 1, '6', '19', 'false', '2022-12-14 23:57:30', '2024-04-28 14:35:51', NULL, '5347', 2),
(21, 6, 9, NULL, 1, 1, 'Brendan', 'Junes', 'mrjordan.business@gmail.com', '$2y$10$S9hbhHVlaTQ0F22MO5GpKuFsoj1VP52xJWMaLhv5atwK5XO/4OPD2', 1, '2022-12-16 11:26:38', NULL, 1, '6', '6', 'false', '2022-12-16 16:26:38', '2022-12-16 18:37:12', NULL, NULL, 2),
(22, 6, 10, NULL, 1, 1, 'Kaleign', 'Kreft', 'kylejordan90@gmail.com', '$2y$10$tr2W7NNpgowuPosLgQmID.TqP9SPmuiDYCWQ7FdrJwpaSSBgoihSe', 1, '2022-12-16 11:27:20', NULL, 1, '6', '6', 'false', '2022-12-16 16:27:20', '2022-12-16 18:32:16', NULL, NULL, 2),
(23, 6, 11, NULL, 1, 1, 'Harmony', 'Getter', 'kyle.tribeunltd@gmail.com', '$2y$10$XF64o7DtOPoy8t485ktVeOq2BNvh4HiH2LYPVVuwt7acL/E/Si6Xa', 1, '2022-12-16 11:27:55', NULL, 1, '6', '6', 'false', '2022-12-16 16:27:55', '2022-12-16 18:40:11', NULL, NULL, 2),
(24, 6, 12, NULL, 1, 1, 'Robert', 'Salinas', 'contact@tribeunltd.com', '$2y$10$Qz8mD.KNYiwC0dCThQ81cebE/Oxl3Z0qbTF5eH14wTEwUuk67uwEi', 1, '2022-12-16 11:28:37', NULL, 1, '6', '6', 'false', '2022-12-16 16:28:37', '2022-12-16 18:41:00', NULL, NULL, 2),
(25, 6, 8, NULL, 1, 1, 'Kaleign', 'Return', 'kyle@tribeunltd.com', '$2y$10$RKqrxk0UgLpmsKcCddaPu.N7GdOciaccQE5g4NHNVb0ciVKzdP3xq', 1, '2022-12-16 11:30:19', NULL, 1, '6', '6', 'false', '2022-12-16 16:30:19', '2022-12-16 18:41:15', NULL, NULL, 2),
(28, 6, 2, NULL, 1, 1, 'John', 'Wick', 'ali.akbar@oip.com.pksassas', '$2y$10$97mB4yed1dbVZAKc8ubplezzkcNgjRitGPVX37hL/3PMTK40jn7zG', 1, '2022-12-16 13:39:03', NULL, 1, '6', '6', 'false', '2022-12-16 18:39:03', '2022-12-16 18:39:42', NULL, NULL, 2),
(29, 8, 20, NULL, 1, 0, 'Peter', 'Mills', 'abc.def@mail.comesas', '$2y$10$I64B1I9ZCJ.hBQDQ0zs4W.Rqo3.T0H/9DU0Q0MS87AeyttRm5H/7m', 1, '2022-12-16 13:40:32', NULL, 1, '6', '8', 'false', '2022-12-16 18:40:32', '2023-02-01 18:10:46', NULL, NULL, 2),
(30, 8, 8, NULL, 1, 1, 'John', 'Cena', 'johncena@gmail.com', '$2y$10$9gd1vHHA4ZMS/nJ1LSA02OuUipHdzkTAqkUszgLx1OFCFHFdsHlJi', 1, '2022-12-19 15:01:22', NULL, 1, '8', NULL, 'false', '2022-12-19 20:01:22', '2022-12-19 20:01:22', NULL, NULL, 2),
(31, 6, 11, NULL, 1, 1, 'Janeman', 'Millan', 'venet93353@subdito.com', '$2y$10$NVtE7GU5NrkL0icEHgonw.8ZG5xErRTe.4FPd71YmUqozxRXyzH0a', 1, '2022-12-27 10:34:59', NULL, 1, '6', NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59', NULL, NULL, 2),
(32, 6, 10, NULL, 1, 1, 'Tim', 'David', 'cisemem970@octovie.com', '$2y$10$Ef/k6njWuewYVwCBzForDuHAZRo/CDhJ2iWkDRcDN6F7ZfuBvf3dS', 1, '2022-12-27 12:39:49', NULL, 1, '6', NULL, 'false', '2022-12-27 17:39:49', '2022-12-27 17:39:49', NULL, NULL, 2),
(33, 8, 2, NULL, 1, 0, 'john', 'doe', 'johndoe@gmail.test.com', '$2y$10$UrBtjcZK1SEuNz7idl4NC.4LZlkokNQtzwsrAPuQpab8yJGMZowxm', 1, '2022-12-29 11:07:53', 'EOqL4KPzAaxB0s6FiciBCYQ073bTZxdfjtyFz1bBrMs5WAGYIXU4uMQRTbn9', 1, '8', NULL, 'false', '2022-12-29 16:07:53', '2022-12-29 16:17:11', NULL, NULL, 2),
(34, 6, 12, NULL, 1, 1, 'Jim', 'Jones', 'sosix99459@letpays.com', '$2y$10$vcxeA/lgBoem6B4j.vegnuhqcJ0EI91bzpRN8zdO7H7FF2d95Frve', 1, '2022-12-30 13:07:13', 'SwVKrcfmYI8JNqi09K388zamXD5AVWFDoj9ReRZZkVmGEYmy8KgpEAvrpLmk', 1, '6', NULL, 'false', '2022-12-30 18:07:13', '2022-12-30 18:17:23', NULL, NULL, 2),
(35, 6, 9, NULL, 1, 1, 'Nick', 'Hellen', 'solibe4289@prolug.com', '$2y$10$79XtXKK/3Jm86eTB.mjkDuBfBKHyX5Jqlz5S10/C1S9mxNWExWbb6', 1, '2023-01-03 11:37:35', 'b5LrNd9IJByjmxTtU2d3TygJATp3Jm14IpPnJa0iducks7fNHr0AU8o5QdEr', 1, '6', NULL, 'false', '2023-01-03 16:37:35', '2023-01-04 15:17:13', NULL, NULL, 2),
(36, 1, 8, NULL, 1, 1, 'Leonard', 'Simmons', 'leonard.simmons@spectrum8sports.com', '$2y$10$8lX6s63FTo1zxVNaoRwvUeOuCzsH9h.fQiTFA5vSwGkuaz5FDt85y', 1, '2023-01-03 13:25:33', 'klz2r7b3Qj4UL6sSBluoLeEntnHyhTQZSRVpjJtGZssSAvglOnyBEW49wwxM', 1, '6', '1', 'false', '2023-01-03 18:25:33', '2023-04-14 06:13:33', NULL, NULL, 2),
(37, 6, 8, NULL, 1, 1, 'joecuellar', '.photo.video@gmail.com', 'joecuellar.photo.video@gmail.com', '$2y$10$nMUfcLmjfP.MzKI6fJWHQumEVdQwP0e3lI.PeygidbtFjXyCv9V7m', 1, '2023-01-03 13:26:46', NULL, 1, '6', NULL, 'false', '2023-01-03 18:26:46', '2023-01-03 18:26:46', NULL, NULL, 2),
(38, 6, 10, NULL, 1, 1, 'paul.hurley', '@spectrum8sports.com', 'paul.hurley@spectrum8sports.com', '$2y$10$UX0gpkUazYMY58vvjrfCNuV06KcFDuvafVEnbkhG5qM/pbE1/PwWC', 1, '2023-01-03 13:27:44', '6ZhF8zTpoX4GqSm6BpoLtdJNEz8MjaXtDjjNEsfJqhIWFo5hIjWBcyUw9t13', 1, '6', NULL, 'false', '2023-01-03 18:27:44', '2023-04-06 04:40:33', NULL, NULL, 2),
(39, 19, 12, NULL, 1, 1, 'Kent', 'Baker', 'Kent.Baker@spectrum8sports.com', '$2y$10$iYkIuNfV8aULQ9riEQwQnO6uxtgeg/ddkqHDQlYY4czPQNpoZmAR2', 1, '2023-01-03 13:31:19', 'SZjaoTPFdbxT1a4EohaSVQ9ewLVkHCduPEpCnjUl6EdlEQrC8crMsHHxHIXl', 1, '6', '19', 'false', '2023-01-03 18:31:19', '2024-09-06 11:04:43', NULL, '4335', 2),
(40, 6, 8, NULL, 1, 1, 'teacher', '@gmail.com', 'teacher@gmail.com', '$2y$10$P1BMwUVMpOJU.98eJrx7w.GzFoNJqrCcyQXH8XacFt3JH/CvSg0xC', 1, '2023-01-03 13:32:18', NULL, 1, '6', NULL, 'false', '2023-01-03 18:32:18', '2023-01-03 18:32:18', NULL, NULL, 2),
(41, 6, 10, NULL, 1, 1, 'Anderson', 'Pollard', 'paxiyil927@dewareff.com', '$2y$10$Hhoq7RR3z6HPPYyUHA4o2.nBm1.bM5OhrRwhIFh581ERDi54uXNby', 1, '2023-01-04 10:59:03', NULL, 1, '6', NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03', NULL, NULL, 2),
(42, 8, 10, NULL, 1, 1, 'Allen', 'Musk', 'ramaw89439@usharer.com', '$2y$10$yLkkNna.sb4VcurOeczh1eJS/G7hUKOddXptMjJaMOPyiuRW10/2W', 1, '2023-01-09 14:42:15', 'uuslYXR5bAdRpWQ3xi2gBBkp08XMQWnlaymq9Mtan78z8rWHJw4MjAEEdhb7', 1, '8', NULL, 'false', '2023-01-09 19:42:15', '2023-01-10 12:59:25', NULL, NULL, 2),
(43, 12, 11, NULL, 1, 1, 'Marcus', 'miller', 'hedehal972@v3dev.com', '$2y$10$1cTlRRPS.5Tg7kBnu4T5.OQwISmYunSptQ/nAmwk.0p.wr.oIgU8e', 1, '2023-01-10 08:56:00', 'ZOnFF3KQDkgsSY42x4W8FhKz8IsEBHAWHIXpiaTUw428ApgjNpYfG1GvW9wS', 1, '8', '12', 'false', '2023-01-10 13:56:00', '2023-02-15 15:51:25', NULL, NULL, 2),
(44, 6, 15, NULL, 1, 1, 'Trent', 'Bolt', 'rocakaf842@usharer.com', '$2y$10$yN./t14nFO.pz8Z/fqs30eGoBaOoStTaKOtpS18iAHsw2eDOD237a', 1, '2023-01-11 07:51:12', 'n1VWMm3PlB2a6XSQLd3lhN9kSfNf7iqy4rA4Gy75wh6dwQCM0otVd2UGICyk', 1, '6', NULL, 'false', '2023-01-11 12:51:12', '2023-03-07 18:53:29', NULL, NULL, 5),
(45, 8, 15, NULL, 1, 1, 'James', 'Anderson', 'niwedi6379@v3dev.com', '$2y$10$WI8dnAClIOACx62melgwte2VfM0O.TTX3KdNmFR0Gp4DL1MvPHqYq', 1, '2023-01-17 08:18:24', 'MEHVgNmpeh1djHuV0iZ3MTDJCLf5Pi4zK7uGUZXZdGNE2rP17txBweD5zNGq', 1, '6', '8', 'false', '2023-01-17 13:18:24', '2023-03-02 15:29:57', NULL, NULL, 5),
(46, 19, 8, NULL, 1, 1, 'Smith', 'Morgan', 'tefik14708@vingood.com', '$2y$10$GS9yI5mNcAUcwXfibWH4ZOD0zSpiiYi1Q.dvt4j6ezYM7RJwEBVJS', 1, '2023-01-17 10:23:37', 't5Ulm9u8UeRgYUPWviXpBFhLeeb2EjWt9ZCiAzBaeP5qqEwAJNRyTe0tFLK5', 1, '6', '19', 'false', '2023-01-17 15:23:37', '2023-05-24 19:21:39', NULL, NULL, 4),
(47, 8, 11, NULL, 1, 1, 'Alexandra', 'Alex', 'bejope2930@moneyzon.com', '$2y$10$y4ZsLRGlUNZ0vur4kIEvq.SeaL5UPXfg3WYxVKUjuhwZJKdW6CrCe', 1, '2023-01-20 10:22:49', NULL, 1, '8', '8', 'false', '2023-01-20 15:22:49', '2023-02-01 18:09:41', NULL, NULL, 2),
(48, 8, 10, NULL, 1, 1, 'Allen', 'Cameron', 'bavok99845@ukbob.com', '$2y$10$nDjyc8WfEHF6G7iGxlX8Geq2Ml3xzQ66I409cma2Eh1BxedSemgUa', 1, '2023-01-20 11:12:38', 'NsxT8H2jLVKoxAIdesNCFCtYt1et1KPOyGKYGGAlhzilAVY1whcfTpaibT8r', 1, '8', NULL, 'false', '2023-01-20 16:12:38', '2023-04-22 00:17:41', NULL, NULL, 600),
(49, 6, 16, NULL, 1, 1, 'Hendricks', 'miller', 'veneyi4348@moneyzon.com', '$2y$10$vRs2esvG6789T0guZwE1JeBsCo8WykyXR0I261vHpvMgzy7vbk.dG', 1, '2023-01-24 14:22:38', 'Jj17dIgbxhu0IojUcmEBM7YTURNDPDlJdmpstB0UisypdgPP7W7F9mqSXEdU', 1, '8', '6', 'false', '2023-01-24 19:22:38', '2023-03-07 13:27:49', NULL, NULL, 3),
(50, 8, 20, NULL, 1, 1, 'Luke.', 'Harper', 'garem83903@ekcsoft.com', '$2y$10$mjRl3mLjLtQNhzyG6mLgLub.4Dx4T3w4zm516zHTDj98cUKt3tD1y', 1, '2023-01-27 13:27:34', 'SjNkxqQEd2v3VNDMqN5RxA6DZzK0u3kfuOJ8VffYExMjaxJrAjVuciqgQxh2', 1, '8', '8', 'false', '2023-01-27 18:27:34', '2023-02-25 00:44:32', NULL, NULL, 1),
(51, 8, 11, NULL, 1, 1, 'Sam', 'Curran', 'xipan93410@brandoza.com', '$2y$10$w0IFU5m3PIzCjuSshyQaBeJUfLR2GS/hLDkS/2CRYCThOT5hrACwi', 1, '2023-02-08 12:15:19', 'AYDhPdQRA2VKIFvFfRR2mMxYOQ3JVPE9XQOtxQSvbD6lskhs5FXZMYVM9uxr', 1, '8', NULL, 'false', '2023-02-08 17:15:19', '2023-03-07 13:23:30', NULL, NULL, 2),
(52, 1, 21, NULL, 1, 0, 'Asad', 'Sid', 'asad.siddiq07@gmail.com', '$2y$10$V8Mr0OFMbpGdvpBBVmceJuZqJ2aK10bRaLRD5NW4x.FliDtwnDVyC', 1, '2023-02-16 18:00:54', '5KhocgoETVACUwHAGC5e6A8xgUzf6X2gRuc4h095Pxdmu0mnUDkaSuCKWtCD', 1, '1', NULL, 'false', '2023-02-16 23:00:54', '2023-02-24 22:30:36', NULL, NULL, 2),
(53, 1, 20, NULL, 1, 0, 'Hannah', 'Joe', 'hannanazam200@gmail.com', '$2y$10$uqPh9hoS936mMcPKVlf54.za4ez8BisXhvj3ucebyO8Q.ccJ9Twa2', 1, '2023-02-16 18:07:26', NULL, 1, '1', NULL, 'false', '2023-02-16 23:07:26', '2023-04-10 13:36:02', NULL, '2311', 2),
(54, 1, 21, NULL, 1, 1, 'asad', 'siddique', 'asadsiddiq07@gmail.com', '$2y$10$YxqIRw22pW9F/bg4OvHsTOSguwD11xxzZKQhFTeVNlC8TwDIcJEdK', 1, '2023-02-16 18:11:21', NULL, 1, '1', NULL, 'false', '2023-02-16 23:11:21', '2023-02-24 22:02:52', NULL, NULL, 2),
(55, 1, 16, NULL, 1, 0, 'viloba', 'vootin', 'viloba8640@vootin.com', '$2y$10$5xm10HEWtpIwyCvVCkm9g.Aum3nSPrMmfwDoeKwHY0/eni/2XWnj2', 1, '2023-02-24 07:33:45', NULL, 1, '1', NULL, 'false', '2023-02-24 12:33:45', '2023-02-24 12:33:45', NULL, NULL, 2),
(56, 1, 20, NULL, 1, 1, 'jonhn', 'doe', 'gokiwo5932@wiroute.com', '$2y$10$PBzmsaSwUWM17vhBPUk9Ae7LuGR/1PCWMmHTEk/PIwBr3DqXL4cSO', 1, '2023-02-24 16:55:01', NULL, 1, '1', NULL, 'false', '2023-02-24 21:55:01', '2023-02-24 21:55:01', NULL, NULL, 2),
(57, 1, 20, NULL, 1, 1, 'john', 'doe', 'muvole@ema-sofia.eu', '$2y$10$HO8YsW33W32uY1FH7glHm.7sG5Euy8qmMJjphs41e7CPKyAohI4xe', 1, '2023-02-24 16:55:57', NULL, 1, '1', NULL, 'false', '2023-02-24 21:55:57', '2023-02-24 21:55:57', NULL, NULL, 2),
(58, 1, 20, NULL, 1, 1, 'john', 'doe', 'qxfixltp@eurokool.com', '$2y$10$/m5rarkpFTAsqfhoOf7.ZeGrvBXWEVWVnuQEWzt/my5qz1nCDQneK', 1, '2023-02-24 17:00:43', NULL, 1, '1', NULL, 'false', '2023-02-24 22:00:43', '2023-02-24 22:00:43', NULL, NULL, 2),
(59, 1, 16, NULL, 1, 1, 'James', 'Anderson', 'wilihi5457@pubpng.com', '$2y$10$2KUQrJD3MKoib88l1vn.nOKCJj9JBi9RhkSL8bcaLzWIYOUALfhm.', 1, '2023-03-02 11:02:55', NULL, 1, '1', '1', 'false', '2023-03-02 16:02:55', '2023-03-02 16:04:44', NULL, NULL, 2),
(60, 1, 22, NULL, 1, 1, 'Tom1', 'Cademore', 'motol71208@wifame.com', '$2y$10$7SWke3lD1n/Q/cyKxEhHbuoQS1U4Kf33qsXvWs6DS/6YoNityw3nm', 1, '2023-03-02 11:07:43', NULL, 1, '1', '1', 'false', '2023-03-02 16:07:43', '2023-03-22 13:29:51', NULL, '7201', 2),
(61, 1, 16, NULL, 1, 1, 'Brad', 'Hogg', 'akbarchanna98@gmail.com', '$2y$10$XkQePMtuDwxSenTAg1X06uKcjTazlPmKXYBrS0zkanvK1vHbRpDye', 1, '2023-03-02 11:17:57', NULL, 1, '1', NULL, 'false', '2023-03-02 16:17:57', '2023-05-11 22:32:05', NULL, '4907', 2),
(62, 1, 20, NULL, 1, 0, 'nidowa', 'pubp', 'nidowa9438@pubpng.com', '$2y$10$az4UmPvjVxg4ZhWyd5kXdeCWFjQODiW8ym4g4cIjNHTQe4ytlv3py', 1, '2023-03-02 11:26:40', NULL, 1, '1', NULL, 'false', '2023-03-02 16:26:40', '2023-03-02 16:26:40', NULL, NULL, 2),
(63, 1, 20, NULL, 1, 0, 'dedee', 'daja', 'dededaja@lyft.live', '$2y$10$RljhImmj7VyjYgsPCL4N3uWShUeFcXSZz5B.GG6oTiNe5vFwu9Vf6', 1, '2023-03-02 11:27:44', NULL, 1, '1', NULL, 'false', '2023-03-02 16:27:44', '2023-03-02 16:27:44', NULL, NULL, 2),
(64, 1, 20, NULL, 1, 0, 'rabili', 'finews', 'rabili@finews.biz', '$2y$10$.9qlOzZsxznj3QXftynuTOqw5ML9ey0XN7FxOboO5RB.QokmjUpD.', 1, '2023-03-02 11:33:44', NULL, 1, '1', NULL, 'false', '2023-03-02 16:33:44', '2023-03-02 16:33:44', NULL, NULL, 2),
(65, 1, 20, NULL, 1, 0, 'yatiga', 'wifame', 'yatiga4698@wifame.com', '$2y$10$/KLIlhM3ww231uvV4fFmAOSJoJ35DqFNZHF.gJG3CIlRiC4QlJjgm', 1, '2023-03-02 11:39:34', NULL, 1, '1', NULL, 'false', '2023-03-02 16:39:34', '2023-03-02 16:39:34', NULL, NULL, 2),
(66, 1, 20, NULL, 1, 0, 'yacoger', 'pub', 'yacoger915@pubpng.com', '$2y$10$lqvLRbAEKw.m2IV2iytZu.A.1O/6Wj5Wk9dczOowR/NBuTQtVIF7O', 1, '2023-03-02 11:47:00', NULL, 1, '1', NULL, 'false', '2023-03-02 16:47:00', '2023-03-02 16:47:00', NULL, NULL, 2),
(67, 1, 20, NULL, 1, 0, 'fisepak', 'wifame', 'fisepak807@wifame.com', '$2y$10$2HonIfHhpxMymwCvAqwnI.Iq4V7Bg7OH8x92O1x9WAe3XqZlPMOp.', 1, '2023-03-02 11:50:09', NULL, 1, '1', NULL, 'false', '2023-03-02 16:50:09', '2023-03-02 16:50:09', NULL, NULL, 2),
(68, 1, 16, NULL, 1, 0, 'nick', 'Allen', 'selag89694@v2ssr.com', '$2y$10$RAHImffJHvwVegTViF7hC.GG0tQ3QG.lxptbqDoIPZG2B1ai2ulpW', 1, '2023-03-03 07:30:47', NULL, 1, '1', NULL, 'false', '2023-03-03 12:30:47', '2023-03-03 12:30:47', NULL, NULL, 2),
(69, 1, 16, NULL, 1, 1, 'Harry', 'Kane', 'bodonix212@vootin.com', '$2y$10$zf6/GNPYM9WgEU3t6gyHh.BSWUwDMIcT9faEwHyAbSryx3LaWlzk6', 1, '2023-03-03 11:46:42', 'qp58SRiebBydsivqzs4gKGy3AZUlXrPtbKs78Rk5qfEM3UBK9S2hhkGoIUvX', 1, '1', NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:51:27', NULL, NULL, 2),
(70, 1, 16, NULL, 1, 0, 'Danielle', 'Brennan', 'kirowov472@pubpng.com', '$2y$10$NLIpa5fcQDvR9NIUCNg7c.jLQMQnVneRJwTkOZ7h1tfcjNZ/LNs.y', 1, '2023-03-03 11:59:43', NULL, 1, '1', NULL, 'false', '2023-03-03 16:59:43', '2023-03-03 16:59:43', NULL, NULL, 2),
(71, 1, 16, NULL, 1, 0, 'Dane', 'Tyson', 'xaryzelo@brand-app.biz', '$2y$10$b4KT4k1AauCgLopymnypleWJYwOoxFiOOLD84QYA3jKJdh9/jSucq', 1, '2023-03-03 12:02:13', NULL, 1, '1', NULL, 'false', '2023-03-03 17:02:13', '2023-03-03 17:02:13', NULL, NULL, 2),
(72, 1, 16, NULL, 1, 0, 'mosabem', 'wifame', 'mosabem392@wifame.com', '$2y$10$k2gGzx3R2yYhdoJ/CHhb7u8dCbqHnYfJ.hXe3PL0N2i6k.wCtaJYW', 1, '2023-03-03 12:04:08', NULL, 1, '1', NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08', NULL, NULL, 2),
(73, 1, 16, NULL, 1, 0, 'mosabem', 'wifame', 'mosabem392@wifame.com', '$2y$10$fZQNJ89WaRbZtLDgwbbhm.OAku0N8A2bco8PS5Ech6Wqmr9CQ6iIC', 1, '2023-03-03 12:04:08', NULL, 1, '1', NULL, 'false', '2023-03-03 17:04:08', '2023-03-03 17:04:08', NULL, NULL, 2),
(74, 1, 15, NULL, 1, 0, 'fin', 'Allen', 'xegiy55963@wwgoc.com', '$2y$10$/orx8943W4dQ7FIUUpO2o.h9jt6eBu8xoZjyBKT4Cx2.1OkZqunJy', 1, '2023-03-06 08:18:17', 'JhuF6q9j7pgEYVVn6VgbJCqDIGO8r9MyDa1edlEbLgKYla3SrkZPTATY03P2', 1, '1', NULL, 'false', '2023-03-06 13:18:17', '2023-03-06 14:44:29', NULL, NULL, 2),
(75, 1, 20, NULL, 1, 0, 'Evan', 'Burns', 'vaposi3039@pubpng.com', '$2y$10$GvmsFbCXZaHrTt1L1VGdRu.aSjCmpoYx0xuM/L8MTUZ33woyoYyZW', 1, '2023-03-06 09:34:10', NULL, 1, '1', NULL, 'false', '2023-03-06 14:34:10', '2023-03-06 14:34:10', NULL, NULL, 2),
(76, 1, 20, NULL, 1, 0, 'TEST', 'TESTESTES', 'matis36122@wwgoc.com', '$2y$10$55WSPDzLWNu2Aq8KVcz0veOGRbPTPttWHzhsMZINz03UXPXtf4BSG', 1, '2023-03-06 10:15:46', NULL, 1, '1', NULL, 'false', '2023-03-06 15:15:46', '2023-03-06 15:15:46', NULL, NULL, 2),
(77, 1, 20, NULL, 1, 0, 'tst', 'teste', 'hamza@oip.com.pk', '$2y$10$NTCYbBteT5tXcyUfflg5EuwbmolnXlPqoMbMMGSM6vQIXb3LxeaMu', 1, '2023-03-06 10:16:35', NULL, 1, '1', NULL, 'false', '2023-03-06 15:16:35', '2023-03-06 15:16:35', NULL, NULL, 2),
(78, 1, 20, NULL, 1, 0, 'hamza', 'test', 'togaya9216@v2ssr.com', '$2y$10$a21InTbYRY1XNL/Adj5syOX.ar81UX7o7iqsEDUkqItjDQDc1qEKe', 1, '2023-03-06 10:24:08', NULL, 1, '1', NULL, 'false', '2023-03-06 15:24:08', '2023-03-06 15:24:08', NULL, NULL, 2),
(80, 1, 20, NULL, 1, 0, 'charli', 'nikolet', 'hofik87494@orgria.com', '$2y$10$nMJNERplpAxMJlBUW0MoRemqrTOjvW8pzp4XZZC0K.x/pIKFQtbSC', 1, '2023-03-06 14:55:03', NULL, 1, '1', NULL, 'false', '2023-03-06 19:55:03', '2023-03-06 19:55:03', NULL, NULL, 2),
(81, 1, 20, NULL, 1, 0, 'suzatute', 'ema', 'suzatute@ema-sofia.eu', '$2y$10$Dr2.BdLcIy7y1WpUbOfQDuo2sjH57FMjFPn2MLdweDuFWC24Smwx6', 1, '2023-03-06 14:55:36', NULL, 1, '1', NULL, 'false', '2023-03-06 19:55:36', '2023-03-06 19:55:36', NULL, NULL, 2),
(87, 1, 20, NULL, 1, 0, 'sikarer824', 'proexbol', 'sikarer824@proexbol.com', '$2y$10$J52M22MHKAgXU8xfaR2SnuNNuNTGLZgl9tFMWkgL5Hk7wBuKFhxcS', 1, '2023-03-06 15:03:26', NULL, 1, '1', NULL, 'false', '2023-03-06 20:03:26', '2023-03-06 20:03:26', NULL, NULL, 2),
(88, 1, 20, NULL, 1, 0, 'mexajex163', 'terkoer', 'mexajex163@terkoer.com', '$2y$10$bwo2Aen/IXKKVA4l/2xJAe25TFdvRJoyUASZtp2E88sk/VfmX75CC', 1, '2023-03-06 15:05:07', NULL, 1, '1', NULL, 'false', '2023-03-06 20:05:07', '2023-03-06 20:05:07', NULL, NULL, 2),
(89, 1, 20, NULL, 1, 0, 'bevow48159', 'proexbol', 'bevow48159@proexbol.com', '$2y$10$K9mTbVeiEedIbfx81rT40.WTlY2QL/vZeAbc0X8msduZacrFc9uOy', 1, '2023-03-06 15:06:54', NULL, 1, '1', NULL, 'false', '2023-03-06 20:06:54', '2023-03-06 20:06:54', NULL, NULL, 2),
(90, 1, 20, NULL, 1, 0, 'wasewok613', 'luxeic', 'wasewok613@luxeic.com', '$2y$10$.7FLjtCBo8dwb4HQpDxrl.pupx.CljiBy/glAFZRlulyIDrRodw.m', 1, '2023-03-06 15:10:11', NULL, 1, '1', NULL, 'false', '2023-03-06 20:10:11', '2023-03-06 20:10:11', NULL, NULL, 2),
(92, 1, 20, NULL, 1, 0, 'niceram445', 'terkoer', 'niceram445@terkoer.com', '$2y$10$MJk2RciNRdg/vubBGQLxneSwctfpx9Ids9qdrJasStAaCo.PNsdFa', 1, '2023-03-06 15:14:21', NULL, 1, '1', NULL, 'false', '2023-03-06 20:14:21', '2023-03-06 20:14:21', NULL, NULL, 2),
(93, 1, 20, NULL, 1, 0, 'xifed71555', 'rolenot', 'xifed71555@rolenot.com', '$2y$10$hGJtBV/fIJDpK5lNiczwwOYeY73qMDgFv/ZT9N5X/E2nGvLqxwFy.', 1, '2023-03-06 15:15:34', NULL, 1, '1', NULL, 'false', '2023-03-06 20:15:34', '2023-03-06 20:15:34', NULL, NULL, 2),
(94, 1, 20, NULL, 1, 0, 'Upton', 'Campos', 'majiba5356@gpipes.com', '$2y$10$OviiSS7krPZFvZCFUs2L1uIBF6PkIQSbeMr5Dh4rb/I5ak47ywAcm', 1, '2023-03-07 10:14:55', NULL, 1, '1', NULL, 'false', '2023-03-07 15:14:55', '2023-03-07 15:14:55', NULL, NULL, 2),
(95, 1, 20, NULL, 1, 0, 'abcd', 'fjds', 'tagaf37657@maazios.com', '$2y$10$FF0.a13KCSGvaTAUB0z3Vez4Sta.ekV2/fAD44d8PsUzYfkoTI5Gi', 1, '2023-03-07 11:07:17', NULL, 1, '1', NULL, 'false', '2023-03-07 16:07:17', '2023-03-07 16:07:17', NULL, NULL, 2),
(96, 1, 16, NULL, 1, 0, 'Shane', 'Macron', 'rivihop287@terkoer.com', '$2y$10$7TTkEgsFw3uPMPr9R4PelutSRWsCLGyAbCwKpIb9EbeR.jOVoLwOe', 1, '2023-03-07 12:58:19', 'gAR0kuZilDa0Owye4jSYjU9Cb9V2T7EOdllK5nm9TIVBeaW5sUfqsmluaNMQ', 1, '1', NULL, 'false', '2023-03-07 17:58:19', '2023-03-22 12:49:19', NULL, NULL, 3),
(97, 1, 20, NULL, 1, 1, 'Mendy', 'Morgan', 'woleh17094@necktai.com', '$2y$10$JlOpYAPd9B3IcasFnpA9AuXQdnt/7Q6/Jm6aXuFnpk7YUh/minggi', 1, '2023-03-17 10:11:50', 'h4Og8mrJHl3gDJLrcZuX3K0BnnttyDCUOEjz4z7IzHh9eEGQndMcZN0wR6Mw', 1, '1', '1', 'false', '2023-03-17 14:11:50', '2023-04-13 09:31:55', NULL, NULL, 6),
(98, 1, 15, NULL, 1, 1, 'Test', 'License', 'degen26150@marikuza.com', '$2y$10$1jJu3A1pnzWxlf2TvIieyuKvULj38jJwLmHNLS2UWkHTjtNO3bGMm', 1, '2023-03-29 04:42:34', 'hd069MJcrvZd9YLXIcPp6QvYlD9QffTR4mDxk0BTNQUsov611c13xsT5R9Ei', 1, '1', '1', 'false', '2023-03-29 08:42:34', '2023-04-04 10:53:54', NULL, NULL, 4),
(99, 1, 20, NULL, 1, 1, 'License', 'Faclitator two', 'hohad63693@mitigado.com', '$2y$10$K/G5qbeRt.52M4BSOHwS7.uS4bVjnMB3RUBtP01qnoeWAbcfbeadm', 1, '2023-03-29 04:56:53', 'uY6do9E9i88hdryeQfaLUlTaYLKwsv3I7qNE2ECk3IbkSWu11FkVAjatCHGp', 1, '1', '1', 'false', '2023-03-29 08:56:53', '2023-04-17 14:20:39', NULL, NULL, 10),
(100, 1, 20, NULL, 1, 0, 'Email', 'Test', 'sipekil794@mitigado.com', '$2y$10$m6IBGLyUTokQAPjjSE2/JuQLEOle0Klo2tZXHxKXoseDD6Upk3Wwm', 1, '2023-04-10 07:37:08', NULL, 1, '1', '1', 'false', '2023-04-10 11:37:08', '2023-04-18 14:16:40', NULL, NULL, 2),
(109, 8, 10, NULL, 1, 1, 'Kearnice', 'Taylor', 'Kearnice.Taylor@Spectrum8Sports.com', '$2y$10$t7YVkdZHknKK6aWwJOzi7.CtXj2nKmMvzucAavYbHWX7s4CZm1cwi', 1, '2023-04-28 14:14:50', '9FuPsn0DibL7J36hGFEVqgcM9qaTzogBKOheqBkWKJiHzMZz14uUdUZF2NSI', 1, '8', '8', 'false', '2023-04-28 18:14:50', '2023-05-05 04:20:30', NULL, NULL, 2),
(110, 1, 12, NULL, 1, 1, 'Facilitator', 'Sun City Surf', 'nopiyig774@meidecn.com', '$2y$10$WlZsC5wGx44ByqVl3hESTOPFs.LsU0daKP0Fm/hcJP227nlj/NIPe', 1, '2023-05-09 08:32:49', NULL, 1, '1', '1', 'false', '2023-05-09 12:32:49', '2023-05-09 12:36:47', NULL, NULL, 2),
(111, 1, 10, NULL, 1, 1, 'Regression', 'Test', 'kayal72539@dekaps.com', '$2y$10$8Ada1MvMZyCuFYr1YZQaIenMsyf8ihdNHsCMVfAMkA5zn2OiyMJe6', 1, '2023-05-12 10:08:55', 'Gt5RkqO50QX9x65m8sDRJxyZA3kaWn2GGoGjE0YZauzeM1tjztXwRTpQFAN4', 1, '1', '1', 'false', '2023-05-12 14:08:55', '2023-05-12 14:23:39', NULL, NULL, 2),
(121, 19, 24, NULL, 1, 1, 'Event', 'Staff', 's8sStaff+1@gmail.com', '$2y$10$HYqX93oC7tBJRgbGc932DelrftKIRR05WhDD1ppxC0nn3VbomwBJa', 1, '2023-09-09 01:12:28', NULL, 1, '19', NULL, 'false', '2023-09-09 05:12:28', '2023-09-09 05:17:57', '2023-09-09 05:17:57', '8762', 2),
(122, 19, 12, NULL, 1, 1, 'Event', 'Staff', 'EBernosky@hotmail.com', '$2y$10$GnnVcpg5qafrvOcOZSAvOOWkn4X6fIPOPurq6s.b43QpUZAWnF1Uq', 1, '2023-09-09 01:22:14', NULL, 1, '19', '19', 'false', '2023-09-09 05:22:14', '2024-07-23 19:58:37', NULL, '7582', 2);

-- --------------------------------------------------------

--
-- Table structure for table `facilitator_classes`
--

CREATE TABLE `facilitator_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `FacilitatorID` int(10) UNSIGNED DEFAULT NULL,
  `ClassID` int(10) UNSIGNED DEFAULT NULL,
  `ClassName` varchar(15) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilitator_classes`
--

INSERT INTO `facilitator_classes` (`id`, `FacilitatorID`, `ClassID`, `ClassName`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 1, '8:15 Boy\'s 5Th', 1, 1, '6', '6', 'false', '2022-12-05 18:51:53', '2022-12-15 00:18:37', NULL),
(2, 2, 1, 'Javlin throw', 0, 1, '6', NULL, 'false', '2022-12-05 18:52:01', '2022-12-06 18:59:20', NULL),
(3, 3, 3, 'Test Nine', 1, 1, '6', NULL, 'false', '2022-12-06 15:53:10', '2022-12-08 15:09:02', '2022-12-08 15:09:02'),
(4, 5, 4, 'Javlin throw', 1, 1, '6', NULL, 'false', '2022-12-06 15:53:18', '2022-12-08 15:08:59', '2022-12-08 15:08:59'),
(5, 3, 2, 'Javlin throw', 0, 1, '8', NULL, 'false', '2022-12-06 16:27:36', '2022-12-08 15:09:05', '2022-12-08 15:09:05'),
(6, 1, 3, 'Luxury', 1, 1, '8', '10', 'false', '2022-12-06 16:27:43', '2022-12-07 14:17:22', NULL),
(7, 3, 4, 'https:/faclass/', 1, 1, '8', NULL, 'false', '2022-12-06 18:58:42', '2022-12-08 15:08:55', '2022-12-08 15:08:55'),
(8, 17, 1, 'Individual', 1, 1, '8', NULL, 'false', '2022-12-08 14:10:18', '2022-12-08 14:10:18', NULL),
(9, 17, 3, 'Individual Test', 0, 1, '8', NULL, 'false', '2022-12-08 14:10:34', '2022-12-08 14:10:34', NULL),
(10, 51, 6, 'Global', 1, 1, '8', '12', 'false', '2022-12-08 14:10:58', '2023-02-15 15:53:04', NULL),
(11, 18, 3, 'Overhead', 1, 1, '6', NULL, 'false', '2022-12-08 15:08:26', '2022-12-08 15:08:26', NULL),
(12, 19, 4, 'Overhead', 0, 1, '6', NULL, 'false', '2022-12-08 15:08:40', '2022-12-08 15:08:40', NULL),
(13, 17, 5, 'Test Five', 1, 1, '6', NULL, 'false', '2022-12-13 19:21:41', '2022-12-13 19:21:41', NULL),
(14, 20, 2, '9:15 2nd Grade', 1, 1, '6', NULL, 'false', '2022-12-20 20:59:41', '2022-12-20 21:00:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'What version of the app am I using?', 'Version 17', 1, '6', NULL, 'false', '2022-12-06 14:49:40', '2022-12-06 14:49:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Child` varchar(15) DEFAULT NULL,
  `Children` varchar(15) DEFAULT NULL,
  `Adult` varchar(15) DEFAULT NULL,
  `Adults` varchar(15) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `Gender`, `Child`, `Children`, `Adult`, `Adults`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Male', 'Boy', 'Boy\'s', 'Man', 'Men', 1, NULL, NULL, 'false', '2023-01-04 17:50:47', '2023-01-04 17:50:47', NULL),
(2, 'Female', 'Girl', 'Girl\'s', 'Woman', 'Women', 1, NULL, NULL, 'false', '2023-01-04 17:50:47', '2023-01-04 17:50:47', NULL),
(3, 'Other', 'Other', 'Other\'s', 'Other', 'Other\'s', 1, NULL, NULL, 'false', '2023-01-04 17:50:47', '2023-01-04 17:50:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `Grade` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Short` varchar(10) DEFAULT NULL,
  `ColorID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `Grade`, `Name`, `Short`, `ColorID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '1st - First Grade', '1st', 5, 1, '1', '37', 'false', '2022-12-05 18:20:51', '2023-08-30 05:52:24', NULL),
(2, 2, '2nd - Second Grade', '2nd', 2, 1, '6', '37', 'false', '2022-12-05 18:22:25', '2023-08-30 05:52:15', NULL),
(3, 3, '3rd - Third Garde', '3rd', 3, 1, '6', '37', 'false', '2022-12-05 18:22:41', '2023-08-30 05:52:05', NULL),
(4, 4, '4th - Fourth Grade', '4th', 4, 1, '6', '37', 'false', '2022-12-05 18:22:54', '2023-08-30 05:51:55', NULL),
(5, 5, '5th - Fifth Grade', '5th', 5, 1, '6', '37', 'false', '2022-12-05 18:23:06', '2023-08-30 05:51:44', NULL),
(6, 6, '6th - Sixth Grade', '6th', 6, 1, '6', '37', 'false', '2022-12-05 18:23:20', '2023-08-30 05:51:36', NULL),
(7, 7, '7th - Seventh Grade', '7th', 7, 1, '6', '37', 'false', '2022-12-05 18:23:33', '2023-08-30 05:51:29', NULL),
(8, 8, '8th - Eighth Grade', '8th', 8, 1, '6', '37', 'false', '2022-12-05 18:23:44', '2023-08-30 05:51:20', NULL),
(9, 9, 'Freshman', '9th', 6, 1, '6', '6', 'true', '2022-12-06 15:31:13', '2023-03-02 20:18:13', NULL),
(10, 10, 'Sophomore', '10th', 9, 1, '6', '6', 'true', '2022-12-07 12:44:32', '2023-03-02 20:18:26', NULL),
(11, 11, 'Junior', '11th', 10, 1, '6', '6', 'true', '2022-12-07 12:44:50', '2023-03-02 20:18:23', NULL),
(12, 12, 'Senior', '12th', 11, 1, '6', '6', 'true', '2022-12-13 18:40:49', '2023-03-02 20:18:21', NULL),
(13, 13, 'Gimme Nesheem', '13th', 8, 1, '6', '12', 'true', '2022-12-15 01:17:21', '2023-03-02 20:18:17', NULL),
(14, 0, '0 - Kindergarten and below', '0-K', 2, 1, '37', NULL, 'false', '2023-08-30 05:52:55', '2023-08-30 05:52:55', NULL),
(15, 9, '9th Freshman', '9th', 2, 1, '19', '19', 'false', '2023-12-19 07:43:06', '2023-12-19 07:46:05', NULL),
(16, 10, '10th Sophomore', '10th', 3, 1, '19', '19', 'false', '2023-12-19 07:44:24', '2023-12-19 07:47:54', NULL),
(17, 11, '11th Junior', '11th', 4, 1, '19', NULL, 'false', '2023-12-19 07:49:07', '2023-12-19 07:49:07', NULL),
(18, 12, '12th Senior', '12th', 1, 1, '19', NULL, 'false', '2023-12-19 07:50:45', '2023-12-19 07:50:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Abbr` varchar(25) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `Name`, `Abbr`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1st - 2nd Boy & Girls', '1 - 2 All', 1, '6', '1', 'true', '2022-12-05 21:41:58', '2023-05-12 14:25:39', NULL),
(2, 'Test 2', 'TET', 1, '6', '37', 'true', '2022-12-06 15:12:33', '2023-05-24 18:49:13', NULL),
(3, 'Grade Test', 'ECA', 1, '6', NULL, 'true', '2022-12-06 15:55:16', '2023-05-24 18:49:04', NULL),
(4, 'G. 7th Grade Males', '7th Grade Males', 1, '11', '19', 'false', '2022-12-07 14:38:27', '2023-12-19 23:35:42', NULL),
(5, 'Octagon Speed Endurance', 'OSE', 1, '11', NULL, 'false', '2022-12-07 14:38:45', '2022-12-07 14:39:57', '2022-12-07 14:39:57'),
(6, 'Runing', 'RRR', 1, '11', NULL, 'false', '2022-12-07 14:38:54', '2022-12-07 14:39:57', '2022-12-07 14:39:57'),
(7, 'Javlin', 'JV', 1, '11', NULL, 'false', '2022-12-07 14:39:02', '2022-12-07 14:39:57', '2022-12-07 14:39:57'),
(8, '8 Mile Beeper', '8M', 1, '11', NULL, 'false', '2022-12-07 14:39:35', '2022-12-07 14:39:57', '2022-12-07 14:39:57'),
(9, '8-Point Agility Octagon', 'PAO8', 1, '11', NULL, 'false', '2022-12-07 14:39:44', '2022-12-07 14:39:57', '2022-12-07 14:39:57'),
(10, 'R. Class 8', 'Class 8', 1, '6', '19', 'false', '2022-12-08 14:31:14', '2023-05-24 18:48:40', NULL),
(11, 'Q. Class 7', 'Class 7', 1, '6', '19', 'false', '2022-12-20 23:08:16', '2023-05-24 18:48:03', NULL),
(12, 'P. Class 6', 'Class 6', 1, '6', '19', 'false', '2023-01-04 16:00:56', '2023-05-24 18:46:45', NULL),
(13, 'O. Class 5', 'Class 5', 1, '6', '19', 'false', '2023-01-11 12:57:10', '2023-05-24 18:46:12', NULL),
(14, 'N. Class 4', 'Class 4', 1, '11', '19', 'false', '2023-01-14 19:53:02', '2023-05-24 18:45:31', NULL),
(15, 'Optimal Games', 'OPG', 1, '11', NULL, 'true', '2023-01-20 15:27:01', '2023-05-24 18:40:36', NULL),
(16, 'M. Class 3', 'Class 3', 1, '11', '19', 'false', '2023-01-20 16:15:21', '2023-05-24 18:44:35', NULL),
(17, 'L. Class 2', 'Class 2', 1, '6', '19', 'false', '2023-01-25 06:52:53', '2023-05-24 18:43:38', NULL),
(18, 'Z. Class 1', 'Class1', 1, '11', '19', 'false', '2023-01-27 18:38:14', '2023-12-19 17:09:53', NULL),
(19, 'E. 6th Grade Males', '6th Grade Males', 1, '1', '19', 'false', '2023-01-30 14:31:32', '2023-12-19 23:32:28', NULL),
(20, 'J. 8th Grade Females', '8th Grade Females', 1, '11', '19', 'false', '2023-02-09 13:47:03', '2023-12-19 23:34:57', NULL),
(21, 'I. 8th Grade Males', '8th Grade Males', 1, '1', '19', 'false', '2023-02-24 22:05:49', '2023-12-19 23:31:34', NULL),
(22, 'D. 5Th Grade Females', '5th Grade Females', 1, '1', '19', 'false', '2023-03-02 17:44:00', '2023-12-19 23:34:22', NULL),
(23, 'H. 7th Grade Females', '7th Grade Females', 1, '1', '19', 'false', '2023-03-17 14:12:58', '2023-12-19 23:33:55', NULL),
(24, 'F. 6th Grade Females', '6th Grade Females', 1, '1', '19', 'false', '2023-03-29 08:47:10', '2023-12-19 23:33:32', NULL),
(25, '00-ALL', 'All', 1, '37', '37', 'false', '2023-05-05 05:30:03', '2023-05-12 05:30:19', '2023-05-12 05:30:19'),
(26, '* All', '+ All Participants', 1, '37', '19', 'true', '2023-05-12 05:29:22', '2023-05-24 18:57:13', NULL),
(27, 'C. 5th Grade Males', '5th Grade Males', 1, '37', '19', 'false', '2023-05-12 05:39:30', '2023-12-19 23:30:36', NULL),
(28, 'B. 3rd & 4th Grade (All)', '3 Grade & 4 Grade', 1, '1', '19', 'false', '2023-05-12 14:11:14', '2023-05-24 19:13:57', NULL),
(29, 'A. 1st & 2nd Grade (All)', '1 Grade & 2 Grade', 1, '1', '19', 'false', '2023-05-15 18:52:34', '2023-05-24 19:13:11', NULL),
(30, 'Leonard Simmons test 20230516', '20230516', 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:22:58', '2023-05-17 04:22:58'),
(31, 'K. 9th Grade Males', '9th Grade Males', 1, '19', '19', 'false', '2023-12-19 17:12:48', '2023-12-19 23:30:01', NULL),
(32, 'L. 10th Grade Males', '10th Grade Males', 1, '19', '19', 'false', '2023-12-19 17:14:46', '2023-12-19 23:29:44', NULL),
(33, 'M. 11th Grade Males', '11th Grade Males', 1, '19', '19', 'false', '2023-12-19 17:15:35', '2023-12-19 23:29:25', NULL),
(34, 'N. 12th Grade Males', '12th Grade Males', 1, '19', '19', 'false', '2023-12-19 17:16:23', '2023-12-19 23:27:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_classes`
--

CREATE TABLE `group_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `GroupID` int(10) UNSIGNED DEFAULT NULL,
  `ClassID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_classes`
--

INSERT INTO `group_classes` (`id`, `GroupID`, `ClassID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 3, 2, 1, '6', NULL, 'false', '2022-12-06 15:58:26', '2022-12-06 15:58:37', NULL),
(63, 1, 8, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(64, 1, 7, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(65, 1, 6, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(66, 1, 5, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(67, 1, 4, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(68, 1, 3, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(69, 1, 2, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(70, 1, 1, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(105, 25, 8, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(106, 25, 7, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(107, 25, 6, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(108, 25, 5, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(109, 25, 4, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(110, 25, 3, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(111, 25, 2, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(112, 25, 1, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(142, 30, 8, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(143, 30, 7, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(144, 30, 6, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(145, 30, 5, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(146, 30, 4, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(147, 30, 3, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(148, 30, 2, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(149, 30, 1, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(152, 2, 5, 1, NULL, '37', 'false', '2023-05-17 04:35:59', '2023-05-17 04:35:59', NULL),
(153, 2, 1, 1, NULL, '37', 'false', '2023-05-17 04:35:59', '2023-05-17 04:35:59', NULL),
(348, 26, 1, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(349, 26, 2, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(350, 26, 3, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(351, 26, 4, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(352, 26, 5, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(353, 26, 6, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(354, 26, 7, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(355, 26, 8, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(413, 17, 2, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(414, 16, 3, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(415, 14, 4, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(417, 12, 6, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(418, 11, 7, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(444, 13, 5, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(445, 10, 8, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(466, 28, 1, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(467, 28, 10, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(468, 28, 11, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(469, 28, 12, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(470, 28, 2, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(471, 28, 3, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(472, 28, 4, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(473, 28, 5, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(474, 28, 6, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(475, 28, 7, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(476, 28, 8, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(477, 28, 9, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(562, 18, 1, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(659, 33, 1, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(660, 33, 10, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(661, 33, 11, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(662, 33, 12, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(663, 33, 2, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(664, 33, 3, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(665, 33, 4, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(666, 33, 5, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(667, 33, 6, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(668, 33, 7, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(669, 33, 8, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(670, 33, 9, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(671, 32, 1, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(672, 32, 10, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(673, 32, 11, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(674, 32, 12, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(675, 32, 2, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(676, 32, 3, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(677, 32, 4, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(678, 32, 5, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(679, 32, 6, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(680, 32, 7, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(681, 32, 8, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(682, 32, 9, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(683, 31, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(684, 31, 10, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(685, 31, 11, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(686, 31, 12, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(687, 31, 2, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(688, 31, 3, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(689, 31, 4, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(690, 31, 5, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(691, 31, 6, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(692, 31, 7, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(693, 31, 8, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(694, 31, 9, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(695, 29, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(696, 29, 10, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(697, 29, 11, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(698, 29, 12, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(699, 29, 2, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(700, 29, 3, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(701, 29, 4, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(702, 29, 5, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(703, 29, 6, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(704, 29, 7, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(705, 29, 8, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(706, 29, 9, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(707, 27, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(708, 27, 10, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(709, 27, 11, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(710, 27, 12, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(711, 27, 2, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(712, 27, 3, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(713, 27, 4, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(714, 27, 5, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(715, 27, 6, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(716, 27, 7, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(717, 27, 8, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(718, 27, 9, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(719, 21, 1, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(720, 21, 10, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(721, 21, 11, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(722, 21, 12, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(723, 21, 2, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(724, 21, 3, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(725, 21, 4, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(726, 21, 5, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(727, 21, 6, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(728, 21, 7, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(729, 21, 8, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(730, 21, 9, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(731, 19, 1, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(732, 19, 10, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(733, 19, 11, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(734, 19, 12, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(735, 19, 2, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(736, 19, 3, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(737, 19, 4, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(738, 19, 5, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(739, 19, 6, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(740, 19, 7, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(741, 19, 8, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(742, 19, 9, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(743, 24, 1, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(744, 24, 10, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(745, 24, 11, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(746, 24, 12, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(747, 24, 2, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(748, 24, 3, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(749, 24, 4, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(750, 24, 5, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(751, 24, 6, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(752, 24, 7, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(753, 24, 8, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(754, 24, 9, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(755, 23, 1, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(756, 23, 10, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(757, 23, 11, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(758, 23, 12, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(759, 23, 2, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(760, 23, 3, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(761, 23, 4, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(762, 23, 5, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(763, 23, 6, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(764, 23, 7, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(765, 23, 8, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(766, 23, 9, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(767, 22, 1, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(768, 22, 10, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(769, 22, 11, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(770, 22, 12, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(771, 22, 2, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(772, 22, 3, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(773, 22, 4, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(774, 22, 5, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(775, 22, 6, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(776, 22, 7, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(777, 22, 8, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(778, 22, 9, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(779, 20, 1, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(780, 20, 10, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(781, 20, 11, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(782, 20, 12, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(783, 20, 2, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(784, 20, 3, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(785, 20, 4, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(786, 20, 5, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(787, 20, 6, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(788, 20, 7, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(789, 20, 8, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(790, 20, 9, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(799, 4, 1, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(800, 4, 10, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(801, 4, 11, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(802, 4, 12, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(803, 4, 2, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(804, 4, 3, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(805, 4, 4, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(806, 4, 5, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(807, 4, 6, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(808, 4, 7, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(809, 4, 8, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(810, 4, 9, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(811, 34, 1, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(812, 34, 10, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(813, 34, 11, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(814, 34, 12, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(815, 34, 2, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(816, 34, 3, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(817, 34, 4, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(818, 34, 5, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(819, 34, 6, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(820, 34, 7, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(821, 34, 8, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL),
(822, 34, 9, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_facilitators`
--

CREATE TABLE `group_facilitators` (
  `id` int(10) UNSIGNED NOT NULL,
  `GroupID` int(10) UNSIGNED DEFAULT NULL,
  `FacilitatorID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_facilitators`
--

INSERT INTO `group_facilitators` (`id`, `GroupID`, `FacilitatorID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 4, 1, '6', '11', 'false', '2022-12-05 21:43:36', '2022-12-08 12:30:15', '2022-12-08 12:30:15'),
(4, 4, 1, 1, '11', NULL, 'false', '2022-12-07 14:42:16', '2022-12-07 14:42:16', NULL),
(5, 4, 3, 1, '11', NULL, 'false', '2022-12-07 14:42:21', '2022-12-07 14:42:52', '2022-12-07 14:42:52'),
(6, 4, 48, 1, '11', '11', 'false', '2022-12-07 14:42:27', '2023-01-20 16:46:41', NULL),
(8, 3, 4, 1, '1', NULL, 'false', '2022-12-08 12:27:30', '2022-12-08 12:27:30', NULL),
(10, 4, 4, 1, '1', NULL, 'false', '2022-12-08 12:30:38', '2022-12-08 12:30:38', NULL),
(12, 10, 48, 1, '6', '11', 'false', '2022-12-08 14:32:10', '2023-01-20 16:46:52', NULL),
(13, 15, 47, 1, '6', '11', 'false', '2022-12-08 19:00:10', '2023-01-20 15:40:15', NULL),
(14, 4, 48, 1, '6', '11', 'false', '2022-12-08 19:00:39', '2023-01-20 16:50:00', NULL),
(15, 11, 20, 1, '11', '11', 'false', '2022-12-27 16:37:54', '2023-01-23 01:19:24', NULL),
(16, 10, 31, 1, '11', NULL, 'false', '2022-12-27 16:38:02', '2022-12-27 16:38:02', NULL),
(17, 11, 32, 1, '11', NULL, 'false', '2022-12-27 17:48:26', '2022-12-27 17:48:26', NULL),
(18, 10, 32, 1, '11', NULL, 'false', '2022-12-27 17:48:33', '2022-12-27 17:48:33', NULL),
(19, 11, 34, 1, '11', NULL, 'false', '2022-12-30 18:14:43', '2023-01-23 01:20:18', '2023-01-23 01:20:18'),
(20, 4, 34, 1, '11', NULL, 'false', '2022-12-30 18:25:32', '2022-12-30 18:25:32', NULL),
(21, 11, 34, 1, '11', NULL, 'false', '2022-12-30 18:25:39', '2022-12-30 18:25:39', NULL),
(22, 11, 34, 1, '11', NULL, 'false', '2022-12-30 18:33:18', '2023-01-23 01:20:29', '2023-01-23 01:20:29'),
(24, 4, 35, 1, '11', NULL, 'false', '2023-01-03 17:15:44', '2023-01-03 17:15:44', NULL),
(25, 10, 35, 1, '11', NULL, 'false', '2023-01-03 17:15:53', '2023-01-03 17:15:53', NULL),
(27, 12, 41, 1, '6', NULL, 'false', '2023-01-04 16:01:37', '2023-01-04 16:01:37', NULL),
(28, 12, 48, 1, '11', '11', 'false', '2023-01-04 18:02:12', '2023-01-20 16:49:49', NULL),
(30, 10, 42, 1, '11', NULL, 'false', '2023-01-09 19:47:15', '2023-01-09 19:47:15', NULL),
(31, 12, 43, 1, '11', NULL, 'false', '2023-01-10 13:59:54', '2023-01-10 13:59:54', NULL),
(32, 13, 44, 1, '6', NULL, 'false', '2023-01-11 12:59:50', '2023-01-11 12:59:50', NULL),
(33, 4, 45, 1, '6', NULL, 'false', '2023-01-17 13:25:45', '2023-01-17 13:25:45', NULL),
(34, 3, 45, 1, '1', NULL, 'false', '2023-01-17 14:41:11', '2023-01-17 14:41:11', NULL),
(35, 14, 46, 1, '6', NULL, 'false', '2023-01-17 15:24:50', '2023-01-17 15:24:50', NULL),
(36, 13, 48, 1, '11', '11', 'false', '2023-01-20 15:11:25', '2023-01-20 16:28:42', NULL),
(37, 14, 47, 1, '11', '11', 'false', '2023-01-20 15:11:34', '2023-01-20 15:41:27', NULL),
(38, 14, 48, 1, '11', '11', 'false', '2023-01-20 15:11:43', '2023-01-20 16:28:29', NULL),
(39, 15, 48, 1, '11', '11', 'false', '2023-01-20 15:28:23', '2023-01-20 16:28:16', NULL),
(42, 14, 49, 1, '11', '6', 'false', '2023-01-24 19:37:35', '2023-01-24 19:55:06', NULL),
(43, 14, 49, 1, '11', NULL, 'false', '2023-01-24 19:37:41', '2023-01-24 19:37:41', NULL),
(44, 12, 49, 1, '11', NULL, 'false', '2023-01-24 19:37:49', '2023-01-24 19:37:49', NULL),
(45, 10, 49, 1, '11', NULL, 'false', '2023-01-24 19:37:57', '2023-01-24 19:37:57', NULL),
(53, 18, 50, 1, NULL, '11', 'false', '2023-01-27 18:44:12', '2023-01-27 18:44:12', NULL),
(57, 19, 18, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(58, 19, 19, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(59, 19, 25, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(60, 19, 30, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(61, 19, 36, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(62, 19, 37, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(63, 19, 40, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(64, 19, 46, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(65, 19, 24, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(66, 19, 34, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(67, 19, 39, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(68, 19, 50, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(69, 20, 51, 1, '11', NULL, 'false', '2023-02-09 13:47:03', '2023-02-09 13:47:03', NULL),
(71, 21, 52, 1, NULL, '1', 'false', '2023-02-24 22:30:46', '2023-02-24 22:30:46', NULL),
(75, 22, 96, 1, NULL, '6', 'false', '2023-03-14 17:36:02', '2023-03-14 17:36:02', NULL),
(77, 17, 46, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(78, 17, 40, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(79, 17, 37, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(80, 17, 30, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(81, 17, 25, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(82, 17, 19, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(83, 17, 18, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(87, 16, 38, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(88, 1, 35, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(89, 1, 4, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(93, 23, 37, 1, NULL, '1', 'false', '2023-04-28 15:56:31', '2023-04-28 15:56:31', NULL),
(95, 24, 98, 1, NULL, '1', 'false', '2023-04-28 15:58:27', '2023-04-28 15:58:27', NULL),
(174, 2, 4, 1, NULL, '1', 'false', '2023-05-05 16:12:42', '2023-05-05 16:12:42', NULL),
(176, 25, 60, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(177, 25, 54, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(178, 25, 52, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(179, 25, 100, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(180, 25, 99, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(181, 25, 97, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(182, 25, 95, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(183, 25, 94, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(184, 25, 93, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(185, 25, 92, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(186, 25, 90, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(187, 25, 89, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(188, 25, 88, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(189, 25, 87, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(190, 25, 81, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(191, 25, 80, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(192, 25, 78, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(193, 25, 77, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(194, 25, 76, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(195, 25, 75, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(196, 25, 67, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(197, 25, 66, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(198, 25, 65, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(199, 25, 64, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(200, 25, 63, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(201, 25, 62, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(202, 25, 58, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(203, 25, 57, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(204, 25, 56, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(205, 25, 53, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(206, 25, 50, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(207, 25, 29, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(208, 25, 96, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(209, 25, 73, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(210, 25, 72, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(211, 25, 71, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(212, 25, 70, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(213, 25, 69, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(214, 25, 68, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(215, 25, 61, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(216, 25, 59, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(217, 25, 55, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(218, 25, 49, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(219, 25, 98, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(220, 25, 74, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(221, 25, 45, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(222, 25, 44, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(223, 25, 110, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(224, 25, 39, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(225, 25, 34, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(226, 25, 24, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(227, 25, 51, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(228, 25, 47, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(229, 25, 43, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(230, 25, 31, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(231, 25, 23, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(232, 25, 109, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(233, 25, 48, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(234, 25, 42, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(235, 25, 41, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(236, 25, 38, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(237, 25, 32, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(238, 25, 22, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(239, 25, 20, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(240, 25, 35, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(241, 25, 21, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(242, 25, 46, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(243, 25, 40, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(244, 25, 37, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(245, 25, 36, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(246, 25, 30, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(247, 25, 25, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(248, 25, 19, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(249, 25, 18, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(250, 25, 4, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(251, 25, 33, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(252, 25, 28, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(253, 25, 3, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(254, 25, 2, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(334, 26, 60, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(335, 26, 54, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(336, 26, 52, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(337, 26, 100, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(338, 26, 99, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(339, 26, 97, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(340, 26, 95, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(341, 26, 94, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(342, 26, 93, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(343, 26, 92, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(344, 26, 90, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(345, 26, 89, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(346, 26, 88, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(347, 26, 87, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(348, 26, 81, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(349, 26, 80, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(350, 26, 78, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(351, 26, 77, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(352, 26, 76, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(353, 26, 75, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(354, 26, 67, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(355, 26, 66, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(356, 26, 65, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(357, 26, 64, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(358, 26, 63, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(359, 26, 62, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(360, 26, 58, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(361, 26, 57, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(362, 26, 56, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(363, 26, 53, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(364, 26, 50, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(365, 26, 29, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(366, 26, 96, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(367, 26, 73, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(368, 26, 72, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(369, 26, 71, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(370, 26, 70, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(371, 26, 69, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(372, 26, 68, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(373, 26, 61, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(374, 26, 59, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(375, 26, 55, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(376, 26, 49, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(377, 26, 98, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(378, 26, 74, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(379, 26, 45, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(380, 26, 44, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(381, 26, 110, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(382, 26, 39, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(383, 26, 34, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(384, 26, 24, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(385, 26, 51, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(386, 26, 47, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(387, 26, 43, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(388, 26, 31, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(389, 26, 23, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(390, 26, 109, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(391, 26, 48, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(392, 26, 42, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(393, 26, 41, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(394, 26, 38, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(395, 26, 32, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(396, 26, 22, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(397, 26, 20, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(398, 26, 35, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(399, 26, 21, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(400, 26, 46, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(401, 26, 40, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(402, 26, 37, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(403, 26, 36, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(404, 26, 30, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(405, 26, 25, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(406, 26, 19, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(407, 26, 18, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(408, 26, 4, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(409, 26, 33, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(410, 26, 28, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(411, 26, 3, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(412, 26, 2, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(413, 27, 110, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(414, 27, 109, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(415, 27, 100, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(416, 27, 99, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(417, 27, 98, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(418, 27, 97, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(419, 27, 96, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(420, 27, 95, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(421, 27, 94, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(422, 27, 93, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(423, 27, 92, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(424, 27, 90, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(425, 27, 89, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(426, 27, 88, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(427, 27, 87, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(428, 27, 81, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(429, 27, 80, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(430, 27, 78, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(431, 27, 77, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(432, 27, 76, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(433, 27, 75, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(434, 27, 74, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(435, 27, 73, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(436, 27, 72, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(437, 27, 71, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(438, 27, 70, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(439, 27, 69, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(440, 27, 68, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(441, 27, 67, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(442, 27, 66, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(443, 27, 65, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(444, 27, 64, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(445, 27, 63, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(446, 27, 62, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(447, 27, 61, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(448, 27, 60, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(449, 27, 59, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(450, 27, 58, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(451, 27, 57, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(452, 27, 56, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(453, 27, 55, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(454, 27, 54, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(455, 27, 53, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(456, 27, 52, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(457, 27, 51, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(458, 27, 50, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(459, 27, 49, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(460, 27, 48, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(461, 27, 47, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(462, 27, 46, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(463, 27, 45, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(464, 27, 44, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(465, 27, 43, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(466, 27, 42, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(467, 27, 41, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(468, 27, 40, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(469, 27, 39, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(470, 27, 38, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(471, 27, 37, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(472, 27, 36, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(473, 27, 35, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(474, 27, 34, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(475, 27, 33, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(476, 27, 32, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(477, 27, 31, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(478, 27, 30, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(479, 27, 29, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(480, 27, 28, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(481, 27, 25, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(482, 27, 24, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(483, 27, 23, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(484, 27, 22, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(485, 27, 21, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(486, 27, 20, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(487, 27, 19, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(488, 27, 18, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(489, 27, 4, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(490, 27, 3, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(491, 27, 2, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(492, 28, 111, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(493, 28, 109, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(494, 28, 48, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(495, 28, 42, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(496, 28, 41, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(497, 28, 38, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(498, 28, 32, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(499, 28, 22, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL),
(500, 28, 20, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_genders`
--

CREATE TABLE `group_genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `GroupID` int(10) UNSIGNED DEFAULT NULL,
  `GenderID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_genders`
--

INSERT INTO `group_genders` (`id`, `GroupID`, `GenderID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 3, 2, 1, '6', '6', 'false', '2022-12-05 21:47:48', '2022-12-06 15:57:34', NULL),
(46, 1, 2, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(47, 1, 1, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(61, 25, 3, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(62, 25, 2, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(63, 25, 1, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(78, 30, 3, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(79, 30, 2, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(80, 30, 1, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(82, 2, 2, 1, NULL, '37', 'false', '2023-05-17 04:35:59', '2023-05-17 04:35:59', NULL),
(125, 26, 2, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(126, 26, 1, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(136, 17, 2, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(137, 17, 1, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(138, 16, 2, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(139, 16, 1, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(140, 14, 2, 1, NULL, '19', 'false', '2023-05-24 18:45:31', '2023-05-24 18:45:31', NULL),
(141, 14, 1, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(144, 12, 2, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(145, 12, 1, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(146, 11, 2, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(147, 11, 1, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(155, 13, 2, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(156, 13, 1, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(161, 10, 2, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(162, 10, 1, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(169, 28, 2, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(170, 28, 1, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(178, 18, 2, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(179, 18, 1, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(188, 33, 1, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(189, 32, 1, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(190, 31, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(191, 29, 2, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(192, 29, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(193, 27, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(194, 21, 1, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(195, 19, 1, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(196, 24, 2, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(197, 23, 2, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(198, 22, 2, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(199, 20, 2, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(201, 4, 1, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(202, 34, 1, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_grades`
--

CREATE TABLE `group_grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `GroupID` int(10) UNSIGNED DEFAULT NULL,
  `GradeID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_grades`
--

INSERT INTO `group_grades` (`id`, `GroupID`, `GradeID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 3, 3, 1, '6', '11', 'false', '2022-12-05 21:49:04', '2022-12-07 14:45:59', NULL),
(6, 3, 6, 1, '6', '11', 'false', '2022-12-05 21:49:18', '2022-12-07 14:46:08', NULL),
(11, 3, 1, 1, '6', NULL, 'false', '2022-12-06 15:57:59', '2022-12-06 15:57:59', NULL),
(75, 1, 2, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(76, 1, 1, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(101, 25, 8, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(102, 25, 7, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(103, 25, 6, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(104, 25, 5, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(105, 25, 4, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(106, 25, 3, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(107, 25, 2, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(108, 25, 1, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(150, 30, 8, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(151, 30, 7, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(152, 30, 6, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(153, 30, 5, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(154, 30, 4, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(155, 30, 3, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(156, 30, 2, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(157, 30, 1, 1, '37', NULL, 'false', '2023-05-17 04:20:56', '2023-05-17 04:20:56', NULL),
(160, 2, 5, 1, NULL, '37', 'false', '2023-05-17 04:35:59', '2023-05-17 04:35:59', NULL),
(161, 2, 1, 1, NULL, '37', 'false', '2023-05-17 04:35:59', '2023-05-17 04:35:59', NULL),
(215, 26, 8, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(216, 26, 5, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(217, 26, 1, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(218, 26, 4, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(219, 26, 2, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(220, 26, 7, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(221, 26, 6, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(222, 26, 3, 1, NULL, '19', 'false', '2023-05-24 18:33:39', '2023-05-24 18:33:39', NULL),
(238, 17, 8, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(239, 17, 5, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(240, 17, 1, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(241, 17, 4, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(242, 17, 2, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(243, 17, 7, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(244, 17, 6, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(245, 17, 3, 1, NULL, '19', 'false', '2023-05-24 18:43:38', '2023-05-24 18:43:38', NULL),
(246, 16, 8, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(247, 16, 5, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(248, 16, 1, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(249, 16, 4, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(250, 16, 2, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(251, 16, 7, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(252, 16, 6, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(253, 16, 3, 1, NULL, '19', 'false', '2023-05-24 18:44:36', '2023-05-24 18:44:36', NULL),
(254, 14, 8, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(255, 14, 5, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(256, 14, 1, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(257, 14, 4, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(258, 14, 2, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(259, 14, 7, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(260, 14, 6, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(261, 14, 3, 1, NULL, '19', 'false', '2023-05-24 18:45:32', '2023-05-24 18:45:32', NULL),
(270, 12, 8, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(271, 12, 5, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(272, 12, 1, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(273, 12, 4, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(274, 12, 2, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(275, 12, 7, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(276, 12, 6, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(277, 12, 3, 1, NULL, '19', 'false', '2023-05-24 18:46:45', '2023-05-24 18:46:45', NULL),
(278, 11, 8, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(279, 11, 5, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(280, 11, 1, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(281, 11, 4, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(282, 11, 2, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(283, 11, 7, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(284, 11, 6, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(285, 11, 3, 1, NULL, '19', 'false', '2023-05-24 18:48:03', '2023-05-24 18:48:03', NULL),
(300, 13, 8, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(301, 13, 5, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(302, 13, 1, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(303, 13, 4, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(304, 13, 2, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(305, 13, 7, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(306, 13, 6, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(307, 13, 3, 1, NULL, '19', 'false', '2023-05-24 19:41:34', '2023-05-24 19:41:34', NULL),
(312, 10, 8, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(313, 10, 5, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(314, 10, 1, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(315, 10, 4, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(316, 10, 2, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(317, 10, 7, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(318, 10, 6, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(319, 10, 3, 1, NULL, '19', 'false', '2023-05-26 17:48:46', '2023-05-26 17:48:46', NULL),
(326, 28, 3, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(327, 28, 4, 1, NULL, '19', 'false', '2023-12-19 17:08:04', '2023-12-19 17:08:04', NULL),
(335, 18, 1, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(336, 18, 2, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(337, 18, 3, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(338, 18, 4, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(339, 18, 5, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(340, 18, 6, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(341, 18, 7, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(342, 18, 8, 1, NULL, '19', 'false', '2023-12-19 17:09:53', '2023-12-19 17:09:53', NULL),
(351, 33, 17, 1, NULL, '19', 'false', '2023-12-19 23:29:25', '2023-12-19 23:29:25', NULL),
(352, 32, 16, 1, NULL, '19', 'false', '2023-12-19 23:29:44', '2023-12-19 23:29:44', NULL),
(353, 31, 15, 1, NULL, '19', 'false', '2023-12-19 23:30:01', '2023-12-19 23:30:01', NULL),
(354, 29, 1, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(355, 29, 2, 1, NULL, '19', 'false', '2023-12-19 23:30:16', '2023-12-19 23:30:16', NULL),
(356, 27, 5, 1, NULL, '19', 'false', '2023-12-19 23:30:36', '2023-12-19 23:30:36', NULL),
(357, 21, 8, 1, NULL, '19', 'false', '2023-12-19 23:31:34', '2023-12-19 23:31:34', NULL),
(358, 19, 3, 1, NULL, '19', 'false', '2023-12-19 23:32:28', '2023-12-19 23:32:28', NULL),
(359, 24, 6, 1, NULL, '19', 'false', '2023-12-19 23:33:32', '2023-12-19 23:33:32', NULL),
(360, 23, 7, 1, NULL, '19', 'false', '2023-12-19 23:33:55', '2023-12-19 23:33:55', NULL),
(361, 22, 5, 1, NULL, '19', 'false', '2023-12-19 23:34:22', '2023-12-19 23:34:22', NULL),
(362, 20, 8, 1, NULL, '19', 'false', '2023-12-19 23:34:57', '2023-12-19 23:34:57', NULL),
(364, 4, 7, 1, NULL, '19', 'false', '2023-12-19 23:36:30', '2023-12-19 23:36:30', NULL),
(365, 34, 18, 1, NULL, '19', 'false', '2023-12-20 00:45:18', '2023-12-20 00:45:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_organizations`
--

CREATE TABLE `group_organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `GroupID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_organizations`
--

INSERT INTO `group_organizations` (`id`, `GroupID`, `OrganizationID`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 3, 5, 1, '6', '6', 'false', '2022-12-06 15:55:52', '2022-12-08 18:59:04', '2022-12-08 18:59:04'),
(4, 4, 5, 1, '11', NULL, 'false', '2022-12-07 14:40:39', '2022-12-08 18:59:08', '2022-12-08 18:59:08'),
(5, 4, 3, 1, '11', NULL, 'true', '2022-12-07 14:40:46', '2022-12-07 14:41:37', NULL),
(6, 4, 6, 1, '11', '11', 'false', '2022-12-07 14:40:50', '2022-12-08 18:59:09', '2022-12-08 18:59:09'),
(7, 4, 6, 1, '11', NULL, 'false', '2022-12-07 14:40:58', '2022-12-07 14:40:58', NULL),
(9, 4, 7, 1, '11', NULL, 'false', '2022-12-07 14:41:08', '2022-12-08 18:59:01', '2022-12-08 18:59:01'),
(10, 4, 4, 1, '1', NULL, 'false', '2022-12-08 12:39:36', '2022-12-08 12:42:43', '2022-12-08 12:42:43'),
(12, 3, 4, 1, '1', NULL, 'false', '2022-12-08 12:45:09', '2022-12-08 12:45:09', NULL),
(14, 10, 14, 1, '6', '11', 'false', '2022-12-08 14:31:37', '2023-01-10 15:14:10', NULL),
(15, 3, 3, 1, '6', '6', 'false', '2022-12-08 14:31:42', '2022-12-08 18:59:23', NULL),
(16, 10, 6, 1, '6', '6', 'false', '2022-12-08 14:31:47', '2022-12-08 18:59:31', NULL),
(18, 10, 8, 1, '6', NULL, 'false', '2022-12-08 18:58:49', '2022-12-08 18:58:49', NULL),
(19, 11, 2, 1, '6', NULL, 'false', '2022-12-20 23:09:11', '2022-12-20 23:09:11', NULL),
(20, 11, 14, 1, '6', NULL, 'false', '2022-12-20 23:09:38', '2022-12-20 23:09:38', NULL),
(21, 11, 4, 1, '11', '11', 'false', '2022-12-27 16:34:33', '2023-01-10 15:14:22', NULL),
(23, 11, 10, 1, '11', NULL, 'false', '2022-12-27 17:48:09', '2022-12-27 17:48:09', NULL),
(24, 10, 12, 1, '11', '11', 'false', '2022-12-27 17:48:15', '2022-12-30 18:33:03', NULL),
(25, 11, 10, 1, '11', NULL, 'false', '2022-12-30 18:14:31', '2022-12-30 18:14:31', NULL),
(26, 3, 12, 1, '11', '11', 'false', '2022-12-30 18:25:11', '2022-12-30 18:32:53', NULL),
(27, 11, 12, 1, '11', '11', 'false', '2022-12-30 18:25:16', '2022-12-30 18:36:15', NULL),
(28, 4, 12, 1, '11', NULL, 'false', '2022-12-30 18:35:53', '2022-12-30 18:35:53', NULL),
(30, 4, 14, 1, '11', '11', 'false', '2023-01-03 17:15:17', '2023-01-10 15:15:11', NULL),
(31, 10, 9, 1, '11', NULL, 'false', '2023-01-03 17:15:23', '2023-01-03 17:15:23', NULL),
(32, 12, 10, 1, '6', NULL, 'false', '2023-01-04 16:01:22', '2023-01-04 16:01:22', NULL),
(33, 12, 11, 1, '11', NULL, 'false', '2023-01-04 18:00:47', '2023-01-04 18:00:47', NULL),
(34, 10, 10, 1, '11', NULL, 'false', '2023-01-09 19:46:49', '2023-01-09 19:46:49', NULL),
(35, 12, 14, 1, '11', NULL, 'false', '2023-01-10 13:59:19', '2023-01-10 13:59:19', NULL),
(36, 13, 15, 1, '6', NULL, 'false', '2023-01-11 12:57:33', '2023-01-11 12:57:33', NULL),
(37, 13, 11, 1, '6', NULL, 'false', '2023-01-11 12:59:19', '2023-01-11 12:59:19', NULL),
(38, 13, 12, 1, '11', NULL, 'false', '2023-01-11 13:39:08', '2023-01-11 13:39:08', NULL),
(39, 13, 10, 1, '11', NULL, 'false', '2023-01-11 13:39:14', '2023-01-11 13:39:14', NULL),
(40, 14, 4, 1, '11', NULL, 'false', '2023-01-14 19:55:14', '2023-01-14 19:55:14', NULL),
(41, 14, 2, 1, '11', NULL, 'false', '2023-01-14 19:55:32', '2023-01-14 19:55:32', NULL),
(42, 14, 8, 1, '11', NULL, 'false', '2023-01-14 19:57:11', '2023-01-14 19:57:11', NULL),
(43, 12, 15, 1, '6', NULL, 'false', '2023-01-17 13:25:16', '2023-01-17 13:25:16', NULL),
(45, 14, 15, 1, '11', NULL, 'false', '2023-01-17 13:41:32', '2023-01-17 13:41:32', NULL),
(47, 13, 8, 1, '11', NULL, 'false', '2023-01-20 15:10:25', '2023-01-20 15:10:25', NULL),
(48, 14, 11, 1, '11', NULL, 'false', '2023-01-20 15:10:43', '2023-01-20 15:10:43', NULL),
(49, 15, 15, 1, '11', NULL, 'false', '2023-01-20 15:27:26', '2023-01-20 15:27:26', NULL),
(50, 15, 9, 1, '11', NULL, 'false', '2023-01-20 15:27:43', '2023-01-20 15:27:43', NULL),
(51, 15, 13, 1, '11', NULL, 'false', '2023-01-20 15:27:51', '2023-01-20 15:27:51', NULL),
(52, 15, 14, 1, '11', NULL, 'false', '2023-01-20 15:27:58', '2023-01-20 15:27:58', NULL),
(59, 14, 19, 1, '6', NULL, 'false', '2023-01-24 19:46:05', '2023-01-24 19:46:05', NULL),
(60, 15, 19, 1, '6', NULL, 'false', '2023-01-24 19:46:15', '2023-01-24 19:46:15', NULL),
(67, 18, 20, 1, NULL, '11', 'false', '2023-01-27 18:44:12', '2023-01-27 18:44:12', NULL),
(73, 19, 8, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(74, 19, 12, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(75, 19, 20, 1, NULL, '11', 'false', '2023-01-30 14:39:21', '2023-01-30 14:39:21', NULL),
(76, 20, 11, 1, '11', NULL, 'false', '2023-02-09 13:47:03', '2023-02-09 13:47:03', NULL),
(77, 20, 8, 1, '11', NULL, 'false', '2023-02-09 13:47:03', '2023-02-09 13:47:03', NULL),
(79, 21, 21, 1, NULL, '1', 'false', '2023-02-24 22:30:46', '2023-02-24 22:30:46', NULL),
(83, 22, 16, 1, NULL, '6', 'false', '2023-03-14 17:36:02', '2023-03-14 17:36:02', NULL),
(85, 17, 8, 1, NULL, '1', 'false', '2023-03-22 05:47:23', '2023-03-22 05:47:23', NULL),
(88, 16, 19, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(89, 16, 18, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(90, 16, 17, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(91, 16, 16, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(92, 16, 15, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(93, 16, 10, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(94, 16, 9, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(95, 16, 8, 1, NULL, '1', 'false', '2023-04-11 18:55:53', '2023-04-11 18:55:53', NULL),
(96, 1, 15, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(97, 1, 14, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(98, 1, 12, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(99, 1, 9, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(100, 1, 8, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(101, 1, 4, 1, NULL, '1', 'false', '2023-04-12 06:11:24', '2023-04-12 06:11:24', NULL),
(108, 23, 8, 1, NULL, '1', 'false', '2023-04-28 15:56:31', '2023-04-28 15:56:31', NULL),
(110, 24, 22, 1, NULL, '1', 'false', '2023-04-28 15:58:27', '2023-04-28 15:58:27', NULL),
(129, 2, 4, 1, NULL, '1', 'false', '2023-05-05 16:12:42', '2023-05-05 16:12:42', NULL),
(148, 25, 23, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(149, 25, 22, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(150, 25, 21, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(151, 25, 20, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(152, 25, 19, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(153, 25, 18, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(154, 25, 17, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(155, 25, 16, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(156, 25, 15, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(157, 25, 14, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(158, 25, 13, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(159, 25, 12, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(160, 25, 11, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(161, 25, 10, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(162, 25, 9, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(163, 25, 8, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(164, 25, 4, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(165, 25, 2, 1, NULL, '37', 'false', '2023-05-12 05:21:06', '2023-05-12 05:21:06', NULL),
(184, 26, 23, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(185, 26, 22, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(186, 26, 21, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(187, 26, 20, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(188, 26, 19, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(189, 26, 18, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(190, 26, 17, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(191, 26, 16, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(192, 26, 15, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(193, 26, 14, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(194, 26, 13, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(195, 26, 12, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(196, 26, 11, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(197, 26, 10, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(198, 26, 9, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(199, 26, 8, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(200, 26, 4, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(201, 26, 2, 1, NULL, '37', 'false', '2023-05-12 05:35:45', '2023-05-12 05:35:45', NULL),
(202, 27, 23, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(203, 27, 22, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(204, 27, 21, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(205, 27, 20, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(206, 27, 19, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(207, 27, 18, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(208, 27, 17, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(209, 27, 16, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(210, 27, 15, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(211, 27, 14, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(212, 27, 13, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(213, 27, 12, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(214, 27, 11, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(215, 27, 10, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(216, 27, 9, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(217, 27, 8, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(218, 27, 4, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(219, 27, 2, 1, '37', NULL, 'false', '2023-05-12 05:39:30', '2023-05-12 05:39:30', NULL),
(220, 28, 10, 1, '1', NULL, 'false', '2023-05-12 14:11:14', '2023-05-12 14:11:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `is_watches`
--

CREATE TABLE `is_watches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_watch` tinyint(1) NOT NULL DEFAULT 0,
  `device_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `is_watches`
--

INSERT INTO `is_watches` (`id`, `is_watch`, `device_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1122', '2023-02-14 00:15:55', '2023-02-14 00:29:02'),
(2, 1, '11223', '2023-02-14 00:29:34', '2023-02-14 00:29:51'),
(3, 1, 'goldfish_x86_64', '2023-02-14 00:34:05', '2023-02-14 00:34:24'),
(4, 1, 'a32', '2023-02-14 15:43:22', '2023-02-14 15:43:35'),
(5, 1, 'spes', '2023-02-14 15:59:51', '2023-02-14 16:00:21'),
(6, 1, 'exynos2100', '2023-02-15 04:13:25', '2023-02-15 04:13:38'),
(7, 1, 'cutf', '2023-02-15 06:19:26', '2023-02-15 06:19:34'),
(8, 1, 'mid1035a_mq', '2023-02-15 08:33:21', '2023-02-15 08:33:44'),
(9, 1, 'iPhone13,3', '2023-02-15 18:52:35', '2023-02-15 18:52:42'),
(10, 1, 'iPhone10,2', '2023-02-15 18:52:59', '2023-02-15 18:53:10'),
(11, 1, 'iPhone12,8', '2023-02-15 19:03:13', '2023-02-15 19:03:20'),
(12, 1, 'iPhone8,2', '2023-02-15 19:05:52', '2023-02-15 19:06:03'),
(13, 1, 'iPhone13,4', '2023-02-15 21:51:55', '2023-02-15 21:52:12'),
(14, 1, 'iPhone10,1', '2023-02-15 23:16:43', '2023-02-15 23:16:51'),
(15, 1, 'iPhone13,2', '2023-02-16 17:44:49', '2023-02-16 17:44:56'),
(16, 1, 'iPhone11,8', '2023-02-16 21:00:04', '2023-02-16 21:00:11'),
(17, 1, 'iPhone12,5', '2023-02-17 00:36:14', '2023-02-17 00:36:20'),
(18, 1, 'iPhone11,2', '2023-02-18 01:08:04', '2024-03-22 10:38:01'),
(19, 1, 'iPhone14,3', '2023-02-22 00:27:25', '2024-03-22 18:29:45'),
(20, 1, 'lahaina', '2023-02-22 00:35:45', '2023-02-22 00:35:54'),
(21, 0, 'iPad7,3', '2023-02-22 02:46:16', '2023-02-22 02:46:16'),
(22, 1, 'msmnile', '2023-02-22 06:02:55', '2023-02-22 06:03:02'),
(23, 1, 'TECNO-KC2', '2023-02-22 18:20:20', '2023-02-22 18:20:46'),
(24, 0, 'iPhone14,4', '2023-02-23 01:27:04', '2023-02-23 01:27:04'),
(25, 1, 'goldfish_arm64', '2023-02-28 12:15:41', '2023-02-28 12:15:58'),
(26, 0, 'iPhone10,3', '2023-03-02 23:15:39', '2023-03-02 23:15:39'),
(27, 0, 'bullhead', '2023-03-06 16:26:56', '2023-03-06 16:26:56'),
(28, 1, 'iPhone14,6', '2023-03-07 19:35:11', '2024-05-21 05:32:37'),
(29, 1, 'QC_Reference_Phone', '2023-03-08 12:14:50', '2023-03-08 15:48:25'),
(30, 0, 'iPhone14,2', '2023-03-08 23:13:22', '2023-03-08 23:13:22'),
(31, 0, 'iPhone12,3', '2023-03-09 14:51:04', '2023-03-09 14:51:04'),
(32, 1, 'iPhone11,6', '2023-03-10 04:28:38', '2024-03-24 03:18:16'),
(33, 1, 'iPhone14,5', '2023-03-16 04:19:28', '2024-06-27 21:39:41'),
(34, 1, 'goldfish_x86', '2023-03-17 00:23:09', '2023-03-17 00:34:43'),
(35, 1, 'iPhone12,1', '2023-03-22 18:16:42', '2024-09-08 03:25:09'),
(36, 0, 'iPhone13,1', '2023-03-27 18:24:37', '2023-03-27 18:24:37'),
(37, 1, 'taimen', '2023-04-06 04:47:49', '2023-04-06 04:47:56'),
(38, 1, 'ot8', '2023-04-15 15:51:21', '2023-04-15 15:51:31'),
(39, 1, 'taro', '2023-04-20 03:49:02', '2023-04-20 04:00:32'),
(40, 1, 'kona', '2023-04-28 05:17:58', '2023-04-28 05:18:06'),
(41, 1, 'trona', '2023-04-28 19:21:39', '2023-04-28 19:21:47'),
(42, 1, 'amar_row_wifi', '2023-05-10 14:54:21', '2023-05-10 14:54:29'),
(43, 1, 'panther', '2023-05-22 17:58:58', '2023-05-22 17:59:06'),
(44, 1, 'tb8168p1_64_bsp', '2023-06-12 23:34:12', '2023-06-12 23:34:20'),
(45, 1, 'berlna', '2023-06-13 02:06:20', '2023-06-13 02:06:27'),
(46, 0, 'iPhone9,3', '2023-06-19 14:50:09', '2023-06-19 14:50:09'),
(47, 1, 'universal3475', '2023-06-30 05:15:36', '2023-06-30 05:15:46'),
(48, 0, 'iPhone15,2', '2023-09-20 18:16:58', '2023-09-20 18:16:58'),
(49, 0, 'iPhone14,7', '2023-12-21 19:39:18', '2023-12-21 19:39:18'),
(50, 1, 'iPad12,2', '2023-12-22 06:38:30', '2024-05-23 19:29:01'),
(51, 1, 'iPhone16,2', '2023-12-22 10:22:12', '2024-03-22 18:30:04'),
(52, 0, 'curtana', '2023-12-22 19:07:45', '2023-12-22 19:07:45'),
(53, 1, 'pineapple', '2024-05-07 20:23:42', '2024-05-07 20:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(49, 'default', '{\"uuid\":\"1af8f3f9-9c43-4489-b855-2ba227490218\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:22:\\\"zydezec@mailinator.com\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"djTojmooay\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678098404, 1678098404),
(50, 'default', '{\"uuid\":\"5b8bbc9c-c981-4c72-bf67-d6f1d182f9eb\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:16:\\\"hamza@oip.com.pk\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"kMHRhyvLIp\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678098409, 1678098409),
(51, 'default', '{\"uuid\":\"b22bdcf9-6179-48bb-a199-53a102eeaecc\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:26:\\\"muhammad.hannan@oip.com.pk\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"e1auI3vLIs\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678098417, 1678098417),
(52, 'default', '{\"uuid\":\"8ba482ed-efab-423e-beab-53c9ba1fe9a4\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:26:\\\"muhammad.hannan@oip.com.pk\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"ZV8AGeSkPO\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678114039, 1678114039),
(53, 'default', '{\"uuid\":\"00135380-94a8-4168-828b-5defc8789fd2\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:26:\\\"muhammad.hannan@oip.com.pk\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"DpP1QuM41x\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678114204, 1678114204),
(54, 'default', '{\"uuid\":\"85b73a1b-28a5-4634-900b-5950a27d83ed\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:21:\\\"hofik87494@orgria.com\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"FA7UkMj8K3\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"hofik87494@orgria.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678114503, 1678114503),
(55, 'default', '{\"uuid\":\"2ff7d74c-bfdf-4d53-95c4-7df404da8b14\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:21:\\\"suzatute@ema-sofia.eu\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"ZofuAE1ADb\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"suzatute@ema-sofia.eu\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678114536, 1678114536),
(56, 'default', '{\"uuid\":\"1e51b346-b961-4fda-ab18-6b8337012bba\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:22:\\\"mexajex163@terkoer.com\\\";s:4:\\\"body\\\";s:10:\\\"38VskJeluY\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678115107, 1678115107),
(57, 'default', '{\"uuid\":\"309a81a8-c389-486f-865d-276d4cfb510b\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:23:\\\"bevow48159@proexbol.com\\\";s:4:\\\"body\\\";s:10:\\\"7aGrwsUssD\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"bevow48159@proexbol.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678115215, 1678115215),
(58, 'default', '{\"uuid\":\"145c4ebb-afa1-4c9c-8e23-25142687b151\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:21:\\\"wasewok613@luxeic.com\\\";s:4:\\\"body\\\";s:10:\\\"uZSXfpqYRt\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"wasewok613@luxeic.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678115411, 1678115411),
(59, 'default', '{\"uuid\":\"da15d8ba-1ba7-46f6-9a1d-d11237541b4f\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPasswordMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\FacilitatorPasswordMail\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:22:\\\"niceram445@terkoer.com\\\";s:4:\\\"body\\\";s:10:\\\"5bCHY91JU9\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"niceram445@terkoer.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678115661, 1678115661),
(60, 'default', '{\"uuid\":\"bfdc192c-0395-42aa-b92e-7d9f60144fe9\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPasswordMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\FacilitatorPasswordMail\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:22:\\\"xifed71555@rolenot.com\\\";s:4:\\\"body\\\";s:10:\\\"HBdD9o28xt\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"xifed71555@rolenot.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678115734, 1678115734),
(61, 'default', '{\"uuid\":\"357dadbd-0d75-4cd6-90ed-de40331fdbb9\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPasswordMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\FacilitatorPasswordMail\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:21:\\\"majiba5356@gpipes.com\\\";s:4:\\\"body\\\";s:10:\\\"aKVZDYq9IE\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"majiba5356@gpipes.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678184095, 1678184095),
(62, 'default', '{\"uuid\":\"fe469d42-1bc5-4010-b22b-19fc6067745f\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:21:\\\"mojem90492@luxeic.com\\\";s:4:\\\"body\\\";s:10:\\\"bSXPwxXfAm\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"mojem90492@luxeic.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678185065, 1678185065),
(63, 'default', '{\"uuid\":\"065d3fc4-5380-408d-92e6-1118039119cd\",\"displayName\":\"App\\\\Mail\\\\FacilitatorPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\FacilitatorPassword\\\":29:{s:7:\\\"details\\\";a:2:{s:5:\\\"title\\\";s:21:\\\"mojem90492@luxeic.com\\\";s:4:\\\"body\\\";s:10:\\\"kfnAt9HuSd\\\";}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"mojem90492@luxeic.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678185117, 1678185117),
(64, 'default', '{\"uuid\":\"59f85a87-c0d5-4c24-91f9-89a0501a6e54\",\"displayName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\SendFacilitatorPasswordJob\\\":11:{s:7:\\\"details\\\";a:2:{s:5:\\\"email\\\";s:22:\\\"tagaf37657@maazios.com\\\";s:20:\\\"facilitator_password\\\";s:10:\\\"zFh0mjrJtB\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1678187237, 1678187237);

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `LicenseTypeID` int(10) UNSIGNED DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Expires` date DEFAULT NULL,
  `is_expire` enum('true','false') NOT NULL DEFAULT 'false',
  `IsActive` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `OrganizationID`, `LicenseTypeID`, `StartDate`, `Expires`, `is_expire`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 4, '2023-01-01', '2023-08-04', 'true', 1, 1, '1', '37', 'false', '2023-02-17 20:15:28', '2023-08-05 08:00:01', NULL),
(2, 16, 1, '2023-02-01', '2023-02-28', 'true', 1, 1, '1', NULL, 'false', '2023-02-24 12:32:55', '2023-04-04 11:49:01', NULL),
(3, 15, 1, '2023-03-06', '2023-10-06', 'true', 1, 1, '1', NULL, 'false', '2023-03-06 13:17:47', '2023-10-07 08:00:02', NULL),
(4, 8, 1, '2023-03-17', '2023-10-31', 'true', 1, 1, '1', '37', 'false', '2023-03-17 14:11:27', '2023-11-01 08:00:03', NULL),
(5, 22, 2, '2023-03-21', '2023-04-06', 'true', 1, 1, '1', '1', 'false', '2023-03-22 04:55:31', '2023-04-07 08:00:02', NULL),
(6, 4, 3, '2023-03-29', '2026-06-28', 'false', 1, 1, '1', '19', 'false', '2023-03-29 08:37:48', '2024-05-06 05:46:52', NULL),
(7, 12, 1, '2023-04-08', '2030-01-01', 'false', 1, 1, '1', '19', 'false', '2023-04-06 04:49:24', '2024-04-28 14:22:25', NULL),
(8, 10, 3, '2023-05-07', '2024-06-01', 'true', 1, 1, '1', '19', 'false', '2023-04-11 20:41:12', '2024-06-02 08:00:02', NULL),
(9, 23, 3, '2023-03-28', '2023-04-05', 'true', 1, 1, '1', NULL, 'false', '2023-04-14 06:08:17', '2023-04-14 08:00:01', NULL),
(10, 21, 1, '2023-05-01', '2023-05-02', 'true', 1, 1, '1', '1', 'false', '2023-05-04 18:41:36', '2023-05-05 08:00:02', NULL),
(11, 24, 3, '2023-01-01', '2050-12-31', 'false', 1, 1, '19', NULL, 'false', '2023-09-08 22:18:19', '2023-09-08 22:18:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

CREATE TABLE `license_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Subscription` tinyint(1) DEFAULT NULL,
  `Facilitators` int(11) DEFAULT NULL,
  `Participants` int(11) DEFAULT NULL,
  `DurationDays` int(11) DEFAULT NULL,
  `number_of_devices_login` int(11) DEFAULT 2,
  `IsActive` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `Cost` double(8,2) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `license_types`
--

INSERT INTO `license_types` (`id`, `Name`, `Subscription`, `Facilitators`, `Participants`, `DurationDays`, `number_of_devices_login`, `IsActive`, `Cost`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'License', 1, 50, 1000, 35, 50, 1, NULL, 1, '1', '19', 'false', '2023-02-17 20:15:04', '2023-12-20 00:39:52', NULL),
(2, '1 Facilitator, 8 Participant, 1 day, 1 device', 1, 1, 8, 1, 1, 1, NULL, 1, '1', '37', 'false', '2023-03-22 04:46:19', '2023-05-05 04:30:43', NULL),
(3, 'Spectrum 8 Events', 0, 100, 9999, 1, 1000, 1, NULL, 1, '1', '19', 'false', '2023-03-29 08:30:52', '2023-09-08 22:17:12', NULL),
(4, '1 Facilitator, 1 Participant, 1 day, 1 device', 1, 1, 1, 1, 100, 1, NULL, 1, '37', '1', 'false', '2023-05-05 04:26:50', '2023-05-05 19:14:34', NULL),
(5, 'abcd', 1, 123, 123, NULL, 123, 1, NULL, 1, '1', '1', 'false', '2023-05-05 15:52:41', '2023-05-05 15:52:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_28_093307_create_role_table', 1),
(6, '2022_06_08_065059_create_assessment_types_table', 1),
(7, '2022_06_08_070901_create_colors_table', 1),
(8, '2022_06_09_065049_create_assessments_table', 1),
(9, '2022_06_27_093629_create_grades_table', 1),
(10, '2022_11_17_073517_create_jobs_table', 1),
(11, '2022_11_18_111904_create_classes_table', 1),
(12, '2022_11_18_115001_create_genders_table', 1),
(13, '2022_11_18_120004_create_assessment_evaluates_table', 1),
(14, '2022_11_18_120152_create_ninty_fives_table', 1),
(15, '2022_11_18_120615_create_contact_types_table', 1),
(16, '2022_11_18_120707_create_organization_types_table', 1),
(17, '2022_11_21_095950_create_email_types_table', 1),
(18, '2022_11_21_100149_create_event_catagories_table', 1),
(19, '2022_11_21_100207_create_event_types_table', 1),
(20, '2022_11_22_071309_create_organizations_table', 1),
(21, '2022_11_22_115717_create_facilitators_table', 1),
(22, '2022_11_22_125200_create_facilitator_classes_table', 1),
(23, '2022_11_22_135234_create_participants_table', 1),
(24, '2022_11_22_143636_create_participant_emails_table', 1),
(25, '2022_11_22_153034_create_groups_table', 1),
(26, '2022_11_22_154317_create_group_organizations_table', 1),
(27, '2022_11_22_160441_create_group_facilitators_table', 1),
(28, '2022_11_23_064609_create_group_genders_table', 1),
(29, '2022_11_23_070030_create_group_grades_table', 1),
(30, '2022_11_23_071032_create_group_classes_table', 1),
(31, '2022_11_23_072245_create_contacts_table', 1),
(32, '2022_11_23_091323_create_events_table', 1),
(33, '2022_11_23_095936_create_event_assessments_table', 1),
(34, '2022_11_23_103606_create_assessment_results_table', 1),
(35, '2022_12_02_064813_create_faqs_table', 1),
(36, '2022_12_02_064824_create_settings_table', 1),
(37, '2022_12_02_071556_add__image_to_assessments_table', 1),
(38, '2022_12_02_120728_create_assessment_scorings_table', 1),
(39, '2022_12_02_134736_add__image_to_ninty_fives_table', 1),
(40, '2022_12_08_131149_add_otp_to_facilitators_table', 2),
(41, '2022_11_22_135233_create_participant_types_table', 3),
(42, '2022_12_26_101250_create_ninty_fives_table', 4),
(43, '2022_12_26_115218_create_event_organizations_table', 4),
(44, '2022_12_26_115247_create_event_facilitators_table', 4),
(45, '2022_12_27_070041_create_ninty_fives_table', 5),
(46, '2023_01_04_124808_create_genders_table', 6),
(47, '2023_01_24_091500_create_ninty_fives_table', 7),
(50, '2023_02_07_134454_create_user_roles_table', 8),
(51, '2023_02_08_133620_add_is_watch_to_facilitators_table', 9),
(52, '2023_02_09_071136_add_video_to_settings_table', 10),
(53, '2023_02_10_055209_create_is_watches_table', 11),
(54, '2023_02_13_095510_add_video_to_assessments_table', 12),
(55, '2023_02_16_093634_create_license_types_table', 13),
(56, '2023_02_16_094533_create_licenses_table', 14),
(57, '2023_02_22_074146_create_devices_table', 15),
(58, '2023_02_22_0741146_create_devices_table', 16),
(59, '2023_03_24_094532_add_device_name_to_devices_table', 17),
(61, '2023_04_04_065029_create_ninty_fives_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `ninty_fives`
--

CREATE TABLE `ninty_fives` (
  `AssessmentID` int(10) UNSIGNED DEFAULT NULL,
  `GradeID` int(10) UNSIGNED DEFAULT NULL,
  `GenderID` int(10) UNSIGNED DEFAULT NULL,
  `Percent` double(8,2) DEFAULT NULL,
  `UseSegment` tinyint(4) NOT NULL DEFAULT 0,
  `ColorSegment` double(8,2) DEFAULT NULL,
  `DistanceToRed` double(8,2) DEFAULT NULL,
  `RL` double(8,2) DEFAULT NULL,
  `RU` double(8,2) DEFAULT NULL,
  `BL` double(8,2) DEFAULT NULL,
  `BU` double(8,2) DEFAULT NULL,
  `GL` double(8,2) DEFAULT NULL,
  `GU` double(8,2) DEFAULT NULL,
  `OL` double(8,2) DEFAULT NULL,
  `OU` double(8,2) DEFAULT NULL,
  `VL` double(8,2) DEFAULT NULL,
  `VU` double(8,2) DEFAULT NULL,
  `YL` double(8,2) DEFAULT NULL,
  `YU` double(8,2) DEFAULT NULL,
  `PL` double(8,2) DEFAULT NULL,
  `PU` double(8,2) DEFAULT NULL,
  `WL` double(8,2) DEFAULT NULL,
  `WU` double(8,2) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ninty_fives`
--

INSERT INTO `ninty_fives` (`AssessmentID`, `GradeID`, `GenderID`, `Percent`, `UseSegment`, `ColorSegment`, `DistanceToRed`, `RL`, `RU`, `BL`, `BU`, `GL`, `GU`, `OL`, `OU`, `VL`, `VU`, `YL`, `YU`, `PL`, `PU`, `WL`, `WU`, `Image`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 16.42, 0, 0.00, 0.00, 0.00, 16.42, 16.43, 17.51, 17.52, 18.77, 18.78, 20.21, 20.22, 21.89, 21.90, 23.88, 23.89, 26.27, 26.28, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 1, 2, 16.42, 0, 0.00, 0.00, 0.00, 16.42, 16.43, 17.51, 17.52, 18.77, 18.78, 20.21, 20.22, 21.89, 21.90, 23.88, 23.89, 26.27, 26.28, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 2, 1, 15.59, 0, 0.00, 0.00, 0.00, 15.59, 15.60, 16.63, 16.64, 17.82, 17.83, 19.19, 19.20, 20.79, 20.80, 22.68, 22.69, 24.94, 24.95, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 2, 2, 15.59, 0, 0.00, 0.00, 0.00, 15.59, 15.60, 16.63, 16.64, 17.82, 17.83, 19.19, 19.20, 20.79, 20.80, 22.68, 22.69, 24.94, 24.95, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 3, 1, 14.76, 0, 0.00, 0.00, 0.00, 14.76, 14.77, 15.74, 15.75, 16.87, 16.88, 18.17, 18.18, 19.68, 19.69, 21.47, 21.48, 23.62, 23.63, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 3, 2, 14.76, 0, 0.00, 0.00, 0.00, 14.76, 14.77, 15.74, 15.75, 16.87, 16.88, 18.17, 18.18, 19.68, 19.69, 21.47, 21.48, 23.62, 23.63, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 4, 1, 13.93, 0, 0.00, 0.00, 0.00, 13.93, 13.94, 14.86, 14.87, 15.92, 15.93, 17.14, 17.15, 18.57, 18.58, 20.26, 20.27, 22.29, 22.30, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 4, 2, 13.93, 0, 0.00, 0.00, 0.00, 13.93, 13.94, 14.86, 14.87, 15.92, 15.93, 17.14, 17.15, 18.57, 18.58, 20.26, 20.27, 22.29, 22.30, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 5, 1, 12.94, 0, 0.00, 0.00, 0.00, 12.94, 12.95, 13.80, 13.81, 14.79, 14.80, 15.93, 15.94, 17.25, 17.26, 18.82, 18.83, 20.70, 20.71, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 5, 2, 13.54, 0, 0.00, 0.00, 0.00, 13.54, 13.55, 14.44, 14.45, 15.47, 15.48, 16.66, 16.67, 18.05, 18.06, 19.69, 19.70, 21.66, 21.67, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 6, 1, 11.96, 0, 0.00, 0.00, 0.00, 11.96, 11.97, 12.76, 12.77, 13.67, 13.68, 14.72, 14.73, 15.95, 15.96, 17.40, 17.41, 19.14, 19.15, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 6, 2, 13.14, 0, 0.00, 0.00, 0.00, 13.14, 13.15, 14.02, 14.03, 15.02, 15.03, 16.17, 16.18, 17.52, 17.53, 19.11, 19.12, 21.02, 21.03, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 7, 1, 10.97, 0, 0.00, 0.00, 0.00, 10.97, 10.98, 11.70, 11.71, 12.54, 12.55, 13.50, 13.51, 14.63, 14.64, 15.96, 15.97, 17.55, 17.56, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 7, 2, 12.75, 0, 0.00, 0.00, 0.00, 12.75, 12.76, 13.60, 13.61, 14.57, 14.58, 15.69, 15.70, 17.00, 17.01, 18.55, 18.56, 20.40, 20.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 8, 1, 9.98, 0, 0.00, 0.00, 0.00, 9.98, 9.99, 10.65, 10.66, 11.41, 11.42, 12.28, 12.29, 13.31, 13.32, 14.52, 14.53, 15.97, 15.98, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 8, 2, 12.35, 0, 0.00, 0.00, 0.00, 12.35, 12.36, 13.17, 13.18, 14.11, 14.12, 15.20, 15.21, 16.47, 16.48, 17.96, 17.97, 19.76, 19.77, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 1, 1, 4.50, 1, 4.50, 4.50, 0.00, 4.50, 4.51, 4.80, 4.81, 5.14, 5.15, 5.54, 5.55, 6.00, 6.01, 6.55, 6.56, 7.20, 7.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 1, 2, 4.50, 1, 4.50, 4.50, 0.00, 4.50, 4.51, 4.80, 4.81, 5.14, 5.15, 5.54, 5.55, 6.00, 6.01, 6.55, 6.56, 7.20, 7.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 2, 1, 4.50, 1, 4.50, 4.50, 0.00, 4.50, 4.51, 4.80, 4.81, 5.14, 5.15, 5.54, 5.55, 6.00, 6.01, 6.55, 6.56, 7.20, 7.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 2, 2, 4.50, 1, 4.50, 4.50, 0.00, 4.50, 4.51, 4.80, 4.81, 5.14, 5.15, 5.54, 5.55, 6.00, 6.01, 6.55, 6.56, 7.20, 7.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 3, 1, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 3, 2, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 4, 1, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 4, 2, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 5, 1, 6.00, 1, 6.00, 6.00, 0.00, 6.00, 6.01, 6.40, 6.41, 6.86, 6.87, 7.38, 7.39, 8.00, 8.01, 8.73, 8.74, 9.60, 9.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 5, 2, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 6, 1, 6.00, 1, 6.00, 6.00, 0.00, 6.00, 6.01, 6.40, 6.41, 6.86, 6.87, 7.38, 7.39, 8.00, 8.01, 8.73, 8.74, 9.60, 9.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 6, 2, 5.50, 1, 5.50, 5.50, 0.00, 5.50, 5.51, 5.87, 5.88, 6.29, 6.30, 6.77, 6.78, 7.33, 7.34, 8.00, 8.01, 8.80, 8.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 7, 1, 6.50, 1, 6.50, 6.50, 0.00, 6.50, 6.51, 6.93, 6.94, 7.43, 7.44, 8.00, 8.01, 8.67, 8.68, 9.45, 9.46, 10.40, 10.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 7, 2, 6.00, 1, 6.00, 6.00, 0.00, 6.00, 6.01, 6.40, 6.41, 6.86, 6.87, 7.38, 7.39, 8.00, 8.01, 8.73, 8.74, 9.60, 9.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 8, 1, 6.50, 1, 6.50, 6.50, 0.00, 6.50, 6.51, 6.93, 6.94, 7.43, 7.44, 8.00, 8.01, 8.67, 8.68, 9.45, 9.46, 10.40, 10.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 8, 2, 6.00, 1, 6.00, 6.00, 0.00, 6.00, 6.01, 6.40, 6.41, 6.86, 6.87, 7.38, 7.39, 8.00, 8.01, 8.73, 8.74, 9.60, 9.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 1, 1, 4.39, 0, 0.00, 0.00, 0.00, 4.39, 4.40, 4.68, 4.69, 5.02, 5.03, 5.40, 5.41, 5.85, 5.86, 6.39, 6.40, 7.02, 7.03, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 1, 2, 4.39, 0, 0.00, 0.00, 0.00, 4.39, 4.40, 4.68, 4.69, 5.02, 5.03, 5.40, 5.41, 5.85, 5.86, 6.39, 6.40, 7.02, 7.03, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 2, 1, 4.21, 0, 0.00, 0.00, 0.00, 4.21, 4.22, 4.49, 4.50, 4.81, 4.82, 5.18, 5.19, 5.61, 5.62, 6.12, 6.13, 6.74, 6.75, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 2, 2, 4.21, 0, 0.00, 0.00, 0.00, 4.21, 4.22, 4.49, 4.50, 4.81, 4.82, 5.18, 5.19, 5.61, 5.62, 6.12, 6.13, 6.74, 6.75, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 3, 1, 4.03, 0, 0.00, 0.00, 0.00, 4.03, 4.04, 4.30, 4.31, 4.61, 4.62, 4.96, 4.97, 5.37, 5.38, 5.86, 5.87, 6.45, 6.46, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 3, 2, 4.03, 0, 0.00, 0.00, 0.00, 4.03, 4.04, 4.30, 4.31, 4.61, 4.62, 4.96, 4.97, 5.37, 5.38, 5.86, 5.87, 6.45, 6.46, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 4, 1, 3.85, 0, 0.00, 0.00, 0.00, 3.85, 3.86, 4.11, 4.12, 4.40, 4.41, 4.74, 4.75, 5.13, 5.14, 5.60, 5.61, 6.16, 6.17, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 4, 2, 3.85, 0, 0.00, 0.00, 0.00, 3.85, 3.86, 4.11, 4.12, 4.40, 4.41, 4.74, 4.75, 5.13, 5.14, 5.60, 5.61, 6.16, 6.17, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 5, 1, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 5, 2, 3.70, 0, 0.00, 0.00, 0.00, 3.70, 3.71, 3.95, 3.96, 4.23, 4.24, 4.55, 4.56, 4.93, 4.94, 5.38, 5.39, 5.92, 5.93, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 6, 1, 3.43, 0, 0.00, 0.00, 0.00, 3.43, 3.44, 3.66, 3.67, 3.92, 3.93, 4.22, 4.23, 4.57, 4.58, 4.99, 5.00, 5.49, 5.50, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 6, 2, 3.54, 0, 0.00, 0.00, 0.00, 3.54, 3.55, 3.78, 3.79, 4.05, 4.06, 4.36, 4.37, 4.72, 4.73, 5.15, 5.16, 5.66, 5.67, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 7, 1, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 7, 2, 3.39, 0, 0.00, 0.00, 0.00, 3.39, 3.40, 3.62, 3.63, 3.87, 3.88, 4.17, 4.18, 4.52, 4.53, 4.93, 4.94, 5.42, 5.43, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 8, 1, 3.14, 0, 0.00, 0.00, 0.00, 3.14, 3.15, 3.35, 3.36, 3.59, 3.60, 3.86, 3.87, 4.19, 4.20, 4.57, 4.58, 5.02, 5.03, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 8, 2, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 1, 1, 10.00, 1, 10.00, 10.00, 0.00, 10.00, 10.01, 10.67, 10.68, 11.43, 11.44, 12.31, 12.32, 13.33, 13.34, 14.55, 14.56, 16.00, 16.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 1, 2, 10.00, 1, 10.00, 10.00, 0.00, 10.00, 10.01, 10.67, 10.68, 11.43, 11.44, 12.31, 12.32, 13.33, 13.34, 14.55, 14.56, 16.00, 16.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 2, 1, 10.00, 1, 10.00, 10.00, 0.00, 10.00, 10.01, 10.67, 10.68, 11.43, 11.44, 12.31, 12.32, 13.33, 13.34, 14.55, 14.56, 16.00, 16.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 2, 2, 10.00, 1, 10.00, 10.00, 0.00, 10.00, 10.01, 10.67, 10.68, 11.43, 11.44, 12.31, 12.32, 13.33, 13.34, 14.55, 14.56, 16.00, 16.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 3, 1, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 3, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 4, 1, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 4, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 5, 1, 16.00, 1, 16.00, 16.00, 0.00, 16.00, 16.01, 17.07, 17.08, 18.29, 18.30, 19.69, 19.70, 21.33, 21.34, 23.27, 23.28, 25.60, 25.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 5, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 6, 1, 16.00, 1, 16.00, 16.00, 0.00, 16.00, 16.01, 17.07, 17.08, 18.29, 18.30, 19.69, 19.70, 21.33, 21.34, 23.27, 23.28, 25.60, 25.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 6, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 7, 1, 20.00, 1, 20.00, 20.00, 0.00, 20.00, 20.01, 21.33, 21.34, 22.86, 22.87, 24.62, 24.63, 26.67, 26.68, 29.09, 29.10, 32.00, 32.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 7, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 8, 1, 20.00, 1, 20.00, 20.00, 0.00, 20.00, 20.01, 21.33, 21.34, 22.86, 22.87, 24.62, 24.63, 26.67, 26.68, 29.09, 29.10, 32.00, 32.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 8, 2, 15.00, 1, 15.00, 15.00, 0.00, 15.00, 15.01, 16.00, 16.01, 17.14, 17.15, 18.46, 18.47, 20.00, 20.01, 21.82, 21.83, 24.00, 24.01, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 1, 1, 24.15, 0, 0.00, 0.00, 0.00, 24.15, 24.16, 25.76, 25.77, 27.60, 27.61, 29.72, 29.73, 32.20, 32.21, 35.13, 35.14, 38.64, 38.65, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 1, 2, 24.15, 0, 0.00, 0.00, 0.00, 24.15, 24.16, 25.76, 25.77, 27.60, 27.61, 29.72, 29.73, 32.20, 32.21, 35.13, 35.14, 38.64, 38.65, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 2, 1, 23.42, 0, 0.00, 0.00, 0.00, 23.42, 23.43, 24.98, 24.99, 26.77, 26.78, 28.82, 28.83, 31.23, 31.24, 34.07, 34.08, 37.47, 37.48, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 2, 2, 23.42, 0, 0.00, 0.00, 0.00, 23.42, 23.43, 24.98, 24.99, 26.77, 26.78, 28.82, 28.83, 31.23, 31.24, 34.07, 34.08, 37.47, 37.48, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 3, 1, 22.69, 0, 0.00, 0.00, 0.00, 22.69, 22.70, 24.20, 24.21, 25.93, 25.94, 27.93, 27.94, 30.25, 30.26, 33.00, 33.01, 36.30, 36.31, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 3, 2, 22.69, 0, 0.00, 0.00, 0.00, 22.69, 22.70, 24.20, 24.21, 25.93, 25.94, 27.93, 27.94, 30.25, 30.26, 33.00, 33.01, 36.30, 36.31, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 4, 1, 21.97, 0, 0.00, 0.00, 0.00, 21.97, 21.98, 23.43, 23.44, 25.11, 25.12, 27.04, 27.05, 29.29, 29.30, 31.96, 31.97, 35.15, 35.16, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 4, 2, 21.97, 0, 0.00, 0.00, 0.00, 21.97, 21.98, 23.43, 23.44, 25.11, 25.12, 27.04, 27.05, 29.29, 29.30, 31.96, 31.97, 35.15, 35.16, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 5, 1, 21.06, 0, 0.00, 0.00, 0.00, 21.06, 21.07, 22.46, 22.47, 24.07, 24.08, 25.92, 25.93, 28.08, 28.09, 30.63, 30.64, 33.70, 33.71, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 5, 2, 21.65, 0, 0.00, 0.00, 0.00, 21.65, 21.66, 23.09, 23.10, 24.74, 24.75, 26.65, 26.66, 28.87, 28.88, 31.49, 31.50, 34.64, 34.65, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 6, 1, 20.15, 0, 0.00, 0.00, 0.00, 20.15, 20.16, 21.49, 21.50, 23.03, 23.04, 24.80, 24.81, 26.87, 26.88, 29.31, 29.32, 32.24, 32.25, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 6, 2, 21.34, 0, 0.00, 0.00, 0.00, 21.34, 21.35, 22.76, 22.77, 24.39, 24.40, 26.26, 26.27, 28.45, 28.46, 31.04, 31.05, 34.14, 34.15, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 7, 1, 19.25, 0, 0.00, 0.00, 0.00, 19.25, 19.26, 20.53, 20.54, 22.00, 22.01, 23.69, 23.70, 25.67, 25.68, 28.00, 28.01, 30.80, 30.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 7, 2, 21.03, 0, 0.00, 0.00, 0.00, 21.03, 21.04, 22.43, 22.44, 24.03, 24.04, 25.88, 25.89, 28.04, 28.05, 30.59, 30.60, 33.65, 33.66, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 8, 1, 18.34, 0, 0.00, 0.00, 0.00, 18.34, 18.35, 19.56, 19.57, 20.96, 20.97, 22.57, 22.58, 24.45, 24.46, 26.68, 26.69, 29.34, 29.35, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 8, 2, 20.71, 0, 0.00, 0.00, 0.00, 20.71, 20.72, 22.09, 22.10, 23.67, 23.68, 25.49, 25.50, 27.61, 27.62, 30.12, 30.13, 33.14, 33.15, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 1, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 1, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 2, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 2, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 3, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 3, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 4, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 4, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 5, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 5, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 6, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 6, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 7, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 7, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 8, 1, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 8, 2, 8.00, 1, 8.00, 8.00, 0.00, 8.00, 8.01, 8.53, 8.54, 9.14, 9.15, 9.85, 9.86, 10.67, 10.68, 11.64, 11.65, 12.80, 12.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 1, 1, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.01, 14.93, 14.94, 16.00, 16.01, 17.23, 17.24, 18.67, 18.68, 20.36, 20.37, 22.40, 22.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 1, 2, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.01, 14.93, 14.94, 16.00, 16.01, 17.23, 17.24, 18.67, 18.68, 20.36, 20.37, 22.40, 22.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 2, 1, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.01, 14.93, 14.94, 16.00, 16.01, 17.23, 17.24, 18.67, 18.68, 20.36, 20.37, 22.40, 22.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 2, 2, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.01, 14.93, 14.94, 16.00, 16.01, 17.23, 17.24, 18.67, 18.68, 20.36, 20.37, 22.40, 22.41, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 3, 1, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.01, 13.87, 13.88, 14.86, 14.87, 16.00, 16.01, 17.33, 17.34, 18.91, 18.92, 20.80, 20.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 3, 2, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.01, 13.87, 13.88, 14.86, 14.87, 16.00, 16.01, 17.33, 17.34, 18.91, 18.92, 20.80, 20.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 4, 1, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.01, 13.87, 13.88, 14.86, 14.87, 16.00, 16.01, 17.33, 17.34, 18.91, 18.92, 20.80, 20.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 4, 2, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.01, 13.87, 13.88, 14.86, 14.87, 16.00, 16.01, 17.33, 17.34, 18.91, 18.92, 20.80, 20.81, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 5, 1, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.01, 12.80, 12.81, 13.71, 13.72, 14.77, 14.78, 16.00, 16.01, 17.45, 17.46, 19.20, 19.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 5, 2, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.01, 12.80, 12.81, 13.71, 13.72, 14.77, 14.78, 16.00, 16.01, 17.45, 17.46, 19.20, 19.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 6, 1, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.01, 12.80, 12.81, 13.71, 13.72, 14.77, 14.78, 16.00, 16.01, 17.45, 17.46, 19.20, 19.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 6, 2, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.01, 12.80, 12.81, 13.71, 13.72, 14.77, 14.78, 16.00, 16.01, 17.45, 17.46, 19.20, 19.21, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 7, 1, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.01, 11.73, 11.74, 12.57, 12.58, 13.54, 13.55, 14.67, 14.68, 16.00, 16.01, 17.60, 17.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 7, 2, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.01, 11.73, 11.74, 12.57, 12.58, 13.54, 13.55, 14.67, 14.68, 16.00, 16.01, 17.60, 17.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 8, 1, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.01, 11.73, 11.74, 12.57, 12.58, 13.54, 13.55, 14.67, 14.68, 16.00, 16.01, 17.60, 17.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 8, 2, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.01, 11.73, 11.74, 12.57, 12.58, 13.54, 13.55, 14.67, 14.68, 16.00, 16.01, 17.60, 17.61, 100.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(7, 1, 1, NULL, 1, 12.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 1, 2, NULL, 1, 12.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 2, 1, NULL, 1, 12.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 2, 2, NULL, 1, 12.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 3, 1, NULL, 1, 14.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 3, 2, NULL, 1, 14.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 4, 1, NULL, 1, 14.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 4, 2, NULL, 1, 14.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 5, 1, NULL, 1, 16.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 5, 2, NULL, 1, 16.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 6, 1, NULL, 1, 16.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 6, 2, NULL, 1, 16.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 7, 1, NULL, 1, 18.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 7, 2, NULL, 1, 18.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 8, 1, NULL, 1, 18.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(7, 8, 2, NULL, 1, 18.00, NULL, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-05-18 07:53:34', NULL, NULL),
(3, 15, 1, 2.93, 0, 0.00, 0.00, 0.00, 2.93, 2.94, 3.13, 3.14, 3.35, 3.36, 3.61, 3.62, 3.91, 3.92, 4.26, 4.27, 4.69, 4.70, 100.00, NULL, 1, '19', NULL, 'false', '2023-12-19 19:02:21', '2023-12-19 19:02:21', NULL),
(3, 16, 1, 2.84, 0, 0.00, 0.00, 0.00, 2.84, 2.85, 3.03, 3.04, 3.25, 3.26, 3.50, 3.51, 3.79, 3.80, 4.13, 4.14, 4.54, 4.55, 100.00, NULL, 1, '19', NULL, 'false', '2023-12-19 19:07:19', '2023-12-19 19:07:19', NULL),
(3, 17, 1, 2.76, 0, 0.00, 0.00, 0.00, 2.76, 2.77, 2.94, 2.95, 3.15, 3.16, 3.40, 3.41, 3.68, 3.69, 4.01, 4.02, 4.42, 4.43, 100.00, NULL, 1, '19', NULL, 'false', '2023-12-19 19:12:05', '2023-12-19 19:12:05', NULL),
(3, 18, 1, 2.67, 0, 0.00, 0.00, 0.00, 2.67, 2.68, 2.85, 2.86, 3.05, 3.06, 3.29, 3.30, 3.56, 3.57, 3.88, 3.89, 4.27, 4.28, 100.00, NULL, 1, '19', NULL, 'false', '2023-12-19 21:37:11', '2023-12-19 21:37:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ninty_fives_backup`
--

CREATE TABLE `ninty_fives_backup` (
  `AssessmentID` int(11) NOT NULL,
  `GradeID` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `GenderID` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `Percent` float NOT NULL,
  `UseSegment` tinyint(1) NOT NULL DEFAULT 0,
  `DistanceToRed` float GENERATED ALWAYS AS (round(cast(`Percent` as float),2) * `UseSegment`) VIRTUAL,
  `RL` float GENERATED ALWAYS AS (round(cast(0 as float),2)) VIRTUAL,
  `RU` float GENERATED ALWAYS AS (round(cast(`Percent` as float),2)) VIRTUAL,
  `BL` float GENERATED ALWAYS AS (round(cast(cast(`Percent` as float) + 0.01 as float),2)) VIRTUAL,
  `BU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 15 as float),2)) VIRTUAL,
  `GL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 15 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `GU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 14 as float),2)) VIRTUAL,
  `OL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 14 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `OU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 13 as float),2)) VIRTUAL,
  `VL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 13 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `VU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 12 as float),2)) VIRTUAL,
  `YL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 12 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `YU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 11 as float),2)) VIRTUAL,
  `PL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 11 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `PU` float GENERATED ALWAYS AS (round(cast(`Percent` * 16 / 10 as float),2)) VIRTUAL,
  `WL` float GENERATED ALWAYS AS (round(cast(cast(round(cast(`Percent` * 16 / 10 as float),2) as float) + 0.01 as float),2)) VIRTUAL,
  `WU` float GENERATED ALWAYS AS (round(cast(100 as float),2)) VIRTUAL,
  `Image` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ninty_fives_backup`
--

INSERT INTO `ninty_fives_backup` (`AssessmentID`, `GradeID`, `GenderID`, `Percent`, `UseSegment`, `Image`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 16.42, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 1, 2, 16.42, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 2, 1, 15.59, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 2, 2, 15.59, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 3, 1, 14.76, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 3, 2, 14.76, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 4, 1, 13.93, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 4, 2, 13.93, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 5, 1, 12.94, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 5, 2, 13.54, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 6, 1, 11.96, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 6, 2, 13.14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 7, 1, 10.97, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 7, 2, 12.75, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 8, 1, 9.98, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(1, 8, 2, 12.35, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 1, 1, 4.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 1, 2, 4.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 2, 1, 4.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 2, 2, 4.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 3, 1, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 3, 2, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 4, 1, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 4, 2, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 5, 1, 6, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 5, 2, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 6, 1, 6, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 6, 2, 5.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 7, 1, 6.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 7, 2, 6, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 8, 1, 6.5, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(2, 8, 2, 6, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 1, 1, 4.39, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 1, 2, 4.39, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 2, 1, 4.21, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 2, 2, 4.21, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 3, 1, 4.03, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 3, 2, 4.03, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 4, 1, 3.85, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 4, 2, 3.85, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 5, 1, 3.23, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 5, 2, 3.7, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 6, 1, 3.43, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 6, 2, 3.54, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 7, 1, 3.23, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 7, 2, 3.39, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 8, 1, 3.14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(3, 8, 2, 3.23, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 1, 1, 10, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 1, 2, 10, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 2, 1, 10, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 2, 2, 10, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 3, 1, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 3, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 4, 1, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 4, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 5, 1, 16, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 5, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 6, 1, 16, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 6, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 7, 1, 20, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 7, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 8, 1, 20, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(4, 8, 2, 15, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 1, 1, 24.15, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 1, 2, 24.15, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 2, 1, 23.42, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 2, 2, 23.42, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 3, 1, 22.69, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 3, 2, 22.69, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 4, 1, 21.97, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 4, 2, 21.97, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 5, 1, 21.06, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 5, 2, 21.65, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 6, 1, 20.15, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 6, 2, 21.34, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 7, 1, 19.25, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 7, 2, 21.03, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 8, 1, 18.34, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(5, 8, 2, 20.71, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 1, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 1, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 2, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 2, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 3, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 3, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 4, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 4, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 5, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 5, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 6, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 6, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 7, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 7, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 8, 1, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(6, 8, 2, 8, 1, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 1, 1, 14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 1, 2, 14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 2, 1, 14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 2, 2, 14, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 3, 1, 13, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 3, 2, 13, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 4, 1, 13, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 4, 2, 13, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 5, 1, 12, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 5, 2, 12, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 6, 1, 12, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 6, 2, 12, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 7, 1, 11, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 7, 2, 11, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 8, 1, 11, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL),
(8, 8, 2, 11, 0, NULL, 1, 'SPECTRUM', NULL, 'false', '2023-04-06 07:25:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ninty_fives_latest_backup`
--

CREATE TABLE `ninty_fives_latest_backup` (
  `AssessmentID` int(10) UNSIGNED DEFAULT NULL,
  `GradeID` int(10) UNSIGNED DEFAULT NULL,
  `GenderID` int(10) UNSIGNED DEFAULT NULL,
  `Percent` double(8,2) DEFAULT NULL,
  `UseSegment` tinyint(4) NOT NULL DEFAULT 0,
  `ColorSegment` double(8,2) DEFAULT NULL,
  `DistanceToRed` double(8,2) DEFAULT NULL,
  `RL` double(8,2) DEFAULT NULL,
  `RU` double(8,2) DEFAULT NULL,
  `BL` double(8,2) DEFAULT NULL,
  `BU` double(8,2) DEFAULT NULL,
  `GL` double(8,2) DEFAULT NULL,
  `GU` double(8,2) DEFAULT NULL,
  `OL` double(8,2) DEFAULT NULL,
  `OU` double(8,2) DEFAULT NULL,
  `VL` double(8,2) DEFAULT NULL,
  `VU` double(8,2) DEFAULT NULL,
  `YL` double(8,2) DEFAULT NULL,
  `YU` double(8,2) DEFAULT NULL,
  `PL` double(8,2) DEFAULT NULL,
  `PU` double(8,2) DEFAULT NULL,
  `WL` double(8,2) DEFAULT NULL,
  `WU` double(8,2) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ninty_fives_latest_backup`
--

INSERT INTO `ninty_fives_latest_backup` (`AssessmentID`, `GradeID`, `GenderID`, `Percent`, `UseSegment`, `ColorSegment`, `DistanceToRed`, `RL`, `RU`, `BL`, `BU`, `GL`, `GU`, `OL`, `OU`, `VL`, `VU`, `YL`, `YU`, `PL`, `PU`, `WL`, `WU`, `Image`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 16.42, 0, 0.00, 0.00, 0.00, 16.40, 16.40, 17.50, 17.50, 18.70, 18.70, 20.20, 20.20, 21.80, 21.90, 23.80, 23.80, 26.20, 26.20, 100.00, '', 1, '1', '6', 'false', '0000-00-00 00:00:00', '2023-05-17 01:59:48', NULL),
(1, 1, 2, 16.42, 0, 0.00, 0.00, 0.00, 16.40, 16.40, 17.50, 17.50, 18.70, 18.70, 20.20, 20.20, 21.80, 21.90, 23.80, 23.80, 26.20, 26.20, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 2, 1, 15.59, 0, 0.00, 0.00, 0.00, 15.50, 15.60, 16.60, 16.60, 17.80, 17.80, 19.10, 19.20, 20.70, 20.80, 22.60, 22.60, 24.90, 24.90, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 2, 2, 15.59, 0, 0.00, 0.00, 0.00, 15.50, 15.60, 16.60, 16.60, 17.80, 17.80, 19.10, 19.20, 20.70, 20.80, 22.60, 22.60, 24.90, 24.90, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 3, 1, 14.76, 0, 0.00, 0.00, 0.00, 14.70, 14.70, 15.70, 15.70, 16.80, 16.80, 18.10, 18.10, 19.60, 19.60, 21.40, 21.40, 23.60, 23.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 3, 2, 14.76, 0, 0.00, 0.00, 0.00, 14.70, 14.70, 15.70, 15.70, 16.80, 16.80, 18.10, 18.10, 19.60, 19.60, 21.40, 21.40, 23.60, 23.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 4, 1, 13.93, 0, 0.00, 0.00, 0.00, 13.90, 13.90, 14.80, 14.80, 15.90, 15.90, 17.10, 17.10, 18.50, 18.50, 20.20, 20.20, 22.20, 22.30, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 4, 2, 13.93, 0, 0.00, 0.00, 0.00, 13.90, 13.90, 14.80, 14.80, 15.90, 15.90, 17.10, 17.10, 18.50, 18.50, 20.20, 20.20, 22.20, 22.30, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 5, 1, 12.94, 0, 0.00, 0.00, 0.00, 12.90, 12.90, 13.80, 13.80, 14.70, 14.80, 15.90, 15.90, 17.20, 17.20, 18.80, 18.80, 20.70, 20.70, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 5, 2, 13.54, 0, 0.00, 0.00, 0.00, 13.50, 13.50, 14.40, 14.40, 15.40, 15.40, 16.60, 16.60, 18.00, 18.00, 19.60, 19.70, 21.60, 21.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 6, 1, 11.96, 0, 0.00, 0.00, 0.00, 11.90, 11.90, 12.70, 12.70, 13.60, 13.60, 14.70, 14.70, 15.90, 15.90, 17.40, 17.40, 19.10, 19.10, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 6, 2, 13.14, 0, 0.00, 0.00, 0.00, 13.10, 13.10, 14.00, 14.00, 15.00, 15.00, 16.10, 16.10, 17.50, 17.50, 19.10, 19.10, 21.00, 21.00, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 7, 1, 10.97, 0, 0.00, 0.00, 0.00, 10.90, 10.90, 11.70, 11.70, 12.50, 12.50, 13.50, 13.50, 14.60, 14.60, 15.90, 15.90, 17.50, 17.50, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 7, 2, 12.75, 0, 0.00, 0.00, 0.00, 12.70, 12.70, 13.60, 13.60, 14.50, 14.50, 15.60, 15.70, 17.00, 17.00, 18.50, 18.50, 20.40, 20.40, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(1, 8, 1, 9.98, 0, 0.00, 0.00, 0.00, 9.98, 9.99, 10.65, 10.65, 11.40, 11.40, 12.20, 12.20, 13.30, 13.30, 14.50, 14.50, 15.90, 15.90, 100.00, '', 1, '1', '6', 'false', '0000-00-00 00:00:00', '2023-04-28 05:42:48', NULL),
(1, 8, 2, 12.35, 0, 0.00, 0.00, 0.00, 12.30, 12.30, 13.10, 13.10, 14.10, 14.10, 15.20, 15.20, 16.40, 16.40, 17.90, 17.90, 19.70, 19.70, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 1, 1, 4.50, 1, 0.28, 4.50, 4.00, 100.00, 4.22, 4.49, 3.94, 4.21, 3.66, 3.93, 3.38, 3.65, 3.10, 3.37, 2.82, 3.09, 0.00, 2.81, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 1, 2, 4.50, 1, 0.28, 4.50, 4.00, 100.00, 4.22, 4.49, 3.94, 4.21, 3.66, 3.93, 3.38, 3.65, 3.10, 3.37, 2.82, 3.09, 0.00, 2.81, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 2, 1, 4.50, 1, 0.28, 4.50, 4.00, 100.00, 4.22, 4.49, 3.94, 4.21, 3.66, 3.93, 3.38, 3.65, 3.10, 3.37, 2.82, 3.09, 0.00, 2.81, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 2, 2, 4.50, 1, 0.28, 4.50, 4.00, 100.00, 4.22, 4.49, 3.94, 4.21, 3.66, 3.93, 3.38, 3.65, 3.10, 3.37, 2.82, 3.09, 0.00, 2.81, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 3, 1, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 3, 2, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 4, 1, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 4, 2, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 5, 1, 6.00, 1, 0.38, 6.00, 6.00, 100.00, 5.63, 5.99, 5.25, 5.62, 4.87, 5.25, 4.48, 4.86, 4.11, 4.47, 3.73, 4.10, 0.00, 3.72, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 5, 2, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 6, 1, 6.00, 1, 0.38, 6.00, 6.00, 100.00, 5.63, 5.99, 5.25, 5.62, 4.87, 5.25, 4.48, 4.86, 4.11, 4.47, 3.73, 4.10, 0.00, 3.72, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 6, 2, 5.50, 1, 0.34, 5.50, 5.00, 100.00, 5.16, 5.49, 4.82, 5.15, 4.48, 4.81, 4.14, 4.47, 3.80, 4.13, 3.46, 3.79, 0.00, 3.45, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 7, 1, 6.50, 1, 0.41, 6.50, 6.00, 100.00, 6.09, 6.49, 5.68, 6.08, 5.27, 5.67, 4.86, 5.26, 4.45, 4.85, 4.04, 4.44, 0.00, 4.03, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 7, 2, 6.00, 1, 0.38, 6.00, 6.00, 100.00, 5.63, 5.99, 5.25, 5.62, 4.87, 5.25, 4.48, 4.86, 4.11, 4.47, 3.73, 4.10, 0.00, 3.72, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 8, 1, 6.50, 1, 0.41, 6.50, 6.00, 100.00, 6.09, 6.49, 5.68, 6.08, 5.27, 5.67, 4.86, 5.26, 4.45, 4.85, 4.04, 4.44, 0.00, 4.03, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(2, 8, 2, 6.00, 1, 0.38, 6.00, 6.00, 100.00, 5.63, 5.99, 5.25, 5.62, 4.87, 5.25, 4.48, 4.86, 4.11, 4.47, 3.73, 4.10, 0.00, 3.72, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 1, 1, 4.39, 0, 0.00, 0.00, 0.00, 4.39, 4.40, 4.68, 4.69, 5.02, 5.03, 5.40, 5.41, 5.85, 5.86, 6.39, 6.40, 7.02, 7.03, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 1, 2, 4.39, 0, 0.00, 0.00, 0.00, 4.39, 4.40, 4.68, 4.69, 5.02, 5.03, 5.40, 5.41, 5.85, 5.86, 6.39, 6.40, 7.02, 7.03, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 2, 1, 4.21, 0, 0.00, 0.00, 0.00, 4.21, 4.22, 4.49, 4.50, 4.81, 4.82, 5.18, 5.19, 5.61, 5.62, 6.12, 6.13, 6.74, 6.75, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 2, 2, 4.21, 0, 0.00, 0.00, 0.00, 4.21, 4.22, 4.49, 4.50, 4.81, 4.82, 5.18, 5.19, 5.61, 5.62, 6.12, 6.13, 6.74, 6.75, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 3, 1, 4.03, 0, 0.00, 0.00, 0.00, 4.03, 4.04, 4.30, 4.31, 4.61, 4.62, 4.96, 4.97, 5.37, 5.38, 5.86, 5.87, 6.45, 6.46, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 3, 2, 4.03, 0, 0.00, 0.00, 0.00, 4.03, 4.04, 4.30, 4.31, 4.61, 4.62, 4.96, 4.97, 5.37, 5.38, 5.86, 5.87, 6.45, 6.46, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 4, 1, 3.85, 0, 0.00, 0.00, 0.00, 3.85, 3.86, 4.11, 4.12, 4.40, 4.41, 4.74, 4.75, 5.13, 5.14, 5.60, 5.61, 6.16, 6.17, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 4, 2, 3.85, 0, 0.00, 0.00, 0.00, 3.85, 3.86, 4.11, 4.12, 4.40, 4.41, 4.74, 4.75, 5.13, 5.14, 5.60, 5.61, 6.16, 6.17, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 5, 1, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 5, 2, 3.70, 0, 0.00, 0.00, 0.00, 3.70, 3.71, 3.95, 3.96, 4.23, 4.24, 4.55, 4.56, 4.93, 4.94, 5.38, 5.39, 5.92, 5.93, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 6, 1, 3.43, 0, 0.00, 0.00, 0.00, 3.43, 3.44, 3.66, 3.67, 3.92, 3.93, 4.22, 4.23, 4.57, 4.58, 4.99, 5.00, 5.49, 5.50, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 6, 2, 3.54, 0, 0.00, 0.00, 0.00, 3.54, 3.55, 3.78, 3.79, 4.05, 4.06, 4.36, 4.37, 4.72, 4.73, 5.15, 5.16, 5.66, 5.67, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 7, 1, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 7, 2, 3.39, 0, 0.00, 0.00, 0.00, 3.39, 3.40, 3.62, 3.63, 3.87, 3.88, 4.17, 4.18, 4.52, 4.53, 4.93, 4.94, 5.42, 5.43, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 8, 1, 3.14, 0, 0.00, 0.00, 0.00, 3.14, 3.15, 3.35, 3.36, 3.59, 3.60, 3.86, 3.87, 4.19, 4.20, 4.57, 4.58, 5.02, 5.03, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(3, 8, 2, 3.23, 0, 0.00, 0.00, 0.00, 3.23, 3.24, 3.45, 3.46, 3.69, 3.70, 3.98, 3.99, 4.31, 4.32, 4.70, 4.71, 5.17, 5.18, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 1, 1, 10.00, 1, 0.63, 10.00, 10.00, 100.00, 9.38, 9.99, 8.76, 9.37, 8.12, 8.75, 7.48, 8.11, 6.86, 7.47, 6.22, 6.85, 0.00, 6.21, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 1, 2, 10.00, 1, 0.63, 10.00, 10.00, 100.00, 9.38, 9.99, 8.76, 9.37, 8.12, 8.75, 7.48, 8.11, 6.86, 7.47, 6.22, 6.85, 0.00, 6.21, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 2, 1, 10.00, 1, 0.63, 10.00, 10.00, 100.00, 9.38, 9.99, 8.76, 9.37, 8.12, 8.75, 7.48, 8.11, 6.86, 7.47, 6.22, 6.85, 0.00, 6.21, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 2, 2, 10.00, 1, 0.63, 10.00, 10.00, 100.00, 9.38, 9.99, 8.76, 9.37, 8.12, 8.75, 7.48, 8.11, 6.86, 7.47, 6.22, 6.85, 0.00, 6.21, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 3, 1, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 3, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 4, 1, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 4, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 5, 1, 16.00, 1, 1.00, 16.00, 16.00, 100.00, 15.00, 15.90, 14.00, 14.90, 13.00, 13.90, 12.00, 12.90, 11.00, 11.90, 10.00, 10.90, 0.00, 9.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 5, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 6, 1, 16.00, 1, 1.00, 16.00, 16.00, 100.00, 15.00, 15.90, 14.00, 14.90, 13.00, 13.90, 12.00, 12.90, 11.00, 11.90, 10.00, 10.90, 0.00, 9.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 6, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 7, 1, 20.00, 1, 1.25, 20.00, 20.00, 100.00, 18.70, 19.90, 17.50, 18.70, 16.20, 17.40, 15.00, 16.20, 13.70, 14.90, 12.50, 13.70, 0.00, 12.40, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 7, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 8, 1, 20.00, 1, 1.25, 20.00, 20.00, 100.00, 18.70, 19.90, 17.50, 18.70, 16.20, 17.40, 15.00, 16.20, 13.70, 14.90, 12.50, 13.70, 0.00, 12.40, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(4, 8, 2, 15.00, 1, 0.94, 15.00, 15.00, 100.00, 14.00, 14.90, 13.10, 14.00, 12.10, 13.10, 11.20, 12.10, 10.30, 11.20, 9.36, 10.20, 0.00, 9.35, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 1, 1, 24.15, 0, 0.00, 0.00, 0.00, 24.10, 24.10, 25.70, 25.70, 27.60, 27.60, 29.70, 29.70, 32.20, 32.20, 35.10, 35.10, 38.60, 38.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 1, 2, 24.15, 0, 0.00, 0.00, 0.00, 24.10, 24.10, 25.70, 25.70, 27.60, 27.60, 29.70, 29.70, 32.20, 32.20, 35.10, 35.10, 38.60, 38.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 2, 1, 23.42, 0, 0.00, 0.00, 0.00, 23.40, 23.40, 24.90, 24.90, 26.70, 26.70, 28.80, 28.80, 31.20, 31.20, 34.00, 34.00, 37.40, 37.40, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 2, 2, 23.42, 0, 0.00, 0.00, 0.00, 23.40, 23.40, 24.90, 24.90, 26.70, 26.70, 28.80, 28.80, 31.20, 31.20, 34.00, 34.00, 37.40, 37.40, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 3, 1, 22.69, 0, 0.00, 0.00, 0.00, 22.60, 22.70, 24.20, 24.20, 25.90, 25.90, 27.90, 27.90, 30.20, 30.20, 33.00, 33.00, 36.30, 36.30, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 3, 2, 22.69, 0, 0.00, 0.00, 0.00, 22.60, 22.70, 24.20, 24.20, 25.90, 25.90, 27.90, 27.90, 30.20, 30.20, 33.00, 33.00, 36.30, 36.30, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 4, 1, 21.97, 0, 0.00, 0.00, 0.00, 21.90, 21.90, 23.40, 23.40, 25.10, 25.10, 27.00, 27.00, 29.20, 29.30, 31.90, 31.90, 35.10, 35.10, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 4, 2, 21.97, 0, 0.00, 0.00, 0.00, 21.90, 21.90, 23.40, 23.40, 25.10, 25.10, 27.00, 27.00, 29.20, 29.30, 31.90, 31.90, 35.10, 35.10, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 5, 1, 21.06, 0, 0.00, 0.00, 0.00, 21.00, 21.00, 22.40, 22.40, 24.00, 24.00, 25.90, 25.90, 28.00, 28.00, 30.60, 30.60, 33.70, 33.70, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 5, 2, 21.65, 0, 0.00, 0.00, 0.00, 21.60, 21.60, 23.00, 23.10, 24.70, 24.70, 26.60, 26.60, 28.80, 28.80, 31.40, 31.50, 34.60, 34.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 6, 1, 20.15, 0, 0.00, 0.00, 0.00, 20.10, 20.10, 21.40, 21.50, 23.00, 23.00, 24.80, 24.80, 26.80, 26.80, 29.30, 29.30, 32.20, 32.20, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 6, 2, 21.34, 0, 0.00, 0.00, 0.00, 21.30, 21.30, 22.70, 22.70, 24.30, 24.40, 26.20, 26.20, 28.40, 28.40, 31.00, 31.00, 34.10, 34.10, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 7, 1, 19.25, 0, 0.00, 0.00, 0.00, 19.20, 19.20, 20.50, 20.50, 22.00, 22.00, 23.60, 23.70, 25.60, 25.60, 28.00, 28.00, 30.80, 30.80, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 7, 2, 21.03, 0, 0.00, 0.00, 0.00, 21.00, 21.00, 22.40, 22.40, 24.00, 24.00, 25.80, 25.80, 28.00, 28.00, 30.50, 30.60, 33.60, 33.60, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 8, 1, 18.34, 0, 0.00, 0.00, 0.00, 18.30, 18.30, 19.50, 19.50, 20.90, 20.90, 22.50, 22.50, 24.40, 24.40, 26.60, 26.60, 29.30, 29.30, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(5, 8, 2, 20.71, 0, 0.00, 0.00, 0.00, 20.70, 20.70, 22.00, 22.10, 23.60, 23.60, 25.40, 25.50, 27.60, 27.60, 30.10, 30.10, 33.10, 33.10, 100.00, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 1, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 1, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 2, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 2, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 3, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 3, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 4, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 4, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 5, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 5, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 6, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 6, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 7, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 7, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 8, 1, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(6, 8, 2, 8.00, 1, 0.50, 8.00, 8.00, 100.00, 7.50, 7.99, 7.00, 7.49, 6.50, 6.99, 6.00, 6.49, 5.50, 5.99, 5.00, 5.49, 0.00, 4.99, '', 1, '1', '', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 1, 1, 0.00, 1, 12.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 1, 2, 0.00, 1, 12.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 2, 1, 0.00, 1, 12.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 2, 2, 0.00, 1, 12.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 3, 1, 0.00, 1, 14.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 3, 2, 0.00, 1, 14.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 4, 1, 0.00, 1, 14.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 4, 2, 0.00, 1, 14.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 5, 1, 0.00, 1, 16.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 5, 2, 0.00, 1, 16.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 6, 1, 0.00, 1, 16.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 6, 2, 0.00, 1, 16.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 7, 1, 0.00, 1, 18.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 7, 2, 0.00, 1, 18.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 8, 1, 0.00, 1, 18.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(7, 8, 2, 0.00, 1, 18.00, 8.00, 29.00, 100.00, 25.00, 28.00, 21.00, 24.00, 17.00, 20.00, 13.00, 16.00, 9.00, 12.00, 5.00, 8.00, 1.00, 4.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 1, 1, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.00, 14.90, 14.90, 16.00, 16.00, 17.20, 17.20, 18.60, 18.60, 20.30, 20.30, 22.40, 22.40, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 1, 2, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.00, 14.90, 14.90, 16.00, 16.00, 17.20, 17.20, 18.60, 18.60, 20.30, 20.30, 22.40, 22.40, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 2, 1, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.00, 14.90, 14.90, 16.00, 16.00, 17.20, 17.20, 18.60, 18.60, 20.30, 20.30, 22.40, 22.40, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 2, 2, 14.00, 0, 0.00, 0.00, 0.00, 14.00, 14.00, 14.90, 14.90, 16.00, 16.00, 17.20, 17.20, 18.60, 18.60, 20.30, 20.30, 22.40, 22.40, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 3, 1, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.00, 13.80, 13.80, 14.80, 14.80, 16.00, 16.00, 17.30, 17.30, 18.90, 18.90, 20.80, 20.80, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 3, 2, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.00, 13.80, 13.80, 14.80, 14.80, 16.00, 16.00, 17.30, 17.30, 18.90, 18.90, 20.80, 20.80, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 4, 1, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.00, 13.80, 13.80, 14.80, 14.80, 16.00, 16.00, 17.30, 17.30, 18.90, 18.90, 20.80, 20.80, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 4, 2, 13.00, 0, 0.00, 0.00, 0.00, 13.00, 13.00, 13.80, 13.80, 14.80, 14.80, 16.00, 16.00, 17.30, 17.30, 18.90, 18.90, 20.80, 20.80, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 5, 1, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.00, 12.80, 12.80, 13.70, 13.70, 14.70, 14.70, 16.00, 16.00, 17.40, 17.40, 19.20, 19.20, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 5, 2, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.00, 12.80, 12.80, 13.70, 13.70, 14.70, 14.70, 16.00, 16.00, 17.40, 17.40, 19.20, 19.20, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 6, 1, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.00, 12.80, 12.80, 13.70, 13.70, 14.70, 14.70, 16.00, 16.00, 17.40, 17.40, 19.20, 19.20, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 6, 2, 12.00, 0, 0.00, 0.00, 0.00, 12.00, 12.00, 12.80, 12.80, 13.70, 13.70, 14.70, 14.70, 16.00, 16.00, 17.40, 17.40, 19.20, 19.20, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 7, 1, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.00, 11.70, 11.70, 12.50, 12.50, 13.50, 13.50, 14.60, 14.60, 16.00, 16.00, 17.60, 17.60, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 7, 2, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.00, 11.70, 11.70, 12.50, 12.50, 13.50, 13.50, 14.60, 14.60, 16.00, 16.00, 17.60, 17.60, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 8, 1, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.00, 11.70, 11.70, 12.50, 12.50, 13.50, 13.50, 14.60, 14.60, 16.00, 16.00, 17.60, 17.60, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL),
(8, 8, 2, 11.00, 0, 0.00, 0.00, 0.00, 11.00, 11.00, 11.70, 11.70, 12.50, 12.50, 13.50, 13.50, 14.60, 14.60, 16.00, 16.00, 17.60, 17.60, 100.00, '', 1, '1', '1', 'false', '0000-00-00 00:00:00', '2023-04-20 13:39:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `OrganizationTypeID` int(10) UNSIGNED DEFAULT NULL,
  `S8S_ID` int(10) UNSIGNED DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Abbr` varchar(6) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateProvince` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(50) DEFAULT NULL,
  `PrimaryContactID` bigint(20) DEFAULT NULL,
  `ParentOrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `OrgEmail` varchar(255) DEFAULT NULL,
  `OrgEmailVerifiedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `OrganizationTypeID`, `S8S_ID`, `Name`, `Abbr`, `Address`, `City`, `StateProvince`, `PostalCode`, `PrimaryContactID`, `ParentOrganizationID`, `OrgEmail`, `OrgEmailVerifiedOn`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 7, 'Private Elementary School system', 'PES', 'Bufferzone Karachi', 'Karachi', 'Pakistan', '7150032465465456456', 1, 4, 'abc@gmail.cobaaaaaaaaaaa', '2022-12-05 13:48:21', 1, '7', NULL, 'true', '2022-12-05 18:48:21', '2022-12-16 16:03:52', NULL),
(2, 1, 6, 'Private Elementary School District', 'PES', '45445', 'larkana', 'Pakistan', '4545', 1, NULL, 'sys@gmail.ciom', '2022-12-05 13:49:14', 1, '6', NULL, 'false', '2022-12-05 18:49:14', '2022-12-20 23:11:27', NULL),
(3, 1, 6, 'Govt', 'PES', 'Gulidtane jauhar karachi Block 18', 'Karachi', 'Pakistan', '7852', 2, NULL, 'sys@gmail.com', '2022-12-05 14:11:27', 1, '6', NULL, 'true', '2022-12-05 19:11:27', '2022-12-16 15:59:12', NULL),
(4, 3, 6, 'Private Elementary School', 'PES', 'Gulidtane jauhar karachi Block 18 Karachi Pakistan', 'Karachi', 'Pakistan', '7852', 1, 5, 'sys@gmail.com', '2022-12-05 14:11:58', 1, '6', NULL, 'false', '2022-12-05 19:11:58', '2022-12-19 17:51:35', NULL),
(5, 3, 6, 'Javlin', 'PES', 'Bufferzone Karachi', 'Karachi', 'Pakistan', '7852', 1, NULL, 'ali.akbar@oip.com.pk', '2022-12-06 10:49:46', 1, '6', NULL, 'true', '2022-12-06 15:49:46', '2022-12-16 15:59:17', NULL),
(6, 3, 6, 'NEDUT', 'NED', 'Gulidtane jauhar karachi Block 18', 'Karachi', 'Pakistan', '78524', 1, 3, 'ali.akbar@oip.com.pk', '2022-12-06 10:50:09', 1, '6', NULL, 'true', '2022-12-06 15:50:09', '2022-12-16 15:59:19', NULL),
(7, 3, 7, 'Technology', 'PES', 'jaugar', 'Karachi', 'Pakistan', '7852', 2, 3, 'ali.akbar@oip.com.org', '2022-12-06 11:14:30', 1, '7', NULL, 'true', '2022-12-06 16:14:30', '2022-12-16 15:59:22', NULL),
(8, 4, 6, 'Neon Sports City', 'NCS', 'Bufferzone Karachi', 'London', 'England', '7582', 3, NULL, 'sys@gmail.com', '2022-12-08 10:04:48', 1, '6', NULL, 'false', '2022-12-08 15:04:48', '2023-01-24 23:55:38', NULL),
(9, 7, 7, 'Branded Sports Spot', 'BSS18', '13th Street 47 W 13th St, New York, NY 10011, USA', 'New York', 'USA', '10001', 2025550167, NULL, 'james1@yahoo.com', '2022-12-16 10:58:58', 1, '7', NULL, 'false', '2022-12-16 15:58:58', '2023-02-01 18:02:11', NULL),
(10, 8, 7, 'Sun City Surf', 'SCS242', '20 Cooper Square, New York, NY 10003, USA', 'New York', 'USA', '10005', 2025550143, NULL, 'chirs@gmail.com', '2022-12-16 11:06:04', 1, '7', NULL, 'false', '2022-12-16 16:06:04', '2023-02-01 17:46:57', NULL),
(11, 9, 7, 'Activewear Group', 'ACG101', '1 E 2nd St, New York, NY 10003, USA', 'New York', 'USA', '10010', 2025550186, NULL, 'Mills@gmail.com', '2022-12-16 11:08:41', 1, '7', NULL, 'false', '2022-12-16 16:08:41', '2023-02-01 17:46:32', NULL),
(12, 10, 7, 'Olympian Sports', 'OS90', 'Metrotech Center, Brooklyn, NY 11201, USA', 'New York', 'USA', '10020', 2025550173, NULL, 'olympic@tribeunltd.com', '2022-12-16 11:11:31', 1, '7', NULL, 'false', '2022-12-16 16:11:31', '2023-02-01 18:01:51', NULL),
(13, 5, 7, 'retestlkjkl', 'PESd', '55', 'aadd', 'aadd', '55', 4552, NULL, 'jonjordan90@gmail.com', '2022-12-19 12:49:42', 1, '7', NULL, 'false', '2022-12-19 17:49:42', '2023-02-01 17:46:19', NULL),
(14, 8, 7, 'Test for delete', 'TFD', 'somewhere', 'Honalulu', 'HI', '12345', 123456789, NULL, 'jon@gmail.net', '2022-12-20 15:38:01', 1, '7', NULL, 'false', '2022-12-20 20:38:01', '2023-02-01 17:46:00', NULL),
(15, 10, 6, 'Playing Square', 'PSE', 'Gulistan-e-Jauhar Block 18', 'Karachi', 'USA', '07599', 302598888, NULL, 'contact@tribeunltd.com', '2023-01-11 07:48:51', 1, '6', NULL, 'false', '2023-01-11 12:48:51', '2023-01-11 12:50:31', NULL),
(16, 1, 7, 'Advance Sports', 'ADS', 'Repellendus Sit pro', 'London', 'Nulla rem quasi alia', '63', 12345645, NULL, 'Maxwell@mailinator.com', '2023-01-20 12:48:17', 1, '7', NULL, 'false', '2023-01-20 17:48:17', '2023-02-01 18:04:11', NULL),
(17, 5, 7, 'Adena Everett', 'Con', 'Accusamus suscipit e', 'Quisquam qui dolor l', 'Est iure consequatu', '81', 1234567897, NULL, 'Pollard@mailinator.com', '2023-01-20 12:48:38', 1, '7', NULL, 'false', '2023-01-20 17:48:38', '2023-02-01 17:45:43', NULL),
(18, 1, 1, 'Acton Daugherty', 'Ulla', 'Dicta obcaecati aute', 'Cupidatat duis sit', 'Quae dolor eveniet', '93', 1234567899, NULL, 'quwe@mailinator.com', '2023-01-20 12:50:57', 1, '1', NULL, 'false', '2023-01-20 17:50:57', '2023-01-20 17:50:57', NULL),
(19, 5, 7, 'New Games', 'NGM', 'Gulistan-e-Jauhar Block 18', 'Los Vegas', 'USA', '07599', 304234991, NULL, 'jordan90@gmail.com', '2023-01-20 12:54:10', 1, '7', NULL, 'false', '2023-01-20 17:54:10', '2023-02-01 17:45:04', NULL),
(20, 11, 6, 'Matrix System', 'MXS', 'Gulistan-e-Jauhar Block 18', 'Birmingham', 'England', '07599', 3042349918, NULL, 'david@tribeunltd.comb', '2023-01-27 12:52:52', 1, '6', NULL, 'false', '2023-01-27 17:52:52', '2023-03-07 21:19:41', NULL),
(21, 7, 7, 'Freedom sports', 'FS', 'Gulistan-e-Jauhar Block 18', 'Melbourne', 'Melbourne', '07599', 30423499188, NULL, 'philips@gmail.com', '2023-02-09 08:36:14', 1, '7', NULL, 'false', '2023-02-09 13:36:14', '2023-02-09 13:36:14', NULL),
(22, 9, 1, '1 Facilitator, 1 Participant, 1 day test org', '111org', '3620 S. Renellie Drive', 'Tampa', 'Florida', '33629', 6123855821, NULL, 'leonard.simmons@spectrum8sports.com', '2023-03-22 00:48:39', 1, '1', NULL, 'false', '2023-03-22 04:48:39', '2023-03-22 04:50:54', NULL),
(23, 13, 1, 'License Test', 'LT', 'Gulistan-e-Jauhar Block 18', 'Karachi', 'P', '07599', 303444985, NULL, 'syss@gmail.ciom', '2023-03-29 04:37:20', 1, '1', NULL, 'false', '2023-03-29 08:37:20', '2023-03-29 08:37:20', NULL),
(24, 14, 19, 'Spectrum 8 Sports', 'S8S', '3403 Fuchsia Ct', 'Naples', 'FL', '34112', 2395373974, NULL, 'Ed.Bernosky@Spectrum8Sports.com', '2023-09-08 18:06:31', 1, '19', NULL, 'false', '2023-09-08 22:06:31', '2023-09-08 22:06:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_types`
--

CREATE TABLE `organization_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `IsSchool` tinyint(4) DEFAULT NULL COMMENT '1 = Yes , 0 = No',
  `Classification` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_types`
--

INSERT INTO `organization_types` (`id`, `IsSchool`, `Classification`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Primary School', 1, '6', '6', 'false', '2022-12-05 18:43:10', '2022-12-07 12:58:19', NULL),
(2, 1, 'Culture Sports', 1, '6', '12', 'false', '2022-12-05 18:43:16', '2023-02-15 15:34:00', NULL),
(3, 1, 'Graduation', 1, '6', NULL, 'false', '2022-12-06 15:39:43', '2022-12-06 15:39:43', NULL),
(4, 1, 'Gazprom plays', 1, '6', NULL, 'false', '2022-12-08 15:03:28', '2022-12-08 15:03:28', NULL),
(5, 0, 'Bright Future Games', 1, '6', '12', 'false', '2022-12-13 19:12:16', '2023-02-15 15:31:58', NULL),
(6, 1, 'Phenomenal sports', 1, '6', '12', 'false', '2022-12-13 19:12:26', '2023-02-15 15:31:27', NULL),
(7, 1, 'National Olympic Committee', 1, '6', NULL, 'false', '2022-12-16 15:49:49', '2022-12-16 15:49:49', NULL),
(8, 1, 'International Olympic Committee', 1, '6', NULL, 'false', '2022-12-16 15:50:39', '2022-12-16 15:50:39', NULL),
(9, 1, 'Host Organizing Committee', 1, '6', NULL, 'false', '2022-12-16 15:51:37', '2022-12-16 15:51:37', NULL),
(10, 1, 'Greenwich Organizing Committee', 1, '6', NULL, 'false', '2022-12-16 15:52:46', '2022-12-16 15:52:46', NULL),
(11, 1, 'Organization Schema', 1, '6', NULL, 'false', '2023-01-27 17:49:50', '2023-01-27 17:49:50', NULL),
(12, 0, 'Nature Games', 1, '12', NULL, 'false', '2023-02-15 15:34:32', '2023-02-15 15:34:32', NULL),
(13, 1, 'License', 1, '1', NULL, 'false', '2023-03-29 08:35:50', '2023-03-29 08:35:50', NULL),
(14, 0, 'Spectrum 8 Events', 1, '19', NULL, 'false', '2023-08-30 04:39:38', '2023-08-30 04:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `S8S_ID` int(10) UNSIGNED DEFAULT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `GenderID` int(10) UNSIGNED DEFAULT NULL,
  `GradeID` int(10) UNSIGNED DEFAULT NULL,
  `OrganizationID` int(10) UNSIGNED DEFAULT NULL,
  `FacilitatorID` int(10) UNSIGNED DEFAULT NULL,
  `ClassID` int(10) UNSIGNED DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `ParticipantTypeID` int(10) UNSIGNED DEFAULT NULL,
  `JerseyNumber` varchar(10) DEFAULT NULL,
  `JerseyColorID` int(10) UNSIGNED DEFAULT NULL,
  `IsFacilitator` tinyint(4) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `S8S_ID`, `Firstname`, `Lastname`, `GenderID`, `GradeID`, `OrganizationID`, `FacilitatorID`, `ClassID`, `Age`, `ParticipantTypeID`, `JerseyNumber`, `JerseyColorID`, `IsFacilitator`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Donovan Woodward', 'Abel Matthews', 2, 5, 10, 38, 2, 23, 1, '95', 5, 1, 1, 1, '6', '1', 'true', '2022-12-05 22:17:01', '2023-12-20 00:32:37', NULL),
(2, 19, 'Hope', 'Schroeder', 1, 5, 10, 20, 1, 8, 1, '371', 1, 1, 1, 1, '6', '19', 'false', '2022-12-05 22:18:54', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(3, 1, 'Francis Parks', 'Indigo Salazar', 3, 6, 10, 38, 2, 92, 1, '14', 2, 1, 1, 1, '6', '1', 'false', '2022-12-05 22:21:25', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(4, 1, 'Olivia Emerson', 'Neil Soto', 3, 8, 8, 19, 1, 10, 1, '930', 4, 1, 1, 1, '6', '1', 'false', '2022-12-05 22:23:41', '2023-04-10 10:20:34', NULL),
(5, 9, 'Jennifer', 'Cris', 2, 5, 11, 51, 1, 25, 1, '333', 11, 1, 1, 1, '9', '9', 'false', '2022-12-07 13:26:27', '2023-02-09 14:01:38', NULL),
(6, 19, '02 Male', 'Grade 2', 1, 2, 12, 39, 4, 7, 1, '107', 7, 1, 1, 1, '9', '19', 'false', '2022-12-07 13:27:04', '2023-12-22 07:14:41', NULL),
(7, 9, 'Stev', 'Jobs', 1, 6, 8, 46, 1, 19, 1, '1122', 1, 1, 1, 1, '14', '9', 'false', '2022-12-07 16:15:18', '2023-03-03 17:56:41', NULL),
(8, 19, '01 Male or Female', 'Grade One', 1, 1, 12, 39, 2, 8, 1, '333', 4, 1, 1, 1, '9', '19', 'true', '2022-12-08 14:14:20', '2023-12-22 06:57:10', NULL),
(9, 19, 'Karen', 'Pollard', 2, 1, 10, 20, 2, 6, 1, '333', 1, 1, 1, 1, '9', '19', 'false', '2022-12-08 14:15:07', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(10, 19, 'Symond', 'Austin', 1, 1, 10, 109, 1, 6, 1, '25', 7, 1, 1, 1, '9', '19', 'false', '2022-12-08 17:52:46', '2023-04-28 18:54:38', NULL),
(11, 1, 'Harry', 'Brooks', 1, 6, 8, 36, 3, 26, 1, '333', 7, 1, 1, 1, '9', '1', 'false', '2022-12-08 17:53:40', '2023-04-14 06:14:07', NULL),
(12, 9, 'Mitchell', 'Johnson', 1, 8, 15, 45, 7, 24, 5, '45', 3, 1, 1, 1, '14', '9', 'false', '2022-12-16 19:07:56', '2023-02-22 19:49:36', NULL),
(13, 19, 'Sally', 'Amber', 2, 8, 8, 36, 5, 10, 1, '10', 3, 1, 1, 1, '14', '19', 'false', '2022-12-16 19:08:39', '2023-05-17 04:38:36', NULL),
(14, 9, 'Brett', 'Lee', 1, 8, 11, 51, 7, 32, 2, '11', 6, 1, 1, 1, '14', '9', 'false', '2022-12-16 19:09:47', '2023-02-09 14:10:37', NULL),
(15, 19, 'Kylian', 'Mbappe', 1, 8, 10, 109, 4, 21, 1, '8', 5, 1, 1, 1, '14', '19', 'false', '2022-12-16 19:10:58', '2023-04-28 18:51:50', NULL),
(16, 1, 'Virat', 'Kohli', 1, 8, 16, 96, 5, 29, 4, '7', 10, 1, 1, 1, '14', '1', 'false', '2022-12-16 19:11:57', '2023-03-22 06:33:29', NULL),
(17, 1, 'Leonel', 'Messi', 1, 8, 8, 46, 8, 35, 2, '10', 2, 1, 1, 1, '14', '1', 'false', '2022-12-16 19:13:35', '2023-04-13 10:19:51', NULL),
(18, 9, 'Cristiano', 'Ronaldo', 1, 8, 15, 45, 4, 37, 5, '7', 1, 1, 1, 1, '14', '9', 'false', '2022-12-16 19:14:23', '2023-02-22 19:49:26', NULL),
(19, 9, 'Tim', 'David', 1, 8, 11, 51, 1, 35, 2, '152', 4, 1, 1, 1, '9', '9', 'false', '2022-12-27 15:50:56', '2023-03-07 13:25:00', NULL),
(20, 9, 'AB de', 'Villar', 1, 8, 11, 51, 1, 40, 2, '258', 2, 1, 1, 1, '9', '9', 'false', '2022-12-27 15:51:38', '2023-04-10 10:33:59', NULL),
(21, 19, '03 Male', 'Grade Three', 1, 3, 12, 39, 1, 6, 1, '111', 1, 1, 1, 1, '9', '19', 'true', '2022-12-27 15:52:23', '2023-12-22 06:53:30', NULL),
(22, 9, 'David', 'Salt', 1, 8, 8, 46, 2, 23, 1, '95', 4, 1, 1, 1, '9', '9', 'false', '2022-12-27 15:52:57', '2023-03-03 17:56:41', NULL),
(23, 19, 'Tye', 'Mills', 1, 6, 10, 109, 6, 12, 5, '55', 2, 1, 1, 1, '9', '19', 'false', '2022-12-27 15:53:24', '2023-04-28 18:51:23', NULL),
(24, 9, 'John', 'John', 1, 5, 15, 45, 6, 24, 1, '10', 5, 1, 1, 1, '9', '9', 'false', '2022-12-27 16:22:38', '2023-02-22 19:49:33', NULL),
(25, 9, 'John', 'Carlos', 1, 5, 4, 4, 6, 22, 1, '10', 7, 1, 1, 1, '9', NULL, 'false', '2022-12-27 16:26:58', '2023-02-02 22:50:09', NULL),
(26, 9, 'Michael', 'Hussey', 1, 8, 4, 4, 7, 28, 3, '7', 6, 1, 1, 1, '9', NULL, 'false', '2022-12-27 16:27:45', '2023-03-06 19:24:24', NULL),
(27, 19, 'Ed', 'Bernosky', 1, 8, 10, 20, 3, 66, 2, '5', 6, 1, 1, 1, '9', '19', 'false', '2022-12-27 16:29:15', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(28, 19, '03 Male', 'Grade 3', 1, 3, 12, 39, 1, 8, 1, '108', 4, 1, 1, 1, '9', '19', 'false', '2022-12-27 16:39:29', '2023-12-22 06:56:27', NULL),
(29, 9, 'Jennifer', 'Holland', 2, 8, 15, 45, 4, 25, 2, '114', 9, 1, 1, 1, '9', '9', 'false', '2022-12-27 16:40:03', '2023-02-22 19:49:30', NULL),
(30, 1, 'Mark', 'Stonis', 1, 8, 10, 38, 1, 55, 1, '333', 1, 1, 1, 1, '9', '1', 'false', '2022-12-27 17:42:32', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(31, 9, 'Chirs', 'Gayl', 1, 8, 15, 45, 1, 55, 2, '333', 1, 1, 1, 1, '9', '9', 'false', '2022-12-27 17:42:33', '2023-02-22 19:49:23', NULL),
(32, 9, 'Mark', 'Stoins', 1, 8, 8, 46, 1, 36, 1, '258', 2, 1, 1, 1, '9', '9', 'false', '2022-12-27 17:43:10', '2023-03-03 17:58:46', NULL),
(33, 19, '04 Male', 'Grade 4', 1, 4, 12, 39, 1, 36, 1, '103', 3, 1, 1, 1, '9', '19', 'false', '2022-12-27 17:43:39', '2023-12-22 07:00:02', NULL),
(34, 19, 'Erin', 'Holland', 2, 8, 10, 109, 8, 13, 2, '456', 5, 1, 1, 1, '9', '19', 'false', '2022-12-27 17:44:17', '2023-04-28 18:48:06', NULL),
(35, 1, 'Sarah', 'Taylor', 3, 8, 16, 96, 3, 36, 5, '488', 2, 1, 1, 1, '9', '1', 'true', '2022-12-27 17:45:03', '2023-04-11 19:01:32', NULL),
(36, 9, 'Kyle', 'Mills', 2, 8, 8, 46, 7, 25, 1, '55', 11, 1, 1, 1, '9', '9', 'false', '2022-12-30 18:13:17', '2023-03-03 17:58:45', NULL),
(37, 1, 'Nelson', 'Cameron', 2, 8, 16, 96, 4, 85, 2, '22', 5, 1, 1, 0, '9', '1', 'false', '2022-12-30 18:19:00', '2023-03-22 06:32:44', NULL),
(38, 1, 'Allen', 'Nymar', 2, 6, 8, 97, 1, 26, 1, '95', 3, 1, 1, 1, '9', '1', 'false', '2023-01-03 17:12:28', '2023-03-17 14:18:36', NULL),
(39, 9, 'Norman', 'Maxwell', 1, 8, 11, 51, 1, 44, 4, '95', 6, 1, 1, 1, '9', '9', 'false', '2023-01-04 16:04:56', '2023-02-09 14:03:35', NULL),
(40, 9, 'Eoin', 'Morgan', 1, 8, 20, 50, 6, 36, 1, '002', 1, 1, 1, 1, '9', '9', 'false', '2023-01-04 17:04:25', '2023-02-01 15:25:08', NULL),
(41, 9, 'Amenda', 'Ponting', 2, 5, 11, 51, 3, 29, 1, '258', 5, 1, 1, 1, '9', '9', 'false', '2023-01-04 17:18:48', '2023-02-09 14:10:51', NULL),
(42, 19, '05 Female', 'Grade Five', 2, 5, 12, 39, 1, 12, 1, '321', 5, 1, 1, 1, '1', '19', 'true', '2023-01-04 18:22:29', '2023-12-22 06:52:53', NULL),
(43, 37, 'Henry', 'Nicolas', 1, 6, 20, 50, 4, 26, 3, '333', 5, 1, 1, 1, '9', '37', 'false', '2023-01-10 15:00:55', '2023-05-05 04:21:31', NULL),
(44, 1, 'Tim', 'Southee', 1, 8, 8, 36, 1, 32, 4, '123', 6, 1, 1, 1, '9', '1', 'false', '2023-01-11 13:35:00', '2023-04-14 06:14:59', NULL),
(45, 1, 'Norway', 'Salt', 1, 3, 8, 97, 5, 26, 5, '000', 4, 1, 1, 1, '9', '1', 'false', '2023-01-17 15:25:56', '2023-03-28 11:15:43', NULL),
(46, 19, 'Amenda', 'Haris', 2, 6, 10, 109, 6, 12, 1, '0002', 2, 1, 1, 1, '9', '19', 'false', '2023-01-17 15:26:30', '2023-04-28 18:50:45', NULL),
(47, 9, 'Amenda', 'Mills', 2, 8, 20, 50, 3, 26, 3, '95', 8, 1, 1, 1, '9', '9', 'false', '2023-01-20 17:05:38', '2023-03-03 17:57:26', NULL),
(48, 1, 'liton', 'Das', 1, 2, 20, 99, 1, 25, 1, '329', 10, 1, 1, 1, '14', '1', 'false', '2023-01-20 17:40:43', '2023-04-05 11:35:24', NULL),
(49, 19, 'Frank', 'Papa', 1, 7, 10, 20, 4, 34, 5, '34', 5, 1, 1, 1, '1', '19', 'false', '2023-02-25 05:07:38', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(50, 19, 'Nathaniel', 'Alvarado', 2, 1, 10, 20, 5, 43, 1, '4533', 2, 1, 1, 1, '1', '19', 'false', '2023-03-01 20:22:25', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(51, 19, '05 Male', 'Grade 5', 1, 5, 12, 39, 6, 110, 1, '105', 1, 1, 1, 1, '1', '19', 'false', '2023-03-02 18:40:17', '2023-12-22 07:01:10', NULL),
(52, 1, 'Robert', 'Smith', 1, 3, 20, 97, 1, 12, 1, 'RS-12', 4, 1, 1, 1, '1', '1', 'false', '2023-03-22 04:36:57', '2023-03-29 07:43:31', NULL),
(53, 19, 'Larry', 'Desoto', 1, 6, 20, 95, 6, 11, 1, '55', 1, 1, 1, 1, '1', '19', 'false', '2023-03-29 07:35:03', '2023-05-24 19:15:18', NULL),
(54, 1, 'License', 'participant', 1, 8, 23, 98, 8, 23, 1, '55', 1, 1, 1, 1, '1', NULL, 'false', '2023-03-29 08:50:44', '2023-03-29 08:50:44', NULL),
(55, 1, 'License', 'participant2', 2, 7, 23, 98, 7, 32, 4, '488', 3, 1, 1, 1, '1', NULL, 'false', '2023-03-29 08:54:23', '2023-03-29 08:54:23', NULL),
(56, 1, 'License', 'participant3', 2, 3, 23, 98, 5, 25, 4, '152', 6, 1, 1, 1, '1', '1', 'false', '2023-03-29 08:55:16', '2023-03-29 09:05:04', NULL),
(57, 1, 'License', 'participant4', 1, 3, 23, 99, 2, 52, 4, '152', 4, 1, 1, 1, '1', NULL, 'false', '2023-03-29 09:04:45', '2023-03-29 09:04:45', NULL),
(58, 1, 'License', 'participant5', 1, 2, 20, 99, 1, 26, 2, '152', 7, 1, 1, 1, '1', '1', 'false', '2023-03-29 09:05:49', '2023-04-05 11:26:47', NULL),
(59, 1, 'Curious', 'Participant', 1, 4, 20, 99, 5, 30, 1, '10', 6, 1, 1, 1, '1', NULL, 'false', '2023-04-04 13:36:21', '2023-04-04 13:36:21', NULL),
(60, 19, '06 Male', 'Grade 6', 1, 6, 12, 39, 6, 10, 1, '10', 8, 1, 1, 0, '1', '19', 'false', '2023-04-13 22:40:36', '2023-12-22 06:52:24', NULL),
(61, 1, 'Reg', 'Test', 2, 1, 10, 111, 1, 26, 1, '105', 1, 1, 1, 1, '1', NULL, 'false', '2023-05-12 14:17:24', '2023-05-12 14:17:24', NULL),
(62, 1, 'Reg', 'Participant', 1, 2, 10, 111, 2, 29, 2, '106', 2, 1, 1, 0, '1', NULL, 'false', '2023-05-12 14:18:00', '2023-06-13 15:17:12', NULL),
(63, 1, 'Regression', 'Member', 2, 3, 10, 111, 3, 28, 3, '107', 3, 1, 1, 0, '1', NULL, 'false', '2023-05-12 14:18:39', '2023-12-19 08:30:05', NULL),
(64, 1, 'Regression', 'Candidate', 1, 4, 10, 111, 4, 30, 4, '999', 4, 1, 1, 1, '1', NULL, 'false', '2023-05-12 14:21:19', '2023-05-24 16:39:01', NULL),
(65, 37, 'test female 20230516', 'female test', 2, 5, 8, 36, 5, 10, 1, '10', 6, 1, 1, 0, '37', NULL, 'false', '2023-05-17 04:34:12', '2023-12-19 08:29:59', NULL),
(66, 19, 'Karen', 'Lori', 2, 2, 10, 20, 6, 7, 1, '77', 4, 1, 1, 0, '19', '19', 'false', '2023-05-24 19:49:37', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(67, 19, 'Mark', 'Simpson', 1, 3, 10, 20, 7, 8, 1, '88', 4, 1, 1, 1, '19', '19', 'false', '2023-05-24 19:51:13', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(68, 19, 'Wayne', 'Langlis', 2, 4, 10, 20, 8, 9, 1, '44', 5, 1, 1, 1, '19', NULL, 'false', '2023-05-24 19:53:06', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(69, 37, 'Gary', 'Simpson', 1, 14, 10, 20, 8, 9, 1, '888', 3, 1, 1, 1, '19', '37', 'false', '2023-05-24 20:05:56', '2023-09-08 22:58:03', '2023-09-08 22:58:03'),
(70, 19, '01 1st Grade', 'Boys', 1, 1, 24, 20, 1, 5, 6, '1', 8, 1, 1, 0, '99', '19', 'false', '2023-09-08 23:46:15', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(71, 19, '02 1st Grade', 'Boys', 1, 1, 24, 20, 1, 5, 6, '2', 8, 1, 1, 0, '99', '19', 'false', '2023-09-08 23:51:12', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(72, 19, '03 1st Grade', 'Boys', 1, 1, 24, 20, 1, 5, 6, '3', 8, 1, 1, 0, '99', '19', 'false', '2023-09-09 00:00:59', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(73, 19, '04 1st Grade', 'Boys', 1, 1, 24, 20, 1, 5, 6, '4', 8, 1, 1, 0, '99', '19', 'false', '2023-09-09 00:18:56', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(74, 19, '05 1St Grade', 'Male', 1, 1, 24, 122, 1, 5, 6, '5', 8, 1, 1, 0, '100', '19', 'false', '2023-09-09 04:35:03', '2023-12-20 00:36:13', '2023-12-20 00:36:13'),
(75, 19, '07 Male', 'Grade 7', 1, 7, 12, 39, 7, 12, 1, '77', 6, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:14:48', '2023-12-22 06:48:57', NULL),
(76, 19, '08 Male', 'Grade 8', 1, 8, 12, 39, 8, 13, 1, '88', 5, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:23:51', '2023-12-19 23:45:23', NULL),
(77, 19, '09 Male', 'Freshman', 1, 15, 12, 39, 9, 14, 1, '99', 3, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:32:03', '2023-12-22 07:03:44', NULL),
(78, 19, '10 Male', 'Sophomore', 1, 16, 12, 39, 10, 15, 1, '10', 6, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:33:43', '2023-12-19 23:44:30', NULL),
(79, 19, '11 Male', 'Junior', 1, 17, 12, 39, 11, 16, 1, '111', 4, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:35:15', '2023-12-19 23:44:12', NULL),
(80, 19, '12 Male', 'Senior', 1, 18, 12, 39, 12, 17, 1, '112', 7, 1, 1, 1, '19', '19', 'false', '2023-12-19 08:37:25', '2023-12-22 06:34:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participant_emails`
--

CREATE TABLE `participant_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `ParticipantID` int(10) UNSIGNED DEFAULT NULL,
  `EmailTypeID` int(10) UNSIGNED DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `EmailVerifiedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_emails`
--

INSERT INTO `participant_emails` (`id`, `ParticipantID`, `EmailTypeID`, `Email`, `EmailVerifiedOn`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 'dwam@gmail.com', '2022-12-06 10:20:49', 1, '9', '10', 'false', '2022-12-06 15:20:49', '2022-12-07 14:19:44', NULL),
(2, 2, 5, 'Rwhs@outlook.com', '2022-12-06 10:21:08', 1, '9', '10', 'false', '2022-12-06 15:21:08', '2022-12-07 14:19:52', NULL),
(3, 3, 3, 'franpar@yahoomail.com', '2022-12-06 10:21:31', 1, '9', NULL, 'false', '2022-12-06 15:21:31', '2022-12-07 13:43:35', NULL),
(4, 1, 8, 'superadmin@gmail.com', '2022-12-06 10:21:59', 1, '9', '10', 'false', '2022-12-06 15:21:59', '2022-12-07 14:19:14', NULL),
(5, 5, 10, 'ali.akbar@oip.com.pk', '2022-12-07 08:41:54', 1, '9', '10', 'false', '2022-12-07 13:41:54', '2022-12-07 14:19:33', NULL),
(6, 6, 9, 'ali.akbar@oip.com.pk', '2022-12-07 08:42:04', 1, '9', '10', 'false', '2022-12-07 13:42:04', '2022-12-07 14:19:26', NULL),
(7, 3, 11, 'abc.def@mail.come', '2022-12-07 08:42:16', 1, '9', NULL, 'false', '2022-12-07 13:42:16', '2022-12-07 13:42:45', NULL),
(8, 8, 2, 'pollardmehdi@gmail.com', '2022-12-08 09:16:09', 1, '9', NULL, 'false', '2022-12-08 14:16:09', '2022-12-08 14:16:09', NULL),
(9, 9, 8, 'poolardjamima@protonmail.com', '2022-12-08 09:16:35', 1, '9', NULL, 'false', '2022-12-08 14:16:35', '2022-12-08 14:16:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participant_types`
--

CREATE TABLE `participant_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Classification` varchar(25) DEFAULT NULL,
  `IsActive` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participant_types`
--

INSERT INTO `participant_types` (`id`, `Classification`, `IsActive`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Student', 1, 1, '14', NULL, 'false', '2022-12-16 16:05:55', '2022-12-16 16:05:55', NULL),
(2, 'Staff', 1, 1, '14', '11', 'false', '2022-12-16 16:05:59', '2023-02-14 18:06:24', NULL),
(3, 'Facilitator', 1, 1, '14', NULL, 'false', '2022-12-16 16:06:06', '2022-12-16 16:06:06', NULL),
(4, 'Walk-on', 1, 1, '14', NULL, 'false', '2022-12-16 16:06:11', '2022-12-16 16:06:11', NULL),
(5, 'Member', 1, 1, '14', '11', 'false', '2022-12-16 16:06:17', '2023-02-14 18:06:05', NULL),
(6, 'Event', 1, 1, '99', NULL, 'false', '2023-09-08 23:42:36', '2023-09-08 23:42:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Facilitator', 20, 'MyApp', 'd01512d0133999b07134aab05bd478b04ec18e529afed9f19cb88afcd2fc80eb', '[\"*\"]', '2023-04-12 04:24:06', '2023-03-28 02:24:46', '2023-04-12 04:24:06'),
(2, 'App\\Models\\Facilitator', 97, 'MyApp', 'f86714d4a2e9c07dd66c94a0e9ae1f5dafeeefbb1e8aacf74c7a15b8b15b82a1', '[\"*\"]', '2023-03-28 06:24:32', '2023-03-28 06:18:37', '2023-03-28 06:24:32'),
(3, 'App\\Models\\Facilitator', 97, 'MyApp', 'ecb109a1058e08b204790be7915bdef886a1fe525908be969e0fbf7bc273936b', '[\"*\"]', '2023-03-28 11:09:06', '2023-03-28 09:44:11', '2023-03-28 11:09:06'),
(4, 'App\\Models\\Facilitator', 97, 'MyApp', '0022b887f2a7c766e5ac7ced20292fda2f8e9e5789d8f1e4ee133aede2937bb5', '[\"*\"]', '2023-03-29 09:01:11', '2023-03-28 10:11:18', '2023-03-29 09:01:11'),
(5, 'App\\Models\\Facilitator', 97, 'MyApp', '2eabc7fa92fec67929d4a7953e7998fbe99930930b8e46c96f6ed6571f3ca457', '[\"*\"]', '2023-03-28 10:30:58', '2023-03-28 10:30:46', '2023-03-28 10:30:58'),
(6, 'App\\Models\\Facilitator', 97, 'MyApp', '16f3ba3c192d95f93128830bae87a506d88a8dce8703516cf8225e72e09ecbaa', '[\"*\"]', '2023-03-31 06:30:25', '2023-03-28 10:31:59', '2023-03-31 06:30:25'),
(7, 'App\\Models\\Facilitator', 97, 'MyApp', 'c11da7fd423d3db668597f1631e908e6cbcf67cbd3566e2909f9fc7714665ee9', '[\"*\"]', '2023-03-28 11:03:30', '2023-03-28 11:01:00', '2023-03-28 11:03:30'),
(8, 'App\\Models\\Facilitator', 97, 'MyApp', '643788aa3dda6b28877f73041dce8a56ecee2818bde380645db71e5a5313b282', '[\"*\"]', '2023-03-28 11:09:43', '2023-03-28 11:09:28', '2023-03-28 11:09:43'),
(9, 'App\\Models\\Facilitator', 97, 'MyApp', 'e1c7ad35c37eb9897022450b5751c345c587acae2a17afc943107f23092783ad', '[\"*\"]', '2023-03-29 08:44:23', '2023-03-28 11:09:57', '2023-03-29 08:44:23'),
(10, 'App\\Models\\Facilitator', 4, 'MyApp', '6fb89f256267e19b209cf92deb43b1cdf57b23fba11b5fab6bc5bb743186e097', '[\"*\"]', '2023-03-28 15:12:51', '2023-03-28 15:12:45', '2023-03-28 15:12:51'),
(11, 'App\\Models\\Facilitator', 98, 'authToken', '607ff9dde91b81ff5970f00b3526de1abc0b046d265fccf00786e76fb3cd3230', '[\"*\"]', NULL, '2023-03-29 08:45:32', '2023-03-29 08:45:32'),
(12, 'App\\Models\\Facilitator', 98, 'MyApp', 'aaaba0882114f230c071551b8a5f67190f2443ce2858909c15143d0f6ebc6859', '[\"*\"]', '2023-03-29 10:08:04', '2023-03-29 08:48:24', '2023-03-29 10:08:04'),
(13, 'App\\Models\\Facilitator', 99, 'authToken', '8e3bef9183764d1c43dbcef07bbae23ab9ded05f22a249e8754eecf8ec621db7', '[\"*\"]', NULL, '2023-03-29 09:02:05', '2023-03-29 09:02:05'),
(14, 'App\\Models\\Facilitator', 99, 'MyApp', 'a9f86c7f9c2d121ed1076b7a6dad3f47bf22b4227c8af3b1bd86e8189b335e64', '[\"*\"]', '2023-03-29 10:19:55', '2023-03-29 09:03:31', '2023-03-29 10:19:55'),
(15, 'App\\Models\\Facilitator', 99, 'MyApp', 'fe5fbda473fb71616c304adfd7d3ff8073648dc50d0e945d1ec8cce0a57598f5', '[\"*\"]', '2023-03-30 08:20:40', '2023-03-29 09:49:35', '2023-03-30 08:20:40'),
(16, 'App\\Models\\Facilitator', 4, 'MyApp', 'c39c8c467563496b8077367c24e212d4c91081a5cbfcf4fee39a950c886e80ca', '[\"*\"]', '2023-03-30 00:28:11', '2023-03-29 22:56:51', '2023-03-30 00:28:11'),
(17, 'App\\Models\\Facilitator', 98, 'MyApp', '0bd478c71bdfe49dc106799be487529c9841749126f75f757342bec70dd077a3', '[\"*\"]', '2023-03-31 09:54:16', '2023-03-30 07:26:38', '2023-03-31 09:54:16'),
(18, 'App\\Models\\Facilitator', 99, 'MyApp', '7b4b18f07b345e59b1f72b5363b2910ce54ee2d9ba329c50b986460a95911499', '[\"*\"]', '2023-03-30 08:24:01', '2023-03-30 08:23:45', '2023-03-30 08:24:01'),
(19, 'App\\Models\\Facilitator', 99, 'MyApp', 'bea8807cb16e26eb34915fa87690256e759c2036d21ffe4c4a20eecf0d67dd80', '[\"*\"]', '2023-03-31 06:32:36', '2023-03-31 06:31:16', '2023-03-31 06:32:36'),
(20, 'App\\Models\\Facilitator', 98, 'MyApp', 'd6c825bbf1af776fc747c9d9623ea7cf29b46b97882cb73153ed4c3e31c953b1', '[\"*\"]', '2023-03-31 06:33:47', '2023-03-31 06:33:02', '2023-03-31 06:33:47'),
(21, 'App\\Models\\Facilitator', 97, 'MyApp', '1d7185c4a97973e0f2242f7e8cc36040c76e36e37845918157eada6de27ff88b', '[\"*\"]', '2023-04-10 01:40:02', '2023-03-31 06:34:23', '2023-04-10 01:40:02'),
(22, 'App\\Models\\Facilitator', 97, 'MyApp', '8d11f34ba94090679128e759db9881eef89080a99a17cb64dcc73d816e4b773c', '[\"*\"]', '2023-03-31 10:25:25', '2023-03-31 09:10:22', '2023-03-31 10:25:25'),
(23, 'App\\Models\\Facilitator', 4, 'MyApp', 'dfc314941df04a53c52eb6b36d2109b2ece21f4a7700cd64b7da9a278a2bcea8', '[\"*\"]', '2023-05-04 18:10:36', '2023-04-03 23:29:32', '2023-05-04 18:10:36'),
(24, 'App\\Models\\Facilitator', 99, 'MyApp', '39d5c7a63d04af279817fa92206fedc0a557693c74c1c2d5a2e8b25e04be70c9', '[\"*\"]', '2023-04-04 11:20:50', '2023-04-04 10:51:46', '2023-04-04 11:20:50'),
(25, 'App\\Models\\Facilitator', 98, 'MyApp', 'f5ae228599caa1fec4d0fbaf6a4576bd5fe2f30c275cfbacf4e9e50270c60323', '[\"*\"]', '2023-04-05 11:54:58', '2023-04-04 10:55:47', '2023-04-05 11:54:58'),
(26, 'App\\Models\\Facilitator', 99, 'MyApp', '216228e0e0f13bfc60e92e4a245b7174e825deb0fdb9a01d6fda134f851b859e', '[\"*\"]', '2023-04-05 11:39:14', '2023-04-04 11:41:26', '2023-04-05 11:39:14'),
(27, 'App\\Models\\Facilitator', 20, 'MyApp', 'c321c5240f4e1639d9c40935c554a52da5cdc0b6fc25120a03fa2e6602812574', '[\"*\"]', '2023-04-06 03:40:26', '2023-04-06 01:34:04', '2023-04-06 03:40:26'),
(28, 'App\\Models\\Facilitator', 20, 'MyApp', '5590f48a19fedc9469e70e98ebc17c3a7bb5682cb24c2c112fd50f191e03a75b', '[\"*\"]', '2023-04-12 04:27:23', '2023-04-06 03:48:18', '2023-04-12 04:27:23'),
(29, 'App\\Models\\Facilitator', 39, 'authToken', '9cba914648259bf95cf940d1ff130176785534e701c23790cc7a24a0eafffe15', '[\"*\"]', NULL, '2023-04-06 04:14:26', '2023-04-06 04:14:26'),
(30, 'App\\Models\\Facilitator', 39, 'authToken', 'a1d1edebef3dc1cb721b7de9491f182d278f81d2716554bbebffac28b9f268a1', '[\"*\"]', NULL, '2023-04-06 04:27:45', '2023-04-06 04:27:45'),
(31, 'App\\Models\\Facilitator', 38, 'authToken', 'e5e502cb202e47daedc015ead9be6ccbcb3ac2864eaa1d75bd1bf61ef66d44a9', '[\"*\"]', NULL, '2023-04-06 04:38:39', '2023-04-06 04:38:39'),
(32, 'App\\Models\\Facilitator', 36, 'authToken', '945b2772b9946a13a9a931d9c5d09fde8cde2e52690b028cc1d5c59a8b722b84', '[\"*\"]', NULL, '2023-04-06 04:42:19', '2023-04-06 04:42:19'),
(33, 'App\\Models\\Facilitator', 36, 'MyApp', '5b9e3dab9cba8ca0a983201a6a9af4b3cba01db550c453cb946169800a100f7a', '[\"*\"]', '2023-04-12 04:30:08', '2023-04-06 04:45:44', '2023-04-12 04:30:08'),
(34, 'App\\Models\\Facilitator', 98, 'MyApp', '8b968c4f55aa45d25557809def3990bd9cc37efafc41eacf4e4f08706dd6305b', '[\"*\"]', '2023-04-07 10:09:02', '2023-04-07 10:02:47', '2023-04-07 10:09:02'),
(35, 'App\\Models\\Facilitator', 39, 'authToken', 'c7d54f386347dc46109f8d4a6f0e07f97e099d9455766c0662def41e19041c20', '[\"*\"]', NULL, '2023-04-08 16:26:00', '2023-04-08 16:26:00'),
(36, 'App\\Models\\Facilitator', 50, 'MyApp', '635af3c20ae75972cfe9a5d438c38f6cc411230dd8ac625cba40840ae49c9547', '[\"*\"]', '2023-04-10 02:07:51', '2023-04-10 01:24:33', '2023-04-10 02:07:51'),
(37, 'App\\Models\\Facilitator', 46, 'MyApp', 'ecb6ab8ca79d796f263742d4b29ae7ba4dffc91813dcf0339177b045203ce75d', '[\"*\"]', '2023-04-10 15:23:17', '2023-04-10 03:01:12', '2023-04-10 15:23:17'),
(38, 'App\\Models\\Facilitator', 97, 'MyApp', '66e99e8f4e62bc260078ba3be6908dcae0ea87504750e9d6b1450ce8bc97f9d0', '[\"*\"]', '2023-04-10 11:29:04', '2023-04-10 09:49:36', '2023-04-10 11:29:04'),
(39, 'App\\Models\\Facilitator', 97, 'MyApp', '102bb02f6b8e1d057be7b0c8923d847d57f61f771ae67abd4e6bd26b5682479d', '[\"*\"]', '2023-04-10 13:01:21', '2023-04-10 09:59:06', '2023-04-10 13:01:21'),
(40, 'App\\Models\\Facilitator', 15, 'authToken', 'cdea5034673f858dc75eb953a0bff870a5af4a2b44a64f3f08877f1e182b8183', '[\"*\"]', NULL, '2023-04-10 15:24:17', '2023-04-10 15:24:17'),
(41, 'App\\Models\\Facilitator', 39, 'MyApp', '30252e45fd9372233d1a4d60408ff4b8f9f577d3653c2cf9af173f8c2de234d8', '[\"*\"]', '2023-04-11 02:38:14', '2023-04-10 16:12:34', '2023-04-11 02:38:14'),
(42, 'App\\Models\\Facilitator', 46, 'MyApp', 'aa690ac2fec81a4fcfb0257693b146354cb1198b9075f754d42644870a8be6ac', '[\"*\"]', '2023-04-13 11:30:10', '2023-04-10 16:35:32', '2023-04-13 11:30:10'),
(43, 'App\\Models\\Facilitator', 46, 'MyApp', 'c1d569420f9804b9137dcd4c8f0c5fa978e119f2ec4d0acd119d65168263c4c2', '[\"*\"]', '2023-04-10 17:00:37', '2023-04-10 16:40:06', '2023-04-10 17:00:37'),
(44, 'App\\Models\\Facilitator', 39, 'MyApp', '556653ade09fa323426e3b7afa814791316b5bdb0968e72f2643e428e1b69301', '[\"*\"]', '2023-04-11 20:44:02', '2023-04-11 05:15:11', '2023-04-11 20:44:02'),
(45, 'App\\Models\\Facilitator', 38, 'MyApp', 'ff770d1b355f44d4449080f06a12e83fa53e0538cd3169a57d208ec5d3411c1c', '[\"*\"]', '2023-05-23 01:52:23', '2023-04-11 20:43:19', '2023-05-23 01:52:23'),
(46, 'App\\Models\\Facilitator', 39, 'MyApp', '456c1c01f06dc71a925e9ff6434fe6ad98f841ffd693737b7fb1e7197c7b8bb5', '[\"*\"]', '2023-04-27 21:56:22', '2023-04-11 20:45:13', '2023-04-27 21:56:22'),
(47, 'App\\Models\\Facilitator', 48, 'MyApp', '74f958064528773b64a3371147dfb329e050ab9be8745c79f0e8c642e62f4945', '[\"*\"]', '2023-04-11 23:36:11', '2023-04-11 23:15:24', '2023-04-11 23:36:11'),
(48, 'App\\Models\\Facilitator', 20, 'MyApp', '81aadf398a385d7f25d4abe21aaf11e15ed245babee6b9e897fc3af0cbfedde8', '[\"*\"]', '2023-04-12 04:33:16', '2023-04-12 04:24:48', '2023-04-12 04:33:16'),
(49, 'App\\Models\\Facilitator', 20, 'MyApp', 'efef92227433b85d472ca36346066e4ce2fcf60b16ae99df52819dadc1eb713e', '[\"*\"]', '2023-04-12 04:45:57', '2023-04-12 04:28:35', '2023-04-12 04:45:57'),
(50, 'App\\Models\\Facilitator', 20, 'MyApp', 'c55765b399d7b5ea022bc04ae3b8777de69cfc77591d9f6f9c757b734b0109c0', '[\"*\"]', '2023-04-12 04:47:09', '2023-04-12 04:33:26', '2023-04-12 04:47:09'),
(51, 'App\\Models\\Facilitator', 36, 'MyApp', 'baf33da5693677253c927cba0b1543bee279dafeaa6079918ac9deca3db68d04', '[\"*\"]', '2023-04-28 05:56:49', '2023-04-12 04:36:46', '2023-04-28 05:56:49'),
(52, 'App\\Models\\Facilitator', 39, 'authToken', 'c5abf4b6f8dca9e126e6ce3903c4dfff04989e72f5c206ae4f9196713e6ae2d8', '[\"*\"]', NULL, '2023-04-12 04:45:05', '2023-04-12 04:45:05'),
(53, 'App\\Models\\Facilitator', 20, 'MyApp', '006395a7fbcb6b58adca725ef8f0fc8354dfac31b476a2a894a78d9999df2e17', '[\"*\"]', '2023-04-28 05:14:43', '2023-04-12 04:46:47', '2023-04-28 05:14:43'),
(54, 'App\\Models\\Facilitator', 20, 'MyApp', 'd3407623e1fdcff0b6749b96035bae13319fbe1d52d5a2add9335e48b7197819', '[\"*\"]', '2023-04-28 05:18:02', '2023-04-12 04:47:16', '2023-04-28 05:18:02'),
(55, 'App\\Models\\Facilitator', 39, 'authToken', '8ccf96f3548240c7c9677b1a043e23e912bc1f3dfd0a96af788a587886836470', '[\"*\"]', NULL, '2023-04-12 04:53:27', '2023-04-12 04:53:27'),
(56, 'App\\Models\\Facilitator', 39, 'authToken', '7167c92f428f9586bff6a583da5c1399e3b64fab2e7e15e2b3e1b9f102c329e6', '[\"*\"]', NULL, '2023-04-12 07:48:53', '2023-04-12 07:48:53'),
(57, 'App\\Models\\Facilitator', 48, 'MyApp', '0bbac7ae2fcd94e2f670a37b1d463cd1cc1c6f2358ca1d1426fd4187bec3afdf', '[\"*\"]', '2023-04-12 17:33:17', '2023-04-12 16:42:29', '2023-04-12 17:33:17'),
(58, 'App\\Models\\Facilitator', 39, 'authToken', '0d28e68944103c6d74cdbf01fb495149a52b13dc92e34313598045471eacb774', '[\"*\"]', NULL, '2023-04-13 04:44:37', '2023-04-13 04:44:37'),
(59, 'App\\Models\\Facilitator', 39, 'MyApp', '073fe243742d74b4b5903a5c277387e26f42fb6cef9cecd87921b8779d50c636', '[\"*\"]', '2023-06-05 16:47:16', '2023-04-13 05:00:25', '2023-06-05 16:47:16'),
(60, 'App\\Models\\Facilitator', 99, 'MyApp', '8f3230dae2e9b0966d884b11c3ac900bbd975d9931c88694a4d6636f90b099bf', '[\"*\"]', '2023-04-13 09:31:24', '2023-04-13 05:36:30', '2023-04-13 09:31:24'),
(61, 'App\\Models\\Facilitator', 97, 'MyApp', '9cb26168f26f8532a75b2163ebfa48a6dba5287ead7f4eb2bd5a3c2eb05730dd', '[\"*\"]', '2023-04-13 09:34:34', '2023-04-13 09:31:44', '2023-04-13 09:34:34'),
(62, 'App\\Models\\Facilitator', 99, 'MyApp', '1f73757fc297b2a7d56992dcf1b2cfdeed4631fe15cd61d1274b07cc09def514', '[\"*\"]', '2023-04-13 11:33:23', '2023-04-13 09:50:03', '2023-04-13 11:33:23'),
(63, 'App\\Models\\Facilitator', 99, 'MyApp', '414b2481bbb6e8faacbe922a988279979afaee6925609906b35475a0b3f01196', '[\"*\"]', '2023-04-13 10:08:34', '2023-04-13 10:06:54', '2023-04-13 10:08:34'),
(64, 'App\\Models\\Facilitator', 46, 'MyApp', '7f79ee992988718ee9f5c2a458a3f07ca2657639563ba273e6e83182b0ccc88c', '[\"*\"]', '2023-04-13 11:26:41', '2023-04-13 10:13:10', '2023-04-13 11:26:41'),
(65, 'App\\Models\\Facilitator', 46, 'MyApp', '0808301f32aae05082b765109010b45755460d9b668a101a5a81a1e15e733ce7', '[\"*\"]', '2023-04-13 10:28:51', '2023-04-13 10:14:13', '2023-04-13 10:28:51'),
(66, 'App\\Models\\Facilitator', 97, 'MyApp', '72bc8d6f33e31366ce954416f39436833995d063c4c0283325fcd48dd75074c1', '[\"*\"]', '2023-04-13 11:19:34', '2023-04-13 10:29:43', '2023-04-13 11:19:34'),
(67, 'App\\Models\\Facilitator', 99, 'MyApp', 'a57d93a174f34996a8198f1eba4b8dd96a19bd34796144903e1e5ff018fbe67a', '[\"*\"]', '2023-04-13 11:34:05', '2023-04-13 11:20:38', '2023-04-13 11:34:05'),
(68, 'App\\Models\\Facilitator', 99, 'MyApp', 'bcb6f1867c8a72668cc12c997371d9539fe5327873cb75483f217f2dab9cb25e', '[\"*\"]', '2023-04-13 11:34:06', '2023-04-13 11:27:12', '2023-04-13 11:34:06'),
(69, 'App\\Models\\Facilitator', 99, 'MyApp', 'aba1d2e801fa1d0dd815c158bc0db337c8ea2c1cc438bc31dc5ff3774f00d1ad', '[\"*\"]', '2023-04-13 11:34:13', '2023-04-13 11:27:35', '2023-04-13 11:34:13'),
(70, 'App\\Models\\Facilitator', 99, 'MyApp', 'f9b601e53bd1bfd420a270815581c1e8dc716d6b1a992dbc8cbfc1ad7a089e9e', '[\"*\"]', '2023-04-26 18:27:43', '2023-04-13 11:30:40', '2023-04-26 18:27:43'),
(71, 'App\\Models\\Facilitator', 99, 'MyApp', 'ede5faca2c54ed2fe0a31b41f8a18b6c9f9d8ce0f225a23251ab9120f9e4cd7e', '[\"*\"]', '2023-09-22 21:13:42', '2023-04-13 11:34:24', '2023-09-22 21:13:42'),
(72, 'App\\Models\\Facilitator', 99, 'MyApp', '4ea18c0cff8e5acd9526504134c8f6c4afafb620a757dc386f38a1e7a7bd2ea7', '[\"*\"]', '2023-04-13 11:56:21', '2023-04-13 11:38:26', '2023-04-13 11:56:21'),
(73, 'App\\Models\\Facilitator', 99, 'MyApp', '61f37fbebaf0c8ca2ed227ddb7a7d4156ed1d82dea676bae1ad8ece6acc43868', '[\"*\"]', '2023-04-17 14:23:08', '2023-04-17 14:22:48', '2023-04-17 14:23:08'),
(74, 'App\\Models\\Facilitator', 99, 'MyApp', '1bfb4d1f282737277f670fac2580f4c05910f5f49442e97865b34e643fdea6bd', '[\"*\"]', NULL, '2023-04-18 14:23:33', '2023-04-18 14:23:33'),
(75, 'App\\Models\\Facilitator', 99, 'MyApp', '8abab8485ac2ed15cfdfae01c9666df034896a684cc4da604a6402e2fca8c355', '[\"*\"]', '2023-04-18 15:58:30', '2023-04-18 15:58:05', '2023-04-18 15:58:30'),
(76, 'App\\Models\\Facilitator', 42, 'MyApp', '9db13472d1cf4c8f3e06372a28e62374999a11cd05f8c2352053227b3342b2ef', '[\"*\"]', '2023-04-19 03:56:03', '2023-04-19 03:52:01', '2023-04-19 03:56:03'),
(77, 'App\\Models\\Facilitator', 42, 'MyApp', '2008257751f8700d6d71fa7b83ee3035ad174b0fa8a35e9d2b19ee42f7ddfefa', '[\"*\"]', '2023-04-19 04:22:23', '2023-04-19 04:00:16', '2023-04-19 04:22:23'),
(78, 'App\\Models\\Facilitator', 48, 'MyApp', '4f0f65b45330d04b5d2ca6b5569411cf74d0715d467e6439176d67be494d555d', '[\"*\"]', '2023-04-22 01:48:04', '2023-04-22 00:17:27', '2023-04-22 01:48:04'),
(79, 'App\\Models\\Facilitator', 48, 'MyApp', '6a85dc48be7759c4de91eec3a45746ae35bbde43926ab504a61f84ce06d4724c', '[\"*\"]', '2023-05-15 22:47:09', '2023-04-26 00:30:10', '2023-05-15 22:47:09'),
(80, 'App\\Models\\Facilitator', 48, 'MyApp', '29a32f99789ef049b45b9c540b5600ec029af2e2e0d1fca357b1265ffe92e1c4', '[\"*\"]', '2023-04-26 16:01:32', '2023-04-26 14:39:33', '2023-04-26 16:01:32'),
(81, 'App\\Models\\Facilitator', 99, 'MyApp', '3b58c2d08994750935b2338e7606c316997c7f8081df026bf1831aa7efefea8d', '[\"*\"]', '2023-05-04 17:57:33', '2023-04-26 18:28:31', '2023-05-04 17:57:33'),
(82, 'App\\Models\\Facilitator', 48, 'MyApp', '6fd55b3b75f1191925a11e215e762d8607a9b8b70f1c22399d0b5c887a34b3cb', '[\"*\"]', '2023-04-27 09:49:15', '2023-04-27 09:28:57', '2023-04-27 09:49:15'),
(83, 'App\\Models\\Facilitator', 48, 'MyApp', '71a82ad04a4d613775f1e9f78de78ed871ec16a1ace7180dafe4ce88a16eb1d8', '[\"*\"]', '2023-04-27 11:40:14', '2023-04-27 10:58:33', '2023-04-27 11:40:14'),
(84, 'App\\Models\\Facilitator', 99, 'MyApp', 'e15504e50cee41695654652fbf2e78681f9f364c0489715316975dd0e3d1c247', '[\"*\"]', '2023-04-27 11:53:41', '2023-04-27 11:40:19', '2023-04-27 11:53:41'),
(85, 'App\\Models\\Facilitator', 42, 'MyApp', '18686aee54325ac6517204cd6d739209bb38ad09c2da1665f28cbfc16377200d', '[\"*\"]', '2023-04-28 05:16:02', '2023-04-28 00:10:19', '2023-04-28 05:16:02'),
(86, 'App\\Models\\Facilitator', 20, 'MyApp', '1cf5373abc3a069e16a315d309823faba25bc1b240a8b096fb255d72a27b331b', '[\"*\"]', '2023-04-28 06:07:51', '2023-04-28 05:18:20', '2023-04-28 06:07:51'),
(87, 'App\\Models\\Facilitator', 20, 'MyApp', 'e807cfcecaba3c3982f487222ef7fb6b9f402c5b45f31d0c239b19becaa27f47', '[\"*\"]', '2023-04-28 05:57:24', '2023-04-28 05:18:45', '2023-04-28 05:57:24'),
(88, 'App\\Models\\Facilitator', 42, 'MyApp', 'c812138b9acbddff8832d5547cd4f15457cb80e6087e55ba8b203437dd2a36fa', '[\"*\"]', '2023-04-28 05:59:55', '2023-04-28 05:57:41', '2023-04-28 05:59:55'),
(89, 'App\\Models\\Facilitator', 20, 'MyApp', '4ea884776fbbfc4843c71df900bb88ecd18c2d22bae47dfcd78840b7b8ab1cf9', '[\"*\"]', '2023-04-28 06:09:01', '2023-04-28 05:59:03', '2023-04-28 06:09:01'),
(90, 'App\\Models\\Facilitator', 42, 'MyApp', 'f68bb08f45b348ee0b9b850ae364e6b934af37227a3bbfb8ef588542fdbef4bc', '[\"*\"]', '2023-04-28 06:00:13', '2023-04-28 06:00:12', '2023-04-28 06:00:13'),
(91, 'App\\Models\\Facilitator', 36, 'MyApp', '691f8f2cfab739cdae477e7cfa9f2f4d692a012b58252a3b7f6f775eee0f1aa8', '[\"*\"]', '2023-04-28 06:03:36', '2023-04-28 06:00:16', '2023-04-28 06:03:36'),
(92, 'App\\Models\\Facilitator', 36, 'MyApp', '479a8a8c3a4fa3566118d5f6b4365ac3243602d8ec44777adfb19c7723597265', '[\"*\"]', '2023-04-28 06:09:43', '2023-04-28 06:05:21', '2023-04-28 06:09:43'),
(93, 'App\\Models\\Facilitator', 20, 'MyApp', '3a41216d42246682bbd1a6968cc79aa61897648795aa323934f612a731973c81', '[\"*\"]', '2023-04-28 06:08:36', '2023-04-28 06:08:02', '2023-04-28 06:08:36'),
(94, 'App\\Models\\Facilitator', 20, 'MyApp', 'dba2ac8ea1010eb13d34256a608ed57a8e56fb32785eb417ea6407c5661127b2', '[\"*\"]', '2023-04-28 19:36:13', '2023-04-28 06:09:08', '2023-04-28 19:36:13'),
(95, 'App\\Models\\Facilitator', 36, 'MyApp', 'bdc3c268ef9814390176b062d2624647ea50dea83d9c3398fe289db88ad2dae6', '[\"*\"]', '2023-05-09 21:04:46', '2023-04-28 06:10:01', '2023-05-09 21:04:46'),
(96, 'App\\Models\\Facilitator', 20, 'MyApp', '88bf9a8e4c607e1725231ec1cc612db09ed116c9cfc0e00e80098dc6d4a4fba5', '[\"*\"]', '2023-04-28 19:35:48', '2023-04-28 18:38:19', '2023-04-28 19:35:48'),
(97, 'App\\Models\\Facilitator', 20, 'MyApp', 'e7709ed17d8a86abc06ad3e6451bdee9e655335947822e2735fe89ec8c74119b', '[\"*\"]', '2023-05-10 03:14:58', '2023-04-28 19:24:09', '2023-05-10 03:14:58'),
(98, 'App\\Models\\Facilitator', 39, 'authToken', '952d47b3850e0798deb9cf27a95a827f0656c3430e2d942b8b97186a75da188e', '[\"*\"]', NULL, '2023-04-29 06:22:22', '2023-04-29 06:22:22'),
(99, 'App\\Models\\Facilitator', 39, 'MyApp', 'c9f5b5325113b6444db60cff23ed29927bad2dff2e759451dacc2e985310ad33', '[\"*\"]', '2023-05-03 02:32:18', '2023-04-29 06:23:47', '2023-05-03 02:32:18'),
(100, 'App\\Models\\Facilitator', 46, 'MyApp', '13e1da91a60f93b9c104c267388ca5344b36098a5b33db925e24df38a9259fee', '[\"*\"]', '2023-05-02 18:31:23', '2023-05-02 18:04:58', '2023-05-02 18:31:23'),
(101, 'App\\Models\\Facilitator', 46, 'MyApp', '62bb045b68448e6cb4ff5b97904ec72d4d1b82b376e587e19b60f1c0133bad2c', '[\"*\"]', '2023-05-02 18:32:28', '2023-05-02 18:32:09', '2023-05-02 18:32:28'),
(102, 'App\\Models\\Facilitator', 4, 'MyApp', 'eb69aa93a4d1d7c64fe817e8bd79883f98654063fd4d115461a1de6767ba5233', '[\"*\"]', '2023-05-02 18:41:44', '2023-05-02 18:40:13', '2023-05-02 18:41:44'),
(103, 'App\\Models\\Facilitator', 4, 'MyApp', 'd17702e85a14ac0f75bf0562fb1627a9cf7d6cb951857f039af7225020ed8b97', '[\"*\"]', '2023-05-02 18:42:37', '2023-05-02 18:42:33', '2023-05-02 18:42:37'),
(104, 'App\\Models\\Facilitator', 4, 'MyApp', '5e2434a012ca8effd4ba7b5520ff00fbf08e4747638766cda468d8f484d88a2c', '[\"*\"]', '2023-05-02 18:43:26', '2023-05-02 18:42:54', '2023-05-02 18:43:26'),
(105, 'App\\Models\\Facilitator', 4, 'MyApp', '7f2a45287c1c9b3075f31c4765ba15d0c4209a4a3b9653fc84a2c7dfb8769081', '[\"*\"]', '2023-05-08 11:31:02', '2023-05-02 19:53:14', '2023-05-08 11:31:02'),
(106, 'App\\Models\\Facilitator', 46, 'MyApp', '0043ed7627d126686a915bda03a0ec655c3e0a96d04b1f53e487fb15d225d965', '[\"*\"]', '2023-05-04 17:50:19', '2023-05-04 17:44:45', '2023-05-04 17:50:19'),
(107, 'App\\Models\\Facilitator', 50, 'MyApp', '7dcac7d770a5ee64302a0afc32d5dd00de74e9a3d6d9d840d640737de91e2c22', '[\"*\"]', '2023-05-04 18:09:55', '2023-05-04 17:52:25', '2023-05-04 18:09:55'),
(108, 'App\\Models\\Facilitator', 46, 'MyApp', '1839c58a50d64ab32b38667f0cbb80dcba6ce903d5da2fca76837f4118410b83', '[\"*\"]', '2023-05-04 18:05:25', '2023-05-04 18:04:31', '2023-05-04 18:05:25'),
(109, 'App\\Models\\Facilitator', 50, 'MyApp', '490e9c4aa24859812faf132dc835382fe57e071083eba41b113c29240c038a11', '[\"*\"]', '2023-05-04 18:44:46', '2023-05-04 18:07:17', '2023-05-04 18:44:46'),
(110, 'App\\Models\\Facilitator', 50, 'MyApp', 'c5fa573d42440bc48b6042be9ab4ffa33c0dc7056b7d37adfd26407a14d78a78', '[\"*\"]', '2023-05-04 18:48:18', '2023-05-04 18:18:35', '2023-05-04 18:48:18'),
(111, 'App\\Models\\Facilitator', 4, 'MyApp', 'ee331c846fd7ee49460a9ed7111ff45b2be551f9c79ad797429a5405d5485c7f', '[\"*\"]', '2023-05-04 18:31:53', '2023-05-04 18:19:10', '2023-05-04 18:31:53'),
(112, 'App\\Models\\Facilitator', 50, 'MyApp', '84a89a78713a91609e9b6998cd989e2483806f0f543e9524480ce549ccf4a208', '[\"*\"]', '2023-05-05 15:27:21', '2023-05-04 18:49:03', '2023-05-05 15:27:21'),
(113, 'App\\Models\\Facilitator', 50, 'MyApp', '4133a08fa52a316346eb0c42d9666d5e12bbc04e10c5260e0372deb3e2bc3dcf', '[\"*\"]', '2023-05-04 18:49:47', '2023-05-04 18:49:43', '2023-05-04 18:49:47'),
(114, 'App\\Models\\Facilitator', 46, 'MyApp', 'eab4996419b241f0d638157f5106c6a57e623b5d75a22479501a3895a4216044', '[\"*\"]', '2023-05-04 19:08:59', '2023-05-04 19:07:39', '2023-05-04 19:08:59'),
(115, 'App\\Models\\Facilitator', 20, 'MyApp', 'b2ac35b316d6146e16d9ea1995642ea58f2d6ebea254b1f66ea6312fed17f7eb', '[\"*\"]', '2023-05-08 19:35:07', '2023-05-04 23:44:35', '2023-05-08 19:35:07'),
(116, 'App\\Models\\Facilitator', 42, 'MyApp', '7449b6fc6776320c1b355fe13f62c83cf91935b2c0e14a2ffd5a63db04d6a0c6', '[\"*\"]', '2023-05-05 01:40:09', '2023-05-05 01:40:00', '2023-05-05 01:40:09'),
(117, 'App\\Models\\Facilitator', 39, 'MyApp', '7b0be2df4cc79f9ea8558b3f703e951d4a6b47ca3bac81a72d8a982bba57a982', '[\"*\"]', '2023-05-05 02:12:06', '2023-05-05 02:11:27', '2023-05-05 02:12:06'),
(118, 'App\\Models\\Facilitator', 42, 'MyApp', '418a9f8c38e32a0245d35fa6e7369b4ce7d37edc86481684bd6d1ecd03ba2441', '[\"*\"]', '2023-07-05 19:12:39', '2023-05-05 04:02:18', '2023-07-05 19:12:39'),
(119, 'App\\Models\\Facilitator', 109, 'authToken', '146907fbd6ae8ca146161ed93d4dd6bd54ceb076d067c928d8eac5a2af540d43', '[\"*\"]', NULL, '2023-05-05 04:20:07', '2023-05-05 04:20:07'),
(120, 'App\\Models\\Facilitator', 4, 'MyApp', '8f99ea4fbc2805aafb0402554f237764984c6d20046e28a151ebd5987581e9f6', '[\"*\"]', '2023-05-05 09:28:53', '2023-05-05 09:28:10', '2023-05-05 09:28:53'),
(121, 'App\\Models\\Facilitator', 45, 'MyApp', 'ee8fb74cbbb81b6a2cbe2019db4c24332bdd35dde92ee9bed78bad874e92ff2e', '[\"*\"]', '2023-05-05 19:11:32', '2023-05-05 12:52:37', '2023-05-05 19:11:32'),
(122, 'App\\Models\\Facilitator', 46, 'MyApp', 'b1102f3153a82716ca0282906a4358dd1c7cf2e1ae64e57d1e94b599b39ff9cf', '[\"*\"]', '2023-05-09 12:34:03', '2023-05-05 15:29:46', '2023-05-09 12:34:03'),
(123, 'App\\Models\\Facilitator', 50, 'MyApp', '1bf7c00296d93209bf6e52ee3751bee130cbf142bb247aa1993bc7e6ffed4f24', '[\"*\"]', '2023-05-05 19:14:39', '2023-05-05 19:14:39', '2023-05-05 19:14:39'),
(124, 'App\\Models\\Facilitator', 39, 'MyApp', 'c5815e87c6bab3a5f3301e329bac5389ef11a49931a1ab15e687bd6d787c818c', '[\"*\"]', '2023-05-08 19:24:54', '2023-05-07 11:56:46', '2023-05-08 19:24:54'),
(125, 'App\\Models\\Facilitator', 4, 'MyApp', 'ddb3566cf884f8b23bf593fd8139d2e6213efa230e6beaf27da7e2a27b4d2790', '[\"*\"]', '2023-05-08 16:23:45', '2023-05-08 16:23:14', '2023-05-08 16:23:45'),
(126, 'App\\Models\\Facilitator', 39, 'MyApp', 'd2b63d326ad59502c27941f38f100e72610e4e9ca681bfd6b33c879d33b5c223', '[\"*\"]', '2023-05-08 19:27:19', '2023-05-08 19:27:13', '2023-05-08 19:27:19'),
(127, 'App\\Models\\Facilitator', 39, 'MyApp', 'ec4c13b48d402ce88532373953d79b5cc7461c9a7958814394037db9a0593a7b', '[\"*\"]', '2023-05-08 19:33:21', '2023-05-08 19:33:16', '2023-05-08 19:33:21'),
(128, 'App\\Models\\Facilitator', 39, 'MyApp', '48f7e53874bc2b37a314776f3b9a0ef64e0c5f1847dd374fb99d3b2c4ee8a059', '[\"*\"]', '2023-05-08 19:36:05', '2023-05-08 19:36:00', '2023-05-08 19:36:05'),
(129, 'App\\Models\\Facilitator', 20, 'MyApp', '993d413c9aeafc3d217185c8e9ca96e71a2e7857f317fc17781be8dbd76ff073', '[\"*\"]', '2023-05-08 22:06:02', '2023-05-08 19:36:28', '2023-05-08 22:06:02'),
(130, 'App\\Models\\Facilitator', 39, 'MyApp', '8d829a76f86048d1dddd2b297c8ef283b2444c9ce525b359a447db2ff5422fde', '[\"*\"]', '2023-05-08 21:47:26', '2023-05-08 21:47:21', '2023-05-08 21:47:26'),
(131, 'App\\Models\\Facilitator', 39, 'MyApp', '50ba402dc4b148c8060d0faa752cf8253c1ec081d4649510af826ce6928dae0a', '[\"*\"]', '2023-05-08 21:50:50', '2023-05-08 21:50:43', '2023-05-08 21:50:50'),
(132, 'App\\Models\\Facilitator', 39, 'MyApp', '05eef656197d3f2cf4972a6baa1b7a3850a5e0e15ae57524a78936c0d3617bc6', '[\"*\"]', '2023-05-08 22:09:37', '2023-05-08 22:09:33', '2023-05-08 22:09:37'),
(133, 'App\\Models\\Facilitator', 20, 'MyApp', 'fe5730d4bec6bbcbac87a1dea9f0e32e6f92615d631aaaeb08d16fb412c703e0', '[\"*\"]', '2023-05-08 22:17:29', '2023-05-08 22:09:48', '2023-05-08 22:17:29'),
(134, 'App\\Models\\Facilitator', 20, 'MyApp', 'f39b7f038c40ef69b559ba4050a4347b5223bbd9384356cf479833b8c6ca9d61', '[\"*\"]', '2023-05-08 22:25:02', '2023-05-08 22:14:55', '2023-05-08 22:25:02'),
(135, 'App\\Models\\Facilitator', 20, 'MyApp', 'bdedd98444cf873f442d421b65fe334ade400080a132470a780fa279714d5fa8', '[\"*\"]', '2023-05-09 19:45:31', '2023-05-08 22:26:16', '2023-05-09 19:45:31'),
(136, 'App\\Models\\Facilitator', 20, 'MyApp', '7f138c48937cabefa96fe4c08543b1e6fd68d5bb2e070d907f30241dfda8061b', '[\"*\"]', '2023-05-08 22:38:31', '2023-05-08 22:32:59', '2023-05-08 22:38:31'),
(137, 'App\\Models\\Facilitator', 20, 'MyApp', 'e6bb3ffe1032ee6095f4d998a62487cac43c39975b5f28d8cd0fea53c920132e', '[\"*\"]', '2023-05-08 22:37:44', '2023-05-08 22:37:40', '2023-05-08 22:37:44'),
(138, 'App\\Models\\Facilitator', 20, 'MyApp', '6ace1c365ba41d7746b37e9cdad7ac44161cb7626f89998a7b09ab005676c0fa', '[\"*\"]', '2023-05-08 22:40:13', '2023-05-08 22:39:28', '2023-05-08 22:40:13'),
(139, 'App\\Models\\Facilitator', 20, 'MyApp', '2b7424b7539ada0569d8e8f41956d0c400dc1fa68a8fe3f52f95dbc1a1dca877', '[\"*\"]', '2023-05-08 22:46:07', '2023-05-08 22:46:01', '2023-05-08 22:46:07'),
(140, 'App\\Models\\Facilitator', 20, 'MyApp', 'bcf39aa418dce744031c42b6c0057c370eba7faa14e6c62fc82c3d8a1636d1bf', '[\"*\"]', '2023-05-08 22:47:16', '2023-05-08 22:47:09', '2023-05-08 22:47:16'),
(141, 'App\\Models\\Facilitator', 20, 'MyApp', '5b46e2ec7b54750300c44206f02aa51ced6112866e6195ff64e8cbdf12a48161', '[\"*\"]', '2023-05-08 23:10:19', '2023-05-08 23:10:13', '2023-05-08 23:10:19'),
(142, 'App\\Models\\Facilitator', 20, 'MyApp', 'fb8a6c5318ea81726612f90240ae71e51edc9624fce31d4b13f5dd8b77bd243f', '[\"*\"]', '2023-05-08 23:13:08', '2023-05-08 23:12:40', '2023-05-08 23:13:08'),
(143, 'App\\Models\\Facilitator', 20, 'MyApp', '435709770cc9d14550fc87e43db4252eb83323fd266bca4240164f81b46c59f3', '[\"*\"]', '2023-05-08 23:14:01', '2023-05-08 23:13:56', '2023-05-08 23:14:01'),
(144, 'App\\Models\\Facilitator', 20, 'MyApp', '6643c4599c89b5946b02b5886e3da5a31de048e7b759386332386bf22f7b6ed0', '[\"*\"]', '2023-05-08 23:51:22', '2023-05-08 23:29:18', '2023-05-08 23:51:22'),
(145, 'App\\Models\\Facilitator', 39, 'MyApp', 'd97ae5c3f4fad9d3e92b81da0b422d6b76338e95a5dcabb750636eae0eab58da', '[\"*\"]', '2023-05-08 23:35:19', '2023-05-08 23:35:12', '2023-05-08 23:35:19'),
(146, 'App\\Models\\Facilitator', 39, 'MyApp', '51cc896b0b903c7ca83e783f36d02dbf26d6289d6504ffa0f7ebca3e568d0a50', '[\"*\"]', '2023-05-09 03:03:58', '2023-05-09 03:03:54', '2023-05-09 03:03:58'),
(147, 'App\\Models\\Facilitator', 39, 'MyApp', '05890bdb42a0a9966a444983b4c1c741feaf77c1936a65cddaa7e9e6d109dd74', '[\"*\"]', '2023-05-09 05:05:49', '2023-05-09 05:05:44', '2023-05-09 05:05:49'),
(148, 'App\\Models\\Facilitator', 110, 'MyApp', 'f6069873e5a5b6523405b0d3575706bafdc1f9fb2f40be2c80c982db81e53f33', '[\"*\"]', '2023-05-09 12:36:52', '2023-05-09 12:35:39', '2023-05-09 12:36:52'),
(149, 'App\\Models\\Facilitator', 110, 'MyApp', 'a21130bcd14ee7a2dc748b025b5a1a5e2cae3e74af3f6a715d3f9d245e23481e', '[\"*\"]', '2023-05-09 20:41:53', '2023-05-09 12:37:30', '2023-05-09 20:41:53'),
(150, 'App\\Models\\Facilitator', 4, 'MyApp', 'e287870df3b8e2bbe80f2a73b79b3af6c554016d2edcbb59b24dc895f94d7ee0', '[\"*\"]', '2023-05-09 13:25:33', '2023-05-09 13:16:19', '2023-05-09 13:25:33'),
(151, 'App\\Models\\Facilitator', 4, 'MyApp', 'd30edabbee9998dbf5918ca617328fef810ed30dd50312f2a54fc596993f139c', '[\"*\"]', '2023-05-09 13:27:51', '2023-05-09 13:25:58', '2023-05-09 13:27:51'),
(152, 'App\\Models\\Facilitator', 4, 'MyApp', '2a222aac3025f233410dca8e2dedbddd01c70f8745f8c6132710bef8908209e3', '[\"*\"]', '2023-05-09 13:31:33', '2023-05-09 13:31:32', '2023-05-09 13:31:33'),
(153, 'App\\Models\\Facilitator', 4, 'MyApp', 'd830322d0f0ce64537430b025b4b671b679f2d0164365789b2eb612b750c73b6', '[\"*\"]', '2023-05-09 13:33:08', '2023-05-09 13:32:56', '2023-05-09 13:33:08'),
(154, 'App\\Models\\Facilitator', 4, 'MyApp', '3e48a5dd9cc7cc2614954e2a50b2f1598270a7bffcb84d58961cbde4945a5a4a', '[\"*\"]', '2023-05-09 16:13:55', '2023-05-09 16:08:40', '2023-05-09 16:13:55'),
(155, 'App\\Models\\Facilitator', 4, 'MyApp', 'b9e8510b6435934d1136a03ed275775d1ccca303a4769748c7b4cb2e0febaa31', '[\"*\"]', '2023-05-09 16:14:07', '2023-05-09 16:13:59', '2023-05-09 16:14:07'),
(156, 'App\\Models\\Facilitator', 4, 'MyApp', '575eb9ae1c6f37a71c85315968afa83b881413297df110eb7e2bfcba7a5a7dfc', '[\"*\"]', '2023-05-09 16:15:23', '2023-05-09 16:14:25', '2023-05-09 16:15:23'),
(157, 'App\\Models\\Facilitator', 4, 'MyApp', 'cca36e7e7cda329c776196254801519db3028ee236c29623ad0e416e98939efa', '[\"*\"]', '2023-05-09 16:49:33', '2023-05-09 16:15:25', '2023-05-09 16:49:33'),
(158, 'App\\Models\\Facilitator', 39, 'MyApp', '803110b1f5612a2cfbe7d38d48162d5f3e56e1b1d268d747d656a4b841f55d4f', '[\"*\"]', '2023-05-09 19:36:30', '2023-05-09 19:36:24', '2023-05-09 19:36:30'),
(159, 'App\\Models\\Facilitator', 39, 'MyApp', '0b1e9096df96a2eb8f5b539f9a9eb262a58956550a1f51722af58ac38c726a72', '[\"*\"]', '2023-05-09 19:40:23', '2023-05-09 19:40:16', '2023-05-09 19:40:23'),
(160, 'App\\Models\\Facilitator', 20, 'MyApp', 'de9f5d6e06ed4a80e1a7bc8ff58fb9ba544edbf22107f173f8e2ccfe0996707d', '[\"*\"]', '2023-05-09 19:40:49', '2023-05-09 19:40:37', '2023-05-09 19:40:49'),
(161, 'App\\Models\\Facilitator', 20, 'MyApp', '3ead5f9000a102eb547df529e8f5bca9fb222140b0d061b6361c1899d3478b3e', '[\"*\"]', '2023-05-09 20:29:12', '2023-05-09 19:45:41', '2023-05-09 20:29:12'),
(162, 'App\\Models\\Facilitator', 20, 'MyApp', '9727a33b631805803d40f3f6edfffbf2be6df29f5930f9a97aef78792d6cad2d', '[\"*\"]', '2023-05-09 20:01:05', '2023-05-09 20:00:37', '2023-05-09 20:01:05'),
(163, 'App\\Models\\Facilitator', 110, 'MyApp', '128a7e00c58abf1d1b85e779cc45f950c5fea40c47563585164c1757a2884bb8', '[\"*\"]', '2023-05-09 20:21:30', '2023-05-09 20:21:24', '2023-05-09 20:21:30'),
(164, 'App\\Models\\Facilitator', 110, 'MyApp', 'e0e3b93c47b74f640d7884f0c7ea7c5eaf666a0c0d529488a8d8dc5af4f1567d', '[\"*\"]', '2023-05-09 20:25:18', '2023-05-09 20:25:10', '2023-05-09 20:25:18'),
(165, 'App\\Models\\Facilitator', 20, 'MyApp', 'cfef380e6c69ce5c616b930d23ac4b4b5455d8a36b73c019a41feab80a306854', '[\"*\"]', '2023-05-09 20:39:17', '2023-05-09 20:39:11', '2023-05-09 20:39:17'),
(166, 'App\\Models\\Facilitator', 110, 'MyApp', 'b74ccbb1c25940975a59d05ebb185ebf864aeb492c6c7d89411570e624210829', '[\"*\"]', '2023-05-09 20:50:31', '2023-05-09 20:42:21', '2023-05-09 20:50:31'),
(167, 'App\\Models\\Facilitator', 110, 'MyApp', '798231b386b541de944fe0c89d1f1012628791f352a09eb357e81a0c620b0ee2', '[\"*\"]', '2023-05-09 20:44:47', '2023-05-09 20:44:31', '2023-05-09 20:44:47'),
(168, 'App\\Models\\Facilitator', 110, 'MyApp', 'c6da6a78bc7d402d2e4a10a136c722bc24e55c96e56d4083e17742a2cd5df198', '[\"*\"]', '2023-05-09 22:19:52', '2023-05-09 20:47:16', '2023-05-09 22:19:52'),
(169, 'App\\Models\\Facilitator', 36, 'MyApp', '38f9eecb32493fbe371e27d87b2ffe797c1738eac6993d94889c0529b6f0486f', '[\"*\"]', '2023-05-09 21:10:30', '2023-05-09 21:05:21', '2023-05-09 21:10:30'),
(170, 'App\\Models\\Facilitator', 110, 'MyApp', '2d2ddd6915f794e03f6be1f235d787c122ddcb579034603dc11eaaace80b1f73', '[\"*\"]', '2023-05-09 21:16:12', '2023-05-09 21:16:01', '2023-05-09 21:16:12'),
(171, 'App\\Models\\Facilitator', 110, 'MyApp', '61eba4ab8b33c7084a8e835a566bfb4bbee93de058379c3c6eb4110ed57f26a9', '[\"*\"]', '2023-05-09 21:47:43', '2023-05-09 21:45:07', '2023-05-09 21:47:43'),
(172, 'App\\Models\\Facilitator', 50, 'MyApp', '74cd66d9dafbb0b75c552ed4e5d5f95b60b9783e7e275f3b36c1f4c47c482675', '[\"*\"]', '2023-05-11 22:23:10', '2023-05-09 21:47:54', '2023-05-11 22:23:10'),
(173, 'App\\Models\\Facilitator', 20, 'MyApp', 'a771aafe660f2eb3cc5a1600b5b2f3c1fa9643885881ecc5dd0bf27f9cc50e68', '[\"*\"]', '2023-05-12 05:40:56', '2023-05-09 22:16:45', '2023-05-12 05:40:56'),
(174, 'App\\Models\\Facilitator', 36, 'MyApp', '7508d2429e2794412ec8a42811931170cde4efd7d83baa9e17609a376309869e', '[\"*\"]', '2023-05-24 04:17:03', '2023-05-09 22:20:00', '2023-05-24 04:17:03'),
(175, 'App\\Models\\Facilitator', 20, 'MyApp', '7787ef2645d4f1ee1dce29fd8429f733b269e0b66069d3b99ef8711f3475856f', '[\"*\"]', '2023-05-17 01:58:29', '2023-05-09 22:20:15', '2023-05-17 01:58:29'),
(176, 'App\\Models\\Facilitator', 20, 'MyApp', '1f9535b8eb46ed2c7bdf766aa9a3d5c7e8e19b5029b2779a5f19ad02fbe94fea', '[\"*\"]', '2023-06-01 00:53:50', '2023-05-10 03:23:03', '2023-06-01 00:53:50'),
(177, 'App\\Models\\Facilitator', 4, 'MyApp', '505d026d42fd6abddf965db14de8e535bbd534b06c0aa45d7aa24d9ccafd3dd5', '[\"*\"]', '2023-05-10 13:39:58', '2023-05-10 13:16:18', '2023-05-10 13:39:58'),
(178, 'App\\Models\\Facilitator', 39, 'MyApp', '7015283742842c8417ec38a5fd3757ec0cab7fc2e3a2de7c482ee0e8bf558bf1', '[\"*\"]', '2023-05-10 14:56:07', '2023-05-10 14:55:56', '2023-05-10 14:56:07'),
(179, 'App\\Models\\Facilitator', 39, 'MyApp', 'd118d5a45e0eae1eedc298734558fa42ffe6819490ee17506321ff8a4af6f045', '[\"*\"]', '2023-05-12 15:04:03', '2023-05-10 15:08:43', '2023-05-12 15:04:03'),
(180, 'App\\Models\\Facilitator', 110, 'MyApp', 'a551d1a89c684869be98f3b44ac652bb425808d43700e7f4fb0423084f9a9023', '[\"*\"]', '2023-05-10 17:05:13', '2023-05-10 17:03:33', '2023-05-10 17:05:13'),
(181, 'App\\Models\\Facilitator', 4, 'MyApp', 'de28a4d6579b038eba3a7f8969550626be905475c1899688828120806cf40318', '[\"*\"]', '2023-05-10 18:08:11', '2023-05-10 17:05:26', '2023-05-10 18:08:11'),
(182, 'App\\Models\\Facilitator', 4, 'MyApp', '748fc3534f7350bd5213dcde8cf9720309a24fb1c0e3ac7368023c007459ff2a', '[\"*\"]', '2023-05-10 18:19:43', '2023-05-10 18:08:28', '2023-05-10 18:19:43'),
(183, 'App\\Models\\Facilitator', 4, 'MyApp', '321595cec3d6799beb335de710cf6028a2e1e2dffba367243c842c7f5fb35e50', '[\"*\"]', '2023-05-10 18:12:15', '2023-05-10 18:09:47', '2023-05-10 18:12:15'),
(184, 'App\\Models\\Facilitator', 39, 'MyApp', '1bca3db7e3b3a17ca56a2638c277fbe33676871c6d36e8e6022999658dda4a9d', '[\"*\"]', '2023-05-10 18:29:56', '2023-05-10 18:29:48', '2023-05-10 18:29:56'),
(185, 'App\\Models\\Facilitator', 39, 'MyApp', 'cd443ccf400febed090880adb6fb78d42a87b789c3a02e1e8ae118ff2ea9c57a', '[\"*\"]', '2023-05-23 02:02:22', '2023-05-10 18:36:44', '2023-05-23 02:02:22'),
(186, 'App\\Models\\Facilitator', 4, 'MyApp', 'b9e275ac7d0ff6769249358203455284288068216ee3d6fb93472f668fbfa637', '[\"*\"]', '2023-07-03 16:06:36', '2023-05-10 18:52:21', '2023-07-03 16:06:36'),
(187, 'App\\Models\\Facilitator', 4, 'MyApp', '115ccb4134d96ba30a075c4cff76224da7d7c09382390d236b4fde5e743df490', '[\"*\"]', '2023-05-11 15:50:15', '2023-05-11 15:50:14', '2023-05-11 15:50:15'),
(188, 'App\\Models\\Facilitator', 4, 'MyApp', 'e5faeccb219a90342f118b6138bb389872cac6747860476e5abc1ef10650475d', '[\"*\"]', '2023-05-11 15:51:34', '2023-05-11 15:50:36', '2023-05-11 15:51:34'),
(189, 'App\\Models\\Facilitator', 46, 'MyApp', 'fbc853025273905ab9d8ce3dac2e85d6a8cdac528e3b3ce2aa98a8cf76565f8c', '[\"*\"]', '2023-05-11 18:35:09', '2023-05-11 18:23:18', '2023-05-11 18:35:09'),
(190, 'App\\Models\\Facilitator', 20, 'MyApp', '767eecf1997e28cd0e76a83f565c44f7f86d816fba37b26b03d1499aeb1c9de9', '[\"*\"]', '2023-05-12 05:41:50', '2023-05-12 05:41:42', '2023-05-12 05:41:50'),
(191, 'App\\Models\\Facilitator', 111, 'MyApp', '821d11f9caecbf74f18c07ec4d4bd33e9498ab7a97385946fffc27273bf07d31', '[\"*\"]', '2023-05-12 14:13:16', '2023-05-12 14:11:22', '2023-05-12 14:13:16'),
(192, 'App\\Models\\Facilitator', 111, 'authToken', '540dc9b5308f9f5af6c72d7d6bfcb45c6f5767d5066f04c92dd840f552897568', '[\"*\"]', NULL, '2023-05-12 14:14:34', '2023-05-12 14:14:34'),
(193, 'App\\Models\\Facilitator', 111, 'MyApp', '56ec10c4a0b0962d0c5fcb4f96002866c23a21c04b3790ddd0fbfe53572cae98', '[\"*\"]', '2023-05-12 14:27:36', '2023-05-12 14:21:39', '2023-05-12 14:27:36'),
(194, 'App\\Models\\Facilitator', 20, 'MyApp', '3b00693740b282544383a575b69f992a6c2ad995a37c7870116f2a028b88a9e3', '[\"*\"]', '2023-05-17 00:42:59', '2023-05-12 19:10:42', '2023-05-17 00:42:59'),
(195, 'App\\Models\\Facilitator', 110, 'MyApp', 'cc0e6e682c5026c6245b98526ab781314c83c1551433ec85a97da87156397c15', '[\"*\"]', '2023-05-15 19:40:20', '2023-05-15 17:47:35', '2023-05-15 19:40:20'),
(196, 'App\\Models\\Facilitator', 4, 'MyApp', 'bc92e2acff453761b27281b60085e99c2704b79c51594e481e47bfd049164937', '[\"*\"]', '2023-05-15 18:53:56', '2023-05-15 17:54:06', '2023-05-15 18:53:56'),
(197, 'App\\Models\\Facilitator', 46, 'MyApp', '8b180c6031e8d6a160036425a687d12bc013f7242f063eeb259780ba3e2a31e6', '[\"*\"]', '2023-05-15 19:42:05', '2023-05-15 19:40:41', '2023-05-15 19:42:05'),
(198, 'App\\Models\\Facilitator', 46, 'MyApp', '8f3c44e38ce3fc7ea3d26084907c814e91808abef2d0f5514eba9920af0d412a', '[\"*\"]', '2023-05-23 19:26:46', '2023-05-15 19:43:23', '2023-05-23 19:26:46'),
(199, 'App\\Models\\Facilitator', 48, 'MyApp', '36ed12b2b7dbb4b1af08901431ef41d5eb2375719adb8831f2b8afa68154ca93', '[\"*\"]', '2023-05-16 13:23:52', '2023-05-16 13:16:42', '2023-05-16 13:23:52'),
(200, 'App\\Models\\Facilitator', 111, 'MyApp', '565451b2d902011370984194e570b5b17981db730e7f7a16604d99dafc22d30f', '[\"*\"]', '2023-05-16 13:33:42', '2023-05-16 13:27:53', '2023-05-16 13:33:42'),
(201, 'App\\Models\\Facilitator', 111, 'MyApp', '16f9e8b50db52a62151d7de6ecf03816962f828dcc8ac32083be35bd970e1ae8', '[\"*\"]', '2023-12-21 22:09:08', '2023-05-16 13:28:38', '2023-12-21 22:09:08'),
(202, 'App\\Models\\Facilitator', 111, 'MyApp', 'eb126e47bbe055a97ed45170b299a96c8d376a55cf4dd99fe9d852c836e74e40', '[\"*\"]', '2023-05-16 13:30:34', '2023-05-16 13:29:07', '2023-05-16 13:30:34'),
(203, 'App\\Models\\Facilitator', 111, 'MyApp', 'db900cb90f6a14ad3855c1d4dde5b645e63e2f7047d293c52929b6ac7a7af0a2', '[\"*\"]', '2023-05-16 13:33:34', '2023-05-16 13:30:51', '2023-05-16 13:33:34'),
(204, 'App\\Models\\Facilitator', 111, 'MyApp', '7c781cd52546d8e5d92098a32da4c6b500abf00f5f7c8ff07d6bf7f604c4c322', '[\"*\"]', '2023-05-22 17:20:54', '2023-05-16 13:34:31', '2023-05-22 17:20:54'),
(205, 'App\\Models\\Facilitator', 39, 'MyApp', 'bdc2da9291022349938a3be4a926e80871e5c6f2a933be5bf259e80c77646e0a', '[\"*\"]', '2023-05-16 15:24:45', '2023-05-16 15:24:34', '2023-05-16 15:24:45'),
(206, 'App\\Models\\Facilitator', 20, 'MyApp', '6426283b39bee21f0e6654d7d2ac4ab7c5e978d8f8e4338f968555fa945e2919', '[\"*\"]', '2023-05-17 01:04:15', '2023-05-17 01:03:43', '2023-05-17 01:04:15'),
(207, 'App\\Models\\Facilitator', 20, 'MyApp', '7f9eb93454de0d1b0bc2f3db844029a03671e1182096f0508b86529e48c0d091', '[\"*\"]', '2023-05-17 02:14:00', '2023-05-17 01:58:51', '2023-05-17 02:14:00'),
(208, 'App\\Models\\Facilitator', 20, 'MyApp', 'a7ffc8e9e174ee4b6fc47e46c98e50a088ff3340a996ad712df6f8a22b8137ee', '[\"*\"]', '2023-05-18 03:51:24', '2023-05-17 02:14:09', '2023-05-18 03:51:24'),
(209, 'App\\Models\\Facilitator', 20, 'MyApp', '13b188aa230b820dbc17f643cb8d421bfb99c02d00bc7274ad799f8f566ed85e', '[\"*\"]', '2023-05-17 02:20:10', '2023-05-17 02:19:59', '2023-05-17 02:20:10'),
(210, 'App\\Models\\Facilitator', 20, 'MyApp', '9b0581556aed66c6ed0535acd3df159cd8b111fe64433a48a1addc18fc5d40f8', '[\"*\"]', '2023-05-17 02:21:48', '2023-05-17 02:21:28', '2023-05-17 02:21:48'),
(211, 'App\\Models\\Facilitator', 20, 'MyApp', '76ab12cc8265206f188a1b8d4ae573c2df4aa843889478b147ace9db730715d2', '[\"*\"]', '2023-05-17 02:24:51', '2023-05-17 02:24:48', '2023-05-17 02:24:51'),
(212, 'App\\Models\\Facilitator', 20, 'MyApp', 'b59be010b21fbb120d21670f4bcaa4c524ed05690ae011f8227114568ae0421c', '[\"*\"]', '2023-05-17 02:26:39', '2023-05-17 02:26:33', '2023-05-17 02:26:39'),
(213, 'App\\Models\\Facilitator', 20, 'MyApp', '5c0c3cb3060c2c36d101a35e6989b202af567fb4248eef5107e7e89479181ae1', '[\"*\"]', '2023-05-17 02:28:12', '2023-05-17 02:28:10', '2023-05-17 02:28:12'),
(214, 'App\\Models\\Facilitator', 20, 'MyApp', '6425c62d952c142412e91fb1c172ab95712ffc230639beaca355623f3d02e19d', '[\"*\"]', '2023-05-17 02:31:25', '2023-05-17 02:28:25', '2023-05-17 02:31:25'),
(215, 'App\\Models\\Facilitator', 20, 'MyApp', 'a01c32d539fd0b5a3467d69bf8110717941368906fbbf25dbac635392ed2c3e2', '[\"*\"]', '2023-05-18 20:16:05', '2023-05-17 02:32:41', '2023-05-18 20:16:05'),
(216, 'App\\Models\\Facilitator', 20, 'MyApp', '4010d739b5affa0b993b74901689fe68c2390b20051e84f1c99535573594f9b8', '[\"*\"]', '2023-05-24 22:33:55', '2023-05-18 03:51:33', '2023-05-24 22:33:55'),
(217, 'App\\Models\\Facilitator', 20, 'MyApp', '72bdde198029e926e53fac6b740beed05a0ef3e781a2847afebf45fc9ffe3d79', '[\"*\"]', '2023-05-26 17:21:43', '2023-05-18 20:17:16', '2023-05-26 17:21:43'),
(218, 'App\\Models\\Facilitator', 4, 'MyApp', 'a09d40b903f9931f68ae2654c4f382362d9e1717a46be192aa874ffb8f67529c', '[\"*\"]', '2023-05-23 19:36:32', '2023-05-22 16:03:41', '2023-05-23 19:36:32'),
(219, 'App\\Models\\Facilitator', 46, 'MyApp', '1ccca26c068d622d002dd1b274b772fbfff66ce62616775bf0b7d3d161cda006', '[\"*\"]', '2023-05-22 17:22:48', '2023-05-22 17:21:12', '2023-05-22 17:22:48'),
(220, 'App\\Models\\Facilitator', 39, 'MyApp', '79632c9d4fe3f8e4f975cd7decce726fb37e7956f3f47351389b8caf70493f32', '[\"*\"]', '2023-12-08 00:48:28', '2023-05-22 17:59:27', '2023-12-08 00:48:28'),
(221, 'App\\Models\\Facilitator', 4, 'MyApp', 'e9868a929d8368471bc3494ac22b5ce31f51eabdaa4879781e4039ec44f61609', '[\"*\"]', '2023-05-22 18:20:52', '2023-05-22 18:12:06', '2023-05-22 18:20:52'),
(222, 'App\\Models\\Facilitator', 38, 'MyApp', 'b09d7422617fff9987d0072ed9b441862c25017c97f0022b9319f835df5f0056', '[\"*\"]', '2024-05-22 03:21:20', '2023-05-23 01:55:36', '2024-05-22 03:21:20'),
(223, 'App\\Models\\Facilitator', 39, 'MyApp', 'f16f07a1b81f26dfa7c0aeab3dc050d17566966c77afff8f0f5ac8432dcbed36', '[\"*\"]', '2023-05-30 07:19:22', '2023-05-23 02:05:19', '2023-05-30 07:19:22'),
(224, 'App\\Models\\Facilitator', 111, 'MyApp', '5ce8ced77d59aa71c3b1c57d55af8eaa5e01b480e3b3fe7868240dae84e0f5aa', '[\"*\"]', '2023-05-23 18:24:42', '2023-05-23 18:24:02', '2023-05-23 18:24:42'),
(225, 'App\\Models\\Facilitator', 46, 'MyApp', '2dab088105fabbfa48d1c426e6a5df7a7ae72a4ed3943e5a4a4bfc3201652189', '[\"*\"]', '2023-05-23 18:42:28', '2023-05-23 18:26:07', '2023-05-23 18:42:28'),
(226, 'App\\Models\\Facilitator', 4, 'MyApp', '01729b6c677c07a0811918d67e727cf06dfc8aea5cf8a6c43f23028d2e913e76', '[\"*\"]', '2023-05-23 19:08:17', '2023-05-23 19:04:08', '2023-05-23 19:08:17'),
(227, 'App\\Models\\Facilitator', 46, 'MyApp', '883fe4efa85be4bb3d8e8454ec766eb37d7106ef630bc8776ee55ab9517ccd94', '[\"*\"]', '2023-05-26 17:35:34', '2023-05-23 19:29:40', '2023-05-26 17:35:34'),
(228, 'App\\Models\\Facilitator', 111, 'MyApp', '865dd837ad7a163c77ab392ecdd95e2325a74b07f89e8f9c10f9c77dcfd25a4b', '[\"*\"]', '2023-05-24 15:58:53', '2023-05-24 15:53:50', '2023-05-24 15:58:53'),
(229, 'App\\Models\\Facilitator', 111, 'MyApp', '7da4f44257d00c56724578f4ec3aaedd74e08c768ecdd613f5f135ec6f2c4f49', '[\"*\"]', '2023-05-24 16:06:10', '2023-05-24 15:59:06', '2023-05-24 16:06:10'),
(230, 'App\\Models\\Facilitator', 111, 'MyApp', '5358f7a612f1cd94eb9455a14df23eb1dc989021fb980259b700494582df1abd', '[\"*\"]', '2023-05-24 16:15:59', '2023-05-24 16:08:46', '2023-05-24 16:15:59'),
(231, 'App\\Models\\Facilitator', 111, 'MyApp', '2081cce31493057055b27df16ec6ce109a5377f1d0ce0e94fada0a8a512001fa', '[\"*\"]', '2023-05-24 16:38:52', '2023-05-24 16:19:26', '2023-05-24 16:38:52'),
(232, 'App\\Models\\Facilitator', 4, 'MyApp', '017b6bde216de4fa6f4bc0321403e8e8c56c425f6126c15b5357ab8e16a1dc1d', '[\"*\"]', '2023-05-24 17:15:59', '2023-05-24 17:10:48', '2023-05-24 17:15:59'),
(233, 'App\\Models\\Facilitator', 111, 'MyApp', '3b8e419a52eeb3bc129879e842666978edf334fb0dde6d19da7477007aa62f4f', '[\"*\"]', '2023-06-06 14:44:41', '2023-05-24 18:15:55', '2023-06-06 14:44:41'),
(234, 'App\\Models\\Facilitator', 20, 'MyApp', '587f96fea2aaa7273d1f51490c6bee7c183ba7f71d303712cb631c449edd85ac', '[\"*\"]', '2023-12-19 00:53:56', '2023-05-24 22:36:19', '2023-12-19 00:53:56'),
(235, 'App\\Models\\Facilitator', 20, 'MyApp', '8f6ed2bd579b8dce8ae9454e816fedb8bbc244e674e422a92564ca09370a3bdc', '[\"*\"]', '2023-05-30 19:32:00', '2023-05-26 17:22:20', '2023-05-30 19:32:00'),
(236, 'App\\Models\\Facilitator', 20, 'MyApp', '086e7190b33ba6867f3ca6de70fa92045b62da3e26293d28e98f34ebe04ebea8', '[\"*\"]', '2023-06-13 15:13:40', '2023-05-26 17:36:12', '2023-06-13 15:13:40'),
(237, 'App\\Models\\Facilitator', 20, 'MyApp', '6ff13263115f49bbce42f7e7387ac2f63ba3a4254e846bc7a9e0d23169ad1ee8', '[\"*\"]', '2023-05-26 17:59:26', '2023-05-26 17:51:23', '2023-05-26 17:59:26'),
(238, 'App\\Models\\Facilitator', 20, 'MyApp', 'c6d2291d5bd649653063a9a60d03c365364703a4cd5692a9dd937077996a4c88', '[\"*\"]', '2023-09-09 00:29:18', '2023-05-30 19:32:34', '2023-09-09 00:29:18'),
(239, 'App\\Models\\Facilitator', 36, 'MyApp', 'd04bbc8e43085b61de4eb1f587a543a64c88ceb26982fabcfee3e7bc8167f6f9', '[\"*\"]', '2023-08-30 06:30:47', '2023-05-31 04:45:51', '2023-08-30 06:30:47'),
(240, 'App\\Models\\Facilitator', 39, 'MyApp', 'd891361a300b332503d409effbd2d66081fcb4a601b3a4663271b8bfe91a4e82', '[\"*\"]', '2023-12-05 07:51:23', '2023-05-31 07:13:18', '2023-12-05 07:51:23'),
(241, 'App\\Models\\Facilitator', 39, 'MyApp', 'f68e2f92f8fe33f941f0e1ef93771837c4a010755bb9008d4cabdda662a16a72', '[\"*\"]', '2023-06-05 16:36:04', '2023-06-05 16:35:50', '2023-06-05 16:36:04'),
(242, 'App\\Models\\Facilitator', 39, 'MyApp', '14a55142252c4ea07ae2caa1c6c9d614cf75514ac7b412bb3639a68015831973', '[\"*\"]', '2023-06-05 16:42:42', '2023-06-05 16:42:31', '2023-06-05 16:42:42'),
(243, 'App\\Models\\Facilitator', 39, 'MyApp', '892deabf4c58041d16a2f740355b8e7b341cc9cd5ed8f47acf9daea2a25924d9', '[\"*\"]', '2023-06-05 16:43:14', '2023-06-05 16:43:07', '2023-06-05 16:43:14'),
(244, 'App\\Models\\Facilitator', 20, 'MyApp', '4bb8c7947507da75161dd2eb8e11cc38687c779621baec21e83a0afcfaedcf63', '[\"*\"]', '2023-06-05 19:39:59', '2023-06-05 19:39:34', '2023-06-05 19:39:59'),
(245, 'App\\Models\\Facilitator', 20, 'MyApp', '85f36baabd964b5b3500f91e44ae4d314d1e35ed7434e3ed18bc25e80d0f614b', '[\"*\"]', '2023-06-10 15:40:03', '2023-06-05 19:59:48', '2023-06-10 15:40:03'),
(246, 'App\\Models\\Facilitator', 48, 'MyApp', '02616e3bc30ef3e4cca4990408d3b66e57990bda81c1ba52e3ab3bdd1fc24c48', '[\"*\"]', '2023-06-12 18:57:57', '2023-06-12 18:57:30', '2023-06-12 18:57:57'),
(247, 'App\\Models\\Facilitator', 99, 'MyApp', '37dae603cea381f3a4f7807211deaf0a263f417db11bf71eb1ea47f0b7c8942f', '[\"*\"]', '2023-06-12 19:50:45', '2023-06-12 18:58:05', '2023-06-12 19:50:45'),
(248, 'App\\Models\\Facilitator', 39, 'MyApp', '17760fb934bb3c9c7a7f85ce851fd91f462ab4783e8cd62b712b53fc43892949', '[\"*\"]', '2024-04-04 21:54:31', '2023-06-12 23:34:42', '2024-04-04 21:54:31'),
(249, 'App\\Models\\Facilitator', 39, 'MyApp', '7caf054bf2ddd86bef93e8a25b33e8f46f7548e1b059e88824c785aa153a9b33', '[\"*\"]', '2024-08-03 23:01:17', '2023-06-12 23:52:32', '2024-08-03 23:01:17'),
(250, 'App\\Models\\Facilitator', 39, 'MyApp', '5410ba30e85b3f37a9b5972a5dcda3438212ad559d2869943d5f018fa3b969e9', '[\"*\"]', '2025-10-23 18:17:38', '2023-06-13 00:23:37', '2025-10-23 18:17:38'),
(251, 'App\\Models\\Facilitator', 39, 'MyApp', 'daee26f8a67b2f5fa8aa6aa5ddd51c17c2a2cce511c0543a4d7c6122f5d64353', '[\"*\"]', '2024-01-30 02:19:43', '2023-06-13 02:36:03', '2024-01-30 02:19:43'),
(252, 'App\\Models\\Facilitator', 111, 'MyApp', '9ad5bfcb87c144cbf51ab68017711a43b694f5140451f6f51042401699d8177b', '[\"*\"]', '2023-06-13 15:19:40', '2023-06-13 14:50:32', '2023-06-13 15:19:40'),
(253, 'App\\Models\\Facilitator', 20, 'MyApp', '9bbaa980b95a0e07469545f9cdcfbec33baf4045ecf1637d890ce6fcdc929c2b', '[\"*\"]', '2023-06-13 15:27:48', '2023-06-13 15:21:22', '2023-06-13 15:27:48'),
(254, 'App\\Models\\Facilitator', 39, 'MyApp', 'ebbd229ce70eea9356e525f44f0352d6b60dd6415f5fbf79e01d1cd15e5861df', '[\"*\"]', '2024-05-11 18:19:17', '2023-06-15 05:11:53', '2024-05-11 18:19:17'),
(255, 'App\\Models\\Facilitator', 39, 'MyApp', 'c901aab467baff4550ac53482ea6e44ccff4c1be0d503b74ac9db271e8921743', '[\"*\"]', '2025-10-14 19:06:59', '2023-06-30 03:00:45', '2025-10-14 19:06:59'),
(256, 'App\\Models\\Facilitator', 39, 'MyApp', '8204ba3971d11334a012218d4c22920f3df4c0a27233f03711259ddc4fb2fcd5', '[\"*\"]', '2023-07-04 23:20:14', '2023-06-30 05:16:43', '2023-07-04 23:20:14'),
(257, 'App\\Models\\Facilitator', 20, 'MyApp', 'b8e72c8949d925d604125f102ed4c0b0859fbfb0bf747ad95458e0c0709b1789', '[\"*\"]', '2023-09-09 01:28:01', '2023-08-28 20:11:01', '2023-09-09 01:28:01'),
(258, 'App\\Models\\Facilitator', 20, 'MyApp', 'a855a58d25a002c5f754e85d03aa1b3eb1d1facec306b89e56bc5264a5bea575', '[\"*\"]', '2023-09-09 01:10:03', '2023-09-09 00:53:16', '2023-09-09 01:10:03');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(259, 'App\\Models\\Facilitator', 20, 'MyApp', 'bfe494c8c103286a3dc2f6382340371357aa5b52c10b14d70799676e6115c31f', '[\"*\"]', '2023-09-09 04:02:58', '2023-09-09 03:58:08', '2023-09-09 04:02:58'),
(260, 'App\\Models\\Facilitator', 20, 'MyApp', '31ce922c2ff0440b200a6c063407c565d06b16674bbe728ffc328f63ed661f74', '[\"*\"]', '2023-09-09 04:23:05', '2023-09-09 04:13:54', '2023-09-09 04:23:05'),
(261, 'App\\Models\\Facilitator', 20, 'MyApp', '36ec852247ec051c173f86ed76c6e2dffff0ca7b67447ffe32fa4567dd86c2ee', '[\"*\"]', '2023-09-09 05:14:33', '2023-09-09 04:30:32', '2023-09-09 05:14:33'),
(262, 'App\\Models\\Facilitator', 20, 'MyApp', '5966cec41c3615e1bc0114c7cf8eeb4a5e24357d2476865558d51e36a73b3ab8', '[\"*\"]', '2023-09-16 04:48:17', '2023-09-09 05:29:23', '2023-09-16 04:48:17'),
(263, 'App\\Models\\Facilitator', 20, 'MyApp', 'a6125d5ad42184fdc089997263f1b82e5925c72a9eaae29586cbc9bd82063dc8', '[\"*\"]', '2023-12-22 06:43:43', '2023-09-24 18:56:19', '2023-12-22 06:43:43'),
(264, 'App\\Models\\Facilitator', 20, 'MyApp', 'ac49b39fc55f414c58f67cde980cee7f1ee7b229a00af28c50bc2f31d6fabcb7', '[\"*\"]', '2023-12-19 23:40:39', '2023-12-19 06:17:15', '2023-12-19 23:40:39'),
(265, 'App\\Models\\Facilitator', 20, 'MyApp', '25ee279f5cff5534f0d5c5b29e8781cb7380302440060d14d4e7de8c94f87b5f', '[\"*\"]', '2023-12-20 00:41:07', '2023-12-19 23:41:34', '2023-12-20 00:41:07'),
(266, 'App\\Models\\Facilitator', 20, 'MyApp', 'f5d1714274ff883300ec6af349984b5d50d61e694ee7efd738fae53b7b2edd67', '[\"*\"]', '2023-12-20 00:58:24', '2023-12-20 00:41:49', '2023-12-20 00:58:24'),
(267, 'App\\Models\\Facilitator', 20, 'MyApp', 'ea02218b93f283eea3ed129ce4ff47e9e58b5849f18501ccdd091f95c4fcd814', '[\"*\"]', '2023-12-20 01:00:03', '2023-12-20 00:59:23', '2023-12-20 01:00:03'),
(268, 'App\\Models\\Facilitator', 20, 'MyApp', '556db7c1ef9524ed862253ed84a63379ee67095b82b53bd86c4816a48d8f41c2', '[\"*\"]', '2023-12-20 01:05:43', '2023-12-20 01:04:01', '2023-12-20 01:05:43'),
(269, 'App\\Models\\Facilitator', 20, 'MyApp', 'cf2aa3f4ed61f507deaa7cf236bff6da97ce5c39a41565ebfb483ed11965bc6b', '[\"*\"]', '2023-12-20 01:07:43', '2023-12-20 01:06:20', '2023-12-20 01:07:43'),
(270, 'App\\Models\\Facilitator', 20, 'MyApp', 'a9acd50a668840caca9f4875305fdd59a5f3e1ef5f16fc6edecf45125db569b9', '[\"*\"]', '2023-12-20 01:09:12', '2023-12-20 01:08:19', '2023-12-20 01:09:12'),
(271, 'App\\Models\\Facilitator', 20, 'MyApp', '1ef298476a8d4f1a6632179dfb0d856cb4570c59677e12799ca2dd96a058eaac', '[\"*\"]', '2024-04-28 14:08:09', '2023-12-20 01:14:53', '2024-04-28 14:08:09'),
(272, 'App\\Models\\Facilitator', 20, 'MyApp', 'e45b9ea1ef6fff7de0c1c80b88c775cdffe35fbb8b8bc9682fb897e7c5b0a8bb', '[\"*\"]', '2023-12-22 06:28:49', '2023-12-22 06:23:02', '2023-12-22 06:28:49'),
(273, 'App\\Models\\Facilitator', 20, 'MyApp', 'accb84336fa490a22181a546f1af598a3b054e688f5d7e13f64d3252d7e77930', '[\"*\"]', '2023-12-22 07:06:06', '2023-12-22 06:29:52', '2023-12-22 07:06:06'),
(274, 'App\\Models\\Facilitator', 39, 'MyApp', '86865d7ee2a0c3522f1aedff9a33334444052265c1fef64c11f822e88648d642', '[\"*\"]', '2024-08-14 16:54:01', '2023-12-22 06:40:34', '2024-08-14 16:54:01'),
(275, 'App\\Models\\Facilitator', 39, 'MyApp', 'c48dd1b7927eb5ce638b6f0f1df530402c8eab8598ecd93b2bccfa691be6f1fc', '[\"*\"]', '2024-04-08 03:04:58', '2023-12-22 06:44:37', '2024-04-08 03:04:58'),
(276, 'App\\Models\\Facilitator', 39, 'MyApp', '2f7317e9d7d51fa281e08ef3f812c523868af14f14a78d28ffa576c257f51443', '[\"*\"]', '2024-04-20 14:22:16', '2023-12-22 07:07:21', '2024-04-20 14:22:16'),
(277, 'App\\Models\\Facilitator', 39, 'MyApp', '8ff3667acb3f2928300cb68a3c892a22bfdd26baa562661c6e17832af591950e', '[\"*\"]', '2024-04-03 21:34:48', '2023-12-22 10:23:05', '2024-04-03 21:34:48'),
(278, 'App\\Models\\Facilitator', 20, 'MyApp', '69b41af20a460a740ac5af62c71266d663a5c2f5c04b8db5cbd7c3136c84c521', '[\"*\"]', '2024-05-06 06:12:42', '2024-04-28 14:36:55', '2024-05-06 06:12:42'),
(279, 'App\\Models\\Facilitator', 20, 'MyApp', 'a3e2c9ff77fec13ee7932881d3dec5d9aa60c2f33799ea47286fba7c5e3c01cb', '[\"*\"]', '2024-05-06 06:20:20', '2024-05-06 06:20:20', '2024-05-06 06:20:20'),
(280, 'App\\Models\\Facilitator', 39, 'MyApp', '6b864814595861aeae57f6ad497f27eb435cbcc89ad9647cfc248aa68a4c693e', '[\"*\"]', '2024-08-06 06:53:17', '2024-05-08 03:57:23', '2024-08-06 06:53:17'),
(281, 'App\\Models\\Facilitator', 4, 'MyApp', '8bbbf339cda5fcef08f3ddbf1f32d8ac74a025cd8e9daacaf245f486c1615834', '[\"*\"]', '2024-05-08 18:21:06', '2024-05-08 18:21:06', '2024-05-08 18:21:06'),
(282, 'App\\Models\\Facilitator', 4, 'MyApp', '42aa0a7417d843e2e1f5bf30d224d6863f1d8c558005e6b901f4459b719f6962', '[\"*\"]', '2024-05-08 18:30:11', '2024-05-08 18:28:32', '2024-05-08 18:30:11'),
(283, 'App\\Models\\Facilitator', 39, 'MyApp', '3548cb1b66dab23412b2d0020b2e232cd36ab32aa2100bcafa61f46d09cbe7e6', '[\"*\"]', '2024-10-24 23:00:43', '2024-05-09 03:43:28', '2024-10-24 23:00:43'),
(284, 'App\\Models\\Facilitator', 20, 'MyApp', 'bbee1b9bc69b82215be4524322dd52c975f89fa7d5642fb6c8199399a8cd2942', '[\"*\"]', '2024-09-11 03:57:21', '2024-08-12 23:26:08', '2024-09-11 03:57:21'),
(285, 'App\\Models\\Facilitator', 39, 'MyApp', 'd4692a402fc97756e0bfb63d329f80fa7a4c4ae7a0a71f0b6cc6a2e4f2d2429d', '[\"*\"]', '2024-09-27 16:58:52', '2024-09-06 11:25:42', '2024-09-27 16:58:52'),
(286, 'App\\Models\\Facilitator', 39, 'MyApp', '88ff79b02decdec18590c06cd631a16324bb65bcc0b66a4365cac0279d3c260a', '[\"*\"]', '2025-10-29 14:50:25', '2024-11-08 01:23:26', '2025-10-29 14:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `RoleName` varchar(255) DEFAULT NULL,
  `Permission` text DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `RoleName`, `Permission`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Main Admin', '[\"user_create\",\"user_read\",\"user_update\",\"user_delete\",\"user_archive\",\"lookup_create\",\"lookup_read\",\"lookup_update\",\"lookup_delete\",\"lookup_archive\",\"organization_create\",\"organization_read\",\"organization_update\",\"organization_delete\",\"organization_archive\",\"facilitator_create\",\"facilitator_read\",\"facilitator_update\",\"facilitator_delete\",\"facilitator_archive\",\"participant_create\",\"participant_read\",\"participant_update\",\"participant_delete\",\"participant_archive\",\"group_create\",\"group_read\",\"group_update\",\"group_delete\",\"group_archive\",\"event_create\",\"event_read\",\"event_update\",\"event_delete\",\"event_archive\",\"assessment_result_create\",\"assessment_result_read\",\"assessment_result_update\",\"assessment_result_delete\",\"assessment_result_archive\",\"faq_read\",\"role_create\",\"license_read\",\"license_create\",\"license_update\",\"license_delete\",\"license_archive\"]', 1, '64', '64', 'false', '2023-02-07 09:45:27', '2023-02-08 03:34:56', NULL),
(2, 'System Manager', '[\"user_create\",\"user_read\",\"user_update\",\"user_delete\",\"lookup_read\",\"organization_read\",\"facilitator_read\",\"participant_read\",\"group_read\",\"event_read\",\"assessment_result_read\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 19:49:48', NULL),
(3, 'Manage Roles', '[\"user_create\",\"user_read\",\"user_update\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 19:40:32', NULL),
(4, 'Manage Profiles', '[\"user_create\",\"user_read\",\"user_update\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 19:53:00', NULL),
(5, 'Manage Guests', '[\"user_create\",\"user_read\",\"user_update\",\"user_archive\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 18:52:41', NULL),
(6, 'Application Manager', '[\"lookup_create\",\"lookup_read\",\"lookup_update\",\"lookup_archive\",\"organization_create\",\"organization_read\",\"organization_update\",\"organization_archive\",\"facilitator_create\",\"facilitator_read\",\"facilitator_update\",\"facilitator_delete\",\"facilitator_archive\",\"participant_read\",\"participant_delete\",\"participant_archive\",\"group_create\",\"group_read\",\"group_update\",\"group_delete\",\"group_archive\",\"event_create\",\"event_read\",\"event_update\",\"event_delete\",\"event_archive\",\"assessment_result_read\",\"assessment_result_delete\",\"assessment_result_archive\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 18:43:53', NULL),
(7, 'Manage Organizations', '[\"lookup_read\",\"organization_create\",\"organization_read\",\"organization_update\",\"organization_delete\",\"organization_archive\",\"facilitator_read\",\"participant_read\",\"group_read\",\"event_create\",\"event_read\",\"event_update\",\"event_delete\",\"event_archive\",\"assessment_result_read\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 18:26:07', NULL),
(8, 'Manage Facilitators', '[\"lookup_read\",\"organization_read\",\"facilitator_create\",\"facilitator_read\",\"facilitator_update\",\"facilitator_delete\",\"facilitator_archive\",\"participant_read\",\"participant_update\",\"participant_delete\",\"participant_archive\",\"assessment_result_read\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 18:03:46', NULL),
(9, 'Manage Participants', '[\"user_read\",\"lookup_read\",\"organization_read\",\"facilitator_read\",\"facilitator_update\",\"participant_create\",\"participant_read\",\"participant_update\",\"participant_delete\",\"participant_archive\",\"event_read\",\"assessment_result_read\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-22 03:48:53', NULL),
(10, 'Manage Classes', '[\"lookup_read\",\"organization_read\",\"facilitator_read\",\"facilitator_update\",\"participant_read\",\"participant_update\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 16:38:11', NULL),
(11, 'Manage Groups', '[\"lookup_read\",\"organization_read\",\"facilitator_read\",\"group_create\",\"group_read\",\"group_update\",\"group_delete\",\"group_archive\"]', 1, '64', '1', 'false', '2023-02-07 09:45:27', '2023-02-15 16:07:51', NULL),
(12, 'Manage Events', '[\"lookup_read\",\"organization_read\",\"facilitator_read\",\"participant_read\",\"group_read\",\"event_create\",\"event_read\",\"event_update\",\"event_delete\",\"event_archive\",\"assessment_result_read\"]', 1, '64', '1', 'false', '2023-02-08 04:49:03', '2023-02-15 15:54:58', NULL),
(16, 'System Manager', '[\"user_create\",\"lookup_read\",\"organization_create\",\"organization_read\",\"organization_update\",\"organization_delete\",\"organization_archive\",\"facilitator_create\",\"facilitator_read\",\"participant_create\",\"participant_read\",\"participant_update\",\"group_create\",\"group_read\",\"event_create\",\"event_read\",\"assessment_result_create\",\"assessment_result_read\",\"assessment_result_update\"]', 1, '1', NULL, 'false', '2023-02-15 04:26:57', '2023-02-15 19:49:31', '2023-02-15 19:49:31'),
(17, 'Guru', '[\"user_create\",\"user_read\",\"user_update\",\"user_delete\",\"user_archive\",\"license_create\",\"license_read\",\"license_update\",\"license_delete\",\"license_archive\",\"lookup_create\",\"lookup_read\",\"lookup_update\",\"lookup_archive\",\"organization_create\",\"organization_read\",\"organization_update\",\"organization_delete\",\"organization_archive\",\"facilitator_create\",\"facilitator_read\",\"facilitator_update\",\"facilitator_delete\",\"facilitator_archive\",\"participant_create\",\"participant_read\",\"participant_update\",\"participant_delete\",\"participant_archive\",\"group_create\",\"group_read\",\"group_update\",\"group_delete\",\"group_archive\",\"event_create\",\"event_read\",\"event_update\",\"event_delete\",\"event_archive\",\"assessment_result_read\",\"assessment_result_delete\",\"assessment_result_archive\"]', 1, '1', '1', 'false', '2023-04-14 05:31:42', '2023-04-14 05:36:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `light_mode_logo` varchar(255) DEFAULT NULL,
  `dark_mode_logo` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `light_mode_logo`, `dark_mode_logo`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`, `video`) VALUES
(1, 's8 logo final - grn_1670320140.png', 's8 logo final grn dark background_1670320140.png', 1, '6', '1', 'false', '2022-12-06 14:49:00', '2023-02-09 12:34:41', NULL, 'samplevideo_1280x720_1mb (1)_1675928081.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL COMMENT '1 = System Managers , 2 = Manage Roles , 3 = Manage Profiles , 4 = Manage Guests , 5 = Application Managers , 6 = Manage Organizations , 7 = Manage Facilitators , 8 = Manage Classes , 9 = Manage Participants , 10 = Manage Groups , 11 = Manage Events',
  `facilitator_id` int(11) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `facilitator_id`, `otp`, `device_token`, `remember_token`, `Status`, `CreatedBy`, `UpdatedBy`, `is_archive`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'superadmin11@gmail.com', NULL, '$2y$10$PVZr3jjKSL5sQ/RzYS8vS.gZErW548Ll9xQaQZlQolY1gvcnDomta', 1, NULL, NULL, NULL, NULL, 1, NULL, '2', 'false', '2022-12-05 16:17:33', '2023-03-22 02:07:20', NULL),
(2, 'System Manager Role', 'sysmanager@gmail.com', NULL, '$2y$10$JEyI4q5gcHq4IHleZvAmoOhGgND.lUcXFloBe7dl7fNqJC3l2RMQG', 2, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:54:39', '2023-02-08 18:12:26', NULL),
(3, 'Manage Role', 'managerol@gmail.com', NULL, '$2y$10$qWBZaGPy4BiLDdt.b/f0duLk1H6J/WISGCPm.aBof7kqeTdRpuFqC', 2, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:55:08', '2022-12-30 20:50:47', NULL),
(4, 'Manage Profile', 'manageprofile@gmail.com', NULL, '$2y$10$p.6wlbg3Aj9gG8v2TzqRLOD.Zx6nO/MR5.ENs7eNSqtnqxBWcwSwm', 4, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:55:37', '2023-02-08 18:15:08', NULL),
(5, 'Manage Guest', 'manageguest@gmail.com', NULL, '$2y$10$UM5hP5B/Id1WEWzsxo9pw.EklolOUM5tywk/nVhigcRiwDjz/idke', 5, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:56:21', '2023-02-08 18:22:24', NULL),
(6, 'Application Manager', 'applicationmanager@gmail.com', NULL, '$2y$10$OVICo9A8NW7HAv1PjQFID.sA7mDWcKxsQAOx4TvS4BA8BF5uiP.yu', 6, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:57:16', '2023-02-08 18:16:22', NULL),
(7, 'Manage Organization', 'manageorg@gmail.com', NULL, '$2y$10$jXLs87AhFRWMwBG5Ww405OlNdF2cmjbKVj7z3k1.zIzW3yCcH70n.', 7, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 16:58:39', '2023-02-08 18:22:42', NULL),
(8, 'Manage Facilitators', 'managefac@gmail.com', NULL, '$2y$10$8EMR4pUtaeje0kobltXX1eCkB19iBIQ797qmVflMtwMcLhPCr3xhy', 8, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 17:00:55', '2023-02-08 18:22:58', NULL),
(9, 'Manage Participants', 'managepart@gmail.com', NULL, '$2y$10$ocZujIjA.QROYfGlkn7bLuYc9kpcLXgtnsV/gkIAzd0fAOaJ5m/M2', 9, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 17:02:05', '2023-02-08 18:23:37', NULL),
(10, 'Manage Classses', 'manageclasses@gmail.com', NULL, '$2y$10$mqkC//ttE/8Dw87aygldveDtntv.Kjis7ZqTUZvAH2N6u1YVk3nny', 10, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 17:02:36', '2023-02-15 16:38:34', NULL),
(11, 'Manage Group', 'managegrp@gmail.com', NULL, '$2y$10$YOjlXmpASjwlfQyF5BPTT.zfQ0mJAxhufpZPTSArnw0G.2V6sLdGe', 11, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 17:03:16', '2023-02-08 18:24:24', NULL),
(12, 'Manage Event', 'managevent@gmail.com', NULL, '$2y$10$2dRrFLIk/R8DpxipmbvaDeqD/hzMKhVrm2YMjKWMeFzp3C9LMD6iG', 12, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-05 17:03:59', '2023-02-08 18:24:42', NULL),
(13, 'Sys Manager', 'ali.akbar@oip.commm.pk', NULL, '$2y$10$HukSRsSFs08qSgfUaoAMIugWviTQUbDD6qSsEdYZx70eUc60JbTAm', 2, NULL, NULL, NULL, '7ohU87HaFcMjJQfSRhK97d5ckpFxkoLTZKkq9C8a9fV7KquUTnKkxMKsnt4C', 1, '1', '2', 'false', '2022-12-06 15:02:44', '2023-01-25 05:30:35', '2023-01-25 05:30:35'),
(14, 'Manage Participants', 'manageparticipant@gmail.com', NULL, '$2y$10$yi1n9EASX5fxSRDnmnBPa.66xv79UIOarasHIfT6DZGfSiN.XECV2', 9, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2022-12-06 15:18:31', '2022-12-07 13:52:55', NULL),
(15, 'Manage Event', 'manageevent@123.com', NULL, '$2y$10$3z4aAiwuK3SRIOc4uqzdUOhoJF6S5fDxbKBciqWBbFZy4rdjsn/VO', 12, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2022-12-07 14:49:14', '2022-12-07 14:49:14', NULL),
(16, 'Test Condition manager', 'ali.akbarch@oip.com.pk', NULL, '$2y$10$AJ9OLgu94ViFOsQwpVr9HO4mbxoL.uUIDj2mTmIz2K2Ah1kUZWXzG', 1, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2022-12-13 17:58:43', '2023-01-25 05:30:46', '2023-01-25 05:30:46'),
(17, 'rrrr', 'abc.def@mailaa', NULL, '$2y$10$1iP1WLkrO5xJc8Lc6ZYnXOVjLgzXjfGW51mgYDnDkxVToUgi52arG', 2, NULL, NULL, NULL, NULL, 1, '16', '16', 'false', '2022-12-13 18:00:37', '2022-12-13 18:01:12', NULL),
(18, 'adas', 'abc.def@mailaaee', NULL, '$2y$10$osGoGHpzKETcbftcR72l5.mA3WqJ2/nJApwX.wpA.WwpHtpcQnv4S', 4, NULL, NULL, NULL, NULL, 1, '3', NULL, 'false', '2022-12-13 18:08:45', '2022-12-13 18:08:45', NULL),
(19, 'Ed Bernosky', 'ed.bernosky@spectrum8sports.com', NULL, '$2y$10$gEnBghpRXTy7KwhyNhUa3uHwKc34LkICQJuDCGCl4kuHAtjGaQCLq', 1, NULL, NULL, NULL, NULL, 1, '6', '1', 'false', '2022-12-14 23:57:30', '2023-04-14 05:38:16', NULL),
(20, 'Brendan Junes', 'mrjordan.business@gmail.com', NULL, '$2y$10$1paxtsKHgdbrdSRWRLJn4uYqJhljKbxVrLnzdOL9XMVyVWE.8NYOe', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-16 16:26:38', '2022-12-16 16:26:38', NULL),
(21, 'Kaleign Kreft', 'kylejordan90@gmail.com', NULL, '$2y$10$foY2hGJQBbUwYtKhDjM4geo9olVOy2VohVXlBEkAB0AHglwGvA8MS', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-16 16:27:20', '2022-12-16 16:27:20', NULL),
(22, 'Harmony Getter', 'kyle.tribeunltd@gmail.com', NULL, '$2y$10$nHV8yO8jZiAHo6CtijT0KO1csIGzm46Avv3kkmELxl7s8OJSsSnB.', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-16 16:27:56', '2022-12-16 16:27:56', NULL),
(23, 'Ricky Salinas', 'contact@tribeunltd.com', NULL, '$2y$10$8fAMd4dVXUismaPisTf.ceekOVfGH0vS991axUOOPjZVCgNmi0.AK', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-16 16:28:37', '2022-12-16 16:28:37', NULL),
(24, 'Korea Rouser', 'kyle@tribeunltd.com', NULL, '$2y$10$j/7jRap8BzWMenmqlIh1yenSojXoG7zHDEqL2iw2CbXuyinaLo3t6', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-16 16:30:19', '2022-12-16 16:30:19', NULL),
(27, 'hannan participanthannan participanthannan participant', 'ali.akbar@oip.com.pksassas', NULL, '$2y$10$OmpCJLQbYJQ0gQOJTOJrm.I2ANoWKzsBZg1ii32DBiesDXP9L5YLS', 11, NULL, NULL, NULL, NULL, 1, '6', '1', 'false', '2022-12-16 18:39:03', '2023-01-25 05:31:04', '2023-01-25 05:31:04'),
(28, 'James', 'ali.akbar@oip.com.pk', NULL, '$2y$10$gHqAASEWJi0PdXYoAnh2Guzfefffd0KgMtq9dAAZ3kIlwajrX/MEa', 7, NULL, NULL, NULL, NULL, 1, '1', '2', 'false', '2022-12-19 19:50:17', '2023-01-25 05:31:13', '2023-01-25 05:31:13'),
(29, 'superadmin@gmail.com', 'nijoxy@lyricspad.net', NULL, '$2y$10$Nbxh14P2DQMnFA.NrSwbQ.N8MKpnMcRay2tNIwL.Wv0AlxbFHv4oK', 7, NULL, NULL, NULL, NULL, 1, '2', NULL, 'false', '2022-12-19 20:00:11', '2022-12-19 20:00:11', NULL),
(30, 'John Cena', 'johncena@gmail.com', NULL, '$2y$10$IDWD5z/tK/a4E1OztBaBLua/KXi2biERqwczd8AD9Vfuhn9MGxoiS', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2022-12-19 20:01:22', '2022-12-19 20:01:22', NULL),
(31, 'Ed Bernosky', 'edbernosky@gmail.com', NULL, '$2y$10$5H.BwaW9dO7VIQaWJpKp2OgMQLMZEFiF7INp6EzdwwhIKkDBDU6Au', 17, NULL, NULL, NULL, NULL, 1, '3', '19', 'false', '2022-12-22 21:52:40', '2023-04-28 18:41:25', NULL),
(32, 'Janeman Millan', 'venet93353@subdito.com', NULL, '$2y$10$CTju2qGGXnRSzcyXhdflY.Z5gG0nQiTcw7xlfpAYWwu0eSbp7OO8q', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-27 15:34:59', '2022-12-27 15:34:59', NULL),
(33, 'Tim David', 'cisemem970@octovie.com', NULL, '$2y$10$yaokIjWLdriXDfxlhw4KWeb/.u74gf1vWuOndMYFZ585ARjTPcy6e', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-27 17:39:49', '2022-12-27 17:39:49', NULL),
(34, 'Manage Participants', 'sodimi5423@razuz.com', NULL, '$2y$10$TdSBF7081PL1cf7mMvkIduCpwaxLJp5tY59.MKqUwuV2MbuX0Z9fS', 8, NULL, NULL, NULL, NULL, 1, '3', '3', 'false', '2022-12-28 17:51:10', '2022-12-28 17:52:58', NULL),
(35, 'Jim Jones', 'sosix99459@letpays.com', NULL, '$2y$10$telHK10.frMSO0I/LzqyH.wpWnzPrzsUhhmag/ahv2kNoGS/lmwAG', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2022-12-30 18:07:13', '2022-12-30 18:07:13', NULL),
(36, 'Nick Hellen', 'solibe4289@prolug.com', NULL, '$2y$10$KvcWtmEaP.w5jTEcPgxSj.5ZmcDbdSofVYk/nBRw5XBw7em0SBs7a', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-03 16:37:35', '2023-01-03 16:37:35', NULL),
(37, 'leonard.simmons@spectrum8sports.com', 'leonard.simmons@spectrum8sports.com', NULL, '$2y$10$w.iK02I5T/jREFGoqUsHHun/81ATU12Cfshp.W3PUGlM7FPujl7Ee', 1, NULL, NULL, NULL, NULL, 1, '6', '1', 'false', '2023-01-03 18:25:33', '2023-04-14 05:37:03', NULL),
(38, 'joecuellar .photo.video@gmail.com', 'joecuellar.photo.video@gmail.com', NULL, '$2y$10$xnvaqQzoT7cpZ8cA4gX.GOobi81l.9On7YQHJ8yIgE42gkejspn0e', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-03 18:26:46', '2023-01-03 18:26:46', NULL),
(39, 'paul.hurley @spectrum8sports.com', 'paul.hurley@spectrum8sports.com', NULL, '$2y$10$xspHIZ5q6P9pjjsd6ifQeuGNG/iXKLuoAgWemzgoAqbrY3c9CJBfq', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-03 18:27:44', '2023-01-03 18:27:44', NULL),
(41, 'teacher @gmail.com', 'teacher@gmail.com', NULL, '$2y$10$Eu7KQIwjU3JHOVku2Ri7g.Cve4ousmSDMaDlfQj9TMPovITkFLrXW', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-03 18:32:18', '2023-01-03 18:32:18', NULL),
(42, 'Anderson Pollard', 'paxiyil927@dewareff.com', NULL, '$2y$10$1jCR8Q4xB5dw9.ACo46Sk.eprzVtFD2FLsLwoTYP3DwAR66m5qKIu', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-04 15:59:03', '2023-01-04 15:59:03', NULL),
(43, 'superadmin@uu', 'abc.def@mailarr', NULL, '$2y$10$QWDwcnPj32.Tq0mX1VFnfutM7qtow4hfTb0va2RCZYMry2nLECG5C', 6, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-09 17:45:30', '2023-01-09 17:45:30', NULL),
(44, 'Allen Musk', 'ramaw89439@usharer.com', NULL, '$2y$10$rkCNP1bvX5MJwvpok34c9u1ejlyFy89Yb0vbXhOGXs5k2TZbqdfbm', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2023-01-09 19:42:15', '2023-01-09 19:42:15', NULL),
(45, 'Kim Jom', 'hedehal972@v3dev.com', NULL, '$2y$10$V0c8o4SgWmMGc9HKt058oOEqz8g/BszUPcwWZSyzcgTqKSLLLJVCS', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2023-01-10 13:56:01', '2023-01-10 13:56:01', NULL),
(46, 'Manage Guest Eddy', 'GuestManager@gmail.comn', NULL, '$2y$10$O8Hv9gC6TVChRblhU1YpS.WTY0wq8BNgWK7.HMjphvyi9MpKkcdmq', 4, NULL, NULL, NULL, NULL, 1, '3', '3', 'false', '2023-01-11 02:41:57', '2023-01-11 02:42:49', NULL),
(47, 'Trent Bolt', 'rocakaf842@usharer.com', NULL, '$2y$10$AzrbCaeadRmePnxRRE76pez0J4F30K5HC2uHO/z/VDB6zPD7Q/Kz6', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-11 12:51:13', '2023-01-11 12:51:13', NULL),
(48, 'Luke', 'akram@gmail.com', NULL, '$2y$10$4lgJJ1MxIh3smV1gK5.kTO7AmlMqCYL/TcPPoJWv1v5mlLdcS0gXS', 1, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 17:04:30', '2023-01-11 17:04:30', NULL),
(49, 'Saman', 'sdsadfg@gmail.com', NULL, '$2y$10$gmqXwxcsgYWeQcqpqyTgO.6wzkrWHe6W0Uydn6n9.eoZNp1Y3PK22', 6, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 18:02:21', '2023-01-11 18:02:21', NULL),
(50, 'nomean', 'adss@yahoo.com', NULL, '$2y$10$/9m3Gk.yMCRSc1DVAiuV9OezZxrCkGszchtmcjtxTzDaPq/iF4pXS', 2, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 18:03:42', '2023-01-11 18:03:42', NULL),
(51, 'Alexandra', 'fahemantest5@gmail.com', NULL, '$2y$10$f5iAwel3g0.cYxsuVjKNR.RyqXZ8odAHItTyGaGN8uPYPTxur2DUW', 9, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 18:20:39', '2023-01-11 18:20:39', NULL),
(52, 'Luke', 'akrameen@gmail.com', NULL, '$2y$10$.kyJYR.gq5CMaPXb6ZJxOuNY0pvO8JAx2q0gGAARwBYa25iDDcc96', 1, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 18:54:06', '2023-01-11 18:54:06', NULL),
(53, 'Luke', 'akraameen@gmail.com', NULL, '$2y$10$EDATTIx8KwVTJWQju0D6sOrFdEOUqNHNndxcSspiFENg6i1FR3yP.', 1, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 20:01:35', '2023-01-11 20:01:35', NULL),
(54, 'system Manager', 'akramali@gmail.com', NULL, '$2y$10$US/lLYBdKEQMl7r/jxqXeuqX93pJWa9idM/PWXdUD5Xzv9hZgoDpa', 2, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-11 20:11:24', '2023-02-15 19:44:59', NULL),
(55, 'Manage role', 'superadmin@gmail.comasdsad', NULL, '$2y$10$3fxuHCCr44zw3Cp2p8pjM.Jm7huF1jxwHv9h4O5m0PN/hpYGuVKVe', 3, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2023-01-12 12:47:03', '2023-02-15 19:36:24', NULL),
(56, 'Timothy', 'fahema@gmail.com', NULL, '$2y$10$wRTcrCsuDX/K1vVI3CTicuAAdZrqtejYDT5gt75Gg5Sbxk3hZqAnG', 3, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-01-12 12:53:03', '2023-01-12 18:34:30', NULL),
(57, 'Luke', 'akraeameen@gmail.com', NULL, '$2y$10$s0n2xBhs6EvoDb.HaU0cuu.Mih6DiwN1gOeMwWN8UgiHYQTFsTEWK', 1, NULL, NULL, NULL, NULL, 1, '1', '1', 'false', '2023-01-12 12:55:46', '2023-01-12 18:37:22', NULL),
(58, 'James Anderson', 'niwedi6379@v3dev.com', NULL, '$2y$10$.Z49VHU9l7DhpsqoF1DN6.wUDCH4.jbb5pAadfW0Mn4Q.BwolBFvi', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-17 13:18:24', '2023-01-17 13:18:24', NULL),
(59, 'Smith Morgan', 'tefik14708@vingood.com', NULL, '$2y$10$D8BFfXGZcSAtOVR9oosKPuy2klyNXr9NbsEwJdze8C2utd55qT5sq', 8, NULL, NULL, NULL, NULL, 1, '6', NULL, 'false', '2023-01-17 15:23:37', '2023-01-17 15:23:37', NULL),
(60, 'Johny Baisto', 'bejope2930@moneyzon.com', NULL, '$2y$10$WpzfMr2pix4PfQwRiLZ1UeUByjc9AvASkMXSm5bqN9rgnUfq0X2A6', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2023-01-20 15:22:49', '2023-01-20 15:22:49', NULL),
(61, 'Allen Cameron', 'bavok99845@ukbob.com', NULL, '$2y$10$FZNSilsdu1uK7.FQUS4Z..eAwjoOO56OKdtF0tUVDAFcPRK6v4u16', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2023-01-20 16:12:38', '2023-01-20 16:12:38', NULL),
(62, 'Hendricks miller', 'veneyi4348@moneyzon.com', NULL, '$2y$10$EIWtyx4hjrKe.BH6ALMfjOxBxsaogpmg2c8g/WmS91nyzCL20wieq', 8, NULL, NULL, NULL, NULL, 1, '8', NULL, 'false', '2023-01-24 19:22:38', '2023-01-24 19:22:38', NULL),
(63, 'garem Novel', 'garem83903@ekcsoft.com', NULL, '$2y$10$RRd6b.XfRQjbqaKSNXQh4.20Cw4Dd9pLsJBKGaI4aiFKCFybT8U26', 8, NULL, NULL, NULL, NULL, 1, '8', '11', 'false', '2023-01-27 18:27:34', '2023-02-15 13:29:46', NULL),
(64, 'Saam Curran', 'xipan93410@brandoza.com', NULL, '$2y$10$djMTlmTdMdyvj4ynbh31cuZlPlDi0fc9lWc0BTIm.Ls8qKS6w8lBG', 8, NULL, NULL, NULL, NULL, 1, '8', '11', 'false', '2023-02-08 17:15:20', '2023-02-15 13:29:34', NULL),
(65, 'asad siddique', 'asadsiddiq07@gmail.com', NULL, '$2y$10$9GhXhvMo1NQxqaBlw5O6Zu4jbSdMPJX9IpvTlb1k4K1V/pqOKXVPa', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'true', '2023-02-16 23:11:21', '2023-02-22 03:13:59', NULL),
(66, 'jonhn doe', 'gokiwo5932@wiroute.com', NULL, '$2y$10$YWmB8n9O.Sd9eBBCDxoea.l59z/2SLQEcOeeI3GGjdpBEYa4IhspG', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-02-24 21:55:01', '2023-02-24 21:55:01', NULL),
(67, 'john doe', 'muvole@ema-sofia.eu', NULL, '$2y$10$V63fJdN9NOqDVt5zHP12j.WzV7dLaoEsXiwupIomE2AW8dxu3p38y', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-02-24 21:55:57', '2023-02-24 21:55:57', NULL),
(68, 'john doe', 'qxfixltp@eurokool.com', NULL, '$2y$10$Pi431WiOruLZUXUskdWqUO2ADNyu8nMjzfAw5agSxWgbbnu/aFd22', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-02-24 22:00:43', '2023-02-24 22:00:43', NULL),
(69, 'James Anderson', 'wilihi5457@pubpng.com', NULL, '$2y$10$ZsKs0qpjLYxAIL1G9BakL.JDxxJgPuqg6FIDLzMi7PhroAD.BKXt.', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-02 16:02:56', '2023-03-02 16:02:56', NULL),
(70, 'Tom Cademore', 'motol71208@wifame.com', NULL, '$2y$10$PMmNuI6GuIhaUeZ5gIc8ZumYz8sJK1GzZq.OIBHpB9hBfnrNdRJ6y', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-02 16:07:43', '2023-03-02 16:07:43', NULL),
(71, 'Brad Hogg', 'akbarchanna98@gmail.com', NULL, '$2y$10$xKQOuqEIaQLCqOKpSFEqRuEmPoD6Olff3NSPXmxWHRIAGyRJ0OUii', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-02 16:17:57', '2023-03-02 16:17:57', NULL),
(72, 'Harry Kane', 'bodonix212@vootin.com', NULL, '$2y$10$oUDauVmeYFGm7auwwr6p..6stOwOP6zsrCEQwcbLoajbUcdK2McmW', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-03 16:46:42', '2023-03-03 16:46:42', NULL),
(73, 'Mendy Morgan', 'woleh17094@necktai.com', NULL, '$2y$10$Z/7FF9p.9lgmtFZP14lBkOTfrbsJ6U81by7xUgjJ.SgJSg6sd5Xbi', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-17 14:11:50', '2023-03-17 14:11:50', NULL),
(74, 'Test License', 'degen26150@marikuza.com', NULL, '$2y$10$pYAzIUL5LgOYjzVh4oQZL.BppS8QIap3l8tP3va00zcrZaAmvdPx.', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-29 08:42:34', '2023-03-29 08:42:34', NULL),
(75, 'License Faclitator two', 'hohad63693@mitigado.com', NULL, '$2y$10$.QWmyPfYfHYf0AiEZqnAjOfa7IrX8pZloH8NhRwJjk1oLT4QaR7LC', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-03-29 08:56:53', '2023-03-29 08:56:53', NULL),
(77, 'jason.byrne@metrodevs.com', 'jason.byrne@metrodevs.com', NULL, '$2y$10$lQcW1WMOO0qHRdj9IWXFvuXmuj2LRo9h6fIKX/cPBQsP0BpySKkne', 6, NULL, NULL, NULL, NULL, 1, '2', NULL, 'false', '2023-04-25 20:58:53', '2023-04-25 20:58:53', NULL),
(87, 'Kearnice Taylor', 'Kearnice.Taylor@Spectrum8Sports.com', NULL, '$2y$10$yFfuJeVhHNJi4/x0.HmGZ.h881YTvpBtl1j1SXB7bMGUWZuK28Rcu', 8, NULL, NULL, NULL, NULL, 1, '8', '2', 'false', '2023-04-28 18:14:50', '2023-04-28 18:22:12', NULL),
(88, 'Facilitator Sun City Surf', 'nopiyig774@meidecn.com', NULL, '$2y$10$jdAv1Ez3lBrNiuzuWynXoO.FAD0RpaZmbvjbxKeG7wa3F86W23M3a', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-05-09 12:32:49', '2023-05-09 12:32:49', NULL),
(89, 'Regression Test', 'kayal72539@dekaps.com', NULL, '$2y$10$m9JJ/Jpy0nRfR0Pb5BkfaecHoM1mNEk2PzW5VxS.D6UURyHaySfGe', 8, NULL, NULL, NULL, NULL, 1, '1', NULL, 'false', '2023-05-12 14:08:55', '2023-05-12 14:08:55', NULL),
(90, 'Event Staffer', 'info@spectrum8Sports.com', NULL, '$2y$10$8uqsevFloZT4W7LQzwnjie10H9dxuHyag1HjjVgUM6xVxeLaiwysW', 9, NULL, NULL, NULL, NULL, 1, '19', '19', 'false', '2023-09-08 22:14:43', '2023-09-09 00:44:05', '2023-09-09 00:44:05'),
(101, 'Event Staff', 's8sStaff+1@gmail.com', NULL, '$2y$10$jdbqc2dj0fvrW0pvrMJ/0.0OYJK0RPcd23/ckd/gkvka/om9AEEb2', 8, NULL, NULL, NULL, NULL, 1, '19', '19', 'false', '2023-09-09 05:12:28', '2023-09-09 05:18:08', '2023-09-09 05:18:08'),
(102, 'Ed.Bernosky@Spectrum8Sports.com', 'EBernosky@hotmail.com', NULL, '$2y$10$Plixhf2d1fGEhLWkF8gqr.kOfbqid7kOrs99ixToxAtKlCsrXpjYK', 6, NULL, NULL, NULL, NULL, 1, '19', '19', 'false', '2023-09-09 05:22:14', '2023-12-20 00:58:04', NULL),
(103, 'Kent Baker', 'Kent.Baker@spectrum8sports.com', NULL, '$2y$10$vV8bhDLybhwHCky5UNNFWOoh4iBclegXHRjYPNnvm1MfZ9a9zfaHu', 8, NULL, NULL, NULL, NULL, 1, '19', '19', 'false', '2024-05-06 05:52:50', '2024-07-23 19:57:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `UserID` int(10) UNSIGNED DEFAULT NULL,
  `RoleID` int(10) UNSIGNED DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active , 2 = Deactive',
  `CreatedBy` char(8) DEFAULT NULL,
  `UpdatedBy` char(8) DEFAULT NULL,
  `is_archive` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessments_assessmenttypeid_foreign` (`AssessmentTypeID`),
  ADD KEY `assessments_colorid_foreign` (`ColorID`);

--
-- Indexes for table `assessment_evaluates`
--
ALTER TABLE `assessment_evaluates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_evaluates_assessmentid_foreign` (`AssessmentID`);

--
-- Indexes for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_results_eventid_foreign` (`EventID`),
  ADD KEY `assessment_results_participantid_foreign` (`ParticipantID`),
  ADD KEY `assessment_results_assessmentid_foreign` (`AssessmentID`),
  ADD KEY `assessment_results_gradeid_foreign` (`GradeID`),
  ADD KEY `assessment_results_genderid_foreign` (`GenderID`),
  ADD KEY `assessment_results_colorid_foreign` (`ColorID`);

--
-- Indexes for table `assessment_scorings`
--
ALTER TABLE `assessment_scorings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_types`
--
ALTER TABLE `assessment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_colorid_foreign` (`ColorID`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_contacttypeid_foreign` (`ContactTypeID`),
  ADD KEY `contacts_organizationid_foreign` (`OrganizationID`),
  ADD KEY `contacts_facilitatorid_foreign` (`FacilitatorID`);

--
-- Indexes for table `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copy_data`
--
ALTER TABLE `copy_data`
  ADD PRIMARY KEY (`AssessmentID`,`GradeID`,`GenderID`),
  ADD KEY `GradeID` (`GradeID`),
  ADD KEY `GenderID` (`GenderID`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_facilitator_id_foreign` (`facilitator_id`);

--
-- Indexes for table `email_types`
--
ALTER TABLE `email_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_s8s_id_foreign` (`S8S_ID`),
  ADD KEY `events_organizationid_foreign` (`OrganizationID`),
  ADD KEY `events_facilitycontactid_foreign` (`FacilityContactID`),
  ADD KEY `events_eventtypeid_foreign` (`EventTypeID`);

--
-- Indexes for table `event_assessments`
--
ALTER TABLE `event_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_assessments_eventid_foreign` (`EventID`),
  ADD KEY `event_assessments_assessmentid_foreign` (`AssessmentID`);

--
-- Indexes for table `event_catagories`
--
ALTER TABLE `event_catagories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_facilitators`
--
ALTER TABLE `event_facilitators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_facilitators_eventid_foreign` (`EventID`),
  ADD KEY `event_facilitators_facilitatorid_foreign` (`FacilitatorID`);

--
-- Indexes for table `event_organizations`
--
ALTER TABLE `event_organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_organizations_eventid_foreign` (`EventID`),
  ADD KEY `event_organizations_organizationid_foreign` (`OrganizationID`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_types_eventcatagoryid_foreign` (`EventCatagoryID`);

--
-- Indexes for table `facilitators`
--
ALTER TABLE `facilitators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilitators_organizationid_foreign` (`OrganizationID`),
  ADD KEY `facilitators_s8s_id_foreign` (`S8S_ID`);

--
-- Indexes for table `facilitator_classes`
--
ALTER TABLE `facilitator_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilitator_classes_facilitatorid_foreign` (`FacilitatorID`),
  ADD KEY `facilitator_classes_classid_foreign` (`ClassID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_colorid_foreign` (`ColorID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_classes`
--
ALTER TABLE `group_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_classes_groupid_foreign` (`GroupID`),
  ADD KEY `group_classes_classid_foreign` (`ClassID`);

--
-- Indexes for table `group_facilitators`
--
ALTER TABLE `group_facilitators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_facilitators_groupid_foreign` (`GroupID`),
  ADD KEY `group_facilitators_facilitatorid_foreign` (`FacilitatorID`);

--
-- Indexes for table `group_genders`
--
ALTER TABLE `group_genders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_genders_groupid_foreign` (`GroupID`),
  ADD KEY `group_genders_genderid_foreign` (`GenderID`);

--
-- Indexes for table `group_grades`
--
ALTER TABLE `group_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_grades_groupid_foreign` (`GroupID`),
  ADD KEY `group_grades_gradeid_foreign` (`GradeID`);

--
-- Indexes for table `group_organizations`
--
ALTER TABLE `group_organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_organizations_groupid_foreign` (`GroupID`),
  ADD KEY `group_organizations_organizationid_foreign` (`OrganizationID`);

--
-- Indexes for table `is_watches`
--
ALTER TABLE `is_watches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `licenses_organizationid_foreign` (`OrganizationID`),
  ADD KEY `licenses_licensetypeid_foreign` (`LicenseTypeID`);

--
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ninty_fives`
--
ALTER TABLE `ninty_fives`
  ADD KEY `ninty_fives_assessmentid_foreign` (`AssessmentID`),
  ADD KEY `ninty_fives_gradeid_foreign` (`GradeID`),
  ADD KEY `ninty_fives_genderid_foreign` (`GenderID`);

--
-- Indexes for table `ninty_fives_backup`
--
ALTER TABLE `ninty_fives_backup`
  ADD PRIMARY KEY (`AssessmentID`,`GradeID`,`GenderID`),
  ADD KEY `GradeID` (`GradeID`),
  ADD KEY `GenderID` (`GenderID`);

--
-- Indexes for table `ninty_fives_latest_backup`
--
ALTER TABLE `ninty_fives_latest_backup`
  ADD KEY `ninty_fives_assessmentid_foreign` (`AssessmentID`),
  ADD KEY `ninty_fives_gradeid_foreign` (`GradeID`),
  ADD KEY `ninty_fives_genderid_foreign` (`GenderID`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizations_organizationtypeid_foreign` (`OrganizationTypeID`),
  ADD KEY `organizations_s8s_id_foreign` (`S8S_ID`),
  ADD KEY `organizations_parentorganizationid_foreign` (`ParentOrganizationID`);

--
-- Indexes for table `organization_types`
--
ALTER TABLE `organization_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participants_s8s_id_foreign` (`S8S_ID`),
  ADD KEY `participants_genderid_foreign` (`GenderID`),
  ADD KEY `participants_gradeid_foreign` (`GradeID`),
  ADD KEY `participants_organizationid_foreign` (`OrganizationID`),
  ADD KEY `participants_facilitatorid_foreign` (`FacilitatorID`),
  ADD KEY `participants_classid_foreign` (`ClassID`),
  ADD KEY `participants_jerseycolorid_foreign` (`JerseyColorID`);

--
-- Indexes for table `participant_emails`
--
ALTER TABLE `participant_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_emails_participantid_foreign` (`ParticipantID`),
  ADD KEY `participant_emails_emailtypeid_foreign` (`EmailTypeID`);

--
-- Indexes for table `participant_types`
--
ALTER TABLE `participant_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_userid_foreign` (`UserID`),
  ADD KEY `user_roles_roleid_foreign` (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assessment_evaluates`
--
ALTER TABLE `assessment_evaluates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `assessment_results`
--
ALTER TABLE `assessment_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1252;

--
-- AUTO_INCREMENT for table `assessment_scorings`
--
ALTER TABLE `assessment_scorings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_types`
--
ALTER TABLE `assessment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `email_types`
--
ALTER TABLE `email_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `event_assessments`
--
ALTER TABLE `event_assessments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `event_catagories`
--
ALTER TABLE `event_catagories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_facilitators`
--
ALTER TABLE `event_facilitators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `event_organizations`
--
ALTER TABLE `event_organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `facilitators`
--
ALTER TABLE `facilitators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `facilitator_classes`
--
ALTER TABLE `facilitator_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `group_classes`
--
ALTER TABLE `group_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=823;

--
-- AUTO_INCREMENT for table `group_facilitators`
--
ALTER TABLE `group_facilitators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `group_genders`
--
ALTER TABLE `group_genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `group_grades`
--
ALTER TABLE `group_grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `group_organizations`
--
ALTER TABLE `group_organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `is_watches`
--
ALTER TABLE `is_watches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `license_types`
--
ALTER TABLE `license_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `organization_types`
--
ALTER TABLE `organization_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `participant_emails`
--
ALTER TABLE `participant_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `participant_types`
--
ALTER TABLE `participant_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_assessmenttypeid_foreign` FOREIGN KEY (`AssessmentTypeID`) REFERENCES `assessment_types` (`id`),
  ADD CONSTRAINT `assessments_colorid_foreign` FOREIGN KEY (`ColorID`) REFERENCES `colors` (`id`);

--
-- Constraints for table `assessment_evaluates`
--
ALTER TABLE `assessment_evaluates`
  ADD CONSTRAINT `assessment_evaluates_assessmentid_foreign` FOREIGN KEY (`AssessmentID`) REFERENCES `assessments` (`id`);

--
-- Constraints for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD CONSTRAINT `assessment_results_assessmentid_foreign` FOREIGN KEY (`AssessmentID`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `assessment_results_colorid_foreign` FOREIGN KEY (`ColorID`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `assessment_results_eventid_foreign` FOREIGN KEY (`EventID`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `assessment_results_genderid_foreign` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `assessment_results_gradeid_foreign` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`id`),
  ADD CONSTRAINT `assessment_results_participantid_foreign` FOREIGN KEY (`ParticipantID`) REFERENCES `participants` (`id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_colorid_foreign` FOREIGN KEY (`ColorID`) REFERENCES `colors` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_contacttypeid_foreign` FOREIGN KEY (`ContactTypeID`) REFERENCES `contact_types` (`id`),
  ADD CONSTRAINT `contacts_facilitatorid_foreign` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`id`),
  ADD CONSTRAINT `contacts_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_facilitator_id_foreign` FOREIGN KEY (`facilitator_id`) REFERENCES `facilitators` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_eventtypeid_foreign` FOREIGN KEY (`EventTypeID`) REFERENCES `event_types` (`id`),
  ADD CONSTRAINT `events_facilitycontactid_foreign` FOREIGN KEY (`FacilityContactID`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `events_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `events_s8s_id_foreign` FOREIGN KEY (`S8S_ID`) REFERENCES `users` (`id`);

--
-- Constraints for table `event_assessments`
--
ALTER TABLE `event_assessments`
  ADD CONSTRAINT `event_assessments_assessmentid_foreign` FOREIGN KEY (`AssessmentID`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `event_assessments_eventid_foreign` FOREIGN KEY (`EventID`) REFERENCES `events` (`id`);

--
-- Constraints for table `event_facilitators`
--
ALTER TABLE `event_facilitators`
  ADD CONSTRAINT `event_facilitators_eventid_foreign` FOREIGN KEY (`EventID`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `event_facilitators_facilitatorid_foreign` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`id`);

--
-- Constraints for table `event_organizations`
--
ALTER TABLE `event_organizations`
  ADD CONSTRAINT `event_organizations_eventid_foreign` FOREIGN KEY (`EventID`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `event_organizations_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `event_types`
--
ALTER TABLE `event_types`
  ADD CONSTRAINT `event_types_eventcatagoryid_foreign` FOREIGN KEY (`EventCatagoryID`) REFERENCES `event_catagories` (`id`);

--
-- Constraints for table `facilitators`
--
ALTER TABLE `facilitators`
  ADD CONSTRAINT `facilitators_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `facilitators_s8s_id_foreign` FOREIGN KEY (`S8S_ID`) REFERENCES `users` (`id`);

--
-- Constraints for table `facilitator_classes`
--
ALTER TABLE `facilitator_classes`
  ADD CONSTRAINT `facilitator_classes_classid_foreign` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `facilitator_classes_facilitatorid_foreign` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_colorid_foreign` FOREIGN KEY (`ColorID`) REFERENCES `colors` (`id`);

--
-- Constraints for table `group_classes`
--
ALTER TABLE `group_classes`
  ADD CONSTRAINT `group_classes_classid_foreign` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `group_classes_groupid_foreign` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_facilitators`
--
ALTER TABLE `group_facilitators`
  ADD CONSTRAINT `group_facilitators_facilitatorid_foreign` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`id`),
  ADD CONSTRAINT `group_facilitators_groupid_foreign` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_genders`
--
ALTER TABLE `group_genders`
  ADD CONSTRAINT `group_genders_genderid_foreign` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `group_genders_groupid_foreign` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_grades`
--
ALTER TABLE `group_grades`
  ADD CONSTRAINT `group_grades_gradeid_foreign` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`id`),
  ADD CONSTRAINT `group_grades_groupid_foreign` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_organizations`
--
ALTER TABLE `group_organizations`
  ADD CONSTRAINT `group_organizations_groupid_foreign` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_organizations_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `licenses_licensetypeid_foreign` FOREIGN KEY (`LicenseTypeID`) REFERENCES `license_types` (`id`),
  ADD CONSTRAINT `licenses_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `ninty_fives_latest_backup`
--
ALTER TABLE `ninty_fives_latest_backup`
  ADD CONSTRAINT `ninty_fives_assessmentid_foreign` FOREIGN KEY (`AssessmentID`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `ninty_fives_genderid_foreign` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `ninty_fives_gradeid_foreign` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`id`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_organizationtypeid_foreign` FOREIGN KEY (`OrganizationTypeID`) REFERENCES `organization_types` (`id`),
  ADD CONSTRAINT `organizations_parentorganizationid_foreign` FOREIGN KEY (`ParentOrganizationID`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `organizations_s8s_id_foreign` FOREIGN KEY (`S8S_ID`) REFERENCES `users` (`id`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_classid_foreign` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `participants_facilitatorid_foreign` FOREIGN KEY (`FacilitatorID`) REFERENCES `facilitators` (`id`),
  ADD CONSTRAINT `participants_genderid_foreign` FOREIGN KEY (`GenderID`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `participants_gradeid_foreign` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`id`),
  ADD CONSTRAINT `participants_jerseycolorid_foreign` FOREIGN KEY (`JerseyColorID`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `participants_organizationid_foreign` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `participants_s8s_id_foreign` FOREIGN KEY (`S8S_ID`) REFERENCES `users` (`id`);

--
-- Constraints for table `participant_emails`
--
ALTER TABLE `participant_emails`
  ADD CONSTRAINT `participant_emails_emailtypeid_foreign` FOREIGN KEY (`EmailTypeID`) REFERENCES `email_types` (`id`),
  ADD CONSTRAINT `participant_emails_participantid_foreign` FOREIGN KEY (`ParticipantID`) REFERENCES `participants` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_roleid_foreign` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_roles_userid_foreign` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
