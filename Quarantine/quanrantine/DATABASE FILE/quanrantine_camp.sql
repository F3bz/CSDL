-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2023 lúc 06:10 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanrantine_camp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admits`
--

CREATE TABLE `admits` (
  `Location_History` varchar(255) NOT NULL,
  `Patient_ID` int(255) NOT NULL,
  `Room_ID` int(255) NOT NULL,
  `Staff_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admits`
--

INSERT INTO `admits` (`Location_History`, `Patient_ID`, `Room_ID`, `Staff_ID`) VALUES
('normal room', 1, 1, 1),
('normal room', 2, 1, 2),
('normal room', 3, 1, 3),
('normal room', 4, 1, 4),
('normal room', 5, 1, 5),
('normal room', 6, 1, 1),
('emergency room', 7, 2, 2),
('emergency room', 8, 2, 3),
('emergency room', 9, 2, 4),
('emergency room', 10, 2, 5),
('emergency room', 11, 2, 1),
('recuperation room', 12, 3, 1),
('recuperation room', 13, 3, 2),
('recuperation room', 14, 3, 3),
('recuperation room', 15, 4, 4),
('recuperation room', 16, 4, 5),
('recuperation room', 17, 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `building`
--

CREATE TABLE `building` (
  `Building_ID` int(255) NOT NULL,
  `Building_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `building`
--

INSERT INTO `building` (`Building_ID`, `Building_Name`) VALUES
(1, 'Tòa Nhà 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comorbidity`
--

CREATE TABLE `comorbidity` (
  `Comorbidity_ID` int(255) NOT NULL,
  `Comorbidity_Type` varchar(255) NOT NULL,
  `Patient_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comorbidity`
--

INSERT INTO `comorbidity` (`Comorbidity_ID`, `Comorbidity_Type`, `Patient_ID`) VALUES
(1, 'Hypertension', 1),
(2, 'Diabetes', 2),
(3, 'Asthma', 3),
(4, 'Heart Disease', 4),
(5, 'Obesity', 5),
(6, 'Chronic Kidney Disease', 6),
(7, 'Cancer', 7),
(8, 'Stroke', 8),
(9, 'Liver Disease', 9),
(10, 'Rheumatoid Arthritis', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` int(255) NOT NULL,
  `Quarantine_camp_Staff_ID` int(255) NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`, `Quarantine_camp_Staff_ID`, `position`) VALUES
(1, 11, 'General Practitioner'),
(2, 12, 'Cardiologist'),
(3, 13, 'Pediatrician'),
(4, 14, 'Orthopedic Surgeon'),
(5, 15, 'Psychiatrist');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `floor`
--

CREATE TABLE `floor` (
  `Floor_ID` int(255) NOT NULL,
  `Floor_Number` int(11) NOT NULL,
  `Building_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `floor`
--

INSERT INTO `floor` (`Floor_ID`, `Floor_Number`, `Building_ID`) VALUES
(1, 101, 1),
(2, 201, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `his_admin`
--

CREATE TABLE `his_admin` (
  `ad_id` int(20) NOT NULL,
  `ad_fname` varchar(200) DEFAULT NULL,
  `ad_lname` varchar(200) DEFAULT NULL,
  `ad_email` varchar(200) DEFAULT NULL,
  `ad_pwd` varchar(200) DEFAULT NULL,
  `ad_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `his_admin`
--

INSERT INTO `his_admin` (`ad_id`, `ad_fname`, `ad_lname`, `ad_email`, `ad_pwd`, `ad_dpic`) VALUES
(1, 'System', 'Administrator', 'admin@mail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'doc-icon.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medication`
--

CREATE TABLE `medication` (
  `Medication_ID` varchar(255) NOT NULL,
  `Effects` varchar(255) NOT NULL,
  `Medication_Name` varchar(255) NOT NULL,
  `Medication_Code` varchar(255) NOT NULL,
  `Price` int(255) NOT NULL,
  `Patient_ID` int(255) NOT NULL,
  `Test_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `medication`
--

INSERT INTO `medication` (`Medication_ID`, `Effects`, `Medication_Name`, `Medication_Code`, `Price`, `Patient_ID`, `Test_ID`) VALUES
('101', 'Pain relief', 'Ibuprofen', 'IBU001', 6, 1, 301),
('102', 'Antibiotic', 'Amoxicillin', 'AMOX002', 8, 2, 302),
('103', 'Antidepressant', 'Prozac', 'PRO003', 13, 3, 303),
('104', 'Anti-inflammatory', 'Naproxen', 'NAP004', 7, 4, 304),
('105', 'Antihistamine', 'Loratadine', 'LOR005', 4, 5, 305),
('106', 'Anti-anxiety', 'Xanax', 'XAN006', 15, 6, 306),
('107', 'Blood pressure control', 'Lisinopril', 'LIS007', 10, 7, 307),
('108', 'Antibiotic', 'Ciprofloxacin', 'CIP008', 8, 8, 308),
('109', 'Pain relief', 'Acetaminophen', 'ACE009', 5, 9, 309),
('110', 'Antacid', 'Tums', 'TUM010', 3, 10, 310),
('111', 'Antifungal', 'Fluconazole', 'FLU011', 12, 11, 311),
('112', 'Antiviral', 'Tamiflu', 'TAM012', 23, 12, 312),
('113', 'Antidepressant', 'Zoloft', 'ZOL013', 14, 13, 313),
('114', 'Allergy relief', 'Claritin', 'CLA014', 6, 14, 314),
('115', 'Pain relief', 'Aspirin', 'ASP015', 4, 15, 315),
('116', 'Antihistamine', 'Benadryl', 'BEN016', 5, 16, 316),
('117', 'Antacid', 'Pepto-Bismol', 'PEP017', 6, 17, 317);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nurse`
--

CREATE TABLE `nurse` (
  `Nurse_ID` int(255) NOT NULL,
  `Quarantine_camp_Staff_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nurse`
--

INSERT INTO `nurse` (`Nurse_ID`, `Quarantine_camp_Staff_ID`) VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(255) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Identity_Number` int(255) NOT NULL,
  `Current_Condition` varchar(255) NOT NULL,
  `Nurse_ID` int(255) NOT NULL,
  `Staff_ID` int(255) NOT NULL,
  `Room_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `patient`
--

INSERT INTO `patient` (`Patient_ID`, `Gender`, `Address`, `Full_Name`, `Phone`, `Identity_Number`, `Current_Condition`, `Nurse_ID`, `Staff_ID`, `Room_ID`) VALUES
(1, 'Male', '123 đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Trương Tấn Tài', '+84707819081', 3308560, 'Healthy', 1, 1, 1),
(2, 'Male', '2 ngõ 148, đường Nguyễn Chánh, phường Yên Hòa, quận Cầu Giấy, Hà Nội', 'Dương Minh Sơn', '+84811353919', 8743164, 'Healthy', 2, 2, 2),
(3, 'Male', 'Số 17, ngách 8/32, ngõ 19, tổ 16, đường Hồ Tùng Mậu, phường Mại Dich, quận Cầu Giấy, Hà Nội', 'Phạm Cao Minh Quân', '+84933312385', 3790143, 'Healthy', 3, 3, 3),
(4, 'Male', '123/3 đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Lê Quốc Thắng', '+84232500197', 2721225, 'Healthy', 4, 4, 4),
(5, 'Male', '123/5B đường Lê Lợi, phường 6, thành phố Tuy Hòa, tỉnh Phú Yên', 'Nguyễn Giang Kiết Tường', '+84362563862', 2235697, 'Healthy', 5, 5, 1),
(6, 'Male', '7A/34 Tô Hiến Thành, phường 13, quận 10, Thành phố Hồ Chí Minh', 'Dương Ngọc Nguyên', '+84115318752', 3014812, 'Healthy', 1, 1, 2),
(7, 'Male', '123/3E đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Hồ Đăng Hoàng', '+84488902202', 8366967, 'Healthy', 2, 2, 3),
(8, 'Male', '123/3/5B đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Trần Tuấn Kiệt', '+8498554786', 2790399, 'Healthy', 3, 3, 4),
(9, 'Male', '123 đường số 4 cư xá Bình Thới, phường 8, quận 11, Thành phố Hồ Chí Minh', 'Mai Đức Kiên', '+8426067355', 8851098, 'Healthy', 4, 4, 1),
(10, 'Male', '116/3 đường Nguyễn Chánh, phường Yên Hòa, quận Cầu Giấy, Hà Nội', 'Hoàng Ngọc Đại Phước', '+84834672449', 5884293, 'Healthy', 5, 5, 2),
(11, 'Female', '123/3 đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Huỳnh Ngọc Mẫn', '+8495160213', 2868172, 'Healthy', 1, 1, 3),
(12, 'Male', '123/5B đường Lê Lợi, phường 6, thành phố Tuy Hòa, tỉnh Phú Yên', 'Trương Quang Hùng', '+84971783747', 6687980, 'Healthy', 2, 2, 4),
(13, 'Male', '7A/34 Tô Hiến Thành, phường 13, quận 10, Thành phố Hồ Chí Minh', 'Lê Đức Nam', '+84573438129', 4835386, 'Healthy', 3, 3, 1),
(14, 'Female', '123/3E đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Nguyễn Quỳnh Anh', '+84951839436', 4112990, 'Healthy', 4, 4, 2),
(15, 'Male', '123/3/5B đường Lê Lợi, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'Nguyễn Hoàng Long', '+8438882824', 6058795, 'Healthy', 5, 5, 3),
(16, 'Male', '123 đường số 4 cư xá Bình Thới, phường 8, quận 11, Thành phố Hồ Chí Minh', 'Vũ Đình Thịnh', '+84338895843', 7955003, 'Healthy', 1, 1, 4),
(17, 'Male', '116/3 đường Nguyễn Chánh, phường Yên Hòa, quận Cầu Giấy, Hà Nội', 'Nguyễn Minh Nhựt', '+84577830775', 1598631, 'Healthy', 2, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quarantine_camp_staff`
--

CREATE TABLE `quarantine_camp_staff` (
  `Quarantine_camp_Staff_ID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Identity_Number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quarantine_camp_staff`
--

INSERT INTO `quarantine_camp_staff` (`Quarantine_camp_Staff_ID`, `Name`, `Gender`, `Phone`, `Identity_Number`) VALUES
(1, 'Nguyễn Thị Như Quỳnh', 'Female', '+84505873060', 9497678),
(2, 'Lê Hoàng Quân', 'Male', '+84411051430', 5273910),
(3, 'Đinh Văn Phượng', 'Female', '+84537638000', 7876519),
(4, 'Nguyễn Xuân Sang', 'Male', '+84455035743', 3560866),
(5, 'Lý Quốc Quyền', 'Male', '+84662264747', 4174772),
(6, 'Trần Thị Minh Sương', 'Female', '+84946216535', 191265),
(7, 'Nguyễn Ngọc Thân', 'Male', '+84744288467', 8432009),
(8, 'Nguyễn Vũ Ngọc Quyên', 'Female', '+84882792761', 1586253),
(9, 'Nguyễn Ngọc Phương', 'Female', '+84181098435', 2635236),
(10, 'Nguyễn Minh Phương', 'Female', '+84257113922', 8417423),
(11, 'Võ Thanh Sanh', 'Male', '+84742274338', 4181407),
(12, 'Phan Đức Sơn', 'Female', '+84940029953', 5654765),
(13, 'Đoàn Thanh Tân', 'Male', '+84473326784', 5729608),
(14, 'Vũ Minh Thái', 'Male', '+84546544090', 1683744),
(15, 'Đặng Xuân Thanh', 'Female', '+84312740130', 1229896),
(16, 'Nguyễn Chí Thanh', 'Female', '+84924068412', 1098250),
(17, 'Diệp Vương Thắng', 'Male', '+84682121702', 1801564),
(18, 'Nguyễn Tiến Thành', 'Male', '+84638403303', 5713069),
(19, 'Bùi Trung Thành', 'Female', '+84145651442', 3160654),
(20, 'Lương Văn Thao', 'Female', '+84813047330', 8664066);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

CREATE TABLE `room` (
  `Room_ID` int(255) NOT NULL,
  `Normal_room` varchar(255) NOT NULL,
  `Emergency_room` varchar(255) NOT NULL,
  `Recuperation_room` varchar(255) NOT NULL,
  `Floor_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room`
--

INSERT INTO `room` (`Room_ID`, `Normal_room`, `Emergency_room`, `Recuperation_room`, `Floor_ID`) VALUES
(1, '1', '0', '0', 1),
(2, '0', '1', '0', 1),
(3, '0', '0', '1', 2),
(4, '0', '0', '1', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` int(255) NOT NULL,
  `Quarantine_camp_Staff_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Quarantine_camp_Staff_ID`) VALUES
(1, 16),
(2, 17),
(3, 18),
(4, 19),
(5, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `symtomp`
--

CREATE TABLE `symtomp` (
  `Symtomp_ID` int(255) NOT NULL,
  `Symtomp_Type` varchar(255) NOT NULL,
  `Patient_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `symtomp`
--

INSERT INTO `symtomp` (`Symtomp_ID`, `Symtomp_Type`, `Patient_ID`) VALUES
(1, 'Fever', 1),
(2, 'Cough', 2),
(3, 'Headache', 3),
(4, 'Fatigue', 4),
(5, 'Sore throat', 5),
(6, 'Nausea', 6),
(7, 'Vomiting', 7),
(8, 'Diarrhea', 8),
(9, 'Muscle pain', 9),
(10, 'Shortness of breath', 10),
(11, 'Chest pain', 11),
(12, 'Loss of taste or smell', 12),
(13, 'Chills', 13),
(14, 'Body aches', 14),
(15, 'Runny nose', 15),
(16, 'Sneezing', 16),
(17, 'Watery eyes', 17),
(18, 'Cancer', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `Test_ID` int(255) NOT NULL,
  `Test_Result` varchar(255) NOT NULL,
  `Test_Type` varchar(255) NOT NULL,
  `Test_Date` date NOT NULL,
  `Cycle_Threshold` varchar(255) DEFAULT NULL,
  `Patient_ID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `test`
--

INSERT INTO `test` (`Test_ID`, `Test_Result`, `Test_Type`, `Test_Date`, `Cycle_Threshold`, `Patient_ID`) VALUES
(301, 'Positive', 'COVID', '2023-10-01', '24', 1),
(302, 'Negative', 'Blood Sugar', '2023-09-28', '', 2),
(303, 'Positive', 'COVID', '2023-10-05', '30', 3),
(304, 'Negative', 'Cholesterol', '2023-09-30', '', 4),
(305, 'Positive', 'COVID', '2023-10-02', '28', 5),
(306, 'Negative', 'Blood Sugar', '2023-09-29', '', 6),
(307, 'Positive', 'COVID', '2023-10-03', '25', 7),
(308, 'Negative', 'Cholesterol', '2023-09-26', '', 8),
(309, 'Positive', 'COVID', '2023-10-04', '32', 9),
(310, 'Negative', 'Blood Sugar', '2023-09-27', '', 10),
(311, 'Positive', 'COVID', '2023-10-06', '29', 11),
(312, 'Negative', 'Cholesterol', '2023-09-25', '', 12),
(313, 'Positive', 'COVID', '2023-10-07', '35', 13),
(314, 'Negative', 'Blood Sugar', '2023-09-24', '', 14),
(315, 'Positive', 'COVID', '2023-10-08', '26', 15),
(316, 'Negative', 'Cholesterol', '2023-09-23', '', 16),
(317, 'Positive', 'COVID', '2023-10-09', '27', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `volunteer`
--

CREATE TABLE `volunteer` (
  `Volunteer_ID` int(255) NOT NULL,
  `Quarantine_camp_Staff_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `volunteer`
--

INSERT INTO `volunteer` (`Volunteer_ID`, `Quarantine_camp_Staff_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admits`
--
ALTER TABLE `admits`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Room_ID` (`Room_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Chỉ mục cho bảng `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`Building_ID`);

--
-- Chỉ mục cho bảng `comorbidity`
--
ALTER TABLE `comorbidity`
  ADD PRIMARY KEY (`Comorbidity_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Chỉ mục cho bảng `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `Quarantine_camp_Staff_ID` (`Quarantine_camp_Staff_ID`);

--
-- Chỉ mục cho bảng `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`Floor_ID`),
  ADD KEY `Building_ID` (`Building_ID`);

--
-- Chỉ mục cho bảng `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`Medication_ID`),
  ADD KEY `Test_ID` (`Test_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Chỉ mục cho bảng `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`Nurse_ID`),
  ADD KEY `Quarantine_camp_Staff_ID` (`Quarantine_camp_Staff_ID`);

--
-- Chỉ mục cho bảng `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Room_ID` (`Room_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `Nurse_ID` (`Nurse_ID`);

--
-- Chỉ mục cho bảng `quarantine_camp_staff`
--
ALTER TABLE `quarantine_camp_staff`
  ADD PRIMARY KEY (`Quarantine_camp_Staff_ID`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `Floor_ID` (`Floor_ID`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `Quarantine_camp_Staff_ID` (`Quarantine_camp_Staff_ID`);

--
-- Chỉ mục cho bảng `symtomp`
--
ALTER TABLE `symtomp`
  ADD PRIMARY KEY (`Symtomp_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Chỉ mục cho bảng `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Chỉ mục cho bảng `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`Volunteer_ID`),
  ADD KEY `Quarantine_camp_Staff_ID` (`Quarantine_camp_Staff_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `building`
--
ALTER TABLE `building`
  MODIFY `Building_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `comorbidity`
--
ALTER TABLE `comorbidity`
  MODIFY `Comorbidity_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doctor_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `floor`
--
ALTER TABLE `floor`
  MODIFY `Floor_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nurse`
--
ALTER TABLE `nurse`
  MODIFY `Nurse_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `patient`
--
ALTER TABLE `patient`
  MODIFY `Patient_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `quarantine_camp_staff`
--
ALTER TABLE `quarantine_camp_staff`
  MODIFY `Quarantine_camp_Staff_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `Room_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `symtomp`
--
ALTER TABLE `symtomp`
  MODIFY `Symtomp_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `test`
--
ALTER TABLE `test`
  MODIFY `Test_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT cho bảng `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `Volunteer_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admits`
--
ALTER TABLE `admits`
  ADD CONSTRAINT `admits_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `admits_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`Room_ID`),
  ADD CONSTRAINT `admits_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Các ràng buộc cho bảng `comorbidity`
--
ALTER TABLE `comorbidity`
  ADD CONSTRAINT `comorbidity_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Các ràng buộc cho bảng `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Quarantine_camp_Staff_ID`) REFERENCES `quarantine_camp_staff` (`Quarantine_camp_Staff_ID`);

--
-- Các ràng buộc cho bảng `floor`
--
ALTER TABLE `floor`
  ADD CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`Building_ID`) REFERENCES `building` (`Building_ID`);

--
-- Các ràng buộc cho bảng `medication`
--
ALTER TABLE `medication`
  ADD CONSTRAINT `medication_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `medication_ibfk_2` FOREIGN KEY (`Test_ID`) REFERENCES `test` (`Test_ID`);

--
-- Các ràng buộc cho bảng `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`Quarantine_camp_Staff_ID`) REFERENCES `quarantine_camp_staff` (`Quarantine_camp_Staff_ID`);

--
-- Các ràng buộc cho bảng `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`Room_ID`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurse` (`Nurse_ID`);

--
-- Các ràng buộc cho bảng `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Floor_ID`) REFERENCES `floor` (`Floor_ID`);

--
-- Các ràng buộc cho bảng `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Quarantine_camp_Staff_ID`) REFERENCES `quarantine_camp_staff` (`Quarantine_camp_Staff_ID`);

--
-- Các ràng buộc cho bảng `symtomp`
--
ALTER TABLE `symtomp`
  ADD CONSTRAINT `symtomp_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Các ràng buộc cho bảng `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);

--
-- Các ràng buộc cho bảng `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`Quarantine_camp_Staff_ID`) REFERENCES `quarantine_camp_staff` (`Quarantine_camp_Staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
