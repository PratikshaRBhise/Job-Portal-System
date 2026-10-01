-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2026 at 09:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `applicationid` int(11) NOT NULL,
  `applied_date` datetime(6) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `status` enum('APPLIED','HIRED','REJECTED','SHORTLISTED') DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`applicationid`, `applied_date`, `resume`, `status`, `job_id`, `user_id`) VALUES
(52, '2026-03-27 15:07:51.000000', '1774604271342_Resume_DE_Charushri_Wakodkar.pdf', 'APPLIED', 52, 752),
(102, '2026-03-28 15:02:11.000000', '1774690331847_Pooja Final Resume.pdf.pdf', 'APPLIED', 52, 852),
(152, '2026-04-13 16:14:01.000000', '1776077041043_Shukur Final Resume (1).pdf', 'APPLIED', 52, 854),
(202, '2026-05-01 18:21:08.000000', '1777639868542_Pratiksha R Bhise Resume.pdf', 'APPLIED', 52, 1155);

-- --------------------------------------------------------

--
-- Table structure for table `application_seq`
--

CREATE TABLE `application_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application_seq`
--

INSERT INTO `application_seq` (`next_val`) VALUES
(301);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `comapany_email` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `comapany_email` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `comapany_email`, `company_name`, `created_at`, `location`, `company_email`) VALUES
(1, 'hr@tcs.com', 'TCS', '2026-03-15 01:09:02.000000', 'Pune', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_seq`
--

CREATE TABLE `company_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_seq`
--

INSERT INTO `company_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `created_at`, `description`, `location`, `salary`, `title`, `company_id`) VALUES
(52, NULL, 'Spring Boot Developer Required', 'Pune', '10 LPA', 'Java Developer', NULL),
(205, NULL, 'Requirement: AWS, Docker, CI/CD', 'Hyderabad', '9 LPA', 'DevOps Engineer', NULL),
(253, NULL, 'Angular, TypeScript, Bootstrap', 'Remote', '6.5 LPA', 'Angular Developer', NULL),
(254, NULL, 'Network Security, Ethical Hacking Basics', 'Bangalore', '7.5 LPA', 'Cyber Security Analyst', NULL),
(255, NULL, 'Manual & Automation Testing (Selenium, JUnit)', 'Pune', '3 LPA', 'Software Tester', NULL),
(256, NULL, 'React.js, Redux, JavaScript, Bootstrap', 'Satara', '10 LPA', 'React Developer', NULL),
(257, NULL, 'Java / Python Basic Knowledge', 'Mumbai', '4.5 LPA', 'Software Developer Intern', NULL),
(302, NULL, 'React.js, API Integeration', 'Remote', '7 LPA', 'React Developer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_seq`
--

CREATE TABLE `job_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_seq`
--

INSERT INTO `job_seq` (`next_val`) VALUES
(401);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'JOBSEEKER',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `role`, `created_at`) VALUES
(1, 'Pratiksha', 'test@gmail.com', '$2a$10$DW3HdV7UJCfRuhdX1P89Aeuxco44QTv6XLPxUZrVdYgfEUno1K8US', '9876543210', 'JOBSEEKER', '2026-03-14 12:01:24'),
(2, 'Pooja Somdev Survase', 'pooja@gmail.com', '$2a$10$TU./Vtlh4.YchgUthcSLWuVF0w/MPIiTWhXlgvkifvjqqBWrlO2/2', '7898676545', 'JOBSEEKER', '2026-03-20 11:29:41'),
(53, 'sanika', 'sanika@gmail.com', '$2a$10$Vcnh7kD8ue/vsMZffbiYWuYN/mIqnVczt/rcKXTgJhzX6zArqTeE2', '7898676547', 'JOBSEEKER', '2026-03-20 19:05:39'),
(102, 'shukur', 'shukur@gmail.com', '$2a$10$0jbbZsy9h6d3gxQDBjdutOtwlWa6BjQHcdnt18JPeXFcQ1x71hrfG', '5647465656', 'JOBSEEKER', '2026-03-25 11:21:51'),
(152, 'pratiksha', 'pratiksha34@gmail.com', '$2a$10$O6FDiITLLEd4WRWXWdEyPOssZp4ddbgNfuWXg0Tjp2vqWGpd1xp4G', '4434334545', 'JOBSEEKER', '2026-03-25 12:49:50'),
(252, 'vaishnavi', 'vaishu@gmail.com', '$2a$10$/wIUlHsAPJUbHjf3RikRROYk4LXvri/yGMbYTe20r.6smiVQeqK8O', '9876787678', 'JOBSEEKER', '2026-03-25 13:19:40'),
(302, 'Rutuja', 'rutuja12@gmail.com', '$2a$10$6gO./ZqMxp4MNCnm1wEYbO3hntqRfajjuimK9fncvO7OxGpbPZRk2', '4535353534', 'JOBSEEKER', '2026-03-26 07:49:26'),
(352, 'Pratiksha Bhise', 'pratiksha.bhise@gmail.com', '$2a$10$upU8/tMhdUNaWh07j1BTVOJf0IacKTg0rdNY/RAzb/vMFUH1inciq', '9876543210', 'JOBSEEKER', '2026-03-26 10:21:37'),
(402, 'Pratikshabc', 'pratikshabc@gmail.com', '$2a$10$T0S5g7DNsbd6am/RuwDap.Rqnx4AelKn4ouaswsfXEAJ9w.ERXr1m', '9876543210', 'JOBSEEKER', '2026-03-26 09:00:00'),
(703, 'pratiksha', 'pratiksha@gmail.com', '$2a$10$7yHo/aZIwpmsdfVXx1bQtOCH6Hxgc7iBzGwtbt3voJ7ytI5iItk/a', '9787879897', 'JOBSEEKER', '2026-03-26 20:19:55'),
(752, 'pratikshab', 'pratikshab@gmail.com', '$2a$10$W6.JbrX6zIyKfiVedCY/CeWSwt3nuwzvbW9Q2pZJIXOyxCqUy2k2y', '8789876578', 'JOBSEEKER', '2026-03-26 20:22:41'),
(804, 'pratikshabhise23', 'pratikshab23@gmail.com', '$2a$10$.DX7LygDk0C4v.Gxr8KU7uJLmtyWcjLJKb3AbTDC6/so0opYjTdua', '6746745678', 'RECRUITER', '2026-03-27 14:20:53'),
(852, 'pratiksha', 'pratikshab5@gmail.com', '$2a$10$EeGS3trhSSVHtFD0G.sikOw5hNVoGifnFdOTVF5F/2DfQ8mm6mJaa', '6756789786', 'JOBSEEKER', '2026-03-28 09:28:20'),
(854, 'sanika', 'sanika7@gmail.com', '$2a$10$da0UKFlHf7xCjbARVdNaZuvytfBgCHp4/rdbyfEyrvSdybSi86nwe', '6756789790', 'JOBSEEKER', '2026-03-28 09:38:26'),
(902, 'Shukur Yerole', 'shukur4@gmail.com', '$2a$10$ihj.oQUB8t7Co4f0vOcLC.E3K1kSoD2Mp7X0uV6KqI0Hyg9fUymsW', '5676567890', 'RECRUITER', '2026-04-13 11:00:49'),
(952, 'pratiksha Bhise', 'pratiksha4@gmail.com', '$2a$10$UO0vPiUIBNtK30Rwv9x07uFvZ6SeYnNwGq5YEcxRVtvjy39BgjZ3i', '7656453423', 'JOBSEEKER', '2026-04-13 12:10:02'),
(1052, 'shukur', 'shukur45@gmail.com', '$2a$10$g817rqSx1fYblNC5YFYgC.YUU1wTiuXQuwwmXDw6GxY4JJwL5nRLK', '7656453423', 'RECRUITER', '2026-04-14 19:46:01'),
(1102, 'Pratiksha Bhise', 'pratiksharb45@gmail.com', '$2a$10$R7R0RY1opTTsOXgVkWLr4eiAp//IAeV52OGYcItx2HbeZJK2Lpk1K', '4678567894', 'JOBSEEKER', '2026-05-01 10:16:54'),
(1104, 'prati', 'pratikshar45@gmail.com', '$2a$10$C5MEJxCpS91zGQjp3CqIC.7JCRGRGRKHS3DSq3FBGJNf9n/7aZueC', '4344567896', 'RECRUITER', '2026-05-01 10:18:19'),
(1152, 'pratiksha Bhise', 'pratikshar456@gmail.com', '$2a$10$XQjQW9xqPcqe2G8rNXpDLeM19CYVQ9xwmUKBIvCqjWzbFklsEv2Se', '5678456789', 'JOBSEEKER', '2026-05-01 10:30:50'),
(1153, 'pratiksha', 'pratikshar41@gmail.com', '$2a$10$pCmvAIAKe8r4..Mma0JqZeTBay7eRLVRdNfGa2UIYNVk2z1EIeo5a', '5678456789', 'RECRUITER', '2026-05-01 10:32:02'),
(1154, 'pratiksha', 'pratikshar4@gmail.com', '$2a$10$Kp4P/wdo39JkA5EKkpfjge45U60ZSOrBx5HiRjHlToEtchP9bkQde', '6784674567', 'JOBSEEKER', '2026-05-01 12:48:01'),
(1155, 'pratiksha', 'pratikshar49@gmail.com', '$2a$10$g2ZZWnm0ryoOazmeO8UD7ewfXbo9x/YWuIOO0SUgsqM.MO/GiMnEC', '5678906756', 'JOBSEEKER', '2026-05-01 12:50:23'),
(1156, 'pratiksha', 'pratikshar496@gmail.com', '$2a$10$r5qMDoTcsIA2/dV2WVLNguaUupD6uAgQqi/O0d11jeu.oua2aI6L2', '4567876789', 'JOBSEEKER', '2026-05-01 13:59:16'),
(1157, 'radha', 'radha496@gmail.com', '$2a$10$I8PSV90REjH9nU0YbxBemOyoIRq09O/R7qh1gcJxp/5EwF2lIr9CS', '3456765678', 'RECRUITER', '2026-05-01 14:00:12'),
(1158, 'Radha', 'radha4965@gmail.com', '$2a$10$uQc1BdxKShx.Lco4LyuhCu/UyaEailsG9FFeVuHvlPJiNsG4snu9W', '4567876567', 'JOBSEEKER', '2026-05-01 14:02:57'),
(1159, 'radhika', 'radha94965@gmail.com', '$2a$10$VhzJbjY85dhSbbo./X0mO.aWBh0C9uR4m5tIVUhGh3o/57VPapCwK', '45676787876', 'RECRUITER', '2026-05-01 14:03:57'),
(1160, 'radha1', 'radh965@gmail.com', '$2a$10$1xdjylb0SxohhNsRyp9eQeKXhVFoYJI51N8HM8YNr/2SUCWbsXO7m', '457878678', 'JOBSEEKER', '2026-05-01 14:05:02'),
(1161, 'radhika1', 'radh9@gmail.com', '$2a$10$50aDwHfBq2nVWbY9DMM.De.9nHN.n9X28KIhOJkiinLGMQbOVYh32', '6787876567', 'RECRUITER', '2026-05-01 14:05:57'),
(1162, 'radhika2', 'radh93@gmail.com', '$2a$10$/7g/j4c2g7aK43MYnXNTCuAU46k/OqyGxbtLiTgQNQ6.VkRWuLspy', '5678787867', 'JOBSEEKER', '2026-05-01 14:12:12'),
(1163, 'pratiksha', 'pratiksha932@gmail.com', '$2a$10$uxP8GcXaiubCcLxNUHj5WOKreXa6/4W.ZDqPFJS3Sw5fwwowMZcOC', '4567345678', 'RECRUITER', '2026-05-01 14:13:15'),
(1164, 'pratiksha', 'pratiksha9@gmail.com', '$2a$10$XufmWz7uFxuf5SA/g9YsGe5xqAJJJS64ucK2WbbxW1DtJAZGrUEmq', '5678767898', 'JOBSEEKER', '2026-05-01 14:17:04'),
(1165, 'pratiksha', 'pratiksha999@gmail.com', '$2a$10$wrx7chVJe0BeoJ8Hi9C/7.PCW9tDnDrjjfAJjM6GzWcvW5Rl46Vnq', '4567876787', 'RECRUITER', '2026-05-01 14:17:58'),
(1166, 'pratiksha', 'pratiksha992@gmail.com', '$2a$10$WK4sqWsshP/xlSkSD516SOxuc.FYwdxplXMQK1RkcGcZCmg2ATpA.', '7676545678', 'JOBSEEKER', '2026-05-01 14:53:05'),
(1167, 'pratiksha', 'pratiksha997@gmail.com', '$2a$10$bCDg0DcVuqXNBVqTPaceBOBU/vm7GXEP.rKsWeadN0DWN9cVqL3TW', '6787656789', 'JOBSEEKER', '2026-05-01 15:11:17'),
(1168, 'pratiksha', 'pratiksha9978@gmail.com', '$2a$10$BweqnfAvvHnZfAO9TMYTfOO8FB1peLwMPdGxZSwLF4euqTjolrf/G', '6765456789', 'JOBSEEKER', '2026-05-01 15:12:36'),
(1169, 'pratiksha', 'pratiksha99787@gmail.com', '$2a$10$bVwkkdftCMtKgUwzkaciLeI/Y.JQD5JN.j6lKgZGLCW.0wZk/20ea', '7876565345', 'JOBSEEKER', '2026-05-01 15:14:39'),
(1170, 'pratiksha', 'pratiksha993@gmail.com', '$2a$10$KnNygoozN0dz0/qlGIfYkOe9Ec.WVsGgGVHoRxHRAQojR2Gl7KJjW', '6765456789', 'RECRUITER', '2026-05-01 15:15:28'),
(1171, 'pratiksha', 'pratiksha973@gmail.com', '$2a$10$4mBIrI4nbPLngZQyqMrMbOS805TlEed9YOy9KohZanTKagvHBp6iS', '7656567878', 'JOBSEEKER', '2026-05-01 15:21:45'),
(1172, 'pratik', 'pratiksha977@gmail.com', '$2a$10$fsbWa77iKug0b1Eq/8nlAeMrHMRqrc7rBs4r08fkdPNew5MTISBs2', '6765678789', 'RECRUITER', '2026-05-01 15:22:34'),
(1173, 'pratiksha', 'pratiksha970@gmail.com', '$2a$10$ZMkmaAcbiF0HqzhHUxvBz.EQJqIcNMg.rJhPeu9U1x76QZWfwbdhG', '6578765456', 'JOBSEEKER', '2026-05-01 15:43:38'),
(1174, 'sanika', 'sanika90@gmail.com', '$2a$10$j4zkMYbDTxBe8K6.q/3SruHiIqP1bvu3mt2.ov.eIhwydx27sG/3a', '457867878', 'RECRUITER', '2026-05-01 15:44:32'),
(1175, 'sanika', 'sanika902@gmail.com', '$2a$10$FCXZ/FsXf5Oybjz6/jATPOLHOvd4VVtmXVBZofjANFPjOvMumA8ea', '5678789898', 'JOBSEEKER', '2026-05-01 15:49:00'),
(1176, 'pratiksha', 'pratiksha902@gmail.com', '$2a$10$.iaGecDrwLOhQgpAL8XPf./l3GAuARyzxi7U9WaNFWMNVVtS6iefi', '8789787878', 'JOBSEEKER', '2026-05-01 15:57:01'),
(1177, 'pratiksha', 'pratiksha906@gmail.com', '$2a$10$jMtSaUnAEvKcXtRDVwYqtOagu3Fr/67GLAZ9GPms9Q1RmzN5Eh.4i', '6787898767', 'JOBSEEKER', '2026-05-01 15:57:49'),
(1178, 'pratiksha', 'pratiksha9088@gmail.com', '$2a$10$/Z5Xy1EfXV9t4pHikSL0t.QhDdwbeVvfokefESnISdYGyFsDazAMy', '6765456789', 'RECRUITER', '2026-05-01 15:58:42'),
(1186, 'pratiksha', 'pratiksha90@gmail.com', '$2a$10$bvNAVSwwcuYNPJflOoJD3exZW3oJyGeSng3yaM9pHzE6Wdgnvg2A6', '6756787898', 'JOBSEEKER', '2026-05-01 16:03:06'),
(1188, 'pratiksha', 'pratiksha989@gmail.com', '$2a$10$HPYeWD8uFbIMVvh2ujOYQ.HbARUsucAFggWbSDivMoOMDARd1y9Nu', '6787678989', 'JOBSEEKER', '2026-05-01 16:05:45'),
(1189, 'pratiksha', 'pratiksha89@gmail.com', '$2a$10$Nnq1GIjsYJab/c5vjQeA5.xNdtHs6mqnTlHcQG6f1U7cnSYFqFxiy', '7867654567', 'RECRUITER', '2026-05-01 16:06:35'),
(1202, 'Pratiksha Bhise', 'pratiksha896@gmail.com', '$2a$10$2zpux.sZubuu8P/HMrnRw.8ZlnnAV1nzbSrqq1rLtVj7XnimzE9V2', '5678786756', 'JOBSEEKER', '2026-05-02 12:27:09'),
(1203, 'Pratiksha', 'pratiksha856@gmail.com', '$2a$10$VMqaorCVb3C0/WzJEgRjuOJKDSihq9cXz4cS2Om4SI6zt5ZVeNpOK', '5678676545', 'RECRUITER', '2026-05-02 12:28:05'),
(1204, 'Pratiksha Bhise', 'pratiksha858@gmail.com', '$2a$10$X4AVjttF0p4uQSeTnmIlXOzDaBG57VGokckwy4V5evQGCJ3KmwVPO', '6787656789', 'JOBSEEKER', '2026-05-02 12:34:44'),
(1205, 'pratiksha bhise', 'pratiksha8888@gmail.com', '$2a$10$OLNTeT7k7t9aNdGVYoP01.uhSmbdpzrLTiflYTMZ9/6RK5qvBvvPu', '5678767898', 'JOBSEEKER', '2026-05-02 12:37:20'),
(1206, 'pratiksha', 'pratiksha7@gmail.com', '$2a$10$4fuEWWat1OFKBeWuTv12puvP7vmENIjrpwnUu8lqAlvivuhoH4BJm', '6767898989', 'RECRUITER', '2026-05-02 12:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `users_seq`
--

CREATE TABLE `users_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_seq`
--

INSERT INTO `users_seq` (`next_val`) VALUES
(1301);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`applicationid`),
  ADD KEY `FKls6sryk64ga8o5t4bym8qu3vm` (`job_id`),
  ADD KEY `FKawte0mbtubellxed1dvpoxhdj` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `FK5q04favsasq8y70bsei7wv8fc` (`company_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1207;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `FKawte0mbtubellxed1dvpoxhdj` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKls6sryk64ga8o5t4bym8qu3vm` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK5q04favsasq8y70bsei7wv8fc` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
